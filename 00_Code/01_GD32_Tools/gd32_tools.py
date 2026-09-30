import argparse
import serial 
import os
import sys

cmd_array={"SYNC":b"\x7F","ERASE":b"\x44\xBB","WRITE":b"\x31\xCE","READ":b"\x11\xEE","GET":b"\x00\xFF"}
ack_array={"ACK":b"\x79"}
start_addr=0x08000000
end_addr  =0x08400000
sector_mem_size =0x4*1024
sector_num_max=1024
write_bytes_max=252

def get_data_size(data:bytes)->int:
	return len(data)

def read_file(file:str)->bytes:
	with open(file,"rb") as f:
		data=f.read()
	f.close()
	return data

def get_sector_num(data_size:int,sector_size:int,sector_max:int)->int:
	i=int(data_size/sector_size)
	j=data_size%sector_size
	num=i+(j>0)
	if num>sector_max:
		print("Sectors overflow")
		return 0
	return num

def get_sector_of_addr(addr:int,start:int,end:int,sector_size:int,sector_max:int)->int:
	if(addr>end):
		print("Addr overflow")
		return sector_max
	if(addr<start):
		print("Addr underflow")
		return 0
	for i in range(0,sector_max):
		if(addr<(sector_size*i+start)):
			break
	return i-1

def sync_with_device(serial:serial.Serial,cmd:dict,ack:dict)->bool:
	serial.write(cmd.get("SYNC"))
	resp=serial.read()
	if resp!=ack.get("ACK"):
		print("SYNC Cmd failed")
		return False
	return True

def get_buf_xor(buf:bytes,size:int)->bytes:
	res=0
	for i in range(0,size):
		res=res^buf[i]
	return res&0xFF

def erase_device_sectors(serial:serial.Serial,start:int,end:int,cmd:dict,ack:dict)->bool:
	serial.write(cmd.get("ERASE"))
	resp=serial.read()
	if resp!=ack.get("ACK"):
		print("ERASE Cmd failed")
		return False
	size=end-start+1
	buf=bytearray(2*size+3)
	# according to potocal, send size = real size -1
	buf[0]=((size-1)>>8)&0xFF
	buf[1]=(size-1)&0xFF
	for i in range(0,size):
		buf[i*2+2]=((start+i)>>8)&0xFF
		buf[i*2+3]=(start+i)&0xFF
	buf[2*size+2]=get_buf_xor(buf,2*size+2)
	serial.write(buf)
	resp=serial.read()
	if resp!=ack.get("ACK"):
		print("ERASE Operation failed")
		return False
	return True

def write_device_flash(serial:serial.Serial,start:int,bin:bytes,size:int,cmd:dict,ack:dict,write_max:int)->bool:
	print("Writing"+hex(start))
	if size>write_max:
		print("WRITE BYTES overflow")
		return False
	if size%4!=0:
		print("WRITE SIZE not a multiple of 4")
		return False
	if size == 0:
		print("WRITE SIZE Can not be zero")
		return False
	serial.write(cmd.get("WRITE"))
	resp=serial.read()
	if resp!=ack.get("ACK"):
		print("WRITE Cmd failed")
		return False	
	buf=bytearray(5)
	for i in range(0,4):
		buf[i]=(start>>(8*(3-i)))&0xFF
	buf[4]=get_buf_xor(buf,4)
	serial.write(buf)
	resp=serial.read()
	if resp!=ack.get("ACK"):
		print("WRITE Operation 1 failed")
		return False
	buf=bytearray(size+2)
	buf[0]=size-1
	for i in range(0,int(size/4)):
		for j in range(0,4):
			buf[i*4+j+1]=bin[i*4+j]
	buf[size+1]=get_buf_xor(buf,size+1)
	serial.write(buf)
	resp=serial.read()
	if resp!=ack.get("ACK"):
		print("WRITE Operation 2 failed")
		return False
	return True

