from machine import FPIOA,PWM
import time
fp=FPIOA()

fp.set_function(43,FPIOA.PWM1)
pwm=PWM(1,freq=2000,duty=60)
pwm.freq(2000)
#pwm.duty_u16(32768)
time.sleep_ms(500)
pwm.deinit()