def flash_device_with_bin(serial:serial.Serial,start:int,s_bin:bytes,cmd:dict,ack:dict,write_max:int,begin:int,end:int,sector_size:int,sector_max:int)->bool:
	size=len(s_bin)
	asize=((4-(size&0x3))&0x3)+size
	print(asize)
	# erase sector
	start_sector=get_sector_of_addr(start,begin,end,sector_size,sector_max)
	end_sector=start_sector+get_sector_num(asize,sector_size,sector_max)-1
	print(start_sector)
	print(end_sector)
	erase_device_sectors(gd,start_sector,end_sector,cmd,ack)
	# flashing
	loop=int(asize/write_max)
	left=asize%write_max
	
	sbuf=bytearray(asize)
	for i in range(0,size):
		sbuf[i]=s_bin[i]
	for i in range(size,asize):
		sbuf[i]=0
	for i in range(0,loop):
		f_begin=i*write_max
		buf=bytearray(write_max)
		for j in range(0,int(write_max/4)):
			for k in range(0,4):
				buf[j*4+k]=sbuf[f_begin+j*4+k]
		res=write_device_flash(serial,f_begin+start,buf,write_max,cmd,ack,write_max)
		if res != True:
			return False
	if left==0:
		return True
	buf=bytearray(left)
	f_begin = loop*write_max
	for i in range(0,int(left/4)):
		for j in range(0,4):
			buf[i*4+j]=sbuf[f_begin+i*4+j]
	res=write_device_flash(serial,f_begin+start,buf,left,cmd,ack,write_max)
	return res

parser=argparse.ArgumentParser(
	description="GD32 Flashing Tools",
	prog="GD32"
)
parser.add_argument(
	"--port",
	"-p",
	help="Serial port device",
	default="/dev/tty.usbserial-110"
)

parser.add_argument(
	"--baud",
	"-b",
	help="Serial baudrate",
	default=57600,
)

parser.add_argument(
	"--parity",
	"-pa",
	help="Serial parity",
	default=serial.PARITY_EVEN,
)

parser.add_argument(
	"--timeout",
	"-t",
	help="Serial timeout",
	default=1,
)

sub_parser=parser.add_subparsers(
	title="command",
	dest="command",
	help="flash, erase, dump",
	)

flash_parser=sub_parser.add_parser("flash")
erase_parser=sub_parser.add_parser("erase")
dump_parser=sub_parser.add_parser("dump")

flash_parser.add_argument(
	"--input",
	"-i",
	help="Input file for flashing",
	default="target.bin"
)
flash_parser.add_argument(
	"--start",
	"-s",
	help="Start of addr",
	default=start_addr
)

flash_parser.add_argument(
	"--end",
	"-e",
	help="End of addr",
	default=end_addr
)
erase_parser.add_argument(
	"--start",
	"-s",
	help="Start of addr",
	default=start_addr
)

erase_parser.add_argument(
	"--end",
	"-e",
	help="End of addr",
	default=end_addr
)

dump_parser.add_argument(
	"--output",
	"-o",
	help="Output file for hex dump",
	default="dump.bin"
)

dump_parser.add_argument(
	"--start",
	"-s",
	help="Start of addr",
	default=start_addr
)

dump_parser.add_argument(
	"--end",
	"-e",
	help="End of addr",
	default=end_addr
)

args=parser.parse_args()

gd = serial.Serial(
	port=args.port,
	baudrate=args.baud,
	parity=args.parity,
	bytesize=serial.EIGHTBITS,
	stopbits=serial.STOPBITS_ONE, 
	timeout=args.timeout,
	)
if not gd.is_open:
	print("Serial open failed")
	gd.close()
	sys.exit(-1)

if args.command == "flash":
	data=read_file(args.input)
	sync_with_device(gd,cmd_array,ack_array)
	res=flash_device_with_bin(gd,args.start,data,cmd_array,
					   ack_array,write_bytes_max,start_addr,
					   end_addr,sector_mem_size,sector_num_max)
	print(res)
else:
	print(args.command)
	print(int.to_bytes(100,1,'big'))
gd.close()