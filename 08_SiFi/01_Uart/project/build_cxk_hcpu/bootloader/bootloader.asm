
build_cxk_hcpu/bootloader/bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

20020208 <deregister_tm_clones>:
20020208:	4803      	ldr	r0, [pc, #12]	@ (20020218 <deregister_tm_clones+0x10>)
2002020a:	4b04      	ldr	r3, [pc, #16]	@ (2002021c <deregister_tm_clones+0x14>)
2002020c:	4283      	cmp	r3, r0
2002020e:	d002      	beq.n	20020216 <deregister_tm_clones+0xe>
20020210:	4b03      	ldr	r3, [pc, #12]	@ (20020220 <deregister_tm_clones+0x18>)
20020212:	b103      	cbz	r3, 20020216 <deregister_tm_clones+0xe>
20020214:	4718      	bx	r3
20020216:	4770      	bx	lr
20020218:	200449b4 	.word	0x200449b4
2002021c:	200449b4 	.word	0x200449b4
20020220:	00000000 	.word	0x00000000

20020224 <register_tm_clones>:
20020224:	4b06      	ldr	r3, [pc, #24]	@ (20020240 <register_tm_clones+0x1c>)
20020226:	4907      	ldr	r1, [pc, #28]	@ (20020244 <register_tm_clones+0x20>)
20020228:	1ac9      	subs	r1, r1, r3
2002022a:	1089      	asrs	r1, r1, #2
2002022c:	bf48      	it	mi
2002022e:	3101      	addmi	r1, #1
20020230:	1049      	asrs	r1, r1, #1
20020232:	d003      	beq.n	2002023c <register_tm_clones+0x18>
20020234:	4b04      	ldr	r3, [pc, #16]	@ (20020248 <register_tm_clones+0x24>)
20020236:	b10b      	cbz	r3, 2002023c <register_tm_clones+0x18>
20020238:	4801      	ldr	r0, [pc, #4]	@ (20020240 <register_tm_clones+0x1c>)
2002023a:	4718      	bx	r3
2002023c:	4770      	bx	lr
2002023e:	bf00      	nop
20020240:	200449b4 	.word	0x200449b4
20020244:	200449b4 	.word	0x200449b4
20020248:	00000000 	.word	0x00000000

2002024c <__do_global_dtors_aux>:
2002024c:	b510      	push	{r4, lr}
2002024e:	4c06      	ldr	r4, [pc, #24]	@ (20020268 <__do_global_dtors_aux+0x1c>)
20020250:	7823      	ldrb	r3, [r4, #0]
20020252:	b943      	cbnz	r3, 20020266 <__do_global_dtors_aux+0x1a>
20020254:	f7ff ffd8 	bl	20020208 <deregister_tm_clones>
20020258:	4b04      	ldr	r3, [pc, #16]	@ (2002026c <__do_global_dtors_aux+0x20>)
2002025a:	b113      	cbz	r3, 20020262 <__do_global_dtors_aux+0x16>
2002025c:	4804      	ldr	r0, [pc, #16]	@ (20020270 <__do_global_dtors_aux+0x24>)
2002025e:	f3af 8000 	nop.w
20020262:	2301      	movs	r3, #1
20020264:	7023      	strb	r3, [r4, #0]
20020266:	bd10      	pop	{r4, pc}
20020268:	200449b4 	.word	0x200449b4
2002026c:	00000000 	.word	0x00000000
20020270:	2002c294 	.word	0x2002c294

20020274 <frame_dummy>:
20020274:	b508      	push	{r3, lr}
20020276:	4b05      	ldr	r3, [pc, #20]	@ (2002028c <frame_dummy+0x18>)
20020278:	b11b      	cbz	r3, 20020282 <frame_dummy+0xe>
2002027a:	4905      	ldr	r1, [pc, #20]	@ (20020290 <frame_dummy+0x1c>)
2002027c:	4805      	ldr	r0, [pc, #20]	@ (20020294 <frame_dummy+0x20>)
2002027e:	f3af 8000 	nop.w
20020282:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20020286:	f7ff bfcd 	b.w	20020224 <register_tm_clones>
2002028a:	bf00      	nop
2002028c:	00000000 	.word	0x00000000
20020290:	200449b8 	.word	0x200449b8
20020294:	2002c294 	.word	0x2002c294

20020298 <boot_uart_tx>:
20020298:	2300      	movs	r3, #0
2002029a:	b510      	push	{r4, lr}
2002029c:	4293      	cmp	r3, r2
2002029e:	db00      	blt.n	200202a2 <boot_uart_tx+0xa>
200202a0:	bd10      	pop	{r4, pc}
200202a2:	69c4      	ldr	r4, [r0, #28]
200202a4:	0624      	lsls	r4, r4, #24
200202a6:	d5fc      	bpl.n	200202a2 <boot_uart_tx+0xa>
200202a8:	5ccc      	ldrb	r4, [r1, r3]
200202aa:	3301      	adds	r3, #1
200202ac:	6284      	str	r4, [r0, #40]	@ 0x28
200202ae:	e7f5      	b.n	2002029c <boot_uart_tx+0x4>

200202b0 <boot_error>:
200202b0:	b507      	push	{r0, r1, r2, lr}
200202b2:	2201      	movs	r2, #1
200202b4:	f88d 0007 	strb.w	r0, [sp, #7]
200202b8:	f10d 0107 	add.w	r1, sp, #7
200202bc:	480e      	ldr	r0, [pc, #56]	@ (200202f8 <boot_error+0x48>)
200202be:	f7ff ffeb 	bl	20020298 <boot_uart_tx>
200202c2:	4b0e      	ldr	r3, [pc, #56]	@ (200202fc <boot_error+0x4c>)
200202c4:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
200202c8:	f002 0203 	and.w	r2, r2, #3
200202cc:	2a03      	cmp	r2, #3
200202ce:	f102 0101 	add.w	r1, r2, #1
200202d2:	d00f      	beq.n	200202f4 <boot_error+0x44>
200202d4:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
200202d8:	f022 0203 	bic.w	r2, r2, #3
200202dc:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
200202e0:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
200202e4:	430a      	orrs	r2, r1
200202e6:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
200202ea:	f00c f80b 	bl	2002c304 <HAL_PMU_Reboot>
200202ee:	b003      	add	sp, #12
200202f0:	f85d fb04 	ldr.w	pc, [sp], #4
200202f4:	e7fe      	b.n	200202f4 <boot_error+0x44>
200202f6:	bf00      	nop
200202f8:	50084000 	.word	0x50084000
200202fc:	500ca000 	.word	0x500ca000

20020300 <HAL_MspInit>:
20020300:	2234      	movs	r2, #52	@ 0x34
20020302:	4b01      	ldr	r3, [pc, #4]	@ (20020308 <HAL_MspInit+0x8>)
20020304:	60da      	str	r2, [r3, #12]
20020306:	4770      	bx	lr
20020308:	50094000 	.word	0x50094000

2002030c <mpu_config>:
2002030c:	4770      	bx	lr

2002030e <cache_enable>:
2002030e:	4770      	bx	lr

20020310 <board_pinmux_mpi1_puya_base>:
20020310:	b510      	push	{r4, lr}
20020312:	2301      	movs	r3, #1
20020314:	2200      	movs	r2, #0
20020316:	2103      	movs	r1, #3
20020318:	2002      	movs	r0, #2
2002031a:	f004 fb17 	bl	2002494c <HAL_PIN_Set>
2002031e:	2301      	movs	r3, #1
20020320:	2200      	movs	r2, #0
20020322:	4619      	mov	r1, r3
20020324:	200a      	movs	r0, #10
20020326:	f004 fb11 	bl	2002494c <HAL_PIN_Set>
2002032a:	2301      	movs	r3, #1
2002032c:	2210      	movs	r2, #16
2002032e:	2109      	movs	r1, #9
20020330:	2008      	movs	r0, #8
20020332:	f004 fb0b 	bl	2002494c <HAL_PIN_Set>
20020336:	2301      	movs	r3, #1
20020338:	2210      	movs	r2, #16
2002033a:	210a      	movs	r1, #10
2002033c:	2003      	movs	r0, #3
2002033e:	f004 fb05 	bl	2002494c <HAL_PIN_Set>
20020342:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020346:	2301      	movs	r3, #1
20020348:	2200      	movs	r2, #0
2002034a:	210c      	movs	r1, #12
2002034c:	200b      	movs	r0, #11
2002034e:	f004 bafd 	b.w	2002494c <HAL_PIN_Set>

20020352 <board_pinmux_mpi1_puya_ext>:
20020352:	b510      	push	{r4, lr}
20020354:	4604      	mov	r4, r0
20020356:	2101      	movs	r1, #1
20020358:	2005      	movs	r0, #5
2002035a:	f004 fc9f 	bl	20024c9c <HAL_PIN_Set_Analog>
2002035e:	2101      	movs	r1, #1
20020360:	2006      	movs	r0, #6
20020362:	f004 fc9b 	bl	20024c9c <HAL_PIN_Set_Analog>
20020366:	2101      	movs	r1, #1
20020368:	2007      	movs	r0, #7
2002036a:	f004 fc97 	bl	20024c9c <HAL_PIN_Set_Analog>
2002036e:	2101      	movs	r1, #1
20020370:	2009      	movs	r0, #9
20020372:	f004 fc93 	bl	20024c9c <HAL_PIN_Set_Analog>
20020376:	2101      	movs	r1, #1
20020378:	200c      	movs	r0, #12
2002037a:	f004 fc8f 	bl	20024c9c <HAL_PIN_Set_Analog>
2002037e:	2101      	movs	r1, #1
20020380:	200d      	movs	r0, #13
20020382:	f004 fc8b 	bl	20024c9c <HAL_PIN_Set_Analog>
20020386:	2101      	movs	r1, #1
20020388:	b154      	cbz	r4, 200203a0 <board_pinmux_mpi1_puya_ext+0x4e>
2002038a:	4608      	mov	r0, r1
2002038c:	f004 fc86 	bl	20024c9c <HAL_PIN_Set_Analog>
20020390:	2301      	movs	r3, #1
20020392:	2230      	movs	r2, #48	@ 0x30
20020394:	210b      	movs	r1, #11
20020396:	2004      	movs	r0, #4
20020398:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002039c:	f004 bad6 	b.w	2002494c <HAL_PIN_Set>
200203a0:	2004      	movs	r0, #4
200203a2:	f004 fc7b 	bl	20024c9c <HAL_PIN_Set_Analog>
200203a6:	2301      	movs	r3, #1
200203a8:	2230      	movs	r2, #48	@ 0x30
200203aa:	210b      	movs	r1, #11
200203ac:	4618      	mov	r0, r3
200203ae:	e7f3      	b.n	20020398 <board_pinmux_mpi1_puya_ext+0x46>

200203b0 <board_pinmux_mpi1_gd>:
200203b0:	b508      	push	{r3, lr}
200203b2:	2200      	movs	r2, #0
200203b4:	2301      	movs	r3, #1
200203b6:	2103      	movs	r1, #3
200203b8:	2005      	movs	r0, #5
200203ba:	f004 fac7 	bl	2002494c <HAL_PIN_Set>
200203be:	2301      	movs	r3, #1
200203c0:	2200      	movs	r2, #0
200203c2:	4619      	mov	r1, r3
200203c4:	200a      	movs	r0, #10
200203c6:	f004 fac1 	bl	2002494c <HAL_PIN_Set>
200203ca:	2301      	movs	r3, #1
200203cc:	2210      	movs	r2, #16
200203ce:	2109      	movs	r1, #9
200203d0:	200c      	movs	r0, #12
200203d2:	f004 fabb 	bl	2002494c <HAL_PIN_Set>
200203d6:	2301      	movs	r3, #1
200203d8:	2210      	movs	r2, #16
200203da:	210a      	movs	r1, #10
200203dc:	2003      	movs	r0, #3
200203de:	f004 fab5 	bl	2002494c <HAL_PIN_Set>
200203e2:	2301      	movs	r3, #1
200203e4:	2230      	movs	r2, #48	@ 0x30
200203e6:	210b      	movs	r1, #11
200203e8:	4618      	mov	r0, r3
200203ea:	f004 faaf 	bl	2002494c <HAL_PIN_Set>
200203ee:	2301      	movs	r3, #1
200203f0:	2230      	movs	r2, #48	@ 0x30
200203f2:	210c      	movs	r1, #12
200203f4:	2009      	movs	r0, #9
200203f6:	f004 faa9 	bl	2002494c <HAL_PIN_Set>
200203fa:	2101      	movs	r1, #1
200203fc:	2002      	movs	r0, #2
200203fe:	f004 fc4d 	bl	20024c9c <HAL_PIN_Set_Analog>
20020402:	2101      	movs	r1, #1
20020404:	2004      	movs	r0, #4
20020406:	f004 fc49 	bl	20024c9c <HAL_PIN_Set_Analog>
2002040a:	2101      	movs	r1, #1
2002040c:	2006      	movs	r0, #6
2002040e:	f004 fc45 	bl	20024c9c <HAL_PIN_Set_Analog>
20020412:	2101      	movs	r1, #1
20020414:	2007      	movs	r0, #7
20020416:	f004 fc41 	bl	20024c9c <HAL_PIN_Set_Analog>
2002041a:	2101      	movs	r1, #1
2002041c:	2008      	movs	r0, #8
2002041e:	f004 fc3d 	bl	20024c9c <HAL_PIN_Set_Analog>
20020422:	2101      	movs	r1, #1
20020424:	200b      	movs	r0, #11
20020426:	f004 fc39 	bl	20024c9c <HAL_PIN_Set_Analog>
2002042a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
2002042e:	2101      	movs	r1, #1
20020430:	200d      	movs	r0, #13
20020432:	f004 bc33 	b.w	20024c9c <HAL_PIN_Set_Analog>

20020436 <board_pinmux_mpi2>:
20020436:	b510      	push	{r4, lr}
20020438:	2301      	movs	r3, #1
2002043a:	2200      	movs	r2, #0
2002043c:	2119      	movs	r1, #25
2002043e:	201e      	movs	r0, #30
20020440:	f004 fa84 	bl	2002494c <HAL_PIN_Set>
20020444:	2301      	movs	r3, #1
20020446:	2200      	movs	r2, #0
20020448:	211b      	movs	r1, #27
2002044a:	201a      	movs	r0, #26
2002044c:	f004 fa7e 	bl	2002494c <HAL_PIN_Set>
20020450:	2301      	movs	r3, #1
20020452:	2210      	movs	r2, #16
20020454:	2121      	movs	r1, #33	@ 0x21
20020456:	201d      	movs	r0, #29
20020458:	f004 fa78 	bl	2002494c <HAL_PIN_Set>
2002045c:	2301      	movs	r3, #1
2002045e:	2210      	movs	r2, #16
20020460:	2122      	movs	r1, #34	@ 0x22
20020462:	201b      	movs	r0, #27
20020464:	f004 fa72 	bl	2002494c <HAL_PIN_Set>
20020468:	2301      	movs	r3, #1
2002046a:	2230      	movs	r2, #48	@ 0x30
2002046c:	2123      	movs	r1, #35	@ 0x23
2002046e:	201c      	movs	r0, #28
20020470:	f004 fa6c 	bl	2002494c <HAL_PIN_Set>
20020474:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020478:	2301      	movs	r3, #1
2002047a:	2230      	movs	r2, #48	@ 0x30
2002047c:	2124      	movs	r1, #36	@ 0x24
2002047e:	201f      	movs	r0, #31
20020480:	f004 ba64 	b.w	2002494c <HAL_PIN_Set>

20020484 <board_pinmux_sd>:
20020484:	b510      	push	{r4, lr}
20020486:	2301      	movs	r3, #1
20020488:	2230      	movs	r2, #48	@ 0x30
2002048a:	f44f 71da 	mov.w	r1, #436	@ 0x1b4
2002048e:	201d      	movs	r0, #29
20020490:	f004 fa5c 	bl	2002494c <HAL_PIN_Set>
20020494:	2014      	movs	r0, #20
20020496:	f001 fd4a 	bl	20021f2e <HAL_Delay_us>
2002049a:	2301      	movs	r3, #1
2002049c:	2200      	movs	r2, #0
2002049e:	f44f 71d9 	mov.w	r1, #434	@ 0x1b2
200204a2:	201c      	movs	r0, #28
200204a4:	f004 fa52 	bl	2002494c <HAL_PIN_Set>
200204a8:	2301      	movs	r3, #1
200204aa:	2230      	movs	r2, #48	@ 0x30
200204ac:	f240 11b5 	movw	r1, #437	@ 0x1b5
200204b0:	201e      	movs	r0, #30
200204b2:	f004 fa4b 	bl	2002494c <HAL_PIN_Set>
200204b6:	2301      	movs	r3, #1
200204b8:	2230      	movs	r2, #48	@ 0x30
200204ba:	f44f 71db 	mov.w	r1, #438	@ 0x1b6
200204be:	201f      	movs	r0, #31
200204c0:	f004 fa44 	bl	2002494c <HAL_PIN_Set>
200204c4:	2301      	movs	r3, #1
200204c6:	2230      	movs	r2, #48	@ 0x30
200204c8:	f240 11b7 	movw	r1, #439	@ 0x1b7
200204cc:	201a      	movs	r0, #26
200204ce:	f004 fa3d 	bl	2002494c <HAL_PIN_Set>
200204d2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
200204d6:	2301      	movs	r3, #1
200204d8:	2230      	movs	r2, #48	@ 0x30
200204da:	f44f 71dc 	mov.w	r1, #440	@ 0x1b8
200204de:	201b      	movs	r0, #27
200204e0:	f004 ba34 	b.w	2002494c <HAL_PIN_Set>

200204e4 <board_boot_from>:
200204e4:	b510      	push	{r4, lr}
200204e6:	4b0d      	ldr	r3, [pc, #52]	@ (2002051c <board_boot_from+0x38>)
200204e8:	685b      	ldr	r3, [r3, #4]
200204ea:	f3c3 2302 	ubfx	r3, r3, #8, #3
200204ee:	2b07      	cmp	r3, #7
200204f0:	d10c      	bne.n	2002050c <board_boot_from+0x28>
200204f2:	2400      	movs	r4, #0
200204f4:	3401      	adds	r4, #1
200204f6:	2101      	movs	r1, #1
200204f8:	4620      	mov	r0, r4
200204fa:	f004 fbcf 	bl	20024c9c <HAL_PIN_Set_Analog>
200204fe:	2c0d      	cmp	r4, #13
20020500:	d1f8      	bne.n	200204f4 <board_boot_from+0x10>
20020502:	2000      	movs	r0, #0
20020504:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020508:	f00b becc 	b.w	2002c2a4 <HAL_Get_backup>
2002050c:	b11b      	cbz	r3, 20020516 <board_boot_from+0x32>
2002050e:	2b01      	cmp	r3, #1
20020510:	d1f7      	bne.n	20020502 <board_boot_from+0x1e>
20020512:	2002      	movs	r0, #2
20020514:	bd10      	pop	{r4, pc}
20020516:	2001      	movs	r0, #1
20020518:	e7fc      	b.n	20020514 <board_boot_from+0x30>
2002051a:	bf00      	nop
2002051c:	5000b000 	.word	0x5000b000

20020520 <board_flash_power_on>:
20020520:	4770      	bx	lr

20020522 <board_pinmux_psram_func0>:
20020522:	b508      	push	{r3, lr}
20020524:	2210      	movs	r2, #16
20020526:	2301      	movs	r3, #1
20020528:	2109      	movs	r1, #9
2002052a:	2002      	movs	r0, #2
2002052c:	f004 fa0e 	bl	2002494c <HAL_PIN_Set>
20020530:	2301      	movs	r3, #1
20020532:	2210      	movs	r2, #16
20020534:	210a      	movs	r1, #10
20020536:	2003      	movs	r0, #3
20020538:	f004 fa08 	bl	2002494c <HAL_PIN_Set>
2002053c:	2301      	movs	r3, #1
2002053e:	2210      	movs	r2, #16
20020540:	210b      	movs	r1, #11
20020542:	2004      	movs	r0, #4
20020544:	f004 fa02 	bl	2002494c <HAL_PIN_Set>
20020548:	2301      	movs	r3, #1
2002054a:	2210      	movs	r2, #16
2002054c:	210c      	movs	r1, #12
2002054e:	2005      	movs	r0, #5
20020550:	f004 f9fc 	bl	2002494c <HAL_PIN_Set>
20020554:	2301      	movs	r3, #1
20020556:	2210      	movs	r2, #16
20020558:	210d      	movs	r1, #13
2002055a:	2006      	movs	r0, #6
2002055c:	f004 f9f6 	bl	2002494c <HAL_PIN_Set>
20020560:	2301      	movs	r3, #1
20020562:	2210      	movs	r2, #16
20020564:	210e      	movs	r1, #14
20020566:	2007      	movs	r0, #7
20020568:	f004 f9f0 	bl	2002494c <HAL_PIN_Set>
2002056c:	2301      	movs	r3, #1
2002056e:	2210      	movs	r2, #16
20020570:	210f      	movs	r1, #15
20020572:	2008      	movs	r0, #8
20020574:	f004 f9ea 	bl	2002494c <HAL_PIN_Set>
20020578:	2210      	movs	r2, #16
2002057a:	2301      	movs	r3, #1
2002057c:	4611      	mov	r1, r2
2002057e:	2009      	movs	r0, #9
20020580:	f004 f9e4 	bl	2002494c <HAL_PIN_Set>
20020584:	2301      	movs	r3, #1
20020586:	2210      	movs	r2, #16
20020588:	2106      	movs	r1, #6
2002058a:	200a      	movs	r0, #10
2002058c:	f004 f9de 	bl	2002494c <HAL_PIN_Set>
20020590:	2301      	movs	r3, #1
20020592:	2200      	movs	r2, #0
20020594:	4619      	mov	r1, r3
20020596:	200b      	movs	r0, #11
20020598:	f004 f9d8 	bl	2002494c <HAL_PIN_Set>
2002059c:	2301      	movs	r3, #1
2002059e:	2200      	movs	r2, #0
200205a0:	2103      	movs	r1, #3
200205a2:	200c      	movs	r0, #12
200205a4:	f004 f9d2 	bl	2002494c <HAL_PIN_Set>
200205a8:	2101      	movs	r1, #1
200205aa:	4608      	mov	r0, r1
200205ac:	f004 fb76 	bl	20024c9c <HAL_PIN_Set_Analog>
200205b0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
200205b4:	2101      	movs	r1, #1
200205b6:	200d      	movs	r0, #13
200205b8:	f004 bb70 	b.w	20024c9c <HAL_PIN_Set_Analog>

200205bc <board_pinmux_psram_func1_2_4>:
200205bc:	b510      	push	{r4, lr}
200205be:	2301      	movs	r3, #1
200205c0:	4604      	mov	r4, r0
200205c2:	2210      	movs	r2, #16
200205c4:	2109      	movs	r1, #9
200205c6:	2002      	movs	r0, #2
200205c8:	f004 f9c0 	bl	2002494c <HAL_PIN_Set>
200205cc:	2301      	movs	r3, #1
200205ce:	2210      	movs	r2, #16
200205d0:	210a      	movs	r1, #10
200205d2:	2003      	movs	r0, #3
200205d4:	f004 f9ba 	bl	2002494c <HAL_PIN_Set>
200205d8:	2301      	movs	r3, #1
200205da:	2210      	movs	r2, #16
200205dc:	210b      	movs	r1, #11
200205de:	2004      	movs	r0, #4
200205e0:	f004 f9b4 	bl	2002494c <HAL_PIN_Set>
200205e4:	2301      	movs	r3, #1
200205e6:	2210      	movs	r2, #16
200205e8:	210c      	movs	r1, #12
200205ea:	2005      	movs	r0, #5
200205ec:	f004 f9ae 	bl	2002494c <HAL_PIN_Set>
200205f0:	2301      	movs	r3, #1
200205f2:	2210      	movs	r2, #16
200205f4:	210d      	movs	r1, #13
200205f6:	2009      	movs	r0, #9
200205f8:	f004 f9a8 	bl	2002494c <HAL_PIN_Set>
200205fc:	2301      	movs	r3, #1
200205fe:	2210      	movs	r2, #16
20020600:	210e      	movs	r1, #14
20020602:	200a      	movs	r0, #10
20020604:	f004 f9a2 	bl	2002494c <HAL_PIN_Set>
20020608:	2301      	movs	r3, #1
2002060a:	2210      	movs	r2, #16
2002060c:	210f      	movs	r1, #15
2002060e:	200b      	movs	r0, #11
20020610:	f004 f99c 	bl	2002494c <HAL_PIN_Set>
20020614:	2210      	movs	r2, #16
20020616:	2301      	movs	r3, #1
20020618:	4611      	mov	r1, r2
2002061a:	200c      	movs	r0, #12
2002061c:	f004 f996 	bl	2002494c <HAL_PIN_Set>
20020620:	2301      	movs	r3, #1
20020622:	2200      	movs	r2, #0
20020624:	4619      	mov	r1, r3
20020626:	2008      	movs	r0, #8
20020628:	f004 f990 	bl	2002494c <HAL_PIN_Set>
2002062c:	2301      	movs	r3, #1
2002062e:	2200      	movs	r2, #0
20020630:	2103      	movs	r1, #3
20020632:	2006      	movs	r0, #6
20020634:	f004 f98a 	bl	2002494c <HAL_PIN_Set>
20020638:	2c02      	cmp	r4, #2
2002063a:	d013      	beq.n	20020664 <board_pinmux_psram_func1_2_4+0xa8>
2002063c:	2c04      	cmp	r4, #4
2002063e:	d025      	beq.n	2002068c <board_pinmux_psram_func1_2_4+0xd0>
20020640:	2c01      	cmp	r4, #1
20020642:	d12c      	bne.n	2002069e <board_pinmux_psram_func1_2_4+0xe2>
20020644:	2106      	movs	r1, #6
20020646:	4623      	mov	r3, r4
20020648:	2210      	movs	r2, #16
2002064a:	200d      	movs	r0, #13
2002064c:	f004 f97e 	bl	2002494c <HAL_PIN_Set>
20020650:	4621      	mov	r1, r4
20020652:	4620      	mov	r0, r4
20020654:	f004 fb22 	bl	20024c9c <HAL_PIN_Set_Analog>
20020658:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002065c:	2101      	movs	r1, #1
2002065e:	2007      	movs	r0, #7
20020660:	f004 bb1c 	b.w	20024c9c <HAL_PIN_Set_Analog>
20020664:	2301      	movs	r3, #1
20020666:	2210      	movs	r2, #16
20020668:	2104      	movs	r1, #4
2002066a:	4618      	mov	r0, r3
2002066c:	f004 f96e 	bl	2002494c <HAL_PIN_Set>
20020670:	2301      	movs	r3, #1
20020672:	2210      	movs	r2, #16
20020674:	2105      	movs	r1, #5
20020676:	200d      	movs	r0, #13
20020678:	f004 f968 	bl	2002494c <HAL_PIN_Set>
2002067c:	4621      	mov	r1, r4
2002067e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020682:	2301      	movs	r3, #1
20020684:	2200      	movs	r2, #0
20020686:	2007      	movs	r0, #7
20020688:	f004 b960 	b.w	2002494c <HAL_PIN_Set>
2002068c:	2106      	movs	r1, #6
2002068e:	2301      	movs	r3, #1
20020690:	2200      	movs	r2, #0
20020692:	200d      	movs	r0, #13
20020694:	f004 f95a 	bl	2002494c <HAL_PIN_Set>
20020698:	2101      	movs	r1, #1
2002069a:	4608      	mov	r0, r1
2002069c:	e7da      	b.n	20020654 <board_pinmux_psram_func1_2_4+0x98>
2002069e:	bd10      	pop	{r4, pc}

200206a0 <board_pinmux_psram_func3>:
200206a0:	b508      	push	{r3, lr}
200206a2:	2301      	movs	r3, #1
200206a4:	2200      	movs	r2, #0
200206a6:	4619      	mov	r1, r3
200206a8:	200a      	movs	r0, #10
200206aa:	f004 f94f 	bl	2002494c <HAL_PIN_Set>
200206ae:	2301      	movs	r3, #1
200206b0:	2200      	movs	r2, #0
200206b2:	2103      	movs	r1, #3
200206b4:	2009      	movs	r0, #9
200206b6:	f004 f949 	bl	2002494c <HAL_PIN_Set>
200206ba:	2301      	movs	r3, #1
200206bc:	2210      	movs	r2, #16
200206be:	2109      	movs	r1, #9
200206c0:	2006      	movs	r0, #6
200206c2:	f004 f943 	bl	2002494c <HAL_PIN_Set>
200206c6:	2301      	movs	r3, #1
200206c8:	2210      	movs	r2, #16
200206ca:	210a      	movs	r1, #10
200206cc:	2008      	movs	r0, #8
200206ce:	f004 f93d 	bl	2002494c <HAL_PIN_Set>
200206d2:	2301      	movs	r3, #1
200206d4:	2230      	movs	r2, #48	@ 0x30
200206d6:	210b      	movs	r1, #11
200206d8:	2007      	movs	r0, #7
200206da:	f004 f937 	bl	2002494c <HAL_PIN_Set>
200206de:	2301      	movs	r3, #1
200206e0:	2230      	movs	r2, #48	@ 0x30
200206e2:	210c      	movs	r1, #12
200206e4:	200b      	movs	r0, #11
200206e6:	f004 f931 	bl	2002494c <HAL_PIN_Set>
200206ea:	2101      	movs	r1, #1
200206ec:	4608      	mov	r0, r1
200206ee:	f004 fad5 	bl	20024c9c <HAL_PIN_Set_Analog>
200206f2:	2101      	movs	r1, #1
200206f4:	2002      	movs	r0, #2
200206f6:	f004 fad1 	bl	20024c9c <HAL_PIN_Set_Analog>
200206fa:	2101      	movs	r1, #1
200206fc:	2003      	movs	r0, #3
200206fe:	f004 facd 	bl	20024c9c <HAL_PIN_Set_Analog>
20020702:	2101      	movs	r1, #1
20020704:	2004      	movs	r0, #4
20020706:	f004 fac9 	bl	20024c9c <HAL_PIN_Set_Analog>
2002070a:	2101      	movs	r1, #1
2002070c:	2005      	movs	r0, #5
2002070e:	f004 fac5 	bl	20024c9c <HAL_PIN_Set_Analog>
20020712:	2101      	movs	r1, #1
20020714:	200c      	movs	r0, #12
20020716:	f004 fac1 	bl	20024c9c <HAL_PIN_Set_Analog>
2002071a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
2002071e:	2101      	movs	r1, #1
20020720:	200d      	movs	r0, #13
20020722:	f004 babb 	b.w	20024c9c <HAL_PIN_Set_Analog>

20020726 <bootloader_switch_clock>:
20020726:	2102      	movs	r1, #2
20020728:	2004      	movs	r0, #4
2002072a:	f004 bbe9 	b.w	20024f00 <HAL_RCC_HCPU_ClockSelect>
	...

20020730 <boot_psram_init>:
20020730:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20020734:	2400      	movs	r4, #0
20020736:	b08a      	sub	sp, #40	@ 0x28
20020738:	4605      	mov	r5, r0
2002073a:	2230      	movs	r2, #48	@ 0x30
2002073c:	4621      	mov	r1, r4
2002073e:	4863      	ldr	r0, [pc, #396]	@ (200208cc <boot_psram_init+0x19c>)
20020740:	f00a f864 	bl	2002a80c <memset>
20020744:	4b62      	ldr	r3, [pc, #392]	@ (200208d0 <boot_psram_init+0x1a0>)
20020746:	1ea8      	subs	r0, r5, #2
20020748:	9305      	str	r3, [sp, #20]
2002074a:	f04f 5380 	mov.w	r3, #268435456	@ 0x10000000
2002074e:	9307      	str	r3, [sp, #28]
20020750:	2303      	movs	r3, #3
20020752:	9406      	str	r4, [sp, #24]
20020754:	9309      	str	r3, [sp, #36]	@ 0x24
20020756:	2804      	cmp	r0, #4
20020758:	d804      	bhi.n	20020764 <boot_psram_init+0x34>
2002075a:	e8df f000 	tbb	[pc, r0]
2002075e:	6264      	.short	0x6264
20020760:	5d04      	.short	0x5d04
20020762:	60          	.byte	0x60
20020763:	00          	.byte	0x00
20020764:	e7fe      	b.n	20020764 <boot_psram_init+0x34>
20020766:	2305      	movs	r3, #5
20020768:	9309      	str	r3, [sp, #36]	@ 0x24
2002076a:	2304      	movs	r3, #4
2002076c:	9d09      	ldr	r5, [sp, #36]	@ 0x24
2002076e:	9308      	str	r3, [sp, #32]
20020770:	2d03      	cmp	r5, #3
20020772:	d162      	bne.n	2002083a <boot_psram_init+0x10a>
20020774:	f009 fd90 	bl	2002a298 <BSP_GetFlash1DIV>
20020778:	a905      	add	r1, sp, #20
2002077a:	4602      	mov	r2, r0
2002077c:	4853      	ldr	r0, [pc, #332]	@ (200208cc <boot_psram_init+0x19c>)
2002077e:	f003 fe81 	bl	20024484 <HAL_OPI_PSRAM_Init>
20020782:	462a      	mov	r2, r5
20020784:	2108      	movs	r1, #8
20020786:	4851      	ldr	r0, [pc, #324]	@ (200208cc <boot_psram_init+0x19c>)
20020788:	f003 fd6e 	bl	20024268 <HAL_MPI_MR_WRITE>
2002078c:	484f      	ldr	r0, [pc, #316]	@ (200208cc <boot_psram_init+0x19c>)
2002078e:	f003 fa79 	bl	20023c84 <HAL_QSPI_GET_CLK>
20020792:	4b50      	ldr	r3, [pc, #320]	@ (200208d4 <boot_psram_init+0x1a4>)
20020794:	4298      	cmp	r0, r3
20020796:	d948      	bls.n	2002082a <boot_psram_init+0xfa>
20020798:	f103 63a4 	add.w	r3, r3, #85983232	@ 0x5200000
2002079c:	f503 4383 	add.w	r3, r3, #16768	@ 0x4180
200207a0:	4298      	cmp	r0, r3
200207a2:	d944      	bls.n	2002082e <boot_psram_init+0xfe>
200207a4:	f103 7337 	add.w	r3, r3, #47972352	@ 0x2dc0000
200207a8:	f503 43d8 	add.w	r3, r3, #27648	@ 0x6c00
200207ac:	4298      	cmp	r0, r3
200207ae:	d940      	bls.n	20020832 <boot_psram_init+0x102>
200207b0:	4b49      	ldr	r3, [pc, #292]	@ (200208d8 <boot_psram_init+0x1a8>)
200207b2:	4298      	cmp	r0, r3
200207b4:	d93f      	bls.n	20020836 <boot_psram_init+0x106>
200207b6:	4b49      	ldr	r3, [pc, #292]	@ (200208dc <boot_psram_init+0x1ac>)
200207b8:	4298      	cmp	r0, r3
200207ba:	bf98      	it	ls
200207bc:	2407      	movls	r4, #7
200207be:	2600      	movs	r6, #0
200207c0:	2507      	movs	r5, #7
200207c2:	f04f 0803 	mov.w	r8, #3
200207c6:	0067      	lsls	r7, r4, #1
200207c8:	b2ff      	uxtb	r7, r7
200207ca:	1e7a      	subs	r2, r7, #1
200207cc:	4633      	mov	r3, r6
200207ce:	b252      	sxtb	r2, r2
200207d0:	4629      	mov	r1, r5
200207d2:	483e      	ldr	r0, [pc, #248]	@ (200208cc <boot_psram_init+0x19c>)
200207d4:	e9cd 5502 	strd	r5, r5, [sp, #8]
200207d8:	e9cd 6800 	strd	r6, r8, [sp]
200207dc:	f002 f922 	bl	20022a24 <HAL_FLASH_CFG_AHB_RCMD>
200207e0:	4631      	mov	r1, r6
200207e2:	483a      	ldr	r0, [pc, #232]	@ (200208cc <boot_psram_init+0x19c>)
200207e4:	f002 f913 	bl	20022a0e <HAL_FLASH_SET_AHB_RCMD>
200207e8:	1e62      	subs	r2, r4, #1
200207ea:	4633      	mov	r3, r6
200207ec:	b252      	sxtb	r2, r2
200207ee:	4629      	mov	r1, r5
200207f0:	4836      	ldr	r0, [pc, #216]	@ (200208cc <boot_psram_init+0x19c>)
200207f2:	e9cd 5502 	strd	r5, r5, [sp, #8]
200207f6:	e9cd 6800 	strd	r6, r8, [sp]
200207fa:	f002 f93c 	bl	20022a76 <HAL_FLASH_CFG_AHB_WCMD>
200207fe:	2180      	movs	r1, #128	@ 0x80
20020800:	4832      	ldr	r0, [pc, #200]	@ (200208cc <boot_psram_init+0x19c>)
20020802:	f002 f92c 	bl	20022a5e <HAL_FLASH_SET_AHB_WCMD>
20020806:	4623      	mov	r3, r4
20020808:	463a      	mov	r2, r7
2002080a:	2101      	movs	r1, #1
2002080c:	482f      	ldr	r0, [pc, #188]	@ (200208cc <boot_psram_init+0x19c>)
2002080e:	f003 fd4f 	bl	200242b0 <HAL_MPI_SET_FIXLAT>
20020812:	b00a      	add	sp, #40	@ 0x28
20020814:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20020818:	2302      	movs	r3, #2
2002081a:	9309      	str	r3, [sp, #36]	@ 0x24
2002081c:	e7a6      	b.n	2002076c <boot_psram_init+0x3c>
2002081e:	2306      	movs	r3, #6
20020820:	9309      	str	r3, [sp, #36]	@ 0x24
20020822:	2308      	movs	r3, #8
20020824:	e7a2      	b.n	2002076c <boot_psram_init+0x3c>
20020826:	2310      	movs	r3, #16
20020828:	e7a0      	b.n	2002076c <boot_psram_init+0x3c>
2002082a:	462c      	mov	r4, r5
2002082c:	e7c7      	b.n	200207be <boot_psram_init+0x8e>
2002082e:	2404      	movs	r4, #4
20020830:	e7c5      	b.n	200207be <boot_psram_init+0x8e>
20020832:	2405      	movs	r4, #5
20020834:	e7c3      	b.n	200207be <boot_psram_init+0x8e>
20020836:	2406      	movs	r4, #6
20020838:	e7c1      	b.n	200207be <boot_psram_init+0x8e>
2002083a:	2d05      	cmp	r5, #5
2002083c:	d10d      	bne.n	2002085a <boot_psram_init+0x12a>
2002083e:	f009 fd2b 	bl	2002a298 <BSP_GetFlash1DIV>
20020842:	a905      	add	r1, sp, #20
20020844:	4602      	mov	r2, r0
20020846:	4821      	ldr	r0, [pc, #132]	@ (200208cc <boot_psram_init+0x19c>)
20020848:	f003 fe98 	bl	2002457c <HAL_LEGACY_PSRAM_Init>
2002084c:	481f      	ldr	r0, [pc, #124]	@ (200208cc <boot_psram_init+0x19c>)
2002084e:	f003 fda1 	bl	20024394 <HAL_LEGACY_CFG_READ>
20020852:	481e      	ldr	r0, [pc, #120]	@ (200208cc <boot_psram_init+0x19c>)
20020854:	f003 fdb9 	bl	200243ca <HAL_LEGACY_CFG_WRITE>
20020858:	e7db      	b.n	20020812 <boot_psram_init+0xe2>
2002085a:	2d06      	cmp	r5, #6
2002085c:	d10d      	bne.n	2002087a <boot_psram_init+0x14a>
2002085e:	f009 fd1b 	bl	2002a298 <BSP_GetFlash1DIV>
20020862:	a905      	add	r1, sp, #20
20020864:	4602      	mov	r2, r0
20020866:	4819      	ldr	r0, [pc, #100]	@ (200208cc <boot_psram_init+0x19c>)
20020868:	f003 ff54 	bl	20024714 <HAL_HYPER_PSRAM_Init>
2002086c:	4817      	ldr	r0, [pc, #92]	@ (200208cc <boot_psram_init+0x19c>)
2002086e:	f003 ff8b 	bl	20024788 <HAL_HYPER_CFG_READ>
20020872:	4816      	ldr	r0, [pc, #88]	@ (200208cc <boot_psram_init+0x19c>)
20020874:	f003 ff9a 	bl	200247ac <HAL_HYPER_CFG_WRITE>
20020878:	e7cb      	b.n	20020812 <boot_psram_init+0xe2>
2002087a:	f009 fd0d 	bl	2002a298 <BSP_GetFlash1DIV>
2002087e:	2500      	movs	r5, #0
20020880:	2403      	movs	r4, #3
20020882:	2701      	movs	r7, #1
20020884:	2602      	movs	r6, #2
20020886:	4602      	mov	r2, r0
20020888:	a905      	add	r1, sp, #20
2002088a:	4810      	ldr	r0, [pc, #64]	@ (200208cc <boot_psram_init+0x19c>)
2002088c:	f003 fc96 	bl	200241bc <HAL_SPI_PSRAM_Init>
20020890:	462b      	mov	r3, r5
20020892:	2206      	movs	r2, #6
20020894:	4621      	mov	r1, r4
20020896:	e9cd 4702 	strd	r4, r7, [sp, #8]
2002089a:	e9cd 5600 	strd	r5, r6, [sp]
2002089e:	480b      	ldr	r0, [pc, #44]	@ (200208cc <boot_psram_init+0x19c>)
200208a0:	f002 f8c0 	bl	20022a24 <HAL_FLASH_CFG_AHB_RCMD>
200208a4:	21eb      	movs	r1, #235	@ 0xeb
200208a6:	4809      	ldr	r0, [pc, #36]	@ (200208cc <boot_psram_init+0x19c>)
200208a8:	f002 f8b1 	bl	20022a0e <HAL_FLASH_SET_AHB_RCMD>
200208ac:	4621      	mov	r1, r4
200208ae:	462b      	mov	r3, r5
200208b0:	462a      	mov	r2, r5
200208b2:	e9cd 4702 	strd	r4, r7, [sp, #8]
200208b6:	e9cd 5600 	strd	r5, r6, [sp]
200208ba:	4804      	ldr	r0, [pc, #16]	@ (200208cc <boot_psram_init+0x19c>)
200208bc:	f002 f8db 	bl	20022a76 <HAL_FLASH_CFG_AHB_WCMD>
200208c0:	2138      	movs	r1, #56	@ 0x38
200208c2:	4802      	ldr	r0, [pc, #8]	@ (200208cc <boot_psram_init+0x19c>)
200208c4:	f002 f8cb 	bl	20022a5e <HAL_FLASH_SET_AHB_WCMD>
200208c8:	e7a3      	b.n	20020812 <boot_psram_init+0xe2>
200208ca:	bf00      	nop
200208cc:	200449d0 	.word	0x200449d0
200208d0:	50041000 	.word	0x50041000
200208d4:	07de2901 	.word	0x07de2901
200208d8:	13c9eb01 	.word	0x13c9eb01
200208dc:	17d78401 	.word	0x17d78401

200208e0 <board_init_psram>:
200208e0:	b510      	push	{r4, lr}
200208e2:	4b15      	ldr	r3, [pc, #84]	@ (20020938 <board_init_psram+0x58>)
200208e4:	685c      	ldr	r4, [r3, #4]
200208e6:	f3c4 2402 	ubfx	r4, r4, #8, #3
200208ea:	1ea3      	subs	r3, r4, #2
200208ec:	2b04      	cmp	r3, #4
200208ee:	d821      	bhi.n	20020934 <board_init_psram+0x54>
200208f0:	e8df f003 	tbb	[pc, r3]
200208f4:	03151b1d 	.word	0x03151b1d
200208f8:	19          	.byte	0x19
200208f9:	00          	.byte	0x00
200208fa:	f7ff fed1 	bl	200206a0 <board_pinmux_psram_func3>
200208fe:	2201      	movs	r2, #1
20020900:	2000      	movs	r0, #0
20020902:	4611      	mov	r1, r2
20020904:	f00b fcd4 	bl	2002c2b0 <HAL_PMU_ConfigPeriLdo>
20020908:	2001      	movs	r0, #1
2002090a:	f7ff ff0c 	bl	20020726 <bootloader_switch_clock>
2002090e:	2002      	movs	r0, #2
20020910:	f009 fcce 	bl	2002a2b0 <BSP_SetFlash1DIV>
20020914:	4620      	mov	r0, r4
20020916:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002091a:	f7ff bf09 	b.w	20020730 <boot_psram_init>
2002091e:	2002      	movs	r0, #2
20020920:	f7ff fe4c 	bl	200205bc <board_pinmux_psram_func1_2_4>
20020924:	e7eb      	b.n	200208fe <board_init_psram+0x1e>
20020926:	2004      	movs	r0, #4
20020928:	e7fa      	b.n	20020920 <board_init_psram+0x40>
2002092a:	2001      	movs	r0, #1
2002092c:	e7f8      	b.n	20020920 <board_init_psram+0x40>
2002092e:	f7ff fdf8 	bl	20020522 <board_pinmux_psram_func0>
20020932:	e7e4      	b.n	200208fe <board_init_psram+0x1e>
20020934:	bd10      	pop	{r4, pc}
20020936:	bf00      	nop
20020938:	5000b000 	.word	0x5000b000

2002093c <erase_nor>:
2002093c:	4b15      	ldr	r3, [pc, #84]	@ (20020994 <erase_nor+0x58>)
2002093e:	b570      	push	{r4, r5, r6, lr}
20020940:	f103 0644 	add.w	r6, r3, #68	@ 0x44
20020944:	f1b0 5f90 	cmp.w	r0, #301989888	@ 0x12000000
20020948:	bf38      	it	cc
2002094a:	461e      	movcc	r6, r3
2002094c:	6933      	ldr	r3, [r6, #16]
2002094e:	460c      	mov	r4, r1
20020950:	4283      	cmp	r3, r0
20020952:	d901      	bls.n	20020958 <erase_nor+0x1c>
20020954:	2001      	movs	r0, #1
20020956:	bd70      	pop	{r4, r5, r6, pc}
20020958:	6972      	ldr	r2, [r6, #20]
2002095a:	441a      	add	r2, r3
2002095c:	4282      	cmp	r2, r0
2002095e:	d3f9      	bcc.n	20020954 <erase_nor+0x18>
20020960:	1ac0      	subs	r0, r0, r3
20020962:	f3c0 030b 	ubfx	r3, r0, #0, #12
20020966:	b97b      	cbnz	r3, 20020988 <erase_nor+0x4c>
20020968:	f3c1 030b 	ubfx	r3, r1, #0, #12
2002096c:	b97b      	cbnz	r3, 2002098e <erase_nor+0x52>
2002096e:	1845      	adds	r5, r0, r1
20020970:	1b29      	subs	r1, r5, r4
20020972:	b90c      	cbnz	r4, 20020978 <erase_nor+0x3c>
20020974:	4620      	mov	r0, r4
20020976:	e7ee      	b.n	20020956 <erase_nor+0x1a>
20020978:	4630      	mov	r0, r6
2002097a:	f003 f937 	bl	20023bec <HAL_QSPIEX_SECT_ERASE>
2002097e:	2800      	cmp	r0, #0
20020980:	d1e8      	bne.n	20020954 <erase_nor+0x18>
20020982:	f5a4 5480 	sub.w	r4, r4, #4096	@ 0x1000
20020986:	e7f3      	b.n	20020970 <erase_nor+0x34>
20020988:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
2002098c:	e7e3      	b.n	20020956 <erase_nor+0x1a>
2002098e:	f06f 0001 	mvn.w	r0, #1
20020992:	e7e0      	b.n	20020956 <erase_nor+0x1a>
20020994:	20046f20 	.word	0x20046f20

20020998 <write_nor>:
20020998:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
2002099c:	4b20      	ldr	r3, [pc, #128]	@ (20020a20 <write_nor+0x88>)
2002099e:	460f      	mov	r7, r1
200209a0:	f103 0844 	add.w	r8, r3, #68	@ 0x44
200209a4:	f1b0 5f90 	cmp.w	r0, #301989888	@ 0x12000000
200209a8:	bf38      	it	cc
200209aa:	4698      	movcc	r8, r3
200209ac:	f8d8 5010 	ldr.w	r5, [r8, #16]
200209b0:	4616      	mov	r6, r2
200209b2:	4285      	cmp	r5, r0
200209b4:	d902      	bls.n	200209bc <write_nor+0x24>
200209b6:	2000      	movs	r0, #0
200209b8:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
200209bc:	f8d8 2014 	ldr.w	r2, [r8, #20]
200209c0:	442a      	add	r2, r5
200209c2:	4282      	cmp	r2, r0
200209c4:	d3f7      	bcc.n	200209b6 <write_nor+0x1e>
200209c6:	1b45      	subs	r5, r0, r5
200209c8:	f015 04ff 	ands.w	r4, r5, #255	@ 0xff
200209cc:	d012      	beq.n	200209f4 <write_nor+0x5c>
200209ce:	f5c4 7480 	rsb	r4, r4, #256	@ 0x100
200209d2:	42b4      	cmp	r4, r6
200209d4:	bf28      	it	cs
200209d6:	4634      	movcs	r4, r6
200209d8:	460a      	mov	r2, r1
200209da:	4623      	mov	r3, r4
200209dc:	4629      	mov	r1, r5
200209de:	4640      	mov	r0, r8
200209e0:	f003 f81f 	bl	20023a22 <HAL_QSPIEX_WRITE_PAGE>
200209e4:	4284      	cmp	r4, r0
200209e6:	d1e6      	bne.n	200209b6 <write_nor+0x1e>
200209e8:	4425      	add	r5, r4
200209ea:	4427      	add	r7, r4
200209ec:	1b34      	subs	r4, r6, r4
200209ee:	b91c      	cbnz	r4, 200209f8 <write_nor+0x60>
200209f0:	4630      	mov	r0, r6
200209f2:	e7e1      	b.n	200209b8 <write_nor+0x20>
200209f4:	4634      	mov	r4, r6
200209f6:	e7fa      	b.n	200209ee <write_nor+0x56>
200209f8:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
200209fc:	46a1      	mov	r9, r4
200209fe:	bf28      	it	cs
20020a00:	f44f 7980 	movcs.w	r9, #256	@ 0x100
20020a04:	463a      	mov	r2, r7
20020a06:	464b      	mov	r3, r9
20020a08:	4629      	mov	r1, r5
20020a0a:	4640      	mov	r0, r8
20020a0c:	f003 f809 	bl	20023a22 <HAL_QSPIEX_WRITE_PAGE>
20020a10:	4581      	cmp	r9, r0
20020a12:	d1d0      	bne.n	200209b6 <write_nor+0x1e>
20020a14:	444d      	add	r5, r9
20020a16:	444f      	add	r7, r9
20020a18:	eba4 0409 	sub.w	r4, r4, r9
20020a1c:	e7e7      	b.n	200209ee <write_nor+0x56>
20020a1e:	bf00      	nop
20020a20:	20046f20 	.word	0x20046f20

20020a24 <read_nor>:
20020a24:	460b      	mov	r3, r1
20020a26:	b510      	push	{r4, lr}
20020a28:	4614      	mov	r4, r2
20020a2a:	4601      	mov	r1, r0
20020a2c:	4618      	mov	r0, r3
20020a2e:	f009 ff07 	bl	2002a840 <memcpy>
20020a32:	4620      	mov	r0, r4
20020a34:	bd10      	pop	{r4, pc}
	...

20020a38 <read_nand>:
20020a38:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20020a3c:	2600      	movs	r6, #0
20020a3e:	460f      	mov	r7, r1
20020a40:	4615      	mov	r5, r2
20020a42:	46b0      	mov	r8, r6
20020a44:	4b19      	ldr	r3, [pc, #100]	@ (20020aac <read_nand+0x74>)
20020a46:	f8df a068 	ldr.w	sl, [pc, #104]	@ 20020ab0 <read_nand+0x78>
20020a4a:	681b      	ldr	r3, [r3, #0]
20020a4c:	f8df b064 	ldr.w	fp, [pc, #100]	@ 20020ab4 <read_nand+0x7c>
20020a50:	691b      	ldr	r3, [r3, #16]
20020a52:	4604      	mov	r4, r0
20020a54:	4283      	cmp	r3, r0
20020a56:	b085      	sub	sp, #20
20020a58:	bf98      	it	ls
20020a5a:	1ac4      	subls	r4, r0, r3
20020a5c:	b91d      	cbnz	r5, 20020a66 <read_nand+0x2e>
20020a5e:	4630      	mov	r0, r6
20020a60:	b005      	add	sp, #20
20020a62:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20020a66:	f8da 1000 	ldr.w	r1, [sl]
20020a6a:	f8db 0000 	ldr.w	r0, [fp]
20020a6e:	42a9      	cmp	r1, r5
20020a70:	fbb0 fcf1 	udiv	ip, r0, r1
20020a74:	4689      	mov	r9, r1
20020a76:	f101 32ff 	add.w	r2, r1, #4294967295	@ 0xffffffff
20020a7a:	bf28      	it	cs
20020a7c:	46a9      	movcs	r9, r5
20020a7e:	fbb4 f1f1 	udiv	r1, r4, r1
20020a82:	f10c 3cff 	add.w	ip, ip, #4294967295	@ 0xffffffff
20020a86:	fbb4 f0f0 	udiv	r0, r4, r0
20020a8a:	e9cd 8801 	strd	r8, r8, [sp, #4]
20020a8e:	f8cd 9000 	str.w	r9, [sp]
20020a92:	19bb      	adds	r3, r7, r6
20020a94:	4022      	ands	r2, r4
20020a96:	ea0c 0101 	and.w	r1, ip, r1
20020a9a:	f004 fe47 	bl	2002572c <bbm_read_page>
20020a9e:	4548      	cmp	r0, r9
20020aa0:	d1dd      	bne.n	20020a5e <read_nand+0x26>
20020aa2:	4406      	add	r6, r0
20020aa4:	1a2d      	subs	r5, r5, r0
20020aa6:	4404      	add	r4, r0
20020aa8:	e7d8      	b.n	20020a5c <read_nand+0x24>
20020aaa:	bf00      	nop
20020aac:	20046d08 	.word	0x20046d08
20020ab0:	20042c04 	.word	0x20042c04
20020ab4:	20042c00 	.word	0x20042c00

20020ab8 <read_sdnand>:
20020ab8:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20020abc:	f100 461e 	add.w	r6, r0, #2650800128	@ 0x9e000000
20020ac0:	460d      	mov	r5, r1
20020ac2:	4614      	mov	r4, r2
20020ac4:	4617      	mov	r7, r2
20020ac6:	46b0      	mov	r8, r6
20020ac8:	eb02 0901 	add.w	r9, r2, r1
20020acc:	f5b7 7f00 	cmp.w	r7, #512	@ 0x200
20020ad0:	eba9 0107 	sub.w	r1, r9, r7
20020ad4:	d218      	bcs.n	20020b08 <read_sdnand+0x50>
20020ad6:	f3c4 0708 	ubfx	r7, r4, #0, #9
20020ada:	b197      	cbz	r7, 20020b02 <read_sdnand+0x4a>
20020adc:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020ae0:	f020 0001 	bic.w	r0, r0, #1
20020ae4:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020ae8:	490c      	ldr	r1, [pc, #48]	@ (20020b1c <read_sdnand+0x64>)
20020aea:	4430      	add	r0, r6
20020aec:	f001 f89c 	bl	20021c28 <sd_read_data>
20020af0:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020af4:	f020 0001 	bic.w	r0, r0, #1
20020af8:	463a      	mov	r2, r7
20020afa:	4908      	ldr	r1, [pc, #32]	@ (20020b1c <read_sdnand+0x64>)
20020afc:	4428      	add	r0, r5
20020afe:	f009 fe9f 	bl	2002a840 <memcpy>
20020b02:	4620      	mov	r0, r4
20020b04:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
20020b08:	4640      	mov	r0, r8
20020b0a:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020b0e:	f001 f88b 	bl	20021c28 <sd_read_data>
20020b12:	f5a7 7700 	sub.w	r7, r7, #512	@ 0x200
20020b16:	f508 7800 	add.w	r8, r8, #512	@ 0x200
20020b1a:	e7d7      	b.n	20020acc <read_sdnand+0x14>
20020b1c:	20046b04 	.word	0x20046b04

20020b20 <read_sdemmc>:
20020b20:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20020b24:	f100 461e 	add.w	r6, r0, #2650800128	@ 0x9e000000
20020b28:	460d      	mov	r5, r1
20020b2a:	4614      	mov	r4, r2
20020b2c:	4617      	mov	r7, r2
20020b2e:	46b0      	mov	r8, r6
20020b30:	eb02 0901 	add.w	r9, r2, r1
20020b34:	f5b7 7f00 	cmp.w	r7, #512	@ 0x200
20020b38:	eba9 0107 	sub.w	r1, r9, r7
20020b3c:	d218      	bcs.n	20020b70 <read_sdemmc+0x50>
20020b3e:	f3c4 0708 	ubfx	r7, r4, #0, #9
20020b42:	b197      	cbz	r7, 20020b6a <read_sdemmc+0x4a>
20020b44:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020b48:	f020 0001 	bic.w	r0, r0, #1
20020b4c:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020b50:	490c      	ldr	r1, [pc, #48]	@ (20020b84 <read_sdemmc+0x64>)
20020b52:	4430      	add	r0, r6
20020b54:	f000 fe52 	bl	200217fc <emmc_read_data>
20020b58:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020b5c:	f020 0001 	bic.w	r0, r0, #1
20020b60:	463a      	mov	r2, r7
20020b62:	4908      	ldr	r1, [pc, #32]	@ (20020b84 <read_sdemmc+0x64>)
20020b64:	4428      	add	r0, r5
20020b66:	f009 fe6b 	bl	2002a840 <memcpy>
20020b6a:	4620      	mov	r0, r4
20020b6c:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
20020b70:	4640      	mov	r0, r8
20020b72:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020b76:	f000 fe41 	bl	200217fc <emmc_read_data>
20020b7a:	f5a7 7700 	sub.w	r7, r7, #512	@ 0x200
20020b7e:	f508 7800 	add.w	r8, r8, #512	@ 0x200
20020b82:	e7d7      	b.n	20020b34 <read_sdemmc+0x14>
20020b84:	20046b04 	.word	0x20046b04

20020b88 <port_read_page>:
20020b88:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020b8c:	4615      	mov	r5, r2
20020b8e:	460e      	mov	r6, r1
20020b90:	4928      	ldr	r1, [pc, #160]	@ (20020c34 <port_read_page+0xac>)
20020b92:	461a      	mov	r2, r3
20020b94:	e9dd 3c08 	ldrd	r3, ip, [sp, #32]
20020b98:	680f      	ldr	r7, [r1, #0]
20020b9a:	18e9      	adds	r1, r5, r3
20020b9c:	428f      	cmp	r7, r1
20020b9e:	f8dd e028 	ldr.w	lr, [sp, #40]	@ 0x28
20020ba2:	d200      	bcs.n	20020ba6 <port_read_page+0x1e>
20020ba4:	e7fe      	b.n	20020ba4 <port_read_page+0x1c>
20020ba6:	4924      	ldr	r1, [pc, #144]	@ (20020c38 <port_read_page+0xb0>)
20020ba8:	f107 0980 	add.w	r9, r7, #128	@ 0x80
20020bac:	f1b9 0f00 	cmp.w	r9, #0
20020bb0:	6809      	ldr	r1, [r1, #0]
20020bb2:	dd15      	ble.n	20020be0 <port_read_page+0x58>
20020bb4:	4c21      	ldr	r4, [pc, #132]	@ (20020c3c <port_read_page+0xb4>)
20020bb6:	6d64      	ldr	r4, [r4, #84]	@ 0x54
20020bb8:	f004 081f 	and.w	r8, r4, #31
20020bbc:	44c8      	add	r8, r9
20020bbe:	f3bf 8f4f 	dsb	sy
20020bc2:	f8df a080 	ldr.w	sl, [pc, #128]	@ 20020c44 <port_read_page+0xbc>
20020bc6:	44a0      	add	r8, r4
20020bc8:	f8ca 425c 	str.w	r4, [sl, #604]	@ 0x25c
20020bcc:	3420      	adds	r4, #32
20020bce:	eba8 0904 	sub.w	r9, r8, r4
20020bd2:	f1b9 0f00 	cmp.w	r9, #0
20020bd6:	dcf7      	bgt.n	20020bc8 <port_read_page+0x40>
20020bd8:	f3bf 8f4f 	dsb	sy
20020bdc:	f3bf 8f6f 	isb	sy
20020be0:	07c4      	lsls	r4, r0, #31
20020be2:	d51b      	bpl.n	20020c1c <port_read_page+0x94>
20020be4:	4c15      	ldr	r4, [pc, #84]	@ (20020c3c <port_read_page+0xb4>)
20020be6:	f894 806b 	ldrb.w	r8, [r4, #107]	@ 0x6b
20020bea:	f1b8 0f00 	cmp.w	r8, #0
20020bee:	d015      	beq.n	20020c1c <port_read_page+0x94>
20020bf0:	6d64      	ldr	r4, [r4, #84]	@ 0x54
20020bf2:	f504 5880 	add.w	r8, r4, #4096	@ 0x1000
20020bf6:	f004 041f 	and.w	r4, r4, #31
20020bfa:	f504 6408 	add.w	r4, r4, #2176	@ 0x880
20020bfe:	f3bf 8f4f 	dsb	sy
20020c02:	f8df 9040 	ldr.w	r9, [pc, #64]	@ 20020c44 <port_read_page+0xbc>
20020c06:	3c20      	subs	r4, #32
20020c08:	2c00      	cmp	r4, #0
20020c0a:	f8c9 825c 	str.w	r8, [r9, #604]	@ 0x25c
20020c0e:	f108 0820 	add.w	r8, r8, #32
20020c12:	dcf8      	bgt.n	20020c06 <port_read_page+0x7e>
20020c14:	f3bf 8f4f 	dsb	sy
20020c18:	f3bf 8f6f 	isb	sy
20020c1c:	fb07 5506 	mla	r5, r7, r6, r5
20020c20:	e9cd ce08 	strd	ip, lr, [sp, #32]
20020c24:	fb01 5100 	mla	r1, r1, r0, r5
20020c28:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020c2c:	4804      	ldr	r0, [pc, #16]	@ (20020c40 <port_read_page+0xb8>)
20020c2e:	f002 be16 	b.w	2002385e <HAL_NAND_READ_WITHOOB>
20020c32:	bf00      	nop
20020c34:	20042c04 	.word	0x20042c04
20020c38:	20042c00 	.word	0x20042c00
20020c3c:	20046f20 	.word	0x20046f20
20020c40:	20046f64 	.word	0x20046f64
20020c44:	e000ed00 	.word	0xe000ed00

20020c48 <bbm_get_bb>:
20020c48:	b410      	push	{r4}
20020c4a:	4b1c      	ldr	r3, [pc, #112]	@ (20020cbc <bbm_get_bb+0x74>)
20020c4c:	4601      	mov	r1, r0
20020c4e:	6818      	ldr	r0, [r3, #0]
20020c50:	3080      	adds	r0, #128	@ 0x80
20020c52:	2800      	cmp	r0, #0
20020c54:	dd12      	ble.n	20020c7c <bbm_get_bb+0x34>
20020c56:	4b1a      	ldr	r3, [pc, #104]	@ (20020cc0 <bbm_get_bb+0x78>)
20020c58:	6d5b      	ldr	r3, [r3, #84]	@ 0x54
20020c5a:	f003 021f 	and.w	r2, r3, #31
20020c5e:	4402      	add	r2, r0
20020c60:	f3bf 8f4f 	dsb	sy
20020c64:	4c17      	ldr	r4, [pc, #92]	@ (20020cc4 <bbm_get_bb+0x7c>)
20020c66:	441a      	add	r2, r3
20020c68:	f8c4 325c 	str.w	r3, [r4, #604]	@ 0x25c
20020c6c:	3320      	adds	r3, #32
20020c6e:	1ad0      	subs	r0, r2, r3
20020c70:	2800      	cmp	r0, #0
20020c72:	dcf9      	bgt.n	20020c68 <bbm_get_bb+0x20>
20020c74:	f3bf 8f4f 	dsb	sy
20020c78:	f3bf 8f6f 	isb	sy
20020c7c:	07cb      	lsls	r3, r1, #31
20020c7e:	d518      	bpl.n	20020cb2 <bbm_get_bb+0x6a>
20020c80:	4b0f      	ldr	r3, [pc, #60]	@ (20020cc0 <bbm_get_bb+0x78>)
20020c82:	f893 206b 	ldrb.w	r2, [r3, #107]	@ 0x6b
20020c86:	b1a2      	cbz	r2, 20020cb2 <bbm_get_bb+0x6a>
20020c88:	6d5b      	ldr	r3, [r3, #84]	@ 0x54
20020c8a:	f503 5280 	add.w	r2, r3, #4096	@ 0x1000
20020c8e:	f003 031f 	and.w	r3, r3, #31
20020c92:	f503 6308 	add.w	r3, r3, #2176	@ 0x880
20020c96:	f3bf 8f4f 	dsb	sy
20020c9a:	480a      	ldr	r0, [pc, #40]	@ (20020cc4 <bbm_get_bb+0x7c>)
20020c9c:	3b20      	subs	r3, #32
20020c9e:	2b00      	cmp	r3, #0
20020ca0:	f8c0 225c 	str.w	r2, [r0, #604]	@ 0x25c
20020ca4:	f102 0220 	add.w	r2, r2, #32
20020ca8:	dcf8      	bgt.n	20020c9c <bbm_get_bb+0x54>
20020caa:	f3bf 8f4f 	dsb	sy
20020cae:	f3bf 8f6f 	isb	sy
20020cb2:	4805      	ldr	r0, [pc, #20]	@ (20020cc8 <bbm_get_bb+0x80>)
20020cb4:	f85d 4b04 	ldr.w	r4, [sp], #4
20020cb8:	f002 be92 	b.w	200239e0 <HAL_NAND_GET_BADBLK>
20020cbc:	20042c04 	.word	0x20042c04
20020cc0:	20046f20 	.word	0x20046f20
20020cc4:	e000ed00 	.word	0xe000ed00
20020cc8:	20046f64 	.word	0x20046f64

20020ccc <dfu_flash_init>:
20020ccc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020cd0:	b08c      	sub	sp, #48	@ 0x30
20020cd2:	f001 fe67 	bl	200229a4 <HAL_HPAON_EnableXT48>
20020cd6:	2101      	movs	r1, #1
20020cd8:	2000      	movs	r0, #0
20020cda:	f004 f911 	bl	20024f00 <HAL_RCC_HCPU_ClockSelect>
20020cde:	2101      	movs	r1, #1
20020ce0:	200c      	movs	r0, #12
20020ce2:	f004 f90d 	bl	20024f00 <HAL_RCC_HCPU_ClockSelect>
20020ce6:	2001      	movs	r0, #1
20020ce8:	f004 f808 	bl	20024cfc <HAL_PMU_EnableDLL>
20020cec:	4f9c      	ldr	r7, [pc, #624]	@ (20020f60 <dfu_flash_init+0x294>)
20020cee:	2090      	movs	r0, #144	@ 0x90
20020cf0:	f004 fa68 	bl	200251c4 <HAL_RCC_HCPU_ConfigHCLK>
20020cf4:	2000      	movs	r0, #0
20020cf6:	f001 f91a 	bl	20021f2e <HAL_Delay_us>
20020cfa:	683b      	ldr	r3, [r7, #0]
20020cfc:	4d99      	ldr	r5, [pc, #612]	@ (20020f64 <dfu_flash_init+0x298>)
20020cfe:	3b01      	subs	r3, #1
20020d00:	2b05      	cmp	r3, #5
20020d02:	f200 811d 	bhi.w	20020f40 <dfu_flash_init+0x274>
20020d06:	e8df f013 	tbh	[pc, r3, lsl #1]
20020d0a:	0006      	.short	0x0006
20020d0c:	00780006 	.word	0x00780006
20020d10:	00f80078 	.word	0x00f80078
20020d14:	010c      	.short	0x010c
20020d16:	4894      	ldr	r0, [pc, #592]	@ (20020f68 <dfu_flash_init+0x29c>)
20020d18:	f004 f8ba 	bl	20024e90 <HAL_RCC_HCPU_EnableDLL2>
20020d1c:	4c93      	ldr	r4, [pc, #588]	@ (20020f6c <dfu_flash_init+0x2a0>)
20020d1e:	2006      	movs	r0, #6
20020d20:	f009 fac6 	bl	2002a2b0 <BSP_SetFlash1DIV>
20020d24:	ae07      	add	r6, sp, #28
20020d26:	2102      	movs	r1, #2
20020d28:	2004      	movs	r0, #4
20020d2a:	f004 f8e9 	bl	20024f00 <HAL_RCC_HCPU_ClockSelect>
20020d2e:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
20020d30:	c60f      	stmia	r6!, {r0, r1, r2, r3}
20020d32:	f854 3b04 	ldr.w	r3, [r4], #4
20020d36:	6033      	str	r3, [r6, #0]
20020d38:	ae03      	add	r6, sp, #12
20020d3a:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
20020d3e:	e886 000f 	stmia.w	r6, {r0, r1, r2, r3}
20020d42:	2301      	movs	r3, #1
20020d44:	4c8a      	ldr	r4, [pc, #552]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020d46:	f884 3035 	strb.w	r3, [r4, #53]	@ 0x35
20020d4a:	2300      	movs	r3, #0
20020d4c:	9308      	str	r3, [sp, #32]
20020d4e:	683b      	ldr	r3, [r7, #0]
20020d50:	2b01      	cmp	r3, #1
20020d52:	d14d      	bne.n	20020df0 <dfu_flash_init+0x124>
20020d54:	f7ff fadc 	bl	20020310 <board_pinmux_mpi1_puya_base>
20020d58:	f009 fa9e 	bl	2002a298 <BSP_GetFlash1DIV>
20020d5c:	4633      	mov	r3, r6
20020d5e:	9000      	str	r0, [sp, #0]
20020d60:	4a84      	ldr	r2, [pc, #528]	@ (20020f74 <dfu_flash_init+0x2a8>)
20020d62:	4883      	ldr	r0, [pc, #524]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020d64:	a907      	add	r1, sp, #28
20020d66:	f003 f813 	bl	20023d90 <HAL_FLASH_Init>
20020d6a:	683e      	ldr	r6, [r7, #0]
20020d6c:	2e01      	cmp	r6, #1
20020d6e:	d10d      	bne.n	20020d8c <dfu_flash_init+0xc0>
20020d70:	6b20      	ldr	r0, [r4, #48]	@ 0x30
20020d72:	4b81      	ldr	r3, [pc, #516]	@ (20020f78 <dfu_flash_init+0x2ac>)
20020d74:	1ac3      	subs	r3, r0, r3
20020d76:	4258      	negs	r0, r3
20020d78:	4158      	adcs	r0, r3
20020d7a:	f7ff faea 	bl	20020352 <board_pinmux_mpi1_puya_ext>
20020d7e:	4631      	mov	r1, r6
20020d80:	487b      	ldr	r0, [pc, #492]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020d82:	f002 fa7a 	bl	2002327a <HAL_FLASH_SET_QUAL_SPI>
20020d86:	2302      	movs	r3, #2
20020d88:	f884 3020 	strb.w	r3, [r4, #32]
20020d8c:	4b7b      	ldr	r3, [pc, #492]	@ (20020f7c <dfu_flash_init+0x2b0>)
20020d8e:	4a7c      	ldr	r2, [pc, #496]	@ (20020f80 <dfu_flash_init+0x2b4>)
20020d90:	602b      	str	r3, [r5, #0]
20020d92:	4b7c      	ldr	r3, [pc, #496]	@ (20020f84 <dfu_flash_init+0x2b8>)
20020d94:	601a      	str	r2, [r3, #0]
20020d96:	4b7c      	ldr	r3, [pc, #496]	@ (20020f88 <dfu_flash_init+0x2bc>)
20020d98:	4a7c      	ldr	r2, [pc, #496]	@ (20020f8c <dfu_flash_init+0x2c0>)
20020d9a:	601a      	str	r2, [r3, #0]
20020d9c:	4b7c      	ldr	r3, [pc, #496]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020d9e:	6ba2      	ldr	r2, [r4, #56]	@ 0x38
20020da0:	601a      	str	r2, [r3, #0]
20020da2:	4b7c      	ldr	r3, [pc, #496]	@ (20020f94 <dfu_flash_init+0x2c8>)
20020da4:	601c      	str	r4, [r3, #0]
20020da6:	2405      	movs	r4, #5
20020da8:	f8df 81ec 	ldr.w	r8, [pc, #492]	@ 20020f98 <dfu_flash_init+0x2cc>
20020dac:	4e78      	ldr	r6, [pc, #480]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020dae:	f8df 921c 	ldr.w	r9, [pc, #540]	@ 20020fcc <dfu_flash_init+0x300>
20020db2:	682b      	ldr	r3, [r5, #0]
20020db4:	f642 4210 	movw	r2, #11280	@ 0x2c10
20020db8:	4977      	ldr	r1, [pc, #476]	@ (20020f98 <dfu_flash_init+0x2cc>)
20020dba:	6830      	ldr	r0, [r6, #0]
20020dbc:	4798      	blx	r3
20020dbe:	f8d8 3000 	ldr.w	r3, [r8]
20020dc2:	454b      	cmp	r3, r9
20020dc4:	f040 80c0 	bne.w	20020f48 <dfu_flash_init+0x27c>
20020dc8:	683b      	ldr	r3, [r7, #0]
20020dca:	2b04      	cmp	r3, #4
20020dcc:	f040 8085 	bne.w	20020eda <dfu_flash_init+0x20e>
20020dd0:	f8d8 30a4 	ldr.w	r3, [r8, #164]	@ 0xa4
20020dd4:	1e5a      	subs	r2, r3, #1
20020dd6:	3203      	adds	r2, #3
20020dd8:	d87f      	bhi.n	20020eda <dfu_flash_init+0x20e>
20020dda:	4a70      	ldr	r2, [pc, #448]	@ (20020f9c <dfu_flash_init+0x2d0>)
20020ddc:	496e      	ldr	r1, [pc, #440]	@ (20020f98 <dfu_flash_init+0x2cc>)
20020dde:	6013      	str	r3, [r2, #0]
20020de0:	f642 4210 	movw	r2, #11280	@ 0x2c10
20020de4:	682b      	ldr	r3, [r5, #0]
20020de6:	6830      	ldr	r0, [r6, #0]
20020de8:	b00c      	add	sp, #48	@ 0x30
20020dea:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020dee:	4718      	bx	r3
20020df0:	f7ff fade 	bl	200203b0 <board_pinmux_mpi1_gd>
20020df4:	2302      	movs	r3, #2
20020df6:	9308      	str	r3, [sp, #32]
20020df8:	e7ae      	b.n	20020d58 <dfu_flash_init+0x8c>
20020dfa:	485b      	ldr	r0, [pc, #364]	@ (20020f68 <dfu_flash_init+0x29c>)
20020dfc:	f004 f848 	bl	20024e90 <HAL_RCC_HCPU_EnableDLL2>
20020e00:	4c67      	ldr	r4, [pc, #412]	@ (20020fa0 <dfu_flash_init+0x2d4>)
20020e02:	2006      	movs	r0, #6
20020e04:	f009 fa5a 	bl	2002a2bc <BSP_SetFlash2DIV>
20020e08:	ae07      	add	r6, sp, #28
20020e0a:	2102      	movs	r1, #2
20020e0c:	2006      	movs	r0, #6
20020e0e:	f004 f877 	bl	20024f00 <HAL_RCC_HCPU_ClockSelect>
20020e12:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
20020e14:	c60f      	stmia	r6!, {r0, r1, r2, r3}
20020e16:	f854 3b04 	ldr.w	r3, [r4], #4
20020e1a:	f8d7 8000 	ldr.w	r8, [r7]
20020e1e:	6033      	str	r3, [r6, #0]
20020e20:	ae03      	add	r6, sp, #12
20020e22:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
20020e26:	f1b8 0903 	subs.w	r9, r8, #3
20020e2a:	e886 000f 	stmia.w	r6, {r0, r1, r2, r3}
20020e2e:	bf18      	it	ne
20020e30:	f04f 0901 	movne.w	r9, #1
20020e34:	f7ff faff 	bl	20020436 <board_pinmux_mpi2>
20020e38:	2302      	movs	r3, #2
20020e3a:	f1b8 0f03 	cmp.w	r8, #3
20020e3e:	4c4c      	ldr	r4, [pc, #304]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020e40:	9308      	str	r3, [sp, #32]
20020e42:	d04d      	beq.n	20020ee0 <dfu_flash_init+0x214>
20020e44:	4b57      	ldr	r3, [pc, #348]	@ (20020fa4 <dfu_flash_init+0x2d8>)
20020e46:	602b      	str	r3, [r5, #0]
20020e48:	9b09      	ldr	r3, [sp, #36]	@ 0x24
20020e4a:	f103 43a0 	add.w	r3, r3, #1342177280	@ 0x50000000
20020e4e:	9309      	str	r3, [sp, #36]	@ 0x24
20020e50:	2301      	movs	r3, #1
20020e52:	930b      	str	r3, [sp, #44]	@ 0x2c
20020e54:	4b54      	ldr	r3, [pc, #336]	@ (20020fa8 <dfu_flash_init+0x2dc>)
20020e56:	6623      	str	r3, [r4, #96]	@ 0x60
20020e58:	f04f 0a01 	mov.w	sl, #1
20020e5c:	2000      	movs	r0, #0
20020e5e:	f001 f866 	bl	20021f2e <HAL_Delay_us>
20020e62:	f884 a079 	strb.w	sl, [r4, #121]	@ 0x79
20020e66:	f884 9078 	strb.w	r9, [r4, #120]	@ 0x78
20020e6a:	f009 fa1b 	bl	2002a2a4 <BSP_GetFlash2DIV>
20020e6e:	4633      	mov	r3, r6
20020e70:	9000      	str	r0, [sp, #0]
20020e72:	4a4e      	ldr	r2, [pc, #312]	@ (20020fac <dfu_flash_init+0x2e0>)
20020e74:	484e      	ldr	r0, [pc, #312]	@ (20020fb0 <dfu_flash_init+0x2e4>)
20020e76:	a907      	add	r1, sp, #28
20020e78:	f002 ff8a 	bl	20023d90 <HAL_FLASH_Init>
20020e7c:	4e4c      	ldr	r6, [pc, #304]	@ (20020fb0 <dfu_flash_init+0x2e4>)
20020e7e:	bb90      	cbnz	r0, 20020ee6 <dfu_flash_init+0x21a>
20020e80:	f1b8 0f03 	cmp.w	r8, #3
20020e84:	d032      	beq.n	20020eec <dfu_flash_init+0x220>
20020e86:	4630      	mov	r0, r6
20020e88:	f002 fcde 	bl	20023848 <HAL_NAND_PAGE_SIZE>
20020e8c:	f8df 910c 	ldr.w	r9, [pc, #268]	@ 20020f9c <dfu_flash_init+0x2d0>
20020e90:	f8df 813c 	ldr.w	r8, [pc, #316]	@ 20020fd0 <dfu_flash_init+0x304>
20020e94:	f8c9 0000 	str.w	r0, [r9]
20020e98:	4630      	mov	r0, r6
20020e9a:	f002 fd95 	bl	200239c8 <HAL_NAND_BLOCK_SIZE>
20020e9e:	4651      	mov	r1, sl
20020ea0:	f8c8 0000 	str.w	r0, [r8]
20020ea4:	4630      	mov	r0, r6
20020ea6:	f884 a06a 	strb.w	sl, [r4, #106]	@ 0x6a
20020eaa:	f002 fba6 	bl	200235fa <HAL_NAND_CONF_ECC>
20020eae:	f8d9 0000 	ldr.w	r0, [r9]
20020eb2:	f004 ff23 	bl	20025cfc <bbm_set_page_size>
20020eb6:	f8d8 0000 	ldr.w	r0, [r8]
20020eba:	f004 ff25 	bl	20025d08 <bbm_set_blk_size>
20020ebe:	493d      	ldr	r1, [pc, #244]	@ (20020fb4 <dfu_flash_init+0x2e8>)
20020ec0:	f8d4 0080 	ldr.w	r0, [r4, #128]	@ 0x80
20020ec4:	f004 fdbc 	bl	20025a40 <sif_bbm_init>
20020ec8:	4b31      	ldr	r3, [pc, #196]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020eca:	6fe2      	ldr	r2, [r4, #124]	@ 0x7c
20020ecc:	601a      	str	r2, [r3, #0]
20020ece:	4b31      	ldr	r3, [pc, #196]	@ (20020f94 <dfu_flash_init+0x2c8>)
20020ed0:	601e      	str	r6, [r3, #0]
20020ed2:	682b      	ldr	r3, [r5, #0]
20020ed4:	2b00      	cmp	r3, #0
20020ed6:	f47f af66 	bne.w	20020da6 <dfu_flash_init+0xda>
20020eda:	b00c      	add	sp, #48	@ 0x30
20020edc:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20020ee0:	4b26      	ldr	r3, [pc, #152]	@ (20020f7c <dfu_flash_init+0x2b0>)
20020ee2:	602b      	str	r3, [r5, #0]
20020ee4:	e7b8      	b.n	20020e58 <dfu_flash_init+0x18c>
20020ee6:	f1b8 0f03 	cmp.w	r8, #3
20020eea:	d1ed      	bne.n	20020ec8 <dfu_flash_init+0x1fc>
20020eec:	4b25      	ldr	r3, [pc, #148]	@ (20020f84 <dfu_flash_init+0x2b8>)
20020eee:	4a24      	ldr	r2, [pc, #144]	@ (20020f80 <dfu_flash_init+0x2b4>)
20020ef0:	601a      	str	r2, [r3, #0]
20020ef2:	4b25      	ldr	r3, [pc, #148]	@ (20020f88 <dfu_flash_init+0x2bc>)
20020ef4:	4a25      	ldr	r2, [pc, #148]	@ (20020f8c <dfu_flash_init+0x2c0>)
20020ef6:	601a      	str	r2, [r3, #0]
20020ef8:	e7e6      	b.n	20020ec8 <dfu_flash_init+0x1fc>
20020efa:	481b      	ldr	r0, [pc, #108]	@ (20020f68 <dfu_flash_init+0x29c>)
20020efc:	f003 ffc8 	bl	20024e90 <HAL_RCC_HCPU_EnableDLL2>
20020f00:	f7ff fac0 	bl	20020484 <board_pinmux_sd>
20020f04:	f000 fd64 	bl	200219d0 <sdmmc1_sdnand>
20020f08:	2801      	cmp	r0, #1
20020f0a:	d001      	beq.n	20020f10 <dfu_flash_init+0x244>
20020f0c:	f7ff f9d0 	bl	200202b0 <boot_error>
20020f10:	4b29      	ldr	r3, [pc, #164]	@ (20020fb8 <dfu_flash_init+0x2ec>)
20020f12:	4a2a      	ldr	r2, [pc, #168]	@ (20020fbc <dfu_flash_init+0x2f0>)
20020f14:	602b      	str	r3, [r5, #0]
20020f16:	4b1e      	ldr	r3, [pc, #120]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020f18:	601a      	str	r2, [r3, #0]
20020f1a:	2200      	movs	r2, #0
20020f1c:	4b1d      	ldr	r3, [pc, #116]	@ (20020f94 <dfu_flash_init+0x2c8>)
20020f1e:	601a      	str	r2, [r3, #0]
20020f20:	e741      	b.n	20020da6 <dfu_flash_init+0xda>
20020f22:	4811      	ldr	r0, [pc, #68]	@ (20020f68 <dfu_flash_init+0x29c>)
20020f24:	f003 ffb4 	bl	20024e90 <HAL_RCC_HCPU_EnableDLL2>
20020f28:	f7ff faac 	bl	20020484 <board_pinmux_sd>
20020f2c:	f000 fb40 	bl	200215b0 <sdio_emmc_init>
20020f30:	4b23      	ldr	r3, [pc, #140]	@ (20020fc0 <dfu_flash_init+0x2f4>)
20020f32:	6018      	str	r0, [r3, #0]
20020f34:	b110      	cbz	r0, 20020f3c <dfu_flash_init+0x270>
20020f36:	b2c0      	uxtb	r0, r0
20020f38:	f7ff f9ba 	bl	200202b0 <boot_error>
20020f3c:	4b21      	ldr	r3, [pc, #132]	@ (20020fc4 <dfu_flash_init+0x2f8>)
20020f3e:	e7e8      	b.n	20020f12 <dfu_flash_init+0x246>
20020f40:	2053      	movs	r0, #83	@ 0x53
20020f42:	f7ff f9b5 	bl	200202b0 <boot_error>
20020f46:	e7c4      	b.n	20020ed2 <dfu_flash_init+0x206>
20020f48:	481f      	ldr	r0, [pc, #124]	@ (20020fc8 <dfu_flash_init+0x2fc>)
20020f4a:	f000 fff0 	bl	20021f2e <HAL_Delay_us>
20020f4e:	3c01      	subs	r4, #1
20020f50:	f47f af2f 	bne.w	20020db2 <dfu_flash_init+0xe6>
20020f54:	2043      	movs	r0, #67	@ 0x43
20020f56:	b00c      	add	sp, #48	@ 0x30
20020f58:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020f5c:	f7ff b9a8 	b.w	200202b0 <boot_error>
20020f60:	20049f24 	.word	0x20049f24
20020f64:	20046d14 	.word	0x20046d14
20020f68:	112a8800 	.word	0x112a8800
20020f6c:	2002a910 	.word	0x2002a910
20020f70:	20046f20 	.word	0x20046f20
20020f74:	20046d18 	.word	0x20046d18
20020f78:	00176085 	.word	0x00176085
20020f7c:	20020a25 	.word	0x20020a25
20020f80:	20020999 	.word	0x20020999
20020f84:	20046d10 	.word	0x20046d10
20020f88:	20046d0c 	.word	0x20046d0c
20020f8c:	2002093d 	.word	0x2002093d
20020f90:	20046d04 	.word	0x20046d04
20020f94:	20046d08 	.word	0x20046d08
20020f98:	20047314 	.word	0x20047314
20020f9c:	20042c04 	.word	0x20042c04
20020fa0:	2002a934 	.word	0x2002a934
20020fa4:	20020a39 	.word	0x20020a39
20020fa8:	20045a84 	.word	0x20045a84
20020fac:	20046d80 	.word	0x20046d80
20020fb0:	20046f64 	.word	0x20046f64
20020fb4:	20044a04 	.word	0x20044a04
20020fb8:	20020ab9 	.word	0x20020ab9
20020fbc:	62001000 	.word	0x62001000
20020fc0:	20044a00 	.word	0x20044a00
20020fc4:	20020b21 	.word	0x20020b21
20020fc8:	000f4240 	.word	0x000f4240
20020fcc:	53454346 	.word	0x53454346
20020fd0:	20042c00 	.word	0x20042c00

20020fd4 <sifli_hw_efuse_read_bank>:
20020fd4:	2803      	cmp	r0, #3
20020fd6:	b508      	push	{r3, lr}
20020fd8:	d80c      	bhi.n	20020ff4 <sifli_hw_efuse_read_bank+0x20>
20020fda:	0200      	lsls	r0, r0, #8
20020fdc:	2220      	movs	r2, #32
20020fde:	4907      	ldr	r1, [pc, #28]	@ (20020ffc <sifli_hw_efuse_read_bank+0x28>)
20020fe0:	f400 407f 	and.w	r0, r0, #65280	@ 0xff00
20020fe4:	f001 fc4a 	bl	2002287c <HAL_EFUSE_Read>
20020fe8:	2800      	cmp	r0, #0
20020fea:	bf0c      	ite	eq
20020fec:	f06f 0001 	mvneq.w	r0, #1
20020ff0:	2000      	movne	r0, #0
20020ff2:	bd08      	pop	{r3, pc}
20020ff4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20020ff8:	e7fb      	b.n	20020ff2 <sifli_hw_efuse_read_bank+0x1e>
20020ffa:	bf00      	nop
20020ffc:	20047294 	.word	0x20047294

20021000 <sifli_hw_efuse_read>:
20021000:	b513      	push	{r0, r1, r4, lr}
20021002:	3801      	subs	r0, #1
20021004:	460c      	mov	r4, r1
20021006:	2803      	cmp	r0, #3
20021008:	d81e      	bhi.n	20021048 <sifli_hw_efuse_read+0x48>
2002100a:	e8df f000 	tbb	[pc, r0]
2002100e:	0c02      	.short	0x0c02
20021010:	1009      	.short	0x1009
20021012:	2210      	movs	r2, #16
20021014:	2000      	movs	r0, #0
20021016:	b002      	add	sp, #8
20021018:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002101c:	f001 bc2e 	b.w	2002287c <HAL_EFUSE_Read>
20021020:	2208      	movs	r2, #8
20021022:	2080      	movs	r0, #128	@ 0x80
20021024:	e7f7      	b.n	20021016 <sifli_hw_efuse_read+0x16>
20021026:	2220      	movs	r2, #32
20021028:	f44f 7040 	mov.w	r0, #768	@ 0x300
2002102c:	e7f3      	b.n	20021016 <sifli_hw_efuse_read+0x16>
2002102e:	2204      	movs	r2, #4
20021030:	20c0      	movs	r0, #192	@ 0xc0
20021032:	eb0d 0102 	add.w	r1, sp, r2
20021036:	f001 fc21 	bl	2002287c <HAL_EFUSE_Read>
2002103a:	2804      	cmp	r0, #4
2002103c:	d104      	bne.n	20021048 <sifli_hw_efuse_read+0x48>
2002103e:	2001      	movs	r0, #1
20021040:	9b01      	ldr	r3, [sp, #4]
20021042:	7023      	strb	r3, [r4, #0]
20021044:	b002      	add	sp, #8
20021046:	bd10      	pop	{r4, pc}
20021048:	2000      	movs	r0, #0
2002104a:	e7fb      	b.n	20021044 <sifli_hw_efuse_read+0x44>

2002104c <sifli_hw_init_xip_key>:
2002104c:	b538      	push	{r3, r4, r5, lr}
2002104e:	4605      	mov	r5, r0
20021050:	4c0f      	ldr	r4, [pc, #60]	@ (20021090 <sifli_hw_init_xip_key+0x44>)
20021052:	2210      	movs	r2, #16
20021054:	68e3      	ldr	r3, [r4, #12]
20021056:	490f      	ldr	r1, [pc, #60]	@ (20021094 <sifli_hw_init_xip_key+0x48>)
20021058:	f043 0301 	orr.w	r3, r3, #1
2002105c:	60e3      	str	r3, [r4, #12]
2002105e:	2001      	movs	r0, #1
20021060:	f7ff ffce 	bl	20021000 <sifli_hw_efuse_read>
20021064:	2220      	movs	r2, #32
20021066:	2100      	movs	r1, #0
20021068:	480b      	ldr	r0, [pc, #44]	@ (20021098 <sifli_hw_init_xip_key+0x4c>)
2002106a:	f009 fbcf 	bl	2002a80c <memset>
2002106e:	2302      	movs	r3, #2
20021070:	2120      	movs	r1, #32
20021072:	4a08      	ldr	r2, [pc, #32]	@ (20021094 <sifli_hw_init_xip_key+0x48>)
20021074:	2000      	movs	r0, #0
20021076:	f000 ffd3 	bl	20022020 <HAL_AES_init>
2002107a:	2320      	movs	r3, #32
2002107c:	4629      	mov	r1, r5
2002107e:	2000      	movs	r0, #0
20021080:	4a05      	ldr	r2, [pc, #20]	@ (20021098 <sifli_hw_init_xip_key+0x4c>)
20021082:	f001 f811 	bl	200220a8 <HAL_AES_run>
20021086:	68e3      	ldr	r3, [r4, #12]
20021088:	f023 0301 	bic.w	r3, r3, #1
2002108c:	60e3      	str	r3, [r4, #12]
2002108e:	bd38      	pop	{r3, r4, r5, pc}
20021090:	5000b000 	.word	0x5000b000
20021094:	200472c4 	.word	0x200472c4
20021098:	20047274 	.word	0x20047274

2002109c <sifli_hw_dec_key>:
2002109c:	b538      	push	{r3, r4, r5, lr}
2002109e:	4604      	mov	r4, r0
200210a0:	460d      	mov	r5, r1
200210a2:	2210      	movs	r2, #16
200210a4:	4908      	ldr	r1, [pc, #32]	@ (200210c8 <sifli_hw_dec_key+0x2c>)
200210a6:	2001      	movs	r0, #1
200210a8:	f7ff ffaa 	bl	20021000 <sifli_hw_efuse_read>
200210ac:	2302      	movs	r3, #2
200210ae:	2120      	movs	r1, #32
200210b0:	4a05      	ldr	r2, [pc, #20]	@ (200210c8 <sifli_hw_dec_key+0x2c>)
200210b2:	2000      	movs	r0, #0
200210b4:	f000 ffb4 	bl	20022020 <HAL_AES_init>
200210b8:	2320      	movs	r3, #32
200210ba:	462a      	mov	r2, r5
200210bc:	4621      	mov	r1, r4
200210be:	2000      	movs	r0, #0
200210c0:	f000 fff2 	bl	200220a8 <HAL_AES_run>
200210c4:	2000      	movs	r0, #0
200210c6:	bd38      	pop	{r3, r4, r5, pc}
200210c8:	200472c4 	.word	0x200472c4

200210cc <dfu_get_counter>:
200210cc:	b538      	push	{r3, r4, r5, lr}
200210ce:	4d0a      	ldr	r5, [pc, #40]	@ (200210f8 <dfu_get_counter+0x2c>)
200210d0:	4604      	mov	r4, r0
200210d2:	2208      	movs	r2, #8
200210d4:	4629      	mov	r1, r5
200210d6:	2003      	movs	r0, #3
200210d8:	f7ff ff92 	bl	20021000 <sifli_hw_efuse_read>
200210dc:	2300      	movs	r3, #0
200210de:	e9c5 3302 	strd	r3, r3, [r5, #8]
200210e2:	230f      	movs	r3, #15
200210e4:	0924      	lsrs	r4, r4, #4
200210e6:	b12c      	cbz	r4, 200210f4 <dfu_get_counter+0x28>
200210e8:	54ec      	strb	r4, [r5, r3]
200210ea:	3b01      	subs	r3, #1
200210ec:	2b0b      	cmp	r3, #11
200210ee:	ea4f 2414 	mov.w	r4, r4, lsr #8
200210f2:	d1f8      	bne.n	200210e6 <dfu_get_counter+0x1a>
200210f4:	4800      	ldr	r0, [pc, #0]	@ (200210f8 <dfu_get_counter+0x2c>)
200210f6:	bd38      	pop	{r3, r4, r5, pc}
200210f8:	200472b4 	.word	0x200472b4

200210fc <sifli_hw_dec>:
200210fc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20021100:	4680      	mov	r8, r0
20021102:	4689      	mov	r9, r1
20021104:	4692      	mov	sl, r2
20021106:	2100      	movs	r1, #0
20021108:	f44f 7200 	mov.w	r2, #512	@ 0x200
2002110c:	4814      	ldr	r0, [pc, #80]	@ (20021160 <sifli_hw_dec+0x64>)
2002110e:	461e      	mov	r6, r3
20021110:	9f08      	ldr	r7, [sp, #32]
20021112:	2400      	movs	r4, #0
20021114:	f009 fb7a 	bl	2002a80c <memset>
20021118:	42a6      	cmp	r6, r4
2002111a:	d802      	bhi.n	20021122 <sifli_hw_dec+0x26>
2002111c:	4620      	mov	r0, r4
2002111e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20021122:	1b35      	subs	r5, r6, r4
20021124:	f5b5 7f00 	cmp.w	r5, #512	@ 0x200
20021128:	bf28      	it	cs
2002112a:	f44f 7500 	movcs.w	r5, #512	@ 0x200
2002112e:	eb09 0104 	add.w	r1, r9, r4
20021132:	462a      	mov	r2, r5
20021134:	480a      	ldr	r0, [pc, #40]	@ (20021160 <sifli_hw_dec+0x64>)
20021136:	f009 fb83 	bl	2002a840 <memcpy>
2002113a:	19e0      	adds	r0, r4, r7
2002113c:	f7ff ffc6 	bl	200210cc <dfu_get_counter>
20021140:	2301      	movs	r3, #1
20021142:	4602      	mov	r2, r0
20021144:	2120      	movs	r1, #32
20021146:	4640      	mov	r0, r8
20021148:	f000 ff6a 	bl	20022020 <HAL_AES_init>
2002114c:	eb0a 0204 	add.w	r2, sl, r4
20021150:	462b      	mov	r3, r5
20021152:	2000      	movs	r0, #0
20021154:	4902      	ldr	r1, [pc, #8]	@ (20021160 <sifli_hw_dec+0x64>)
20021156:	f000 ffa7 	bl	200220a8 <HAL_AES_run>
2002115a:	442c      	add	r4, r5
2002115c:	e7dc      	b.n	20021118 <sifli_hw_dec+0x1c>
2002115e:	bf00      	nop
20021160:	20047074 	.word	0x20047074

20021164 <update_sec_flash>:
20021164:	b510      	push	{r4, lr}
20021166:	4604      	mov	r4, r0
20021168:	4b08      	ldr	r3, [pc, #32]	@ (2002118c <update_sec_flash+0x28>)
2002116a:	f44f 5140 	mov.w	r1, #12288	@ 0x3000
2002116e:	681b      	ldr	r3, [r3, #0]
20021170:	f04f 5090 	mov.w	r0, #301989888	@ 0x12000000
20021174:	4798      	blx	r3
20021176:	4b06      	ldr	r3, [pc, #24]	@ (20021190 <update_sec_flash+0x2c>)
20021178:	4621      	mov	r1, r4
2002117a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002117e:	f642 4210 	movw	r2, #11280	@ 0x2c10
20021182:	f04f 5090 	mov.w	r0, #301989888	@ 0x12000000
20021186:	681b      	ldr	r3, [r3, #0]
20021188:	4718      	bx	r3
2002118a:	bf00      	nop
2002118c:	20046d0c 	.word	0x20046d0c
20021190:	20046d14 	.word	0x20046d14

20021194 <boot_ram>:
20021194:	4b05      	ldr	r3, [pc, #20]	@ (200211ac <boot_ram+0x18>)
20021196:	b082      	sub	sp, #8
20021198:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
2002119a:	9301      	str	r3, [sp, #4]
2002119c:	9b01      	ldr	r3, [sp, #4]
2002119e:	b113      	cbz	r3, 200211a6 <boot_ram+0x12>
200211a0:	9b01      	ldr	r3, [sp, #4]
200211a2:	b002      	add	sp, #8
200211a4:	4718      	bx	r3
200211a6:	b002      	add	sp, #8
200211a8:	4770      	bx	lr
200211aa:	bf00      	nop
200211ac:	500c0000 	.word	0x500c0000

200211b0 <is_addr_in_nor>:
200211b0:	4b09      	ldr	r3, [pc, #36]	@ (200211d8 <is_addr_in_nor+0x28>)
200211b2:	4602      	mov	r2, r0
200211b4:	681b      	ldr	r3, [r3, #0]
200211b6:	b163      	cbz	r3, 200211d2 <is_addr_in_nor+0x22>
200211b8:	f893 0023 	ldrb.w	r0, [r3, #35]	@ 0x23
200211bc:	b948      	cbnz	r0, 200211d2 <is_addr_in_nor+0x22>
200211be:	6919      	ldr	r1, [r3, #16]
200211c0:	4291      	cmp	r1, r2
200211c2:	d807      	bhi.n	200211d4 <is_addr_in_nor+0x24>
200211c4:	695b      	ldr	r3, [r3, #20]
200211c6:	4419      	add	r1, r3
200211c8:	4291      	cmp	r1, r2
200211ca:	bf94      	ite	ls
200211cc:	2000      	movls	r0, #0
200211ce:	2001      	movhi	r0, #1
200211d0:	4770      	bx	lr
200211d2:	2000      	movs	r0, #0
200211d4:	4770      	bx	lr
200211d6:	bf00      	nop
200211d8:	20046d08 	.word	0x20046d08

200211dc <dfu_boot_img_in_flash>:
200211dc:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
200211e0:	4f5e      	ldr	r7, [pc, #376]	@ (2002135c <dfu_boot_img_in_flash+0x180>)
200211e2:	1e84      	subs	r4, r0, #2
200211e4:	eb07 1300 	add.w	r3, r7, r0, lsl #4
200211e8:	eb07 2040 	add.w	r0, r7, r0, lsl #9
200211ec:	f8d3 8004 	ldr.w	r8, [r3, #4]
200211f0:	68dd      	ldr	r5, [r3, #12]
200211f2:	f8b0 3c06 	ldrh.w	r3, [r0, #3078]	@ 0xc06
200211f6:	b085      	sub	sp, #20
200211f8:	07db      	lsls	r3, r3, #31
200211fa:	f140 8095 	bpl.w	20021328 <dfu_boot_img_in_flash+0x14c>
200211fe:	f44f 7193 	mov.w	r1, #294	@ 0x126
20021202:	f507 7082 	add.w	r0, r7, #260	@ 0x104
20021206:	f000 fdc4 	bl	20021d92 <sifli_sigkey_pub_verify>
2002120a:	b110      	cbz	r0, 20021212 <dfu_boot_img_in_flash+0x36>
2002120c:	2001      	movs	r0, #1
2002120e:	f000 fe0d 	bl	20021e2c <sifli_secboot_exception>
20021212:	2c07      	cmp	r4, #7
20021214:	f300 8093 	bgt.w	2002133e <dfu_boot_img_in_flash+0x162>
20021218:	2003      	movs	r0, #3
2002121a:	f7ff fedb 	bl	20020fd4 <sifli_hw_efuse_read_bank>
2002121e:	4262      	negs	r2, r4
20021220:	f002 0203 	and.w	r2, r2, #3
20021224:	f004 0303 	and.w	r3, r4, #3
20021228:	bf58      	it	pl
2002122a:	4253      	negpl	r3, r2
2002122c:	2b02      	cmp	r3, #2
2002122e:	f200 8086 	bhi.w	2002133e <dfu_boot_img_in_flash+0x162>
20021232:	4628      	mov	r0, r5
20021234:	f7ff ffbc 	bl	200211b0 <is_addr_in_nor>
20021238:	f241 0308 	movw	r3, #4104	@ 0x1008
2002123c:	4682      	mov	sl, r0
2002123e:	ea4f 2944 	mov.w	r9, r4, lsl #9
20021242:	f8df c12c 	ldr.w	ip, [pc, #300]	@ 20021370 <dfu_boot_img_in_flash+0x194>
20021246:	eb07 0609 	add.w	r6, r7, r9
2002124a:	441e      	add	r6, r3
2002124c:	ce0f      	ldmia	r6!, {r0, r1, r2, r3}
2002124e:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
20021252:	e896 000f 	ldmia.w	r6, {r0, r1, r2, r3}
20021256:	e88c 000f 	stmia.w	ip, {r0, r1, r2, r3}
2002125a:	f1ba 0f00 	cmp.w	sl, #0
2002125e:	d04b      	beq.n	200212f8 <dfu_boot_img_in_flash+0x11c>
20021260:	f104 0608 	add.w	r6, r4, #8
20021264:	f1ac 0010 	sub.w	r0, ip, #16
20021268:	0276      	lsls	r6, r6, #9
2002126a:	f7ff feef 	bl	2002104c <sifli_hw_init_xip_key>
2002126e:	59ba      	ldr	r2, [r7, r6]
20021270:	f8df a0f0 	ldr.w	sl, [pc, #240]	@ 20021364 <dfu_boot_img_in_flash+0x188>
20021274:	442a      	add	r2, r5
20021276:	2000      	movs	r0, #0
20021278:	f8da b000 	ldr.w	fp, [sl]
2002127c:	9203      	str	r2, [sp, #12]
2002127e:	f7ff ff25 	bl	200210cc <dfu_get_counter>
20021282:	4629      	mov	r1, r5
20021284:	4603      	mov	r3, r0
20021286:	9a03      	ldr	r2, [sp, #12]
20021288:	4658      	mov	r0, fp
2002128a:	f002 f964 	bl	20023556 <HAL_FLASH_NONCE_CFG>
2002128e:	4629      	mov	r1, r5
20021290:	f8da 0000 	ldr.w	r0, [sl]
20021294:	59ba      	ldr	r2, [r7, r6]
20021296:	eba8 0305 	sub.w	r3, r8, r5
2002129a:	f002 f94b 	bl	20023534 <HAL_FLASH_ALIAS_CFG>
2002129e:	2101      	movs	r1, #1
200212a0:	f8da 0000 	ldr.w	r0, [sl]
200212a4:	f002 f96f 	bl	20023586 <HAL_FLASH_AES_CFG>
200212a8:	f104 0308 	add.w	r3, r4, #8
200212ac:	f509 5081 	add.w	r0, r9, #4128	@ 0x1020
200212b0:	025b      	lsls	r3, r3, #9
200212b2:	3008      	adds	r0, #8
200212b4:	462a      	mov	r2, r5
200212b6:	58fb      	ldr	r3, [r7, r3]
200212b8:	4929      	ldr	r1, [pc, #164]	@ (20021360 <dfu_boot_img_in_flash+0x184>)
200212ba:	4438      	add	r0, r7
200212bc:	f000 fd81 	bl	20021dc2 <sifli_img_sig_hash_verify>
200212c0:	b110      	cbz	r0, 200212c8 <dfu_boot_img_in_flash+0xec>
200212c2:	2002      	movs	r0, #2
200212c4:	f000 fdb2 	bl	20021e2c <sifli_secboot_exception>
200212c8:	f8d5 d000 	ldr.w	sp, [r5]
200212cc:	f8d5 f004 	ldr.w	pc, [r5, #4]
200212d0:	4628      	mov	r0, r5
200212d2:	f7ff ff6d 	bl	200211b0 <is_addr_in_nor>
200212d6:	2800      	cmp	r0, #0
200212d8:	d034      	beq.n	20021344 <dfu_boot_img_in_flash+0x168>
200212da:	4822      	ldr	r0, [pc, #136]	@ (20021364 <dfu_boot_img_in_flash+0x188>)
200212dc:	3408      	adds	r4, #8
200212de:	0264      	lsls	r4, r4, #9
200212e0:	4629      	mov	r1, r5
200212e2:	593a      	ldr	r2, [r7, r4]
200212e4:	6800      	ldr	r0, [r0, #0]
200212e6:	eba8 0305 	sub.w	r3, r8, r5
200212ea:	f002 f923 	bl	20023534 <HAL_FLASH_ALIAS_CFG>
200212ee:	f8d5 d000 	ldr.w	sp, [r5]
200212f2:	f8d5 f004 	ldr.w	pc, [r5, #4]
200212f6:	e022      	b.n	2002133e <dfu_boot_img_in_flash+0x162>
200212f8:	f1ac 0010 	sub.w	r0, ip, #16
200212fc:	2220      	movs	r2, #32
200212fe:	491a      	ldr	r1, [pc, #104]	@ (20021368 <dfu_boot_img_in_flash+0x18c>)
20021300:	f7ff fecc 	bl	2002109c <sifli_hw_dec_key>
20021304:	f104 0608 	add.w	r6, r4, #8
20021308:	4b18      	ldr	r3, [pc, #96]	@ (2002136c <dfu_boot_img_in_flash+0x190>)
2002130a:	0276      	lsls	r6, r6, #9
2002130c:	4629      	mov	r1, r5
2002130e:	59ba      	ldr	r2, [r7, r6]
20021310:	4640      	mov	r0, r8
20021312:	681b      	ldr	r3, [r3, #0]
20021314:	4798      	blx	r3
20021316:	f8cd a000 	str.w	sl, [sp]
2002131a:	462a      	mov	r2, r5
2002131c:	4629      	mov	r1, r5
2002131e:	59bb      	ldr	r3, [r7, r6]
20021320:	4811      	ldr	r0, [pc, #68]	@ (20021368 <dfu_boot_img_in_flash+0x18c>)
20021322:	f7ff feeb 	bl	200210fc <sifli_hw_dec>
20021326:	e7bf      	b.n	200212a8 <dfu_boot_img_in_flash+0xcc>
20021328:	2c07      	cmp	r4, #7
2002132a:	dc08      	bgt.n	2002133e <dfu_boot_img_in_flash+0x162>
2002132c:	4262      	negs	r2, r4
2002132e:	f002 0203 	and.w	r2, r2, #3
20021332:	f004 0303 	and.w	r3, r4, #3
20021336:	bf58      	it	pl
20021338:	4253      	negpl	r3, r2
2002133a:	2b02      	cmp	r3, #2
2002133c:	d9c8      	bls.n	200212d0 <dfu_boot_img_in_flash+0xf4>
2002133e:	b005      	add	sp, #20
20021340:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20021344:	45a8      	cmp	r8, r5
20021346:	d0d2      	beq.n	200212ee <dfu_boot_img_in_flash+0x112>
20021348:	4b08      	ldr	r3, [pc, #32]	@ (2002136c <dfu_boot_img_in_flash+0x190>)
2002134a:	3408      	adds	r4, #8
2002134c:	0264      	lsls	r4, r4, #9
2002134e:	4629      	mov	r1, r5
20021350:	4640      	mov	r0, r8
20021352:	681b      	ldr	r3, [r3, #0]
20021354:	593a      	ldr	r2, [r7, r4]
20021356:	4798      	blx	r3
20021358:	e7c9      	b.n	200212ee <dfu_boot_img_in_flash+0x112>
2002135a:	bf00      	nop
2002135c:	20047314 	.word	0x20047314
20021360:	20047418 	.word	0x20047418
20021364:	20046d08 	.word	0x20046d08
20021368:	200472d4 	.word	0x200472d4
2002136c:	20046d14 	.word	0x20046d14
20021370:	200472f4 	.word	0x200472f4

20021374 <boot_images_help>:
20021374:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20021378:	4b59      	ldr	r3, [pc, #356]	@ (200214e0 <boot_images_help+0x16c>)
2002137a:	f8df a180 	ldr.w	sl, [pc, #384]	@ 200214fc <boot_images_help+0x188>
2002137e:	681b      	ldr	r3, [r3, #0]
20021380:	b087      	sub	sp, #28
20021382:	4553      	cmp	r3, sl
20021384:	d15e      	bne.n	20021444 <boot_images_help+0xd0>
20021386:	2300      	movs	r3, #0
20021388:	4f56      	ldr	r7, [pc, #344]	@ (200214e4 <boot_images_help+0x170>)
2002138a:	ac02      	add	r4, sp, #8
2002138c:	2208      	movs	r2, #8
2002138e:	4621      	mov	r1, r4
20021390:	e9cd 3302 	strd	r3, r3, [sp, #8]
20021394:	e9cd 3304 	strd	r3, r3, [sp, #16]
20021398:	4853      	ldr	r0, [pc, #332]	@ (200214e8 <boot_images_help+0x174>)
2002139a:	683b      	ldr	r3, [r7, #0]
2002139c:	ad04      	add	r5, sp, #16
2002139e:	4798      	blx	r3
200213a0:	683b      	ldr	r3, [r7, #0]
200213a2:	2208      	movs	r2, #8
200213a4:	4629      	mov	r1, r5
200213a6:	4851      	ldr	r0, [pc, #324]	@ (200214ec <boot_images_help+0x178>)
200213a8:	4798      	blx	r3
200213aa:	9b02      	ldr	r3, [sp, #8]
200213ac:	4553      	cmp	r3, sl
200213ae:	d106      	bne.n	200213be <boot_images_help+0x4a>
200213b0:	9b04      	ldr	r3, [sp, #16]
200213b2:	4553      	cmp	r3, sl
200213b4:	bf04      	itt	eq
200213b6:	e9d5 0100 	ldrdeq	r0, r1, [r5]
200213ba:	e9c4 0100 	strdeq	r0, r1, [r4]
200213be:	2008      	movs	r0, #8
200213c0:	f00a ff70 	bl	2002c2a4 <HAL_Get_backup>
200213c4:	4605      	mov	r5, r0
200213c6:	2005      	movs	r0, #5
200213c8:	f00a ff6c 	bl	2002c2a4 <HAL_Get_backup>
200213cc:	f8df 9130 	ldr.w	r9, [pc, #304]	@ 20021500 <boot_images_help+0x18c>
200213d0:	4947      	ldr	r1, [pc, #284]	@ (200214f0 <boot_images_help+0x17c>)
200213d2:	f8d9 4000 	ldr.w	r4, [r9]
200213d6:	f8df 812c 	ldr.w	r8, [pc, #300]	@ 20021504 <boot_images_help+0x190>
200213da:	683b      	ldr	r3, [r7, #0]
200213dc:	4f45      	ldr	r7, [pc, #276]	@ (200214f4 <boot_images_help+0x180>)
200213de:	f642 4210 	movw	r2, #11280	@ 0x2c10
200213e2:	4606      	mov	r6, r0
200213e4:	f8c8 1000 	str.w	r1, [r8]
200213e8:	4620      	mov	r0, r4
200213ea:	4798      	blx	r3
200213ec:	f8d7 bc08 	ldr.w	fp, [r7, #3080]	@ 0xc08
200213f0:	f504 52a0 	add.w	r2, r4, #5120	@ 0x1400
200213f4:	4593      	cmp	fp, r2
200213f6:	d14e      	bne.n	20021496 <boot_images_help+0x122>
200213f8:	b2eb      	uxtb	r3, r5
200213fa:	2b04      	cmp	r3, #4
200213fc:	d025      	beq.n	2002144a <boot_images_help+0xd6>
200213fe:	2b06      	cmp	r3, #6
20021400:	d039      	beq.n	20021476 <boot_images_help+0x102>
20021402:	2b01      	cmp	r3, #1
20021404:	d142      	bne.n	2002148c <boot_images_help+0x118>
20021406:	2005      	movs	r0, #5
20021408:	f00a ff4c 	bl	2002c2a4 <HAL_Get_backup>
2002140c:	2802      	cmp	r0, #2
2002140e:	d006      	beq.n	2002141e <boot_images_help+0xaa>
20021410:	9b02      	ldr	r3, [sp, #8]
20021412:	4553      	cmp	r3, sl
20021414:	d106      	bne.n	20021424 <boot_images_help+0xb0>
20021416:	f89d 300d 	ldrb.w	r3, [sp, #13]
2002141a:	2b7f      	cmp	r3, #127	@ 0x7f
2002141c:	d102      	bne.n	20021424 <boot_images_help+0xb0>
2002141e:	4b36      	ldr	r3, [pc, #216]	@ (200214f8 <boot_images_help+0x184>)
20021420:	f8c7 3c08 	str.w	r3, [r7, #3080]	@ 0xc08
20021424:	f8d7 3c08 	ldr.w	r3, [r7, #3080]	@ 0xc08
20021428:	1c5a      	adds	r2, r3, #1
2002142a:	d00b      	beq.n	20021444 <boot_images_help+0xd0>
2002142c:	f8d9 4000 	ldr.w	r4, [r9]
20021430:	1b1c      	subs	r4, r3, r4
20021432:	f5a4 5480 	sub.w	r4, r4, #4096	@ 0x1000
20021436:	0a64      	lsrs	r4, r4, #9
20021438:	3402      	adds	r4, #2
2002143a:	f7ff fa51 	bl	200208e0 <board_init_psram>
2002143e:	4620      	mov	r0, r4
20021440:	f7ff fecc 	bl	200211dc <dfu_boot_img_in_flash>
20021444:	b007      	add	sp, #28
20021446:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002144a:	2008      	movs	r0, #8
2002144c:	f504 54e0 	add.w	r4, r4, #7168	@ 0x1c00
20021450:	2106      	movs	r1, #6
20021452:	f8c7 4c08 	str.w	r4, [r7, #3080]	@ 0xc08
20021456:	f00a ff1f 	bl	2002c298 <HAL_Set_backup>
2002145a:	f8d8 0000 	ldr.w	r0, [r8]
2002145e:	f500 5300 	add.w	r3, r0, #8192	@ 0x2000
20021462:	f8c3 4c08 	str.w	r4, [r3, #3080]	@ 0xc08
20021466:	b11e      	cbz	r6, 20021470 <boot_images_help+0xfc>
20021468:	f500 5380 	add.w	r3, r0, #4096	@ 0x1000
2002146c:	f8c3 6c00 	str.w	r6, [r3, #3072]	@ 0xc00
20021470:	f7ff fe78 	bl	20021164 <update_sec_flash>
20021474:	e7c7      	b.n	20021406 <boot_images_help+0x92>
20021476:	2101      	movs	r1, #1
20021478:	2008      	movs	r0, #8
2002147a:	f00a ff0d 	bl	2002c298 <HAL_Set_backup>
2002147e:	f8d8 0000 	ldr.w	r0, [r8]
20021482:	f500 5300 	add.w	r3, r0, #8192	@ 0x2000
20021486:	f8c3 bc08 	str.w	fp, [r3, #3080]	@ 0xc08
2002148a:	e7f1      	b.n	20021470 <boot_images_help+0xfc>
2002148c:	2101      	movs	r1, #1
2002148e:	2008      	movs	r0, #8
20021490:	f00a ff02 	bl	2002c298 <HAL_Set_backup>
20021494:	e7b7      	b.n	20021406 <boot_images_help+0x92>
20021496:	f504 54e0 	add.w	r4, r4, #7168	@ 0x1c00
2002149a:	45a3      	cmp	fp, r4
2002149c:	d1b3      	bne.n	20021406 <boot_images_help+0x92>
2002149e:	b2eb      	uxtb	r3, r5
200214a0:	2b03      	cmp	r3, #3
200214a2:	d005      	beq.n	200214b0 <boot_images_help+0x13c>
200214a4:	2b05      	cmp	r3, #5
200214a6:	d018      	beq.n	200214da <boot_images_help+0x166>
200214a8:	2b02      	cmp	r3, #2
200214aa:	d0ac      	beq.n	20021406 <boot_images_help+0x92>
200214ac:	2102      	movs	r1, #2
200214ae:	e7ee      	b.n	2002148e <boot_images_help+0x11a>
200214b0:	2008      	movs	r0, #8
200214b2:	2105      	movs	r1, #5
200214b4:	f8c7 2c08 	str.w	r2, [r7, #3080]	@ 0xc08
200214b8:	9201      	str	r2, [sp, #4]
200214ba:	f00a feed 	bl	2002c298 <HAL_Set_backup>
200214be:	f8d8 0000 	ldr.w	r0, [r8]
200214c2:	9a01      	ldr	r2, [sp, #4]
200214c4:	f500 5300 	add.w	r3, r0, #8192	@ 0x2000
200214c8:	f8c3 2c08 	str.w	r2, [r3, #3080]	@ 0xc08
200214cc:	2e00      	cmp	r6, #0
200214ce:	d0cf      	beq.n	20021470 <boot_images_help+0xfc>
200214d0:	f500 5380 	add.w	r3, r0, #4096	@ 0x1000
200214d4:	f8c3 6400 	str.w	r6, [r3, #1024]	@ 0x400
200214d8:	e7ca      	b.n	20021470 <boot_images_help+0xfc>
200214da:	2102      	movs	r1, #2
200214dc:	e7cc      	b.n	20021478 <boot_images_help+0x104>
200214de:	bf00      	nop
200214e0:	20047314 	.word	0x20047314
200214e4:	20046d14 	.word	0x20046d14
200214e8:	62780000 	.word	0x62780000
200214ec:	62520000 	.word	0x62520000
200214f0:	20049f2c 	.word	0x20049f2c
200214f4:	20049314 	.word	0x20049314
200214f8:	62001000 	.word	0x62001000
200214fc:	53454346 	.word	0x53454346
20021500:	20046d04 	.word	0x20046d04
20021504:	20049f28 	.word	0x20049f28

20021508 <hw_preinit0>:
20021508:	b508      	push	{r3, lr}
2002150a:	4b0e      	ldr	r3, [pc, #56]	@ (20021544 <hw_preinit0+0x3c>)
2002150c:	685b      	ldr	r3, [r3, #4]
2002150e:	b2db      	uxtb	r3, r3
20021510:	2b06      	cmp	r3, #6
20021512:	d80a      	bhi.n	2002152a <hw_preinit0+0x22>
20021514:	4a0c      	ldr	r2, [pc, #48]	@ (20021548 <hw_preinit0+0x40>)
20021516:	6a93      	ldr	r3, [r2, #40]	@ 0x28
20021518:	f023 037f 	bic.w	r3, r3, #127	@ 0x7f
2002151c:	f043 0306 	orr.w	r3, r3, #6
20021520:	6293      	str	r3, [r2, #40]	@ 0x28
20021522:	6853      	ldr	r3, [r2, #4]
20021524:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
20021528:	6053      	str	r3, [r2, #4]
2002152a:	2000      	movs	r0, #0
2002152c:	f000 fcff 	bl	20021f2e <HAL_Delay_us>
20021530:	4b06      	ldr	r3, [pc, #24]	@ (2002154c <hw_preinit0+0x44>)
20021532:	4a07      	ldr	r2, [pc, #28]	@ (20021550 <hw_preinit0+0x48>)
20021534:	2000      	movs	r0, #0
20021536:	605a      	str	r2, [r3, #4]
20021538:	f7ff fd4c 	bl	20020fd4 <sifli_hw_efuse_read_bank>
2002153c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20021540:	f7ff be28 	b.w	20021194 <boot_ram>
20021544:	5000b000 	.word	0x5000b000
20021548:	500ca000 	.word	0x500ca000
2002154c:	5000c000 	.word	0x5000c000
20021550:	0002d08f 	.word	0x0002d08f

20021554 <entry>:
20021554:	4c14      	ldr	r4, [pc, #80]	@ (200215a8 <entry+0x54>)
20021556:	b508      	push	{r3, lr}
20021558:	2000      	movs	r0, #0
2002155a:	f000 fce8 	bl	20021f2e <HAL_Delay_us>
2002155e:	6863      	ldr	r3, [r4, #4]
20021560:	4d12      	ldr	r5, [pc, #72]	@ (200215ac <entry+0x58>)
20021562:	b2db      	uxtb	r3, r3
20021564:	2b06      	cmp	r3, #6
20021566:	d90f      	bls.n	20021588 <entry+0x34>
20021568:	f7fe ffda 	bl	20020520 <board_flash_power_on>
2002156c:	f7fe fec8 	bl	20020300 <HAL_MspInit>
20021570:	f7fe ffb8 	bl	200204e4 <board_boot_from>
20021574:	6028      	str	r0, [r5, #0]
20021576:	68e3      	ldr	r3, [r4, #12]
20021578:	f023 0301 	bic.w	r3, r3, #1
2002157c:	60e3      	str	r3, [r4, #12]
2002157e:	f7ff fba5 	bl	20020ccc <dfu_flash_init>
20021582:	f7ff fef7 	bl	20021374 <boot_images_help>
20021586:	e7fe      	b.n	20021586 <entry+0x32>
20021588:	f7fe ffac 	bl	200204e4 <board_boot_from>
2002158c:	6028      	str	r0, [r5, #0]
2002158e:	f7fe ffc7 	bl	20020520 <board_flash_power_on>
20021592:	f7fe feb5 	bl	20020300 <HAL_MspInit>
20021596:	68e3      	ldr	r3, [r4, #12]
20021598:	f023 0301 	bic.w	r3, r3, #1
2002159c:	60e3      	str	r3, [r4, #12]
2002159e:	f7ff fb95 	bl	20020ccc <dfu_flash_init>
200215a2:	f7ff fee7 	bl	20021374 <boot_images_help>
200215a6:	e7ee      	b.n	20021586 <entry+0x32>
200215a8:	5000b000 	.word	0x5000b000
200215ac:	20049f24 	.word	0x20049f24

200215b0 <sdio_emmc_init>:
200215b0:	b570      	push	{r4, r5, r6, lr}
200215b2:	b08c      	sub	sp, #48	@ 0x30
200215b4:	f000 f968 	bl	20021888 <sd1_init>
200215b8:	4c8d      	ldr	r4, [pc, #564]	@ (200217f0 <sdio_emmc_init+0x240>)
200215ba:	4b8e      	ldr	r3, [pc, #568]	@ (200217f4 <sdio_emmc_init+0x244>)
200215bc:	2500      	movs	r5, #0
200215be:	6323      	str	r3, [r4, #48]	@ 0x30
200215c0:	6b23      	ldr	r3, [r4, #48]	@ 0x30
200215c2:	f44f 70fa 	mov.w	r0, #500	@ 0x1f4
200215c6:	f043 0302 	orr.w	r3, r3, #2
200215ca:	6323      	str	r3, [r4, #48]	@ 0x30
200215cc:	f04f 7300 	mov.w	r3, #33554432	@ 0x2000000
200215d0:	62e5      	str	r5, [r4, #44]	@ 0x2c
200215d2:	6223      	str	r3, [r4, #32]
200215d4:	f000 fcab 	bl	20021f2e <HAL_Delay_us>
200215d8:	4629      	mov	r1, r5
200215da:	4628      	mov	r0, r5
200215dc:	f000 f986 	bl	200218ec <sd1_send_cmd>
200215e0:	2301      	movs	r3, #1
200215e2:	65e3      	str	r3, [r4, #92]	@ 0x5c
200215e4:	6de3      	ldr	r3, [r4, #92]	@ 0x5c
200215e6:	079d      	lsls	r5, r3, #30
200215e8:	d5fc      	bpl.n	200215e4 <sdio_emmc_init+0x34>
200215ea:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
200215ec:	f043 0320 	orr.w	r3, r3, #32
200215f0:	63e3      	str	r3, [r4, #60]	@ 0x3c
200215f2:	4981      	ldr	r1, [pc, #516]	@ (200217f8 <sdio_emmc_init+0x248>)
200215f4:	2001      	movs	r0, #1
200215f6:	ad07      	add	r5, sp, #28
200215f8:	f000 f978 	bl	200218ec <sd1_send_cmd>
200215fc:	ab06      	add	r3, sp, #24
200215fe:	aa05      	add	r2, sp, #20
20021600:	a904      	add	r1, sp, #16
20021602:	f10d 000f 	add.w	r0, sp, #15
20021606:	9500      	str	r5, [sp, #0]
20021608:	f000 f9ae 	bl	20021968 <sd1_get_rsp>
2002160c:	2014      	movs	r0, #20
2002160e:	f000 fc8e 	bl	20021f2e <HAL_Delay_us>
20021612:	9b04      	ldr	r3, [sp, #16]
20021614:	2b00      	cmp	r3, #0
20021616:	daec      	bge.n	200215f2 <sdio_emmc_init+0x42>
20021618:	2014      	movs	r0, #20
2002161a:	f000 fc88 	bl	20021f2e <HAL_Delay_us>
2002161e:	2100      	movs	r1, #0
20021620:	2002      	movs	r0, #2
20021622:	f000 f963 	bl	200218ec <sd1_send_cmd>
20021626:	2801      	cmp	r0, #1
20021628:	f000 8081 	beq.w	2002172e <sdio_emmc_init+0x17e>
2002162c:	2802      	cmp	r0, #2
2002162e:	d07e      	beq.n	2002172e <sdio_emmc_init+0x17e>
20021630:	ab08      	add	r3, sp, #32
20021632:	aa0a      	add	r2, sp, #40	@ 0x28
20021634:	a90b      	add	r1, sp, #44	@ 0x2c
20021636:	9300      	str	r3, [sp, #0]
20021638:	f10d 000f 	add.w	r0, sp, #15
2002163c:	ab09      	add	r3, sp, #36	@ 0x24
2002163e:	f000 f993 	bl	20021968 <sd1_get_rsp>
20021642:	2014      	movs	r0, #20
20021644:	f000 fc73 	bl	20021f2e <HAL_Delay_us>
20021648:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
2002164c:	2003      	movs	r0, #3
2002164e:	f000 f94d 	bl	200218ec <sd1_send_cmd>
20021652:	2801      	cmp	r0, #1
20021654:	f000 80ab 	beq.w	200217ae <sdio_emmc_init+0x1fe>
20021658:	2802      	cmp	r0, #2
2002165a:	f000 80aa 	beq.w	200217b2 <sdio_emmc_init+0x202>
2002165e:	ab06      	add	r3, sp, #24
20021660:	9500      	str	r5, [sp, #0]
20021662:	aa05      	add	r2, sp, #20
20021664:	a904      	add	r1, sp, #16
20021666:	f10d 000f 	add.w	r0, sp, #15
2002166a:	f000 f97d 	bl	20021968 <sd1_get_rsp>
2002166e:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021672:	2b03      	cmp	r3, #3
20021674:	f040 809f 	bne.w	200217b6 <sdio_emmc_init+0x206>
20021678:	4c5d      	ldr	r4, [pc, #372]	@ (200217f0 <sdio_emmc_init+0x240>)
2002167a:	2014      	movs	r0, #20
2002167c:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
2002167e:	f023 0320 	bic.w	r3, r3, #32
20021682:	63e3      	str	r3, [r4, #60]	@ 0x3c
20021684:	f000 fc53 	bl	20021f2e <HAL_Delay_us>
20021688:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
2002168c:	2009      	movs	r0, #9
2002168e:	f000 f92d 	bl	200218ec <sd1_send_cmd>
20021692:	2801      	cmp	r0, #1
20021694:	f000 8091 	beq.w	200217ba <sdio_emmc_init+0x20a>
20021698:	2802      	cmp	r0, #2
2002169a:	f000 8090 	beq.w	200217be <sdio_emmc_init+0x20e>
2002169e:	aa05      	add	r2, sp, #20
200216a0:	a904      	add	r1, sp, #16
200216a2:	ab06      	add	r3, sp, #24
200216a4:	f10d 000f 	add.w	r0, sp, #15
200216a8:	9500      	str	r5, [sp, #0]
200216aa:	f000 f95d 	bl	20021968 <sd1_get_rsp>
200216ae:	f44f 53b8 	mov.w	r3, #5888	@ 0x1700
200216b2:	6323      	str	r3, [r4, #48]	@ 0x30
200216b4:	6b23      	ldr	r3, [r4, #48]	@ 0x30
200216b6:	2014      	movs	r0, #20
200216b8:	f043 0302 	orr.w	r3, r3, #2
200216bc:	6323      	str	r3, [r4, #48]	@ 0x30
200216be:	f04f 7300 	mov.w	r3, #33554432	@ 0x2000000
200216c2:	6223      	str	r3, [r4, #32]
200216c4:	2302      	movs	r3, #2
200216c6:	63e3      	str	r3, [r4, #60]	@ 0x3c
200216c8:	f000 fc31 	bl	20021f2e <HAL_Delay_us>
200216cc:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
200216d0:	2007      	movs	r0, #7
200216d2:	f000 f90b 	bl	200218ec <sd1_send_cmd>
200216d6:	2801      	cmp	r0, #1
200216d8:	d073      	beq.n	200217c2 <sdio_emmc_init+0x212>
200216da:	2802      	cmp	r0, #2
200216dc:	d073      	beq.n	200217c6 <sdio_emmc_init+0x216>
200216de:	ab06      	add	r3, sp, #24
200216e0:	9500      	str	r5, [sp, #0]
200216e2:	aa05      	add	r2, sp, #20
200216e4:	a904      	add	r1, sp, #16
200216e6:	f10d 000f 	add.w	r0, sp, #15
200216ea:	f000 f93d 	bl	20021968 <sd1_get_rsp>
200216ee:	f89d 300f 	ldrb.w	r3, [sp, #15]
200216f2:	2b07      	cmp	r3, #7
200216f4:	d169      	bne.n	200217ca <sdio_emmc_init+0x21a>
200216f6:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
200216fa:	2101      	movs	r1, #1
200216fc:	2000      	movs	r0, #0
200216fe:	6023      	str	r3, [r4, #0]
20021700:	f000 f942 	bl	20021988 <sd1_read>
20021704:	2100      	movs	r1, #0
20021706:	2008      	movs	r0, #8
20021708:	f000 f8f0 	bl	200218ec <sd1_send_cmd>
2002170c:	2801      	cmp	r0, #1
2002170e:	d05e      	beq.n	200217ce <sdio_emmc_init+0x21e>
20021710:	2802      	cmp	r0, #2
20021712:	d05e      	beq.n	200217d2 <sdio_emmc_init+0x222>
20021714:	ab06      	add	r3, sp, #24
20021716:	9500      	str	r5, [sp, #0]
20021718:	aa05      	add	r2, sp, #20
2002171a:	a904      	add	r1, sp, #16
2002171c:	f10d 000f 	add.w	r0, sp, #15
20021720:	f000 f922 	bl	20021968 <sd1_get_rsp>
20021724:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021728:	2b08      	cmp	r3, #8
2002172a:	d002      	beq.n	20021732 <sdio_emmc_init+0x182>
2002172c:	200d      	movs	r0, #13
2002172e:	b00c      	add	sp, #48	@ 0x30
20021730:	bd70      	pop	{r4, r5, r6, pc}
20021732:	2320      	movs	r3, #32
20021734:	62e3      	str	r3, [r4, #44]	@ 0x2c
20021736:	f000 f937 	bl	200219a8 <sd1_wait_read>
2002173a:	6823      	ldr	r3, [r4, #0]
2002173c:	0618      	lsls	r0, r3, #24
2002173e:	d4f5      	bmi.n	2002172c <sdio_emmc_init+0x17c>
20021740:	6823      	ldr	r3, [r4, #0]
20021742:	0659      	lsls	r1, r3, #25
20021744:	d447      	bmi.n	200217d6 <sdio_emmc_init+0x226>
20021746:	2680      	movs	r6, #128	@ 0x80
20021748:	3e01      	subs	r6, #1
2002174a:	f8d4 3200 	ldr.w	r3, [r4, #512]	@ 0x200
2002174e:	d1fb      	bne.n	20021748 <sdio_emmc_init+0x198>
20021750:	2101      	movs	r1, #1
20021752:	4630      	mov	r0, r6
20021754:	f000 f918 	bl	20021988 <sd1_read>
20021758:	2014      	movs	r0, #20
2002175a:	f000 fbe8 	bl	20021f2e <HAL_Delay_us>
2002175e:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
20021762:	4631      	mov	r1, r6
20021764:	2011      	movs	r0, #17
20021766:	6023      	str	r3, [r4, #0]
20021768:	f000 f8c0 	bl	200218ec <sd1_send_cmd>
2002176c:	2801      	cmp	r0, #1
2002176e:	d034      	beq.n	200217da <sdio_emmc_init+0x22a>
20021770:	2802      	cmp	r0, #2
20021772:	d034      	beq.n	200217de <sdio_emmc_init+0x22e>
20021774:	ab06      	add	r3, sp, #24
20021776:	9500      	str	r5, [sp, #0]
20021778:	aa05      	add	r2, sp, #20
2002177a:	a904      	add	r1, sp, #16
2002177c:	f10d 000f 	add.w	r0, sp, #15
20021780:	f000 f8f2 	bl	20021968 <sd1_get_rsp>
20021784:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021788:	2b11      	cmp	r3, #17
2002178a:	d12a      	bne.n	200217e2 <sdio_emmc_init+0x232>
2002178c:	2320      	movs	r3, #32
2002178e:	62e3      	str	r3, [r4, #44]	@ 0x2c
20021790:	f000 f90a 	bl	200219a8 <sd1_wait_read>
20021794:	6823      	ldr	r3, [r4, #0]
20021796:	061a      	lsls	r2, r3, #24
20021798:	d425      	bmi.n	200217e6 <sdio_emmc_init+0x236>
2002179a:	6823      	ldr	r3, [r4, #0]
2002179c:	065b      	lsls	r3, r3, #25
2002179e:	d424      	bmi.n	200217ea <sdio_emmc_init+0x23a>
200217a0:	2080      	movs	r0, #128	@ 0x80
200217a2:	4b13      	ldr	r3, [pc, #76]	@ (200217f0 <sdio_emmc_init+0x240>)
200217a4:	3801      	subs	r0, #1
200217a6:	f8d3 2200 	ldr.w	r2, [r3, #512]	@ 0x200
200217aa:	d1fb      	bne.n	200217a4 <sdio_emmc_init+0x1f4>
200217ac:	e7bf      	b.n	2002172e <sdio_emmc_init+0x17e>
200217ae:	2003      	movs	r0, #3
200217b0:	e7bd      	b.n	2002172e <sdio_emmc_init+0x17e>
200217b2:	2004      	movs	r0, #4
200217b4:	e7bb      	b.n	2002172e <sdio_emmc_init+0x17e>
200217b6:	2005      	movs	r0, #5
200217b8:	e7b9      	b.n	2002172e <sdio_emmc_init+0x17e>
200217ba:	2006      	movs	r0, #6
200217bc:	e7b7      	b.n	2002172e <sdio_emmc_init+0x17e>
200217be:	2007      	movs	r0, #7
200217c0:	e7b5      	b.n	2002172e <sdio_emmc_init+0x17e>
200217c2:	2008      	movs	r0, #8
200217c4:	e7b3      	b.n	2002172e <sdio_emmc_init+0x17e>
200217c6:	2009      	movs	r0, #9
200217c8:	e7b1      	b.n	2002172e <sdio_emmc_init+0x17e>
200217ca:	200a      	movs	r0, #10
200217cc:	e7af      	b.n	2002172e <sdio_emmc_init+0x17e>
200217ce:	200b      	movs	r0, #11
200217d0:	e7ad      	b.n	2002172e <sdio_emmc_init+0x17e>
200217d2:	200c      	movs	r0, #12
200217d4:	e7ab      	b.n	2002172e <sdio_emmc_init+0x17e>
200217d6:	200e      	movs	r0, #14
200217d8:	e7a9      	b.n	2002172e <sdio_emmc_init+0x17e>
200217da:	2011      	movs	r0, #17
200217dc:	e7a7      	b.n	2002172e <sdio_emmc_init+0x17e>
200217de:	2012      	movs	r0, #18
200217e0:	e7a5      	b.n	2002172e <sdio_emmc_init+0x17e>
200217e2:	2013      	movs	r0, #19
200217e4:	e7a3      	b.n	2002172e <sdio_emmc_init+0x17e>
200217e6:	2014      	movs	r0, #20
200217e8:	e7a1      	b.n	2002172e <sdio_emmc_init+0x17e>
200217ea:	2015      	movs	r0, #21
200217ec:	e79f      	b.n	2002172e <sdio_emmc_init+0x17e>
200217ee:	bf00      	nop
200217f0:	50045000 	.word	0x50045000
200217f4:	00016700 	.word	0x00016700
200217f8:	40000080 	.word	0x40000080

200217fc <emmc_read_data>:
200217fc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20021800:	4607      	mov	r7, r0
20021802:	f04f 38ff 	mov.w	r8, #4294967295	@ 0xffffffff
20021806:	b088      	sub	sp, #32
20021808:	2000      	movs	r0, #0
2002180a:	460d      	mov	r5, r1
2002180c:	4e1d      	ldr	r6, [pc, #116]	@ (20021884 <emmc_read_data+0x88>)
2002180e:	2101      	movs	r1, #1
20021810:	4614      	mov	r4, r2
20021812:	f000 f8b9 	bl	20021988 <sd1_read>
20021816:	2014      	movs	r0, #20
20021818:	f000 fb89 	bl	20021f2e <HAL_Delay_us>
2002181c:	2011      	movs	r0, #17
2002181e:	f8c6 8000 	str.w	r8, [r6]
20021822:	0a79      	lsrs	r1, r7, #9
20021824:	f000 f862 	bl	200218ec <sd1_send_cmd>
20021828:	4440      	add	r0, r8
2002182a:	b2c0      	uxtb	r0, r0
2002182c:	2801      	cmp	r0, #1
2002182e:	d803      	bhi.n	20021838 <emmc_read_data+0x3c>
20021830:	2000      	movs	r0, #0
20021832:	b008      	add	sp, #32
20021834:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20021838:	ab07      	add	r3, sp, #28
2002183a:	9300      	str	r3, [sp, #0]
2002183c:	aa05      	add	r2, sp, #20
2002183e:	ab06      	add	r3, sp, #24
20021840:	a904      	add	r1, sp, #16
20021842:	f10d 000f 	add.w	r0, sp, #15
20021846:	f000 f88f 	bl	20021968 <sd1_get_rsp>
2002184a:	f89d 300f 	ldrb.w	r3, [sp, #15]
2002184e:	2b11      	cmp	r3, #17
20021850:	d1ee      	bne.n	20021830 <emmc_read_data+0x34>
20021852:	2320      	movs	r3, #32
20021854:	f8c6 8000 	str.w	r8, [r6]
20021858:	62f3      	str	r3, [r6, #44]	@ 0x2c
2002185a:	f000 f8a5 	bl	200219a8 <sd1_wait_read>
2002185e:	6833      	ldr	r3, [r6, #0]
20021860:	061a      	lsls	r2, r3, #24
20021862:	d4e5      	bmi.n	20021830 <emmc_read_data+0x34>
20021864:	6833      	ldr	r3, [r6, #0]
20021866:	065b      	lsls	r3, r3, #25
20021868:	d4e2      	bmi.n	20021830 <emmc_read_data+0x34>
2002186a:	f024 0303 	bic.w	r3, r4, #3
2002186e:	442b      	add	r3, r5
20021870:	429d      	cmp	r5, r3
20021872:	d101      	bne.n	20021878 <emmc_read_data+0x7c>
20021874:	4620      	mov	r0, r4
20021876:	e7dc      	b.n	20021832 <emmc_read_data+0x36>
20021878:	f8d6 2200 	ldr.w	r2, [r6, #512]	@ 0x200
2002187c:	f845 2b04 	str.w	r2, [r5], #4
20021880:	e7f6      	b.n	20021870 <emmc_read_data+0x74>
20021882:	bf00      	nop
20021884:	50045000 	.word	0x50045000

20021888 <sd1_init>:
20021888:	b510      	push	{r4, lr}
2002188a:	f04f 44a0 	mov.w	r4, #1342177280	@ 0x50000000
2002188e:	68e3      	ldr	r3, [r4, #12]
20021890:	2064      	movs	r0, #100	@ 0x64
20021892:	f023 0310 	bic.w	r3, r3, #16
20021896:	60e3      	str	r3, [r4, #12]
20021898:	f000 fb49 	bl	20021f2e <HAL_Delay_us>
2002189c:	68e3      	ldr	r3, [r4, #12]
2002189e:	4a07      	ldr	r2, [pc, #28]	@ (200218bc <sd1_init+0x34>)
200218a0:	f043 0310 	orr.w	r3, r3, #16
200218a4:	60e3      	str	r3, [r4, #12]
200218a6:	6913      	ldr	r3, [r2, #16]
200218a8:	f043 0302 	orr.w	r3, r3, #2
200218ac:	6113      	str	r3, [r2, #16]
200218ae:	f44f 7280 	mov.w	r2, #256	@ 0x100
200218b2:	4b03      	ldr	r3, [pc, #12]	@ (200218c0 <sd1_init+0x38>)
200218b4:	631a      	str	r2, [r3, #48]	@ 0x30
200218b6:	2200      	movs	r2, #0
200218b8:	63da      	str	r2, [r3, #60]	@ 0x3c
200218ba:	bd10      	pop	{r4, pc}
200218bc:	5000b000 	.word	0x5000b000
200218c0:	50045000 	.word	0x50045000

200218c4 <sd1_wait_cmd>:
200218c4:	4b08      	ldr	r3, [pc, #32]	@ (200218e8 <sd1_wait_cmd+0x24>)
200218c6:	681a      	ldr	r2, [r3, #0]
200218c8:	f012 0f0a 	tst.w	r2, #10
200218cc:	d0fb      	beq.n	200218c6 <sd1_wait_cmd+0x2>
200218ce:	2202      	movs	r2, #2
200218d0:	601a      	str	r2, [r3, #0]
200218d2:	681a      	ldr	r2, [r3, #0]
200218d4:	0712      	lsls	r2, r2, #28
200218d6:	bf5f      	itttt	pl
200218d8:	6818      	ldrpl	r0, [r3, #0]
200218da:	f3c0 0080 	ubfxpl	r0, r0, #2, #1
200218de:	0040      	lslpl	r0, r0, #1
200218e0:	b2c0      	uxtbpl	r0, r0
200218e2:	bf48      	it	mi
200218e4:	2001      	movmi	r0, #1
200218e6:	4770      	bx	lr
200218e8:	50045000 	.word	0x50045000

200218ec <sd1_send_cmd>:
200218ec:	4b0e      	ldr	r3, [pc, #56]	@ (20021928 <sd1_send_cmd+0x3c>)
200218ee:	280f      	cmp	r0, #15
200218f0:	6099      	str	r1, [r3, #8]
200218f2:	ea4f 4380 	mov.w	r3, r0, lsl #18
200218f6:	d813      	bhi.n	20021920 <sd1_send_cmd+0x34>
200218f8:	2201      	movs	r2, #1
200218fa:	f248 0111 	movw	r1, #32785	@ 0x8011
200218fe:	4082      	lsls	r2, r0
20021900:	420a      	tst	r2, r1
20021902:	d105      	bne.n	20021910 <sd1_send_cmd+0x24>
20021904:	f240 6104 	movw	r1, #1540	@ 0x604
20021908:	420a      	tst	r2, r1
2002190a:	d009      	beq.n	20021920 <sd1_send_cmd+0x34>
2002190c:	f443 3340 	orr.w	r3, r3, #196608	@ 0x30000
20021910:	4a05      	ldr	r2, [pc, #20]	@ (20021928 <sd1_send_cmd+0x3c>)
20021912:	f443 7380 	orr.w	r3, r3, #256	@ 0x100
20021916:	f043 0301 	orr.w	r3, r3, #1
2002191a:	6053      	str	r3, [r2, #4]
2002191c:	f7ff bfd2 	b.w	200218c4 <sd1_wait_cmd>
20021920:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
20021924:	e7f4      	b.n	20021910 <sd1_send_cmd+0x24>
20021926:	bf00      	nop
20021928:	50045000 	.word	0x50045000

2002192c <sd1_send_acmd>:
2002192c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002192e:	4605      	mov	r5, r0
20021930:	460f      	mov	r7, r1
20021932:	2037      	movs	r0, #55	@ 0x37
20021934:	0411      	lsls	r1, r2, #16
20021936:	f7ff ffd9 	bl	200218ec <sd1_send_cmd>
2002193a:	4604      	mov	r4, r0
2002193c:	b968      	cbnz	r0, 2002195a <sd1_send_acmd+0x2e>
2002193e:	4b08      	ldr	r3, [pc, #32]	@ (20021960 <sd1_send_acmd+0x34>)
20021940:	4e08      	ldr	r6, [pc, #32]	@ (20021964 <sd1_send_acmd+0x38>)
20021942:	ea43 4385 	orr.w	r3, r3, r5, lsl #18
20021946:	60b7      	str	r7, [r6, #8]
20021948:	6073      	str	r3, [r6, #4]
2002194a:	f7ff ffbb 	bl	200218c4 <sd1_wait_cmd>
2002194e:	2802      	cmp	r0, #2
20021950:	d104      	bne.n	2002195c <sd1_send_acmd+0x30>
20021952:	2d29      	cmp	r5, #41	@ 0x29
20021954:	d102      	bne.n	2002195c <sd1_send_acmd+0x30>
20021956:	2304      	movs	r3, #4
20021958:	6033      	str	r3, [r6, #0]
2002195a:	4620      	mov	r0, r4
2002195c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
2002195e:	bf00      	nop
20021960:	00010101 	.word	0x00010101
20021964:	50045000 	.word	0x50045000

20021968 <sd1_get_rsp>:
20021968:	b530      	push	{r4, r5, lr}
2002196a:	4c06      	ldr	r4, [pc, #24]	@ (20021984 <sd1_get_rsp+0x1c>)
2002196c:	68e5      	ldr	r5, [r4, #12]
2002196e:	7005      	strb	r5, [r0, #0]
20021970:	6920      	ldr	r0, [r4, #16]
20021972:	6008      	str	r0, [r1, #0]
20021974:	6961      	ldr	r1, [r4, #20]
20021976:	6011      	str	r1, [r2, #0]
20021978:	69a2      	ldr	r2, [r4, #24]
2002197a:	601a      	str	r2, [r3, #0]
2002197c:	69e2      	ldr	r2, [r4, #28]
2002197e:	9b03      	ldr	r3, [sp, #12]
20021980:	601a      	str	r2, [r3, #0]
20021982:	bd30      	pop	{r4, r5, pc}
20021984:	50045000 	.word	0x50045000

20021988 <sd1_read>:
20021988:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
2002198c:	4a04      	ldr	r2, [pc, #16]	@ (200219a0 <sd1_read+0x18>)
2002198e:	eb03 2341 	add.w	r3, r3, r1, lsl #9
20021992:	6293      	str	r3, [r2, #40]	@ 0x28
20021994:	4b03      	ldr	r3, [pc, #12]	@ (200219a4 <sd1_read+0x1c>)
20021996:	ea43 23c0 	orr.w	r3, r3, r0, lsl #11
2002199a:	6253      	str	r3, [r2, #36]	@ 0x24
2002199c:	4770      	bx	lr
2002199e:	bf00      	nop
200219a0:	50045000 	.word	0x50045000
200219a4:	01ff0301 	.word	0x01ff0301

200219a8 <sd1_wait_read>:
200219a8:	4b08      	ldr	r3, [pc, #32]	@ (200219cc <sd1_wait_read+0x24>)
200219aa:	681a      	ldr	r2, [r3, #0]
200219ac:	f012 0fe0 	tst.w	r2, #224	@ 0xe0
200219b0:	d0fb      	beq.n	200219aa <sd1_wait_read+0x2>
200219b2:	2220      	movs	r2, #32
200219b4:	601a      	str	r2, [r3, #0]
200219b6:	681a      	ldr	r2, [r3, #0]
200219b8:	0612      	lsls	r2, r2, #24
200219ba:	bf5f      	itttt	pl
200219bc:	6818      	ldrpl	r0, [r3, #0]
200219be:	f3c0 1080 	ubfxpl	r0, r0, #6, #1
200219c2:	0040      	lslpl	r0, r0, #1
200219c4:	b2c0      	uxtbpl	r0, r0
200219c6:	bf48      	it	mi
200219c8:	2001      	movmi	r0, #1
200219ca:	4770      	bx	lr
200219cc:	50045000 	.word	0x50045000

200219d0 <sdmmc1_sdnand>:
200219d0:	b5f0      	push	{r4, r5, r6, r7, lr}
200219d2:	b08d      	sub	sp, #52	@ 0x34
200219d4:	f7ff ff58 	bl	20021888 <sd1_init>
200219d8:	4c8f      	ldr	r4, [pc, #572]	@ (20021c18 <sdmmc1_sdnand+0x248>)
200219da:	4b90      	ldr	r3, [pc, #576]	@ (20021c1c <sdmmc1_sdnand+0x24c>)
200219dc:	2500      	movs	r5, #0
200219de:	6323      	str	r3, [r4, #48]	@ 0x30
200219e0:	6b23      	ldr	r3, [r4, #48]	@ 0x30
200219e2:	f44f 70fa 	mov.w	r0, #500	@ 0x1f4
200219e6:	f043 0302 	orr.w	r3, r3, #2
200219ea:	6323      	str	r3, [r4, #48]	@ 0x30
200219ec:	f44f 1380 	mov.w	r3, #1048576	@ 0x100000
200219f0:	62e5      	str	r5, [r4, #44]	@ 0x2c
200219f2:	6223      	str	r3, [r4, #32]
200219f4:	f000 fa9b 	bl	20021f2e <HAL_Delay_us>
200219f8:	4629      	mov	r1, r5
200219fa:	4628      	mov	r0, r5
200219fc:	f7ff ff76 	bl	200218ec <sd1_send_cmd>
20021a00:	2301      	movs	r3, #1
20021a02:	65e3      	str	r3, [r4, #92]	@ 0x5c
20021a04:	6de3      	ldr	r3, [r4, #92]	@ 0x5c
20021a06:	079a      	lsls	r2, r3, #30
20021a08:	d5fc      	bpl.n	20021a04 <sdmmc1_sdnand+0x34>
20021a0a:	2014      	movs	r0, #20
20021a0c:	f000 fa8f 	bl	20021f2e <HAL_Delay_us>
20021a10:	f44f 71d5 	mov.w	r1, #426	@ 0x1aa
20021a14:	2008      	movs	r0, #8
20021a16:	f7ff ff69 	bl	200218ec <sd1_send_cmd>
20021a1a:	3801      	subs	r0, #1
20021a1c:	b2c0      	uxtb	r0, r0
20021a1e:	2801      	cmp	r0, #1
20021a20:	d802      	bhi.n	20021a28 <sdmmc1_sdnand+0x58>
20021a22:	2038      	movs	r0, #56	@ 0x38
20021a24:	b00d      	add	sp, #52	@ 0x34
20021a26:	bdf0      	pop	{r4, r5, r6, r7, pc}
20021a28:	ac07      	add	r4, sp, #28
20021a2a:	ab06      	add	r3, sp, #24
20021a2c:	9400      	str	r4, [sp, #0]
20021a2e:	aa05      	add	r2, sp, #20
20021a30:	a904      	add	r1, sp, #16
20021a32:	f10d 000f 	add.w	r0, sp, #15
20021a36:	f7ff ff97 	bl	20021968 <sd1_get_rsp>
20021a3a:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021a3e:	2b08      	cmp	r3, #8
20021a40:	d1ef      	bne.n	20021a22 <sdmmc1_sdnand+0x52>
20021a42:	9b04      	ldr	r3, [sp, #16]
20021a44:	f5b3 7fd5 	cmp.w	r3, #426	@ 0x1aa
20021a48:	d1eb      	bne.n	20021a22 <sdmmc1_sdnand+0x52>
20021a4a:	2014      	movs	r0, #20
20021a4c:	f000 fa6f 	bl	20021f2e <HAL_Delay_us>
20021a50:	2200      	movs	r2, #0
20021a52:	2029      	movs	r0, #41	@ 0x29
20021a54:	4972      	ldr	r1, [pc, #456]	@ (20021c20 <sdmmc1_sdnand+0x250>)
20021a56:	f7ff ff69 	bl	2002192c <sd1_send_acmd>
20021a5a:	2801      	cmp	r0, #1
20021a5c:	f000 80d0 	beq.w	20021c00 <sdmmc1_sdnand+0x230>
20021a60:	ab06      	add	r3, sp, #24
20021a62:	9400      	str	r4, [sp, #0]
20021a64:	aa05      	add	r2, sp, #20
20021a66:	a904      	add	r1, sp, #16
20021a68:	f10d 000f 	add.w	r0, sp, #15
20021a6c:	f7ff ff7c 	bl	20021968 <sd1_get_rsp>
20021a70:	9b04      	ldr	r3, [sp, #16]
20021a72:	2b00      	cmp	r3, #0
20021a74:	db03      	blt.n	20021a7e <sdmmc1_sdnand+0xae>
20021a76:	2002      	movs	r0, #2
20021a78:	f000 fa59 	bl	20021f2e <HAL_Delay_us>
20021a7c:	e7e5      	b.n	20021a4a <sdmmc1_sdnand+0x7a>
20021a7e:	2014      	movs	r0, #20
20021a80:	f000 fa55 	bl	20021f2e <HAL_Delay_us>
20021a84:	2100      	movs	r1, #0
20021a86:	2002      	movs	r0, #2
20021a88:	f7ff ff30 	bl	200218ec <sd1_send_cmd>
20021a8c:	3801      	subs	r0, #1
20021a8e:	b2c0      	uxtb	r0, r0
20021a90:	2801      	cmp	r0, #1
20021a92:	f240 80b7 	bls.w	20021c04 <sdmmc1_sdnand+0x234>
20021a96:	ab08      	add	r3, sp, #32
20021a98:	aa0a      	add	r2, sp, #40	@ 0x28
20021a9a:	a90b      	add	r1, sp, #44	@ 0x2c
20021a9c:	9300      	str	r3, [sp, #0]
20021a9e:	f10d 000f 	add.w	r0, sp, #15
20021aa2:	ab09      	add	r3, sp, #36	@ 0x24
20021aa4:	f7ff ff60 	bl	20021968 <sd1_get_rsp>
20021aa8:	2014      	movs	r0, #20
20021aaa:	f000 fa40 	bl	20021f2e <HAL_Delay_us>
20021aae:	2100      	movs	r1, #0
20021ab0:	2003      	movs	r0, #3
20021ab2:	f7ff ff1b 	bl	200218ec <sd1_send_cmd>
20021ab6:	3801      	subs	r0, #1
20021ab8:	b2c0      	uxtb	r0, r0
20021aba:	2801      	cmp	r0, #1
20021abc:	d801      	bhi.n	20021ac2 <sdmmc1_sdnand+0xf2>
20021abe:	2033      	movs	r0, #51	@ 0x33
20021ac0:	e7b0      	b.n	20021a24 <sdmmc1_sdnand+0x54>
20021ac2:	ab06      	add	r3, sp, #24
20021ac4:	9400      	str	r4, [sp, #0]
20021ac6:	aa05      	add	r2, sp, #20
20021ac8:	a904      	add	r1, sp, #16
20021aca:	f10d 000f 	add.w	r0, sp, #15
20021ace:	f7ff ff4b 	bl	20021968 <sd1_get_rsp>
20021ad2:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021ad6:	2b03      	cmp	r3, #3
20021ad8:	d1f1      	bne.n	20021abe <sdmmc1_sdnand+0xee>
20021ada:	9e04      	ldr	r6, [sp, #16]
20021adc:	2014      	movs	r0, #20
20021ade:	0c35      	lsrs	r5, r6, #16
20021ae0:	042d      	lsls	r5, r5, #16
20021ae2:	f000 fa24 	bl	20021f2e <HAL_Delay_us>
20021ae6:	4629      	mov	r1, r5
20021ae8:	2009      	movs	r0, #9
20021aea:	f7ff feff 	bl	200218ec <sd1_send_cmd>
20021aee:	3801      	subs	r0, #1
20021af0:	b2c0      	uxtb	r0, r0
20021af2:	2801      	cmp	r0, #1
20021af4:	f240 8088 	bls.w	20021c08 <sdmmc1_sdnand+0x238>
20021af8:	9400      	str	r4, [sp, #0]
20021afa:	ab06      	add	r3, sp, #24
20021afc:	aa05      	add	r2, sp, #20
20021afe:	a904      	add	r1, sp, #16
20021b00:	f10d 000f 	add.w	r0, sp, #15
20021b04:	f7ff ff30 	bl	20021968 <sd1_get_rsp>
20021b08:	e9dd 2004 	ldrd	r2, r0, [sp, #16]
20021b0c:	9c06      	ldr	r4, [sp, #24]
20021b0e:	9907      	ldr	r1, [sp, #28]
20021b10:	0e23      	lsrs	r3, r4, #24
20021b12:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
20021b16:	0e01      	lsrs	r1, r0, #24
20021b18:	ea41 2104 	orr.w	r1, r1, r4, lsl #8
20021b1c:	9105      	str	r1, [sp, #20]
20021b1e:	0e11      	lsrs	r1, r2, #24
20021b20:	9304      	str	r3, [sp, #16]
20021b22:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
20021b26:	0212      	lsls	r2, r2, #8
20021b28:	0f9b      	lsrs	r3, r3, #30
20021b2a:	9106      	str	r1, [sp, #24]
20021b2c:	9207      	str	r2, [sp, #28]
20021b2e:	d01e      	beq.n	20021b6e <sdmmc1_sdnand+0x19e>
20021b30:	2b01      	cmp	r3, #1
20021b32:	d16b      	bne.n	20021c0c <sdmmc1_sdnand+0x23c>
20021b34:	2300      	movs	r3, #0
20021b36:	4a3b      	ldr	r2, [pc, #236]	@ (20021c24 <sdmmc1_sdnand+0x254>)
20021b38:	4c37      	ldr	r4, [pc, #220]	@ (20021c18 <sdmmc1_sdnand+0x248>)
20021b3a:	7013      	strb	r3, [r2, #0]
20021b3c:	f44f 63a0 	mov.w	r3, #1280	@ 0x500
20021b40:	6323      	str	r3, [r4, #48]	@ 0x30
20021b42:	6b23      	ldr	r3, [r4, #48]	@ 0x30
20021b44:	2702      	movs	r7, #2
20021b46:	f043 0302 	orr.w	r3, r3, #2
20021b4a:	6323      	str	r3, [r4, #48]	@ 0x30
20021b4c:	f04f 7300 	mov.w	r3, #33554432	@ 0x2000000
20021b50:	2014      	movs	r0, #20
20021b52:	6223      	str	r3, [r4, #32]
20021b54:	63e7      	str	r7, [r4, #60]	@ 0x3c
20021b56:	f000 f9ea 	bl	20021f2e <HAL_Delay_us>
20021b5a:	4629      	mov	r1, r5
20021b5c:	2007      	movs	r0, #7
20021b5e:	f7ff fec5 	bl	200218ec <sd1_send_cmd>
20021b62:	3801      	subs	r0, #1
20021b64:	b2c0      	uxtb	r0, r0
20021b66:	2801      	cmp	r0, #1
20021b68:	d803      	bhi.n	20021b72 <sdmmc1_sdnand+0x1a2>
20021b6a:	2037      	movs	r0, #55	@ 0x37
20021b6c:	e75a      	b.n	20021a24 <sdmmc1_sdnand+0x54>
20021b6e:	2301      	movs	r3, #1
20021b70:	e7e1      	b.n	20021b36 <sdmmc1_sdnand+0x166>
20021b72:	ad07      	add	r5, sp, #28
20021b74:	ab06      	add	r3, sp, #24
20021b76:	9500      	str	r5, [sp, #0]
20021b78:	aa05      	add	r2, sp, #20
20021b7a:	a904      	add	r1, sp, #16
20021b7c:	f10d 000f 	add.w	r0, sp, #15
20021b80:	f7ff fef2 	bl	20021968 <sd1_get_rsp>
20021b84:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021b88:	2b07      	cmp	r3, #7
20021b8a:	d1ee      	bne.n	20021b6a <sdmmc1_sdnand+0x19a>
20021b8c:	2014      	movs	r0, #20
20021b8e:	f000 f9ce 	bl	20021f2e <HAL_Delay_us>
20021b92:	4639      	mov	r1, r7
20021b94:	2006      	movs	r0, #6
20021b96:	0c32      	lsrs	r2, r6, #16
20021b98:	f7ff fec8 	bl	2002192c <sd1_send_acmd>
20021b9c:	3801      	subs	r0, #1
20021b9e:	b2c0      	uxtb	r0, r0
20021ba0:	2801      	cmp	r0, #1
20021ba2:	d935      	bls.n	20021c10 <sdmmc1_sdnand+0x240>
20021ba4:	2101      	movs	r1, #1
20021ba6:	4608      	mov	r0, r1
20021ba8:	f7ff feee 	bl	20021988 <sd1_read>
20021bac:	2014      	movs	r0, #20
20021bae:	f000 f9be 	bl	20021f2e <HAL_Delay_us>
20021bb2:	2100      	movs	r1, #0
20021bb4:	2011      	movs	r0, #17
20021bb6:	f7ff fe99 	bl	200218ec <sd1_send_cmd>
20021bba:	3801      	subs	r0, #1
20021bbc:	b2c0      	uxtb	r0, r0
20021bbe:	2801      	cmp	r0, #1
20021bc0:	d801      	bhi.n	20021bc6 <sdmmc1_sdnand+0x1f6>
20021bc2:	2052      	movs	r0, #82	@ 0x52
20021bc4:	e72e      	b.n	20021a24 <sdmmc1_sdnand+0x54>
20021bc6:	ab06      	add	r3, sp, #24
20021bc8:	9500      	str	r5, [sp, #0]
20021bca:	aa05      	add	r2, sp, #20
20021bcc:	a904      	add	r1, sp, #16
20021bce:	f10d 000f 	add.w	r0, sp, #15
20021bd2:	f7ff fec9 	bl	20021968 <sd1_get_rsp>
20021bd6:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021bda:	2b11      	cmp	r3, #17
20021bdc:	d1f1      	bne.n	20021bc2 <sdmmc1_sdnand+0x1f2>
20021bde:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
20021be2:	6023      	str	r3, [r4, #0]
20021be4:	2320      	movs	r3, #32
20021be6:	62e3      	str	r3, [r4, #44]	@ 0x2c
20021be8:	f7ff fede 	bl	200219a8 <sd1_wait_read>
20021bec:	6823      	ldr	r3, [r4, #0]
20021bee:	061b      	lsls	r3, r3, #24
20021bf0:	d410      	bmi.n	20021c14 <sdmmc1_sdnand+0x244>
20021bf2:	6823      	ldr	r3, [r4, #0]
20021bf4:	f013 0f40 	tst.w	r3, #64	@ 0x40
20021bf8:	bf14      	ite	ne
20021bfa:	2044      	movne	r0, #68	@ 0x44
20021bfc:	2001      	moveq	r0, #1
20021bfe:	e711      	b.n	20021a24 <sdmmc1_sdnand+0x54>
20021c00:	2034      	movs	r0, #52	@ 0x34
20021c02:	e70f      	b.n	20021a24 <sdmmc1_sdnand+0x54>
20021c04:	2032      	movs	r0, #50	@ 0x32
20021c06:	e70d      	b.n	20021a24 <sdmmc1_sdnand+0x54>
20021c08:	2039      	movs	r0, #57	@ 0x39
20021c0a:	e70b      	b.n	20021a24 <sdmmc1_sdnand+0x54>
20021c0c:	2054      	movs	r0, #84	@ 0x54
20021c0e:	e709      	b.n	20021a24 <sdmmc1_sdnand+0x54>
20021c10:	2036      	movs	r0, #54	@ 0x36
20021c12:	e707      	b.n	20021a24 <sdmmc1_sdnand+0x54>
20021c14:	204f      	movs	r0, #79	@ 0x4f
20021c16:	e705      	b.n	20021a24 <sdmmc1_sdnand+0x54>
20021c18:	50045000 	.word	0x50045000
20021c1c:	00016700 	.word	0x00016700
20021c20:	40ff8000 	.word	0x40ff8000
20021c24:	20042c08 	.word	0x20042c08

20021c28 <sd_read_data>:
20021c28:	b570      	push	{r4, r5, r6, lr}
20021c2a:	460d      	mov	r5, r1
20021c2c:	2101      	movs	r1, #1
20021c2e:	b088      	sub	sp, #32
20021c30:	4606      	mov	r6, r0
20021c32:	4608      	mov	r0, r1
20021c34:	4614      	mov	r4, r2
20021c36:	f7ff fea7 	bl	20021988 <sd1_read>
20021c3a:	2014      	movs	r0, #20
20021c3c:	f000 f977 	bl	20021f2e <HAL_Delay_us>
20021c40:	4b1a      	ldr	r3, [pc, #104]	@ (20021cac <sd_read_data+0x84>)
20021c42:	781b      	ldrb	r3, [r3, #0]
20021c44:	b903      	cbnz	r3, 20021c48 <sd_read_data+0x20>
20021c46:	0a76      	lsrs	r6, r6, #9
20021c48:	4631      	mov	r1, r6
20021c4a:	2011      	movs	r0, #17
20021c4c:	f7ff fe4e 	bl	200218ec <sd1_send_cmd>
20021c50:	3801      	subs	r0, #1
20021c52:	b2c0      	uxtb	r0, r0
20021c54:	2801      	cmp	r0, #1
20021c56:	d802      	bhi.n	20021c5e <sd_read_data+0x36>
20021c58:	2000      	movs	r0, #0
20021c5a:	b008      	add	sp, #32
20021c5c:	bd70      	pop	{r4, r5, r6, pc}
20021c5e:	ab07      	add	r3, sp, #28
20021c60:	9300      	str	r3, [sp, #0]
20021c62:	aa05      	add	r2, sp, #20
20021c64:	ab06      	add	r3, sp, #24
20021c66:	a904      	add	r1, sp, #16
20021c68:	f10d 000f 	add.w	r0, sp, #15
20021c6c:	f7ff fe7c 	bl	20021968 <sd1_get_rsp>
20021c70:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021c74:	2b11      	cmp	r3, #17
20021c76:	d1ef      	bne.n	20021c58 <sd_read_data+0x30>
20021c78:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
20021c7c:	4e0c      	ldr	r6, [pc, #48]	@ (20021cb0 <sd_read_data+0x88>)
20021c7e:	6033      	str	r3, [r6, #0]
20021c80:	2320      	movs	r3, #32
20021c82:	62f3      	str	r3, [r6, #44]	@ 0x2c
20021c84:	f7ff fe90 	bl	200219a8 <sd1_wait_read>
20021c88:	6833      	ldr	r3, [r6, #0]
20021c8a:	061a      	lsls	r2, r3, #24
20021c8c:	d4e4      	bmi.n	20021c58 <sd_read_data+0x30>
20021c8e:	6833      	ldr	r3, [r6, #0]
20021c90:	065b      	lsls	r3, r3, #25
20021c92:	d4e1      	bmi.n	20021c58 <sd_read_data+0x30>
20021c94:	f024 0303 	bic.w	r3, r4, #3
20021c98:	442b      	add	r3, r5
20021c9a:	429d      	cmp	r5, r3
20021c9c:	d101      	bne.n	20021ca2 <sd_read_data+0x7a>
20021c9e:	4620      	mov	r0, r4
20021ca0:	e7db      	b.n	20021c5a <sd_read_data+0x32>
20021ca2:	f8d6 2200 	ldr.w	r2, [r6, #512]	@ 0x200
20021ca6:	f845 2b04 	str.w	r2, [r5], #4
20021caa:	e7f6      	b.n	20021c9a <sd_read_data+0x72>
20021cac:	20042c08 	.word	0x20042c08
20021cb0:	50045000 	.word	0x50045000

20021cb4 <sifli_hash_calculate>:
20021cb4:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20021cb8:	460c      	mov	r4, r1
20021cba:	4615      	mov	r5, r2
20021cbc:	4699      	mov	r9, r3
20021cbe:	4680      	mov	r8, r0
20021cc0:	2800      	cmp	r0, #0
20021cc2:	d03f      	beq.n	20021d44 <sifli_hash_calculate+0x90>
20021cc4:	2900      	cmp	r1, #0
20021cc6:	d03d      	beq.n	20021d44 <sifli_hash_calculate+0x90>
20021cc8:	2a00      	cmp	r2, #0
20021cca:	d03b      	beq.n	20021d44 <sifli_hash_calculate+0x90>
20021ccc:	2b03      	cmp	r3, #3
20021cce:	d839      	bhi.n	20021d44 <sifli_hash_calculate+0x90>
20021cd0:	f000 fa40 	bl	20022154 <HAL_HASH_reset>
20021cd4:	2200      	movs	r2, #0
20021cd6:	4649      	mov	r1, r9
20021cd8:	4610      	mov	r0, r2
20021cda:	f000 fa43 	bl	20022164 <HAL_HASH_init>
20021cde:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
20021ce2:	d929      	bls.n	20021d38 <sifli_hash_calculate+0x84>
20021ce4:	2600      	movs	r6, #0
20021ce6:	4637      	mov	r7, r6
20021ce8:	f506 7680 	add.w	r6, r6, #256	@ 0x100
20021cec:	42a6      	cmp	r6, r4
20021cee:	bf34      	ite	cc
20021cf0:	f04f 0a00 	movcc.w	sl, #0
20021cf4:	f04f 0a01 	movcs.w	sl, #1
20021cf8:	b14f      	cbz	r7, 20021d0e <sifli_hash_calculate+0x5a>
20021cfa:	f000 fa2b 	bl	20022154 <HAL_HASH_reset>
20021cfe:	42a6      	cmp	r6, r4
20021d00:	bf2c      	ite	cs
20021d02:	463a      	movcs	r2, r7
20021d04:	2200      	movcc	r2, #0
20021d06:	4649      	mov	r1, r9
20021d08:	4628      	mov	r0, r5
20021d0a:	f000 fa2b 	bl	20022164 <HAL_HASH_init>
20021d0e:	42a6      	cmp	r6, r4
20021d10:	bf34      	ite	cc
20021d12:	f44f 7180 	movcc.w	r1, #256	@ 0x100
20021d16:	1be1      	subcs	r1, r4, r7
20021d18:	4652      	mov	r2, sl
20021d1a:	eb08 0007 	add.w	r0, r8, r7
20021d1e:	f000 f9fb 	bl	20022118 <HAL_HASH_run>
20021d22:	4628      	mov	r0, r5
20021d24:	f000 fa4c 	bl	200221c0 <HAL_HASH_result>
20021d28:	42a6      	cmp	r6, r4
20021d2a:	d3dc      	bcc.n	20021ce6 <sifli_hash_calculate+0x32>
20021d2c:	4628      	mov	r0, r5
20021d2e:	f000 fa47 	bl	200221c0 <HAL_HASH_result>
20021d32:	2000      	movs	r0, #0
20021d34:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20021d38:	2201      	movs	r2, #1
20021d3a:	4621      	mov	r1, r4
20021d3c:	4640      	mov	r0, r8
20021d3e:	f000 f9eb 	bl	20022118 <HAL_HASH_run>
20021d42:	e7f3      	b.n	20021d2c <sifli_hash_calculate+0x78>
20021d44:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20021d48:	e7f4      	b.n	20021d34 <sifli_hash_calculate+0x80>

20021d4a <sifli_hash_verify>:
20021d4a:	b5f0      	push	{r4, r5, r6, r7, lr}
20021d4c:	4605      	mov	r5, r0
20021d4e:	b089      	sub	sp, #36	@ 0x24
20021d50:	460f      	mov	r7, r1
20021d52:	4614      	mov	r4, r2
20021d54:	2100      	movs	r1, #0
20021d56:	2220      	movs	r2, #32
20021d58:	4668      	mov	r0, sp
20021d5a:	461e      	mov	r6, r3
20021d5c:	f008 fd56 	bl	2002a80c <memset>
20021d60:	b91d      	cbnz	r5, 20021d6a <sifli_hash_verify+0x20>
20021d62:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20021d66:	b009      	add	sp, #36	@ 0x24
20021d68:	bdf0      	pop	{r4, r5, r6, r7, pc}
20021d6a:	2c00      	cmp	r4, #0
20021d6c:	d0f9      	beq.n	20021d62 <sifli_hash_verify+0x18>
20021d6e:	2302      	movs	r3, #2
20021d70:	466a      	mov	r2, sp
20021d72:	4639      	mov	r1, r7
20021d74:	4628      	mov	r0, r5
20021d76:	f7ff ff9d 	bl	20021cb4 <sifli_hash_calculate>
20021d7a:	2800      	cmp	r0, #0
20021d7c:	d1f1      	bne.n	20021d62 <sifli_hash_verify+0x18>
20021d7e:	4632      	mov	r2, r6
20021d80:	4621      	mov	r1, r4
20021d82:	4668      	mov	r0, sp
20021d84:	f008 fd32 	bl	2002a7ec <memcmp>
20021d88:	3800      	subs	r0, #0
20021d8a:	bf18      	it	ne
20021d8c:	2001      	movne	r0, #1
20021d8e:	4240      	negs	r0, r0
20021d90:	e7e9      	b.n	20021d66 <sifli_hash_verify+0x1c>

20021d92 <sifli_sigkey_pub_verify>:
20021d92:	2300      	movs	r3, #0
20021d94:	b537      	push	{r0, r1, r2, r4, r5, lr}
20021d96:	4604      	mov	r4, r0
20021d98:	460d      	mov	r5, r1
20021d9a:	2208      	movs	r2, #8
20021d9c:	4669      	mov	r1, sp
20021d9e:	2003      	movs	r0, #3
20021da0:	e9cd 3300 	strd	r3, r3, [sp]
20021da4:	f7ff f92c 	bl	20021000 <sifli_hw_efuse_read>
20021da8:	2808      	cmp	r0, #8
20021daa:	4603      	mov	r3, r0
20021dac:	d106      	bne.n	20021dbc <sifli_sigkey_pub_verify+0x2a>
20021dae:	466a      	mov	r2, sp
20021db0:	4629      	mov	r1, r5
20021db2:	4620      	mov	r0, r4
20021db4:	f7ff ffc9 	bl	20021d4a <sifli_hash_verify>
20021db8:	b003      	add	sp, #12
20021dba:	bd30      	pop	{r4, r5, pc}
20021dbc:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20021dc0:	e7fa      	b.n	20021db8 <sifli_sigkey_pub_verify+0x26>

20021dc2 <sifli_img_sig_hash_verify>:
20021dc2:	b5f0      	push	{r4, r5, r6, r7, lr}
20021dc4:	461f      	mov	r7, r3
20021dc6:	4616      	mov	r6, r2
20021dc8:	b08d      	sub	sp, #52	@ 0x34
20021dca:	2220      	movs	r2, #32
20021dcc:	4604      	mov	r4, r0
20021dce:	460d      	mov	r5, r1
20021dd0:	a804      	add	r0, sp, #16
20021dd2:	2100      	movs	r1, #0
20021dd4:	f008 fd1a 	bl	2002a80c <memset>
20021dd8:	2302      	movs	r3, #2
20021dda:	4639      	mov	r1, r7
20021ddc:	4630      	mov	r0, r6
20021dde:	aa04      	add	r2, sp, #16
20021de0:	f7ff ff68 	bl	20021cb4 <sifli_hash_calculate>
20021de4:	b118      	cbz	r0, 20021dee <sifli_img_sig_hash_verify+0x2c>
20021de6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20021dea:	b00d      	add	sp, #52	@ 0x34
20021dec:	bdf0      	pop	{r4, r5, r6, r7, pc}
20021dee:	a802      	add	r0, sp, #8
20021df0:	f007 fa68 	bl	200292c4 <mbedtls_pk_init>
20021df4:	4629      	mov	r1, r5
20021df6:	f44f 7293 	mov.w	r2, #294	@ 0x126
20021dfa:	a802      	add	r0, sp, #8
20021dfc:	f007 fb6e 	bl	200294dc <mbedtls_pk_parse_public_key>
20021e00:	4601      	mov	r1, r0
20021e02:	2800      	cmp	r0, #0
20021e04:	d1ef      	bne.n	20021de6 <sifli_img_sig_hash_verify+0x24>
20021e06:	2206      	movs	r2, #6
20021e08:	9803      	ldr	r0, [sp, #12]
20021e0a:	f007 fc0e 	bl	2002962a <mbedtls_rsa_set_padding>
20021e0e:	f44f 7380 	mov.w	r3, #256	@ 0x100
20021e12:	2106      	movs	r1, #6
20021e14:	e9cd 4300 	strd	r4, r3, [sp]
20021e18:	aa04      	add	r2, sp, #16
20021e1a:	2320      	movs	r3, #32
20021e1c:	a802      	add	r0, sp, #8
20021e1e:	f007 fa85 	bl	2002932c <mbedtls_pk_verify>
20021e22:	3800      	subs	r0, #0
20021e24:	bf18      	it	ne
20021e26:	2001      	movne	r0, #1
20021e28:	4240      	negs	r0, r0
20021e2a:	e7de      	b.n	20021dea <sifli_img_sig_hash_verify+0x28>

20021e2c <sifli_secboot_exception>:
20021e2c:	2801      	cmp	r0, #1
20021e2e:	b508      	push	{r3, lr}
20021e30:	d004      	beq.n	20021e3c <sifli_secboot_exception+0x10>
20021e32:	2802      	cmp	r0, #2
20021e34:	d009      	beq.n	20021e4a <sifli_secboot_exception+0x1e>
20021e36:	2213      	movs	r2, #19
20021e38:	4905      	ldr	r1, [pc, #20]	@ (20021e50 <sifli_secboot_exception+0x24>)
20021e3a:	e001      	b.n	20021e40 <sifli_secboot_exception+0x14>
20021e3c:	2217      	movs	r2, #23
20021e3e:	4905      	ldr	r1, [pc, #20]	@ (20021e54 <sifli_secboot_exception+0x28>)
20021e40:	4805      	ldr	r0, [pc, #20]	@ (20021e58 <sifli_secboot_exception+0x2c>)
20021e42:	f7fe fa29 	bl	20020298 <boot_uart_tx>
20021e46:	e7fe      	b.n	20021e46 <sifli_secboot_exception+0x1a>
20021e48:	bd08      	pop	{r3, pc}
20021e4a:	2219      	movs	r2, #25
20021e4c:	4903      	ldr	r1, [pc, #12]	@ (20021e5c <sifli_secboot_exception+0x30>)
20021e4e:	e7f7      	b.n	20021e40 <sifli_secboot_exception+0x14>
20021e50:	2002a98a 	.word	0x2002a98a
20021e54:	2002a958 	.word	0x2002a958
20021e58:	50084000 	.word	0x50084000
20021e5c:	2002a970 	.word	0x2002a970

20021e60 <__aeabi_unwind_cpp_pr0>:
20021e60:	2000      	movs	r0, #0
20021e62:	4770      	bx	lr

20021e64 <HAL_GetTick>:
20021e64:	4b01      	ldr	r3, [pc, #4]	@ (20021e6c <HAL_GetTick+0x8>)
20021e66:	6818      	ldr	r0, [r3, #0]
20021e68:	4770      	bx	lr
20021e6a:	bf00      	nop
20021e6c:	2004cb40 	.word	0x2004cb40

20021e70 <HAL_Delay_us_>:
20021e70:	b513      	push	{r0, r1, r4, lr}
20021e72:	9001      	str	r0, [sp, #4]
20021e74:	9b01      	ldr	r3, [sp, #4]
20021e76:	4c1a      	ldr	r4, [pc, #104]	@ (20021ee0 <HAL_Delay_us_+0x70>)
20021e78:	b133      	cbz	r3, 20021e88 <HAL_Delay_us_+0x18>
20021e7a:	6823      	ldr	r3, [r4, #0]
20021e7c:	b123      	cbz	r3, 20021e88 <HAL_Delay_us_+0x18>
20021e7e:	9b01      	ldr	r3, [sp, #4]
20021e80:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
20021e84:	d90c      	bls.n	20021ea0 <HAL_Delay_us_+0x30>
20021e86:	e7fe      	b.n	20021e86 <HAL_Delay_us_+0x16>
20021e88:	2000      	movs	r0, #0
20021e8a:	f003 f81d 	bl	20024ec8 <HAL_RCC_GetHCLKFreq>
20021e8e:	4b15      	ldr	r3, [pc, #84]	@ (20021ee4 <HAL_Delay_us_+0x74>)
20021e90:	fbb0 f0f3 	udiv	r0, r0, r3
20021e94:	9b01      	ldr	r3, [sp, #4]
20021e96:	6020      	str	r0, [r4, #0]
20021e98:	2b00      	cmp	r3, #0
20021e9a:	d1f0      	bne.n	20021e7e <HAL_Delay_us_+0xe>
20021e9c:	b002      	add	sp, #8
20021e9e:	bd10      	pop	{r4, pc}
20021ea0:	9b01      	ldr	r3, [sp, #4]
20021ea2:	2b00      	cmp	r3, #0
20021ea4:	d0fa      	beq.n	20021e9c <HAL_Delay_us_+0x2c>
20021ea6:	4a10      	ldr	r2, [pc, #64]	@ (20021ee8 <HAL_Delay_us_+0x78>)
20021ea8:	6813      	ldr	r3, [r2, #0]
20021eaa:	f013 0301 	ands.w	r3, r3, #1
20021eae:	d10d      	bne.n	20021ecc <HAL_Delay_us_+0x5c>
20021eb0:	480e      	ldr	r0, [pc, #56]	@ (20021eec <HAL_Delay_us_+0x7c>)
20021eb2:	f8d0 10fc 	ldr.w	r1, [r0, #252]	@ 0xfc
20021eb6:	f041 7180 	orr.w	r1, r1, #16777216	@ 0x1000000
20021eba:	f8c0 10fc 	str.w	r1, [r0, #252]	@ 0xfc
20021ebe:	6053      	str	r3, [r2, #4]
20021ec0:	6813      	ldr	r3, [r2, #0]
20021ec2:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
20021ec6:	f043 0301 	orr.w	r3, r3, #1
20021eca:	6013      	str	r3, [r2, #0]
20021ecc:	9b01      	ldr	r3, [sp, #4]
20021ece:	6822      	ldr	r2, [r4, #0]
20021ed0:	4905      	ldr	r1, [pc, #20]	@ (20021ee8 <HAL_Delay_us_+0x78>)
20021ed2:	4353      	muls	r3, r2
20021ed4:	6848      	ldr	r0, [r1, #4]
20021ed6:	684a      	ldr	r2, [r1, #4]
20021ed8:	1a12      	subs	r2, r2, r0
20021eda:	429a      	cmp	r2, r3
20021edc:	d3fb      	bcc.n	20021ed6 <HAL_Delay_us_+0x66>
20021ede:	e7dd      	b.n	20021e9c <HAL_Delay_us_+0x2c>
20021ee0:	2004cb3c 	.word	0x2004cb3c
20021ee4:	000f4240 	.word	0x000f4240
20021ee8:	e0001000 	.word	0xe0001000
20021eec:	e000ed00 	.word	0xe000ed00

20021ef0 <HAL_Delay_us2_>:
20021ef0:	b537      	push	{r0, r1, r2, r4, r5, lr}
20021ef2:	9001      	str	r0, [sp, #4]
20021ef4:	f04f 20e0 	mov.w	r0, #3758153728	@ 0xe000e000
20021ef8:	f44f 727a 	mov.w	r2, #1000	@ 0x3e8
20021efc:	6944      	ldr	r4, [r0, #20]
20021efe:	9b01      	ldr	r3, [sp, #4]
20021f00:	4363      	muls	r3, r4
20021f02:	fbb3 f3f2 	udiv	r3, r3, r2
20021f06:	9301      	str	r3, [sp, #4]
20021f08:	2300      	movs	r3, #0
20021f0a:	6981      	ldr	r1, [r0, #24]
20021f0c:	6982      	ldr	r2, [r0, #24]
20021f0e:	428a      	cmp	r2, r1
20021f10:	d0fc      	beq.n	20021f0c <HAL_Delay_us2_+0x1c>
20021f12:	bf25      	ittet	cs
20021f14:	1aa5      	subcs	r5, r4, r2
20021f16:	195b      	addcs	r3, r3, r5
20021f18:	185b      	addcc	r3, r3, r1
20021f1a:	185b      	addcs	r3, r3, r1
20021f1c:	9901      	ldr	r1, [sp, #4]
20021f1e:	bf38      	it	cc
20021f20:	1a9b      	subcc	r3, r3, r2
20021f22:	4299      	cmp	r1, r3
20021f24:	d801      	bhi.n	20021f2a <HAL_Delay_us2_+0x3a>
20021f26:	b003      	add	sp, #12
20021f28:	bd30      	pop	{r4, r5, pc}
20021f2a:	4611      	mov	r1, r2
20021f2c:	e7ee      	b.n	20021f0c <HAL_Delay_us2_+0x1c>

20021f2e <HAL_Delay_us>:
20021f2e:	4603      	mov	r3, r0
20021f30:	b570      	push	{r4, r5, r6, lr}
20021f32:	b1b8      	cbz	r0, 20021f64 <HAL_Delay_us+0x36>
20021f34:	f242 7510 	movw	r5, #10000	@ 0x2710
20021f38:	f04f 26e0 	mov.w	r6, #3758153728	@ 0xe000e000
20021f3c:	42ab      	cmp	r3, r5
20021f3e:	bf84      	itt	hi
20021f40:	f5a3 541c 	subhi.w	r4, r3, #9984	@ 0x2700
20021f44:	f242 7310 	movwhi	r3, #10000	@ 0x2710
20021f48:	6932      	ldr	r2, [r6, #16]
20021f4a:	bf98      	it	ls
20021f4c:	2400      	movls	r4, #0
20021f4e:	4618      	mov	r0, r3
20021f50:	bf88      	it	hi
20021f52:	3c10      	subhi	r4, #16
20021f54:	07d3      	lsls	r3, r2, #31
20021f56:	d408      	bmi.n	20021f6a <HAL_Delay_us+0x3c>
20021f58:	f7ff ff8a 	bl	20021e70 <HAL_Delay_us_>
20021f5c:	4623      	mov	r3, r4
20021f5e:	2c00      	cmp	r4, #0
20021f60:	d1ec      	bne.n	20021f3c <HAL_Delay_us+0xe>
20021f62:	e001      	b.n	20021f68 <HAL_Delay_us+0x3a>
20021f64:	f7ff ff84 	bl	20021e70 <HAL_Delay_us_>
20021f68:	bd70      	pop	{r4, r5, r6, pc}
20021f6a:	f7ff ffc1 	bl	20021ef0 <HAL_Delay_us2_>
20021f6e:	e7f5      	b.n	20021f5c <HAL_Delay_us+0x2e>

20021f70 <WDT_IRQHandler>:
20021f70:	4770      	bx	lr

20021f72 <DBG_Trigger_IRQHandler>:
20021f72:	4770      	bx	lr

20021f74 <NMI_Handler>:
20021f74:	b508      	push	{r3, lr}
20021f76:	4b05      	ldr	r3, [pc, #20]	@ (20021f8c <NMI_Handler+0x18>)
20021f78:	6a1b      	ldr	r3, [r3, #32]
20021f7a:	005b      	lsls	r3, r3, #1
20021f7c:	d502      	bpl.n	20021f84 <NMI_Handler+0x10>
20021f7e:	f7ff fff8 	bl	20021f72 <DBG_Trigger_IRQHandler>
20021f82:	bd08      	pop	{r3, pc}
20021f84:	f7ff fff4 	bl	20021f70 <WDT_IRQHandler>
20021f88:	e7fb      	b.n	20021f82 <NMI_Handler+0xe>
20021f8a:	bf00      	nop
20021f8c:	5000b000 	.word	0x5000b000

20021f90 <HAL_AES_run_help>:
20021f90:	b510      	push	{r4, lr}
20021f92:	f101 4470 	add.w	r4, r1, #4026531840	@ 0xf0000000
20021f96:	f1b4 5f80 	cmp.w	r4, #268435456	@ 0x10000000
20021f9a:	4c0e      	ldr	r4, [pc, #56]	@ (20021fd4 <HAL_AES_run_help+0x44>)
20021f9c:	bf38      	it	cc
20021f9e:	f101 41a0 	addcc.w	r1, r1, #1342177280	@ 0x50000000
20021fa2:	6161      	str	r1, [r4, #20]
20021fa4:	f102 4170 	add.w	r1, r2, #4026531840	@ 0xf0000000
20021fa8:	f1b1 5f80 	cmp.w	r1, #268435456	@ 0x10000000
20021fac:	f103 030f 	add.w	r3, r3, #15
20021fb0:	ea4f 1323 	mov.w	r3, r3, asr #4
20021fb4:	bf38      	it	cc
20021fb6:	f102 42a0 	addcc.w	r2, r2, #1342177280	@ 0x50000000
20021fba:	61a2      	str	r2, [r4, #24]
20021fbc:	61e3      	str	r3, [r4, #28]
20021fbe:	6923      	ldr	r3, [r4, #16]
20021fc0:	b108      	cbz	r0, 20021fc6 <HAL_AES_run_help+0x36>
20021fc2:	ea43 13c0 	orr.w	r3, r3, r0, lsl #7
20021fc6:	4a03      	ldr	r2, [pc, #12]	@ (20021fd4 <HAL_AES_run_help+0x44>)
20021fc8:	6123      	str	r3, [r4, #16]
20021fca:	6813      	ldr	r3, [r2, #0]
20021fcc:	f043 0301 	orr.w	r3, r3, #1
20021fd0:	6013      	str	r3, [r2, #0]
20021fd2:	bd10      	pop	{r4, pc}
20021fd4:	5000d000 	.word	0x5000d000

20021fd8 <HAL_HASH_run_help.isra.0>:
20021fd8:	f100 4370 	add.w	r3, r0, #4026531840	@ 0xf0000000
20021fdc:	b510      	push	{r4, lr}
20021fde:	f1b3 5f80 	cmp.w	r3, #268435456	@ 0x10000000
20021fe2:	4c09      	ldr	r4, [pc, #36]	@ (20022008 <HAL_HASH_run_help.isra.0+0x30>)
20021fe4:	bf38      	it	cc
20021fe6:	f100 40a0 	addcc.w	r0, r0, #1342177280	@ 0x50000000
20021fea:	6560      	str	r0, [r4, #84]	@ 0x54
20021fec:	65a1      	str	r1, [r4, #88]	@ 0x58
20021fee:	b11a      	cbz	r2, 20021ff8 <HAL_HASH_run_help.isra.0+0x20>
20021ff0:	6d23      	ldr	r3, [r4, #80]	@ 0x50
20021ff2:	f043 0308 	orr.w	r3, r3, #8
20021ff6:	6523      	str	r3, [r4, #80]	@ 0x50
20021ff8:	6d21      	ldr	r1, [r4, #80]	@ 0x50
20021ffa:	4804      	ldr	r0, [pc, #16]	@ (2002200c <HAL_HASH_run_help.isra.0+0x34>)
20021ffc:	f000 fca4 	bl	20022948 <HAL_DBG_printf>
20022000:	2304      	movs	r3, #4
20022002:	6023      	str	r3, [r4, #0]
20022004:	bd10      	pop	{r4, pc}
20022006:	bf00      	nop
20022008:	5000d000 	.word	0x5000d000
2002200c:	2002a99e 	.word	0x2002a99e

20022010 <HAL_AES_reset>:
20022010:	2202      	movs	r2, #2
20022012:	2000      	movs	r0, #0
20022014:	4b01      	ldr	r3, [pc, #4]	@ (2002201c <HAL_AES_reset+0xc>)
20022016:	601a      	str	r2, [r3, #0]
20022018:	6018      	str	r0, [r3, #0]
2002201a:	4770      	bx	lr
2002201c:	5000d000 	.word	0x5000d000

20022020 <HAL_AES_init>:
20022020:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20022022:	461f      	mov	r7, r3
20022024:	4b1e      	ldr	r3, [pc, #120]	@ (200220a0 <HAL_AES_init+0x80>)
20022026:	4604      	mov	r4, r0
20022028:	685b      	ldr	r3, [r3, #4]
2002202a:	4616      	mov	r6, r2
2002202c:	07db      	lsls	r3, r3, #31
2002202e:	d501      	bpl.n	20022034 <HAL_AES_init+0x14>
20022030:	f7ff ffee 	bl	20022010 <HAL_AES_reset>
20022034:	fab4 f084 	clz	r0, r4
20022038:	2918      	cmp	r1, #24
2002203a:	ea4f 1050 	mov.w	r0, r0, lsr #5
2002203e:	ea4f 1540 	mov.w	r5, r0, lsl #5
20022042:	d01c      	beq.n	2002207e <HAL_AES_init+0x5e>
20022044:	2920      	cmp	r1, #32
20022046:	d01c      	beq.n	20022082 <HAL_AES_init+0x62>
20022048:	2910      	cmp	r1, #16
2002204a:	d125      	bne.n	20022098 <HAL_AES_init+0x78>
2002204c:	2300      	movs	r3, #0
2002204e:	b164      	cbz	r4, 2002206a <HAL_AES_init+0x4a>
20022050:	4620      	mov	r0, r4
20022052:	4a14      	ldr	r2, [pc, #80]	@ (200220a4 <HAL_AES_init+0x84>)
20022054:	f021 0103 	bic.w	r1, r1, #3
20022058:	4421      	add	r1, r4
2002205a:	1b12      	subs	r2, r2, r4
2002205c:	1814      	adds	r4, r2, r0
2002205e:	f850 cb04 	ldr.w	ip, [r0], #4
20022062:	4281      	cmp	r1, r0
20022064:	f8c4 c000 	str.w	ip, [r4]
20022068:	d1f8      	bne.n	2002205c <HAL_AES_init+0x3c>
2002206a:	ea47 0005 	orr.w	r0, r7, r5
2002206e:	ea40 00c3 	orr.w	r0, r0, r3, lsl #3
20022072:	4b0b      	ldr	r3, [pc, #44]	@ (200220a0 <HAL_AES_init+0x80>)
20022074:	6118      	str	r0, [r3, #16]
20022076:	b107      	cbz	r7, 2002207a <HAL_AES_init+0x5a>
20022078:	b92e      	cbnz	r6, 20022086 <HAL_AES_init+0x66>
2002207a:	2000      	movs	r0, #0
2002207c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
2002207e:	2301      	movs	r3, #1
20022080:	e7e5      	b.n	2002204e <HAL_AES_init+0x2e>
20022082:	2302      	movs	r3, #2
20022084:	e7e3      	b.n	2002204e <HAL_AES_init+0x2e>
20022086:	6832      	ldr	r2, [r6, #0]
20022088:	621a      	str	r2, [r3, #32]
2002208a:	6872      	ldr	r2, [r6, #4]
2002208c:	625a      	str	r2, [r3, #36]	@ 0x24
2002208e:	68b2      	ldr	r2, [r6, #8]
20022090:	629a      	str	r2, [r3, #40]	@ 0x28
20022092:	68f2      	ldr	r2, [r6, #12]
20022094:	62da      	str	r2, [r3, #44]	@ 0x2c
20022096:	e7f0      	b.n	2002207a <HAL_AES_init+0x5a>
20022098:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
2002209c:	e7ee      	b.n	2002207c <HAL_AES_init+0x5c>
2002209e:	bf00      	nop
200220a0:	5000d000 	.word	0x5000d000
200220a4:	5000d030 	.word	0x5000d030

200220a8 <HAL_AES_run>:
200220a8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
200220aa:	2708      	movs	r7, #8
200220ac:	4e17      	ldr	r6, [pc, #92]	@ (2002210c <HAL_AES_run+0x64>)
200220ae:	4614      	mov	r4, r2
200220b0:	461d      	mov	r5, r3
200220b2:	f8c6 7088 	str.w	r7, [r6, #136]	@ 0x88
200220b6:	f3bf 8f4f 	dsb	sy
200220ba:	f3bf 8f6f 	isb	sy
200220be:	2700      	movs	r7, #0
200220c0:	4e13      	ldr	r6, [pc, #76]	@ (20022110 <HAL_AES_run+0x68>)
200220c2:	60f7      	str	r7, [r6, #12]
200220c4:	f7ff ff64 	bl	20021f90 <HAL_AES_run_help>
200220c8:	6873      	ldr	r3, [r6, #4]
200220ca:	07db      	lsls	r3, r3, #31
200220cc:	d4fc      	bmi.n	200220c8 <HAL_AES_run+0x20>
200220ce:	68b0      	ldr	r0, [r6, #8]
200220d0:	f000 0006 	and.w	r0, r0, #6
200220d4:	3800      	subs	r0, #0
200220d6:	bf18      	it	ne
200220d8:	2001      	movne	r0, #1
200220da:	f1b4 4fc0 	cmp.w	r4, #1610612736	@ 0x60000000
200220de:	d313      	bcc.n	20022108 <HAL_AES_run+0x60>
200220e0:	2d00      	cmp	r5, #0
200220e2:	dd11      	ble.n	20022108 <HAL_AES_run+0x60>
200220e4:	f004 031f 	and.w	r3, r4, #31
200220e8:	442b      	add	r3, r5
200220ea:	f3bf 8f4f 	dsb	sy
200220ee:	4622      	mov	r2, r4
200220f0:	4c08      	ldr	r4, [pc, #32]	@ (20022114 <HAL_AES_run+0x6c>)
200220f2:	4413      	add	r3, r2
200220f4:	f8c4 225c 	str.w	r2, [r4, #604]	@ 0x25c
200220f8:	3220      	adds	r2, #32
200220fa:	1a99      	subs	r1, r3, r2
200220fc:	2900      	cmp	r1, #0
200220fe:	dcf9      	bgt.n	200220f4 <HAL_AES_run+0x4c>
20022100:	f3bf 8f4f 	dsb	sy
20022104:	f3bf 8f6f 	isb	sy
20022108:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
2002210a:	bf00      	nop
2002210c:	e000e100 	.word	0xe000e100
20022110:	5000d000 	.word	0x5000d000
20022114:	e000ed00 	.word	0xe000ed00

20022118 <HAL_HASH_run>:
20022118:	b510      	push	{r4, lr}
2002211a:	2408      	movs	r4, #8
2002211c:	4b0b      	ldr	r3, [pc, #44]	@ (2002214c <HAL_HASH_run+0x34>)
2002211e:	f8c3 4088 	str.w	r4, [r3, #136]	@ 0x88
20022122:	f3bf 8f4f 	dsb	sy
20022126:	f3bf 8f6f 	isb	sy
2002212a:	f7ff ff55 	bl	20021fd8 <HAL_HASH_run_help.isra.0>
2002212e:	4b08      	ldr	r3, [pc, #32]	@ (20022150 <HAL_HASH_run+0x38>)
20022130:	685a      	ldr	r2, [r3, #4]
20022132:	0752      	lsls	r2, r2, #29
20022134:	d4fc      	bmi.n	20022130 <HAL_HASH_run+0x18>
20022136:	689a      	ldr	r2, [r3, #8]
20022138:	f002 0238 	and.w	r2, r2, #56	@ 0x38
2002213c:	609a      	str	r2, [r3, #8]
2002213e:	6898      	ldr	r0, [r3, #8]
20022140:	f000 0030 	and.w	r0, r0, #48	@ 0x30
20022144:	3800      	subs	r0, #0
20022146:	bf18      	it	ne
20022148:	2001      	movne	r0, #1
2002214a:	bd10      	pop	{r4, pc}
2002214c:	e000e100 	.word	0xe000e100
20022150:	5000d000 	.word	0x5000d000

20022154 <HAL_HASH_reset>:
20022154:	2208      	movs	r2, #8
20022156:	2000      	movs	r0, #0
20022158:	4b01      	ldr	r3, [pc, #4]	@ (20022160 <HAL_HASH_reset+0xc>)
2002215a:	601a      	str	r2, [r3, #0]
2002215c:	6018      	str	r0, [r3, #0]
2002215e:	4770      	bx	lr
20022160:	5000d000 	.word	0x5000d000

20022164 <HAL_HASH_init>:
20022164:	0693      	lsls	r3, r2, #26
20022166:	b570      	push	{r4, r5, r6, lr}
20022168:	4606      	mov	r6, r0
2002216a:	460c      	mov	r4, r1
2002216c:	4615      	mov	r5, r2
2002216e:	d11c      	bne.n	200221aa <HAL_HASH_init+0x46>
20022170:	2903      	cmp	r1, #3
20022172:	d81a      	bhi.n	200221aa <HAL_HASH_init+0x46>
20022174:	f7ff ffee 	bl	20022154 <HAL_HASH_reset>
20022178:	b13e      	cbz	r6, 2002218a <HAL_HASH_init+0x26>
2002217a:	4b0d      	ldr	r3, [pc, #52]	@ (200221b0 <HAL_HASH_init+0x4c>)
2002217c:	480d      	ldr	r0, [pc, #52]	@ (200221b4 <HAL_HASH_init+0x50>)
2002217e:	5c5a      	ldrb	r2, [r3, r1]
20022180:	4631      	mov	r1, r6
20022182:	f008 fb5d 	bl	2002a840 <memcpy>
20022186:	f044 0420 	orr.w	r4, r4, #32
2002218a:	4b0b      	ldr	r3, [pc, #44]	@ (200221b8 <HAL_HASH_init+0x54>)
2002218c:	f044 0180 	orr.w	r1, r4, #128	@ 0x80
20022190:	6519      	str	r1, [r3, #80]	@ 0x50
20022192:	b11d      	cbz	r5, 2002219c <HAL_HASH_init+0x38>
20022194:	f8c3 509c 	str.w	r5, [r3, #156]	@ 0x9c
20022198:	f444 71c0 	orr.w	r1, r4, #384	@ 0x180
2002219c:	4807      	ldr	r0, [pc, #28]	@ (200221bc <HAL_HASH_init+0x58>)
2002219e:	462a      	mov	r2, r5
200221a0:	6519      	str	r1, [r3, #80]	@ 0x50
200221a2:	f000 fbd1 	bl	20022948 <HAL_DBG_printf>
200221a6:	2000      	movs	r0, #0
200221a8:	bd70      	pop	{r4, r5, r6, pc}
200221aa:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
200221ae:	e7fb      	b.n	200221a8 <HAL_HASH_init+0x44>
200221b0:	2002b034 	.word	0x2002b034
200221b4:	5000d05c 	.word	0x5000d05c
200221b8:	5000d000 	.word	0x5000d000
200221bc:	2002a9b1 	.word	0x2002a9b1

200221c0 <HAL_HASH_result>:
200221c0:	b510      	push	{r4, lr}
200221c2:	4c08      	ldr	r4, [pc, #32]	@ (200221e4 <HAL_HASH_result+0x24>)
200221c4:	4a08      	ldr	r2, [pc, #32]	@ (200221e8 <HAL_HASH_result+0x28>)
200221c6:	6d23      	ldr	r3, [r4, #80]	@ 0x50
200221c8:	f104 017c 	add.w	r1, r4, #124	@ 0x7c
200221cc:	f003 0307 	and.w	r3, r3, #7
200221d0:	5cd2      	ldrb	r2, [r2, r3]
200221d2:	f008 fb35 	bl	2002a840 <memcpy>
200221d6:	f8d4 10a4 	ldr.w	r1, [r4, #164]	@ 0xa4
200221da:	4804      	ldr	r0, [pc, #16]	@ (200221ec <HAL_HASH_result+0x2c>)
200221dc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
200221e0:	f000 bbb2 	b.w	20022948 <HAL_DBG_printf>
200221e4:	5000d000 	.word	0x5000d000
200221e8:	2002b034 	.word	0x2002b034
200221ec:	2002a9e5 	.word	0x2002a9e5

200221f0 <HAL_NVIC_EnableIRQ>:
200221f0:	2800      	cmp	r0, #0
200221f2:	da00      	bge.n	200221f6 <HAL_NVIC_EnableIRQ+0x6>
200221f4:	e7fe      	b.n	200221f4 <HAL_NVIC_EnableIRQ+0x4>
200221f6:	2301      	movs	r3, #1
200221f8:	0941      	lsrs	r1, r0, #5
200221fa:	4a03      	ldr	r2, [pc, #12]	@ (20022208 <HAL_NVIC_EnableIRQ+0x18>)
200221fc:	f000 001f 	and.w	r0, r0, #31
20022200:	4083      	lsls	r3, r0
20022202:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
20022206:	4770      	bx	lr
20022208:	e000e100 	.word	0xe000e100

2002220c <HAL_NVIC_DisableIRQ>:
2002220c:	2800      	cmp	r0, #0
2002220e:	da00      	bge.n	20022212 <HAL_NVIC_DisableIRQ+0x6>
20022210:	e7fe      	b.n	20022210 <HAL_NVIC_DisableIRQ+0x4>
20022212:	2201      	movs	r2, #1
20022214:	4906      	ldr	r1, [pc, #24]	@ (20022230 <HAL_NVIC_DisableIRQ+0x24>)
20022216:	0943      	lsrs	r3, r0, #5
20022218:	f000 001f 	and.w	r0, r0, #31
2002221c:	4082      	lsls	r2, r0
2002221e:	3320      	adds	r3, #32
20022220:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
20022224:	f3bf 8f4f 	dsb	sy
20022228:	f3bf 8f6f 	isb	sy
2002222c:	4770      	bx	lr
2002222e:	bf00      	nop
20022230:	e000e100 	.word	0xe000e100

20022234 <DMA_Init>:
20022234:	2302      	movs	r3, #2
20022236:	b530      	push	{r4, r5, lr}
20022238:	6a42      	ldr	r2, [r0, #36]	@ 0x24
2002223a:	f880 302d 	strb.w	r3, [r0, #45]	@ 0x2d
2002223e:	6803      	ldr	r3, [r0, #0]
20022240:	611a      	str	r2, [r3, #16]
20022242:	e9d0 3402 	ldrd	r3, r4, [r0, #8]
20022246:	4323      	orrs	r3, r4
20022248:	6904      	ldr	r4, [r0, #16]
2002224a:	6801      	ldr	r1, [r0, #0]
2002224c:	4323      	orrs	r3, r4
2002224e:	6944      	ldr	r4, [r0, #20]
20022250:	680a      	ldr	r2, [r1, #0]
20022252:	4323      	orrs	r3, r4
20022254:	6984      	ldr	r4, [r0, #24]
20022256:	f36f 120e 	bfc	r2, #4, #11
2002225a:	4323      	orrs	r3, r4
2002225c:	69c4      	ldr	r4, [r0, #28]
2002225e:	4323      	orrs	r3, r4
20022260:	6a04      	ldr	r4, [r0, #32]
20022262:	4323      	orrs	r3, r4
20022264:	4313      	orrs	r3, r2
20022266:	600b      	str	r3, [r1, #0]
20022268:	6883      	ldr	r3, [r0, #8]
2002226a:	f5b3 4f80 	cmp.w	r3, #16384	@ 0x4000
2002226e:	d018      	beq.n	200222a2 <DMA_Init+0x6e>
20022270:	6cc1      	ldr	r1, [r0, #76]	@ 0x4c
20022272:	6c82      	ldr	r2, [r0, #72]	@ 0x48
20022274:	f3c1 0387 	ubfx	r3, r1, #2, #8
20022278:	06c9      	lsls	r1, r1, #27
2002227a:	d41b      	bmi.n	200222b4 <DMA_Init+0x80>
2002227c:	243f      	movs	r4, #63	@ 0x3f
2002227e:	f003 0307 	and.w	r3, r3, #7
20022282:	f8d2 10a8 	ldr.w	r1, [r2, #168]	@ 0xa8
20022286:	00db      	lsls	r3, r3, #3
20022288:	409c      	lsls	r4, r3
2002228a:	ea21 0104 	bic.w	r1, r1, r4
2002228e:	f8c2 10a8 	str.w	r1, [r2, #168]	@ 0xa8
20022292:	6c81      	ldr	r1, [r0, #72]	@ 0x48
20022294:	6842      	ldr	r2, [r0, #4]
20022296:	f8d1 40a8 	ldr.w	r4, [r1, #168]	@ 0xa8
2002229a:	409a      	lsls	r2, r3
2002229c:	4322      	orrs	r2, r4
2002229e:	f8c1 20a8 	str.w	r2, [r1, #168]	@ 0xa8
200222a2:	6982      	ldr	r2, [r0, #24]
200222a4:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
200222a8:	d018      	beq.n	200222dc <DMA_Init+0xa8>
200222aa:	f5b2 6f00 	cmp.w	r2, #2048	@ 0x800
200222ae:	d01f      	beq.n	200222f0 <DMA_Init+0xbc>
200222b0:	b1aa      	cbz	r2, 200222de <DMA_Init+0xaa>
200222b2:	e7fe      	b.n	200222b2 <DMA_Init+0x7e>
200222b4:	243f      	movs	r4, #63	@ 0x3f
200222b6:	f003 0303 	and.w	r3, r3, #3
200222ba:	f8d2 10ac 	ldr.w	r1, [r2, #172]	@ 0xac
200222be:	00db      	lsls	r3, r3, #3
200222c0:	409c      	lsls	r4, r3
200222c2:	ea21 0104 	bic.w	r1, r1, r4
200222c6:	f8c2 10ac 	str.w	r1, [r2, #172]	@ 0xac
200222ca:	6c81      	ldr	r1, [r0, #72]	@ 0x48
200222cc:	6842      	ldr	r2, [r0, #4]
200222ce:	f8d1 40ac 	ldr.w	r4, [r1, #172]	@ 0xac
200222d2:	409a      	lsls	r2, r3
200222d4:	4322      	orrs	r2, r4
200222d6:	f8c1 20ac 	str.w	r2, [r1, #172]	@ 0xac
200222da:	e7e2      	b.n	200222a2 <DMA_Init+0x6e>
200222dc:	2201      	movs	r2, #1
200222de:	6943      	ldr	r3, [r0, #20]
200222e0:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
200222e4:	d006      	beq.n	200222f4 <DMA_Init+0xc0>
200222e6:	f5b3 7f00 	cmp.w	r3, #512	@ 0x200
200222ea:	d02b      	beq.n	20022344 <DMA_Init+0x110>
200222ec:	b11b      	cbz	r3, 200222f6 <DMA_Init+0xc2>
200222ee:	e7fe      	b.n	200222ee <DMA_Init+0xba>
200222f0:	2202      	movs	r2, #2
200222f2:	e7f4      	b.n	200222de <DMA_Init+0xaa>
200222f4:	2301      	movs	r3, #1
200222f6:	6901      	ldr	r1, [r0, #16]
200222f8:	f1a1 0480 	sub.w	r4, r1, #128	@ 0x80
200222fc:	4261      	negs	r1, r4
200222fe:	4161      	adcs	r1, r4
20022300:	68c4      	ldr	r4, [r0, #12]
20022302:	f1a4 0540 	sub.w	r5, r4, #64	@ 0x40
20022306:	426c      	negs	r4, r5
20022308:	416c      	adcs	r4, r5
2002230a:	6885      	ldr	r5, [r0, #8]
2002230c:	2d10      	cmp	r5, #16
2002230e:	bf1f      	itttt	ne
20022310:	f880 1065 	strbne.w	r1, [r0, #101]	@ 0x65
20022314:	4619      	movne	r1, r3
20022316:	4613      	movne	r3, r2
20022318:	460a      	movne	r2, r1
2002231a:	f880 3067 	strb.w	r3, [r0, #103]	@ 0x67
2002231e:	f880 2066 	strb.w	r2, [r0, #102]	@ 0x66
20022322:	f04f 0300 	mov.w	r3, #0
20022326:	f04f 0201 	mov.w	r2, #1
2002232a:	6443      	str	r3, [r0, #68]	@ 0x44
2002232c:	bf06      	itte	eq
2002232e:	f880 4065 	strbeq.w	r4, [r0, #101]	@ 0x65
20022332:	f880 1064 	strbeq.w	r1, [r0, #100]	@ 0x64
20022336:	f880 4064 	strbne.w	r4, [r0, #100]	@ 0x64
2002233a:	f880 202d 	strb.w	r2, [r0, #45]	@ 0x2d
2002233e:	f880 302c 	strb.w	r3, [r0, #44]	@ 0x2c
20022342:	bd30      	pop	{r4, r5, pc}
20022344:	2302      	movs	r3, #2
20022346:	e7d6      	b.n	200222f6 <DMA_Init+0xc2>

20022348 <DMA_AllocChannel>:
20022348:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002234a:	4b2e      	ldr	r3, [pc, #184]	@ (20022404 <DMA_AllocChannel+0xbc>)
2002234c:	6802      	ldr	r2, [r0, #0]
2002234e:	4413      	add	r3, r2
20022350:	2ba0      	cmp	r3, #160	@ 0xa0
20022352:	d904      	bls.n	2002235e <DMA_AllocChannel+0x16>
20022354:	4b2c      	ldr	r3, [pc, #176]	@ (20022408 <DMA_AllocChannel+0xc0>)
20022356:	4413      	add	r3, r2
20022358:	2ba0      	cmp	r3, #160	@ 0xa0
2002235a:	d90f      	bls.n	2002237c <DMA_AllocChannel+0x34>
2002235c:	e7fe      	b.n	2002235c <DMA_AllocChannel+0x14>
2002235e:	2632      	movs	r6, #50	@ 0x32
20022360:	f8df c0b0 	ldr.w	ip, [pc, #176]	@ 20022414 <DMA_AllocChannel+0xcc>
20022364:	4b29      	ldr	r3, [pc, #164]	@ (2002240c <DMA_AllocChannel+0xc4>)
20022366:	f3ef 8710 	mrs	r7, PRIMASK
2002236a:	2201      	movs	r2, #1
2002236c:	f382 8810 	msr	PRIMASK, r2
20022370:	6cc5      	ldr	r5, [r0, #76]	@ 0x4c
20022372:	2d1f      	cmp	r5, #31
20022374:	ea4f 0495 	mov.w	r4, r5, lsr #2
20022378:	d905      	bls.n	20022386 <DMA_AllocChannel+0x3e>
2002237a:	e7fe      	b.n	2002237a <DMA_AllocChannel+0x32>
2002237c:	2602      	movs	r6, #2
2002237e:	f8df c098 	ldr.w	ip, [pc, #152]	@ 20022418 <DMA_AllocChannel+0xd0>
20022382:	4b23      	ldr	r3, [pc, #140]	@ (20022410 <DMA_AllocChannel+0xc8>)
20022384:	e7ef      	b.n	20022366 <DMA_AllocChannel+0x1e>
20022386:	eb03 05c4 	add.w	r5, r3, r4, lsl #3
2002238a:	f895 e004 	ldrb.w	lr, [r5, #4]
2002238e:	f1be 0f00 	cmp.w	lr, #0
20022392:	d032      	beq.n	200223fa <DMA_AllocChannel+0xb2>
20022394:	f853 2034 	ldr.w	r2, [r3, r4, lsl #3]
20022398:	4282      	cmp	r2, r0
2002239a:	d103      	bne.n	200223a4 <DMA_AllocChannel+0x5c>
2002239c:	f387 8810 	msr	PRIMASK, r7
200223a0:	2002      	movs	r0, #2
200223a2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
200223a4:	2200      	movs	r2, #0
200223a6:	791c      	ldrb	r4, [r3, #4]
200223a8:	461d      	mov	r5, r3
200223aa:	bb04      	cbnz	r4, 200223ee <DMA_AllocChannel+0xa6>
200223ac:	2301      	movs	r3, #1
200223ae:	712b      	strb	r3, [r5, #4]
200223b0:	2314      	movs	r3, #20
200223b2:	fb03 c302 	mla	r3, r3, r2, ip
200223b6:	4416      	add	r6, r2
200223b8:	0092      	lsls	r2, r2, #2
200223ba:	b274      	sxtb	r4, r6
200223bc:	6003      	str	r3, [r0, #0]
200223be:	64c2      	str	r2, [r0, #76]	@ 0x4c
200223c0:	f387 8810 	msr	PRIMASK, r7
200223c4:	b121      	cbz	r1, 200223d0 <DMA_AllocChannel+0x88>
200223c6:	682b      	ldr	r3, [r5, #0]
200223c8:	4283      	cmp	r3, r0
200223ca:	d001      	beq.n	200223d0 <DMA_AllocChannel+0x88>
200223cc:	f7ff ff32 	bl	20022234 <DMA_Init>
200223d0:	6028      	str	r0, [r5, #0]
200223d2:	6a83      	ldr	r3, [r0, #40]	@ 0x28
200223d4:	f104 4260 	add.w	r2, r4, #3758096384	@ 0xe0000000
200223d8:	015b      	lsls	r3, r3, #5
200223da:	b2db      	uxtb	r3, r3
200223dc:	f502 4261 	add.w	r2, r2, #57600	@ 0xe100
200223e0:	4620      	mov	r0, r4
200223e2:	f882 3300 	strb.w	r3, [r2, #768]	@ 0x300
200223e6:	f7ff ff03 	bl	200221f0 <HAL_NVIC_EnableIRQ>
200223ea:	2000      	movs	r0, #0
200223ec:	e7d9      	b.n	200223a2 <DMA_AllocChannel+0x5a>
200223ee:	3201      	adds	r2, #1
200223f0:	2a08      	cmp	r2, #8
200223f2:	f103 0308 	add.w	r3, r3, #8
200223f6:	d1d6      	bne.n	200223a6 <DMA_AllocChannel+0x5e>
200223f8:	e7d0      	b.n	2002239c <DMA_AllocChannel+0x54>
200223fa:	4434      	add	r4, r6
200223fc:	712a      	strb	r2, [r5, #4]
200223fe:	b264      	sxtb	r4, r4
20022400:	e7de      	b.n	200223c0 <DMA_AllocChannel+0x78>
20022402:	bf00      	nop
20022404:	aff7eff8 	.word	0xaff7eff8
20022408:	bfffeff8 	.word	0xbfffeff8
2002240c:	2004cb84 	.word	0x2004cb84
20022410:	2004cb44 	.word	0x2004cb44
20022414:	50081008 	.word	0x50081008
20022418:	40001008 	.word	0x40001008

2002241c <DMA_FreeChannel.isra.0>:
2002241c:	b538      	push	{r3, r4, r5, lr}
2002241e:	4a13      	ldr	r2, [pc, #76]	@ (2002246c <DMA_FreeChannel.isra.0+0x50>)
20022420:	6c83      	ldr	r3, [r0, #72]	@ 0x48
20022422:	4293      	cmp	r3, r2
20022424:	d003      	beq.n	2002242e <DMA_FreeChannel.isra.0+0x12>
20022426:	4a12      	ldr	r2, [pc, #72]	@ (20022470 <DMA_FreeChannel.isra.0+0x54>)
20022428:	4293      	cmp	r3, r2
2002242a:	d008      	beq.n	2002243e <DMA_FreeChannel.isra.0+0x22>
2002242c:	e7fe      	b.n	2002242c <DMA_FreeChannel.isra.0+0x10>
2002242e:	2132      	movs	r1, #50	@ 0x32
20022430:	4a10      	ldr	r2, [pc, #64]	@ (20022474 <DMA_FreeChannel.isra.0+0x58>)
20022432:	6cc4      	ldr	r4, [r0, #76]	@ 0x4c
20022434:	2c1f      	cmp	r4, #31
20022436:	ea4f 0394 	mov.w	r3, r4, lsr #2
2002243a:	d903      	bls.n	20022444 <DMA_FreeChannel.isra.0+0x28>
2002243c:	e7fe      	b.n	2002243c <DMA_FreeChannel.isra.0+0x20>
2002243e:	2102      	movs	r1, #2
20022440:	4a0d      	ldr	r2, [pc, #52]	@ (20022478 <DMA_FreeChannel.isra.0+0x5c>)
20022442:	e7f6      	b.n	20022432 <DMA_FreeChannel.isra.0+0x16>
20022444:	f3ef 8410 	mrs	r4, PRIMASK
20022448:	2501      	movs	r5, #1
2002244a:	f385 8810 	msr	PRIMASK, r5
2002244e:	eb02 05c3 	add.w	r5, r2, r3, lsl #3
20022452:	f852 2033 	ldr.w	r2, [r2, r3, lsl #3]
20022456:	4290      	cmp	r0, r2
20022458:	d105      	bne.n	20022466 <DMA_FreeChannel.isra.0+0x4a>
2002245a:	1858      	adds	r0, r3, r1
2002245c:	b240      	sxtb	r0, r0
2002245e:	f7ff fed5 	bl	2002220c <HAL_NVIC_DisableIRQ>
20022462:	2300      	movs	r3, #0
20022464:	712b      	strb	r3, [r5, #4]
20022466:	f384 8810 	msr	PRIMASK, r4
2002246a:	bd38      	pop	{r3, r4, r5, pc}
2002246c:	50081000 	.word	0x50081000
20022470:	40001000 	.word	0x40001000
20022474:	2004cb84 	.word	0x2004cb84
20022478:	2004cb44 	.word	0x2004cb44

2002247c <HAL_DMA_Init>:
2002247c:	b538      	push	{r3, r4, r5, lr}
2002247e:	4604      	mov	r4, r0
20022480:	2800      	cmp	r0, #0
20022482:	d053      	beq.n	2002252c <HAL_DMA_Init+0xb0>
20022484:	6883      	ldr	r3, [r0, #8]
20022486:	f033 0210 	bics.w	r2, r3, #16
2002248a:	d003      	beq.n	20022494 <HAL_DMA_Init+0x18>
2002248c:	f5b3 4f80 	cmp.w	r3, #16384	@ 0x4000
20022490:	d000      	beq.n	20022494 <HAL_DMA_Init+0x18>
20022492:	e7fe      	b.n	20022492 <HAL_DMA_Init+0x16>
20022494:	68e3      	ldr	r3, [r4, #12]
20022496:	f033 0340 	bics.w	r3, r3, #64	@ 0x40
2002249a:	d000      	beq.n	2002249e <HAL_DMA_Init+0x22>
2002249c:	e7fe      	b.n	2002249c <HAL_DMA_Init+0x20>
2002249e:	6923      	ldr	r3, [r4, #16]
200224a0:	f033 0380 	bics.w	r3, r3, #128	@ 0x80
200224a4:	d000      	beq.n	200224a8 <HAL_DMA_Init+0x2c>
200224a6:	e7fe      	b.n	200224a6 <HAL_DMA_Init+0x2a>
200224a8:	6963      	ldr	r3, [r4, #20]
200224aa:	f433 7280 	bics.w	r2, r3, #256	@ 0x100
200224ae:	d003      	beq.n	200224b8 <HAL_DMA_Init+0x3c>
200224b0:	f5b3 7f00 	cmp.w	r3, #512	@ 0x200
200224b4:	d000      	beq.n	200224b8 <HAL_DMA_Init+0x3c>
200224b6:	e7fe      	b.n	200224b6 <HAL_DMA_Init+0x3a>
200224b8:	69a3      	ldr	r3, [r4, #24]
200224ba:	f433 6280 	bics.w	r2, r3, #1024	@ 0x400
200224be:	d003      	beq.n	200224c8 <HAL_DMA_Init+0x4c>
200224c0:	f5b3 6f00 	cmp.w	r3, #2048	@ 0x800
200224c4:	d000      	beq.n	200224c8 <HAL_DMA_Init+0x4c>
200224c6:	e7fe      	b.n	200224c6 <HAL_DMA_Init+0x4a>
200224c8:	69e3      	ldr	r3, [r4, #28]
200224ca:	f033 0320 	bics.w	r3, r3, #32
200224ce:	d000      	beq.n	200224d2 <HAL_DMA_Init+0x56>
200224d0:	e7fe      	b.n	200224d0 <HAL_DMA_Init+0x54>
200224d2:	6a23      	ldr	r3, [r4, #32]
200224d4:	f433 5340 	bics.w	r3, r3, #12288	@ 0x3000
200224d8:	d000      	beq.n	200224dc <HAL_DMA_Init+0x60>
200224da:	e7fe      	b.n	200224da <HAL_DMA_Init+0x5e>
200224dc:	6863      	ldr	r3, [r4, #4]
200224de:	2b3f      	cmp	r3, #63	@ 0x3f
200224e0:	d900      	bls.n	200224e4 <HAL_DMA_Init+0x68>
200224e2:	e7fe      	b.n	200224e2 <HAL_DMA_Init+0x66>
200224e4:	6822      	ldr	r2, [r4, #0]
200224e6:	4b13      	ldr	r3, [pc, #76]	@ (20022534 <HAL_DMA_Init+0xb8>)
200224e8:	4413      	add	r3, r2
200224ea:	2b8c      	cmp	r3, #140	@ 0x8c
200224ec:	d813      	bhi.n	20022516 <HAL_DMA_Init+0x9a>
200224ee:	2214      	movs	r2, #20
200224f0:	fbb3 f3f2 	udiv	r3, r3, r2
200224f4:	009b      	lsls	r3, r3, #2
200224f6:	64e3      	str	r3, [r4, #76]	@ 0x4c
200224f8:	4b0f      	ldr	r3, [pc, #60]	@ (20022538 <HAL_DMA_Init+0xbc>)
200224fa:	64a3      	str	r3, [r4, #72]	@ 0x48
200224fc:	2100      	movs	r1, #0
200224fe:	4620      	mov	r0, r4
20022500:	f7ff ff22 	bl	20022348 <DMA_AllocChannel>
20022504:	4605      	mov	r5, r0
20022506:	b998      	cbnz	r0, 20022530 <HAL_DMA_Init+0xb4>
20022508:	4620      	mov	r0, r4
2002250a:	f7ff fe93 	bl	20022234 <DMA_Init>
2002250e:	f7ff ff85 	bl	2002241c <DMA_FreeChannel.isra.0>
20022512:	4628      	mov	r0, r5
20022514:	bd38      	pop	{r3, r4, r5, pc}
20022516:	4b09      	ldr	r3, [pc, #36]	@ (2002253c <HAL_DMA_Init+0xc0>)
20022518:	4413      	add	r3, r2
2002251a:	2b8c      	cmp	r3, #140	@ 0x8c
2002251c:	d8ee      	bhi.n	200224fc <HAL_DMA_Init+0x80>
2002251e:	2214      	movs	r2, #20
20022520:	fbb3 f3f2 	udiv	r3, r3, r2
20022524:	009b      	lsls	r3, r3, #2
20022526:	64e3      	str	r3, [r4, #76]	@ 0x4c
20022528:	4b05      	ldr	r3, [pc, #20]	@ (20022540 <HAL_DMA_Init+0xc4>)
2002252a:	e7e6      	b.n	200224fa <HAL_DMA_Init+0x7e>
2002252c:	2501      	movs	r5, #1
2002252e:	e7f0      	b.n	20022512 <HAL_DMA_Init+0x96>
20022530:	2502      	movs	r5, #2
20022532:	e7ee      	b.n	20022512 <HAL_DMA_Init+0x96>
20022534:	aff7eff8 	.word	0xaff7eff8
20022538:	50081000 	.word	0x50081000
2002253c:	bfffeff8 	.word	0xbfffeff8
20022540:	40001000 	.word	0x40001000

20022544 <HAL_DMA_DeInit>:
20022544:	b510      	push	{r4, lr}
20022546:	4604      	mov	r4, r0
20022548:	2800      	cmp	r0, #0
2002254a:	d051      	beq.n	200225f0 <HAL_DMA_DeInit+0xac>
2002254c:	6802      	ldr	r2, [r0, #0]
2002254e:	6813      	ldr	r3, [r2, #0]
20022550:	f023 0301 	bic.w	r3, r3, #1
20022554:	6013      	str	r3, [r2, #0]
20022556:	6802      	ldr	r2, [r0, #0]
20022558:	4b26      	ldr	r3, [pc, #152]	@ (200225f4 <HAL_DMA_DeInit+0xb0>)
2002255a:	4413      	add	r3, r2
2002255c:	2b8c      	cmp	r3, #140	@ 0x8c
2002255e:	d82f      	bhi.n	200225c0 <HAL_DMA_DeInit+0x7c>
20022560:	2114      	movs	r1, #20
20022562:	fbb3 f3f1 	udiv	r3, r3, r1
20022566:	009b      	lsls	r3, r3, #2
20022568:	64c3      	str	r3, [r0, #76]	@ 0x4c
2002256a:	4b23      	ldr	r3, [pc, #140]	@ (200225f8 <HAL_DMA_DeInit+0xb4>)
2002256c:	64a3      	str	r3, [r4, #72]	@ 0x48
2002256e:	2300      	movs	r3, #0
20022570:	6013      	str	r3, [r2, #0]
20022572:	e9d4 1312 	ldrd	r1, r3, [r4, #72]	@ 0x48
20022576:	f003 021c 	and.w	r2, r3, #28
2002257a:	2301      	movs	r3, #1
2002257c:	4093      	lsls	r3, r2
2002257e:	604b      	str	r3, [r1, #4]
20022580:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
20022582:	6ca1      	ldr	r1, [r4, #72]	@ 0x48
20022584:	2b0f      	cmp	r3, #15
20022586:	ea4f 0293 	mov.w	r2, r3, lsr #2
2002258a:	d824      	bhi.n	200225d6 <HAL_DMA_DeInit+0x92>
2002258c:	203f      	movs	r0, #63	@ 0x3f
2002258e:	005b      	lsls	r3, r3, #1
20022590:	f8d1 20a8 	ldr.w	r2, [r1, #168]	@ 0xa8
20022594:	f003 0338 	and.w	r3, r3, #56	@ 0x38
20022598:	fa00 f303 	lsl.w	r3, r0, r3
2002259c:	ea22 0303 	bic.w	r3, r2, r3
200225a0:	f8c1 30a8 	str.w	r3, [r1, #168]	@ 0xa8
200225a4:	4620      	mov	r0, r4
200225a6:	f7ff ff39 	bl	2002241c <DMA_FreeChannel.isra.0>
200225aa:	2000      	movs	r0, #0
200225ac:	e9c4 000d 	strd	r0, r0, [r4, #52]	@ 0x34
200225b0:	e9c4 000f 	strd	r0, r0, [r4, #60]	@ 0x3c
200225b4:	6460      	str	r0, [r4, #68]	@ 0x44
200225b6:	f884 002c 	strb.w	r0, [r4, #44]	@ 0x2c
200225ba:	f884 002d 	strb.w	r0, [r4, #45]	@ 0x2d
200225be:	bd10      	pop	{r4, pc}
200225c0:	4b0e      	ldr	r3, [pc, #56]	@ (200225fc <HAL_DMA_DeInit+0xb8>)
200225c2:	4413      	add	r3, r2
200225c4:	2b8c      	cmp	r3, #140	@ 0x8c
200225c6:	d8d2      	bhi.n	2002256e <HAL_DMA_DeInit+0x2a>
200225c8:	2114      	movs	r1, #20
200225ca:	fbb3 f3f1 	udiv	r3, r3, r1
200225ce:	009b      	lsls	r3, r3, #2
200225d0:	64c3      	str	r3, [r0, #76]	@ 0x4c
200225d2:	4b0b      	ldr	r3, [pc, #44]	@ (20022600 <HAL_DMA_DeInit+0xbc>)
200225d4:	e7ca      	b.n	2002256c <HAL_DMA_DeInit+0x28>
200225d6:	f002 0303 	and.w	r3, r2, #3
200225da:	223f      	movs	r2, #63	@ 0x3f
200225dc:	f8d1 00ac 	ldr.w	r0, [r1, #172]	@ 0xac
200225e0:	00db      	lsls	r3, r3, #3
200225e2:	fa02 f303 	lsl.w	r3, r2, r3
200225e6:	ea20 0303 	bic.w	r3, r0, r3
200225ea:	f8c1 30ac 	str.w	r3, [r1, #172]	@ 0xac
200225ee:	e7d9      	b.n	200225a4 <HAL_DMA_DeInit+0x60>
200225f0:	2001      	movs	r0, #1
200225f2:	e7e4      	b.n	200225be <HAL_DMA_DeInit+0x7a>
200225f4:	aff7eff8 	.word	0xaff7eff8
200225f8:	50081000 	.word	0x50081000
200225fc:	bfffeff8 	.word	0xbfffeff8
20022600:	40001000 	.word	0x40001000

20022604 <HAL_DMA_PollForTransfer>:
20022604:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
20022608:	f890 302d 	ldrb.w	r3, [r0, #45]	@ 0x2d
2002260c:	4617      	mov	r7, r2
2002260e:	2b02      	cmp	r3, #2
20022610:	4604      	mov	r4, r0
20022612:	4688      	mov	r8, r1
20022614:	b2da      	uxtb	r2, r3
20022616:	d005      	beq.n	20022624 <HAL_DMA_PollForTransfer+0x20>
20022618:	2304      	movs	r3, #4
2002261a:	6443      	str	r3, [r0, #68]	@ 0x44
2002261c:	2300      	movs	r3, #0
2002261e:	f884 302c 	strb.w	r3, [r4, #44]	@ 0x2c
20022622:	e006      	b.n	20022632 <HAL_DMA_PollForTransfer+0x2e>
20022624:	6803      	ldr	r3, [r0, #0]
20022626:	681b      	ldr	r3, [r3, #0]
20022628:	0699      	lsls	r1, r3, #26
2002262a:	d505      	bpl.n	20022638 <HAL_DMA_PollForTransfer+0x34>
2002262c:	f44f 7380 	mov.w	r3, #256	@ 0x100
20022630:	6443      	str	r3, [r0, #68]	@ 0x44
20022632:	2001      	movs	r0, #1
20022634:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
20022638:	6cc5      	ldr	r5, [r0, #76]	@ 0x4c
2002263a:	f005 051c 	and.w	r5, r5, #28
2002263e:	f1b8 0f00 	cmp.w	r8, #0
20022642:	d123      	bne.n	2002268c <HAL_DMA_PollForTransfer+0x88>
20022644:	fa02 f505 	lsl.w	r5, r2, r5
20022648:	f7ff fc0c 	bl	20021e64 <HAL_GetTick>
2002264c:	f04f 0a08 	mov.w	sl, #8
20022650:	4681      	mov	r9, r0
20022652:	e9d4 6312 	ldrd	r6, r3, [r4, #72]	@ 0x48
20022656:	f003 031c 	and.w	r3, r3, #28
2002265a:	fa0a f103 	lsl.w	r1, sl, r3
2002265e:	6832      	ldr	r2, [r6, #0]
20022660:	ea12 0b05 	ands.w	fp, r2, r5
20022664:	d016      	beq.n	20022694 <HAL_DMA_PollForTransfer+0x90>
20022666:	f1b8 0f00 	cmp.w	r8, #0
2002266a:	d136      	bne.n	200226da <HAL_DMA_PollForTransfer+0xd6>
2002266c:	2202      	movs	r2, #2
2002266e:	fa02 f303 	lsl.w	r3, r2, r3
20022672:	6073      	str	r3, [r6, #4]
20022674:	6d23      	ldr	r3, [r4, #80]	@ 0x50
20022676:	b92b      	cbnz	r3, 20022684 <HAL_DMA_PollForTransfer+0x80>
20022678:	4620      	mov	r0, r4
2002267a:	f7ff fecf 	bl	2002241c <DMA_FreeChannel.isra.0>
2002267e:	2301      	movs	r3, #1
20022680:	f884 302d 	strb.w	r3, [r4, #45]	@ 0x2d
20022684:	2000      	movs	r0, #0
20022686:	f884 002c 	strb.w	r0, [r4, #44]	@ 0x2c
2002268a:	e7d3      	b.n	20022634 <HAL_DMA_PollForTransfer+0x30>
2002268c:	2304      	movs	r3, #4
2002268e:	fa03 f505 	lsl.w	r5, r3, r5
20022692:	e7d9      	b.n	20022648 <HAL_DMA_PollForTransfer+0x44>
20022694:	6832      	ldr	r2, [r6, #0]
20022696:	4211      	tst	r1, r2
20022698:	d00c      	beq.n	200226b4 <HAL_DMA_PollForTransfer+0xb0>
2002269a:	2501      	movs	r5, #1
2002269c:	fa05 f303 	lsl.w	r3, r5, r3
200226a0:	6073      	str	r3, [r6, #4]
200226a2:	4620      	mov	r0, r4
200226a4:	6465      	str	r5, [r4, #68]	@ 0x44
200226a6:	f7ff feb9 	bl	2002241c <DMA_FreeChannel.isra.0>
200226aa:	f884 502d 	strb.w	r5, [r4, #45]	@ 0x2d
200226ae:	f884 b02c 	strb.w	fp, [r4, #44]	@ 0x2c
200226b2:	e7be      	b.n	20022632 <HAL_DMA_PollForTransfer+0x2e>
200226b4:	1c7a      	adds	r2, r7, #1
200226b6:	d0d2      	beq.n	2002265e <HAL_DMA_PollForTransfer+0x5a>
200226b8:	f7ff fbd4 	bl	20021e64 <HAL_GetTick>
200226bc:	eba0 0009 	sub.w	r0, r0, r9
200226c0:	42b8      	cmp	r0, r7
200226c2:	d801      	bhi.n	200226c8 <HAL_DMA_PollForTransfer+0xc4>
200226c4:	2f00      	cmp	r7, #0
200226c6:	d1c4      	bne.n	20022652 <HAL_DMA_PollForTransfer+0x4e>
200226c8:	2320      	movs	r3, #32
200226ca:	4620      	mov	r0, r4
200226cc:	6463      	str	r3, [r4, #68]	@ 0x44
200226ce:	f7ff fea5 	bl	2002241c <DMA_FreeChannel.isra.0>
200226d2:	2301      	movs	r3, #1
200226d4:	f884 302d 	strb.w	r3, [r4, #45]	@ 0x2d
200226d8:	e7a0      	b.n	2002261c <HAL_DMA_PollForTransfer+0x18>
200226da:	2204      	movs	r2, #4
200226dc:	fa02 f303 	lsl.w	r3, r2, r3
200226e0:	6073      	str	r3, [r6, #4]
200226e2:	e7cf      	b.n	20022684 <HAL_DMA_PollForTransfer+0x80>

200226e4 <DMA_Remap>:
200226e4:	b530      	push	{r4, r5, lr}
200226e6:	4b15      	ldr	r3, [pc, #84]	@ (2002273c <DMA_Remap+0x58>)
200226e8:	6c84      	ldr	r4, [r0, #72]	@ 0x48
200226ea:	429c      	cmp	r4, r3
200226ec:	d11b      	bne.n	20022726 <DMA_Remap+0x42>
200226ee:	6883      	ldr	r3, [r0, #8]
200226f0:	2b10      	cmp	r3, #16
200226f2:	d002      	beq.n	200226fa <DMA_Remap+0x16>
200226f4:	f5b3 4f80 	cmp.w	r3, #16384	@ 0x4000
200226f8:	d108      	bne.n	2002270c <DMA_Remap+0x28>
200226fa:	680b      	ldr	r3, [r1, #0]
200226fc:	4c10      	ldr	r4, [pc, #64]	@ (20022740 <DMA_Remap+0x5c>)
200226fe:	f103 4560 	add.w	r5, r3, #3758096384	@ 0xe0000000
20022702:	42a5      	cmp	r5, r4
20022704:	bf98      	it	ls
20022706:	f103 6320 	addls.w	r3, r3, #167772160	@ 0xa000000
2002270a:	600b      	str	r3, [r1, #0]
2002270c:	6883      	ldr	r3, [r0, #8]
2002270e:	f433 4380 	bics.w	r3, r3, #16384	@ 0x4000
20022712:	d108      	bne.n	20022726 <DMA_Remap+0x42>
20022714:	6813      	ldr	r3, [r2, #0]
20022716:	480a      	ldr	r0, [pc, #40]	@ (20022740 <DMA_Remap+0x5c>)
20022718:	f103 4460 	add.w	r4, r3, #3758096384	@ 0xe0000000
2002271c:	4284      	cmp	r4, r0
2002271e:	bf98      	it	ls
20022720:	f103 6320 	addls.w	r3, r3, #167772160	@ 0xa000000
20022724:	6013      	str	r3, [r2, #0]
20022726:	680b      	ldr	r3, [r1, #0]
20022728:	f103 4270 	add.w	r2, r3, #4026531840	@ 0xf0000000
2002272c:	f1b2 5f80 	cmp.w	r2, #268435456	@ 0x10000000
20022730:	bf3c      	itt	cc
20022732:	f103 43a0 	addcc.w	r3, r3, #1342177280	@ 0x50000000
20022736:	600b      	strcc	r3, [r1, #0]
20022738:	bd30      	pop	{r4, r5, pc}
2002273a:	bf00      	nop
2002273c:	40001000 	.word	0x40001000
20022740:	0007fffe 	.word	0x0007fffe

20022744 <DMA_Start>:
20022744:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
20022748:	f64f 75ff 	movw	r5, #65535	@ 0xffff
2002274c:	6d03      	ldr	r3, [r0, #80]	@ 0x50
2002274e:	6802      	ldr	r2, [r0, #0]
20022750:	429d      	cmp	r5, r3
20022752:	bf28      	it	cs
20022754:	461d      	movcs	r5, r3
20022756:	1b5b      	subs	r3, r3, r5
20022758:	6503      	str	r3, [r0, #80]	@ 0x50
2002275a:	6585      	str	r5, [r0, #88]	@ 0x58
2002275c:	6813      	ldr	r3, [r2, #0]
2002275e:	f890 7066 	ldrb.w	r7, [r0, #102]	@ 0x66
20022762:	f023 0301 	bic.w	r3, r3, #1
20022766:	f890 8067 	ldrb.w	r8, [r0, #103]	@ 0x67
2002276a:	6013      	str	r3, [r2, #0]
2002276c:	e9d0 2317 	ldrd	r2, r3, [r0, #92]	@ 0x5c
20022770:	460e      	mov	r6, r1
20022772:	e9cd 2300 	strd	r2, r3, [sp]
20022776:	e9d0 2312 	ldrd	r2, r3, [r0, #72]	@ 0x48
2002277a:	f003 011c 	and.w	r1, r3, #28
2002277e:	2301      	movs	r3, #1
20022780:	4604      	mov	r4, r0
20022782:	408b      	lsls	r3, r1
20022784:	6053      	str	r3, [r2, #4]
20022786:	6803      	ldr	r3, [r0, #0]
20022788:	4669      	mov	r1, sp
2002278a:	605d      	str	r5, [r3, #4]
2002278c:	aa01      	add	r2, sp, #4
2002278e:	f7ff ffa9 	bl	200226e4 <DMA_Remap>
20022792:	e9dd 0300 	ldrd	r0, r3, [sp]
20022796:	68a1      	ldr	r1, [r4, #8]
20022798:	6822      	ldr	r2, [r4, #0]
2002279a:	2910      	cmp	r1, #16
2002279c:	bf0b      	itete	eq
2002279e:	6093      	streq	r3, [r2, #8]
200227a0:	6090      	strne	r0, [r2, #8]
200227a2:	6823      	ldreq	r3, [r4, #0]
200227a4:	6822      	ldrne	r2, [r4, #0]
200227a6:	bf0c      	ite	eq
200227a8:	60d8      	streq	r0, [r3, #12]
200227aa:	60d3      	strne	r3, [r2, #12]
200227ac:	f894 3064 	ldrb.w	r3, [r4, #100]	@ 0x64
200227b0:	b123      	cbz	r3, 200227bc <DMA_Start+0x78>
200227b2:	6de3      	ldr	r3, [r4, #92]	@ 0x5c
200227b4:	fa05 f707 	lsl.w	r7, r5, r7
200227b8:	443b      	add	r3, r7
200227ba:	65e3      	str	r3, [r4, #92]	@ 0x5c
200227bc:	f894 3065 	ldrb.w	r3, [r4, #101]	@ 0x65
200227c0:	b123      	cbz	r3, 200227cc <DMA_Start+0x88>
200227c2:	6e23      	ldr	r3, [r4, #96]	@ 0x60
200227c4:	fa05 f508 	lsl.w	r5, r5, r8
200227c8:	442b      	add	r3, r5
200227ca:	6623      	str	r3, [r4, #96]	@ 0x60
200227cc:	b136      	cbz	r6, 200227dc <DMA_Start+0x98>
200227ce:	6ba2      	ldr	r2, [r4, #56]	@ 0x38
200227d0:	6823      	ldr	r3, [r4, #0]
200227d2:	b15a      	cbz	r2, 200227ec <DMA_Start+0xa8>
200227d4:	681a      	ldr	r2, [r3, #0]
200227d6:	f042 020e 	orr.w	r2, r2, #14
200227da:	601a      	str	r2, [r3, #0]
200227dc:	6822      	ldr	r2, [r4, #0]
200227de:	6813      	ldr	r3, [r2, #0]
200227e0:	f043 0301 	orr.w	r3, r3, #1
200227e4:	6013      	str	r3, [r2, #0]
200227e6:	b002      	add	sp, #8
200227e8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
200227ec:	681a      	ldr	r2, [r3, #0]
200227ee:	f022 0204 	bic.w	r2, r2, #4
200227f2:	601a      	str	r2, [r3, #0]
200227f4:	6822      	ldr	r2, [r4, #0]
200227f6:	6813      	ldr	r3, [r2, #0]
200227f8:	f043 030a 	orr.w	r3, r3, #10
200227fc:	6013      	str	r3, [r2, #0]
200227fe:	e7ed      	b.n	200227dc <DMA_Start+0x98>

20022800 <HAL_DMA_Start>:
20022800:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20022802:	461d      	mov	r5, r3
20022804:	69c3      	ldr	r3, [r0, #28]
20022806:	4604      	mov	r4, r0
20022808:	2b20      	cmp	r3, #32
2002280a:	460f      	mov	r7, r1
2002280c:	4616      	mov	r6, r2
2002280e:	d105      	bne.n	2002281c <HAL_DMA_Start+0x1c>
20022810:	f64f 73fe 	movw	r3, #65534	@ 0xfffe
20022814:	1e6a      	subs	r2, r5, #1
20022816:	429a      	cmp	r2, r3
20022818:	d900      	bls.n	2002281c <HAL_DMA_Start+0x1c>
2002281a:	e7fe      	b.n	2002281a <HAL_DMA_Start+0x1a>
2002281c:	f894 302c 	ldrb.w	r3, [r4, #44]	@ 0x2c
20022820:	2b01      	cmp	r3, #1
20022822:	d00e      	beq.n	20022842 <HAL_DMA_Start+0x42>
20022824:	2301      	movs	r3, #1
20022826:	f884 302c 	strb.w	r3, [r4, #44]	@ 0x2c
2002282a:	f894 302d 	ldrb.w	r3, [r4, #45]	@ 0x2d
2002282e:	2b01      	cmp	r3, #1
20022830:	b2d9      	uxtb	r1, r3
20022832:	d103      	bne.n	2002283c <HAL_DMA_Start+0x3c>
20022834:	4620      	mov	r0, r4
20022836:	f7ff fd87 	bl	20022348 <DMA_AllocChannel>
2002283a:	b120      	cbz	r0, 20022846 <HAL_DMA_Start+0x46>
2002283c:	2300      	movs	r3, #0
2002283e:	f884 302c 	strb.w	r3, [r4, #44]	@ 0x2c
20022842:	2002      	movs	r0, #2
20022844:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20022846:	2302      	movs	r3, #2
20022848:	e9c4 5514 	strd	r5, r5, [r4, #80]	@ 0x50
2002284c:	e9c4 7617 	strd	r7, r6, [r4, #92]	@ 0x5c
20022850:	f884 302d 	strb.w	r3, [r4, #45]	@ 0x2d
20022854:	6460      	str	r0, [r4, #68]	@ 0x44
20022856:	6d20      	ldr	r0, [r4, #80]	@ 0x50
20022858:	2800      	cmp	r0, #0
2002285a:	d0f3      	beq.n	20022844 <HAL_DMA_Start+0x44>
2002285c:	2100      	movs	r1, #0
2002285e:	4620      	mov	r0, r4
20022860:	f7ff ff70 	bl	20022744 <DMA_Start>
20022864:	6d23      	ldr	r3, [r4, #80]	@ 0x50
20022866:	2b00      	cmp	r3, #0
20022868:	d0f5      	beq.n	20022856 <HAL_DMA_Start+0x56>
2002286a:	f44f 727a 	mov.w	r2, #1000	@ 0x3e8
2002286e:	2100      	movs	r1, #0
20022870:	4620      	mov	r0, r4
20022872:	f7ff fec7 	bl	20022604 <HAL_DMA_PollForTransfer>
20022876:	2800      	cmp	r0, #0
20022878:	d0ed      	beq.n	20022856 <HAL_DMA_Start+0x56>
2002287a:	e7e3      	b.n	20022844 <HAL_DMA_Start+0x44>

2002287c <HAL_EFUSE_Read>:
2002287c:	2a20      	cmp	r2, #32
2002287e:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20022882:	4606      	mov	r6, r0
20022884:	460c      	mov	r4, r1
20022886:	4615      	mov	r5, r2
20022888:	dc30      	bgt.n	200228ec <HAL_EFUSE_Read+0x70>
2002288a:	f3c0 08c4 	ubfx	r8, r0, #3, #5
2002288e:	eb08 0302 	add.w	r3, r8, r2
20022892:	2b20      	cmp	r3, #32
20022894:	dc2a      	bgt.n	200228ec <HAL_EFUSE_Read+0x70>
20022896:	0797      	lsls	r7, r2, #30
20022898:	d128      	bne.n	200228ec <HAL_EFUSE_Read+0x70>
2002289a:	f010 091f 	ands.w	r9, r0, #31
2002289e:	d125      	bne.n	200228ec <HAL_EFUSE_Read+0x70>
200228a0:	4a25      	ldr	r2, [pc, #148]	@ (20022938 <HAL_EFUSE_Read+0xbc>)
200228a2:	2014      	movs	r0, #20
200228a4:	f8d2 7094 	ldr.w	r7, [r2, #148]	@ 0x94
200228a8:	0a36      	lsrs	r6, r6, #8
200228aa:	1cfb      	adds	r3, r7, #3
200228ac:	2b0e      	cmp	r3, #14
200228ae:	bf38      	it	cc
200228b0:	230e      	movcc	r3, #14
200228b2:	2b0f      	cmp	r3, #15
200228b4:	bf28      	it	cs
200228b6:	230f      	movcs	r3, #15
200228b8:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
200228bc:	f7ff fb37 	bl	20021f2e <HAL_Delay_us>
200228c0:	4a1e      	ldr	r2, [pc, #120]	@ (2002293c <HAL_EFUSE_Read+0xc0>)
200228c2:	00b3      	lsls	r3, r6, #2
200228c4:	6013      	str	r3, [r2, #0]
200228c6:	6813      	ldr	r3, [r2, #0]
200228c8:	491d      	ldr	r1, [pc, #116]	@ (20022940 <HAL_EFUSE_Read+0xc4>)
200228ca:	f043 0301 	orr.w	r3, r3, #1
200228ce:	6013      	str	r3, [r2, #0]
200228d0:	464b      	mov	r3, r9
200228d2:	4369      	muls	r1, r5
200228d4:	6890      	ldr	r0, [r2, #8]
200228d6:	07c0      	lsls	r0, r0, #31
200228d8:	d50c      	bpl.n	200228f4 <HAL_EFUSE_Read+0x78>
200228da:	6890      	ldr	r0, [r2, #8]
200228dc:	428b      	cmp	r3, r1
200228de:	f040 0001 	orr.w	r0, r0, #1
200228e2:	6090      	str	r0, [r2, #8]
200228e4:	d30a      	bcc.n	200228fc <HAL_EFUSE_Read+0x80>
200228e6:	4b14      	ldr	r3, [pc, #80]	@ (20022938 <HAL_EFUSE_Read+0xbc>)
200228e8:	f8c3 7094 	str.w	r7, [r3, #148]	@ 0x94
200228ec:	2500      	movs	r5, #0
200228ee:	4628      	mov	r0, r5
200228f0:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
200228f4:	428b      	cmp	r3, r1
200228f6:	d2f0      	bcs.n	200228da <HAL_EFUSE_Read+0x5e>
200228f8:	3301      	adds	r3, #1
200228fa:	e7eb      	b.n	200228d4 <HAL_EFUSE_Read+0x58>
200228fc:	4a11      	ldr	r2, [pc, #68]	@ (20022944 <HAL_EFUSE_Read+0xc8>)
200228fe:	f008 001c 	and.w	r0, r8, #28
20022902:	eb00 1046 	add.w	r0, r0, r6, lsl #5
20022906:	f025 0103 	bic.w	r1, r5, #3
2002290a:	4402      	add	r2, r0
2002290c:	4421      	add	r1, r4
2002290e:	428c      	cmp	r4, r1
20022910:	d103      	bne.n	2002291a <HAL_EFUSE_Read+0x9e>
20022912:	4b09      	ldr	r3, [pc, #36]	@ (20022938 <HAL_EFUSE_Read+0xbc>)
20022914:	f8c3 7094 	str.w	r7, [r3, #148]	@ 0x94
20022918:	e7e9      	b.n	200228ee <HAL_EFUSE_Read+0x72>
2002291a:	f852 3b04 	ldr.w	r3, [r2], #4
2002291e:	3404      	adds	r4, #4
20022920:	0a18      	lsrs	r0, r3, #8
20022922:	f804 3c04 	strb.w	r3, [r4, #-4]
20022926:	f804 0c03 	strb.w	r0, [r4, #-3]
2002292a:	0c18      	lsrs	r0, r3, #16
2002292c:	0e1b      	lsrs	r3, r3, #24
2002292e:	f804 0c02 	strb.w	r0, [r4, #-2]
20022932:	f804 3c01 	strb.w	r3, [r4, #-1]
20022936:	e7ea      	b.n	2002290e <HAL_EFUSE_Read+0x92>
20022938:	500ca000 	.word	0x500ca000
2002293c:	5000c000 	.word	0x5000c000
20022940:	0005dc00 	.word	0x0005dc00
20022944:	5000c030 	.word	0x5000c030

20022948 <HAL_DBG_printf>:
20022948:	b40f      	push	{r0, r1, r2, r3}
2002294a:	b004      	add	sp, #16
2002294c:	4770      	bx	lr
	...

20022950 <HAL_HPAON_WakeCore>:
20022950:	2802      	cmp	r0, #2
20022952:	b510      	push	{r4, lr}
20022954:	d120      	bne.n	20022998 <HAL_HPAON_WakeCore+0x48>
20022956:	4c11      	ldr	r4, [pc, #68]	@ (2002299c <HAL_HPAON_WakeCore+0x4c>)
20022958:	20e6      	movs	r0, #230	@ 0xe6
2002295a:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
2002295c:	f043 0301 	orr.w	r3, r3, #1
20022960:	62e3      	str	r3, [r4, #44]	@ 0x2c
20022962:	f7ff fae4 	bl	20021f2e <HAL_Delay_us>
20022966:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20022968:	069a      	lsls	r2, r3, #26
2002296a:	d5fc      	bpl.n	20022966 <HAL_HPAON_WakeCore+0x16>
2002296c:	201e      	movs	r0, #30
2002296e:	f7ff fade 	bl	20021f2e <HAL_Delay_us>
20022972:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20022974:	069b      	lsls	r3, r3, #26
20022976:	d5fc      	bpl.n	20022972 <HAL_HPAON_WakeCore+0x22>
20022978:	f3ef 8110 	mrs	r1, PRIMASK
2002297c:	2301      	movs	r3, #1
2002297e:	f383 8810 	msr	PRIMASK, r3
20022982:	4a07      	ldr	r2, [pc, #28]	@ (200229a0 <HAL_HPAON_WakeCore+0x50>)
20022984:	7813      	ldrb	r3, [r2, #0]
20022986:	2b13      	cmp	r3, #19
20022988:	d900      	bls.n	2002298c <HAL_HPAON_WakeCore+0x3c>
2002298a:	e7fe      	b.n	2002298a <HAL_HPAON_WakeCore+0x3a>
2002298c:	3301      	adds	r3, #1
2002298e:	7013      	strb	r3, [r2, #0]
20022990:	f381 8810 	msr	PRIMASK, r1
20022994:	2000      	movs	r0, #0
20022996:	bd10      	pop	{r4, pc}
20022998:	2001      	movs	r0, #1
2002299a:	e7fc      	b.n	20022996 <HAL_HPAON_WakeCore+0x46>
2002299c:	500c0000 	.word	0x500c0000
200229a0:	2004cbc4 	.word	0x2004cbc4

200229a4 <HAL_HPAON_EnableXT48>:
200229a4:	4b04      	ldr	r3, [pc, #16]	@ (200229b8 <HAL_HPAON_EnableXT48+0x14>)
200229a6:	691a      	ldr	r2, [r3, #16]
200229a8:	f042 0202 	orr.w	r2, r2, #2
200229ac:	611a      	str	r2, [r3, #16]
200229ae:	691a      	ldr	r2, [r3, #16]
200229b0:	2a00      	cmp	r2, #0
200229b2:	dafc      	bge.n	200229ae <HAL_HPAON_EnableXT48+0xa>
200229b4:	4770      	bx	lr
200229b6:	bf00      	nop
200229b8:	500c0000 	.word	0x500c0000

200229bc <HAL_HPAON_DisableXT48>:
200229bc:	4a02      	ldr	r2, [pc, #8]	@ (200229c8 <HAL_HPAON_DisableXT48+0xc>)
200229be:	6913      	ldr	r3, [r2, #16]
200229c0:	f023 0302 	bic.w	r3, r3, #2
200229c4:	6113      	str	r3, [r2, #16]
200229c6:	4770      	bx	lr
200229c8:	500c0000 	.word	0x500c0000

200229cc <HAL_QSPI_Init>:
200229cc:	b510      	push	{r4, lr}
200229ce:	b1e0      	cbz	r0, 20022a0a <HAL_QSPI_Init+0x3e>
200229d0:	b1d9      	cbz	r1, 20022a0a <HAL_QSPI_Init+0x3e>
200229d2:	2300      	movs	r3, #0
200229d4:	2201      	movs	r2, #1
200229d6:	6043      	str	r3, [r0, #4]
200229d8:	f880 2022 	strb.w	r2, [r0, #34]	@ 0x22
200229dc:	680c      	ldr	r4, [r1, #0]
200229de:	6004      	str	r4, [r0, #0]
200229e0:	684a      	ldr	r2, [r1, #4]
200229e2:	f880 2020 	strb.w	r2, [r0, #32]
200229e6:	688a      	ldr	r2, [r1, #8]
200229e8:	6102      	str	r2, [r0, #16]
200229ea:	68ca      	ldr	r2, [r1, #12]
200229ec:	0512      	lsls	r2, r2, #20
200229ee:	6142      	str	r2, [r0, #20]
200229f0:	22ff      	movs	r2, #255	@ 0xff
200229f2:	f8c4 2084 	str.w	r2, [r4, #132]	@ 0x84
200229f6:	f04f 2450 	mov.w	r4, #1342197760	@ 0x50005000
200229fa:	6801      	ldr	r1, [r0, #0]
200229fc:	678c      	str	r4, [r1, #120]	@ 0x78
200229fe:	6801      	ldr	r1, [r0, #0]
20022a00:	620a      	str	r2, [r1, #32]
20022a02:	6801      	ldr	r1, [r0, #0]
20022a04:	4618      	mov	r0, r3
20022a06:	644a      	str	r2, [r1, #68]	@ 0x44
20022a08:	bd10      	pop	{r4, pc}
20022a0a:	2001      	movs	r0, #1
20022a0c:	e7fc      	b.n	20022a08 <HAL_QSPI_Init+0x3c>

20022a0e <HAL_FLASH_SET_AHB_RCMD>:
20022a0e:	b138      	cbz	r0, 20022a20 <HAL_FLASH_SET_AHB_RCMD+0x12>
20022a10:	6802      	ldr	r2, [r0, #0]
20022a12:	2000      	movs	r0, #0
20022a14:	6c13      	ldr	r3, [r2, #64]	@ 0x40
20022a16:	f023 03ff 	bic.w	r3, r3, #255	@ 0xff
20022a1a:	4319      	orrs	r1, r3
20022a1c:	6411      	str	r1, [r2, #64]	@ 0x40
20022a1e:	4770      	bx	lr
20022a20:	2001      	movs	r0, #1
20022a22:	4770      	bx	lr

20022a24 <HAL_FLASH_CFG_AHB_RCMD>:
20022a24:	b570      	push	{r4, r5, r6, lr}
20022a26:	b1c8      	cbz	r0, 20022a5c <HAL_FLASH_CFG_AHB_RCMD+0x38>
20022a28:	6805      	ldr	r5, [r0, #0]
20022a2a:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022a2e:	f99d 001c 	ldrsb.w	r0, [sp, #28]
20022a32:	6cac      	ldr	r4, [r5, #72]	@ 0x48
20022a34:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022a38:	ea40 23c3 	orr.w	r3, r0, r3, lsl #11
20022a3c:	f99d 0010 	ldrsb.w	r0, [sp, #16]
20022a40:	f36f 0414 	bfc	r4, #0, #21
20022a44:	ea43 2300 	orr.w	r3, r3, r0, lsl #8
20022a48:	f99d 0014 	ldrsb.w	r0, [sp, #20]
20022a4c:	ea43 1380 	orr.w	r3, r3, r0, lsl #6
20022a50:	ea43 3242 	orr.w	r2, r3, r2, lsl #13
20022a54:	ea42 4181 	orr.w	r1, r2, r1, lsl #18
20022a58:	4321      	orrs	r1, r4
20022a5a:	64a9      	str	r1, [r5, #72]	@ 0x48
20022a5c:	bd70      	pop	{r4, r5, r6, pc}

20022a5e <HAL_FLASH_SET_AHB_WCMD>:
20022a5e:	b140      	cbz	r0, 20022a72 <HAL_FLASH_SET_AHB_WCMD+0x14>
20022a60:	6802      	ldr	r2, [r0, #0]
20022a62:	2000      	movs	r0, #0
20022a64:	6c13      	ldr	r3, [r2, #64]	@ 0x40
20022a66:	f423 437f 	bic.w	r3, r3, #65280	@ 0xff00
20022a6a:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
20022a6e:	6411      	str	r1, [r2, #64]	@ 0x40
20022a70:	4770      	bx	lr
20022a72:	2001      	movs	r0, #1
20022a74:	4770      	bx	lr

20022a76 <HAL_FLASH_CFG_AHB_WCMD>:
20022a76:	b570      	push	{r4, r5, r6, lr}
20022a78:	b1c8      	cbz	r0, 20022aae <HAL_FLASH_CFG_AHB_WCMD+0x38>
20022a7a:	6805      	ldr	r5, [r0, #0]
20022a7c:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022a80:	f99d 001c 	ldrsb.w	r0, [sp, #28]
20022a84:	6d2c      	ldr	r4, [r5, #80]	@ 0x50
20022a86:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022a8a:	ea40 23c3 	orr.w	r3, r0, r3, lsl #11
20022a8e:	f99d 0010 	ldrsb.w	r0, [sp, #16]
20022a92:	f36f 0414 	bfc	r4, #0, #21
20022a96:	ea43 2300 	orr.w	r3, r3, r0, lsl #8
20022a9a:	f99d 0014 	ldrsb.w	r0, [sp, #20]
20022a9e:	ea43 1380 	orr.w	r3, r3, r0, lsl #6
20022aa2:	ea43 3242 	orr.w	r2, r3, r2, lsl #13
20022aa6:	ea42 4181 	orr.w	r1, r2, r1, lsl #18
20022aaa:	4321      	orrs	r1, r4
20022aac:	6529      	str	r1, [r5, #80]	@ 0x50
20022aae:	bd70      	pop	{r4, r5, r6, pc}

20022ab0 <HAL_FLASH_WRITE_WORD>:
20022ab0:	b118      	cbz	r0, 20022aba <HAL_FLASH_WRITE_WORD+0xa>
20022ab2:	6803      	ldr	r3, [r0, #0]
20022ab4:	2000      	movs	r0, #0
20022ab6:	6059      	str	r1, [r3, #4]
20022ab8:	4770      	bx	lr
20022aba:	2001      	movs	r0, #1
20022abc:	4770      	bx	lr

20022abe <HAL_FLASH_WRITE_DLEN>:
20022abe:	b130      	cbz	r0, 20022ace <HAL_FLASH_WRITE_DLEN+0x10>
20022ac0:	6803      	ldr	r3, [r0, #0]
20022ac2:	3901      	subs	r1, #1
20022ac4:	f3c1 0113 	ubfx	r1, r1, #0, #20
20022ac8:	2000      	movs	r0, #0
20022aca:	6259      	str	r1, [r3, #36]	@ 0x24
20022acc:	4770      	bx	lr
20022ace:	2001      	movs	r0, #1
20022ad0:	4770      	bx	lr

20022ad2 <HAL_FLASH_WRITE_DLEN2>:
20022ad2:	b130      	cbz	r0, 20022ae2 <HAL_FLASH_WRITE_DLEN2+0x10>
20022ad4:	6803      	ldr	r3, [r0, #0]
20022ad6:	3901      	subs	r1, #1
20022ad8:	f3c1 0113 	ubfx	r1, r1, #0, #20
20022adc:	2000      	movs	r0, #0
20022ade:	6399      	str	r1, [r3, #56]	@ 0x38
20022ae0:	4770      	bx	lr
20022ae2:	2001      	movs	r0, #1
20022ae4:	4770      	bx	lr

20022ae6 <HAL_FLASH_WRITE_ABYTE>:
20022ae6:	b108      	cbz	r0, 20022aec <HAL_FLASH_WRITE_ABYTE+0x6>
20022ae8:	6803      	ldr	r3, [r0, #0]
20022aea:	6219      	str	r1, [r3, #32]
20022aec:	4770      	bx	lr

20022aee <HAL_FLASH_IS_CMD_DONE>:
20022aee:	b118      	cbz	r0, 20022af8 <HAL_FLASH_IS_CMD_DONE+0xa>
20022af0:	6803      	ldr	r3, [r0, #0]
20022af2:	6918      	ldr	r0, [r3, #16]
20022af4:	f000 0001 	and.w	r0, r0, #1
20022af8:	4770      	bx	lr

20022afa <HAL_FLASH_CLR_CMD_DONE>:
20022afa:	b120      	cbz	r0, 20022b06 <HAL_FLASH_CLR_CMD_DONE+0xc>
20022afc:	6802      	ldr	r2, [r0, #0]
20022afe:	6953      	ldr	r3, [r2, #20]
20022b00:	f043 0301 	orr.w	r3, r3, #1
20022b04:	6153      	str	r3, [r2, #20]
20022b06:	4770      	bx	lr

20022b08 <HAL_FLASH_SET_CMD>:
20022b08:	b538      	push	{r3, r4, r5, lr}
20022b0a:	460d      	mov	r5, r1
20022b0c:	4604      	mov	r4, r0
20022b0e:	b1a8      	cbz	r0, 20022b3c <HAL_FLASH_SET_CMD+0x34>
20022b10:	6803      	ldr	r3, [r0, #0]
20022b12:	61da      	str	r2, [r3, #28]
20022b14:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
20022b16:	b10b      	cbz	r3, 20022b1c <HAL_FLASH_SET_CMD+0x14>
20022b18:	2001      	movs	r0, #1
20022b1a:	4798      	blx	r3
20022b1c:	6823      	ldr	r3, [r4, #0]
20022b1e:	619d      	str	r5, [r3, #24]
20022b20:	4620      	mov	r0, r4
20022b22:	f7ff ffe4 	bl	20022aee <HAL_FLASH_IS_CMD_DONE>
20022b26:	2800      	cmp	r0, #0
20022b28:	d0fa      	beq.n	20022b20 <HAL_FLASH_SET_CMD+0x18>
20022b2a:	4620      	mov	r0, r4
20022b2c:	f7ff ffe5 	bl	20022afa <HAL_FLASH_CLR_CMD_DONE>
20022b30:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20022b32:	b10b      	cbz	r3, 20022b38 <HAL_FLASH_SET_CMD+0x30>
20022b34:	2000      	movs	r0, #0
20022b36:	4798      	blx	r3
20022b38:	2000      	movs	r0, #0
20022b3a:	bd38      	pop	{r3, r4, r5, pc}
20022b3c:	2001      	movs	r0, #1
20022b3e:	e7fc      	b.n	20022b3a <HAL_FLASH_SET_CMD+0x32>

20022b40 <HAL_FLASH_CLR_STATUS>:
20022b40:	b118      	cbz	r0, 20022b4a <HAL_FLASH_CLR_STATUS+0xa>
20022b42:	6802      	ldr	r2, [r0, #0]
20022b44:	6953      	ldr	r3, [r2, #20]
20022b46:	4319      	orrs	r1, r3
20022b48:	6151      	str	r1, [r2, #20]
20022b4a:	4770      	bx	lr

20022b4c <HAL_FLASH_STATUS_MATCH>:
20022b4c:	b118      	cbz	r0, 20022b56 <HAL_FLASH_STATUS_MATCH+0xa>
20022b4e:	6803      	ldr	r3, [r0, #0]
20022b50:	6918      	ldr	r0, [r3, #16]
20022b52:	f3c0 00c0 	ubfx	r0, r0, #3, #1
20022b56:	4770      	bx	lr

20022b58 <HAL_FLASH_IS_PROG_DONE>:
20022b58:	b128      	cbz	r0, 20022b66 <HAL_FLASH_IS_PROG_DONE+0xe>
20022b5a:	6803      	ldr	r3, [r0, #0]
20022b5c:	6858      	ldr	r0, [r3, #4]
20022b5e:	43c0      	mvns	r0, r0
20022b60:	f000 0001 	and.w	r0, r0, #1
20022b64:	4770      	bx	lr
20022b66:	2001      	movs	r0, #1
20022b68:	4770      	bx	lr

20022b6a <HAL_FLASH_READ32>:
20022b6a:	b108      	cbz	r0, 20022b70 <HAL_FLASH_READ32+0x6>
20022b6c:	6803      	ldr	r3, [r0, #0]
20022b6e:	6858      	ldr	r0, [r3, #4]
20022b70:	4770      	bx	lr

20022b72 <HAL_FLASH_SET_TXSLOT>:
20022b72:	b120      	cbz	r0, 20022b7e <HAL_FLASH_SET_TXSLOT+0xc>
20022b74:	6802      	ldr	r2, [r0, #0]
20022b76:	6d53      	ldr	r3, [r2, #84]	@ 0x54
20022b78:	f361 238e 	bfi	r3, r1, #10, #5
20022b7c:	6553      	str	r3, [r2, #84]	@ 0x54
20022b7e:	4770      	bx	lr

20022b80 <HAL_FLASH_SET_CLK_rom>:
20022b80:	b108      	cbz	r0, 20022b86 <HAL_FLASH_SET_CLK_rom+0x6>
20022b82:	6803      	ldr	r3, [r0, #0]
20022b84:	60d9      	str	r1, [r3, #12]
20022b86:	4770      	bx	lr

20022b88 <HAL_FLASH_GET_DIV>:
20022b88:	b110      	cbz	r0, 20022b90 <HAL_FLASH_GET_DIV+0x8>
20022b8a:	6803      	ldr	r3, [r0, #0]
20022b8c:	68d8      	ldr	r0, [r3, #12]
20022b8e:	b2c0      	uxtb	r0, r0
20022b90:	4770      	bx	lr

20022b92 <HAL_FLASH_MANUAL_CMD>:
20022b92:	b570      	push	{r4, r5, r6, lr}
20022b94:	b1e8      	cbz	r0, 20022bd2 <HAL_FLASH_MANUAL_CMD+0x40>
20022b96:	6805      	ldr	r5, [r0, #0]
20022b98:	f99d 601c 	ldrsb.w	r6, [sp, #28]
20022b9c:	f99d 0020 	ldrsb.w	r0, [sp, #32]
20022ba0:	6aac      	ldr	r4, [r5, #40]	@ 0x28
20022ba2:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022ba6:	f99d 6010 	ldrsb.w	r6, [sp, #16]
20022baa:	f36f 0415 	bfc	r4, #0, #22
20022bae:	ea40 20c6 	orr.w	r0, r0, r6, lsl #11
20022bb2:	f99d 6014 	ldrsb.w	r6, [sp, #20]
20022bb6:	ea40 2006 	orr.w	r0, r0, r6, lsl #8
20022bba:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022bbe:	ea40 1086 	orr.w	r0, r0, r6, lsl #6
20022bc2:	ea40 3343 	orr.w	r3, r0, r3, lsl #13
20022bc6:	ea43 4282 	orr.w	r2, r3, r2, lsl #18
20022bca:	ea42 5141 	orr.w	r1, r2, r1, lsl #21
20022bce:	4321      	orrs	r1, r4
20022bd0:	62a9      	str	r1, [r5, #40]	@ 0x28
20022bd2:	bd70      	pop	{r4, r5, r6, pc}

20022bd4 <HAL_FLASH_MANUAL_CMD2>:
20022bd4:	b570      	push	{r4, r5, r6, lr}
20022bd6:	b1e8      	cbz	r0, 20022c14 <HAL_FLASH_MANUAL_CMD2+0x40>
20022bd8:	6805      	ldr	r5, [r0, #0]
20022bda:	f99d 601c 	ldrsb.w	r6, [sp, #28]
20022bde:	f99d 0020 	ldrsb.w	r0, [sp, #32]
20022be2:	6bec      	ldr	r4, [r5, #60]	@ 0x3c
20022be4:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022be8:	f99d 6010 	ldrsb.w	r6, [sp, #16]
20022bec:	f36f 0415 	bfc	r4, #0, #22
20022bf0:	ea40 20c6 	orr.w	r0, r0, r6, lsl #11
20022bf4:	f99d 6014 	ldrsb.w	r6, [sp, #20]
20022bf8:	ea40 2006 	orr.w	r0, r0, r6, lsl #8
20022bfc:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022c00:	ea40 1086 	orr.w	r0, r0, r6, lsl #6
20022c04:	ea40 3343 	orr.w	r3, r0, r3, lsl #13
20022c08:	ea43 4282 	orr.w	r2, r3, r2, lsl #18
20022c0c:	ea42 5141 	orr.w	r1, r2, r1, lsl #21
20022c10:	4321      	orrs	r1, r4
20022c12:	63e9      	str	r1, [r5, #60]	@ 0x3c
20022c14:	bd70      	pop	{r4, r5, r6, pc}
	...

20022c18 <HAL_FLASH_SET_ALIAS_RANGE>:
20022c18:	b510      	push	{r4, lr}
20022c1a:	b158      	cbz	r0, 20022c34 <HAL_FLASH_SET_ALIAS_RANGE+0x1c>
20022c1c:	4b06      	ldr	r3, [pc, #24]	@ (20022c38 <HAL_FLASH_SET_ALIAS_RANGE+0x20>)
20022c1e:	6804      	ldr	r4, [r0, #0]
20022c20:	f202 32ff 	addw	r2, r2, #1023	@ 0x3ff
20022c24:	440a      	add	r2, r1
20022c26:	4019      	ands	r1, r3
20022c28:	66e1      	str	r1, [r4, #108]	@ 0x6c
20022c2a:	401a      	ands	r2, r3
20022c2c:	6803      	ldr	r3, [r0, #0]
20022c2e:	2000      	movs	r0, #0
20022c30:	671a      	str	r2, [r3, #112]	@ 0x70
20022c32:	bd10      	pop	{r4, pc}
20022c34:	2001      	movs	r0, #1
20022c36:	e7fc      	b.n	20022c32 <HAL_FLASH_SET_ALIAS_RANGE+0x1a>
20022c38:	fffffc00 	.word	0xfffffc00

20022c3c <HAL_FLASH_SET_ALIAS_OFFSET>:
20022c3c:	b128      	cbz	r0, 20022c4a <HAL_FLASH_SET_ALIAS_OFFSET+0xe>
20022c3e:	6803      	ldr	r3, [r0, #0]
20022c40:	f36f 0109 	bfc	r1, #0, #10
20022c44:	2000      	movs	r0, #0
20022c46:	6759      	str	r1, [r3, #116]	@ 0x74
20022c48:	4770      	bx	lr
20022c4a:	2001      	movs	r0, #1
20022c4c:	4770      	bx	lr
	...

20022c50 <HAL_FLASH_SET_CTR>:
20022c50:	b510      	push	{r4, lr}
20022c52:	b150      	cbz	r0, 20022c6a <HAL_FLASH_SET_CTR+0x1a>
20022c54:	4b06      	ldr	r3, [pc, #24]	@ (20022c70 <HAL_FLASH_SET_CTR+0x20>)
20022c56:	6804      	ldr	r4, [r0, #0]
20022c58:	4019      	ands	r1, r3
20022c5a:	65e1      	str	r1, [r4, #92]	@ 0x5c
20022c5c:	6801      	ldr	r1, [r0, #0]
20022c5e:	2000      	movs	r0, #0
20022c60:	f202 32ff 	addw	r2, r2, #1023	@ 0x3ff
20022c64:	401a      	ands	r2, r3
20022c66:	660a      	str	r2, [r1, #96]	@ 0x60
20022c68:	bd10      	pop	{r4, pc}
20022c6a:	2001      	movs	r0, #1
20022c6c:	e7fc      	b.n	20022c68 <HAL_FLASH_SET_CTR+0x18>
20022c6e:	bf00      	nop
20022c70:	fffffc00 	.word	0xfffffc00

20022c74 <HAL_FLASH_SET_NONCE>:
20022c74:	b150      	cbz	r0, 20022c8c <HAL_FLASH_SET_NONCE+0x18>
20022c76:	b149      	cbz	r1, 20022c8c <HAL_FLASH_SET_NONCE+0x18>
20022c78:	680b      	ldr	r3, [r1, #0]
20022c7a:	6802      	ldr	r2, [r0, #0]
20022c7c:	ba1b      	rev	r3, r3
20022c7e:	6653      	str	r3, [r2, #100]	@ 0x64
20022c80:	684b      	ldr	r3, [r1, #4]
20022c82:	6802      	ldr	r2, [r0, #0]
20022c84:	ba1b      	rev	r3, r3
20022c86:	2000      	movs	r0, #0
20022c88:	6693      	str	r3, [r2, #104]	@ 0x68
20022c8a:	4770      	bx	lr
20022c8c:	2001      	movs	r0, #1
20022c8e:	4770      	bx	lr

20022c90 <HAL_FLASH_SET_AES>:
20022c90:	b158      	cbz	r0, 20022caa <HAL_FLASH_SET_AES+0x1a>
20022c92:	6803      	ldr	r3, [r0, #0]
20022c94:	2901      	cmp	r1, #1
20022c96:	681a      	ldr	r2, [r3, #0]
20022c98:	d104      	bne.n	20022ca4 <HAL_FLASH_SET_AES+0x14>
20022c9a:	f042 0280 	orr.w	r2, r2, #128	@ 0x80
20022c9e:	2000      	movs	r0, #0
20022ca0:	601a      	str	r2, [r3, #0]
20022ca2:	4770      	bx	lr
20022ca4:	f022 0280 	bic.w	r2, r2, #128	@ 0x80
20022ca8:	e7f9      	b.n	20022c9e <HAL_FLASH_SET_AES+0xe>
20022caa:	2001      	movs	r0, #1
20022cac:	4770      	bx	lr

20022cae <HAL_FLASH_ENABLE_AES>:
20022cae:	b150      	cbz	r0, 20022cc6 <HAL_FLASH_ENABLE_AES+0x18>
20022cb0:	6803      	ldr	r3, [r0, #0]
20022cb2:	681a      	ldr	r2, [r3, #0]
20022cb4:	b121      	cbz	r1, 20022cc0 <HAL_FLASH_ENABLE_AES+0x12>
20022cb6:	f042 0240 	orr.w	r2, r2, #64	@ 0x40
20022cba:	2000      	movs	r0, #0
20022cbc:	601a      	str	r2, [r3, #0]
20022cbe:	4770      	bx	lr
20022cc0:	f022 0240 	bic.w	r2, r2, #64	@ 0x40
20022cc4:	e7f9      	b.n	20022cba <HAL_FLASH_ENABLE_AES+0xc>
20022cc6:	2001      	movs	r0, #1
20022cc8:	4770      	bx	lr

20022cca <HAL_FLASH_ENABLE_QSPI>:
20022cca:	b150      	cbz	r0, 20022ce2 <HAL_FLASH_ENABLE_QSPI+0x18>
20022ccc:	6803      	ldr	r3, [r0, #0]
20022cce:	681a      	ldr	r2, [r3, #0]
20022cd0:	b121      	cbz	r1, 20022cdc <HAL_FLASH_ENABLE_QSPI+0x12>
20022cd2:	f042 0201 	orr.w	r2, r2, #1
20022cd6:	2000      	movs	r0, #0
20022cd8:	601a      	str	r2, [r3, #0]
20022cda:	4770      	bx	lr
20022cdc:	f022 0201 	bic.w	r2, r2, #1
20022ce0:	e7f9      	b.n	20022cd6 <HAL_FLASH_ENABLE_QSPI+0xc>
20022ce2:	2001      	movs	r0, #1
20022ce4:	4770      	bx	lr

20022ce6 <HAL_FLASH_ENABLE_OPI>:
20022ce6:	b150      	cbz	r0, 20022cfe <HAL_FLASH_ENABLE_OPI+0x18>
20022ce8:	6803      	ldr	r3, [r0, #0]
20022cea:	681a      	ldr	r2, [r3, #0]
20022cec:	b121      	cbz	r1, 20022cf8 <HAL_FLASH_ENABLE_OPI+0x12>
20022cee:	f442 1200 	orr.w	r2, r2, #2097152	@ 0x200000
20022cf2:	2000      	movs	r0, #0
20022cf4:	601a      	str	r2, [r3, #0]
20022cf6:	4770      	bx	lr
20022cf8:	f422 1200 	bic.w	r2, r2, #2097152	@ 0x200000
20022cfc:	e7f9      	b.n	20022cf2 <HAL_FLASH_ENABLE_OPI+0xc>
20022cfe:	2001      	movs	r0, #1
20022d00:	4770      	bx	lr

20022d02 <HAL_FLASH_ENABLE_HYPER>:
20022d02:	b150      	cbz	r0, 20022d1a <HAL_FLASH_ENABLE_HYPER+0x18>
20022d04:	6803      	ldr	r3, [r0, #0]
20022d06:	689a      	ldr	r2, [r3, #8]
20022d08:	b121      	cbz	r1, 20022d14 <HAL_FLASH_ENABLE_HYPER+0x12>
20022d0a:	f042 0210 	orr.w	r2, r2, #16
20022d0e:	2000      	movs	r0, #0
20022d10:	609a      	str	r2, [r3, #8]
20022d12:	4770      	bx	lr
20022d14:	f022 0210 	bic.w	r2, r2, #16
20022d18:	e7f9      	b.n	20022d0e <HAL_FLASH_ENABLE_HYPER+0xc>
20022d1a:	2001      	movs	r0, #1
20022d1c:	4770      	bx	lr

20022d1e <HAL_FLASH_ENABLE_CMD2>:
20022d1e:	b150      	cbz	r0, 20022d36 <HAL_FLASH_ENABLE_CMD2+0x18>
20022d20:	6803      	ldr	r3, [r0, #0]
20022d22:	681a      	ldr	r2, [r3, #0]
20022d24:	b121      	cbz	r1, 20022d30 <HAL_FLASH_ENABLE_CMD2+0x12>
20022d26:	f442 3280 	orr.w	r2, r2, #65536	@ 0x10000
20022d2a:	2000      	movs	r0, #0
20022d2c:	601a      	str	r2, [r3, #0]
20022d2e:	4770      	bx	lr
20022d30:	f422 3280 	bic.w	r2, r2, #65536	@ 0x10000
20022d34:	e7f9      	b.n	20022d2a <HAL_FLASH_ENABLE_CMD2+0xc>
20022d36:	2001      	movs	r0, #1
20022d38:	4770      	bx	lr

20022d3a <HAL_FLASH_STAUS_MATCH_CMD2>:
20022d3a:	b150      	cbz	r0, 20022d52 <HAL_FLASH_STAUS_MATCH_CMD2+0x18>
20022d3c:	6803      	ldr	r3, [r0, #0]
20022d3e:	681a      	ldr	r2, [r3, #0]
20022d40:	b121      	cbz	r1, 20022d4c <HAL_FLASH_STAUS_MATCH_CMD2+0x12>
20022d42:	f442 2280 	orr.w	r2, r2, #262144	@ 0x40000
20022d46:	2000      	movs	r0, #0
20022d48:	601a      	str	r2, [r3, #0]
20022d4a:	4770      	bx	lr
20022d4c:	f422 2280 	bic.w	r2, r2, #262144	@ 0x40000
20022d50:	e7f9      	b.n	20022d46 <HAL_FLASH_STAUS_MATCH_CMD2+0xc>
20022d52:	2001      	movs	r0, #1
20022d54:	4770      	bx	lr

20022d56 <HAL_FLASH_SET_CS_TIME>:
20022d56:	b530      	push	{r4, r5, lr}
20022d58:	b180      	cbz	r0, 20022d7c <HAL_FLASH_SET_CS_TIME+0x26>
20022d5a:	6805      	ldr	r5, [r0, #0]
20022d5c:	f8bd 000c 	ldrh.w	r0, [sp, #12]
20022d60:	68ac      	ldr	r4, [r5, #8]
20022d62:	0680      	lsls	r0, r0, #26
20022d64:	ea40 5383 	orr.w	r3, r0, r3, lsl #22
20022d68:	2000      	movs	r0, #0
20022d6a:	ea43 4181 	orr.w	r1, r3, r1, lsl #18
20022d6e:	f36f 149e 	bfc	r4, #6, #25
20022d72:	ea41 1282 	orr.w	r2, r1, r2, lsl #6
20022d76:	4322      	orrs	r2, r4
20022d78:	60aa      	str	r2, [r5, #8]
20022d7a:	bd30      	pop	{r4, r5, pc}
20022d7c:	2001      	movs	r0, #1
20022d7e:	e7fc      	b.n	20022d7a <HAL_FLASH_SET_CS_TIME+0x24>

20022d80 <HAL_FLASH_SET_ROW_BOUNDARY>:
20022d80:	b130      	cbz	r0, 20022d90 <HAL_FLASH_SET_ROW_BOUNDARY+0x10>
20022d82:	6802      	ldr	r2, [r0, #0]
20022d84:	2000      	movs	r0, #0
20022d86:	6893      	ldr	r3, [r2, #8]
20022d88:	f361 0302 	bfi	r3, r1, #0, #3
20022d8c:	6093      	str	r3, [r2, #8]
20022d8e:	4770      	bx	lr
20022d90:	2001      	movs	r0, #1
20022d92:	4770      	bx	lr

20022d94 <HAL_FLASH_SET_LEGACY>:
20022d94:	b150      	cbz	r0, 20022dac <HAL_FLASH_SET_LEGACY+0x18>
20022d96:	6803      	ldr	r3, [r0, #0]
20022d98:	689a      	ldr	r2, [r3, #8]
20022d9a:	b121      	cbz	r1, 20022da6 <HAL_FLASH_SET_LEGACY+0x12>
20022d9c:	f042 0220 	orr.w	r2, r2, #32
20022da0:	2000      	movs	r0, #0
20022da2:	609a      	str	r2, [r3, #8]
20022da4:	4770      	bx	lr
20022da6:	f022 0220 	bic.w	r2, r2, #32
20022daa:	e7f9      	b.n	20022da0 <HAL_FLASH_SET_LEGACY+0xc>
20022dac:	2001      	movs	r0, #1
20022dae:	4770      	bx	lr

20022db0 <HAL_FLASH_SET_DUAL_MODE>:
20022db0:	b150      	cbz	r0, 20022dc8 <HAL_FLASH_SET_DUAL_MODE+0x18>
20022db2:	6803      	ldr	r3, [r0, #0]
20022db4:	681a      	ldr	r2, [r3, #0]
20022db6:	b121      	cbz	r1, 20022dc2 <HAL_FLASH_SET_DUAL_MODE+0x12>
20022db8:	f042 7280 	orr.w	r2, r2, #16777216	@ 0x1000000
20022dbc:	2000      	movs	r0, #0
20022dbe:	601a      	str	r2, [r3, #0]
20022dc0:	4770      	bx	lr
20022dc2:	f022 7280 	bic.w	r2, r2, #16777216	@ 0x1000000
20022dc6:	e7f9      	b.n	20022dbc <HAL_FLASH_SET_DUAL_MODE+0xc>
20022dc8:	2001      	movs	r0, #1
20022dca:	4770      	bx	lr

20022dcc <HAL_MPI_EN_FIXLAT>:
20022dcc:	b150      	cbz	r0, 20022de4 <HAL_MPI_EN_FIXLAT+0x18>
20022dce:	6803      	ldr	r3, [r0, #0]
20022dd0:	689a      	ldr	r2, [r3, #8]
20022dd2:	b121      	cbz	r1, 20022dde <HAL_MPI_EN_FIXLAT+0x12>
20022dd4:	f042 4200 	orr.w	r2, r2, #2147483648	@ 0x80000000
20022dd8:	2000      	movs	r0, #0
20022dda:	609a      	str	r2, [r3, #8]
20022ddc:	4770      	bx	lr
20022dde:	f022 4200 	bic.w	r2, r2, #2147483648	@ 0x80000000
20022de2:	e7f9      	b.n	20022dd8 <HAL_MPI_EN_FIXLAT+0xc>
20022de4:	2001      	movs	r0, #1
20022de6:	4770      	bx	lr

20022de8 <HAL_MPI_ENABLE_DQS>:
20022de8:	b150      	cbz	r0, 20022e00 <HAL_MPI_ENABLE_DQS+0x18>
20022dea:	6803      	ldr	r3, [r0, #0]
20022dec:	689a      	ldr	r2, [r3, #8]
20022dee:	b121      	cbz	r1, 20022dfa <HAL_MPI_ENABLE_DQS+0x12>
20022df0:	f042 0208 	orr.w	r2, r2, #8
20022df4:	2000      	movs	r0, #0
20022df6:	609a      	str	r2, [r3, #8]
20022df8:	4770      	bx	lr
20022dfa:	f022 0208 	bic.w	r2, r2, #8
20022dfe:	e7f9      	b.n	20022df4 <HAL_MPI_ENABLE_DQS+0xc>
20022e00:	2001      	movs	r0, #1
20022e02:	4770      	bx	lr

20022e04 <HAL_MPI_SET_DQS_DELAY>:
20022e04:	b140      	cbz	r0, 20022e18 <HAL_MPI_SET_DQS_DELAY+0x14>
20022e06:	6802      	ldr	r2, [r0, #0]
20022e08:	2000      	movs	r0, #0
20022e0a:	6d93      	ldr	r3, [r2, #88]	@ 0x58
20022e0c:	f423 037f 	bic.w	r3, r3, #16711680	@ 0xff0000
20022e10:	ea43 4101 	orr.w	r1, r3, r1, lsl #16
20022e14:	6591      	str	r1, [r2, #88]	@ 0x58
20022e16:	4770      	bx	lr
20022e18:	2001      	movs	r0, #1
20022e1a:	4770      	bx	lr

20022e1c <HAL_MPI_SET_SCK>:
20022e1c:	b160      	cbz	r0, 20022e38 <HAL_MPI_SET_SCK+0x1c>
20022e1e:	6800      	ldr	r0, [r0, #0]
20022e20:	0652      	lsls	r2, r2, #25
20022e22:	6d83      	ldr	r3, [r0, #88]	@ 0x58
20022e24:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
20022e28:	f023 7300 	bic.w	r3, r3, #33554432	@ 0x2000000
20022e2c:	f423 437f 	bic.w	r3, r3, #65280	@ 0xff00
20022e30:	4319      	orrs	r1, r3
20022e32:	6581      	str	r1, [r0, #88]	@ 0x58
20022e34:	2000      	movs	r0, #0
20022e36:	4770      	bx	lr
20022e38:	2001      	movs	r0, #1
20022e3a:	4770      	bx	lr

20022e3c <HAL_MPI_CFG_DTR>:
20022e3c:	b510      	push	{r4, lr}
20022e3e:	b1f0      	cbz	r0, 20022e7e <HAL_MPI_CFG_DTR+0x42>
20022e40:	6804      	ldr	r4, [r0, #0]
20022e42:	6da0      	ldr	r0, [r4, #88]	@ 0x58
20022e44:	b1b1      	cbz	r1, 20022e74 <HAL_MPI_CFG_DTR+0x38>
20022e46:	2a02      	cmp	r2, #2
20022e48:	bf84      	itt	hi
20022e4a:	3a02      	subhi	r2, #2
20022e4c:	b2d2      	uxtbhi	r2, r2
20022e4e:	0213      	lsls	r3, r2, #8
20022e50:	f36f 000f 	bfc	r0, #0, #16
20022e54:	f403 43fe 	and.w	r3, r3, #32512	@ 0x7f00
20022e58:	4303      	orrs	r3, r0
20022e5a:	0612      	lsls	r2, r2, #24
20022e5c:	bf54      	ite	pl
20022e5e:	f043 6380 	orrpl.w	r3, r3, #67108864	@ 0x4000000
20022e62:	f043 63a0 	orrmi.w	r3, r3, #83886080	@ 0x5000000
20022e66:	f043 030a 	orr.w	r3, r3, #10
20022e6a:	f023 7300 	bic.w	r3, r3, #33554432	@ 0x2000000
20022e6e:	2000      	movs	r0, #0
20022e70:	65a3      	str	r3, [r4, #88]	@ 0x58
20022e72:	bd10      	pop	{r4, pc}
20022e74:	4b03      	ldr	r3, [pc, #12]	@ (20022e84 <HAL_MPI_CFG_DTR+0x48>)
20022e76:	4003      	ands	r3, r0
20022e78:	f043 7300 	orr.w	r3, r3, #33554432	@ 0x2000000
20022e7c:	e7f7      	b.n	20022e6e <HAL_MPI_CFG_DTR+0x32>
20022e7e:	2001      	movs	r0, #1
20022e80:	e7f7      	b.n	20022e72 <HAL_MPI_CFG_DTR+0x36>
20022e82:	bf00      	nop
20022e84:	faff0000 	.word	0xfaff0000

20022e88 <HAL_MPI_MODIFY_RCMD_DELAY>:
20022e88:	b130      	cbz	r0, 20022e98 <HAL_MPI_MODIFY_RCMD_DELAY+0x10>
20022e8a:	6802      	ldr	r2, [r0, #0]
20022e8c:	6c93      	ldr	r3, [r2, #72]	@ 0x48
20022e8e:	f423 3378 	bic.w	r3, r3, #253952	@ 0x3e000
20022e92:	ea43 3141 	orr.w	r1, r3, r1, lsl #13
20022e96:	6491      	str	r1, [r2, #72]	@ 0x48
20022e98:	4770      	bx	lr

20022e9a <HAL_MPI_MODIFY_WCMD_DELAY>:
20022e9a:	b130      	cbz	r0, 20022eaa <HAL_MPI_MODIFY_WCMD_DELAY+0x10>
20022e9c:	6802      	ldr	r2, [r0, #0]
20022e9e:	6d13      	ldr	r3, [r2, #80]	@ 0x50
20022ea0:	f423 3378 	bic.w	r3, r3, #253952	@ 0x3e000
20022ea4:	ea43 3141 	orr.w	r1, r3, r1, lsl #13
20022ea8:	6511      	str	r1, [r2, #80]	@ 0x50
20022eaa:	4770      	bx	lr

20022eac <HAL_FLASH_CONFIG_AHB_READ>:
20022eac:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
20022eae:	4605      	mov	r5, r0
20022eb0:	2800      	cmp	r0, #0
20022eb2:	d03d      	beq.n	20022f30 <HAL_FLASH_CONFIG_AHB_READ+0x84>
20022eb4:	68c4      	ldr	r4, [r0, #12]
20022eb6:	b301      	cbz	r1, 20022efa <HAL_FLASH_CONFIG_AHB_READ+0x4e>
20022eb8:	f894 306a 	ldrb.w	r3, [r4, #106]	@ 0x6a
20022ebc:	2b00      	cmp	r3, #0
20022ebe:	d037      	beq.n	20022f30 <HAL_FLASH_CONFIG_AHB_READ+0x84>
20022ec0:	f994 6072 	ldrsb.w	r6, [r4, #114]	@ 0x72
20022ec4:	f994 306e 	ldrsb.w	r3, [r4, #110]	@ 0x6e
20022ec8:	f994 106c 	ldrsb.w	r1, [r4, #108]	@ 0x6c
20022ecc:	f994 206d 	ldrsb.w	r2, [r4, #109]	@ 0x6d
20022ed0:	9603      	str	r6, [sp, #12]
20022ed2:	f994 6071 	ldrsb.w	r6, [r4, #113]	@ 0x71
20022ed6:	9602      	str	r6, [sp, #8]
20022ed8:	f994 6070 	ldrsb.w	r6, [r4, #112]	@ 0x70
20022edc:	9601      	str	r6, [sp, #4]
20022ede:	f994 406f 	ldrsb.w	r4, [r4, #111]	@ 0x6f
20022ee2:	9400      	str	r4, [sp, #0]
20022ee4:	f7ff fd9e 	bl	20022a24 <HAL_FLASH_CFG_AHB_RCMD>
20022ee8:	68eb      	ldr	r3, [r5, #12]
20022eea:	f893 106a 	ldrb.w	r1, [r3, #106]	@ 0x6a
20022eee:	4628      	mov	r0, r5
20022ef0:	f7ff fd8d 	bl	20022a0e <HAL_FLASH_SET_AHB_RCMD>
20022ef4:	2000      	movs	r0, #0
20022ef6:	b004      	add	sp, #16
20022ef8:	bd70      	pop	{r4, r5, r6, pc}
20022efa:	f894 3046 	ldrb.w	r3, [r4, #70]	@ 0x46
20022efe:	b1bb      	cbz	r3, 20022f30 <HAL_FLASH_CONFIG_AHB_READ+0x84>
20022f00:	f994 604e 	ldrsb.w	r6, [r4, #78]	@ 0x4e
20022f04:	f994 304a 	ldrsb.w	r3, [r4, #74]	@ 0x4a
20022f08:	f994 1048 	ldrsb.w	r1, [r4, #72]	@ 0x48
20022f0c:	f994 2049 	ldrsb.w	r2, [r4, #73]	@ 0x49
20022f10:	9603      	str	r6, [sp, #12]
20022f12:	f994 604d 	ldrsb.w	r6, [r4, #77]	@ 0x4d
20022f16:	9602      	str	r6, [sp, #8]
20022f18:	f994 604c 	ldrsb.w	r6, [r4, #76]	@ 0x4c
20022f1c:	9601      	str	r6, [sp, #4]
20022f1e:	f994 404b 	ldrsb.w	r4, [r4, #75]	@ 0x4b
20022f22:	9400      	str	r4, [sp, #0]
20022f24:	f7ff fd7e 	bl	20022a24 <HAL_FLASH_CFG_AHB_RCMD>
20022f28:	68eb      	ldr	r3, [r5, #12]
20022f2a:	f893 1046 	ldrb.w	r1, [r3, #70]	@ 0x46
20022f2e:	e7de      	b.n	20022eee <HAL_FLASH_CONFIG_AHB_READ+0x42>
20022f30:	2001      	movs	r0, #1
20022f32:	e7e0      	b.n	20022ef6 <HAL_FLASH_CONFIG_AHB_READ+0x4a>

20022f34 <HAL_FLASH_CONFIG_FULL_AHB_READ>:
20022f34:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
20022f36:	4605      	mov	r5, r0
20022f38:	2800      	cmp	r0, #0
20022f3a:	d036      	beq.n	20022faa <HAL_FLASH_CONFIG_FULL_AHB_READ+0x76>
20022f3c:	68c4      	ldr	r4, [r0, #12]
20022f3e:	b1e1      	cbz	r1, 20022f7a <HAL_FLASH_CONFIG_FULL_AHB_READ+0x46>
20022f40:	f994 616e 	ldrsb.w	r6, [r4, #366]	@ 0x16e
20022f44:	f994 316a 	ldrsb.w	r3, [r4, #362]	@ 0x16a
20022f48:	f994 1168 	ldrsb.w	r1, [r4, #360]	@ 0x168
20022f4c:	f994 2169 	ldrsb.w	r2, [r4, #361]	@ 0x169
20022f50:	9603      	str	r6, [sp, #12]
20022f52:	f994 616d 	ldrsb.w	r6, [r4, #365]	@ 0x16d
20022f56:	9602      	str	r6, [sp, #8]
20022f58:	f994 616c 	ldrsb.w	r6, [r4, #364]	@ 0x16c
20022f5c:	9601      	str	r6, [sp, #4]
20022f5e:	f994 416b 	ldrsb.w	r4, [r4, #363]	@ 0x16b
20022f62:	9400      	str	r4, [sp, #0]
20022f64:	f7ff fd5e 	bl	20022a24 <HAL_FLASH_CFG_AHB_RCMD>
20022f68:	68eb      	ldr	r3, [r5, #12]
20022f6a:	f893 1166 	ldrb.w	r1, [r3, #358]	@ 0x166
20022f6e:	4628      	mov	r0, r5
20022f70:	f7ff fd4d 	bl	20022a0e <HAL_FLASH_SET_AHB_RCMD>
20022f74:	2000      	movs	r0, #0
20022f76:	b004      	add	sp, #16
20022f78:	bd70      	pop	{r4, r5, r6, pc}
20022f7a:	f994 615c 	ldrsb.w	r6, [r4, #348]	@ 0x15c
20022f7e:	f994 3158 	ldrsb.w	r3, [r4, #344]	@ 0x158
20022f82:	f994 1156 	ldrsb.w	r1, [r4, #342]	@ 0x156
20022f86:	f994 2157 	ldrsb.w	r2, [r4, #343]	@ 0x157
20022f8a:	9603      	str	r6, [sp, #12]
20022f8c:	f994 615b 	ldrsb.w	r6, [r4, #347]	@ 0x15b
20022f90:	9602      	str	r6, [sp, #8]
20022f92:	f994 615a 	ldrsb.w	r6, [r4, #346]	@ 0x15a
20022f96:	9601      	str	r6, [sp, #4]
20022f98:	f994 4159 	ldrsb.w	r4, [r4, #345]	@ 0x159
20022f9c:	9400      	str	r4, [sp, #0]
20022f9e:	f7ff fd41 	bl	20022a24 <HAL_FLASH_CFG_AHB_RCMD>
20022fa2:	68eb      	ldr	r3, [r5, #12]
20022fa4:	f893 1154 	ldrb.w	r1, [r3, #340]	@ 0x154
20022fa8:	e7e1      	b.n	20022f6e <HAL_FLASH_CONFIG_FULL_AHB_READ+0x3a>
20022faa:	2001      	movs	r0, #1
20022fac:	e7e3      	b.n	20022f76 <HAL_FLASH_CONFIG_FULL_AHB_READ+0x42>

20022fae <HAL_FLASH_PRE_CMD>:
20022fae:	b530      	push	{r4, r5, lr}
20022fb0:	68c4      	ldr	r4, [r0, #12]
20022fb2:	b087      	sub	sp, #28
20022fb4:	b304      	cbz	r4, 20022ff8 <HAL_FLASH_PRE_CMD+0x4a>
20022fb6:	2938      	cmp	r1, #56	@ 0x38
20022fb8:	d81e      	bhi.n	20022ff8 <HAL_FLASH_PRE_CMD+0x4a>
20022fba:	eb01 01c1 	add.w	r1, r1, r1, lsl #3
20022fbe:	440c      	add	r4, r1
20022fc0:	7c23      	ldrb	r3, [r4, #16]
20022fc2:	b1cb      	cbz	r3, 20022ff8 <HAL_FLASH_PRE_CMD+0x4a>
20022fc4:	f994 5018 	ldrsb.w	r5, [r4, #24]
20022fc8:	f994 3013 	ldrsb.w	r3, [r4, #19]
20022fcc:	f994 2012 	ldrsb.w	r2, [r4, #18]
20022fd0:	f994 1011 	ldrsb.w	r1, [r4, #17]
20022fd4:	9504      	str	r5, [sp, #16]
20022fd6:	f994 5017 	ldrsb.w	r5, [r4, #23]
20022fda:	9503      	str	r5, [sp, #12]
20022fdc:	f994 5016 	ldrsb.w	r5, [r4, #22]
20022fe0:	9502      	str	r5, [sp, #8]
20022fe2:	f994 5015 	ldrsb.w	r5, [r4, #21]
20022fe6:	9501      	str	r5, [sp, #4]
20022fe8:	f994 4014 	ldrsb.w	r4, [r4, #20]
20022fec:	9400      	str	r4, [sp, #0]
20022fee:	f7ff fdd0 	bl	20022b92 <HAL_FLASH_MANUAL_CMD>
20022ff2:	2000      	movs	r0, #0
20022ff4:	b007      	add	sp, #28
20022ff6:	bd30      	pop	{r4, r5, pc}
20022ff8:	2001      	movs	r0, #1
20022ffa:	e7fb      	b.n	20022ff4 <HAL_FLASH_PRE_CMD+0x46>

20022ffc <HAL_FLASH_ISSUE_CMD>:
20022ffc:	b5f0      	push	{r4, r5, r6, r7, lr}
20022ffe:	68c4      	ldr	r4, [r0, #12]
20023000:	4606      	mov	r6, r0
20023002:	4617      	mov	r7, r2
20023004:	b087      	sub	sp, #28
20023006:	b354      	cbz	r4, 2002305e <HAL_FLASH_ISSUE_CMD+0x62>
20023008:	2938      	cmp	r1, #56	@ 0x38
2002300a:	d828      	bhi.n	2002305e <HAL_FLASH_ISSUE_CMD+0x62>
2002300c:	eb01 05c1 	add.w	r5, r1, r1, lsl #3
20023010:	442c      	add	r4, r5
20023012:	7c23      	ldrb	r3, [r4, #16]
20023014:	b31b      	cbz	r3, 2002305e <HAL_FLASH_ISSUE_CMD+0x62>
20023016:	f994 c018 	ldrsb.w	ip, [r4, #24]
2002301a:	f994 3013 	ldrsb.w	r3, [r4, #19]
2002301e:	f994 2012 	ldrsb.w	r2, [r4, #18]
20023022:	f994 1011 	ldrsb.w	r1, [r4, #17]
20023026:	f8cd c010 	str.w	ip, [sp, #16]
2002302a:	f994 c017 	ldrsb.w	ip, [r4, #23]
2002302e:	f8cd c00c 	str.w	ip, [sp, #12]
20023032:	f994 c016 	ldrsb.w	ip, [r4, #22]
20023036:	f8cd c008 	str.w	ip, [sp, #8]
2002303a:	f994 c015 	ldrsb.w	ip, [r4, #21]
2002303e:	f8cd c004 	str.w	ip, [sp, #4]
20023042:	f994 4014 	ldrsb.w	r4, [r4, #20]
20023046:	9400      	str	r4, [sp, #0]
20023048:	f7ff fda3 	bl	20022b92 <HAL_FLASH_MANUAL_CMD>
2002304c:	68f3      	ldr	r3, [r6, #12]
2002304e:	463a      	mov	r2, r7
20023050:	442b      	add	r3, r5
20023052:	4630      	mov	r0, r6
20023054:	7c19      	ldrb	r1, [r3, #16]
20023056:	f7ff fd57 	bl	20022b08 <HAL_FLASH_SET_CMD>
2002305a:	b007      	add	sp, #28
2002305c:	bdf0      	pop	{r4, r5, r6, r7, pc}
2002305e:	2001      	movs	r0, #1
20023060:	e7fb      	b.n	2002305a <HAL_FLASH_ISSUE_CMD+0x5e>

20023062 <HAL_FLASH_ISSUE_CMD_SEQ>:
20023062:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20023066:	4690      	mov	r8, r2
20023068:	68c2      	ldr	r2, [r0, #12]
2002306a:	4604      	mov	r4, r0
2002306c:	b086      	sub	sp, #24
2002306e:	2a00      	cmp	r2, #0
20023070:	d072      	beq.n	20023158 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
20023072:	2938      	cmp	r1, #56	@ 0x38
20023074:	d870      	bhi.n	20023158 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
20023076:	eb01 07c1 	add.w	r7, r1, r1, lsl #3
2002307a:	19d6      	adds	r6, r2, r7
2002307c:	7c31      	ldrb	r1, [r6, #16]
2002307e:	2900      	cmp	r1, #0
20023080:	d06a      	beq.n	20023158 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
20023082:	2b38      	cmp	r3, #56	@ 0x38
20023084:	d868      	bhi.n	20023158 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
20023086:	eb03 05c3 	add.w	r5, r3, r3, lsl #3
2002308a:	442a      	add	r2, r5
2002308c:	7c13      	ldrb	r3, [r2, #16]
2002308e:	2b00      	cmp	r3, #0
20023090:	d062      	beq.n	20023158 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
20023092:	f996 c018 	ldrsb.w	ip, [r6, #24]
20023096:	f996 3013 	ldrsb.w	r3, [r6, #19]
2002309a:	f996 2012 	ldrsb.w	r2, [r6, #18]
2002309e:	f996 1011 	ldrsb.w	r1, [r6, #17]
200230a2:	f8cd c010 	str.w	ip, [sp, #16]
200230a6:	f996 c017 	ldrsb.w	ip, [r6, #23]
200230aa:	f8cd c00c 	str.w	ip, [sp, #12]
200230ae:	f996 c016 	ldrsb.w	ip, [r6, #22]
200230b2:	f8cd c008 	str.w	ip, [sp, #8]
200230b6:	f996 c015 	ldrsb.w	ip, [r6, #21]
200230ba:	f8cd c004 	str.w	ip, [sp, #4]
200230be:	f996 6014 	ldrsb.w	r6, [r6, #20]
200230c2:	9600      	str	r6, [sp, #0]
200230c4:	f7ff fd65 	bl	20022b92 <HAL_FLASH_MANUAL_CMD>
200230c8:	68e0      	ldr	r0, [r4, #12]
200230ca:	4428      	add	r0, r5
200230cc:	f990 6018 	ldrsb.w	r6, [r0, #24]
200230d0:	f990 3013 	ldrsb.w	r3, [r0, #19]
200230d4:	f990 2012 	ldrsb.w	r2, [r0, #18]
200230d8:	f990 1011 	ldrsb.w	r1, [r0, #17]
200230dc:	9604      	str	r6, [sp, #16]
200230de:	f990 6017 	ldrsb.w	r6, [r0, #23]
200230e2:	9603      	str	r6, [sp, #12]
200230e4:	f990 6016 	ldrsb.w	r6, [r0, #22]
200230e8:	9602      	str	r6, [sp, #8]
200230ea:	f990 6015 	ldrsb.w	r6, [r0, #21]
200230ee:	9601      	str	r6, [sp, #4]
200230f0:	f990 0014 	ldrsb.w	r0, [r0, #20]
200230f4:	9000      	str	r0, [sp, #0]
200230f6:	4620      	mov	r0, r4
200230f8:	f7ff fd6c 	bl	20022bd4 <HAL_FLASH_MANUAL_CMD2>
200230fc:	2200      	movs	r2, #0
200230fe:	6823      	ldr	r3, [r4, #0]
20023100:	2101      	movs	r1, #1
20023102:	67da      	str	r2, [r3, #124]	@ 0x7c
20023104:	68e3      	ldr	r3, [r4, #12]
20023106:	6822      	ldr	r2, [r4, #0]
20023108:	442b      	add	r3, r5
2002310a:	7c1b      	ldrb	r3, [r3, #16]
2002310c:	4620      	mov	r0, r4
2002310e:	62d3      	str	r3, [r2, #44]	@ 0x2c
20023110:	6823      	ldr	r3, [r4, #0]
20023112:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
20023114:	f8c3 2080 	str.w	r2, [r3, #128]	@ 0x80
20023118:	f7ff fe01 	bl	20022d1e <HAL_FLASH_ENABLE_CMD2>
2002311c:	4620      	mov	r0, r4
2002311e:	f7ff fe0c 	bl	20022d3a <HAL_FLASH_STAUS_MATCH_CMD2>
20023122:	6823      	ldr	r3, [r4, #0]
20023124:	f8c3 801c 	str.w	r8, [r3, #28]
20023128:	68e3      	ldr	r3, [r4, #12]
2002312a:	6822      	ldr	r2, [r4, #0]
2002312c:	443b      	add	r3, r7
2002312e:	7c1b      	ldrb	r3, [r3, #16]
20023130:	6193      	str	r3, [r2, #24]
20023132:	4620      	mov	r0, r4
20023134:	f7ff fd0a 	bl	20022b4c <HAL_FLASH_STATUS_MATCH>
20023138:	2800      	cmp	r0, #0
2002313a:	d0fa      	beq.n	20023132 <HAL_FLASH_ISSUE_CMD_SEQ+0xd0>
2002313c:	2109      	movs	r1, #9
2002313e:	4620      	mov	r0, r4
20023140:	f7ff fcfe 	bl	20022b40 <HAL_FLASH_CLR_STATUS>
20023144:	2100      	movs	r1, #0
20023146:	f7ff fdea 	bl	20022d1e <HAL_FLASH_ENABLE_CMD2>
2002314a:	4620      	mov	r0, r4
2002314c:	f7ff fdf5 	bl	20022d3a <HAL_FLASH_STAUS_MATCH_CMD2>
20023150:	4608      	mov	r0, r1
20023152:	b006      	add	sp, #24
20023154:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20023158:	2001      	movs	r0, #1
2002315a:	e7fa      	b.n	20023152 <HAL_FLASH_ISSUE_CMD_SEQ+0xf0>

2002315c <nor_qspi_switch>:
2002315c:	b570      	push	{r4, r5, r6, lr}
2002315e:	4604      	mov	r4, r0
20023160:	b3e0      	cbz	r0, 200231dc <nor_qspi_switch+0x80>
20023162:	68c3      	ldr	r3, [r0, #12]
20023164:	b3d3      	cbz	r3, 200231dc <nor_qspi_switch+0x80>
20023166:	b3c9      	cbz	r1, 200231dc <nor_qspi_switch+0x80>
20023168:	f893 5193 	ldrb.w	r5, [r3, #403]	@ 0x193
2002316c:	2101      	movs	r1, #1
2002316e:	b3b5      	cbz	r5, 200231de <nor_qspi_switch+0x82>
20023170:	f7ff fca5 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
20023174:	2200      	movs	r2, #0
20023176:	2114      	movs	r1, #20
20023178:	4620      	mov	r0, r4
2002317a:	f7ff ff3f 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
2002317e:	4620      	mov	r0, r4
20023180:	f7ff fcf3 	bl	20022b6a <HAL_FLASH_READ32>
20023184:	f010 0501 	ands.w	r5, r0, #1
20023188:	d000      	beq.n	2002318c <nor_qspi_switch+0x30>
2002318a:	e7fe      	b.n	2002318a <nor_qspi_switch+0x2e>
2002318c:	462a      	mov	r2, r5
2002318e:	2115      	movs	r1, #21
20023190:	4620      	mov	r0, r4
20023192:	f7ff ff33 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023196:	4606      	mov	r6, r0
20023198:	b120      	cbz	r0, 200231a4 <nor_qspi_switch+0x48>
2002319a:	462a      	mov	r2, r5
2002319c:	4629      	mov	r1, r5
2002319e:	4620      	mov	r0, r4
200231a0:	f7ff ff2c 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200231a4:	2102      	movs	r1, #2
200231a6:	4620      	mov	r0, r4
200231a8:	f7ff fc82 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
200231ac:	2101      	movs	r1, #1
200231ae:	4620      	mov	r0, r4
200231b0:	f7ff fc85 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200231b4:	2200      	movs	r2, #0
200231b6:	212b      	movs	r1, #43	@ 0x2b
200231b8:	4620      	mov	r0, r4
200231ba:	f7ff ff1f 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200231be:	b16e      	cbz	r6, 200231dc <nor_qspi_switch+0x80>
200231c0:	2101      	movs	r1, #1
200231c2:	4620      	mov	r0, r4
200231c4:	f7ff fc7b 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200231c8:	2200      	movs	r2, #0
200231ca:	2102      	movs	r1, #2
200231cc:	4620      	mov	r0, r4
200231ce:	f7ff ff15 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200231d2:	4620      	mov	r0, r4
200231d4:	f7ff fcc0 	bl	20022b58 <HAL_FLASH_IS_PROG_DONE>
200231d8:	2800      	cmp	r0, #0
200231da:	d0f5      	beq.n	200231c8 <nor_qspi_switch+0x6c>
200231dc:	bd70      	pop	{r4, r5, r6, pc}
200231de:	f7ff fc6e 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200231e2:	462a      	mov	r2, r5
200231e4:	2102      	movs	r1, #2
200231e6:	4620      	mov	r0, r4
200231e8:	f7ff ff08 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200231ec:	4620      	mov	r0, r4
200231ee:	f7ff fcbc 	bl	20022b6a <HAL_FLASH_READ32>
200231f2:	462a      	mov	r2, r5
200231f4:	2114      	movs	r1, #20
200231f6:	4620      	mov	r0, r4
200231f8:	f7ff ff00 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200231fc:	b910      	cbnz	r0, 20023204 <nor_qspi_switch+0xa8>
200231fe:	4620      	mov	r0, r4
20023200:	f7ff fcb3 	bl	20022b6a <HAL_FLASH_READ32>
20023204:	68e3      	ldr	r3, [r4, #12]
20023206:	7a1b      	ldrb	r3, [r3, #8]
20023208:	b3ab      	cbz	r3, 20023276 <nor_qspi_switch+0x11a>
2002320a:	2101      	movs	r1, #1
2002320c:	f003 050f 	and.w	r5, r3, #15
20023210:	091b      	lsrs	r3, r3, #4
20023212:	fa01 f303 	lsl.w	r3, r1, r3
20023216:	b2db      	uxtb	r3, r3
20023218:	b10d      	cbz	r5, 2002321e <nor_qspi_switch+0xc2>
2002321a:	461d      	mov	r5, r3
2002321c:	2300      	movs	r3, #0
2002321e:	2200      	movs	r2, #0
20023220:	2115      	movs	r1, #21
20023222:	4620      	mov	r0, r4
20023224:	ea43 2505 	orr.w	r5, r3, r5, lsl #8
20023228:	f7ff fee8 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
2002322c:	4606      	mov	r6, r0
2002322e:	b120      	cbz	r0, 2002323a <nor_qspi_switch+0xde>
20023230:	2200      	movs	r2, #0
20023232:	4620      	mov	r0, r4
20023234:	4611      	mov	r1, r2
20023236:	f7ff fee1 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
2002323a:	4629      	mov	r1, r5
2002323c:	4620      	mov	r0, r4
2002323e:	f7ff fc37 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
20023242:	2102      	movs	r1, #2
20023244:	4620      	mov	r0, r4
20023246:	f7ff fc3a 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
2002324a:	2200      	movs	r2, #0
2002324c:	2103      	movs	r1, #3
2002324e:	4620      	mov	r0, r4
20023250:	f7ff fed4 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023254:	2e00      	cmp	r6, #0
20023256:	d0c1      	beq.n	200231dc <nor_qspi_switch+0x80>
20023258:	2101      	movs	r1, #1
2002325a:	4620      	mov	r0, r4
2002325c:	f7ff fc2f 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
20023260:	2200      	movs	r2, #0
20023262:	2102      	movs	r1, #2
20023264:	4620      	mov	r0, r4
20023266:	f7ff fec9 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
2002326a:	4620      	mov	r0, r4
2002326c:	f7ff fc74 	bl	20022b58 <HAL_FLASH_IS_PROG_DONE>
20023270:	2800      	cmp	r0, #0
20023272:	d0f5      	beq.n	20023260 <nor_qspi_switch+0x104>
20023274:	e7b2      	b.n	200231dc <nor_qspi_switch+0x80>
20023276:	2502      	movs	r5, #2
20023278:	e7d1      	b.n	2002321e <nor_qspi_switch+0xc2>

2002327a <HAL_FLASH_SET_QUAL_SPI>:
2002327a:	b538      	push	{r3, r4, r5, lr}
2002327c:	4604      	mov	r4, r0
2002327e:	460d      	mov	r5, r1
20023280:	f7ff ff6c 	bl	2002315c <nor_qspi_switch>
20023284:	4629      	mov	r1, r5
20023286:	4620      	mov	r0, r4
20023288:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
2002328c:	f7ff be0e 	b.w	20022eac <HAL_FLASH_CONFIG_AHB_READ>

20023290 <HAL_FLASH_FADDR_SET_QSPI>:
20023290:	b538      	push	{r3, r4, r5, lr}
20023292:	4604      	mov	r4, r0
20023294:	460d      	mov	r5, r1
20023296:	f7ff ff61 	bl	2002315c <nor_qspi_switch>
2002329a:	4629      	mov	r1, r5
2002329c:	4620      	mov	r0, r4
2002329e:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
200232a2:	f7ff be47 	b.w	20022f34 <HAL_FLASH_CONFIG_FULL_AHB_READ>

200232a6 <HAL_FLASH_GET_NOR_ID>:
200232a6:	b510      	push	{r4, lr}
200232a8:	4604      	mov	r4, r0
200232aa:	b140      	cbz	r0, 200232be <HAL_FLASH_GET_NOR_ID+0x18>
200232ac:	6802      	ldr	r2, [r0, #0]
200232ae:	6a93      	ldr	r3, [r2, #40]	@ 0x28
200232b0:	f36f 0315 	bfc	r3, #0, #22
200232b4:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
200232b8:	f043 0301 	orr.w	r3, r3, #1
200232bc:	6293      	str	r3, [r2, #40]	@ 0x28
200232be:	2103      	movs	r1, #3
200232c0:	4620      	mov	r0, r4
200232c2:	f7ff fbfc 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200232c6:	2200      	movs	r2, #0
200232c8:	219f      	movs	r1, #159	@ 0x9f
200232ca:	4620      	mov	r0, r4
200232cc:	f7ff fc1c 	bl	20022b08 <HAL_FLASH_SET_CMD>
200232d0:	4620      	mov	r0, r4
200232d2:	f7ff fc4a 	bl	20022b6a <HAL_FLASH_READ32>
200232d6:	f020 407f 	bic.w	r0, r0, #4278190080	@ 0xff000000
200232da:	bd10      	pop	{r4, pc}

200232dc <HAL_FLASH_CLR_PROTECT>:
200232dc:	b570      	push	{r4, r5, r6, lr}
200232de:	4604      	mov	r4, r0
200232e0:	2800      	cmp	r0, #0
200232e2:	d03e      	beq.n	20023362 <HAL_FLASH_CLR_PROTECT+0x86>
200232e4:	68c3      	ldr	r3, [r0, #12]
200232e6:	2101      	movs	r1, #1
200232e8:	f893 5193 	ldrb.w	r5, [r3, #403]	@ 0x193
200232ec:	2d00      	cmp	r5, #0
200232ee:	d03b      	beq.n	20023368 <HAL_FLASH_CLR_PROTECT+0x8c>
200232f0:	f7ff fbe5 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200232f4:	2200      	movs	r2, #0
200232f6:	2102      	movs	r1, #2
200232f8:	4620      	mov	r0, r4
200232fa:	f7ff fe7f 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200232fe:	bb88      	cbnz	r0, 20023364 <HAL_FLASH_CLR_PROTECT+0x88>
20023300:	4620      	mov	r0, r4
20023302:	f7ff fc32 	bl	20022b6a <HAL_FLASH_READ32>
20023306:	b2c0      	uxtb	r0, r0
20023308:	68e3      	ldr	r3, [r4, #12]
2002330a:	79dd      	ldrb	r5, [r3, #7]
2002330c:	b10d      	cbz	r5, 20023312 <HAL_FLASH_CLR_PROTECT+0x36>
2002330e:	ea20 0505 	bic.w	r5, r0, r5
20023312:	2200      	movs	r2, #0
20023314:	2115      	movs	r1, #21
20023316:	4620      	mov	r0, r4
20023318:	f7ff fe70 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
2002331c:	4606      	mov	r6, r0
2002331e:	b120      	cbz	r0, 2002332a <HAL_FLASH_CLR_PROTECT+0x4e>
20023320:	2200      	movs	r2, #0
20023322:	4620      	mov	r0, r4
20023324:	4611      	mov	r1, r2
20023326:	f7ff fe69 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
2002332a:	4629      	mov	r1, r5
2002332c:	4620      	mov	r0, r4
2002332e:	f7ff fbbf 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
20023332:	2101      	movs	r1, #1
20023334:	4620      	mov	r0, r4
20023336:	f7ff fbc2 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
2002333a:	2200      	movs	r2, #0
2002333c:	2103      	movs	r1, #3
2002333e:	4620      	mov	r0, r4
20023340:	f7ff fe5c 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023344:	b16e      	cbz	r6, 20023362 <HAL_FLASH_CLR_PROTECT+0x86>
20023346:	2101      	movs	r1, #1
20023348:	4620      	mov	r0, r4
2002334a:	f7ff fbb8 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
2002334e:	2200      	movs	r2, #0
20023350:	2102      	movs	r1, #2
20023352:	4620      	mov	r0, r4
20023354:	f7ff fe52 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023358:	4620      	mov	r0, r4
2002335a:	f7ff fbfd 	bl	20022b58 <HAL_FLASH_IS_PROG_DONE>
2002335e:	2800      	cmp	r0, #0
20023360:	d0f5      	beq.n	2002334e <HAL_FLASH_CLR_PROTECT+0x72>
20023362:	bd70      	pop	{r4, r5, r6, pc}
20023364:	2000      	movs	r0, #0
20023366:	e7cf      	b.n	20023308 <HAL_FLASH_CLR_PROTECT+0x2c>
20023368:	f7ff fba9 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
2002336c:	462a      	mov	r2, r5
2002336e:	2102      	movs	r1, #2
20023370:	4620      	mov	r0, r4
20023372:	f7ff fe43 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023376:	2800      	cmp	r0, #0
20023378:	d13e      	bne.n	200233f8 <HAL_FLASH_CLR_PROTECT+0x11c>
2002337a:	4620      	mov	r0, r4
2002337c:	f7ff fbf5 	bl	20022b6a <HAL_FLASH_READ32>
20023380:	b2c6      	uxtb	r6, r0
20023382:	2200      	movs	r2, #0
20023384:	2114      	movs	r1, #20
20023386:	4620      	mov	r0, r4
20023388:	f7ff fe38 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
2002338c:	b918      	cbnz	r0, 20023396 <HAL_FLASH_CLR_PROTECT+0xba>
2002338e:	4620      	mov	r0, r4
20023390:	f7ff fbeb 	bl	20022b6a <HAL_FLASH_READ32>
20023394:	b2c5      	uxtb	r5, r0
20023396:	68e3      	ldr	r3, [r4, #12]
20023398:	79d9      	ldrb	r1, [r3, #7]
2002339a:	b109      	cbz	r1, 200233a0 <HAL_FLASH_CLR_PROTECT+0xc4>
2002339c:	ea26 0101 	bic.w	r1, r6, r1
200233a0:	2200      	movs	r2, #0
200233a2:	4620      	mov	r0, r4
200233a4:	ea41 2505 	orr.w	r5, r1, r5, lsl #8
200233a8:	2115      	movs	r1, #21
200233aa:	f7ff fe27 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200233ae:	4606      	mov	r6, r0
200233b0:	b120      	cbz	r0, 200233bc <HAL_FLASH_CLR_PROTECT+0xe0>
200233b2:	2200      	movs	r2, #0
200233b4:	4620      	mov	r0, r4
200233b6:	4611      	mov	r1, r2
200233b8:	f7ff fe20 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200233bc:	4629      	mov	r1, r5
200233be:	4620      	mov	r0, r4
200233c0:	f7ff fb76 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
200233c4:	2102      	movs	r1, #2
200233c6:	4620      	mov	r0, r4
200233c8:	f7ff fb79 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200233cc:	2200      	movs	r2, #0
200233ce:	2103      	movs	r1, #3
200233d0:	4620      	mov	r0, r4
200233d2:	f7ff fe13 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200233d6:	2e00      	cmp	r6, #0
200233d8:	d0c3      	beq.n	20023362 <HAL_FLASH_CLR_PROTECT+0x86>
200233da:	2101      	movs	r1, #1
200233dc:	4620      	mov	r0, r4
200233de:	f7ff fb6e 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200233e2:	2200      	movs	r2, #0
200233e4:	2102      	movs	r1, #2
200233e6:	4620      	mov	r0, r4
200233e8:	f7ff fe08 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200233ec:	4620      	mov	r0, r4
200233ee:	f7ff fbb3 	bl	20022b58 <HAL_FLASH_IS_PROG_DONE>
200233f2:	2800      	cmp	r0, #0
200233f4:	d0f5      	beq.n	200233e2 <HAL_FLASH_CLR_PROTECT+0x106>
200233f6:	e7b4      	b.n	20023362 <HAL_FLASH_CLR_PROTECT+0x86>
200233f8:	462e      	mov	r6, r5
200233fa:	e7c2      	b.n	20023382 <HAL_FLASH_CLR_PROTECT+0xa6>

200233fc <HAL_QSPI_SET_CLK_INV>:
200233fc:	b160      	cbz	r0, 20023418 <HAL_QSPI_SET_CLK_INV+0x1c>
200233fe:	6800      	ldr	r0, [r0, #0]
20023400:	b150      	cbz	r0, 20023418 <HAL_QSPI_SET_CLK_INV+0x1c>
20023402:	6d83      	ldr	r3, [r0, #88]	@ 0x58
20023404:	0609      	lsls	r1, r1, #24
20023406:	f023 7380 	bic.w	r3, r3, #16777216	@ 0x1000000
2002340a:	f001 7180 	and.w	r1, r1, #16777216	@ 0x1000000
2002340e:	f023 03ff 	bic.w	r3, r3, #255	@ 0xff
20023412:	4311      	orrs	r1, r2
20023414:	4319      	orrs	r1, r3
20023416:	6581      	str	r1, [r0, #88]	@ 0x58
20023418:	4770      	bx	lr

2002341a <HAL_FLASH_RELEASE_DPD>:
2002341a:	b538      	push	{r3, r4, r5, lr}
2002341c:	4604      	mov	r4, r0
2002341e:	b1d0      	cbz	r0, 20023456 <HAL_FLASH_RELEASE_DPD+0x3c>
20023420:	6803      	ldr	r3, [r0, #0]
20023422:	21ab      	movs	r1, #171	@ 0xab
20023424:	681d      	ldr	r5, [r3, #0]
20023426:	f015 0501 	ands.w	r5, r5, #1
2002342a:	bf02      	ittt	eq
2002342c:	681a      	ldreq	r2, [r3, #0]
2002342e:	f042 0201 	orreq.w	r2, r2, #1
20023432:	601a      	streq	r2, [r3, #0]
20023434:	6802      	ldr	r2, [r0, #0]
20023436:	6a93      	ldr	r3, [r2, #40]	@ 0x28
20023438:	f36f 0315 	bfc	r3, #0, #22
2002343c:	f043 0301 	orr.w	r3, r3, #1
20023440:	6293      	str	r3, [r2, #40]	@ 0x28
20023442:	2200      	movs	r2, #0
20023444:	f7ff fb60 	bl	20022b08 <HAL_FLASH_SET_CMD>
20023448:	b925      	cbnz	r5, 20023454 <HAL_FLASH_RELEASE_DPD+0x3a>
2002344a:	6822      	ldr	r2, [r4, #0]
2002344c:	6813      	ldr	r3, [r2, #0]
2002344e:	f023 0301 	bic.w	r3, r3, #1
20023452:	6013      	str	r3, [r2, #0]
20023454:	bd38      	pop	{r3, r4, r5, pc}
20023456:	2001      	movs	r0, #1
20023458:	e7fc      	b.n	20023454 <HAL_FLASH_RELEASE_DPD+0x3a>

2002345a <flash_handle_valid>:
2002345a:	b118      	cbz	r0, 20023464 <flash_handle_valid+0xa>
2002345c:	68c0      	ldr	r0, [r0, #12]
2002345e:	3800      	subs	r0, #0
20023460:	bf18      	it	ne
20023462:	2001      	movne	r0, #1
20023464:	4770      	bx	lr

20023466 <HAL_GET_FLASH_MID>:
20023466:	2000      	movs	r0, #0
20023468:	4770      	bx	lr

2002346a <HAL_FLASH_DMA_START>:
2002346a:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
2002346e:	4688      	mov	r8, r1
20023470:	4699      	mov	r9, r3
20023472:	4604      	mov	r4, r0
20023474:	2800      	cmp	r0, #0
20023476:	d045      	beq.n	20023504 <HAL_FLASH_DMA_START+0x9a>
20023478:	6883      	ldr	r3, [r0, #8]
2002347a:	2b00      	cmp	r3, #0
2002347c:	d042      	beq.n	20023504 <HAL_FLASH_DMA_START+0x9a>
2002347e:	f1b9 0f00 	cmp.w	r9, #0
20023482:	d03f      	beq.n	20023504 <HAL_FLASH_DMA_START+0x9a>
20023484:	6801      	ldr	r1, [r0, #0]
20023486:	680f      	ldr	r7, [r1, #0]
20023488:	b332      	cbz	r2, 200234d8 <HAL_FLASH_DMA_START+0x6e>
2002348a:	2210      	movs	r2, #16
2002348c:	609a      	str	r2, [r3, #8]
2002348e:	2300      	movs	r3, #0
20023490:	6882      	ldr	r2, [r0, #8]
20023492:	464e      	mov	r6, r9
20023494:	6153      	str	r3, [r2, #20]
20023496:	6882      	ldr	r2, [r0, #8]
20023498:	6193      	str	r3, [r2, #24]
2002349a:	6882      	ldr	r2, [r0, #8]
2002349c:	60d3      	str	r3, [r2, #12]
2002349e:	2280      	movs	r2, #128	@ 0x80
200234a0:	6883      	ldr	r3, [r0, #8]
200234a2:	611a      	str	r2, [r3, #16]
200234a4:	6805      	ldr	r5, [r0, #0]
200234a6:	3504      	adds	r5, #4
200234a8:	68a0      	ldr	r0, [r4, #8]
200234aa:	f7ff f84b 	bl	20022544 <HAL_DMA_DeInit>
200234ae:	bb50      	cbnz	r0, 20023506 <HAL_FLASH_DMA_START+0x9c>
200234b0:	68a0      	ldr	r0, [r4, #8]
200234b2:	f7fe ffe3 	bl	2002247c <HAL_DMA_Init>
200234b6:	bb30      	cbnz	r0, 20023506 <HAL_FLASH_DMA_START+0x9c>
200234b8:	6823      	ldr	r3, [r4, #0]
200234ba:	f047 0720 	orr.w	r7, r7, #32
200234be:	601f      	str	r7, [r3, #0]
200234c0:	6822      	ldr	r2, [r4, #0]
200234c2:	f109 33ff 	add.w	r3, r9, #4294967295	@ 0xffffffff
200234c6:	6253      	str	r3, [r2, #36]	@ 0x24
200234c8:	4641      	mov	r1, r8
200234ca:	4633      	mov	r3, r6
200234cc:	462a      	mov	r2, r5
200234ce:	68a0      	ldr	r0, [r4, #8]
200234d0:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
200234d4:	f7ff b994 	b.w	20022800 <HAL_DMA_Start>
200234d8:	f44f 7100 	mov.w	r1, #512	@ 0x200
200234dc:	609a      	str	r2, [r3, #8]
200234de:	6883      	ldr	r3, [r0, #8]
200234e0:	f109 0603 	add.w	r6, r9, #3
200234e4:	6159      	str	r1, [r3, #20]
200234e6:	f44f 6100 	mov.w	r1, #2048	@ 0x800
200234ea:	6883      	ldr	r3, [r0, #8]
200234ec:	4645      	mov	r5, r8
200234ee:	6199      	str	r1, [r3, #24]
200234f0:	6883      	ldr	r3, [r0, #8]
200234f2:	08b6      	lsrs	r6, r6, #2
200234f4:	60da      	str	r2, [r3, #12]
200234f6:	2280      	movs	r2, #128	@ 0x80
200234f8:	6883      	ldr	r3, [r0, #8]
200234fa:	611a      	str	r2, [r3, #16]
200234fc:	6803      	ldr	r3, [r0, #0]
200234fe:	f103 0804 	add.w	r8, r3, #4
20023502:	e7d1      	b.n	200234a8 <HAL_FLASH_DMA_START+0x3e>
20023504:	2001      	movs	r0, #1
20023506:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

2002350a <HAL_FLASH_DMA_WAIT_DONE>:
2002350a:	b510      	push	{r4, lr}
2002350c:	460a      	mov	r2, r1
2002350e:	4604      	mov	r4, r0
20023510:	b170      	cbz	r0, 20023530 <HAL_FLASH_DMA_WAIT_DONE+0x26>
20023512:	6880      	ldr	r0, [r0, #8]
20023514:	b160      	cbz	r0, 20023530 <HAL_FLASH_DMA_WAIT_DONE+0x26>
20023516:	6ae1      	ldr	r1, [r4, #44]	@ 0x2c
20023518:	b111      	cbz	r1, 20023520 <HAL_FLASH_DMA_WAIT_DONE+0x16>
2002351a:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
2002351e:	2100      	movs	r1, #0
20023520:	f7ff f870 	bl	20022604 <HAL_DMA_PollForTransfer>
20023524:	6822      	ldr	r2, [r4, #0]
20023526:	6813      	ldr	r3, [r2, #0]
20023528:	f023 0320 	bic.w	r3, r3, #32
2002352c:	6013      	str	r3, [r2, #0]
2002352e:	bd10      	pop	{r4, pc}
20023530:	2001      	movs	r0, #1
20023532:	e7fc      	b.n	2002352e <HAL_FLASH_DMA_WAIT_DONE+0x24>

20023534 <HAL_FLASH_ALIAS_CFG>:
20023534:	b538      	push	{r3, r4, r5, lr}
20023536:	461d      	mov	r5, r3
20023538:	4604      	mov	r4, r0
2002353a:	b158      	cbz	r0, 20023554 <HAL_FLASH_ALIAS_CFG+0x20>
2002353c:	6903      	ldr	r3, [r0, #16]
2002353e:	428b      	cmp	r3, r1
20023540:	bf98      	it	ls
20023542:	1ac9      	subls	r1, r1, r3
20023544:	f7ff fb68 	bl	20022c18 <HAL_FLASH_SET_ALIAS_RANGE>
20023548:	4629      	mov	r1, r5
2002354a:	4620      	mov	r0, r4
2002354c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
20023550:	f7ff bb74 	b.w	20022c3c <HAL_FLASH_SET_ALIAS_OFFSET>
20023554:	bd38      	pop	{r3, r4, r5, pc}

20023556 <HAL_FLASH_NONCE_CFG>:
20023556:	b570      	push	{r4, r5, r6, lr}
20023558:	460c      	mov	r4, r1
2002355a:	4615      	mov	r5, r2
2002355c:	4619      	mov	r1, r3
2002355e:	4606      	mov	r6, r0
20023560:	b180      	cbz	r0, 20023584 <HAL_FLASH_NONCE_CFG+0x2e>
20023562:	b17b      	cbz	r3, 20023584 <HAL_FLASH_NONCE_CFG+0x2e>
20023564:	f7ff fb86 	bl	20022c74 <HAL_FLASH_SET_NONCE>
20023568:	6933      	ldr	r3, [r6, #16]
2002356a:	4630      	mov	r0, r6
2002356c:	42a3      	cmp	r3, r4
2002356e:	bf98      	it	ls
20023570:	1ae4      	subls	r4, r4, r3
20023572:	42ab      	cmp	r3, r5
20023574:	bf98      	it	ls
20023576:	1aed      	subls	r5, r5, r3
20023578:	462a      	mov	r2, r5
2002357a:	4621      	mov	r1, r4
2002357c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
20023580:	f7ff bb66 	b.w	20022c50 <HAL_FLASH_SET_CTR>
20023584:	bd70      	pop	{r4, r5, r6, pc}

20023586 <HAL_FLASH_AES_CFG>:
20023586:	b510      	push	{r4, lr}
20023588:	4604      	mov	r4, r0
2002358a:	b148      	cbz	r0, 200235a0 <HAL_FLASH_AES_CFG+0x1a>
2002358c:	b101      	cbz	r1, 20023590 <HAL_FLASH_AES_CFG+0xa>
2002358e:	2101      	movs	r1, #1
20023590:	f7ff fb7e 	bl	20022c90 <HAL_FLASH_SET_AES>
20023594:	4620      	mov	r0, r4
20023596:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002359a:	2101      	movs	r1, #1
2002359c:	f7ff bb87 	b.w	20022cae <HAL_FLASH_ENABLE_AES>
200235a0:	bd10      	pop	{r4, pc}

200235a2 <nand_read_id>:
200235a2:	b510      	push	{r4, lr}
200235a4:	460b      	mov	r3, r1
200235a6:	4604      	mov	r4, r0
200235a8:	b086      	sub	sp, #24
200235aa:	b320      	cbz	r0, 200235f6 <nand_read_id+0x54>
200235ac:	2908      	cmp	r1, #8
200235ae:	f04f 0100 	mov.w	r1, #0
200235b2:	f04f 0201 	mov.w	r2, #1
200235b6:	bf83      	ittte	hi
200235b8:	460b      	movhi	r3, r1
200235ba:	e9cd 1202 	strdhi	r1, r2, [sp, #8]
200235be:	e9cd 1100 	strdhi	r1, r1, [sp]
200235c2:	e9cd 1102 	strdls	r1, r1, [sp, #8]
200235c6:	bf8e      	itee	hi
200235c8:	4619      	movhi	r1, r3
200235ca:	e9cd 1100 	strdls	r1, r1, [sp]
200235ce:	b25b      	sxtbls	r3, r3
200235d0:	9204      	str	r2, [sp, #16]
200235d2:	f7ff fade 	bl	20022b92 <HAL_FLASH_MANUAL_CMD>
200235d6:	2103      	movs	r1, #3
200235d8:	4620      	mov	r0, r4
200235da:	f7ff fa70 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200235de:	2200      	movs	r2, #0
200235e0:	219f      	movs	r1, #159	@ 0x9f
200235e2:	4620      	mov	r0, r4
200235e4:	f7ff fa90 	bl	20022b08 <HAL_FLASH_SET_CMD>
200235e8:	4620      	mov	r0, r4
200235ea:	f7ff fabe 	bl	20022b6a <HAL_FLASH_READ32>
200235ee:	f020 407f 	bic.w	r0, r0, #4278190080	@ 0xff000000
200235f2:	b006      	add	sp, #24
200235f4:	bd10      	pop	{r4, pc}
200235f6:	20ff      	movs	r0, #255	@ 0xff
200235f8:	e7fb      	b.n	200235f2 <nand_read_id+0x50>

200235fa <HAL_NAND_CONF_ECC>:
200235fa:	b538      	push	{r3, r4, r5, lr}
200235fc:	460d      	mov	r5, r1
200235fe:	4604      	mov	r4, r0
20023600:	b398      	cbz	r0, 2002366a <HAL_NAND_CONF_ECC+0x70>
20023602:	68c3      	ldr	r3, [r0, #12]
20023604:	b38b      	cbz	r3, 2002366a <HAL_NAND_CONF_ECC+0x70>
20023606:	799a      	ldrb	r2, [r3, #6]
20023608:	b392      	cbz	r2, 20023670 <HAL_NAND_CONF_ECC+0x76>
2002360a:	7a9b      	ldrb	r3, [r3, #10]
2002360c:	b383      	cbz	r3, 20023670 <HAL_NAND_CONF_ECC+0x76>
2002360e:	2101      	movs	r1, #1
20023610:	f7ff fa55 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
20023614:	68e3      	ldr	r3, [r4, #12]
20023616:	2102      	movs	r1, #2
20023618:	799a      	ldrb	r2, [r3, #6]
2002361a:	4620      	mov	r0, r4
2002361c:	f7ff fcee 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023620:	4620      	mov	r0, r4
20023622:	f7ff faa2 	bl	20022b6a <HAL_FLASH_READ32>
20023626:	68e3      	ldr	r3, [r4, #12]
20023628:	7a9b      	ldrb	r3, [r3, #10]
2002362a:	b1dd      	cbz	r5, 20023664 <HAL_NAND_CONF_ECC+0x6a>
2002362c:	ea43 0100 	orr.w	r1, r3, r0
20023630:	4620      	mov	r0, r4
20023632:	f7ff fa3d 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
20023636:	2101      	movs	r1, #1
20023638:	4620      	mov	r0, r4
2002363a:	f7ff fa40 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
2002363e:	68e3      	ldr	r3, [r4, #12]
20023640:	2103      	movs	r1, #3
20023642:	799a      	ldrb	r2, [r3, #6]
20023644:	4620      	mov	r0, r4
20023646:	f7ff fcd9 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
2002364a:	68e3      	ldr	r3, [r4, #12]
2002364c:	f884 5025 	strb.w	r5, [r4, #37]	@ 0x25
20023650:	2102      	movs	r1, #2
20023652:	799a      	ldrb	r2, [r3, #6]
20023654:	4620      	mov	r0, r4
20023656:	f7ff fcd1 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
2002365a:	4620      	mov	r0, r4
2002365c:	f7ff fa85 	bl	20022b6a <HAL_FLASH_READ32>
20023660:	2000      	movs	r0, #0
20023662:	bd38      	pop	{r3, r4, r5, pc}
20023664:	ea20 0103 	bic.w	r1, r0, r3
20023668:	e7e2      	b.n	20023630 <HAL_NAND_CONF_ECC+0x36>
2002366a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
2002366e:	e7f8      	b.n	20023662 <HAL_NAND_CONF_ECC+0x68>
20023670:	f06f 0001 	mvn.w	r0, #1
20023674:	e7f5      	b.n	20023662 <HAL_NAND_CONF_ECC+0x68>

20023676 <HAL_NAND_GET_ECC_STATUS>:
20023676:	b510      	push	{r4, lr}
20023678:	4604      	mov	r4, r0
2002367a:	b320      	cbz	r0, 200236c6 <HAL_NAND_GET_ECC_STATUS+0x50>
2002367c:	68c2      	ldr	r2, [r0, #12]
2002367e:	b31a      	cbz	r2, 200236c8 <HAL_NAND_GET_ECC_STATUS+0x52>
20023680:	7913      	ldrb	r3, [r2, #4]
20023682:	b31b      	cbz	r3, 200236cc <HAL_NAND_GET_ECC_STATUS+0x56>
20023684:	79d3      	ldrb	r3, [r2, #7]
20023686:	b30b      	cbz	r3, 200236cc <HAL_NAND_GET_ECC_STATUS+0x56>
20023688:	2101      	movs	r1, #1
2002368a:	f7ff fa18 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
2002368e:	68e3      	ldr	r3, [r4, #12]
20023690:	2102      	movs	r1, #2
20023692:	791a      	ldrb	r2, [r3, #4]
20023694:	4620      	mov	r0, r4
20023696:	f7ff fcb1 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
2002369a:	4620      	mov	r0, r4
2002369c:	f7ff fa65 	bl	20022b6a <HAL_FLASH_READ32>
200236a0:	f894 2024 	ldrb.w	r2, [r4, #36]	@ 0x24
200236a4:	2a3f      	cmp	r2, #63	@ 0x3f
200236a6:	ea4f 1312 	mov.w	r3, r2, lsr #4
200236aa:	d804      	bhi.n	200236b6 <HAL_NAND_GET_ECC_STATUS+0x40>
200236ac:	2b01      	cmp	r3, #1
200236ae:	d808      	bhi.n	200236c2 <HAL_NAND_GET_ECC_STATUS+0x4c>
200236b0:	f000 0030 	and.w	r0, r0, #48	@ 0x30
200236b4:	e007      	b.n	200236c6 <HAL_NAND_GET_ECC_STATUS+0x50>
200236b6:	3b04      	subs	r3, #4
200236b8:	2b01      	cmp	r3, #1
200236ba:	d8f9      	bhi.n	200236b0 <HAL_NAND_GET_ECC_STATUS+0x3a>
200236bc:	f000 00f0 	and.w	r0, r0, #240	@ 0xf0
200236c0:	e001      	b.n	200236c6 <HAL_NAND_GET_ECC_STATUS+0x50>
200236c2:	f000 0070 	and.w	r0, r0, #112	@ 0x70
200236c6:	bd10      	pop	{r4, pc}
200236c8:	4610      	mov	r0, r2
200236ca:	e7fc      	b.n	200236c6 <HAL_NAND_GET_ECC_STATUS+0x50>
200236cc:	4618      	mov	r0, r3
200236ce:	e7fa      	b.n	200236c6 <HAL_NAND_GET_ECC_STATUS+0x50>

200236d0 <HAL_NAND_CHECK_ECC>:
200236d0:	4603      	mov	r3, r0
200236d2:	1108      	asrs	r0, r1, #4
200236d4:	b172      	cbz	r2, 200236f4 <HAL_NAND_CHECK_ECC+0x24>
200236d6:	2b07      	cmp	r3, #7
200236d8:	d80c      	bhi.n	200236f4 <HAL_NAND_CHECK_ECC+0x24>
200236da:	e8df f003 	tbb	[pc, r3]
200236de:	0d04      	.short	0x0d04
200236e0:	3f352e18 	.word	0x3f352e18
200236e4:	4c47      	.short	0x4c47
200236e6:	b128      	cbz	r0, 200236f4 <HAL_NAND_CHECK_ECC+0x24>
200236e8:	2801      	cmp	r0, #1
200236ea:	6813      	ldr	r3, [r2, #0]
200236ec:	d10a      	bne.n	20023704 <HAL_NAND_CHECK_ECC+0x34>
200236ee:	f043 0301 	orr.w	r3, r3, #1
200236f2:	6013      	str	r3, [r2, #0]
200236f4:	2000      	movs	r0, #0
200236f6:	4770      	bx	lr
200236f8:	f020 0302 	bic.w	r3, r0, #2
200236fc:	2b01      	cmp	r3, #1
200236fe:	d003      	beq.n	20023708 <HAL_NAND_CHECK_ECC+0x38>
20023700:	b1d0      	cbz	r0, 20023738 <HAL_NAND_CHECK_ECC+0x68>
20023702:	6813      	ldr	r3, [r2, #0]
20023704:	4303      	orrs	r3, r0
20023706:	e016      	b.n	20023736 <HAL_NAND_CHECK_ECC+0x66>
20023708:	6813      	ldr	r3, [r2, #0]
2002370a:	4303      	orrs	r3, r0
2002370c:	e7f1      	b.n	200236f2 <HAL_NAND_CHECK_ECC+0x22>
2002370e:	2805      	cmp	r0, #5
20023710:	d8f7      	bhi.n	20023702 <HAL_NAND_CHECK_ECC+0x32>
20023712:	a301      	add	r3, pc, #4	@ (adr r3, 20023718 <HAL_NAND_CHECK_ECC+0x48>)
20023714:	f853 f020 	ldr.w	pc, [r3, r0, lsl #2]
20023718:	200236f5 	.word	0x200236f5
2002371c:	20023709 	.word	0x20023709
20023720:	20023731 	.word	0x20023731
20023724:	20023709 	.word	0x20023709
20023728:	20023703 	.word	0x20023703
2002372c:	20023709 	.word	0x20023709
20023730:	6813      	ldr	r3, [r2, #0]
20023732:	f043 0302 	orr.w	r3, r3, #2
20023736:	6013      	str	r3, [r2, #0]
20023738:	4770      	bx	lr
2002373a:	2800      	cmp	r0, #0
2002373c:	d0da      	beq.n	200236f4 <HAL_NAND_CHECK_ECC+0x24>
2002373e:	1e43      	subs	r3, r0, #1
20023740:	2b05      	cmp	r3, #5
20023742:	6813      	ldr	r3, [r2, #0]
20023744:	d9e1      	bls.n	2002370a <HAL_NAND_CHECK_ECC+0x3a>
20023746:	e7dd      	b.n	20023704 <HAL_NAND_CHECK_ECC+0x34>
20023748:	07c3      	lsls	r3, r0, #31
2002374a:	f000 0103 	and.w	r1, r0, #3
2002374e:	d402      	bmi.n	20023756 <HAL_NAND_CHECK_ECC+0x86>
20023750:	2900      	cmp	r1, #0
20023752:	d0cf      	beq.n	200236f4 <HAL_NAND_CHECK_ECC+0x24>
20023754:	e7d5      	b.n	20023702 <HAL_NAND_CHECK_ECC+0x32>
20023756:	6813      	ldr	r3, [r2, #0]
20023758:	430b      	orrs	r3, r1
2002375a:	e7ca      	b.n	200236f2 <HAL_NAND_CHECK_ECC+0x22>
2002375c:	2800      	cmp	r0, #0
2002375e:	d0c9      	beq.n	200236f4 <HAL_NAND_CHECK_ECC+0x24>
20023760:	6813      	ldr	r3, [r2, #0]
20023762:	2808      	cmp	r0, #8
20023764:	ea43 0300 	orr.w	r3, r3, r0
20023768:	dce5      	bgt.n	20023736 <HAL_NAND_CHECK_ECC+0x66>
2002376a:	e7c2      	b.n	200236f2 <HAL_NAND_CHECK_ECC+0x22>
2002376c:	2800      	cmp	r0, #0
2002376e:	d0c1      	beq.n	200236f4 <HAL_NAND_CHECK_ECC+0x24>
20023770:	1e43      	subs	r3, r0, #1
20023772:	2b01      	cmp	r3, #1
20023774:	e7e5      	b.n	20023742 <HAL_NAND_CHECK_ECC+0x72>
20023776:	2800      	cmp	r0, #0
20023778:	d0bc      	beq.n	200236f4 <HAL_NAND_CHECK_ECC+0x24>
2002377a:	1e43      	subs	r3, r0, #1
2002377c:	2b02      	cmp	r3, #2
2002377e:	e7e0      	b.n	20023742 <HAL_NAND_CHECK_ECC+0x72>

20023780 <HAL_NAND_GET_ECC_RESULT>:
20023780:	b510      	push	{r4, lr}
20023782:	f890 3025 	ldrb.w	r3, [r0, #37]	@ 0x25
20023786:	4604      	mov	r4, r0
20023788:	b183      	cbz	r3, 200237ac <HAL_NAND_GET_ECC_RESULT+0x2c>
2002378a:	f7ff ff74 	bl	20023676 <HAL_NAND_GET_ECC_STATUS>
2002378e:	4601      	mov	r1, r0
20023790:	b160      	cbz	r0, 200237ac <HAL_NAND_GET_ECC_RESULT+0x2c>
20023792:	4622      	mov	r2, r4
20023794:	6863      	ldr	r3, [r4, #4]
20023796:	f443 4300 	orr.w	r3, r3, #32768	@ 0x8000
2002379a:	f842 3f04 	str.w	r3, [r2, #4]!
2002379e:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
200237a2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
200237a6:	0900      	lsrs	r0, r0, #4
200237a8:	f7ff bf92 	b.w	200236d0 <HAL_NAND_CHECK_ECC>
200237ac:	2000      	movs	r0, #0
200237ae:	bd10      	pop	{r4, pc}

200237b0 <HAL_NAND_EN_QUAL>:
200237b0:	b538      	push	{r3, r4, r5, lr}
200237b2:	460d      	mov	r5, r1
200237b4:	4604      	mov	r4, r0
200237b6:	b348      	cbz	r0, 2002380c <HAL_NAND_EN_QUAL+0x5c>
200237b8:	68c3      	ldr	r3, [r0, #12]
200237ba:	b33b      	cbz	r3, 2002380c <HAL_NAND_EN_QUAL+0x5c>
200237bc:	799a      	ldrb	r2, [r3, #6]
200237be:	b10a      	cbz	r2, 200237c4 <HAL_NAND_EN_QUAL+0x14>
200237c0:	7a1b      	ldrb	r3, [r3, #8]
200237c2:	b90b      	cbnz	r3, 200237c8 <HAL_NAND_EN_QUAL+0x18>
200237c4:	2000      	movs	r0, #0
200237c6:	bd38      	pop	{r3, r4, r5, pc}
200237c8:	2101      	movs	r1, #1
200237ca:	f7ff f978 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200237ce:	68e3      	ldr	r3, [r4, #12]
200237d0:	2102      	movs	r1, #2
200237d2:	799a      	ldrb	r2, [r3, #6]
200237d4:	4620      	mov	r0, r4
200237d6:	f7ff fc11 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200237da:	4620      	mov	r0, r4
200237dc:	f7ff f9c5 	bl	20022b6a <HAL_FLASH_READ32>
200237e0:	68e3      	ldr	r3, [r4, #12]
200237e2:	7a1b      	ldrb	r3, [r3, #8]
200237e4:	b17d      	cbz	r5, 20023806 <HAL_NAND_EN_QUAL+0x56>
200237e6:	ea43 0100 	orr.w	r1, r3, r0
200237ea:	4620      	mov	r0, r4
200237ec:	f7ff f960 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
200237f0:	2101      	movs	r1, #1
200237f2:	4620      	mov	r0, r4
200237f4:	f7ff f963 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200237f8:	68e3      	ldr	r3, [r4, #12]
200237fa:	2103      	movs	r1, #3
200237fc:	4620      	mov	r0, r4
200237fe:	799a      	ldrb	r2, [r3, #6]
20023800:	f7ff fbfc 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023804:	e7de      	b.n	200237c4 <HAL_NAND_EN_QUAL+0x14>
20023806:	ea20 0103 	bic.w	r1, r0, r3
2002380a:	e7ee      	b.n	200237ea <HAL_NAND_EN_QUAL+0x3a>
2002380c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20023810:	e7d9      	b.n	200237c6 <HAL_NAND_EN_QUAL+0x16>

20023812 <nand_clear_status>:
20023812:	b510      	push	{r4, lr}
20023814:	4604      	mov	r4, r0
20023816:	2101      	movs	r1, #1
20023818:	f7ff f951 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
2002381c:	2102      	movs	r1, #2
2002381e:	4620      	mov	r0, r4
20023820:	f7ff f946 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
20023824:	68e3      	ldr	r3, [r4, #12]
20023826:	2103      	movs	r1, #3
20023828:	795a      	ldrb	r2, [r3, #5]
2002382a:	4620      	mov	r0, r4
2002382c:	f7ff fbe6 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023830:	2100      	movs	r1, #0
20023832:	4620      	mov	r0, r4
20023834:	f7ff f93c 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
20023838:	68e3      	ldr	r3, [r4, #12]
2002383a:	2103      	movs	r1, #3
2002383c:	4620      	mov	r0, r4
2002383e:	795a      	ldrb	r2, [r3, #5]
20023840:	f7ff fbdc 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023844:	2000      	movs	r0, #0
20023846:	bd10      	pop	{r4, pc}

20023848 <HAL_NAND_PAGE_SIZE>:
20023848:	b140      	cbz	r0, 2002385c <HAL_NAND_PAGE_SIZE+0x14>
2002384a:	f890 3024 	ldrb.w	r3, [r0, #36]	@ 0x24
2002384e:	f013 0f01 	tst.w	r3, #1
20023852:	bf14      	ite	ne
20023854:	f44f 5080 	movne.w	r0, #4096	@ 0x1000
20023858:	f44f 6000 	moveq.w	r0, #2048	@ 0x800
2002385c:	4770      	bx	lr

2002385e <HAL_NAND_READ_WITHOOB>:
2002385e:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20023862:	b085      	sub	sp, #20
20023864:	460e      	mov	r6, r1
20023866:	4691      	mov	r9, r2
20023868:	461d      	mov	r5, r3
2002386a:	4604      	mov	r4, r0
2002386c:	9f0f      	ldr	r7, [sp, #60]	@ 0x3c
2002386e:	b1b0      	cbz	r0, 2002389e <HAL_NAND_READ_WITHOOB+0x40>
20023870:	68c3      	ldr	r3, [r0, #12]
20023872:	b1a3      	cbz	r3, 2002389e <HAL_NAND_READ_WITHOOB+0x40>
20023874:	69c3      	ldr	r3, [r0, #28]
20023876:	b193      	cbz	r3, 2002389e <HAL_NAND_READ_WITHOOB+0x40>
20023878:	2f80      	cmp	r7, #128	@ 0x80
2002387a:	d810      	bhi.n	2002389e <HAL_NAND_READ_WITHOOB+0x40>
2002387c:	f7ff ffe4 	bl	20023848 <HAL_NAND_PAGE_SIZE>
20023880:	f100 3aff 	add.w	sl, r0, #4294967295	@ 0xffffffff
20023884:	ea0a 0a01 	and.w	sl, sl, r1
20023888:	eb0a 0305 	add.w	r3, sl, r5
2002388c:	4283      	cmp	r3, r0
2002388e:	4680      	mov	r8, r0
20023890:	d907      	bls.n	200238a2 <HAL_NAND_READ_WITHOOB+0x44>
20023892:	2002      	movs	r0, #2
20023894:	6060      	str	r0, [r4, #4]
20023896:	2000      	movs	r0, #0
20023898:	b005      	add	sp, #20
2002389a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002389e:	2001      	movs	r0, #1
200238a0:	e7f8      	b.n	20023894 <HAL_NAND_READ_WITHOOB+0x36>
200238a2:	2300      	movs	r3, #0
200238a4:	6063      	str	r3, [r4, #4]
200238a6:	6923      	ldr	r3, [r4, #16]
200238a8:	f04f 0b00 	mov.w	fp, #0
200238ac:	428b      	cmp	r3, r1
200238ae:	bf98      	it	ls
200238b0:	1ace      	subls	r6, r1, r3
200238b2:	fbb6 f2f0 	udiv	r2, r6, r0
200238b6:	2104      	movs	r1, #4
200238b8:	4620      	mov	r0, r4
200238ba:	f7ff fb9f 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200238be:	2014      	movs	r0, #20
200238c0:	f7fe fad6 	bl	20021e70 <HAL_Delay_us_>
200238c4:	2101      	movs	r1, #1
200238c6:	4620      	mov	r0, r4
200238c8:	f7ff f8f9 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200238cc:	2005      	movs	r0, #5
200238ce:	f7fe facf 	bl	20021e70 <HAL_Delay_us_>
200238d2:	68e2      	ldr	r2, [r4, #12]
200238d4:	2102      	movs	r1, #2
200238d6:	7912      	ldrb	r2, [r2, #4]
200238d8:	4620      	mov	r0, r4
200238da:	f7ff fb8f 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200238de:	4620      	mov	r0, r4
200238e0:	f7ff f943 	bl	20022b6a <HAL_FLASH_READ32>
200238e4:	07c1      	lsls	r1, r0, #31
200238e6:	d4f1      	bmi.n	200238cc <HAL_NAND_READ_WITHOOB+0x6e>
200238e8:	f1bb 0f00 	cmp.w	fp, #0
200238ec:	d102      	bne.n	200238f4 <HAL_NAND_READ_WITHOOB+0x96>
200238ee:	f04f 0b01 	mov.w	fp, #1
200238f2:	e7eb      	b.n	200238cc <HAL_NAND_READ_WITHOOB+0x6e>
200238f4:	4620      	mov	r0, r4
200238f6:	f7ff ff43 	bl	20023780 <HAL_NAND_GET_ECC_RESULT>
200238fa:	b110      	cbz	r0, 20023902 <HAL_NAND_READ_WITHOOB+0xa4>
200238fc:	f440 4000 	orr.w	r0, r0, #32768	@ 0x8000
20023900:	e7c8      	b.n	20023894 <HAL_NAND_READ_WITHOOB+0x36>
20023902:	f894 2020 	ldrb.w	r2, [r4, #32]
20023906:	68e3      	ldr	r3, [r4, #12]
20023908:	bbb2      	cbnz	r2, 20023978 <HAL_NAND_READ_WITHOOB+0x11a>
2002390a:	f893 1046 	ldrb.w	r1, [r3, #70]	@ 0x46
2002390e:	4620      	mov	r0, r4
20023910:	f7ff f87d 	bl	20022a0e <HAL_FLASH_SET_AHB_RCMD>
20023914:	68e0      	ldr	r0, [r4, #12]
20023916:	f990 c04e 	ldrsb.w	ip, [r0, #78]	@ 0x4e
2002391a:	f990 304a 	ldrsb.w	r3, [r0, #74]	@ 0x4a
2002391e:	f990 2049 	ldrsb.w	r2, [r0, #73]	@ 0x49
20023922:	f990 1048 	ldrsb.w	r1, [r0, #72]	@ 0x48
20023926:	f8cd c00c 	str.w	ip, [sp, #12]
2002392a:	f990 c04d 	ldrsb.w	ip, [r0, #77]	@ 0x4d
2002392e:	f8cd c008 	str.w	ip, [sp, #8]
20023932:	f990 c04c 	ldrsb.w	ip, [r0, #76]	@ 0x4c
20023936:	f8cd c004 	str.w	ip, [sp, #4]
2002393a:	f990 004b 	ldrsb.w	r0, [r0, #75]	@ 0x4b
2002393e:	9000      	str	r0, [sp, #0]
20023940:	4620      	mov	r0, r4
20023942:	f7ff f86f 	bl	20022a24 <HAL_FLASH_CFG_AHB_RCMD>
20023946:	03b2      	lsls	r2, r6, #14
20023948:	f8d4 b010 	ldr.w	fp, [r4, #16]
2002394c:	d504      	bpl.n	20023958 <HAL_NAND_READ_WITHOOB+0xfa>
2002394e:	f894 2027 	ldrb.w	r2, [r4, #39]	@ 0x27
20023952:	b10a      	cbz	r2, 20023958 <HAL_NAND_READ_WITHOOB+0xfa>
20023954:	f44b 5b80 	orr.w	fp, fp, #4096	@ 0x1000
20023958:	ea49 0205 	orr.w	r2, r9, r5
2002395c:	ea42 020a 	orr.w	r2, r2, sl
20023960:	0793      	lsls	r3, r2, #30
20023962:	d102      	bne.n	2002396a <HAL_NAND_READ_WITHOOB+0x10c>
20023964:	1e6a      	subs	r2, r5, #1
20023966:	2afe      	cmp	r2, #254	@ 0xfe
20023968:	d821      	bhi.n	200239ae <HAL_NAND_READ_WITHOOB+0x150>
2002396a:	462a      	mov	r2, r5
2002396c:	4648      	mov	r0, r9
2002396e:	eb0b 010a 	add.w	r1, fp, sl
20023972:	f006 ff65 	bl	2002a840 <memcpy>
20023976:	e01d      	b.n	200239b4 <HAL_NAND_READ_WITHOOB+0x156>
20023978:	f893 106a 	ldrb.w	r1, [r3, #106]	@ 0x6a
2002397c:	4620      	mov	r0, r4
2002397e:	f7ff f846 	bl	20022a0e <HAL_FLASH_SET_AHB_RCMD>
20023982:	68e0      	ldr	r0, [r4, #12]
20023984:	f990 c072 	ldrsb.w	ip, [r0, #114]	@ 0x72
20023988:	f990 306e 	ldrsb.w	r3, [r0, #110]	@ 0x6e
2002398c:	f990 206d 	ldrsb.w	r2, [r0, #109]	@ 0x6d
20023990:	f990 106c 	ldrsb.w	r1, [r0, #108]	@ 0x6c
20023994:	f8cd c00c 	str.w	ip, [sp, #12]
20023998:	f990 c071 	ldrsb.w	ip, [r0, #113]	@ 0x71
2002399c:	f8cd c008 	str.w	ip, [sp, #8]
200239a0:	f990 c070 	ldrsb.w	ip, [r0, #112]	@ 0x70
200239a4:	f8cd c004 	str.w	ip, [sp, #4]
200239a8:	f990 006f 	ldrsb.w	r0, [r0, #111]	@ 0x6f
200239ac:	e7c7      	b.n	2002393e <HAL_NAND_READ_WITHOOB+0xe0>
200239ae:	f1b9 0f00 	cmp.w	r9, #0
200239b2:	d1da      	bne.n	2002396a <HAL_NAND_READ_WITHOOB+0x10c>
200239b4:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
200239b6:	b12b      	cbz	r3, 200239c4 <HAL_NAND_READ_WITHOOB+0x166>
200239b8:	463a      	mov	r2, r7
200239ba:	4618      	mov	r0, r3
200239bc:	eb0b 0108 	add.w	r1, fp, r8
200239c0:	f006 ff3e 	bl	2002a840 <memcpy>
200239c4:	1978      	adds	r0, r7, r5
200239c6:	e767      	b.n	20023898 <HAL_NAND_READ_WITHOOB+0x3a>

200239c8 <HAL_NAND_BLOCK_SIZE>:
200239c8:	b508      	push	{r3, lr}
200239ca:	4602      	mov	r2, r0
200239cc:	f7ff ff3c 	bl	20023848 <HAL_NAND_PAGE_SIZE>
200239d0:	b128      	cbz	r0, 200239de <HAL_NAND_BLOCK_SIZE+0x16>
200239d2:	f892 3024 	ldrb.w	r3, [r2, #36]	@ 0x24
200239d6:	079b      	lsls	r3, r3, #30
200239d8:	bf4c      	ite	mi
200239da:	01c0      	lslmi	r0, r0, #7
200239dc:	0180      	lslpl	r0, r0, #6
200239de:	bd08      	pop	{r3, pc}

200239e0 <HAL_NAND_GET_BADBLK>:
200239e0:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200239e2:	4604      	mov	r4, r0
200239e4:	b910      	cbnz	r0, 200239ec <HAL_NAND_GET_BADBLK+0xc>
200239e6:	2000      	movs	r0, #0
200239e8:	b004      	add	sp, #16
200239ea:	bd10      	pop	{r4, pc}
200239ec:	69c3      	ldr	r3, [r0, #28]
200239ee:	2b00      	cmp	r3, #0
200239f0:	d0f9      	beq.n	200239e6 <HAL_NAND_GET_BADBLK+0x6>
200239f2:	f7ff ffe9 	bl	200239c8 <HAL_NAND_BLOCK_SIZE>
200239f6:	2304      	movs	r3, #4
200239f8:	9301      	str	r3, [sp, #4]
200239fa:	ab03      	add	r3, sp, #12
200239fc:	9300      	str	r3, [sp, #0]
200239fe:	2300      	movs	r3, #0
20023a00:	4341      	muls	r1, r0
20023a02:	461a      	mov	r2, r3
20023a04:	4620      	mov	r0, r4
20023a06:	f7ff ff2a 	bl	2002385e <HAL_NAND_READ_WITHOOB>
20023a0a:	b140      	cbz	r0, 20023a1e <HAL_NAND_GET_BADBLK+0x3e>
20023a0c:	f89d 300c 	ldrb.w	r3, [sp, #12]
20023a10:	2bff      	cmp	r3, #255	@ 0xff
20023a12:	d0e8      	beq.n	200239e6 <HAL_NAND_GET_BADBLK+0x6>
20023a14:	9803      	ldr	r0, [sp, #12]
20023a16:	2800      	cmp	r0, #0
20023a18:	bf08      	it	eq
20023a1a:	2001      	moveq	r0, #1
20023a1c:	e7e4      	b.n	200239e8 <HAL_NAND_GET_BADBLK+0x8>
20023a1e:	2001      	movs	r0, #1
20023a20:	e7e2      	b.n	200239e8 <HAL_NAND_GET_BADBLK+0x8>

20023a22 <HAL_QSPIEX_WRITE_PAGE>:
20023a22:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20023a26:	b099      	sub	sp, #100	@ 0x64
20023a28:	4604      	mov	r4, r0
20023a2a:	460e      	mov	r6, r1
20023a2c:	4691      	mov	r9, r2
20023a2e:	f7ff fd14 	bl	2002345a <flash_handle_valid>
20023a32:	b318      	cbz	r0, 20023a7c <HAL_QSPIEX_WRITE_PAGE+0x5a>
20023a34:	2b00      	cmp	r3, #0
20023a36:	f000 80d7 	beq.w	20023be8 <HAL_QSPIEX_WRITE_PAGE+0x1c6>
20023a3a:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
20023a3e:	bf28      	it	cs
20023a40:	f44f 7380 	movcs.w	r3, #256	@ 0x100
20023a44:	68a1      	ldr	r1, [r4, #8]
20023a46:	461d      	mov	r5, r3
20023a48:	6962      	ldr	r2, [r4, #20]
20023a4a:	f894 3020 	ldrb.w	r3, [r4, #32]
20023a4e:	2900      	cmp	r1, #0
20023a50:	d03b      	beq.n	20023aca <HAL_QSPIEX_WRITE_PAGE+0xa8>
20023a52:	f1b2 7f80 	cmp.w	r2, #16777216	@ 0x1000000
20023a56:	d914      	bls.n	20023a82 <HAL_QSPIEX_WRITE_PAGE+0x60>
20023a58:	2b02      	cmp	r3, #2
20023a5a:	bf14      	ite	ne
20023a5c:	2727      	movne	r7, #39	@ 0x27
20023a5e:	2728      	moveq	r7, #40	@ 0x28
20023a60:	4639      	mov	r1, r7
20023a62:	4620      	mov	r0, r4
20023a64:	f7ff faa3 	bl	20022fae <HAL_FLASH_PRE_CMD>
20023a68:	4649      	mov	r1, r9
20023a6a:	462b      	mov	r3, r5
20023a6c:	2201      	movs	r2, #1
20023a6e:	4620      	mov	r0, r4
20023a70:	f7ff fcfb 	bl	2002346a <HAL_FLASH_DMA_START>
20023a74:	4601      	mov	r1, r0
20023a76:	b148      	cbz	r0, 20023a8c <HAL_QSPIEX_WRITE_PAGE+0x6a>
20023a78:	2500      	movs	r5, #0
20023a7a:	4628      	mov	r0, r5
20023a7c:	b019      	add	sp, #100	@ 0x64
20023a7e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20023a82:	2b02      	cmp	r3, #2
20023a84:	bf14      	ite	ne
20023a86:	2716      	movne	r7, #22
20023a88:	2717      	moveq	r7, #23
20023a8a:	e7e9      	b.n	20023a60 <HAL_QSPIEX_WRITE_PAGE+0x3e>
20023a8c:	4632      	mov	r2, r6
20023a8e:	4620      	mov	r0, r4
20023a90:	f7ff fab4 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023a94:	2101      	movs	r1, #1
20023a96:	4620      	mov	r0, r4
20023a98:	f7ff f81b 	bl	20022ad2 <HAL_FLASH_WRITE_DLEN2>
20023a9c:	2301      	movs	r3, #1
20023a9e:	4632      	mov	r2, r6
20023aa0:	9300      	str	r3, [sp, #0]
20023aa2:	4639      	mov	r1, r7
20023aa4:	2302      	movs	r3, #2
20023aa6:	4620      	mov	r0, r4
20023aa8:	f7ff fadb 	bl	20023062 <HAL_FLASH_ISSUE_CMD_SEQ>
20023aac:	2800      	cmp	r0, #0
20023aae:	d1e3      	bne.n	20023a78 <HAL_QSPIEX_WRITE_PAGE+0x56>
20023ab0:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
20023ab4:	4620      	mov	r0, r4
20023ab6:	f7ff fd28 	bl	2002350a <HAL_FLASH_DMA_WAIT_DONE>
20023aba:	2800      	cmp	r0, #0
20023abc:	d1dc      	bne.n	20023a78 <HAL_QSPIEX_WRITE_PAGE+0x56>
20023abe:	6822      	ldr	r2, [r4, #0]
20023ac0:	6813      	ldr	r3, [r2, #0]
20023ac2:	f023 0320 	bic.w	r3, r3, #32
20023ac6:	6013      	str	r3, [r2, #0]
20023ac8:	e7d7      	b.n	20023a7a <HAL_QSPIEX_WRITE_PAGE+0x58>
20023aca:	f1b2 7f80 	cmp.w	r2, #16777216	@ 0x1000000
20023ace:	f240 8082 	bls.w	20023bd6 <HAL_QSPIEX_WRITE_PAGE+0x1b4>
20023ad2:	2b02      	cmp	r3, #2
20023ad4:	bf14      	ite	ne
20023ad6:	2327      	movne	r3, #39	@ 0x27
20023ad8:	2328      	moveq	r3, #40	@ 0x28
20023ada:	462f      	mov	r7, r5
20023adc:	f04f 0800 	mov.w	r8, #0
20023ae0:	9303      	str	r3, [sp, #12]
20023ae2:	f64f 7afc 	movw	sl, #65532	@ 0xfffc
20023ae6:	2f40      	cmp	r7, #64	@ 0x40
20023ae8:	bfd4      	ite	le
20023aea:	ea0a 0a07 	andle.w	sl, sl, r7
20023aee:	f00a 0a40 	andgt.w	sl, sl, #64	@ 0x40
20023af2:	f1ba 0f00 	cmp.w	sl, #0
20023af6:	d03f      	beq.n	20023b78 <HAL_QSPIEX_WRITE_PAGE+0x156>
20023af8:	2200      	movs	r2, #0
20023afa:	4620      	mov	r0, r4
20023afc:	4611      	mov	r1, r2
20023afe:	f7ff fa7d 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023b02:	eb09 0308 	add.w	r3, r9, r8
20023b06:	f10d 0c20 	add.w	ip, sp, #32
20023b0a:	f103 0e40 	add.w	lr, r3, #64	@ 0x40
20023b0e:	4662      	mov	r2, ip
20023b10:	6818      	ldr	r0, [r3, #0]
20023b12:	6859      	ldr	r1, [r3, #4]
20023b14:	3308      	adds	r3, #8
20023b16:	c203      	stmia	r2!, {r0, r1}
20023b18:	4573      	cmp	r3, lr
20023b1a:	4694      	mov	ip, r2
20023b1c:	d1f7      	bne.n	20023b0e <HAL_QSPIEX_WRITE_PAGE+0xec>
20023b1e:	f04f 0b00 	mov.w	fp, #0
20023b22:	ea4f 02aa 	mov.w	r2, sl, asr #2
20023b26:	ab08      	add	r3, sp, #32
20023b28:	f853 1b04 	ldr.w	r1, [r3], #4
20023b2c:	4620      	mov	r0, r4
20023b2e:	9205      	str	r2, [sp, #20]
20023b30:	9304      	str	r3, [sp, #16]
20023b32:	f7fe ffbd 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
20023b36:	9a05      	ldr	r2, [sp, #20]
20023b38:	f10b 0b01 	add.w	fp, fp, #1
20023b3c:	4593      	cmp	fp, r2
20023b3e:	9b04      	ldr	r3, [sp, #16]
20023b40:	d1f2      	bne.n	20023b28 <HAL_QSPIEX_WRITE_PAGE+0x106>
20023b42:	4651      	mov	r1, sl
20023b44:	4620      	mov	r0, r4
20023b46:	f7fe ffba 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
20023b4a:	4620      	mov	r0, r4
20023b4c:	9903      	ldr	r1, [sp, #12]
20023b4e:	eb06 0208 	add.w	r2, r6, r8
20023b52:	f7ff fa53 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023b56:	2101      	movs	r1, #1
20023b58:	4620      	mov	r0, r4
20023b5a:	f7fe ffb0 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
20023b5e:	2200      	movs	r2, #0
20023b60:	2102      	movs	r1, #2
20023b62:	4620      	mov	r0, r4
20023b64:	f7ff fa4a 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023b68:	4620      	mov	r0, r4
20023b6a:	f7fe fff5 	bl	20022b58 <HAL_FLASH_IS_PROG_DONE>
20023b6e:	2800      	cmp	r0, #0
20023b70:	d0f1      	beq.n	20023b56 <HAL_QSPIEX_WRITE_PAGE+0x134>
20023b72:	eba7 070a 	sub.w	r7, r7, sl
20023b76:	44d0      	add	r8, sl
20023b78:	1e7b      	subs	r3, r7, #1
20023b7a:	2b02      	cmp	r3, #2
20023b7c:	d830      	bhi.n	20023be0 <HAL_QSPIEX_WRITE_PAGE+0x1be>
20023b7e:	6923      	ldr	r3, [r4, #16]
20023b80:	4446      	add	r6, r8
20023b82:	4333      	orrs	r3, r6
20023b84:	681b      	ldr	r3, [r3, #0]
20023b86:	463a      	mov	r2, r7
20023b88:	eb09 0108 	add.w	r1, r9, r8
20023b8c:	a807      	add	r0, sp, #28
20023b8e:	9307      	str	r3, [sp, #28]
20023b90:	f006 fe56 	bl	2002a840 <memcpy>
20023b94:	2200      	movs	r2, #0
20023b96:	4620      	mov	r0, r4
20023b98:	4611      	mov	r1, r2
20023b9a:	f7ff fa2f 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023b9e:	9907      	ldr	r1, [sp, #28]
20023ba0:	4620      	mov	r0, r4
20023ba2:	f7fe ff85 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
20023ba6:	2104      	movs	r1, #4
20023ba8:	4620      	mov	r0, r4
20023baa:	f7fe ff88 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
20023bae:	4632      	mov	r2, r6
20023bb0:	4620      	mov	r0, r4
20023bb2:	9903      	ldr	r1, [sp, #12]
20023bb4:	f7ff fa22 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023bb8:	2101      	movs	r1, #1
20023bba:	4620      	mov	r0, r4
20023bbc:	f7fe ff7f 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
20023bc0:	2200      	movs	r2, #0
20023bc2:	2102      	movs	r1, #2
20023bc4:	4620      	mov	r0, r4
20023bc6:	f7ff fa19 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023bca:	4620      	mov	r0, r4
20023bcc:	f7fe ffc4 	bl	20022b58 <HAL_FLASH_IS_PROG_DONE>
20023bd0:	2800      	cmp	r0, #0
20023bd2:	d0f1      	beq.n	20023bb8 <HAL_QSPIEX_WRITE_PAGE+0x196>
20023bd4:	e751      	b.n	20023a7a <HAL_QSPIEX_WRITE_PAGE+0x58>
20023bd6:	2b02      	cmp	r3, #2
20023bd8:	bf14      	ite	ne
20023bda:	2316      	movne	r3, #22
20023bdc:	2317      	moveq	r3, #23
20023bde:	e77c      	b.n	20023ada <HAL_QSPIEX_WRITE_PAGE+0xb8>
20023be0:	2f00      	cmp	r7, #0
20023be2:	f73f af7e 	bgt.w	20023ae2 <HAL_QSPIEX_WRITE_PAGE+0xc0>
20023be6:	e748      	b.n	20023a7a <HAL_QSPIEX_WRITE_PAGE+0x58>
20023be8:	4618      	mov	r0, r3
20023bea:	e747      	b.n	20023a7c <HAL_QSPIEX_WRITE_PAGE+0x5a>

20023bec <HAL_QSPIEX_SECT_ERASE>:
20023bec:	b573      	push	{r0, r1, r4, r5, r6, lr}
20023bee:	4604      	mov	r4, r0
20023bf0:	460d      	mov	r5, r1
20023bf2:	f7ff fc32 	bl	2002345a <flash_handle_valid>
20023bf6:	b1e8      	cbz	r0, 20023c34 <HAL_QSPIEX_SECT_ERASE+0x48>
20023bf8:	6963      	ldr	r3, [r4, #20]
20023bfa:	460a      	mov	r2, r1
20023bfc:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
20023c00:	f04f 0100 	mov.w	r1, #0
20023c04:	4620      	mov	r0, r4
20023c06:	bf94      	ite	ls
20023c08:	261b      	movls	r6, #27
20023c0a:	2629      	movhi	r6, #41	@ 0x29
20023c0c:	f7ff f9f6 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023c10:	2101      	movs	r1, #1
20023c12:	4620      	mov	r0, r4
20023c14:	f7fe ff5d 	bl	20022ad2 <HAL_FLASH_WRITE_DLEN2>
20023c18:	2301      	movs	r3, #1
20023c1a:	462a      	mov	r2, r5
20023c1c:	9300      	str	r3, [sp, #0]
20023c1e:	4631      	mov	r1, r6
20023c20:	2302      	movs	r3, #2
20023c22:	4620      	mov	r0, r4
20023c24:	f7ff fa1d 	bl	20023062 <HAL_FLASH_ISSUE_CMD_SEQ>
20023c28:	3800      	subs	r0, #0
20023c2a:	bf18      	it	ne
20023c2c:	2001      	movne	r0, #1
20023c2e:	4240      	negs	r0, r0
20023c30:	b002      	add	sp, #8
20023c32:	bd70      	pop	{r4, r5, r6, pc}
20023c34:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20023c38:	e7fa      	b.n	20023c30 <HAL_QSPIEX_SECT_ERASE+0x44>
	...

20023c3c <HAL_QSPI_GET_SRC_CLK>:
20023c3c:	b508      	push	{r3, lr}
20023c3e:	b1e8      	cbz	r0, 20023c7c <HAL_QSPI_GET_SRC_CLK+0x40>
20023c40:	6803      	ldr	r3, [r0, #0]
20023c42:	4a0f      	ldr	r2, [pc, #60]	@ (20023c80 <HAL_QSPI_GET_SRC_CLK+0x44>)
20023c44:	4293      	cmp	r3, r2
20023c46:	d00c      	beq.n	20023c62 <HAL_QSPI_GET_SRC_CLK+0x26>
20023c48:	f502 5280 	add.w	r2, r2, #4096	@ 0x1000
20023c4c:	4293      	cmp	r3, r2
20023c4e:	d115      	bne.n	20023c7c <HAL_QSPI_GET_SRC_CLK+0x40>
20023c50:	2006      	movs	r0, #6
20023c52:	f001 f88d 	bl	20024d70 <HAL_RCC_HCPU_GetClockSrc>
20023c56:	2802      	cmp	r0, #2
20023c58:	d105      	bne.n	20023c66 <HAL_QSPI_GET_SRC_CLK+0x2a>
20023c5a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20023c5e:	f001 b8bc 	b.w	20024dda <HAL_RCC_HCPU_GetDLL2Freq>
20023c62:	2004      	movs	r0, #4
20023c64:	e7f5      	b.n	20023c52 <HAL_QSPI_GET_SRC_CLK+0x16>
20023c66:	2803      	cmp	r0, #3
20023c68:	d103      	bne.n	20023c72 <HAL_QSPI_GET_SRC_CLK+0x36>
20023c6a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20023c6e:	f001 b8b7 	b.w	20024de0 <HAL_RCC_HCPU_GetDLL3Freq>
20023c72:	2001      	movs	r0, #1
20023c74:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20023c78:	f001 b916 	b.w	20024ea8 <HAL_RCC_GetSysCLKFreq>
20023c7c:	2000      	movs	r0, #0
20023c7e:	bd08      	pop	{r3, pc}
20023c80:	50041000 	.word	0x50041000

20023c84 <HAL_QSPI_GET_CLK>:
20023c84:	b538      	push	{r3, r4, r5, lr}
20023c86:	4605      	mov	r5, r0
20023c88:	b908      	cbnz	r0, 20023c8e <HAL_QSPI_GET_CLK+0xa>
20023c8a:	2000      	movs	r0, #0
20023c8c:	bd38      	pop	{r3, r4, r5, pc}
20023c8e:	f7fe ff7b 	bl	20022b88 <HAL_FLASH_GET_DIV>
20023c92:	4604      	mov	r4, r0
20023c94:	2800      	cmp	r0, #0
20023c96:	d0f8      	beq.n	20023c8a <HAL_QSPI_GET_CLK+0x6>
20023c98:	4628      	mov	r0, r5
20023c9a:	f7ff ffcf 	bl	20023c3c <HAL_QSPI_GET_SRC_CLK>
20023c9e:	fbb0 f0f4 	udiv	r0, r0, r4
20023ca2:	e7f3      	b.n	20023c8c <HAL_QSPI_GET_CLK+0x8>

20023ca4 <HAL_QSPI_READ_ID>:
20023ca4:	b138      	cbz	r0, 20023cb6 <HAL_QSPI_READ_ID+0x12>
20023ca6:	f890 3023 	ldrb.w	r3, [r0, #35]	@ 0x23
20023caa:	b113      	cbz	r3, 20023cb2 <HAL_QSPI_READ_ID+0xe>
20023cac:	2100      	movs	r1, #0
20023cae:	f7ff bc78 	b.w	200235a2 <nand_read_id>
20023cb2:	f7ff baf8 	b.w	200232a6 <HAL_FLASH_GET_NOR_ID>
20023cb6:	20ff      	movs	r0, #255	@ 0xff
20023cb8:	4770      	bx	lr

20023cba <HAL_NOR_CFG_DTR>:
20023cba:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
20023cbc:	4604      	mov	r4, r0
20023cbe:	460a      	mov	r2, r1
20023cc0:	b351      	cbz	r1, 20023d18 <HAL_NOR_CFG_DTR+0x5e>
20023cc2:	68c5      	ldr	r5, [r0, #12]
20023cc4:	f895 31ff 	ldrb.w	r3, [r5, #511]	@ 0x1ff
20023cc8:	2b00      	cmp	r3, #0
20023cca:	d03b      	beq.n	20023d44 <HAL_NOR_CFG_DTR+0x8a>
20023ccc:	f890 3020 	ldrb.w	r3, [r0, #32]
20023cd0:	b3c3      	cbz	r3, 20023d44 <HAL_NOR_CFG_DTR+0x8a>
20023cd2:	f995 6207 	ldrsb.w	r6, [r5, #519]	@ 0x207
20023cd6:	f995 2202 	ldrsb.w	r2, [r5, #514]	@ 0x202
20023cda:	f995 3203 	ldrsb.w	r3, [r5, #515]	@ 0x203
20023cde:	f995 1201 	ldrsb.w	r1, [r5, #513]	@ 0x201
20023ce2:	9603      	str	r6, [sp, #12]
20023ce4:	f995 6206 	ldrsb.w	r6, [r5, #518]	@ 0x206
20023ce8:	9602      	str	r6, [sp, #8]
20023cea:	f995 6205 	ldrsb.w	r6, [r5, #517]	@ 0x205
20023cee:	9601      	str	r6, [sp, #4]
20023cf0:	f995 5204 	ldrsb.w	r5, [r5, #516]	@ 0x204
20023cf4:	9500      	str	r5, [sp, #0]
20023cf6:	f7fe fe95 	bl	20022a24 <HAL_FLASH_CFG_AHB_RCMD>
20023cfa:	68e3      	ldr	r3, [r4, #12]
20023cfc:	4620      	mov	r0, r4
20023cfe:	f893 11ff 	ldrb.w	r1, [r3, #511]	@ 0x1ff
20023d02:	f7fe fe84 	bl	20022a0e <HAL_FLASH_SET_AHB_RCMD>
20023d06:	2101      	movs	r1, #1
20023d08:	4620      	mov	r0, r4
20023d0a:	f894 2025 	ldrb.w	r2, [r4, #37]	@ 0x25
20023d0e:	f7ff f895 	bl	20022e3c <HAL_MPI_CFG_DTR>
20023d12:	2000      	movs	r0, #0
20023d14:	b004      	add	sp, #16
20023d16:	bd70      	pop	{r4, r5, r6, pc}
20023d18:	f7ff f890 	bl	20022e3c <HAL_MPI_CFG_DTR>
20023d1c:	6963      	ldr	r3, [r4, #20]
20023d1e:	f894 1020 	ldrb.w	r1, [r4, #32]
20023d22:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
20023d26:	d906      	bls.n	20023d36 <HAL_NOR_CFG_DTR+0x7c>
20023d28:	b919      	cbnz	r1, 20023d32 <HAL_NOR_CFG_DTR+0x78>
20023d2a:	4620      	mov	r0, r4
20023d2c:	f7ff f902 	bl	20022f34 <HAL_FLASH_CONFIG_FULL_AHB_READ>
20023d30:	e7ef      	b.n	20023d12 <HAL_NOR_CFG_DTR+0x58>
20023d32:	2101      	movs	r1, #1
20023d34:	e7f9      	b.n	20023d2a <HAL_NOR_CFG_DTR+0x70>
20023d36:	b919      	cbnz	r1, 20023d40 <HAL_NOR_CFG_DTR+0x86>
20023d38:	4620      	mov	r0, r4
20023d3a:	f7ff f8b7 	bl	20022eac <HAL_FLASH_CONFIG_AHB_READ>
20023d3e:	e7e8      	b.n	20023d12 <HAL_NOR_CFG_DTR+0x58>
20023d40:	2101      	movs	r1, #1
20023d42:	e7f9      	b.n	20023d38 <HAL_NOR_CFG_DTR+0x7e>
20023d44:	2001      	movs	r0, #1
20023d46:	e7e5      	b.n	20023d14 <HAL_NOR_CFG_DTR+0x5a>

20023d48 <HAL_NOR_DTR_CAL>:
20023d48:	b510      	push	{r4, lr}
20023d4a:	4604      	mov	r4, r0
20023d4c:	b1f0      	cbz	r0, 20023d8c <HAL_NOR_DTR_CAL+0x44>
20023d4e:	6802      	ldr	r2, [r0, #0]
20023d50:	2014      	movs	r0, #20
20023d52:	f8d2 3094 	ldr.w	r3, [r2, #148]	@ 0x94
20023d56:	f043 4300 	orr.w	r3, r3, #2147483648	@ 0x80000000
20023d5a:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
20023d5e:	f7fe f8e6 	bl	20021f2e <HAL_Delay_us>
20023d62:	6823      	ldr	r3, [r4, #0]
20023d64:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20023d68:	05d2      	lsls	r2, r2, #23
20023d6a:	d5fb      	bpl.n	20023d64 <HAL_NOR_DTR_CAL+0x1c>
20023d6c:	f8d3 0094 	ldr.w	r0, [r3, #148]	@ 0x94
20023d70:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20023d74:	b2c0      	uxtb	r0, r0
20023d76:	f022 4200 	bic.w	r2, r2, #2147483648	@ 0x80000000
20023d7a:	f8c3 2094 	str.w	r2, [r3, #148]	@ 0x94
20023d7e:	f894 3025 	ldrb.w	r3, [r4, #37]	@ 0x25
20023d82:	f023 037f 	bic.w	r3, r3, #127	@ 0x7f
20023d86:	4303      	orrs	r3, r0
20023d88:	f884 3025 	strb.w	r3, [r4, #37]	@ 0x25
20023d8c:	bd10      	pop	{r4, pc}
	...

20023d90 <HAL_FLASH_Init>:
20023d90:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
20023d94:	460e      	mov	r6, r1
20023d96:	4690      	mov	r8, r2
20023d98:	461f      	mov	r7, r3
20023d9a:	4604      	mov	r4, r0
20023d9c:	b087      	sub	sp, #28
20023d9e:	2800      	cmp	r0, #0
20023da0:	f000 80e5 	beq.w	20023f6e <HAL_FLASH_Init+0x1de>
20023da4:	2900      	cmp	r1, #0
20023da6:	f000 80e2 	beq.w	20023f6e <HAL_FLASH_Init+0x1de>
20023daa:	f7fe fe0f 	bl	200229cc <HAL_QSPI_Init>
20023dae:	6820      	ldr	r0, [r4, #0]
20023db0:	f7ff fb59 	bl	20023466 <HAL_GET_FLASH_MID>
20023db4:	6933      	ldr	r3, [r6, #16]
20023db6:	2100      	movs	r1, #0
20023db8:	f884 3034 	strb.w	r3, [r4, #52]	@ 0x34
20023dbc:	68b3      	ldr	r3, [r6, #8]
20023dbe:	4605      	mov	r5, r0
20023dc0:	63a3      	str	r3, [r4, #56]	@ 0x38
20023dc2:	68f3      	ldr	r3, [r6, #12]
20023dc4:	f884 1024 	strb.w	r1, [r4, #36]	@ 0x24
20023dc8:	051b      	lsls	r3, r3, #20
20023dca:	63e3      	str	r3, [r4, #60]	@ 0x3c
20023dcc:	2302      	movs	r3, #2
20023dce:	f884 3036 	strb.w	r3, [r4, #54]	@ 0x36
20023dd2:	6933      	ldr	r3, [r6, #16]
20023dd4:	f8c4 8008 	str.w	r8, [r4, #8]
20023dd8:	1e5a      	subs	r2, r3, #1
20023dda:	4253      	negs	r3, r2
20023ddc:	4153      	adcs	r3, r2
20023dde:	f884 3023 	strb.w	r3, [r4, #35]	@ 0x23
20023de2:	f1b8 0f00 	cmp.w	r8, #0
20023de6:	d058      	beq.n	20023e9a <HAL_FLASH_Init+0x10a>
20023de8:	2f00      	cmp	r7, #0
20023dea:	d056      	beq.n	20023e9a <HAL_FLASH_Init+0x10a>
20023dec:	683b      	ldr	r3, [r7, #0]
20023dee:	f8c8 3000 	str.w	r3, [r8]
20023df2:	68a3      	ldr	r3, [r4, #8]
20023df4:	68fa      	ldr	r2, [r7, #12]
20023df6:	605a      	str	r2, [r3, #4]
20023df8:	2210      	movs	r2, #16
20023dfa:	68a3      	ldr	r3, [r4, #8]
20023dfc:	609a      	str	r2, [r3, #8]
20023dfe:	2280      	movs	r2, #128	@ 0x80
20023e00:	68a3      	ldr	r3, [r4, #8]
20023e02:	60d9      	str	r1, [r3, #12]
20023e04:	68a3      	ldr	r3, [r4, #8]
20023e06:	611a      	str	r2, [r3, #16]
20023e08:	f44f 5280 	mov.w	r2, #4096	@ 0x1000
20023e0c:	68a3      	ldr	r3, [r4, #8]
20023e0e:	6159      	str	r1, [r3, #20]
20023e10:	68a3      	ldr	r3, [r4, #8]
20023e12:	6199      	str	r1, [r3, #24]
20023e14:	68a3      	ldr	r3, [r4, #8]
20023e16:	61d9      	str	r1, [r3, #28]
20023e18:	68a3      	ldr	r3, [r4, #8]
20023e1a:	621a      	str	r2, [r3, #32]
20023e1c:	68a3      	ldr	r3, [r4, #8]
20023e1e:	6259      	str	r1, [r3, #36]	@ 0x24
20023e20:	b1c0      	cbz	r0, 20023e54 <HAL_FLASH_Init+0xc4>
20023e22:	f06f 437f 	mvn.w	r3, #4278190080	@ 0xff000000
20023e26:	4298      	cmp	r0, r3
20023e28:	d014      	beq.n	20023e54 <HAL_FLASH_Init+0xc4>
20023e2a:	2601      	movs	r6, #1
20023e2c:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023e30:	2b00      	cmp	r3, #0
20023e32:	d13d      	bne.n	20023eb0 <HAL_FLASH_Init+0x120>
20023e34:	2e00      	cmp	r6, #0
20023e36:	d15a      	bne.n	20023eee <HAL_FLASH_Init+0x15e>
20023e38:	4620      	mov	r0, r4
20023e3a:	f7ff faee 	bl	2002341a <HAL_FLASH_RELEASE_DPD>
20023e3e:	4630      	mov	r0, r6
20023e40:	f7fe f875 	bl	20021f2e <HAL_Delay_us>
20023e44:	2032      	movs	r0, #50	@ 0x32
20023e46:	f7fe f872 	bl	20021f2e <HAL_Delay_us>
20023e4a:	4620      	mov	r0, r4
20023e4c:	f7ff ff2a 	bl	20023ca4 <HAL_QSPI_READ_ID>
20023e50:	4605      	mov	r5, r0
20023e52:	e04c      	b.n	20023eee <HAL_FLASH_Init+0x15e>
20023e54:	2101      	movs	r1, #1
20023e56:	4620      	mov	r0, r4
20023e58:	f7fe fe8b 	bl	20022b72 <HAL_FLASH_SET_TXSLOT>
20023e5c:	4ba7      	ldr	r3, [pc, #668]	@ (200240fc <HAL_FLASH_Init+0x36c>)
20023e5e:	69a2      	ldr	r2, [r4, #24]
20023e60:	4620      	mov	r0, r4
20023e62:	429a      	cmp	r2, r3
20023e64:	f04f 0200 	mov.w	r2, #0
20023e68:	bf8c      	ite	hi
20023e6a:	2101      	movhi	r1, #1
20023e6c:	4611      	movls	r1, r2
20023e6e:	f7ff fac5 	bl	200233fc <HAL_QSPI_SET_CLK_INV>
20023e72:	4620      	mov	r0, r4
20023e74:	f89d 1038 	ldrb.w	r1, [sp, #56]	@ 0x38
20023e78:	f7fe fe82 	bl	20022b80 <HAL_FLASH_SET_CLK_rom>
20023e7c:	f894 3035 	ldrb.w	r3, [r4, #53]	@ 0x35
20023e80:	b12b      	cbz	r3, 20023e8e <HAL_FLASH_Init+0xfe>
20023e82:	2b01      	cmp	r3, #1
20023e84:	d110      	bne.n	20023ea8 <HAL_FLASH_Init+0x118>
20023e86:	2100      	movs	r1, #0
20023e88:	4620      	mov	r0, r4
20023e8a:	f7fe ff91 	bl	20022db0 <HAL_FLASH_SET_DUAL_MODE>
20023e8e:	2101      	movs	r1, #1
20023e90:	4620      	mov	r0, r4
20023e92:	f7fe ff1a 	bl	20022cca <HAL_FLASH_ENABLE_QSPI>
20023e96:	2600      	movs	r6, #0
20023e98:	e7c8      	b.n	20023e2c <HAL_FLASH_Init+0x9c>
20023e9a:	2d00      	cmp	r5, #0
20023e9c:	d0de      	beq.n	20023e5c <HAL_FLASH_Init+0xcc>
20023e9e:	f06f 437f 	mvn.w	r3, #4278190080	@ 0xff000000
20023ea2:	429d      	cmp	r5, r3
20023ea4:	d1c1      	bne.n	20023e2a <HAL_FLASH_Init+0x9a>
20023ea6:	e7d9      	b.n	20023e5c <HAL_FLASH_Init+0xcc>
20023ea8:	2b02      	cmp	r3, #2
20023eaa:	d1f0      	bne.n	20023e8e <HAL_FLASH_Init+0xfe>
20023eac:	2101      	movs	r1, #1
20023eae:	e7eb      	b.n	20023e88 <HAL_FLASH_Init+0xf8>
20023eb0:	6822      	ldr	r2, [r4, #0]
20023eb2:	2700      	movs	r7, #0
20023eb4:	6893      	ldr	r3, [r2, #8]
20023eb6:	4639      	mov	r1, r7
20023eb8:	f043 7370 	orr.w	r3, r3, #62914560	@ 0x3c00000
20023ebc:	6093      	str	r3, [r2, #8]
20023ebe:	2301      	movs	r3, #1
20023ec0:	463a      	mov	r2, r7
20023ec2:	4620      	mov	r0, r4
20023ec4:	e9cd 7303 	strd	r7, r3, [sp, #12]
20023ec8:	e9cd 7701 	strd	r7, r7, [sp, #4]
20023ecc:	463b      	mov	r3, r7
20023ece:	9700      	str	r7, [sp, #0]
20023ed0:	f7fe fe5f 	bl	20022b92 <HAL_FLASH_MANUAL_CMD>
20023ed4:	463a      	mov	r2, r7
20023ed6:	21ff      	movs	r1, #255	@ 0xff
20023ed8:	4620      	mov	r0, r4
20023eda:	f7fe fe15 	bl	20022b08 <HAL_FLASH_SET_CMD>
20023ede:	4638      	mov	r0, r7
20023ee0:	f7fe f825 	bl	20021f2e <HAL_Delay_us>
20023ee4:	20c8      	movs	r0, #200	@ 0xc8
20023ee6:	f7fe f822 	bl	20021f2e <HAL_Delay_us>
20023eea:	2e00      	cmp	r6, #0
20023eec:	d0ad      	beq.n	20023e4a <HAL_FLASH_Init+0xba>
20023eee:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023ef2:	b2ef      	uxtb	r7, r5
20023ef4:	f3c5 2807 	ubfx	r8, r5, #8, #8
20023ef8:	6325      	str	r5, [r4, #48]	@ 0x30
20023efa:	f3c5 4507 	ubfx	r5, r5, #16, #8
20023efe:	4642      	mov	r2, r8
20023f00:	4629      	mov	r1, r5
20023f02:	4638      	mov	r0, r7
20023f04:	b3ab      	cbz	r3, 20023f72 <HAL_FLASH_Init+0x1e2>
20023f06:	f001 f9d7 	bl	200252b8 <spi_nand_get_cmd_by_id>
20023f0a:	60e0      	str	r0, [r4, #12]
20023f0c:	bba0      	cbnz	r0, 20023f78 <HAL_FLASH_Init+0x1e8>
20023f0e:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023f12:	b32b      	cbz	r3, 20023f60 <HAL_FLASH_Init+0x1d0>
20023f14:	2108      	movs	r1, #8
20023f16:	4620      	mov	r0, r4
20023f18:	f7ff fb43 	bl	200235a2 <nand_read_id>
20023f1c:	f3c0 2807 	ubfx	r8, r0, #8, #8
20023f20:	f3c0 4507 	ubfx	r5, r0, #16, #8
20023f24:	b2c7      	uxtb	r7, r0
20023f26:	6320      	str	r0, [r4, #48]	@ 0x30
20023f28:	4642      	mov	r2, r8
20023f2a:	4629      	mov	r1, r5
20023f2c:	4638      	mov	r0, r7
20023f2e:	f001 f9c3 	bl	200252b8 <spi_nand_get_cmd_by_id>
20023f32:	60e0      	str	r0, [r4, #12]
20023f34:	bb00      	cbnz	r0, 20023f78 <HAL_FLASH_Init+0x1e8>
20023f36:	210f      	movs	r1, #15
20023f38:	4620      	mov	r0, r4
20023f3a:	f7ff fb32 	bl	200235a2 <nand_read_id>
20023f3e:	f3c0 2807 	ubfx	r8, r0, #8, #8
20023f42:	f3c0 4507 	ubfx	r5, r0, #16, #8
20023f46:	b2c7      	uxtb	r7, r0
20023f48:	6320      	str	r0, [r4, #48]	@ 0x30
20023f4a:	4642      	mov	r2, r8
20023f4c:	4629      	mov	r1, r5
20023f4e:	4638      	mov	r0, r7
20023f50:	f001 f9b2 	bl	200252b8 <spi_nand_get_cmd_by_id>
20023f54:	60e0      	str	r0, [r4, #12]
20023f56:	b978      	cbnz	r0, 20023f78 <HAL_FLASH_Init+0x1e8>
20023f58:	f001 f9c4 	bl	200252e4 <spi_nand_get_default_ctable>
20023f5c:	60e0      	str	r0, [r4, #12]
20023f5e:	b958      	cbnz	r0, 20023f78 <HAL_FLASH_Init+0x1e8>
20023f60:	2100      	movs	r1, #0
20023f62:	4620      	mov	r0, r4
20023f64:	f7fe feb1 	bl	20022cca <HAL_FLASH_ENABLE_QSPI>
20023f68:	2300      	movs	r3, #0
20023f6a:	e9c4 330e 	strd	r3, r3, [r4, #56]	@ 0x38
20023f6e:	2001      	movs	r0, #1
20023f70:	e04c      	b.n	2002400c <HAL_FLASH_Init+0x27c>
20023f72:	f001 f959 	bl	20025228 <spi_flash_get_cmd_by_id>
20023f76:	e7c8      	b.n	20023f0a <HAL_FLASH_Init+0x17a>
20023f78:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023f7c:	4642      	mov	r2, r8
20023f7e:	4629      	mov	r1, r5
20023f80:	4638      	mov	r0, r7
20023f82:	2b00      	cmp	r3, #0
20023f84:	d045      	beq.n	20024012 <HAL_FLASH_Init+0x282>
20023f86:	f001 f9bb 	bl	20025300 <spi_nand_get_size_by_id>
20023f8a:	4642      	mov	r2, r8
20023f8c:	4629      	mov	r1, r5
20023f8e:	4681      	mov	r9, r0
20023f90:	4638      	mov	r0, r7
20023f92:	f001 f9bf 	bl	20025314 <spi_nand_get_plane_select_flag>
20023f96:	4642      	mov	r2, r8
20023f98:	4629      	mov	r1, r5
20023f9a:	f884 0027 	strb.w	r0, [r4, #39]	@ 0x27
20023f9e:	4638      	mov	r0, r7
20023fa0:	f001 f9c1 	bl	20025326 <spi_nand_get_big_page_flag>
20023fa4:	4642      	mov	r2, r8
20023fa6:	f884 0024 	strb.w	r0, [r4, #36]	@ 0x24
20023faa:	4629      	mov	r1, r5
20023fac:	4638      	mov	r0, r7
20023fae:	f001 f9c3 	bl	20025338 <spi_nand_get_ecc_mode>
20023fb2:	f894 3024 	ldrb.w	r3, [r4, #36]	@ 0x24
20023fb6:	ea43 1300 	orr.w	r3, r3, r0, lsl #4
20023fba:	f884 3024 	strb.w	r3, [r4, #36]	@ 0x24
20023fbe:	f1b9 0f00 	cmp.w	r9, #0
20023fc2:	d003      	beq.n	20023fcc <HAL_FLASH_Init+0x23c>
20023fc4:	f8c4 903c 	str.w	r9, [r4, #60]	@ 0x3c
20023fc8:	f8c4 9014 	str.w	r9, [r4, #20]
20023fcc:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023fd0:	2b00      	cmp	r3, #0
20023fd2:	d173      	bne.n	200240bc <HAL_FLASH_Init+0x32c>
20023fd4:	2e00      	cmp	r6, #0
20023fd6:	d16e      	bne.n	200240b6 <HAL_FLASH_Init+0x326>
20023fd8:	4620      	mov	r0, r4
20023fda:	f7ff f97f 	bl	200232dc <HAL_FLASH_CLR_PROTECT>
20023fde:	6963      	ldr	r3, [r4, #20]
20023fe0:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
20023fe4:	d938      	bls.n	20024058 <HAL_FLASH_Init+0x2c8>
20023fe6:	4632      	mov	r2, r6
20023fe8:	2121      	movs	r1, #33	@ 0x21
20023fea:	4620      	mov	r0, r4
20023fec:	f7ff f806 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
20023ff0:	f894 3020 	ldrb.w	r3, [r4, #32]
20023ff4:	b98b      	cbnz	r3, 2002401a <HAL_FLASH_Init+0x28a>
20023ff6:	4631      	mov	r1, r6
20023ff8:	4620      	mov	r0, r4
20023ffa:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
20023ffe:	f7ff f947 	bl	20023290 <HAL_FLASH_FADDR_SET_QSPI>
20024002:	2107      	movs	r1, #7
20024004:	4620      	mov	r0, r4
20024006:	f7fe febb 	bl	20022d80 <HAL_FLASH_SET_ROW_BOUNDARY>
2002400a:	2000      	movs	r0, #0
2002400c:	b007      	add	sp, #28
2002400e:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
20024012:	f001 f91d 	bl	20025250 <spi_flash_get_size_by_id>
20024016:	4681      	mov	r9, r0
20024018:	e7d1      	b.n	20023fbe <HAL_FLASH_Init+0x22e>
2002401a:	2101      	movs	r1, #1
2002401c:	4620      	mov	r0, r4
2002401e:	f7ff f937 	bl	20023290 <HAL_FLASH_FADDR_SET_QSPI>
20024022:	f894 9026 	ldrb.w	r9, [r4, #38]	@ 0x26
20024026:	f1b9 0f01 	cmp.w	r9, #1
2002402a:	d1ea      	bne.n	20024002 <HAL_FLASH_Init+0x272>
2002402c:	4642      	mov	r2, r8
2002402e:	4629      	mov	r1, r5
20024030:	4638      	mov	r0, r7
20024032:	f001 f917 	bl	20025264 <spi_flash_is_support_dtr>
20024036:	b138      	cbz	r0, 20024048 <HAL_FLASH_Init+0x2b8>
20024038:	4620      	mov	r0, r4
2002403a:	f7ff fe85 	bl	20023d48 <HAL_NOR_DTR_CAL>
2002403e:	4649      	mov	r1, r9
20024040:	4620      	mov	r0, r4
20024042:	f7ff fe3a 	bl	20023cba <HAL_NOR_CFG_DTR>
20024046:	e7dc      	b.n	20024002 <HAL_FLASH_Init+0x272>
20024048:	4632      	mov	r2, r6
2002404a:	4631      	mov	r1, r6
2002404c:	4620      	mov	r0, r4
2002404e:	f7fe fef5 	bl	20022e3c <HAL_MPI_CFG_DTR>
20024052:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
20024056:	e7d4      	b.n	20024002 <HAL_FLASH_Init+0x272>
20024058:	f894 3020 	ldrb.w	r3, [r4, #32]
2002405c:	b933      	cbnz	r3, 2002406c <HAL_FLASH_Init+0x2dc>
2002405e:	4631      	mov	r1, r6
20024060:	4620      	mov	r0, r4
20024062:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
20024066:	f7ff f908 	bl	2002327a <HAL_FLASH_SET_QUAL_SPI>
2002406a:	e7ce      	b.n	2002400a <HAL_FLASH_Init+0x27a>
2002406c:	2101      	movs	r1, #1
2002406e:	4620      	mov	r0, r4
20024070:	f7ff f903 	bl	2002327a <HAL_FLASH_SET_QUAL_SPI>
20024074:	f894 9026 	ldrb.w	r9, [r4, #38]	@ 0x26
20024078:	f1b9 0f01 	cmp.w	r9, #1
2002407c:	d115      	bne.n	200240aa <HAL_FLASH_Init+0x31a>
2002407e:	4642      	mov	r2, r8
20024080:	4629      	mov	r1, r5
20024082:	4638      	mov	r0, r7
20024084:	f001 f8ee 	bl	20025264 <spi_flash_is_support_dtr>
20024088:	b138      	cbz	r0, 2002409a <HAL_FLASH_Init+0x30a>
2002408a:	4620      	mov	r0, r4
2002408c:	f7ff fe5c 	bl	20023d48 <HAL_NOR_DTR_CAL>
20024090:	4649      	mov	r1, r9
20024092:	4620      	mov	r0, r4
20024094:	f7ff fe11 	bl	20023cba <HAL_NOR_CFG_DTR>
20024098:	e7b7      	b.n	2002400a <HAL_FLASH_Init+0x27a>
2002409a:	4632      	mov	r2, r6
2002409c:	4631      	mov	r1, r6
2002409e:	4620      	mov	r0, r4
200240a0:	f7fe fecc 	bl	20022e3c <HAL_MPI_CFG_DTR>
200240a4:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
200240a8:	e7af      	b.n	2002400a <HAL_FLASH_Init+0x27a>
200240aa:	4632      	mov	r2, r6
200240ac:	4631      	mov	r1, r6
200240ae:	4620      	mov	r0, r4
200240b0:	f7fe fec4 	bl	20022e3c <HAL_MPI_CFG_DTR>
200240b4:	e7a9      	b.n	2002400a <HAL_FLASH_Init+0x27a>
200240b6:	f884 3026 	strb.w	r3, [r4, #38]	@ 0x26
200240ba:	e7a6      	b.n	2002400a <HAL_FLASH_Init+0x27a>
200240bc:	2101      	movs	r1, #1
200240be:	4620      	mov	r0, r4
200240c0:	f7fe fcfd 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200240c4:	68e3      	ldr	r3, [r4, #12]
200240c6:	2102      	movs	r1, #2
200240c8:	791a      	ldrb	r2, [r3, #4]
200240ca:	4620      	mov	r0, r4
200240cc:	f7fe ff96 	bl	20022ffc <HAL_FLASH_ISSUE_CMD>
200240d0:	4620      	mov	r0, r4
200240d2:	f7fe fd4a 	bl	20022b6a <HAL_FLASH_READ32>
200240d6:	4605      	mov	r5, r0
200240d8:	200a      	movs	r0, #10
200240da:	f7fd ff28 	bl	20021f2e <HAL_Delay_us>
200240de:	07eb      	lsls	r3, r5, #31
200240e0:	d4ec      	bmi.n	200240bc <HAL_FLASH_Init+0x32c>
200240e2:	4620      	mov	r0, r4
200240e4:	f7ff fb95 	bl	20023812 <nand_clear_status>
200240e8:	f894 3020 	ldrb.w	r3, [r4, #32]
200240ec:	2b02      	cmp	r3, #2
200240ee:	d18c      	bne.n	2002400a <HAL_FLASH_Init+0x27a>
200240f0:	2101      	movs	r1, #1
200240f2:	4620      	mov	r0, r4
200240f4:	f7ff fb5c 	bl	200237b0 <HAL_NAND_EN_QUAL>
200240f8:	e787      	b.n	2002400a <HAL_FLASH_Init+0x27a>
200240fa:	bf00      	nop
200240fc:	05f5e100 	.word	0x05f5e100

20024100 <HAL_Delay_us_psram>:
20024100:	b51f      	push	{r0, r1, r2, r3, r4, lr}
20024102:	9001      	str	r0, [sp, #4]
20024104:	9b01      	ldr	r3, [sp, #4]
20024106:	4c11      	ldr	r4, [pc, #68]	@ (2002414c <HAL_Delay_us_psram+0x4c>)
20024108:	b10b      	cbz	r3, 2002410e <HAL_Delay_us_psram+0xe>
2002410a:	6820      	ldr	r0, [r4, #0]
2002410c:	b940      	cbnz	r0, 20024120 <HAL_Delay_us_psram+0x20>
2002410e:	2000      	movs	r0, #0
20024110:	f000 feda 	bl	20024ec8 <HAL_RCC_GetHCLKFreq>
20024114:	4b0e      	ldr	r3, [pc, #56]	@ (20024150 <HAL_Delay_us_psram+0x50>)
20024116:	fbb0 f0f3 	udiv	r0, r0, r3
2002411a:	9b01      	ldr	r3, [sp, #4]
2002411c:	6020      	str	r0, [r4, #0]
2002411e:	b19b      	cbz	r3, 20024148 <HAL_Delay_us_psram+0x48>
20024120:	2830      	cmp	r0, #48	@ 0x30
20024122:	bf82      	ittt	hi
20024124:	9b01      	ldrhi	r3, [sp, #4]
20024126:	f103 33ff 	addhi.w	r3, r3, #4294967295	@ 0xffffffff
2002412a:	9301      	strhi	r3, [sp, #4]
2002412c:	9b01      	ldr	r3, [sp, #4]
2002412e:	b15b      	cbz	r3, 20024148 <HAL_Delay_us_psram+0x48>
20024130:	2205      	movs	r2, #5
20024132:	9b01      	ldr	r3, [sp, #4]
20024134:	3b01      	subs	r3, #1
20024136:	4343      	muls	r3, r0
20024138:	fbb3 f3f2 	udiv	r3, r3, r2
2002413c:	9303      	str	r3, [sp, #12]
2002413e:	9b03      	ldr	r3, [sp, #12]
20024140:	1e5a      	subs	r2, r3, #1
20024142:	9203      	str	r2, [sp, #12]
20024144:	2b00      	cmp	r3, #0
20024146:	d1fa      	bne.n	2002413e <HAL_Delay_us_psram+0x3e>
20024148:	b004      	add	sp, #16
2002414a:	bd10      	pop	{r4, pc}
2002414c:	2004cbc8 	.word	0x2004cbc8
20024150:	000f4240 	.word	0x000f4240

20024154 <HAL_MPI_OPSRAM_CAL_DELAY>:
20024154:	b570      	push	{r4, r5, r6, lr}
20024156:	460e      	mov	r6, r1
20024158:	4615      	mov	r5, r2
2002415a:	4604      	mov	r4, r0
2002415c:	b358      	cbz	r0, 200241b6 <HAL_MPI_OPSRAM_CAL_DELAY+0x62>
2002415e:	2202      	movs	r2, #2
20024160:	6803      	ldr	r3, [r0, #0]
20024162:	60da      	str	r2, [r3, #12]
20024164:	6802      	ldr	r2, [r0, #0]
20024166:	6d93      	ldr	r3, [r2, #88]	@ 0x58
20024168:	f023 7300 	bic.w	r3, r3, #33554432	@ 0x2000000
2002416c:	6593      	str	r3, [r2, #88]	@ 0x58
2002416e:	6802      	ldr	r2, [r0, #0]
20024170:	2000      	movs	r0, #0
20024172:	f8d2 3094 	ldr.w	r3, [r2, #148]	@ 0x94
20024176:	f043 4300 	orr.w	r3, r3, #2147483648	@ 0x80000000
2002417a:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
2002417e:	f7ff ffbf 	bl	20024100 <HAL_Delay_us_psram>
20024182:	2014      	movs	r0, #20
20024184:	f7ff ffbc 	bl	20024100 <HAL_Delay_us_psram>
20024188:	6820      	ldr	r0, [r4, #0]
2002418a:	f8d0 3094 	ldr.w	r3, [r0, #148]	@ 0x94
2002418e:	05db      	lsls	r3, r3, #23
20024190:	d5fb      	bpl.n	2002418a <HAL_MPI_OPSRAM_CAL_DELAY+0x36>
20024192:	f8d0 3094 	ldr.w	r3, [r0, #148]	@ 0x94
20024196:	f8d0 2094 	ldr.w	r2, [r0, #148]	@ 0x94
2002419a:	b2db      	uxtb	r3, r3
2002419c:	f022 4200 	bic.w	r2, r2, #2147483648	@ 0x80000000
200241a0:	f8c0 2094 	str.w	r2, [r0, #148]	@ 0x94
200241a4:	1e5a      	subs	r2, r3, #1
200241a6:	7032      	strb	r2, [r6, #0]
200241a8:	2201      	movs	r2, #1
200241aa:	2000      	movs	r0, #0
200241ac:	3b04      	subs	r3, #4
200241ae:	702b      	strb	r3, [r5, #0]
200241b0:	6823      	ldr	r3, [r4, #0]
200241b2:	60da      	str	r2, [r3, #12]
200241b4:	bd70      	pop	{r4, r5, r6, pc}
200241b6:	2001      	movs	r0, #1
200241b8:	e7fc      	b.n	200241b4 <HAL_MPI_OPSRAM_CAL_DELAY+0x60>
	...

200241bc <HAL_SPI_PSRAM_Init>:
200241bc:	b537      	push	{r0, r1, r2, r4, r5, lr}
200241be:	4614      	mov	r4, r2
200241c0:	4605      	mov	r5, r0
200241c2:	2800      	cmp	r0, #0
200241c4:	d043      	beq.n	2002424e <HAL_SPI_PSRAM_Init+0x92>
200241c6:	2900      	cmp	r1, #0
200241c8:	d041      	beq.n	2002424e <HAL_SPI_PSRAM_Init+0x92>
200241ca:	f7fe fbff 	bl	200229cc <HAL_QSPI_Init>
200241ce:	4628      	mov	r0, r5
200241d0:	b2e1      	uxtb	r1, r4
200241d2:	f7fe fcd5 	bl	20022b80 <HAL_FLASH_SET_CLK_rom>
200241d6:	4628      	mov	r0, r5
200241d8:	f7ff fd54 	bl	20023c84 <HAL_QSPI_GET_CLK>
200241dc:	4b1d      	ldr	r3, [pc, #116]	@ (20024254 <HAL_SPI_PSRAM_Init+0x98>)
200241de:	4298      	cmp	r0, r3
200241e0:	d930      	bls.n	20024244 <HAL_SPI_PSRAM_Init+0x88>
200241e2:	4b1d      	ldr	r3, [pc, #116]	@ (20024258 <HAL_SPI_PSRAM_Init+0x9c>)
200241e4:	4298      	cmp	r0, r3
200241e6:	d92f      	bls.n	20024248 <HAL_SPI_PSRAM_Init+0x8c>
200241e8:	4b1c      	ldr	r3, [pc, #112]	@ (2002425c <HAL_SPI_PSRAM_Init+0xa0>)
200241ea:	4298      	cmp	r0, r3
200241ec:	d922      	bls.n	20024234 <HAL_SPI_PSRAM_Init+0x78>
200241ee:	f240 34b6 	movw	r4, #950	@ 0x3b6
200241f2:	f240 4374 	movw	r3, #1140	@ 0x474
200241f6:	4a1a      	ldr	r2, [pc, #104]	@ (20024260 <HAL_SPI_PSRAM_Init+0xa4>)
200241f8:	4290      	cmp	r0, r2
200241fa:	bf88      	it	hi
200241fc:	461c      	movhi	r4, r3
200241fe:	2200      	movs	r2, #0
20024200:	2101      	movs	r1, #1
20024202:	4628      	mov	r0, r5
20024204:	f7ff f8fa 	bl	200233fc <HAL_QSPI_SET_CLK_INV>
20024208:	2100      	movs	r1, #0
2002420a:	4622      	mov	r2, r4
2002420c:	2302      	movs	r3, #2
2002420e:	4628      	mov	r0, r5
20024210:	9100      	str	r1, [sp, #0]
20024212:	f7fe fda0 	bl	20022d56 <HAL_FLASH_SET_CS_TIME>
20024216:	4604      	mov	r4, r0
20024218:	b948      	cbnz	r0, 2002422e <HAL_SPI_PSRAM_Init+0x72>
2002421a:	2106      	movs	r1, #6
2002421c:	4628      	mov	r0, r5
2002421e:	f7fe fdaf 	bl	20022d80 <HAL_FLASH_SET_ROW_BOUNDARY>
20024222:	4604      	mov	r4, r0
20024224:	b918      	cbnz	r0, 2002422e <HAL_SPI_PSRAM_Init+0x72>
20024226:	2101      	movs	r1, #1
20024228:	4628      	mov	r0, r5
2002422a:	f7fe fd4e 	bl	20022cca <HAL_FLASH_ENABLE_QSPI>
2002422e:	4620      	mov	r0, r4
20024230:	b003      	add	sp, #12
20024232:	bd30      	pop	{r4, r5, pc}
20024234:	4b0b      	ldr	r3, [pc, #44]	@ (20024264 <HAL_SPI_PSRAM_Init+0xa8>)
20024236:	f44f 743e 	mov.w	r4, #760	@ 0x2f8
2002423a:	4298      	cmp	r0, r3
2002423c:	d8df      	bhi.n	200241fe <HAL_SPI_PSRAM_Init+0x42>
2002423e:	2200      	movs	r2, #0
20024240:	4611      	mov	r1, r2
20024242:	e7de      	b.n	20024202 <HAL_SPI_PSRAM_Init+0x46>
20024244:	24b4      	movs	r4, #180	@ 0xb4
20024246:	e7fa      	b.n	2002423e <HAL_SPI_PSRAM_Init+0x82>
20024248:	f44f 74be 	mov.w	r4, #380	@ 0x17c
2002424c:	e7f7      	b.n	2002423e <HAL_SPI_PSRAM_Init+0x82>
2002424e:	2401      	movs	r4, #1
20024250:	e7ed      	b.n	2002422e <HAL_SPI_PSRAM_Init+0x72>
20024252:	bf00      	nop
20024254:	016e3600 	.word	0x016e3600
20024258:	02dc6c00 	.word	0x02dc6c00
2002425c:	05b8d800 	.word	0x05b8d800
20024260:	07270e00 	.word	0x07270e00
20024264:	03938700 	.word	0x03938700

20024268 <HAL_MPI_MR_WRITE>:
20024268:	b5f0      	push	{r4, r5, r6, r7, lr}
2002426a:	460e      	mov	r6, r1
2002426c:	4617      	mov	r7, r2
2002426e:	4605      	mov	r5, r0
20024270:	b087      	sub	sp, #28
20024272:	b1d8      	cbz	r0, 200242ac <HAL_MPI_MR_WRITE+0x44>
20024274:	2207      	movs	r2, #7
20024276:	2400      	movs	r4, #0
20024278:	2303      	movs	r3, #3
2002427a:	e9cd 2203 	strd	r2, r2, [sp, #12]
2002427e:	2101      	movs	r1, #1
20024280:	e9cd 4301 	strd	r4, r3, [sp, #4]
20024284:	9400      	str	r4, [sp, #0]
20024286:	4623      	mov	r3, r4
20024288:	f7fe fc83 	bl	20022b92 <HAL_FLASH_MANUAL_CMD>
2002428c:	2102      	movs	r1, #2
2002428e:	4628      	mov	r0, r5
20024290:	f7fe fc15 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
20024294:	4639      	mov	r1, r7
20024296:	4628      	mov	r0, r5
20024298:	f7fe fc0a 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
2002429c:	4632      	mov	r2, r6
2002429e:	21c0      	movs	r1, #192	@ 0xc0
200242a0:	4628      	mov	r0, r5
200242a2:	f7fe fc31 	bl	20022b08 <HAL_FLASH_SET_CMD>
200242a6:	4620      	mov	r0, r4
200242a8:	b007      	add	sp, #28
200242aa:	bdf0      	pop	{r4, r5, r6, r7, pc}
200242ac:	2001      	movs	r0, #1
200242ae:	e7fb      	b.n	200242a8 <HAL_MPI_MR_WRITE+0x40>

200242b0 <HAL_MPI_SET_FIXLAT>:
200242b0:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
200242b4:	460c      	mov	r4, r1
200242b6:	4616      	mov	r6, r2
200242b8:	461f      	mov	r7, r3
200242ba:	4605      	mov	r5, r0
200242bc:	2800      	cmp	r0, #0
200242be:	d040      	beq.n	20024342 <HAL_MPI_SET_FIXLAT+0x92>
200242c0:	466b      	mov	r3, sp
200242c2:	4a21      	ldr	r2, [pc, #132]	@ (20024348 <HAL_MPI_SET_FIXLAT+0x98>)
200242c4:	6810      	ldr	r0, [r2, #0]
200242c6:	6851      	ldr	r1, [r2, #4]
200242c8:	c303      	stmia	r3!, {r0, r1}
200242ca:	6890      	ldr	r0, [r2, #8]
200242cc:	68d1      	ldr	r1, [r2, #12]
200242ce:	c303      	stmia	r3!, {r0, r1}
200242d0:	4628      	mov	r0, r5
200242d2:	b2e1      	uxtb	r1, r4
200242d4:	f7fe fd7a 	bl	20022dcc <HAL_MPI_EN_FIXLAT>
200242d8:	f107 0310 	add.w	r3, r7, #16
200242dc:	446b      	add	r3, sp
200242de:	f813 8c08 	ldrb.w	r8, [r3, #-8]
200242e2:	ea4f 1848 	mov.w	r8, r8, lsl #5
200242e6:	fa5f f888 	uxtb.w	r8, r8
200242ea:	b30c      	cbz	r4, 20024330 <HAL_MPI_SET_FIXLAT+0x80>
200242ec:	ab04      	add	r3, sp, #16
200242ee:	eb03 0356 	add.w	r3, r3, r6, lsr #1
200242f2:	f813 4c10 	ldrb.w	r4, [r3, #-16]
200242f6:	00a4      	lsls	r4, r4, #2
200242f8:	f044 0421 	orr.w	r4, r4, #33	@ 0x21
200242fc:	b264      	sxtb	r4, r4
200242fe:	f004 02fd 	and.w	r2, r4, #253	@ 0xfd
20024302:	2100      	movs	r1, #0
20024304:	4628      	mov	r0, r5
20024306:	f7ff ffaf 	bl	20024268 <HAL_MPI_MR_WRITE>
2002430a:	1e71      	subs	r1, r6, #1
2002430c:	4628      	mov	r0, r5
2002430e:	b249      	sxtb	r1, r1
20024310:	f7fe fdba 	bl	20022e88 <HAL_MPI_MODIFY_RCMD_DELAY>
20024314:	4642      	mov	r2, r8
20024316:	2104      	movs	r1, #4
20024318:	4628      	mov	r0, r5
2002431a:	f7ff ffa5 	bl	20024268 <HAL_MPI_MR_WRITE>
2002431e:	1e79      	subs	r1, r7, #1
20024320:	4628      	mov	r0, r5
20024322:	b249      	sxtb	r1, r1
20024324:	f7fe fdb9 	bl	20022e9a <HAL_MPI_MODIFY_WCMD_DELAY>
20024328:	2000      	movs	r0, #0
2002432a:	b004      	add	sp, #16
2002432c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20024330:	f106 0310 	add.w	r3, r6, #16
20024334:	446b      	add	r3, sp
20024336:	f813 4c10 	ldrb.w	r4, [r3, #-16]
2002433a:	00a4      	lsls	r4, r4, #2
2002433c:	f044 0401 	orr.w	r4, r4, #1
20024340:	e7dc      	b.n	200242fc <HAL_MPI_SET_FIXLAT+0x4c>
20024342:	2001      	movs	r0, #1
20024344:	e7f1      	b.n	2002432a <HAL_MPI_SET_FIXLAT+0x7a>
20024346:	bf00      	nop
20024348:	2002b038 	.word	0x2002b038

2002434c <HAL_LEGACY_MR_WRITE>:
2002434c:	b5f0      	push	{r4, r5, r6, r7, lr}
2002434e:	460e      	mov	r6, r1
20024350:	4617      	mov	r7, r2
20024352:	4605      	mov	r5, r0
20024354:	b087      	sub	sp, #28
20024356:	b1d8      	cbz	r0, 20024390 <HAL_LEGACY_MR_WRITE+0x44>
20024358:	2207      	movs	r2, #7
2002435a:	2400      	movs	r4, #0
2002435c:	2302      	movs	r3, #2
2002435e:	e9cd 2203 	strd	r2, r2, [sp, #12]
20024362:	2101      	movs	r1, #1
20024364:	e9cd 4301 	strd	r4, r3, [sp, #4]
20024368:	9400      	str	r4, [sp, #0]
2002436a:	4623      	mov	r3, r4
2002436c:	f7fe fc11 	bl	20022b92 <HAL_FLASH_MANUAL_CMD>
20024370:	2104      	movs	r1, #4
20024372:	4628      	mov	r0, r5
20024374:	f7fe fba3 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
20024378:	4639      	mov	r1, r7
2002437a:	4628      	mov	r0, r5
2002437c:	f7fe fb98 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
20024380:	4632      	mov	r2, r6
20024382:	21c0      	movs	r1, #192	@ 0xc0
20024384:	4628      	mov	r0, r5
20024386:	f7fe fbbf 	bl	20022b08 <HAL_FLASH_SET_CMD>
2002438a:	4620      	mov	r0, r4
2002438c:	b007      	add	sp, #28
2002438e:	bdf0      	pop	{r4, r5, r6, r7, pc}
20024390:	2001      	movs	r0, #1
20024392:	e7fb      	b.n	2002438c <HAL_LEGACY_MR_WRITE+0x40>

20024394 <HAL_LEGACY_CFG_READ>:
20024394:	b530      	push	{r4, r5, lr}
20024396:	4605      	mov	r5, r0
20024398:	b085      	sub	sp, #20
2002439a:	b1a0      	cbz	r0, 200243c6 <HAL_LEGACY_CFG_READ+0x32>
2002439c:	2400      	movs	r4, #0
2002439e:	2107      	movs	r1, #7
200243a0:	2302      	movs	r3, #2
200243a2:	f890 2025 	ldrb.w	r2, [r0, #37]	@ 0x25
200243a6:	e9cd 1102 	strd	r1, r1, [sp, #8]
200243aa:	0052      	lsls	r2, r2, #1
200243ac:	e9cd 4300 	strd	r4, r3, [sp]
200243b0:	b252      	sxtb	r2, r2
200243b2:	4623      	mov	r3, r4
200243b4:	f7fe fb36 	bl	20022a24 <HAL_FLASH_CFG_AHB_RCMD>
200243b8:	4621      	mov	r1, r4
200243ba:	4628      	mov	r0, r5
200243bc:	f7fe fb27 	bl	20022a0e <HAL_FLASH_SET_AHB_RCMD>
200243c0:	4620      	mov	r0, r4
200243c2:	b005      	add	sp, #20
200243c4:	bd30      	pop	{r4, r5, pc}
200243c6:	2001      	movs	r0, #1
200243c8:	e7fb      	b.n	200243c2 <HAL_LEGACY_CFG_READ+0x2e>

200243ca <HAL_LEGACY_CFG_WRITE>:
200243ca:	b530      	push	{r4, r5, lr}
200243cc:	4605      	mov	r5, r0
200243ce:	b085      	sub	sp, #20
200243d0:	b190      	cbz	r0, 200243f8 <HAL_LEGACY_CFG_WRITE+0x2e>
200243d2:	2107      	movs	r1, #7
200243d4:	2400      	movs	r4, #0
200243d6:	2302      	movs	r3, #2
200243d8:	e9cd 1102 	strd	r1, r1, [sp, #8]
200243dc:	e9cd 4300 	strd	r4, r3, [sp]
200243e0:	4623      	mov	r3, r4
200243e2:	f990 2026 	ldrsb.w	r2, [r0, #38]	@ 0x26
200243e6:	f7fe fb46 	bl	20022a76 <HAL_FLASH_CFG_AHB_WCMD>
200243ea:	2180      	movs	r1, #128	@ 0x80
200243ec:	4628      	mov	r0, r5
200243ee:	f7fe fb36 	bl	20022a5e <HAL_FLASH_SET_AHB_WCMD>
200243f2:	4620      	mov	r0, r4
200243f4:	b005      	add	sp, #20
200243f6:	bd30      	pop	{r4, r5, pc}
200243f8:	2001      	movs	r0, #1
200243fa:	e7fb      	b.n	200243f4 <HAL_LEGACY_CFG_WRITE+0x2a>

200243fc <HAL_PSRAM_RESET>:
200243fc:	b5f0      	push	{r4, r5, r6, r7, lr}
200243fe:	4604      	mov	r4, r0
20024400:	b087      	sub	sp, #28
20024402:	2800      	cmp	r0, #0
20024404:	d03b      	beq.n	2002447e <HAL_PSRAM_RESET+0x82>
20024406:	f890 3023 	ldrb.w	r3, [r0, #35]	@ 0x23
2002440a:	2b05      	cmp	r3, #5
2002440c:	d034      	beq.n	20024478 <HAL_PSRAM_RESET+0x7c>
2002440e:	3b03      	subs	r3, #3
20024410:	2b01      	cmp	r3, #1
20024412:	d82e      	bhi.n	20024472 <HAL_PSRAM_RESET+0x76>
20024414:	2601      	movs	r6, #1
20024416:	2703      	movs	r7, #3
20024418:	2300      	movs	r3, #0
2002441a:	2507      	movs	r5, #7
2002441c:	b276      	sxtb	r6, r6
2002441e:	b27f      	sxtb	r7, r7
20024420:	461a      	mov	r2, r3
20024422:	2101      	movs	r1, #1
20024424:	4620      	mov	r0, r4
20024426:	e9cd 5503 	strd	r5, r5, [sp, #12]
2002442a:	e9cd 5701 	strd	r5, r7, [sp, #4]
2002442e:	9600      	str	r6, [sp, #0]
20024430:	f7fe fbaf 	bl	20022b92 <HAL_FLASH_MANUAL_CMD>
20024434:	2200      	movs	r2, #0
20024436:	21ff      	movs	r1, #255	@ 0xff
20024438:	4620      	mov	r0, r4
2002443a:	f7fe fb65 	bl	20022b08 <HAL_FLASH_SET_CMD>
2002443e:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20024442:	2b05      	cmp	r3, #5
20024444:	d10f      	bne.n	20024466 <HAL_PSRAM_RESET+0x6a>
20024446:	2300      	movs	r3, #0
20024448:	2101      	movs	r1, #1
2002444a:	461a      	mov	r2, r3
2002444c:	4620      	mov	r0, r4
2002444e:	e9cd 5503 	strd	r5, r5, [sp, #12]
20024452:	e9cd 5701 	strd	r5, r7, [sp, #4]
20024456:	9600      	str	r6, [sp, #0]
20024458:	f7fe fb9b 	bl	20022b92 <HAL_FLASH_MANUAL_CMD>
2002445c:	2200      	movs	r2, #0
2002445e:	21ff      	movs	r1, #255	@ 0xff
20024460:	4620      	mov	r0, r4
20024462:	f7fe fb51 	bl	20022b08 <HAL_FLASH_SET_CMD>
20024466:	2000      	movs	r0, #0
20024468:	f7fd fd61 	bl	20021f2e <HAL_Delay_us>
2002446c:	2003      	movs	r0, #3
2002446e:	f7fd fd5e 	bl	20021f2e <HAL_Delay_us>
20024472:	2000      	movs	r0, #0
20024474:	b007      	add	sp, #28
20024476:	bdf0      	pop	{r4, r5, r6, r7, pc}
20024478:	2603      	movs	r6, #3
2002447a:	2702      	movs	r7, #2
2002447c:	e7cc      	b.n	20024418 <HAL_PSRAM_RESET+0x1c>
2002447e:	2001      	movs	r0, #1
20024480:	e7f8      	b.n	20024474 <HAL_PSRAM_RESET+0x78>
	...

20024484 <HAL_OPI_PSRAM_Init>:
20024484:	b530      	push	{r4, r5, lr}
20024486:	4604      	mov	r4, r0
20024488:	b085      	sub	sp, #20
2002448a:	2800      	cmp	r0, #0
2002448c:	d06e      	beq.n	2002456c <HAL_OPI_PSRAM_Init+0xe8>
2002448e:	2900      	cmp	r1, #0
20024490:	d06c      	beq.n	2002456c <HAL_OPI_PSRAM_Init+0xe8>
20024492:	f7fe fa9b 	bl	200229cc <HAL_QSPI_Init>
20024496:	6823      	ldr	r3, [r4, #0]
20024498:	f10d 020e 	add.w	r2, sp, #14
2002449c:	f10d 010f 	add.w	r1, sp, #15
200244a0:	4620      	mov	r0, r4
200244a2:	681d      	ldr	r5, [r3, #0]
200244a4:	f7ff fe56 	bl	20024154 <HAL_MPI_OPSRAM_CAL_DELAY>
200244a8:	2101      	movs	r1, #1
200244aa:	4620      	mov	r0, r4
200244ac:	f7fe fb68 	bl	20022b80 <HAL_FLASH_SET_CLK_rom>
200244b0:	4620      	mov	r0, r4
200244b2:	f7ff fbe7 	bl	20023c84 <HAL_QSPI_GET_CLK>
200244b6:	4b2e      	ldr	r3, [pc, #184]	@ (20024570 <HAL_OPI_PSRAM_Init+0xec>)
200244b8:	f005 0501 	and.w	r5, r5, #1
200244bc:	4298      	cmp	r0, r3
200244be:	d836      	bhi.n	2002452e <HAL_OPI_PSRAM_Init+0xaa>
200244c0:	2314      	movs	r3, #20
200244c2:	2103      	movs	r1, #3
200244c4:	f88d 300e 	strb.w	r3, [sp, #14]
200244c8:	f88d 300f 	strb.w	r3, [sp, #15]
200244cc:	4608      	mov	r0, r1
200244ce:	2300      	movs	r3, #0
200244d0:	22b4      	movs	r2, #180	@ 0xb4
200244d2:	f884 1025 	strb.w	r1, [r4, #37]	@ 0x25
200244d6:	f884 1026 	strb.w	r1, [r4, #38]	@ 0x26
200244da:	2106      	movs	r1, #6
200244dc:	9000      	str	r0, [sp, #0]
200244de:	4620      	mov	r0, r4
200244e0:	f7fe fc39 	bl	20022d56 <HAL_FLASH_SET_CS_TIME>
200244e4:	2107      	movs	r1, #7
200244e6:	4620      	mov	r0, r4
200244e8:	f7fe fc4a 	bl	20022d80 <HAL_FLASH_SET_ROW_BOUNDARY>
200244ec:	2101      	movs	r1, #1
200244ee:	4620      	mov	r0, r4
200244f0:	f7fe fc7a 	bl	20022de8 <HAL_MPI_ENABLE_DQS>
200244f4:	f89d 100e 	ldrb.w	r1, [sp, #14]
200244f8:	4620      	mov	r0, r4
200244fa:	f7fe fc83 	bl	20022e04 <HAL_MPI_SET_DQS_DELAY>
200244fe:	2200      	movs	r2, #0
20024500:	f89d 100f 	ldrb.w	r1, [sp, #15]
20024504:	4620      	mov	r0, r4
20024506:	f7fe fc89 	bl	20022e1c <HAL_MPI_SET_SCK>
2002450a:	2101      	movs	r1, #1
2002450c:	4620      	mov	r0, r4
2002450e:	f7fe fbdc 	bl	20022cca <HAL_FLASH_ENABLE_QSPI>
20024512:	2101      	movs	r1, #1
20024514:	4620      	mov	r0, r4
20024516:	f7fe fbe6 	bl	20022ce6 <HAL_FLASH_ENABLE_OPI>
2002451a:	b92d      	cbnz	r5, 20024528 <HAL_OPI_PSRAM_Init+0xa4>
2002451c:	4b15      	ldr	r3, [pc, #84]	@ (20024574 <HAL_OPI_PSRAM_Init+0xf0>)
2002451e:	681b      	ldr	r3, [r3, #0]
20024520:	f003 0303 	and.w	r3, r3, #3
20024524:	2b03      	cmp	r3, #3
20024526:	d11d      	bne.n	20024564 <HAL_OPI_PSRAM_Init+0xe0>
20024528:	2000      	movs	r0, #0
2002452a:	b005      	add	sp, #20
2002452c:	bd30      	pop	{r4, r5, pc}
2002452e:	4b12      	ldr	r3, [pc, #72]	@ (20024578 <HAL_OPI_PSRAM_Init+0xf4>)
20024530:	4298      	cmp	r0, r3
20024532:	d90b      	bls.n	2002454c <HAL_OPI_PSRAM_Init+0xc8>
20024534:	f103 7337 	add.w	r3, r3, #47972352	@ 0x2dc0000
20024538:	f503 43d8 	add.w	r3, r3, #27648	@ 0x6c00
2002453c:	4298      	cmp	r0, r3
2002453e:	d90b      	bls.n	20024558 <HAL_OPI_PSRAM_Init+0xd4>
20024540:	2107      	movs	r1, #7
20024542:	2014      	movs	r0, #20
20024544:	2308      	movs	r3, #8
20024546:	f240 5232 	movw	r2, #1330	@ 0x532
2002454a:	e7c2      	b.n	200244d2 <HAL_OPI_PSRAM_Init+0x4e>
2002454c:	2105      	movs	r1, #5
2002454e:	200e      	movs	r0, #14
20024550:	2303      	movs	r3, #3
20024552:	f240 32b6 	movw	r2, #950	@ 0x3b6
20024556:	e7bc      	b.n	200244d2 <HAL_OPI_PSRAM_Init+0x4e>
20024558:	2106      	movs	r1, #6
2002455a:	2011      	movs	r0, #17
2002455c:	2305      	movs	r3, #5
2002455e:	f240 4274 	movw	r2, #1140	@ 0x474
20024562:	e7b6      	b.n	200244d2 <HAL_OPI_PSRAM_Init+0x4e>
20024564:	4620      	mov	r0, r4
20024566:	f7ff ff49 	bl	200243fc <HAL_PSRAM_RESET>
2002456a:	e7dd      	b.n	20024528 <HAL_OPI_PSRAM_Init+0xa4>
2002456c:	2001      	movs	r0, #1
2002456e:	e7dc      	b.n	2002452a <HAL_OPI_PSRAM_Init+0xa6>
20024570:	02dc6c01 	.word	0x02dc6c01
20024574:	500c0000 	.word	0x500c0000
20024578:	0e4e1c01 	.word	0x0e4e1c01

2002457c <HAL_LEGACY_PSRAM_Init>:
2002457c:	b5f0      	push	{r4, r5, r6, r7, lr}
2002457e:	4604      	mov	r4, r0
20024580:	b085      	sub	sp, #20
20024582:	2800      	cmp	r0, #0
20024584:	f000 8096 	beq.w	200246b4 <HAL_LEGACY_PSRAM_Init+0x138>
20024588:	2900      	cmp	r1, #0
2002458a:	f000 8093 	beq.w	200246b4 <HAL_LEGACY_PSRAM_Init+0x138>
2002458e:	f7fe fa1d 	bl	200229cc <HAL_QSPI_Init>
20024592:	6823      	ldr	r3, [r4, #0]
20024594:	f10d 020e 	add.w	r2, sp, #14
20024598:	f10d 010f 	add.w	r1, sp, #15
2002459c:	4620      	mov	r0, r4
2002459e:	681e      	ldr	r6, [r3, #0]
200245a0:	f7ff fdd8 	bl	20024154 <HAL_MPI_OPSRAM_CAL_DELAY>
200245a4:	2101      	movs	r1, #1
200245a6:	4620      	mov	r0, r4
200245a8:	f7fe faea 	bl	20022b80 <HAL_FLASH_SET_CLK_rom>
200245ac:	4620      	mov	r0, r4
200245ae:	f7ff fb69 	bl	20023c84 <HAL_QSPI_GET_CLK>
200245b2:	4b41      	ldr	r3, [pc, #260]	@ (200246b8 <HAL_LEGACY_PSRAM_Init+0x13c>)
200245b4:	4605      	mov	r5, r0
200245b6:	4298      	cmp	r0, r3
200245b8:	4f40      	ldr	r7, [pc, #256]	@ (200246bc <HAL_LEGACY_PSRAM_Init+0x140>)
200245ba:	f006 0601 	and.w	r6, r6, #1
200245be:	d850      	bhi.n	20024662 <HAL_LEGACY_PSRAM_Init+0xe6>
200245c0:	2314      	movs	r3, #20
200245c2:	2103      	movs	r1, #3
200245c4:	f88d 300e 	strb.w	r3, [sp, #14]
200245c8:	f88d 300f 	strb.w	r3, [sp, #15]
200245cc:	22b4      	movs	r2, #180	@ 0xb4
200245ce:	2300      	movs	r3, #0
200245d0:	9100      	str	r1, [sp, #0]
200245d2:	4620      	mov	r0, r4
200245d4:	2106      	movs	r1, #6
200245d6:	f7fe fbbe 	bl	20022d56 <HAL_FLASH_SET_CS_TIME>
200245da:	2107      	movs	r1, #7
200245dc:	4620      	mov	r0, r4
200245de:	f7fe fbcf 	bl	20022d80 <HAL_FLASH_SET_ROW_BOUNDARY>
200245e2:	2101      	movs	r1, #1
200245e4:	4620      	mov	r0, r4
200245e6:	f7fe fbff 	bl	20022de8 <HAL_MPI_ENABLE_DQS>
200245ea:	f89d 100e 	ldrb.w	r1, [sp, #14]
200245ee:	4620      	mov	r0, r4
200245f0:	f7fe fc08 	bl	20022e04 <HAL_MPI_SET_DQS_DELAY>
200245f4:	2200      	movs	r2, #0
200245f6:	f89d 100f 	ldrb.w	r1, [sp, #15]
200245fa:	4620      	mov	r0, r4
200245fc:	f7fe fc0e 	bl	20022e1c <HAL_MPI_SET_SCK>
20024600:	2101      	movs	r1, #1
20024602:	4620      	mov	r0, r4
20024604:	f7fe fbc6 	bl	20022d94 <HAL_FLASH_SET_LEGACY>
20024608:	2101      	movs	r1, #1
2002460a:	4620      	mov	r0, r4
2002460c:	f7fe fb5d 	bl	20022cca <HAL_FLASH_ENABLE_QSPI>
20024610:	2101      	movs	r1, #1
20024612:	4620      	mov	r0, r4
20024614:	f7fe fb67 	bl	20022ce6 <HAL_FLASH_ENABLE_OPI>
20024618:	b92e      	cbnz	r6, 20024626 <HAL_LEGACY_PSRAM_Init+0xaa>
2002461a:	f894 3027 	ldrb.w	r3, [r4, #39]	@ 0x27
2002461e:	b913      	cbnz	r3, 20024626 <HAL_LEGACY_PSRAM_Init+0xaa>
20024620:	4620      	mov	r0, r4
20024622:	f7ff feeb 	bl	200243fc <HAL_PSRAM_RESET>
20024626:	42bd      	cmp	r5, r7
20024628:	d93a      	bls.n	200246a0 <HAL_LEGACY_PSRAM_Init+0x124>
2002462a:	4b25      	ldr	r3, [pc, #148]	@ (200246c0 <HAL_LEGACY_PSRAM_Init+0x144>)
2002462c:	429d      	cmp	r5, r3
2002462e:	d93c      	bls.n	200246aa <HAL_LEGACY_PSRAM_Init+0x12e>
20024630:	2206      	movs	r2, #6
20024632:	2302      	movs	r3, #2
20024634:	2588      	movs	r5, #136	@ 0x88
20024636:	263b      	movs	r6, #59	@ 0x3b
20024638:	f884 3026 	strb.w	r3, [r4, #38]	@ 0x26
2002463c:	2101      	movs	r1, #1
2002463e:	f884 2025 	strb.w	r2, [r4, #37]	@ 0x25
20024642:	4620      	mov	r0, r4
20024644:	f7fe fbc2 	bl	20022dcc <HAL_MPI_EN_FIXLAT>
20024648:	4632      	mov	r2, r6
2002464a:	2100      	movs	r1, #0
2002464c:	4620      	mov	r0, r4
2002464e:	f7ff fe7d 	bl	2002434c <HAL_LEGACY_MR_WRITE>
20024652:	462a      	mov	r2, r5
20024654:	2104      	movs	r1, #4
20024656:	4620      	mov	r0, r4
20024658:	f7ff fe78 	bl	2002434c <HAL_LEGACY_MR_WRITE>
2002465c:	2000      	movs	r0, #0
2002465e:	b005      	add	sp, #20
20024660:	bdf0      	pop	{r4, r5, r6, r7, pc}
20024662:	42b8      	cmp	r0, r7
20024664:	d90d      	bls.n	20024682 <HAL_LEGACY_PSRAM_Init+0x106>
20024666:	4b16      	ldr	r3, [pc, #88]	@ (200246c0 <HAL_LEGACY_PSRAM_Init+0x144>)
20024668:	4298      	cmp	r0, r3
2002466a:	d90f      	bls.n	2002468c <HAL_LEGACY_PSRAM_Init+0x110>
2002466c:	f103 7337 	add.w	r3, r3, #47972352	@ 0x2dc0000
20024670:	f503 43d8 	add.w	r3, r3, #27648	@ 0x6c00
20024674:	4298      	cmp	r0, r3
20024676:	d80e      	bhi.n	20024696 <HAL_LEGACY_PSRAM_Init+0x11a>
20024678:	2114      	movs	r1, #20
2002467a:	2308      	movs	r3, #8
2002467c:	f240 5232 	movw	r2, #1330	@ 0x532
20024680:	e7a6      	b.n	200245d0 <HAL_LEGACY_PSRAM_Init+0x54>
20024682:	210e      	movs	r1, #14
20024684:	2303      	movs	r3, #3
20024686:	f240 32b6 	movw	r2, #950	@ 0x3b6
2002468a:	e7a1      	b.n	200245d0 <HAL_LEGACY_PSRAM_Init+0x54>
2002468c:	2111      	movs	r1, #17
2002468e:	2305      	movs	r3, #5
20024690:	f240 4274 	movw	r2, #1140	@ 0x474
20024694:	e79c      	b.n	200245d0 <HAL_LEGACY_PSRAM_Init+0x54>
20024696:	2117      	movs	r1, #23
20024698:	2309      	movs	r3, #9
2002469a:	f44f 62be 	mov.w	r2, #1520	@ 0x5f0
2002469e:	e797      	b.n	200245d0 <HAL_LEGACY_PSRAM_Init+0x54>
200246a0:	2204      	movs	r2, #4
200246a2:	2300      	movs	r3, #0
200246a4:	2508      	movs	r5, #8
200246a6:	2633      	movs	r6, #51	@ 0x33
200246a8:	e7c6      	b.n	20024638 <HAL_LEGACY_PSRAM_Init+0xbc>
200246aa:	2205      	movs	r2, #5
200246ac:	2300      	movs	r3, #0
200246ae:	2508      	movs	r5, #8
200246b0:	2637      	movs	r6, #55	@ 0x37
200246b2:	e7c1      	b.n	20024638 <HAL_LEGACY_PSRAM_Init+0xbc>
200246b4:	2001      	movs	r0, #1
200246b6:	e7d2      	b.n	2002465e <HAL_LEGACY_PSRAM_Init+0xe2>
200246b8:	02dc6c01 	.word	0x02dc6c01
200246bc:	0e4e1c01 	.word	0x0e4e1c01
200246c0:	112a8801 	.word	0x112a8801

200246c4 <HAL_HYPER_PSRAM_WriteCR>:
200246c4:	b570      	push	{r4, r5, r6, lr}
200246c6:	460e      	mov	r6, r1
200246c8:	4615      	mov	r5, r2
200246ca:	4604      	mov	r4, r0
200246cc:	b086      	sub	sp, #24
200246ce:	b1f8      	cbz	r0, 20024710 <HAL_HYPER_PSRAM_WriteCR+0x4c>
200246d0:	2207      	movs	r2, #7
200246d2:	2303      	movs	r3, #3
200246d4:	e9cd 2301 	strd	r2, r3, [sp, #4]
200246d8:	2300      	movs	r3, #0
200246da:	e9cd 2203 	strd	r2, r2, [sp, #12]
200246de:	9300      	str	r3, [sp, #0]
200246e0:	2101      	movs	r1, #1
200246e2:	f7fe fa56 	bl	20022b92 <HAL_FLASH_MANUAL_CMD>
200246e6:	4631      	mov	r1, r6
200246e8:	4620      	mov	r0, r4
200246ea:	f7fe f9fc 	bl	20022ae6 <HAL_FLASH_WRITE_ABYTE>
200246ee:	2102      	movs	r1, #2
200246f0:	4620      	mov	r0, r4
200246f2:	f7fe f9e4 	bl	20022abe <HAL_FLASH_WRITE_DLEN>
200246f6:	4629      	mov	r1, r5
200246f8:	4620      	mov	r0, r4
200246fa:	f7fe f9d9 	bl	20022ab0 <HAL_FLASH_WRITE_WORD>
200246fe:	f44f 3280 	mov.w	r2, #65536	@ 0x10000
20024702:	2160      	movs	r1, #96	@ 0x60
20024704:	4620      	mov	r0, r4
20024706:	b006      	add	sp, #24
20024708:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
2002470c:	f7fe b9fc 	b.w	20022b08 <HAL_FLASH_SET_CMD>
20024710:	b006      	add	sp, #24
20024712:	bd70      	pop	{r4, r5, r6, pc}

20024714 <HAL_HYPER_PSRAM_Init>:
20024714:	b538      	push	{r3, r4, r5, lr}
20024716:	4604      	mov	r4, r0
20024718:	2201      	movs	r2, #1
2002471a:	f7ff feb3 	bl	20024484 <HAL_OPI_PSRAM_Init>
2002471e:	4620      	mov	r0, r4
20024720:	f7ff fab0 	bl	20023c84 <HAL_QSPI_GET_CLK>
20024724:	4b15      	ldr	r3, [pc, #84]	@ (2002477c <HAL_HYPER_PSRAM_Init+0x68>)
20024726:	4298      	cmp	r0, r3
20024728:	d91f      	bls.n	2002476a <HAL_HYPER_PSRAM_Init+0x56>
2002472a:	4b15      	ldr	r3, [pc, #84]	@ (20024780 <HAL_HYPER_PSRAM_Init+0x6c>)
2002472c:	4298      	cmp	r0, r3
2002472e:	d91f      	bls.n	20024770 <HAL_HYPER_PSRAM_Init+0x5c>
20024730:	f103 73f4 	add.w	r3, r3, #31981568	@ 0x1e80000
20024734:	f503 4390 	add.w	r3, r3, #18432	@ 0x4800
20024738:	4298      	cmp	r0, r3
2002473a:	d91c      	bls.n	20024776 <HAL_HYPER_PSRAM_Init+0x62>
2002473c:	f242 758f 	movw	r5, #10127	@ 0x278f
20024740:	f241 738f 	movw	r3, #6031	@ 0x178f
20024744:	4a0f      	ldr	r2, [pc, #60]	@ (20024784 <HAL_HYPER_PSRAM_Init+0x70>)
20024746:	4290      	cmp	r0, r2
20024748:	bf98      	it	ls
2002474a:	461d      	movls	r5, r3
2002474c:	2101      	movs	r1, #1
2002474e:	4620      	mov	r0, r4
20024750:	f7fe fad7 	bl	20022d02 <HAL_FLASH_ENABLE_HYPER>
20024754:	462a      	mov	r2, r5
20024756:	4620      	mov	r0, r4
20024758:	2100      	movs	r1, #0
2002475a:	f7ff ffb3 	bl	200246c4 <HAL_HYPER_PSRAM_WriteCR>
2002475e:	2101      	movs	r1, #1
20024760:	4620      	mov	r0, r4
20024762:	f7fe fb33 	bl	20022dcc <HAL_MPI_EN_FIXLAT>
20024766:	2000      	movs	r0, #0
20024768:	bd38      	pop	{r3, r4, r5, pc}
2002476a:	f24e 758f 	movw	r5, #59279	@ 0xe78f
2002476e:	e7ed      	b.n	2002474c <HAL_HYPER_PSRAM_Init+0x38>
20024770:	f24f 758f 	movw	r5, #63375	@ 0xf78f
20024774:	e7ea      	b.n	2002474c <HAL_HYPER_PSRAM_Init+0x38>
20024776:	f240 758f 	movw	r5, #1935	@ 0x78f
2002477a:	e7e7      	b.n	2002474c <HAL_HYPER_PSRAM_Init+0x38>
2002477c:	0a21fe81 	.word	0x0a21fe81
20024780:	0c65d401 	.word	0x0c65d401
20024784:	112a8801 	.word	0x112a8801

20024788 <HAL_HYPER_CFG_READ>:
20024788:	b51f      	push	{r0, r1, r2, r3, r4, lr}
2002478a:	b160      	cbz	r0, 200247a6 <HAL_HYPER_CFG_READ+0x1e>
2002478c:	2107      	movs	r1, #7
2002478e:	2303      	movs	r3, #3
20024790:	f890 2025 	ldrb.w	r2, [r0, #37]	@ 0x25
20024794:	e9cd 1300 	strd	r1, r3, [sp]
20024798:	3a01      	subs	r2, #1
2002479a:	2300      	movs	r3, #0
2002479c:	e9cd 1102 	strd	r1, r1, [sp, #8]
200247a0:	b252      	sxtb	r2, r2
200247a2:	f7fe f93f 	bl	20022a24 <HAL_FLASH_CFG_AHB_RCMD>
200247a6:	b005      	add	sp, #20
200247a8:	f85d fb04 	ldr.w	pc, [sp], #4

200247ac <HAL_HYPER_CFG_WRITE>:
200247ac:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200247ae:	b160      	cbz	r0, 200247ca <HAL_HYPER_CFG_WRITE+0x1e>
200247b0:	2107      	movs	r1, #7
200247b2:	2303      	movs	r3, #3
200247b4:	f890 2026 	ldrb.w	r2, [r0, #38]	@ 0x26
200247b8:	e9cd 1300 	strd	r1, r3, [sp]
200247bc:	3a01      	subs	r2, #1
200247be:	2300      	movs	r3, #0
200247c0:	e9cd 1102 	strd	r1, r1, [sp, #8]
200247c4:	b252      	sxtb	r2, r2
200247c6:	f7fe f956 	bl	20022a76 <HAL_FLASH_CFG_AHB_WCMD>
200247ca:	b005      	add	sp, #20
200247cc:	f85d fb04 	ldr.w	pc, [sp], #4

200247d0 <HAL_PIN_SetUartFunc.part.0>:
200247d0:	108b      	asrs	r3, r1, #2
200247d2:	f1a3 0248 	sub.w	r2, r3, #72	@ 0x48
200247d6:	b5f0      	push	{r4, r5, r6, r7, lr}
200247d8:	b2d6      	uxtb	r6, r2
200247da:	2e04      	cmp	r6, #4
200247dc:	d849      	bhi.n	20024872 <HAL_PIN_SetUartFunc.part.0+0xa2>
200247de:	2e02      	cmp	r6, #2
200247e0:	d810      	bhi.n	20024804 <HAL_PIN_SetUartFunc.part.0+0x34>
200247e2:	4d25      	ldr	r5, [pc, #148]	@ (20024878 <HAL_PIN_SetUartFunc.part.0+0xa8>)
200247e4:	240e      	movs	r4, #14
200247e6:	eb05 0582 	add.w	r5, r5, r2, lsl #2
200247ea:	f240 22b2 	movw	r2, #690	@ 0x2b2
200247ee:	eba1 0386 	sub.w	r3, r1, r6, lsl #2
200247f2:	b29b      	uxth	r3, r3
200247f4:	f5a3 7390 	sub.w	r3, r3, #288	@ 0x120
200247f8:	2b03      	cmp	r3, #3
200247fa:	d83a      	bhi.n	20024872 <HAL_PIN_SetUartFunc.part.0+0xa2>
200247fc:	e8df f003 	tbb	[pc, r3]
20024800:	20271a09 	.word	0x20271a09
20024804:	4d1d      	ldr	r5, [pc, #116]	@ (2002487c <HAL_PIN_SetUartFunc.part.0+0xac>)
20024806:	009b      	lsls	r3, r3, #2
20024808:	243d      	movs	r4, #61	@ 0x3d
2002480a:	f240 3221 	movw	r2, #801	@ 0x321
2002480e:	441d      	add	r5, r3
20024810:	e7ed      	b.n	200247ee <HAL_PIN_SetUartFunc.part.0+0x1e>
20024812:	2c0e      	cmp	r4, #14
20024814:	f04f 0608 	mov.w	r6, #8
20024818:	d120      	bne.n	2002485c <HAL_PIN_SetUartFunc.part.0+0x8c>
2002481a:	f44f 517c 	mov.w	r1, #16128	@ 0x3f00
2002481e:	682f      	ldr	r7, [r5, #0]
20024820:	1b03      	subs	r3, r0, r4
20024822:	40b3      	lsls	r3, r6
20024824:	407b      	eors	r3, r7
20024826:	400b      	ands	r3, r1
20024828:	4410      	add	r0, r2
2002482a:	407b      	eors	r3, r7
2002482c:	1b00      	subs	r0, r0, r4
2002482e:	602b      	str	r3, [r5, #0]
20024830:	b280      	uxth	r0, r0
20024832:	bdf0      	pop	{r4, r5, r6, r7, pc}
20024834:	2c0e      	cmp	r4, #14
20024836:	f04f 0600 	mov.w	r6, #0
2002483a:	d112      	bne.n	20024862 <HAL_PIN_SetUartFunc.part.0+0x92>
2002483c:	213f      	movs	r1, #63	@ 0x3f
2002483e:	e7ee      	b.n	2002481e <HAL_PIN_SetUartFunc.part.0+0x4e>
20024840:	2c0e      	cmp	r4, #14
20024842:	f04f 0610 	mov.w	r6, #16
20024846:	d10e      	bne.n	20024866 <HAL_PIN_SetUartFunc.part.0+0x96>
20024848:	f44f 117c 	mov.w	r1, #4128768	@ 0x3f0000
2002484c:	e7e7      	b.n	2002481e <HAL_PIN_SetUartFunc.part.0+0x4e>
2002484e:	2c0e      	cmp	r4, #14
20024850:	f04f 0618 	mov.w	r6, #24
20024854:	d10a      	bne.n	2002486c <HAL_PIN_SetUartFunc.part.0+0x9c>
20024856:	f04f 517c 	mov.w	r1, #1056964608	@ 0x3f000000
2002485a:	e7e0      	b.n	2002481e <HAL_PIN_SetUartFunc.part.0+0x4e>
2002485c:	f44f 61e0 	mov.w	r1, #1792	@ 0x700
20024860:	e7dd      	b.n	2002481e <HAL_PIN_SetUartFunc.part.0+0x4e>
20024862:	2107      	movs	r1, #7
20024864:	e7db      	b.n	2002481e <HAL_PIN_SetUartFunc.part.0+0x4e>
20024866:	f44f 21e0 	mov.w	r1, #458752	@ 0x70000
2002486a:	e7d8      	b.n	2002481e <HAL_PIN_SetUartFunc.part.0+0x4e>
2002486c:	f04f 61e0 	mov.w	r1, #117440512	@ 0x7000000
20024870:	e7d5      	b.n	2002481e <HAL_PIN_SetUartFunc.part.0+0x4e>
20024872:	2000      	movs	r0, #0
20024874:	e7dd      	b.n	20024832 <HAL_PIN_SetUartFunc.part.0+0x62>
20024876:	bf00      	nop
20024878:	5000b058 	.word	0x5000b058
2002487c:	4000ef0c 	.word	0x4000ef0c

20024880 <HAL_PIN_SetAonPE>:
20024880:	2a00      	cmp	r2, #0
20024882:	d031      	beq.n	200248e8 <HAL_PIN_SetAonPE+0x68>
20024884:	282f      	cmp	r0, #47	@ 0x2f
20024886:	dd16      	ble.n	200248b6 <HAL_PIN_SetAonPE+0x36>
20024888:	283a      	cmp	r0, #58	@ 0x3a
2002488a:	dc2d      	bgt.n	200248e8 <HAL_PIN_SetAonPE+0x68>
2002488c:	2301      	movs	r3, #1
2002488e:	4a17      	ldr	r2, [pc, #92]	@ (200248ec <HAL_PIN_SetAonPE+0x6c>)
20024890:	382a      	subs	r0, #42	@ 0x2a
20024892:	4083      	lsls	r3, r0
20024894:	6f10      	ldr	r0, [r2, #112]	@ 0x70
20024896:	f011 0f20 	tst.w	r1, #32
2002489a:	bf14      	ite	ne
2002489c:	4318      	orrne	r0, r3
2002489e:	4398      	biceq	r0, r3
200248a0:	6710      	str	r0, [r2, #112]	@ 0x70
200248a2:	4a12      	ldr	r2, [pc, #72]	@ (200248ec <HAL_PIN_SetAonPE+0x6c>)
200248a4:	f011 0f10 	tst.w	r1, #16
200248a8:	6ed1      	ldr	r1, [r2, #108]	@ 0x6c
200248aa:	bf14      	ite	ne
200248ac:	430b      	orrne	r3, r1
200248ae:	ea21 0303 	biceq.w	r3, r1, r3
200248b2:	66d3      	str	r3, [r2, #108]	@ 0x6c
200248b4:	4770      	bx	lr
200248b6:	3826      	subs	r0, #38	@ 0x26
200248b8:	2803      	cmp	r0, #3
200248ba:	d815      	bhi.n	200248e8 <HAL_PIN_SetAonPE+0x68>
200248bc:	4b0c      	ldr	r3, [pc, #48]	@ (200248f0 <HAL_PIN_SetAonPE+0x70>)
200248be:	f011 0f20 	tst.w	r1, #32
200248c2:	f853 2020 	ldr.w	r2, [r3, r0, lsl #2]
200248c6:	bf14      	ite	ne
200248c8:	f042 0210 	orrne.w	r2, r2, #16
200248cc:	f022 0210 	biceq.w	r2, r2, #16
200248d0:	f843 2020 	str.w	r2, [r3, r0, lsl #2]
200248d4:	f853 2020 	ldr.w	r2, [r3, r0, lsl #2]
200248d8:	06c9      	lsls	r1, r1, #27
200248da:	bf4c      	ite	mi
200248dc:	f042 0208 	orrmi.w	r2, r2, #8
200248e0:	f022 0208 	bicpl.w	r2, r2, #8
200248e4:	f843 2020 	str.w	r2, [r3, r0, lsl #2]
200248e8:	4770      	bx	lr
200248ea:	bf00      	nop
200248ec:	500cb000 	.word	0x500cb000
200248f0:	500cb05c 	.word	0x500cb05c

200248f4 <HAL_PIN_Get_Base>:
200248f4:	b138      	cbz	r0, 20024906 <HAL_PIN_Get_Base+0x12>
200248f6:	f04f 42a0 	mov.w	r2, #1342177280	@ 0x50000000
200248fa:	6893      	ldr	r3, [r2, #8]
200248fc:	4806      	ldr	r0, [pc, #24]	@ (20024918 <HAL_PIN_Get_Base+0x24>)
200248fe:	f043 0304 	orr.w	r3, r3, #4
20024902:	6093      	str	r3, [r2, #8]
20024904:	4770      	bx	lr
20024906:	f04f 4280 	mov.w	r2, #1073741824	@ 0x40000000
2002490a:	6853      	ldr	r3, [r2, #4]
2002490c:	4803      	ldr	r0, [pc, #12]	@ (2002491c <HAL_PIN_Get_Base+0x28>)
2002490e:	f043 0308 	orr.w	r3, r3, #8
20024912:	6053      	str	r3, [r2, #4]
20024914:	4770      	bx	lr
20024916:	bf00      	nop
20024918:	50003000 	.word	0x50003000
2002491c:	40003000 	.word	0x40003000

20024920 <HAL_PIN_Func2Idx>:
20024920:	283b      	cmp	r0, #59	@ 0x3b
20024922:	bfc8      	it	gt
20024924:	383c      	subgt	r0, #60	@ 0x3c
20024926:	0143      	lsls	r3, r0, #5
20024928:	b152      	cbz	r2, 20024940 <HAL_PIN_Func2Idx+0x20>
2002492a:	4a06      	ldr	r2, [pc, #24]	@ (20024944 <HAL_PIN_Func2Idx+0x24>)
2002492c:	2000      	movs	r0, #0
2002492e:	4413      	add	r3, r2
20024930:	f833 2010 	ldrh.w	r2, [r3, r0, lsl #1]
20024934:	428a      	cmp	r2, r1
20024936:	d002      	beq.n	2002493e <HAL_PIN_Func2Idx+0x1e>
20024938:	3001      	adds	r0, #1
2002493a:	2810      	cmp	r0, #16
2002493c:	d1f8      	bne.n	20024930 <HAL_PIN_Func2Idx+0x10>
2002493e:	4770      	bx	lr
20024940:	4a01      	ldr	r2, [pc, #4]	@ (20024948 <HAL_PIN_Func2Idx+0x28>)
20024942:	e7f3      	b.n	2002492c <HAL_PIN_Func2Idx+0xc>
20024944:	2002b524 	.word	0x2002b524
20024948:	2002b484 	.word	0x2002b484

2002494c <HAL_PIN_Set>:
2002494c:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20024950:	4615      	mov	r5, r2
20024952:	4604      	mov	r4, r0
20024954:	b918      	cbnz	r0, 2002495e <HAL_PIN_Set+0x12>
20024956:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
2002495a:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
2002495e:	283a      	cmp	r0, #58	@ 0x3a
20024960:	bfcd      	iteet	gt
20024962:	2700      	movgt	r7, #0
20024964:	2701      	movle	r7, #1
20024966:	4606      	movle	r6, r0
20024968:	f1a0 063c 	subgt.w	r6, r0, #60	@ 0x3c
2002496c:	4638      	mov	r0, r7
2002496e:	f7ff ffc1 	bl	200248f4 <HAL_PIN_Get_Base>
20024972:	4680      	mov	r8, r0
20024974:	2f00      	cmp	r7, #0
20024976:	f000 815e 	beq.w	20024c36 <HAL_PIN_Set+0x2ea>
2002497a:	f1a4 0026 	sub.w	r0, r4, #38	@ 0x26
2002497e:	2803      	cmp	r0, #3
20024980:	d80a      	bhi.n	20024998 <HAL_PIN_Set+0x4c>
20024982:	f8df c30c 	ldr.w	ip, [pc, #780]	@ 20024c90 <HAL_PIN_Set+0x344>
20024986:	f104 4380 	add.w	r3, r4, #1073741824	@ 0x40000000
2002498a:	3b26      	subs	r3, #38	@ 0x26
2002498c:	f85c 2023 	ldr.w	r2, [ip, r3, lsl #2]
20024990:	f022 0202 	bic.w	r2, r2, #2
20024994:	f84c 2023 	str.w	r2, [ip, r3, lsl #2]
20024998:	f5a1 7390 	sub.w	r3, r1, #288	@ 0x120
2002499c:	b29b      	uxth	r3, r3
2002499e:	2b0b      	cmp	r3, #11
200249a0:	d804      	bhi.n	200249ac <HAL_PIN_Set+0x60>
200249a2:	4620      	mov	r0, r4
200249a4:	f7ff ff14 	bl	200247d0 <HAL_PIN_SetUartFunc.part.0>
200249a8:	4601      	mov	r1, r0
200249aa:	e025      	b.n	200249f8 <HAL_PIN_Set+0xac>
200249ac:	f5a1 739c 	sub.w	r3, r1, #312	@ 0x138
200249b0:	b29b      	uxth	r3, r3
200249b2:	2b07      	cmp	r3, #7
200249b4:	d850      	bhi.n	20024a58 <HAL_PIN_Set+0x10c>
200249b6:	104a      	asrs	r2, r1, #1
200249b8:	3a9c      	subs	r2, #156	@ 0x9c
200249ba:	eba1 0142 	sub.w	r1, r1, r2, lsl #1
200249be:	b289      	uxth	r1, r1
200249c0:	f5b1 7f9c 	cmp.w	r1, #312	@ 0x138
200249c4:	d043      	beq.n	20024a4e <HAL_PIN_Set+0x102>
200249c6:	f240 1339 	movw	r3, #313	@ 0x139
200249ca:	4299      	cmp	r1, r3
200249cc:	f040 813a 	bne.w	20024c44 <HAL_PIN_Set+0x2f8>
200249d0:	f04f 0e08 	mov.w	lr, #8
200249d4:	f44f 5c7c 	mov.w	ip, #16128	@ 0x3f00
200249d8:	49a5      	ldr	r1, [pc, #660]	@ (20024c70 <HAL_PIN_Set+0x324>)
200249da:	f1a4 030e 	sub.w	r3, r4, #14
200249de:	f851 0022 	ldr.w	r0, [r1, r2, lsl #2]
200249e2:	fa03 f30e 	lsl.w	r3, r3, lr
200249e6:	4043      	eors	r3, r0
200249e8:	ea03 030c 	and.w	r3, r3, ip
200249ec:	4043      	eors	r3, r0
200249ee:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
200249f2:	f504 7129 	add.w	r1, r4, #676	@ 0x2a4
200249f6:	b289      	uxth	r1, r1
200249f8:	463a      	mov	r2, r7
200249fa:	4620      	mov	r0, r4
200249fc:	f7ff ff90 	bl	20024920 <HAL_PIN_Func2Idx>
20024a00:	280f      	cmp	r0, #15
20024a02:	4681      	mov	r9, r0
20024a04:	dca7      	bgt.n	20024956 <HAL_PIN_Set+0xa>
20024a06:	463a      	mov	r2, r7
20024a08:	4629      	mov	r1, r5
20024a0a:	4620      	mov	r0, r4
20024a0c:	f7ff ff38 	bl	20024880 <HAL_PIN_SetAonPE>
20024a10:	2f00      	cmp	r7, #0
20024a12:	f040 8119 	bne.w	20024c48 <HAL_PIN_Set+0x2fc>
20024a16:	2c40      	cmp	r4, #64	@ 0x40
20024a18:	f340 8116 	ble.w	20024c48 <HAL_PIN_Set+0x2fc>
20024a1c:	4a95      	ldr	r2, [pc, #596]	@ (20024c74 <HAL_PIN_Set+0x328>)
20024a1e:	06e8      	lsls	r0, r5, #27
20024a20:	f852 3024 	ldr.w	r3, [r2, r4, lsl #2]
20024a24:	ea4f 3909 	mov.w	r9, r9, lsl #12
20024a28:	f423 43e0 	bic.w	r3, r3, #28672	@ 0x7000
20024a2c:	f023 0318 	bic.w	r3, r3, #24
20024a30:	bf48      	it	mi
20024a32:	f043 0308 	orrmi.w	r3, r3, #8
20024a36:	06a9      	lsls	r1, r5, #26
20024a38:	bf48      	it	mi
20024a3a:	f043 0310 	orrmi.w	r3, r3, #16
20024a3e:	f409 49e0 	and.w	r9, r9, #28672	@ 0x7000
20024a42:	ea49 0303 	orr.w	r3, r9, r3
20024a46:	f842 3024 	str.w	r3, [r2, r4, lsl #2]
20024a4a:	2000      	movs	r0, #0
20024a4c:	e785      	b.n	2002495a <HAL_PIN_Set+0xe>
20024a4e:	f04f 0e00 	mov.w	lr, #0
20024a52:	f04f 0c3f 	mov.w	ip, #63	@ 0x3f
20024a56:	e7bf      	b.n	200249d8 <HAL_PIN_Set+0x8c>
20024a58:	f5a1 73ec 	sub.w	r3, r1, #472	@ 0x1d8
20024a5c:	b29a      	uxth	r2, r3
20024a5e:	2a09      	cmp	r2, #9
20024a60:	d837      	bhi.n	20024ad2 <HAL_PIN_Set+0x186>
20024a62:	2205      	movs	r2, #5
20024a64:	fbb3 f3f2 	udiv	r3, r3, r2
20024a68:	ebc3 3283 	rsb	r2, r3, r3, lsl #14
20024a6c:	ebc3 0282 	rsb	r2, r3, r2, lsl #2
20024a70:	440a      	add	r2, r1
20024a72:	b292      	uxth	r2, r2
20024a74:	f5a2 71ec 	sub.w	r1, r2, #472	@ 0x1d8
20024a78:	b288      	uxth	r0, r1
20024a7a:	2803      	cmp	r0, #3
20024a7c:	d814      	bhi.n	20024aa8 <HAL_PIN_Set+0x15c>
20024a7e:	f04f 0e3f 	mov.w	lr, #63	@ 0x3f
20024a82:	487d      	ldr	r0, [pc, #500]	@ (20024c78 <HAL_PIN_Set+0x32c>)
20024a84:	00c9      	lsls	r1, r1, #3
20024a86:	f850 c023 	ldr.w	ip, [r0, r3, lsl #2]
20024a8a:	f1a4 020e 	sub.w	r2, r4, #14
20024a8e:	408a      	lsls	r2, r1
20024a90:	ea82 020c 	eor.w	r2, r2, ip
20024a94:	fa0e f101 	lsl.w	r1, lr, r1
20024a98:	400a      	ands	r2, r1
20024a9a:	ea82 020c 	eor.w	r2, r2, ip
20024a9e:	f840 2023 	str.w	r2, [r0, r3, lsl #2]
20024aa2:	f204 2155 	addw	r1, r4, #597	@ 0x255
20024aa6:	e7a6      	b.n	200249f6 <HAL_PIN_Set+0xaa>
20024aa8:	f5b2 7fee 	cmp.w	r2, #476	@ 0x1dc
20024aac:	f040 80ca 	bne.w	20024c44 <HAL_PIN_Set+0x2f8>
20024ab0:	213f      	movs	r1, #63	@ 0x3f
20024ab2:	4872      	ldr	r0, [pc, #456]	@ (20024c7c <HAL_PIN_Set+0x330>)
20024ab4:	00da      	lsls	r2, r3, #3
20024ab6:	f8d0 c06c 	ldr.w	ip, [r0, #108]	@ 0x6c
20024aba:	f1a4 030e 	sub.w	r3, r4, #14
20024abe:	4093      	lsls	r3, r2
20024ac0:	ea83 030c 	eor.w	r3, r3, ip
20024ac4:	fa01 f202 	lsl.w	r2, r1, r2
20024ac8:	4013      	ands	r3, r2
20024aca:	ea83 030c 	eor.w	r3, r3, ip
20024ace:	66c3      	str	r3, [r0, #108]	@ 0x6c
20024ad0:	e7e7      	b.n	20024aa2 <HAL_PIN_Set+0x156>
20024ad2:	f46f 7a01 	mvn.w	sl, #516	@ 0x204
20024ad6:	eb01 020a 	add.w	r2, r1, sl
20024ada:	b293      	uxth	r3, r2
20024adc:	2b05      	cmp	r3, #5
20024ade:	d828      	bhi.n	20024b32 <HAL_PIN_Set+0x1e6>
20024ae0:	2303      	movs	r3, #3
20024ae2:	fbb2 f2f3 	udiv	r2, r2, r3
20024ae6:	f46f 7901 	mvn.w	r9, #516	@ 0x204
20024aea:	ebc2 3382 	rsb	r3, r2, r2, lsl #14
20024aee:	eb02 0383 	add.w	r3, r2, r3, lsl #2
20024af2:	440b      	add	r3, r1
20024af4:	b29b      	uxth	r3, r3
20024af6:	eb03 0c09 	add.w	ip, r3, r9
20024afa:	fa1f fc8c 	uxth.w	ip, ip
20024afe:	f1bc 0f02 	cmp.w	ip, #2
20024b02:	f200 809f 	bhi.w	20024c44 <HAL_PIN_Set+0x2f8>
20024b06:	00db      	lsls	r3, r3, #3
20024b08:	f5a3 5381 	sub.w	r3, r3, #4128	@ 0x1020
20024b0c:	495c      	ldr	r1, [pc, #368]	@ (20024c80 <HAL_PIN_Set+0x334>)
20024b0e:	f1a4 0e0e 	sub.w	lr, r4, #14
20024b12:	3b08      	subs	r3, #8
20024b14:	fa0e f303 	lsl.w	r3, lr, r3
20024b18:	f8df e178 	ldr.w	lr, [pc, #376]	@ 20024c94 <HAL_PIN_Set+0x348>
20024b1c:	f851 0022 	ldr.w	r0, [r1, r2, lsl #2]
20024b20:	f85e c02c 	ldr.w	ip, [lr, ip, lsl #2]
20024b24:	4043      	eors	r3, r0
20024b26:	ea03 030c 	and.w	r3, r3, ip
20024b2a:	4043      	eors	r3, r0
20024b2c:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
20024b30:	e7b7      	b.n	20024aa2 <HAL_PIN_Set+0x156>
20024b32:	f46f 7ef8 	mvn.w	lr, #496	@ 0x1f0
20024b36:	eb01 030e 	add.w	r3, r1, lr
20024b3a:	b29a      	uxth	r2, r3
20024b3c:	2a09      	cmp	r2, #9
20024b3e:	d82a      	bhi.n	20024b96 <HAL_PIN_Set+0x24a>
20024b40:	f5b1 7ffc 	cmp.w	r1, #504	@ 0x1f8
20024b44:	d216      	bcs.n	20024b74 <HAL_PIN_Set+0x228>
20024b46:	0859      	lsrs	r1, r3, #1
20024b48:	f013 0f01 	tst.w	r3, #1
20024b4c:	4b4d      	ldr	r3, [pc, #308]	@ (20024c84 <HAL_PIN_Set+0x338>)
20024b4e:	f04f 003f 	mov.w	r0, #63	@ 0x3f
20024b52:	4a4d      	ldr	r2, [pc, #308]	@ (20024c88 <HAL_PIN_Set+0x33c>)
20024b54:	bf18      	it	ne
20024b56:	461a      	movne	r2, r3
20024b58:	00c9      	lsls	r1, r1, #3
20024b5a:	4088      	lsls	r0, r1
20024b5c:	f8d2 c000 	ldr.w	ip, [r2]
20024b60:	f1a4 030e 	sub.w	r3, r4, #14
20024b64:	408b      	lsls	r3, r1
20024b66:	ea83 030c 	eor.w	r3, r3, ip
20024b6a:	4003      	ands	r3, r0
20024b6c:	ea83 030c 	eor.w	r3, r3, ip
20024b70:	6013      	str	r3, [r2, #0]
20024b72:	e796      	b.n	20024aa2 <HAL_PIN_Set+0x156>
20024b74:	d007      	beq.n	20024b86 <HAL_PIN_Set+0x23a>
20024b76:	f240 13f9 	movw	r3, #505	@ 0x1f9
20024b7a:	4299      	cmp	r1, r3
20024b7c:	d107      	bne.n	20024b8e <HAL_PIN_Set+0x242>
20024b7e:	2100      	movs	r1, #0
20024b80:	203f      	movs	r0, #63	@ 0x3f
20024b82:	4a42      	ldr	r2, [pc, #264]	@ (20024c8c <HAL_PIN_Set+0x340>)
20024b84:	e7ea      	b.n	20024b5c <HAL_PIN_Set+0x210>
20024b86:	2110      	movs	r1, #16
20024b88:	f44f 107c 	mov.w	r0, #4128768	@ 0x3f0000
20024b8c:	e7f9      	b.n	20024b82 <HAL_PIN_Set+0x236>
20024b8e:	2108      	movs	r1, #8
20024b90:	f44f 507c 	mov.w	r0, #16128	@ 0x3f00
20024b94:	e7f5      	b.n	20024b82 <HAL_PIN_Set+0x236>
20024b96:	f46f 7c58 	mvn.w	ip, #864	@ 0x360
20024b9a:	eb01 030c 	add.w	r3, r1, ip
20024b9e:	b29b      	uxth	r3, r3
20024ba0:	2b05      	cmp	r3, #5
20024ba2:	f63f af29 	bhi.w	200249f8 <HAL_PIN_Set+0xac>
20024ba6:	2803      	cmp	r0, #3
20024ba8:	d84c      	bhi.n	20024c44 <HAL_PIN_Set+0x2f8>
20024baa:	f104 4380 	add.w	r3, r4, #1073741824	@ 0x40000000
20024bae:	f2a1 3262 	subw	r2, r1, #866	@ 0x362
20024bb2:	f8df c0dc 	ldr.w	ip, [pc, #220]	@ 20024c90 <HAL_PIN_Set+0x344>
20024bb6:	3b26      	subs	r3, #38	@ 0x26
20024bb8:	2a04      	cmp	r2, #4
20024bba:	d815      	bhi.n	20024be8 <HAL_PIN_Set+0x29c>
20024bbc:	e8df f002 	tbb	[pc, r2]
20024bc0:	31032a38 	.word	0x31032a38
20024bc4:	23          	.byte	0x23
20024bc5:	00          	.byte	0x00
20024bc6:	f44f 5240 	mov.w	r2, #12288	@ 0x3000
20024bca:	f04f 4ae0 	mov.w	sl, #1879048192	@ 0x70000000
20024bce:	f04f 5e00 	mov.w	lr, #536870912	@ 0x20000000
20024bd2:	f8df 90c4 	ldr.w	r9, [pc, #196]	@ 20024c98 <HAL_PIN_Set+0x34c>
20024bd6:	f8d9 0004 	ldr.w	r0, [r9, #4]
20024bda:	ea20 000a 	bic.w	r0, r0, sl
20024bde:	ea40 000e 	orr.w	r0, r0, lr
20024be2:	f8c9 0004 	str.w	r0, [r9, #4]
20024be6:	e000      	b.n	20024bea <HAL_PIN_Set+0x29e>
20024be8:	2200      	movs	r2, #0
20024bea:	f85c 0023 	ldr.w	r0, [ip, r3, lsl #2]
20024bee:	f420 40e0 	bic.w	r0, r0, #28672	@ 0x7000
20024bf2:	4302      	orrs	r2, r0
20024bf4:	f84c 2023 	str.w	r2, [ip, r3, lsl #2]
20024bf8:	f85c 2023 	ldr.w	r2, [ip, r3, lsl #2]
20024bfc:	f042 0202 	orr.w	r2, r2, #2
20024c00:	f84c 2023 	str.w	r2, [ip, r3, lsl #2]
20024c04:	e6f8      	b.n	200249f8 <HAL_PIN_Set+0xac>
20024c06:	f44f 5240 	mov.w	r2, #12288	@ 0x3000
20024c0a:	f04f 4ae0 	mov.w	sl, #1879048192	@ 0x70000000
20024c0e:	f04f 5e40 	mov.w	lr, #805306368	@ 0x30000000
20024c12:	e7de      	b.n	20024bd2 <HAL_PIN_Set+0x286>
20024c14:	f44f 5200 	mov.w	r2, #8192	@ 0x2000
20024c18:	f04f 6a60 	mov.w	sl, #234881024	@ 0xe000000
20024c1c:	f04f 6e80 	mov.w	lr, #67108864	@ 0x4000000
20024c20:	e7d7      	b.n	20024bd2 <HAL_PIN_Set+0x286>
20024c22:	f44f 5200 	mov.w	r2, #8192	@ 0x2000
20024c26:	f04f 6a60 	mov.w	sl, #234881024	@ 0xe000000
20024c2a:	f04f 6ec0 	mov.w	lr, #100663296	@ 0x6000000
20024c2e:	e7d0      	b.n	20024bd2 <HAL_PIN_Set+0x286>
20024c30:	f44f 5280 	mov.w	r2, #4096	@ 0x1000
20024c34:	e7d9      	b.n	20024bea <HAL_PIN_Set+0x29e>
20024c36:	f5a1 7396 	sub.w	r3, r1, #300	@ 0x12c
20024c3a:	b29b      	uxth	r3, r3
20024c3c:	2b07      	cmp	r3, #7
20024c3e:	f63f aedb 	bhi.w	200249f8 <HAL_PIN_Set+0xac>
20024c42:	e6ae      	b.n	200249a2 <HAL_PIN_Set+0x56>
20024c44:	2100      	movs	r1, #0
20024c46:	e6d7      	b.n	200249f8 <HAL_PIN_Set+0xac>
20024c48:	f106 4680 	add.w	r6, r6, #1073741824	@ 0x40000000
20024c4c:	3e01      	subs	r6, #1
20024c4e:	f858 3026 	ldr.w	r3, [r8, r6, lsl #2]
20024c52:	f005 0530 	and.w	r5, r5, #48	@ 0x30
20024c56:	f009 090f 	and.w	r9, r9, #15
20024c5a:	ea45 0509 	orr.w	r5, r5, r9
20024c5e:	f023 033f 	bic.w	r3, r3, #63	@ 0x3f
20024c62:	431d      	orrs	r5, r3
20024c64:	f045 0540 	orr.w	r5, r5, #64	@ 0x40
20024c68:	f848 5026 	str.w	r5, [r8, r6, lsl #2]
20024c6c:	e6ed      	b.n	20024a4a <HAL_PIN_Set+0xfe>
20024c6e:	bf00      	nop
20024c70:	5000b048 	.word	0x5000b048
20024c74:	500caf58 	.word	0x500caf58
20024c78:	5000b064 	.word	0x5000b064
20024c7c:	5000b000 	.word	0x5000b000
20024c80:	5000b070 	.word	0x5000b070
20024c84:	5000b07c 	.word	0x5000b07c
20024c88:	5000b078 	.word	0x5000b078
20024c8c:	5000b080 	.word	0x5000b080
20024c90:	500cb05c 	.word	0x500cb05c
20024c94:	2002b048 	.word	0x2002b048
20024c98:	500c0000 	.word	0x500c0000

20024c9c <HAL_PIN_Set_Analog>:
20024c9c:	283a      	cmp	r0, #58	@ 0x3a
20024c9e:	b538      	push	{r3, r4, r5, lr}
20024ca0:	4604      	mov	r4, r0
20024ca2:	dd25      	ble.n	20024cf0 <HAL_PIN_Set_Analog+0x54>
20024ca4:	2840      	cmp	r0, #64	@ 0x40
20024ca6:	dc16      	bgt.n	20024cd6 <HAL_PIN_Set_Analog+0x3a>
20024ca8:	2500      	movs	r5, #0
20024caa:	f1a0 013c 	sub.w	r1, r0, #60	@ 0x3c
20024cae:	4628      	mov	r0, r5
20024cb0:	f7ff fe20 	bl	200248f4 <HAL_PIN_Get_Base>
20024cb4:	f101 4380 	add.w	r3, r1, #1073741824	@ 0x40000000
20024cb8:	3b01      	subs	r3, #1
20024cba:	f850 1023 	ldr.w	r1, [r0, r3, lsl #2]
20024cbe:	462a      	mov	r2, r5
20024cc0:	f021 015f 	bic.w	r1, r1, #95	@ 0x5f
20024cc4:	f041 010f 	orr.w	r1, r1, #15
20024cc8:	f840 1023 	str.w	r1, [r0, r3, lsl #2]
20024ccc:	2100      	movs	r1, #0
20024cce:	4620      	mov	r0, r4
20024cd0:	f7ff fdd6 	bl	20024880 <HAL_PIN_SetAonPE>
20024cd4:	e00a      	b.n	20024cec <HAL_PIN_Set_Analog+0x50>
20024cd6:	4a08      	ldr	r2, [pc, #32]	@ (20024cf8 <HAL_PIN_Set_Analog+0x5c>)
20024cd8:	f852 3020 	ldr.w	r3, [r2, r0, lsl #2]
20024cdc:	f423 43e0 	bic.w	r3, r3, #28672	@ 0x7000
20024ce0:	f023 030e 	bic.w	r3, r3, #14
20024ce4:	f443 43e0 	orr.w	r3, r3, #28672	@ 0x7000
20024ce8:	f842 3020 	str.w	r3, [r2, r0, lsl #2]
20024cec:	2000      	movs	r0, #0
20024cee:	bd38      	pop	{r3, r4, r5, pc}
20024cf0:	4601      	mov	r1, r0
20024cf2:	2501      	movs	r5, #1
20024cf4:	e7db      	b.n	20024cae <HAL_PIN_Set_Analog+0x12>
20024cf6:	bf00      	nop
20024cf8:	500caf58 	.word	0x500caf58

20024cfc <HAL_PMU_EnableDLL>:
20024cfc:	4b05      	ldr	r3, [pc, #20]	@ (20024d14 <HAL_PMU_EnableDLL+0x18>)
20024cfe:	6e9a      	ldr	r2, [r3, #104]	@ 0x68
20024d00:	b120      	cbz	r0, 20024d0c <HAL_PMU_EnableDLL+0x10>
20024d02:	f042 0220 	orr.w	r2, r2, #32
20024d06:	2000      	movs	r0, #0
20024d08:	669a      	str	r2, [r3, #104]	@ 0x68
20024d0a:	4770      	bx	lr
20024d0c:	f022 0220 	bic.w	r2, r2, #32
20024d10:	e7f9      	b.n	20024d06 <HAL_PMU_EnableDLL+0xa>
20024d12:	bf00      	nop
20024d14:	500ca000 	.word	0x500ca000

20024d18 <HAL_RCC_HCPU_ConfigSxModeVolt>:
20024d18:	b507      	push	{r0, r1, r2, lr}
20024d1a:	4a13      	ldr	r2, [pc, #76]	@ (20024d68 <HAL_RCC_HCPU_ConfigSxModeVolt+0x50>)
20024d1c:	4913      	ldr	r1, [pc, #76]	@ (20024d6c <HAL_RCC_HCPU_ConfigSxModeVolt+0x54>)
20024d1e:	eb02 02c0 	add.w	r2, r2, r0, lsl #3
20024d22:	f8d1 309c 	ldr.w	r3, [r1, #156]	@ 0x9c
20024d26:	7892      	ldrb	r2, [r2, #2]
20024d28:	2802      	cmp	r0, #2
20024d2a:	f362 0303 	bfi	r3, r2, #0, #4
20024d2e:	f8c1 309c 	str.w	r3, [r1, #156]	@ 0x9c
20024d32:	f10d 0007 	add.w	r0, sp, #7
20024d36:	d111      	bne.n	20024d5c <HAL_RCC_HCPU_ConfigSxModeVolt+0x44>
20024d38:	f007 fb2c 	bl	2002c394 <HAL_PMU_GetHpsysVoutRef>
20024d3c:	b110      	cbz	r0, 20024d44 <HAL_RCC_HCPU_ConfigSxModeVolt+0x2c>
20024d3e:	230b      	movs	r3, #11
20024d40:	f88d 3007 	strb.w	r3, [sp, #7]
20024d44:	4a09      	ldr	r2, [pc, #36]	@ (20024d6c <HAL_RCC_HCPU_ConfigSxModeVolt+0x54>)
20024d46:	f89d 1007 	ldrb.w	r1, [sp, #7]
20024d4a:	f8d2 3094 	ldr.w	r3, [r2, #148]	@ 0x94
20024d4e:	f361 0303 	bfi	r3, r1, #0, #4
20024d52:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
20024d56:	b003      	add	sp, #12
20024d58:	f85d fb04 	ldr.w	pc, [sp], #4
20024d5c:	f007 fb26 	bl	2002c3ac <HAL_PMU_GetHpsysVoutRef2>
20024d60:	2800      	cmp	r0, #0
20024d62:	d0ef      	beq.n	20024d44 <HAL_RCC_HCPU_ConfigSxModeVolt+0x2c>
20024d64:	230d      	movs	r3, #13
20024d66:	e7eb      	b.n	20024d40 <HAL_RCC_HCPU_ConfigSxModeVolt+0x28>
20024d68:	2002b064 	.word	0x2002b064
20024d6c:	500ca000 	.word	0x500ca000

20024d70 <HAL_RCC_HCPU_GetClockSrc>:
20024d70:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024d74:	280d      	cmp	r0, #13
20024d76:	6a1a      	ldr	r2, [r3, #32]
20024d78:	d80d      	bhi.n	20024d96 <HAL_RCC_HCPU_GetClockSrc+0x26>
20024d7a:	f642 73f1 	movw	r3, #12273	@ 0x2ff1
20024d7e:	40c3      	lsrs	r3, r0
20024d80:	f013 0f01 	tst.w	r3, #1
20024d84:	bf0c      	ite	eq
20024d86:	2301      	moveq	r3, #1
20024d88:	2303      	movne	r3, #3
20024d8a:	4083      	lsls	r3, r0
20024d8c:	4013      	ands	r3, r2
20024d8e:	fa23 f000 	lsr.w	r0, r3, r0
20024d92:	b2c0      	uxtb	r0, r0
20024d94:	4770      	bx	lr
20024d96:	2301      	movs	r3, #1
20024d98:	e7f7      	b.n	20024d8a <HAL_RCC_HCPU_GetClockSrc+0x1a>
	...

20024d9c <HAL_RCC_HCPU_GetDLLFreq>:
20024d9c:	2801      	cmp	r0, #1
20024d9e:	d003      	beq.n	20024da8 <HAL_RCC_HCPU_GetDLLFreq+0xc>
20024da0:	2802      	cmp	r0, #2
20024da2:	d00e      	beq.n	20024dc2 <HAL_RCC_HCPU_GetDLLFreq+0x26>
20024da4:	2000      	movs	r0, #0
20024da6:	4770      	bx	lr
20024da8:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024dac:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
20024dae:	b163      	cbz	r3, 20024dca <HAL_RCC_HCPU_GetDLLFreq+0x2e>
20024db0:	f013 0001 	ands.w	r0, r3, #1
20024db4:	d00a      	beq.n	20024dcc <HAL_RCC_HCPU_GetDLLFreq+0x30>
20024db6:	4806      	ldr	r0, [pc, #24]	@ (20024dd0 <HAL_RCC_HCPU_GetDLLFreq+0x34>)
20024db8:	f3c3 0383 	ubfx	r3, r3, #2, #4
20024dbc:	fb03 0000 	mla	r0, r3, r0, r0
20024dc0:	4770      	bx	lr
20024dc2:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024dc6:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
20024dc8:	e7f1      	b.n	20024dae <HAL_RCC_HCPU_GetDLLFreq+0x12>
20024dca:	4618      	mov	r0, r3
20024dcc:	4770      	bx	lr
20024dce:	bf00      	nop
20024dd0:	016e3600 	.word	0x016e3600

20024dd4 <HAL_RCC_HCPU_GetDLL1Freq>:
20024dd4:	2001      	movs	r0, #1
20024dd6:	f7ff bfe1 	b.w	20024d9c <HAL_RCC_HCPU_GetDLLFreq>

20024dda <HAL_RCC_HCPU_GetDLL2Freq>:
20024dda:	2002      	movs	r0, #2
20024ddc:	f7ff bfde 	b.w	20024d9c <HAL_RCC_HCPU_GetDLLFreq>

20024de0 <HAL_RCC_HCPU_GetDLL3Freq>:
20024de0:	2000      	movs	r0, #0
20024de2:	4770      	bx	lr

20024de4 <HAL_RCC_HCPU_EnableDLL>:
20024de4:	4b23      	ldr	r3, [pc, #140]	@ (20024e74 <HAL_RCC_HCPU_EnableDLL+0x90>)
20024de6:	f1a1 71b7 	sub.w	r1, r1, #23986176	@ 0x16e0000
20024dea:	f5a1 5158 	sub.w	r1, r1, #13824	@ 0x3600
20024dee:	4299      	cmp	r1, r3
20024df0:	b510      	push	{r4, lr}
20024df2:	d83c      	bhi.n	20024e6e <HAL_RCC_HCPU_EnableDLL+0x8a>
20024df4:	2801      	cmp	r0, #1
20024df6:	d002      	beq.n	20024dfe <HAL_RCC_HCPU_EnableDLL+0x1a>
20024df8:	2802      	cmp	r0, #2
20024dfa:	d036      	beq.n	20024e6a <HAL_RCC_HCPU_EnableDLL+0x86>
20024dfc:	e7fe      	b.n	20024dfc <HAL_RCC_HCPU_EnableDLL+0x18>
20024dfe:	4c1e      	ldr	r4, [pc, #120]	@ (20024e78 <HAL_RCC_HCPU_EnableDLL+0x94>)
20024e00:	4b1e      	ldr	r3, [pc, #120]	@ (20024e7c <HAL_RCC_HCPU_EnableDLL+0x98>)
20024e02:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20024e06:	0790      	lsls	r0, r2, #30
20024e08:	bf58      	it	pl
20024e0a:	f8d3 2094 	ldrpl.w	r2, [r3, #148]	@ 0x94
20024e0e:	f04f 0000 	mov.w	r0, #0
20024e12:	bf5c      	itt	pl
20024e14:	f042 0202 	orrpl.w	r2, r2, #2
20024e18:	f8c3 2094 	strpl.w	r2, [r3, #148]	@ 0x94
20024e1c:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20024e20:	07d2      	lsls	r2, r2, #31
20024e22:	bf5e      	ittt	pl
20024e24:	f8d3 2094 	ldrpl.w	r2, [r3, #148]	@ 0x94
20024e28:	f042 0201 	orrpl.w	r2, r2, #1
20024e2c:	f8c3 2094 	strpl.w	r2, [r3, #148]	@ 0x94
20024e30:	4a13      	ldr	r2, [pc, #76]	@ (20024e80 <HAL_RCC_HCPU_EnableDLL+0x9c>)
20024e32:	6823      	ldr	r3, [r4, #0]
20024e34:	fbb1 f1f2 	udiv	r1, r1, r2
20024e38:	f023 0301 	bic.w	r3, r3, #1
20024e3c:	6023      	str	r3, [r4, #0]
20024e3e:	6823      	ldr	r3, [r4, #0]
20024e40:	f423 5300 	bic.w	r3, r3, #8192	@ 0x2000
20024e44:	f023 033c 	bic.w	r3, r3, #60	@ 0x3c
20024e48:	ea43 0381 	orr.w	r3, r3, r1, lsl #2
20024e4c:	f443 5380 	orr.w	r3, r3, #4096	@ 0x1000
20024e50:	f043 0301 	orr.w	r3, r3, #1
20024e54:	6023      	str	r3, [r4, #0]
20024e56:	f7fd f86a 	bl	20021f2e <HAL_Delay_us>
20024e5a:	200a      	movs	r0, #10
20024e5c:	f7fd f867 	bl	20021f2e <HAL_Delay_us>
20024e60:	6823      	ldr	r3, [r4, #0]
20024e62:	2b00      	cmp	r3, #0
20024e64:	dafc      	bge.n	20024e60 <HAL_RCC_HCPU_EnableDLL+0x7c>
20024e66:	2000      	movs	r0, #0
20024e68:	bd10      	pop	{r4, pc}
20024e6a:	4c06      	ldr	r4, [pc, #24]	@ (20024e84 <HAL_RCC_HCPU_EnableDLL+0xa0>)
20024e6c:	e7c8      	b.n	20024e00 <HAL_RCC_HCPU_EnableDLL+0x1c>
20024e6e:	2001      	movs	r0, #1
20024e70:	e7fa      	b.n	20024e68 <HAL_RCC_HCPU_EnableDLL+0x84>
20024e72:	bf00      	nop
20024e74:	15752a00 	.word	0x15752a00
20024e78:	5000002c 	.word	0x5000002c
20024e7c:	5000b000 	.word	0x5000b000
20024e80:	016e3600 	.word	0x016e3600
20024e84:	50000030 	.word	0x50000030

20024e88 <HAL_RCC_HCPU_EnableDLL1>:
20024e88:	4601      	mov	r1, r0
20024e8a:	2001      	movs	r0, #1
20024e8c:	f7ff bfaa 	b.w	20024de4 <HAL_RCC_HCPU_EnableDLL>

20024e90 <HAL_RCC_HCPU_EnableDLL2>:
20024e90:	4601      	mov	r1, r0
20024e92:	2002      	movs	r0, #2
20024e94:	f7ff bfa6 	b.w	20024de4 <HAL_RCC_HCPU_EnableDLL>

20024e98 <HAL_RCC_HCPU_DisableDLL1>:
20024e98:	f04f 42a0 	mov.w	r2, #1342177280	@ 0x50000000
20024e9c:	6ad3      	ldr	r3, [r2, #44]	@ 0x2c
20024e9e:	2000      	movs	r0, #0
20024ea0:	f023 0301 	bic.w	r3, r3, #1
20024ea4:	62d3      	str	r3, [r2, #44]	@ 0x2c
20024ea6:	4770      	bx	lr

20024ea8 <HAL_RCC_GetSysCLKFreq>:
20024ea8:	2801      	cmp	r0, #1
20024eaa:	d108      	bne.n	20024ebe <HAL_RCC_GetSysCLKFreq+0x16>
20024eac:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024eb0:	6a1b      	ldr	r3, [r3, #32]
20024eb2:	f003 0303 	and.w	r3, r3, #3
20024eb6:	2b03      	cmp	r3, #3
20024eb8:	d101      	bne.n	20024ebe <HAL_RCC_GetSysCLKFreq+0x16>
20024eba:	f7ff bf8b 	b.w	20024dd4 <HAL_RCC_HCPU_GetDLL1Freq>
20024ebe:	4801      	ldr	r0, [pc, #4]	@ (20024ec4 <HAL_RCC_GetSysCLKFreq+0x1c>)
20024ec0:	4770      	bx	lr
20024ec2:	bf00      	nop
20024ec4:	02dc6c00 	.word	0x02dc6c00

20024ec8 <HAL_RCC_GetHCLKFreq>:
20024ec8:	1e02      	subs	r2, r0, #0
20024eca:	bf08      	it	eq
20024ecc:	2201      	moveq	r2, #1
20024ece:	b508      	push	{r3, lr}
20024ed0:	4610      	mov	r0, r2
20024ed2:	f7ff ffe9 	bl	20024ea8 <HAL_RCC_GetSysCLKFreq>
20024ed6:	2a01      	cmp	r2, #1
20024ed8:	d002      	beq.n	20024ee0 <HAL_RCC_GetHCLKFreq+0x18>
20024eda:	2a02      	cmp	r2, #2
20024edc:	d00a      	beq.n	20024ef4 <HAL_RCC_GetHCLKFreq+0x2c>
20024ede:	e7fe      	b.n	20024ede <HAL_RCC_GetHCLKFreq+0x16>
20024ee0:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024ee4:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
20024ee6:	b2db      	uxtb	r3, r3
20024ee8:	2b01      	cmp	r3, #1
20024eea:	bfb8      	it	lt
20024eec:	2301      	movlt	r3, #1
20024eee:	fbb0 f0f3 	udiv	r0, r0, r3
20024ef2:	bd08      	pop	{r3, pc}
20024ef4:	f04f 4380 	mov.w	r3, #1073741824	@ 0x40000000
20024ef8:	695b      	ldr	r3, [r3, #20]
20024efa:	f003 033f 	and.w	r3, r3, #63	@ 0x3f
20024efe:	e7f3      	b.n	20024ee8 <HAL_RCC_GetHCLKFreq+0x20>

20024f00 <HAL_RCC_HCPU_ClockSelect>:
20024f00:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024f04:	b510      	push	{r4, lr}
20024f06:	280d      	cmp	r0, #13
20024f08:	6a1b      	ldr	r3, [r3, #32]
20024f0a:	d818      	bhi.n	20024f3e <HAL_RCC_HCPU_ClockSelect+0x3e>
20024f0c:	f642 72f1 	movw	r2, #12273	@ 0x2ff1
20024f10:	40c2      	lsrs	r2, r0
20024f12:	f012 0f01 	tst.w	r2, #1
20024f16:	bf0c      	ite	eq
20024f18:	2201      	moveq	r2, #1
20024f1a:	2203      	movne	r2, #3
20024f1c:	fa02 f400 	lsl.w	r4, r2, r0
20024f20:	4011      	ands	r1, r2
20024f22:	f04f 42a0 	mov.w	r2, #1342177280	@ 0x50000000
20024f26:	ea23 0304 	bic.w	r3, r3, r4
20024f2a:	4081      	lsls	r1, r0
20024f2c:	430b      	orrs	r3, r1
20024f2e:	6213      	str	r3, [r2, #32]
20024f30:	b920      	cbnz	r0, 20024f3c <HAL_RCC_HCPU_ClockSelect+0x3c>
20024f32:	2001      	movs	r0, #1
20024f34:	f7ff ffc8 	bl	20024ec8 <HAL_RCC_GetHCLKFreq>
20024f38:	4b02      	ldr	r3, [pc, #8]	@ (20024f44 <HAL_RCC_HCPU_ClockSelect+0x44>)
20024f3a:	6018      	str	r0, [r3, #0]
20024f3c:	bd10      	pop	{r4, pc}
20024f3e:	2201      	movs	r2, #1
20024f40:	e7ec      	b.n	20024f1c <HAL_RCC_HCPU_ClockSelect+0x1c>
20024f42:	bf00      	nop
20024f44:	20044954 	.word	0x20044954

20024f48 <HAL_RCC_HCPU_SetDiv>:
20024f48:	2800      	cmp	r0, #0
20024f4a:	bfd8      	it	le
20024f4c:	2000      	movle	r0, #0
20024f4e:	b508      	push	{r3, lr}
20024f50:	bfcc      	ite	gt
20024f52:	23ff      	movgt	r3, #255	@ 0xff
20024f54:	4603      	movle	r3, r0
20024f56:	2900      	cmp	r1, #0
20024f58:	db12      	blt.n	20024f80 <HAL_RCC_HCPU_SetDiv+0x38>
20024f5a:	2a00      	cmp	r2, #0
20024f5c:	f443 63e0 	orr.w	r3, r3, #1792	@ 0x700
20024f60:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
20024f64:	da0e      	bge.n	20024f84 <HAL_RCC_HCPU_SetDiv+0x3c>
20024f66:	f04f 41a0 	mov.w	r1, #1342177280	@ 0x50000000
20024f6a:	6a4a      	ldr	r2, [r1, #36]	@ 0x24
20024f6c:	ea22 0303 	bic.w	r3, r2, r3
20024f70:	4303      	orrs	r3, r0
20024f72:	624b      	str	r3, [r1, #36]	@ 0x24
20024f74:	2001      	movs	r0, #1
20024f76:	f7ff ffa7 	bl	20024ec8 <HAL_RCC_GetHCLKFreq>
20024f7a:	4b07      	ldr	r3, [pc, #28]	@ (20024f98 <HAL_RCC_HCPU_SetDiv+0x50>)
20024f7c:	6018      	str	r0, [r3, #0]
20024f7e:	bd08      	pop	{r3, pc}
20024f80:	2a00      	cmp	r2, #0
20024f82:	db04      	blt.n	20024f8e <HAL_RCC_HCPU_SetDiv+0x46>
20024f84:	f443 43e0 	orr.w	r3, r3, #28672	@ 0x7000
20024f88:	ea40 3002 	orr.w	r0, r0, r2, lsl #12
20024f8c:	e7eb      	b.n	20024f66 <HAL_RCC_HCPU_SetDiv+0x1e>
20024f8e:	2b00      	cmp	r3, #0
20024f90:	d0f0      	beq.n	20024f74 <HAL_RCC_HCPU_SetDiv+0x2c>
20024f92:	23ff      	movs	r3, #255	@ 0xff
20024f94:	e7e7      	b.n	20024f66 <HAL_RCC_HCPU_SetDiv+0x1e>
20024f96:	bf00      	nop
20024f98:	20044954 	.word	0x20044954

20024f9c <HAL_RCC_HCPU_SwitchDvfsD2S>:
20024f9c:	b570      	push	{r4, r5, r6, lr}
20024f9e:	460c      	mov	r4, r1
20024fa0:	4d19      	ldr	r5, [pc, #100]	@ (20025008 <HAL_RCC_HCPU_SwitchDvfsD2S+0x6c>)
20024fa2:	4606      	mov	r6, r0
20024fa4:	f7ff feb8 	bl	20024d18 <HAL_RCC_HCPU_ConfigSxModeVolt>
20024fa8:	692b      	ldr	r3, [r5, #16]
20024faa:	20fa      	movs	r0, #250	@ 0xfa
20024fac:	f023 0304 	bic.w	r3, r3, #4
20024fb0:	612b      	str	r3, [r5, #16]
20024fb2:	f7fc ffbc 	bl	20021f2e <HAL_Delay_us>
20024fb6:	2c30      	cmp	r4, #48	@ 0x30
20024fb8:	d80d      	bhi.n	20024fd6 <HAL_RCC_HCPU_SwitchDvfsD2S+0x3a>
20024fba:	2100      	movs	r1, #0
20024fbc:	4608      	mov	r0, r1
20024fbe:	f7ff ff9f 	bl	20024f00 <HAL_RCC_HCPU_ClockSelect>
20024fc2:	2030      	movs	r0, #48	@ 0x30
20024fc4:	2204      	movs	r2, #4
20024fc6:	2100      	movs	r1, #0
20024fc8:	fbb0 f0f4 	udiv	r0, r0, r4
20024fcc:	f7ff ffbc 	bl	20024f48 <HAL_RCC_HCPU_SetDiv>
20024fd0:	2400      	movs	r4, #0
20024fd2:	4620      	mov	r0, r4
20024fd4:	bd70      	pop	{r4, r5, r6, pc}
20024fd6:	f7fd fce5 	bl	200229a4 <HAL_HPAON_EnableXT48>
20024fda:	480c      	ldr	r0, [pc, #48]	@ (2002500c <HAL_RCC_HCPU_SwitchDvfsD2S+0x70>)
20024fdc:	eb00 00c6 	add.w	r0, r0, r6, lsl #3
20024fe0:	6843      	ldr	r3, [r0, #4]
20024fe2:	480b      	ldr	r0, [pc, #44]	@ (20025010 <HAL_RCC_HCPU_SwitchDvfsD2S+0x74>)
20024fe4:	61eb      	str	r3, [r5, #28]
20024fe6:	4360      	muls	r0, r4
20024fe8:	f7ff ff4e 	bl	20024e88 <HAL_RCC_HCPU_EnableDLL1>
20024fec:	4604      	mov	r4, r0
20024fee:	2800      	cmp	r0, #0
20024ff0:	d1ef      	bne.n	20024fd2 <HAL_RCC_HCPU_SwitchDvfsD2S+0x36>
20024ff2:	2101      	movs	r1, #1
20024ff4:	2206      	movs	r2, #6
20024ff6:	4608      	mov	r0, r1
20024ff8:	f7ff ffa6 	bl	20024f48 <HAL_RCC_HCPU_SetDiv>
20024ffc:	2103      	movs	r1, #3
20024ffe:	4620      	mov	r0, r4
20025000:	f7ff ff7e 	bl	20024f00 <HAL_RCC_HCPU_ClockSelect>
20025004:	e7e4      	b.n	20024fd0 <HAL_RCC_HCPU_SwitchDvfsD2S+0x34>
20025006:	bf00      	nop
20025008:	5000b000 	.word	0x5000b000
2002500c:	2002b064 	.word	0x2002b064
20025010:	000f4240 	.word	0x000f4240

20025014 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0>:
20025014:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
20025018:	4c1d      	ldr	r4, [pc, #116]	@ (20025090 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x7c>)
2002501a:	4f1e      	ldr	r7, [pc, #120]	@ (20025094 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x80>)
2002501c:	eb04 02c0 	add.w	r2, r4, r0, lsl #3
20025020:	6b3b      	ldr	r3, [r7, #48]	@ 0x30
20025022:	7892      	ldrb	r2, [r2, #2]
20025024:	4605      	mov	r5, r0
20025026:	f362 5317 	bfi	r3, r2, #20, #4
2002502a:	ea4f 08c0 	mov.w	r8, r0, lsl #3
2002502e:	633b      	str	r3, [r7, #48]	@ 0x30
20025030:	f10d 0007 	add.w	r0, sp, #7
20025034:	460e      	mov	r6, r1
20025036:	f007 f9ad 	bl	2002c394 <HAL_PMU_GetHpsysVoutRef>
2002503a:	b110      	cbz	r0, 20025042 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x2e>
2002503c:	230b      	movs	r3, #11
2002503e:	f88d 3007 	strb.w	r3, [sp, #7]
20025042:	f89d 1007 	ldrb.w	r1, [sp, #7]
20025046:	f914 2035 	ldrsb.w	r2, [r4, r5, lsl #3]
2002504a:	6cfb      	ldr	r3, [r7, #76]	@ 0x4c
2002504c:	440a      	add	r2, r1
2002504e:	2100      	movs	r1, #0
20025050:	f362 0385 	bfi	r3, r2, #2, #4
20025054:	4608      	mov	r0, r1
20025056:	64fb      	str	r3, [r7, #76]	@ 0x4c
20025058:	f7ff ff52 	bl	20024f00 <HAL_RCC_HCPU_ClockSelect>
2002505c:	2e30      	cmp	r6, #48	@ 0x30
2002505e:	d900      	bls.n	20025062 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x4e>
20025060:	e7fe      	b.n	20025060 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x4c>
20025062:	2030      	movs	r0, #48	@ 0x30
20025064:	2204      	movs	r2, #4
20025066:	2100      	movs	r1, #0
20025068:	fbb0 f0f6 	udiv	r0, r0, r6
2002506c:	f7ff ff6c 	bl	20024f48 <HAL_RCC_HCPU_SetDiv>
20025070:	f7ff ff12 	bl	20024e98 <HAL_RCC_HCPU_DisableDLL1>
20025074:	f7fd fca2 	bl	200229bc <HAL_HPAON_DisableXT48>
20025078:	4444      	add	r4, r8
2002507a:	4b07      	ldr	r3, [pc, #28]	@ (20025098 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x84>)
2002507c:	6862      	ldr	r2, [r4, #4]
2002507e:	61da      	str	r2, [r3, #28]
20025080:	691a      	ldr	r2, [r3, #16]
20025082:	f042 0204 	orr.w	r2, r2, #4
20025086:	611a      	str	r2, [r3, #16]
20025088:	b002      	add	sp, #8
2002508a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
2002508e:	bf00      	nop
20025090:	2002b064 	.word	0x2002b064
20025094:	500ca000 	.word	0x500ca000
20025098:	5000b000 	.word	0x5000b000

2002509c <HAL_RCC_HCPU_ConfigDvfs>:
2002509c:	b570      	push	{r4, r5, r6, lr}
2002509e:	4e31      	ldr	r6, [pc, #196]	@ (20025164 <HAL_RCC_HCPU_ConfigDvfs+0xc8>)
200250a0:	4605      	mov	r5, r0
200250a2:	7833      	ldrb	r3, [r6, #0]
200250a4:	460c      	mov	r4, r1
200250a6:	2b01      	cmp	r3, #1
200250a8:	d943      	bls.n	20025132 <HAL_RCC_HCPU_ConfigDvfs+0x96>
200250aa:	3b02      	subs	r3, #2
200250ac:	2b01      	cmp	r3, #1
200250ae:	d902      	bls.n	200250b6 <HAL_RCC_HCPU_ConfigDvfs+0x1a>
200250b0:	2501      	movs	r5, #1
200250b2:	4628      	mov	r0, r5
200250b4:	bd70      	pop	{r4, r5, r6, pc}
200250b6:	4b2c      	ldr	r3, [pc, #176]	@ (20025168 <HAL_RCC_HCPU_ConfigDvfs+0xcc>)
200250b8:	f853 2021 	ldr.w	r2, [r3, r1, lsl #2]
200250bc:	f7ff fe8d 	bl	20024dda <HAL_RCC_HCPU_GetDLL2Freq>
200250c0:	4290      	cmp	r0, r2
200250c2:	d8f5      	bhi.n	200250b0 <HAL_RCC_HCPU_ConfigDvfs+0x14>
200250c4:	2901      	cmp	r1, #1
200250c6:	d805      	bhi.n	200250d4 <HAL_RCC_HCPU_ConfigDvfs+0x38>
200250c8:	4629      	mov	r1, r5
200250ca:	4620      	mov	r0, r4
200250cc:	f7ff ffa2 	bl	20025014 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0>
200250d0:	2500      	movs	r5, #0
200250d2:	e035      	b.n	20025140 <HAL_RCC_HCPU_ConfigDvfs+0xa4>
200250d4:	2100      	movs	r1, #0
200250d6:	4608      	mov	r0, r1
200250d8:	f7ff ff12 	bl	20024f00 <HAL_RCC_HCPU_ClockSelect>
200250dc:	4620      	mov	r0, r4
200250de:	f7ff fe1b 	bl	20024d18 <HAL_RCC_HCPU_ConfigSxModeVolt>
200250e2:	20fa      	movs	r0, #250	@ 0xfa
200250e4:	f7fc ff23 	bl	20021f2e <HAL_Delay_us>
200250e8:	f7ff fed6 	bl	20024e98 <HAL_RCC_HCPU_DisableDLL1>
200250ec:	2d30      	cmp	r5, #48	@ 0x30
200250ee:	d80d      	bhi.n	2002510c <HAL_RCC_HCPU_ConfigDvfs+0x70>
200250f0:	f7fd fc64 	bl	200229bc <HAL_HPAON_DisableXT48>
200250f4:	2100      	movs	r1, #0
200250f6:	4608      	mov	r0, r1
200250f8:	f7ff ff02 	bl	20024f00 <HAL_RCC_HCPU_ClockSelect>
200250fc:	2204      	movs	r2, #4
200250fe:	2100      	movs	r1, #0
20025100:	2030      	movs	r0, #48	@ 0x30
20025102:	fbb0 f0f5 	udiv	r0, r0, r5
20025106:	f7ff ff1f 	bl	20024f48 <HAL_RCC_HCPU_SetDiv>
2002510a:	e7e1      	b.n	200250d0 <HAL_RCC_HCPU_ConfigDvfs+0x34>
2002510c:	f7fd fc4a 	bl	200229a4 <HAL_HPAON_EnableXT48>
20025110:	4816      	ldr	r0, [pc, #88]	@ (2002516c <HAL_RCC_HCPU_ConfigDvfs+0xd0>)
20025112:	4368      	muls	r0, r5
20025114:	f7ff feb8 	bl	20024e88 <HAL_RCC_HCPU_EnableDLL1>
20025118:	4605      	mov	r5, r0
2002511a:	2800      	cmp	r0, #0
2002511c:	d1c8      	bne.n	200250b0 <HAL_RCC_HCPU_ConfigDvfs+0x14>
2002511e:	2101      	movs	r1, #1
20025120:	2206      	movs	r2, #6
20025122:	4608      	mov	r0, r1
20025124:	f7ff ff10 	bl	20024f48 <HAL_RCC_HCPU_SetDiv>
20025128:	2103      	movs	r1, #3
2002512a:	4628      	mov	r0, r5
2002512c:	f7ff fee8 	bl	20024f00 <HAL_RCC_HCPU_ClockSelect>
20025130:	e7ce      	b.n	200250d0 <HAL_RCC_HCPU_ConfigDvfs+0x34>
20025132:	2901      	cmp	r1, #1
20025134:	d909      	bls.n	2002514a <HAL_RCC_HCPU_ConfigDvfs+0xae>
20025136:	4601      	mov	r1, r0
20025138:	4620      	mov	r0, r4
2002513a:	f7ff ff2f 	bl	20024f9c <HAL_RCC_HCPU_SwitchDvfsD2S>
2002513e:	4605      	mov	r5, r0
20025140:	2000      	movs	r0, #0
20025142:	7034      	strb	r4, [r6, #0]
20025144:	f7fc fef3 	bl	20021f2e <HAL_Delay_us>
20025148:	e7b3      	b.n	200250b2 <HAL_RCC_HCPU_ConfigDvfs+0x16>
2002514a:	428b      	cmp	r3, r1
2002514c:	d103      	bne.n	20025156 <HAL_RCC_HCPU_ConfigDvfs+0xba>
2002514e:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
20025152:	4611      	mov	r1, r2
20025154:	e7d4      	b.n	20025100 <HAL_RCC_HCPU_ConfigDvfs+0x64>
20025156:	2190      	movs	r1, #144	@ 0x90
20025158:	2002      	movs	r0, #2
2002515a:	f7ff ff1f 	bl	20024f9c <HAL_RCC_HCPU_SwitchDvfsD2S>
2002515e:	2800      	cmp	r0, #0
20025160:	d1a6      	bne.n	200250b0 <HAL_RCC_HCPU_ConfigDvfs+0x14>
20025162:	e7b1      	b.n	200250c8 <HAL_RCC_HCPU_ConfigDvfs+0x2c>
20025164:	20042c09 	.word	0x20042c09
20025168:	2002b054 	.word	0x2002b054
2002516c:	000f4240 	.word	0x000f4240

20025170 <HAL_RCC_Reset_and_Halt_LCPU>:
20025170:	4a13      	ldr	r2, [pc, #76]	@ (200251c0 <HAL_RCC_Reset_and_Halt_LCPU+0x50>)
20025172:	6813      	ldr	r3, [r2, #0]
20025174:	0759      	lsls	r1, r3, #29
20025176:	d421      	bmi.n	200251bc <HAL_RCC_Reset_and_Halt_LCPU+0x4c>
20025178:	6811      	ldr	r1, [r2, #0]
2002517a:	2800      	cmp	r0, #0
2002517c:	bf0c      	ite	eq
2002517e:	2301      	moveq	r3, #1
20025180:	f04f 33ff 	movne.w	r3, #4294967295	@ 0xffffffff
20025184:	f041 0104 	orr.w	r1, r1, #4
20025188:	6011      	str	r1, [r2, #0]
2002518a:	f04f 4280 	mov.w	r2, #1073741824	@ 0x40000000
2002518e:	f443 1380 	orr.w	r3, r3, #1048576	@ 0x100000
20025192:	6013      	str	r3, [r2, #0]
20025194:	6811      	ldr	r1, [r2, #0]
20025196:	2900      	cmp	r1, #0
20025198:	d0fc      	beq.n	20025194 <HAL_RCC_Reset_and_Halt_LCPU+0x24>
2002519a:	4a09      	ldr	r2, [pc, #36]	@ (200251c0 <HAL_RCC_Reset_and_Halt_LCPU+0x50>)
2002519c:	6c11      	ldr	r1, [r2, #64]	@ 0x40
2002519e:	06c8      	lsls	r0, r1, #27
200251a0:	d506      	bpl.n	200251b0 <HAL_RCC_Reset_and_Halt_LCPU+0x40>
200251a2:	6c11      	ldr	r1, [r2, #64]	@ 0x40
200251a4:	f041 0102 	orr.w	r1, r1, #2
200251a8:	6411      	str	r1, [r2, #64]	@ 0x40
200251aa:	6c11      	ldr	r1, [r2, #64]	@ 0x40
200251ac:	06c9      	lsls	r1, r1, #27
200251ae:	d4fc      	bmi.n	200251aa <HAL_RCC_Reset_and_Halt_LCPU+0x3a>
200251b0:	f04f 4180 	mov.w	r1, #1073741824	@ 0x40000000
200251b4:	680a      	ldr	r2, [r1, #0]
200251b6:	ea22 0303 	bic.w	r3, r2, r3
200251ba:	600b      	str	r3, [r1, #0]
200251bc:	4770      	bx	lr
200251be:	bf00      	nop
200251c0:	40040000 	.word	0x40040000

200251c4 <HAL_RCC_HCPU_ConfigHCLK>:
200251c4:	28f0      	cmp	r0, #240	@ 0xf0
200251c6:	d80d      	bhi.n	200251e4 <HAL_RCC_HCPU_ConfigHCLK+0x20>
200251c8:	2890      	cmp	r0, #144	@ 0x90
200251ca:	d807      	bhi.n	200251dc <HAL_RCC_HCPU_ConfigHCLK+0x18>
200251cc:	2830      	cmp	r0, #48	@ 0x30
200251ce:	d807      	bhi.n	200251e0 <HAL_RCC_HCPU_ConfigHCLK+0x1c>
200251d0:	2818      	cmp	r0, #24
200251d2:	bf94      	ite	ls
200251d4:	2100      	movls	r1, #0
200251d6:	2101      	movhi	r1, #1
200251d8:	f7ff bf60 	b.w	2002509c <HAL_RCC_HCPU_ConfigDvfs>
200251dc:	2103      	movs	r1, #3
200251de:	e7fb      	b.n	200251d8 <HAL_RCC_HCPU_ConfigHCLK+0x14>
200251e0:	2102      	movs	r1, #2
200251e2:	e7f9      	b.n	200251d8 <HAL_RCC_HCPU_ConfigHCLK+0x14>
200251e4:	2001      	movs	r0, #1
200251e6:	4770      	bx	lr

200251e8 <spi_flash_get_rdid>:
200251e8:	b5f0      	push	{r4, r5, r6, r7, lr}
200251ea:	4605      	mov	r5, r0
200251ec:	3801      	subs	r0, #1
200251ee:	b2c0      	uxtb	r0, r0
200251f0:	28fd      	cmp	r0, #253	@ 0xfd
200251f2:	d808      	bhi.n	20025206 <spi_flash_get_rdid+0x1e>
200251f4:	2400      	movs	r4, #0
200251f6:	4f0b      	ldr	r7, [pc, #44]	@ (20025224 <spi_flash_get_rdid+0x3c>)
200251f8:	f857 0b04 	ldr.w	r0, [r7], #4
200251fc:	7806      	ldrb	r6, [r0, #0]
200251fe:	b926      	cbnz	r6, 2002520a <spi_flash_get_rdid+0x22>
20025200:	3401      	adds	r4, #1
20025202:	2c06      	cmp	r4, #6
20025204:	d1f8      	bne.n	200251f8 <spi_flash_get_rdid+0x10>
20025206:	2000      	movs	r0, #0
20025208:	e00b      	b.n	20025222 <spi_flash_get_rdid+0x3a>
2002520a:	42ae      	cmp	r6, r5
2002520c:	d105      	bne.n	2002521a <spi_flash_get_rdid+0x32>
2002520e:	7846      	ldrb	r6, [r0, #1]
20025210:	4296      	cmp	r6, r2
20025212:	d102      	bne.n	2002521a <spi_flash_get_rdid+0x32>
20025214:	7886      	ldrb	r6, [r0, #2]
20025216:	428e      	cmp	r6, r1
20025218:	d001      	beq.n	2002521e <spi_flash_get_rdid+0x36>
2002521a:	3008      	adds	r0, #8
2002521c:	e7ee      	b.n	200251fc <spi_flash_get_rdid+0x14>
2002521e:	b103      	cbz	r3, 20025222 <spi_flash_get_rdid+0x3a>
20025220:	701c      	strb	r4, [r3, #0]
20025222:	bdf0      	pop	{r4, r5, r6, r7, pc}
20025224:	20042c0c 	.word	0x20042c0c

20025228 <spi_flash_get_cmd_by_id>:
20025228:	b507      	push	{r0, r1, r2, lr}
2002522a:	f10d 0307 	add.w	r3, sp, #7
2002522e:	f7ff ffdb 	bl	200251e8 <spi_flash_get_rdid>
20025232:	4b06      	ldr	r3, [pc, #24]	@ (2002524c <spi_flash_get_cmd_by_id+0x24>)
20025234:	b140      	cbz	r0, 20025248 <spi_flash_get_cmd_by_id+0x20>
20025236:	f44f 7105 	mov.w	r1, #532	@ 0x214
2002523a:	f89d 2007 	ldrb.w	r2, [sp, #7]
2002523e:	fb01 3002 	mla	r0, r1, r2, r3
20025242:	b003      	add	sp, #12
20025244:	f85d fb04 	ldr.w	pc, [sp], #4
20025248:	4618      	mov	r0, r3
2002524a:	e7fa      	b.n	20025242 <spi_flash_get_cmd_by_id+0x1a>
2002524c:	20042e44 	.word	0x20042e44

20025250 <spi_flash_get_size_by_id>:
20025250:	b508      	push	{r3, lr}
20025252:	2300      	movs	r3, #0
20025254:	f7ff ffc8 	bl	200251e8 <spi_flash_get_rdid>
20025258:	b108      	cbz	r0, 2002525e <spi_flash_get_size_by_id+0xe>
2002525a:	6840      	ldr	r0, [r0, #4]
2002525c:	bd08      	pop	{r3, pc}
2002525e:	f44f 2000 	mov.w	r0, #524288	@ 0x80000
20025262:	e7fb      	b.n	2002525c <spi_flash_get_size_by_id+0xc>

20025264 <spi_flash_is_support_dtr>:
20025264:	b508      	push	{r3, lr}
20025266:	2300      	movs	r3, #0
20025268:	f7ff ffbe 	bl	200251e8 <spi_flash_get_rdid>
2002526c:	b110      	cbz	r0, 20025274 <spi_flash_is_support_dtr+0x10>
2002526e:	78c0      	ldrb	r0, [r0, #3]
20025270:	f000 0001 	and.w	r0, r0, #1
20025274:	bd08      	pop	{r3, pc}
	...

20025278 <spi_nand_get_rdid>:
20025278:	b5f0      	push	{r4, r5, r6, r7, lr}
2002527a:	4605      	mov	r5, r0
2002527c:	3801      	subs	r0, #1
2002527e:	b2c0      	uxtb	r0, r0
20025280:	28fd      	cmp	r0, #253	@ 0xfd
20025282:	d808      	bhi.n	20025296 <spi_nand_get_rdid+0x1e>
20025284:	2400      	movs	r4, #0
20025286:	4f0b      	ldr	r7, [pc, #44]	@ (200252b4 <spi_nand_get_rdid+0x3c>)
20025288:	f857 0b04 	ldr.w	r0, [r7], #4
2002528c:	7806      	ldrb	r6, [r0, #0]
2002528e:	b926      	cbnz	r6, 2002529a <spi_nand_get_rdid+0x22>
20025290:	3401      	adds	r4, #1
20025292:	2c06      	cmp	r4, #6
20025294:	d1f8      	bne.n	20025288 <spi_nand_get_rdid+0x10>
20025296:	2000      	movs	r0, #0
20025298:	e00b      	b.n	200252b2 <spi_nand_get_rdid+0x3a>
2002529a:	42ae      	cmp	r6, r5
2002529c:	d105      	bne.n	200252aa <spi_nand_get_rdid+0x32>
2002529e:	7846      	ldrb	r6, [r0, #1]
200252a0:	4296      	cmp	r6, r2
200252a2:	d102      	bne.n	200252aa <spi_nand_get_rdid+0x32>
200252a4:	7886      	ldrb	r6, [r0, #2]
200252a6:	428e      	cmp	r6, r1
200252a8:	d001      	beq.n	200252ae <spi_nand_get_rdid+0x36>
200252aa:	3008      	adds	r0, #8
200252ac:	e7ee      	b.n	2002528c <spi_nand_get_rdid+0x14>
200252ae:	b103      	cbz	r3, 200252b2 <spi_nand_get_rdid+0x3a>
200252b0:	701c      	strb	r4, [r3, #0]
200252b2:	bdf0      	pop	{r4, r5, r6, r7, pc}
200252b4:	20043abc 	.word	0x20043abc

200252b8 <spi_nand_get_cmd_by_id>:
200252b8:	b507      	push	{r0, r1, r2, lr}
200252ba:	f10d 0307 	add.w	r3, sp, #7
200252be:	f7ff ffdb 	bl	20025278 <spi_nand_get_rdid>
200252c2:	b130      	cbz	r0, 200252d2 <spi_nand_get_cmd_by_id+0x1a>
200252c4:	f44f 7205 	mov.w	r2, #532	@ 0x214
200252c8:	f89d 3007 	ldrb.w	r3, [sp, #7]
200252cc:	4802      	ldr	r0, [pc, #8]	@ (200252d8 <spi_nand_get_cmd_by_id+0x20>)
200252ce:	fb02 0003 	mla	r0, r2, r3, r0
200252d2:	b003      	add	sp, #12
200252d4:	f85d fb04 	ldr.w	pc, [sp], #4
200252d8:	20043cd4 	.word	0x20043cd4

200252dc <HAL_GET_FLASH_DEFAUT_INX>:
200252dc:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
200252e0:	4770      	bx	lr
	...

200252e4 <spi_nand_get_default_ctable>:
200252e4:	b508      	push	{r3, lr}
200252e6:	f7ff fff9 	bl	200252dc <HAL_GET_FLASH_DEFAUT_INX>
200252ea:	1e03      	subs	r3, r0, #0
200252ec:	bfa5      	ittet	ge
200252ee:	f44f 7205 	movge.w	r2, #532	@ 0x214
200252f2:	4802      	ldrge	r0, [pc, #8]	@ (200252fc <spi_nand_get_default_ctable+0x18>)
200252f4:	2000      	movlt	r0, #0
200252f6:	fb02 0003 	mlage	r0, r2, r3, r0
200252fa:	bd08      	pop	{r3, pc}
200252fc:	20043cd4 	.word	0x20043cd4

20025300 <spi_nand_get_size_by_id>:
20025300:	b508      	push	{r3, lr}
20025302:	2300      	movs	r3, #0
20025304:	f7ff ffb8 	bl	20025278 <spi_nand_get_rdid>
20025308:	b108      	cbz	r0, 2002530e <spi_nand_get_size_by_id+0xe>
2002530a:	6840      	ldr	r0, [r0, #4]
2002530c:	bd08      	pop	{r3, pc}
2002530e:	f04f 6080 	mov.w	r0, #67108864	@ 0x4000000
20025312:	e7fb      	b.n	2002530c <spi_nand_get_size_by_id+0xc>

20025314 <spi_nand_get_plane_select_flag>:
20025314:	b508      	push	{r3, lr}
20025316:	2300      	movs	r3, #0
20025318:	f7ff ffae 	bl	20025278 <spi_nand_get_rdid>
2002531c:	b110      	cbz	r0, 20025324 <spi_nand_get_plane_select_flag+0x10>
2002531e:	78c0      	ldrb	r0, [r0, #3]
20025320:	f3c0 0040 	ubfx	r0, r0, #1, #1
20025324:	bd08      	pop	{r3, pc}

20025326 <spi_nand_get_big_page_flag>:
20025326:	b508      	push	{r3, lr}
20025328:	2300      	movs	r3, #0
2002532a:	f7ff ffa5 	bl	20025278 <spi_nand_get_rdid>
2002532e:	b110      	cbz	r0, 20025336 <spi_nand_get_big_page_flag+0x10>
20025330:	78c0      	ldrb	r0, [r0, #3]
20025332:	f3c0 0081 	ubfx	r0, r0, #2, #2
20025336:	bd08      	pop	{r3, pc}

20025338 <spi_nand_get_ecc_mode>:
20025338:	b508      	push	{r3, lr}
2002533a:	2300      	movs	r3, #0
2002533c:	f7ff ff9c 	bl	20025278 <spi_nand_get_rdid>
20025340:	b108      	cbz	r0, 20025346 <spi_nand_get_ecc_mode+0xe>
20025342:	78c0      	ldrb	r0, [r0, #3]
20025344:	0900      	lsrs	r0, r0, #4
20025346:	bd08      	pop	{r3, pc}

20025348 <bbm_map_check.part.0>:
20025348:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
2002534a:	4b21      	ldr	r3, [pc, #132]	@ (200253d0 <bbm_map_check.part.0+0x88>)
2002534c:	4606      	mov	r6, r0
2002534e:	681d      	ldr	r5, [r3, #0]
20025350:	4b20      	ldr	r3, [pc, #128]	@ (200253d4 <bbm_map_check.part.0+0x8c>)
20025352:	3d04      	subs	r5, #4
20025354:	681f      	ldr	r7, [r3, #0]
20025356:	2300      	movs	r3, #0
20025358:	f100 0e1a 	add.w	lr, r0, #26
2002535c:	42ab      	cmp	r3, r5
2002535e:	db02      	blt.n	20025366 <bbm_map_check.part.0+0x1e>
20025360:	2000      	movs	r0, #0
20025362:	b003      	add	sp, #12
20025364:	bdf0      	pop	{r4, r5, r6, r7, pc}
20025366:	8b31      	ldrh	r1, [r6, #24]
20025368:	b321      	cbz	r1, 200253b4 <bbm_map_check.part.0+0x6c>
2002536a:	8b72      	ldrh	r2, [r6, #26]
2002536c:	b33a      	cbz	r2, 200253be <bbm_map_check.part.0+0x76>
2002536e:	42b9      	cmp	r1, r7
20025370:	d201      	bcs.n	20025376 <bbm_map_check.part.0+0x2e>
20025372:	4297      	cmp	r7, r2
20025374:	d905      	bls.n	20025382 <bbm_map_check.part.0+0x3a>
20025376:	4b18      	ldr	r3, [pc, #96]	@ (200253d8 <bbm_map_check.part.0+0x90>)
20025378:	681b      	ldr	r3, [r3, #0]
2002537a:	b10b      	cbz	r3, 20025380 <bbm_map_check.part.0+0x38>
2002537c:	4817      	ldr	r0, [pc, #92]	@ (200253dc <bbm_map_check.part.0+0x94>)
2002537e:	4798      	blx	r3
20025380:	e7fe      	b.n	20025380 <bbm_map_check.part.0+0x38>
20025382:	3301      	adds	r3, #1
20025384:	461c      	mov	r4, r3
20025386:	42ac      	cmp	r4, r5
20025388:	db01      	blt.n	2002538e <bbm_map_check.part.0+0x46>
2002538a:	3604      	adds	r6, #4
2002538c:	e7e6      	b.n	2002535c <bbm_map_check.part.0+0x14>
2002538e:	f83e c024 	ldrh.w	ip, [lr, r4, lsl #2]
20025392:	f1bc 0f00 	cmp.w	ip, #0
20025396:	d0f8      	beq.n	2002538a <bbm_map_check.part.0+0x42>
20025398:	4562      	cmp	r2, ip
2002539a:	d109      	bne.n	200253b0 <bbm_map_check.part.0+0x68>
2002539c:	4b0e      	ldr	r3, [pc, #56]	@ (200253d8 <bbm_map_check.part.0+0x90>)
2002539e:	681d      	ldr	r5, [r3, #0]
200253a0:	b12d      	cbz	r5, 200253ae <bbm_map_check.part.0+0x66>
200253a2:	3406      	adds	r4, #6
200253a4:	f830 3024 	ldrh.w	r3, [r0, r4, lsl #2]
200253a8:	480d      	ldr	r0, [pc, #52]	@ (200253e0 <bbm_map_check.part.0+0x98>)
200253aa:	9200      	str	r2, [sp, #0]
200253ac:	47a8      	blx	r5
200253ae:	e7fe      	b.n	200253ae <bbm_map_check.part.0+0x66>
200253b0:	3401      	adds	r4, #1
200253b2:	e7e8      	b.n	20025386 <bbm_map_check.part.0+0x3e>
200253b4:	eb00 0283 	add.w	r2, r0, r3, lsl #2
200253b8:	8b52      	ldrh	r2, [r2, #26]
200253ba:	2a00      	cmp	r2, #0
200253bc:	d0d0      	beq.n	20025360 <bbm_map_check.part.0+0x18>
200253be:	4a06      	ldr	r2, [pc, #24]	@ (200253d8 <bbm_map_check.part.0+0x90>)
200253c0:	6814      	ldr	r4, [r2, #0]
200253c2:	b124      	cbz	r4, 200253ce <bbm_map_check.part.0+0x86>
200253c4:	eb00 0383 	add.w	r3, r0, r3, lsl #2
200253c8:	8b5a      	ldrh	r2, [r3, #26]
200253ca:	4806      	ldr	r0, [pc, #24]	@ (200253e4 <bbm_map_check.part.0+0x9c>)
200253cc:	47a0      	blx	r4
200253ce:	e7fe      	b.n	200253ce <bbm_map_check.part.0+0x86>
200253d0:	2004cbec 	.word	0x2004cbec
200253d4:	2004cbf0 	.word	0x2004cbf0
200253d8:	2004cbdc 	.word	0x2004cbdc
200253dc:	2002a9f4 	.word	0x2002a9f4
200253e0:	2002aa11 	.word	0x2002aa11
200253e4:	2002aa5e 	.word	0x2002aa5e

200253e8 <bbm_crc_check>:
200253e8:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
200253ec:	b510      	push	{r4, lr}
200253ee:	4c07      	ldr	r4, [pc, #28]	@ (2002540c <bbm_crc_check+0x24>)
200253f0:	4401      	add	r1, r0
200253f2:	4288      	cmp	r0, r1
200253f4:	d101      	bne.n	200253fa <bbm_crc_check+0x12>
200253f6:	43d0      	mvns	r0, r2
200253f8:	bd10      	pop	{r4, pc}
200253fa:	f810 3b01 	ldrb.w	r3, [r0], #1
200253fe:	4053      	eors	r3, r2
20025400:	b2db      	uxtb	r3, r3
20025402:	f854 3023 	ldr.w	r3, [r4, r3, lsl #2]
20025406:	ea83 2212 	eor.w	r2, r3, r2, lsr #8
2002540a:	e7f2      	b.n	200253f2 <bbm_crc_check+0xa>
2002540c:	2002b084 	.word	0x2002b084

20025410 <bbm_get_phy_blk>:
20025410:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20025412:	4b14      	ldr	r3, [pc, #80]	@ (20025464 <bbm_get_phy_blk+0x54>)
20025414:	4601      	mov	r1, r0
20025416:	681e      	ldr	r6, [r3, #0]
20025418:	42b0      	cmp	r0, r6
2002541a:	d21e      	bcs.n	2002545a <bbm_get_phy_blk+0x4a>
2002541c:	b138      	cbz	r0, 2002542e <bbm_get_phy_blk+0x1e>
2002541e:	4b12      	ldr	r3, [pc, #72]	@ (20025468 <bbm_get_phy_blk+0x58>)
20025420:	2200      	movs	r2, #0
20025422:	681c      	ldr	r4, [r3, #0]
20025424:	4b11      	ldr	r3, [pc, #68]	@ (2002546c <bbm_get_phy_blk+0x5c>)
20025426:	3c04      	subs	r4, #4
20025428:	461d      	mov	r5, r3
2002542a:	4294      	cmp	r4, r2
2002542c:	dc00      	bgt.n	20025430 <bbm_get_phy_blk+0x20>
2002542e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20025430:	8b1f      	ldrh	r7, [r3, #24]
20025432:	428f      	cmp	r7, r1
20025434:	d10a      	bne.n	2002544c <bbm_get_phy_blk+0x3c>
20025436:	eb05 0582 	add.w	r5, r5, r2, lsl #2
2002543a:	8b6a      	ldrh	r2, [r5, #26]
2002543c:	4296      	cmp	r6, r2
2002543e:	dd0f      	ble.n	20025460 <bbm_get_phy_blk+0x50>
20025440:	4b0b      	ldr	r3, [pc, #44]	@ (20025470 <bbm_get_phy_blk+0x60>)
20025442:	681b      	ldr	r3, [r3, #0]
20025444:	b10b      	cbz	r3, 2002544a <bbm_get_phy_blk+0x3a>
20025446:	480b      	ldr	r0, [pc, #44]	@ (20025474 <bbm_get_phy_blk+0x64>)
20025448:	4798      	blx	r3
2002544a:	e7fe      	b.n	2002544a <bbm_get_phy_blk+0x3a>
2002544c:	b917      	cbnz	r7, 20025454 <bbm_get_phy_blk+0x44>
2002544e:	8b5f      	ldrh	r7, [r3, #26]
20025450:	2f00      	cmp	r7, #0
20025452:	d0ec      	beq.n	2002542e <bbm_get_phy_blk+0x1e>
20025454:	3201      	adds	r2, #1
20025456:	3304      	adds	r3, #4
20025458:	e7e7      	b.n	2002542a <bbm_get_phy_blk+0x1a>
2002545a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
2002545e:	e7e6      	b.n	2002542e <bbm_get_phy_blk+0x1e>
20025460:	4610      	mov	r0, r2
20025462:	e7e4      	b.n	2002542e <bbm_get_phy_blk+0x1e>
20025464:	2004cbf0 	.word	0x2004cbf0
20025468:	2004cbec 	.word	0x2004cbec
2002546c:	2004cbf4 	.word	0x2004cbf4
20025470:	2004cbdc 	.word	0x2004cbdc
20025474:	2002aa7c 	.word	0x2002aa7c

20025478 <bbm_get_version_inblk>:
20025478:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002547c:	4607      	mov	r7, r0
2002547e:	4688      	mov	r8, r1
20025480:	b087      	sub	sp, #28
20025482:	2900      	cmp	r1, #0
20025484:	d14b      	bne.n	2002551e <bbm_get_version_inblk+0xa6>
20025486:	2500      	movs	r5, #0
20025488:	4628      	mov	r0, r5
2002548a:	b007      	add	sp, #28
2002548c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20025490:	2200      	movs	r2, #0
20025492:	e9cd 2201 	strd	r2, r2, [sp, #4]
20025496:	4e26      	ldr	r6, [pc, #152]	@ (20025530 <bbm_get_version_inblk+0xb8>)
20025498:	9100      	str	r1, [sp, #0]
2002549a:	4638      	mov	r0, r7
2002549c:	4621      	mov	r1, r4
2002549e:	6833      	ldr	r3, [r6, #0]
200254a0:	f7fb fb72 	bl	20020b88 <port_read_page>
200254a4:	2800      	cmp	r0, #0
200254a6:	dd32      	ble.n	2002550e <bbm_get_version_inblk+0x96>
200254a8:	6832      	ldr	r2, [r6, #0]
200254aa:	6813      	ldr	r3, [r2, #0]
200254ac:	455b      	cmp	r3, fp
200254ae:	d123      	bne.n	200254f8 <bbm_get_version_inblk+0x80>
200254b0:	6856      	ldr	r6, [r2, #4]
200254b2:	f3c6 061e 	ubfx	r6, r6, #0, #31
200254b6:	42ae      	cmp	r6, r5
200254b8:	dd15      	ble.n	200254e6 <bbm_get_version_inblk+0x6e>
200254ba:	4610      	mov	r0, r2
200254bc:	2110      	movs	r1, #16
200254be:	9205      	str	r2, [sp, #20]
200254c0:	f7ff ff92 	bl	200253e8 <bbm_crc_check>
200254c4:	9a05      	ldr	r2, [sp, #20]
200254c6:	6913      	ldr	r3, [r2, #16]
200254c8:	4283      	cmp	r3, r0
200254ca:	d113      	bne.n	200254f4 <bbm_get_version_inblk+0x7c>
200254cc:	f8c8 4000 	str.w	r4, [r8]
200254d0:	4635      	mov	r5, r6
200254d2:	3401      	adds	r4, #1
200254d4:	f8da 1000 	ldr.w	r1, [sl]
200254d8:	f8d9 3000 	ldr.w	r3, [r9]
200254dc:	fbb3 f3f1 	udiv	r3, r3, r1
200254e0:	42a3      	cmp	r3, r4
200254e2:	d8d5      	bhi.n	20025490 <bbm_get_version_inblk+0x18>
200254e4:	e7d0      	b.n	20025488 <bbm_get_version_inblk+0x10>
200254e6:	4b13      	ldr	r3, [pc, #76]	@ (20025534 <bbm_get_version_inblk+0xbc>)
200254e8:	681b      	ldr	r3, [r3, #0]
200254ea:	b11b      	cbz	r3, 200254f4 <bbm_get_version_inblk+0x7c>
200254ec:	4632      	mov	r2, r6
200254ee:	4629      	mov	r1, r5
200254f0:	4811      	ldr	r0, [pc, #68]	@ (20025538 <bbm_get_version_inblk+0xc0>)
200254f2:	4798      	blx	r3
200254f4:	462e      	mov	r6, r5
200254f6:	e7eb      	b.n	200254d0 <bbm_get_version_inblk+0x58>
200254f8:	1c5a      	adds	r2, r3, #1
200254fa:	d0c5      	beq.n	20025488 <bbm_get_version_inblk+0x10>
200254fc:	4a0d      	ldr	r2, [pc, #52]	@ (20025534 <bbm_get_version_inblk+0xbc>)
200254fe:	6815      	ldr	r5, [r2, #0]
20025500:	2d00      	cmp	r5, #0
20025502:	d0c0      	beq.n	20025486 <bbm_get_version_inblk+0xe>
20025504:	4622      	mov	r2, r4
20025506:	4639      	mov	r1, r7
20025508:	480c      	ldr	r0, [pc, #48]	@ (2002553c <bbm_get_version_inblk+0xc4>)
2002550a:	47a8      	blx	r5
2002550c:	e7bb      	b.n	20025486 <bbm_get_version_inblk+0xe>
2002550e:	4b09      	ldr	r3, [pc, #36]	@ (20025534 <bbm_get_version_inblk+0xbc>)
20025510:	681b      	ldr	r3, [r3, #0]
20025512:	2b00      	cmp	r3, #0
20025514:	d0ee      	beq.n	200254f4 <bbm_get_version_inblk+0x7c>
20025516:	4622      	mov	r2, r4
20025518:	4639      	mov	r1, r7
2002551a:	4809      	ldr	r0, [pc, #36]	@ (20025540 <bbm_get_version_inblk+0xc8>)
2002551c:	e7e9      	b.n	200254f2 <bbm_get_version_inblk+0x7a>
2002551e:	2400      	movs	r4, #0
20025520:	f8df a020 	ldr.w	sl, [pc, #32]	@ 20025544 <bbm_get_version_inblk+0xcc>
20025524:	4625      	mov	r5, r4
20025526:	f8df 9020 	ldr.w	r9, [pc, #32]	@ 20025548 <bbm_get_version_inblk+0xd0>
2002552a:	f8df b020 	ldr.w	fp, [pc, #32]	@ 2002554c <bbm_get_version_inblk+0xd4>
2002552e:	e7d1      	b.n	200254d4 <bbm_get_version_inblk+0x5c>
20025530:	2004cbe0 	.word	0x2004cbe0
20025534:	2004cbdc 	.word	0x2004cbdc
20025538:	2002aa9b 	.word	0x2002aa9b
2002553c:	2002aac8 	.word	0x2002aac8
20025540:	2002aaf9 	.word	0x2002aaf9
20025544:	2004494c 	.word	0x2004494c
20025548:	20044950 	.word	0x20044950
2002554c:	5366424d 	.word	0x5366424d

20025550 <bbm_get_map_table>:
20025550:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20025554:	2801      	cmp	r0, #1
20025556:	4607      	mov	r7, r0
20025558:	f8df b15c 	ldr.w	fp, [pc, #348]	@ 200256b8 <bbm_get_map_table+0x168>
2002555c:	b087      	sub	sp, #28
2002555e:	dd0a      	ble.n	20025576 <bbm_get_map_table+0x26>
20025560:	f8db 3000 	ldr.w	r3, [fp]
20025564:	b91b      	cbnz	r3, 2002556e <bbm_get_map_table+0x1e>
20025566:	2000      	movs	r0, #0
20025568:	b007      	add	sp, #28
2002556a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002556e:	4601      	mov	r1, r0
20025570:	4847      	ldr	r0, [pc, #284]	@ (20025690 <bbm_get_map_table+0x140>)
20025572:	4798      	blx	r3
20025574:	e7f7      	b.n	20025566 <bbm_get_map_table+0x16>
20025576:	f8df 8144 	ldr.w	r8, [pc, #324]	@ 200256bc <bbm_get_map_table+0x16c>
2002557a:	2800      	cmp	r0, #0
2002557c:	d163      	bne.n	20025646 <bbm_get_map_table+0xf6>
2002557e:	f8b8 6000 	ldrh.w	r6, [r8]
20025582:	f8b8 5002 	ldrh.w	r5, [r8, #2]
20025586:	2e00      	cmp	r6, #0
20025588:	d062      	beq.n	20025650 <bbm_get_map_table+0x100>
2002558a:	4630      	mov	r0, r6
2002558c:	a904      	add	r1, sp, #16
2002558e:	f7ff ff73 	bl	20025478 <bbm_get_version_inblk>
20025592:	4681      	mov	r9, r0
20025594:	2d00      	cmp	r5, #0
20025596:	d05d      	beq.n	20025654 <bbm_get_map_table+0x104>
20025598:	4628      	mov	r0, r5
2002559a:	a905      	add	r1, sp, #20
2002559c:	f7ff ff6c 	bl	20025478 <bbm_get_version_inblk>
200255a0:	4604      	mov	r4, r0
200255a2:	f8db a000 	ldr.w	sl, [fp]
200255a6:	f1ba 0f00 	cmp.w	sl, #0
200255aa:	d005      	beq.n	200255b8 <bbm_get_map_table+0x68>
200255ac:	4623      	mov	r3, r4
200255ae:	4632      	mov	r2, r6
200255b0:	4649      	mov	r1, r9
200255b2:	4838      	ldr	r0, [pc, #224]	@ (20025694 <bbm_get_map_table+0x144>)
200255b4:	9500      	str	r5, [sp, #0]
200255b6:	47d0      	blx	sl
200255b8:	45a1      	cmp	r9, r4
200255ba:	d0d4      	beq.n	20025566 <bbm_get_map_table+0x16>
200255bc:	f04f 0200 	mov.w	r2, #0
200255c0:	bf98      	it	ls
200255c2:	462e      	movls	r6, r5
200255c4:	f107 0308 	add.w	r3, r7, #8
200255c8:	bf94      	ite	ls
200255ca:	f828 5013 	strhls.w	r5, [r8, r3, lsl #1]
200255ce:	f828 6013 	strhhi.w	r6, [r8, r3, lsl #1]
200255d2:	e9cd 2201 	strd	r2, r2, [sp, #4]
200255d6:	4b30      	ldr	r3, [pc, #192]	@ (20025698 <bbm_get_map_table+0x148>)
200255d8:	bf88      	it	hi
200255da:	f8dd a010 	ldrhi.w	sl, [sp, #16]
200255de:	681b      	ldr	r3, [r3, #0]
200255e0:	bf98      	it	ls
200255e2:	f8dd a014 	ldrls.w	sl, [sp, #20]
200255e6:	f8df 80d8 	ldr.w	r8, [pc, #216]	@ 200256c0 <bbm_get_map_table+0x170>
200255ea:	9300      	str	r3, [sp, #0]
200255ec:	4651      	mov	r1, sl
200255ee:	4630      	mov	r0, r6
200255f0:	f8d8 3000 	ldr.w	r3, [r8]
200255f4:	bf88      	it	hi
200255f6:	464c      	movhi	r4, r9
200255f8:	f7fb fac6 	bl	20020b88 <port_read_page>
200255fc:	2800      	cmp	r0, #0
200255fe:	f8db 5000 	ldr.w	r5, [fp]
20025602:	dd38      	ble.n	20025676 <bbm_get_map_table+0x126>
20025604:	f8d8 8000 	ldr.w	r8, [r8]
20025608:	4b24      	ldr	r3, [pc, #144]	@ (2002569c <bbm_get_map_table+0x14c>)
2002560a:	f8d8 2000 	ldr.w	r2, [r8]
2002560e:	429a      	cmp	r2, r3
20025610:	d12b      	bne.n	2002566a <bbm_get_map_table+0x11a>
20025612:	2110      	movs	r1, #16
20025614:	4640      	mov	r0, r8
20025616:	f7ff fee7 	bl	200253e8 <bbm_crc_check>
2002561a:	f8d8 2010 	ldr.w	r2, [r8, #16]
2002561e:	4601      	mov	r1, r0
20025620:	4282      	cmp	r2, r0
20025622:	d11e      	bne.n	20025662 <bbm_get_map_table+0x112>
20025624:	f8d8 1004 	ldr.w	r1, [r8, #4]
20025628:	f3c1 011e 	ubfx	r1, r1, #0, #31
2002562c:	42a1      	cmp	r1, r4
2002562e:	d113      	bne.n	20025658 <bbm_get_map_table+0x108>
20025630:	f44f 7202 	mov.w	r2, #520	@ 0x208
20025634:	481a      	ldr	r0, [pc, #104]	@ (200256a0 <bbm_get_map_table+0x150>)
20025636:	4641      	mov	r1, r8
20025638:	fb02 0007 	mla	r0, r2, r7, r0
2002563c:	f005 f900 	bl	2002a840 <memcpy>
20025640:	bb0d      	cbnz	r5, 20025686 <bbm_get_map_table+0x136>
20025642:	4620      	mov	r0, r4
20025644:	e790      	b.n	20025568 <bbm_get_map_table+0x18>
20025646:	f8b8 6004 	ldrh.w	r6, [r8, #4]
2002564a:	f8b8 5006 	ldrh.w	r5, [r8, #6]
2002564e:	e79a      	b.n	20025586 <bbm_get_map_table+0x36>
20025650:	46b1      	mov	r9, r6
20025652:	e79f      	b.n	20025594 <bbm_get_map_table+0x44>
20025654:	462c      	mov	r4, r5
20025656:	e7a4      	b.n	200255a2 <bbm_get_map_table+0x52>
20025658:	b115      	cbz	r5, 20025660 <bbm_get_map_table+0x110>
2002565a:	4622      	mov	r2, r4
2002565c:	4811      	ldr	r0, [pc, #68]	@ (200256a4 <bbm_get_map_table+0x154>)
2002565e:	47a8      	blx	r5
20025660:	e7fe      	b.n	20025660 <bbm_get_map_table+0x110>
20025662:	b10d      	cbz	r5, 20025668 <bbm_get_map_table+0x118>
20025664:	4810      	ldr	r0, [pc, #64]	@ (200256a8 <bbm_get_map_table+0x158>)
20025666:	47a8      	blx	r5
20025668:	e7fe      	b.n	20025668 <bbm_get_map_table+0x118>
2002566a:	b11d      	cbz	r5, 20025674 <bbm_get_map_table+0x124>
2002566c:	4652      	mov	r2, sl
2002566e:	4631      	mov	r1, r6
20025670:	480e      	ldr	r0, [pc, #56]	@ (200256ac <bbm_get_map_table+0x15c>)
20025672:	47a8      	blx	r5
20025674:	e7fe      	b.n	20025674 <bbm_get_map_table+0x124>
20025676:	2d00      	cmp	r5, #0
20025678:	f43f af75 	beq.w	20025566 <bbm_get_map_table+0x16>
2002567c:	4652      	mov	r2, sl
2002567e:	4631      	mov	r1, r6
20025680:	480b      	ldr	r0, [pc, #44]	@ (200256b0 <bbm_get_map_table+0x160>)
20025682:	47a8      	blx	r5
20025684:	e76f      	b.n	20025566 <bbm_get_map_table+0x16>
20025686:	4621      	mov	r1, r4
20025688:	480a      	ldr	r0, [pc, #40]	@ (200256b4 <bbm_get_map_table+0x164>)
2002568a:	47a8      	blx	r5
2002568c:	e7d9      	b.n	20025642 <bbm_get_map_table+0xf2>
2002568e:	bf00      	nop
20025690:	2002ab17 	.word	0x2002ab17
20025694:	2002ab2b 	.word	0x2002ab2b
20025698:	2004494c 	.word	0x2004494c
2002569c:	5366424d 	.word	0x5366424d
200256a0:	2004cbf4 	.word	0x2004cbf4
200256a4:	2002ab51 	.word	0x2002ab51
200256a8:	2002ab9b 	.word	0x2002ab9b
200256ac:	2002abad 	.word	0x2002abad
200256b0:	2002abe2 	.word	0x2002abe2
200256b4:	2002ac0e 	.word	0x2002ac0e
200256b8:	2004cbdc 	.word	0x2004cbdc
200256bc:	2004d004 	.word	0x2004d004
200256c0:	2004cbe0 	.word	0x2004cbe0

200256c4 <bbm_get_page_num>:
200256c4:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
200256c8:	4605      	mov	r5, r0
200256ca:	2400      	movs	r4, #0
200256cc:	4f13      	ldr	r7, [pc, #76]	@ (2002571c <bbm_get_page_num+0x58>)
200256ce:	4e14      	ldr	r6, [pc, #80]	@ (20025720 <bbm_get_page_num+0x5c>)
200256d0:	f8df 8050 	ldr.w	r8, [pc, #80]	@ 20025724 <bbm_get_page_num+0x60>
200256d4:	b085      	sub	sp, #20
200256d6:	6839      	ldr	r1, [r7, #0]
200256d8:	6833      	ldr	r3, [r6, #0]
200256da:	fbb3 f3f1 	udiv	r3, r3, r1
200256de:	42a3      	cmp	r3, r4
200256e0:	d802      	bhi.n	200256e8 <bbm_get_page_num+0x24>
200256e2:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
200256e6:	e015      	b.n	20025714 <bbm_get_page_num+0x50>
200256e8:	2200      	movs	r2, #0
200256ea:	e9cd 2201 	strd	r2, r2, [sp, #4]
200256ee:	f8df 9038 	ldr.w	r9, [pc, #56]	@ 20025728 <bbm_get_page_num+0x64>
200256f2:	9100      	str	r1, [sp, #0]
200256f4:	4628      	mov	r0, r5
200256f6:	4621      	mov	r1, r4
200256f8:	f8d9 3000 	ldr.w	r3, [r9]
200256fc:	f7fb fa44 	bl	20020b88 <port_read_page>
20025700:	b120      	cbz	r0, 2002570c <bbm_get_page_num+0x48>
20025702:	f8d9 3000 	ldr.w	r3, [r9]
20025706:	681b      	ldr	r3, [r3, #0]
20025708:	4543      	cmp	r3, r8
2002570a:	d101      	bne.n	20025710 <bbm_get_page_num+0x4c>
2002570c:	3401      	adds	r4, #1
2002570e:	e7e2      	b.n	200256d6 <bbm_get_page_num+0x12>
20025710:	3301      	adds	r3, #1
20025712:	d1fb      	bne.n	2002570c <bbm_get_page_num+0x48>
20025714:	4620      	mov	r0, r4
20025716:	b005      	add	sp, #20
20025718:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
2002571c:	2004494c 	.word	0x2004494c
20025720:	20044950 	.word	0x20044950
20025724:	5366424d 	.word	0x5366424d
20025728:	2004cbe0 	.word	0x2004cbe0

2002572c <bbm_read_page>:
2002572c:	b5f0      	push	{r4, r5, r6, r7, lr}
2002572e:	4604      	mov	r4, r0
20025730:	b085      	sub	sp, #20
20025732:	b280      	uxth	r0, r0
20025734:	461f      	mov	r7, r3
20025736:	460d      	mov	r5, r1
20025738:	4616      	mov	r6, r2
2002573a:	f7ff fe69 	bl	20025410 <bbm_get_phy_blk>
2002573e:	1c43      	adds	r3, r0, #1
20025740:	d108      	bne.n	20025754 <bbm_read_page+0x28>
20025742:	4b0a      	ldr	r3, [pc, #40]	@ (2002576c <bbm_read_page+0x40>)
20025744:	681b      	ldr	r3, [r3, #0]
20025746:	b113      	cbz	r3, 2002574e <bbm_read_page+0x22>
20025748:	4621      	mov	r1, r4
2002574a:	4809      	ldr	r0, [pc, #36]	@ (20025770 <bbm_read_page+0x44>)
2002574c:	4798      	blx	r3
2002574e:	2000      	movs	r0, #0
20025750:	b005      	add	sp, #20
20025752:	bdf0      	pop	{r4, r5, r6, r7, pc}
20025754:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
20025756:	4632      	mov	r2, r6
20025758:	9302      	str	r3, [sp, #8]
2002575a:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
2002575c:	4629      	mov	r1, r5
2002575e:	9301      	str	r3, [sp, #4]
20025760:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
20025762:	9300      	str	r3, [sp, #0]
20025764:	463b      	mov	r3, r7
20025766:	f7fb fa0f 	bl	20020b88 <port_read_page>
2002576a:	e7f1      	b.n	20025750 <bbm_read_page+0x24>
2002576c:	2004cbdc 	.word	0x2004cbdc
20025770:	2002ac21 	.word	0x2002ac21

20025774 <port_write_page>:
20025774:	4b01      	ldr	r3, [pc, #4]	@ (2002577c <port_write_page+0x8>)
20025776:	6818      	ldr	r0, [r3, #0]
20025778:	4770      	bx	lr
2002577a:	bf00      	nop
2002577c:	2004494c 	.word	0x2004494c

20025780 <bbm_write_talbe.isra.0>:
20025780:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
20025782:	4604      	mov	r4, r0
20025784:	4608      	mov	r0, r1
20025786:	460e      	mov	r6, r1
20025788:	f7ff ff9c 	bl	200256c4 <bbm_get_page_num>
2002578c:	1e05      	subs	r5, r0, #0
2002578e:	db25      	blt.n	200257dc <bbm_write_talbe.isra.0+0x5c>
20025790:	4b13      	ldr	r3, [pc, #76]	@ (200257e0 <bbm_write_talbe.isra.0+0x60>)
20025792:	681a      	ldr	r2, [r3, #0]
20025794:	4b13      	ldr	r3, [pc, #76]	@ (200257e4 <bbm_write_talbe.isra.0+0x64>)
20025796:	681b      	ldr	r3, [r3, #0]
20025798:	fbb3 f3f2 	udiv	r3, r3, r2
2002579c:	429d      	cmp	r5, r3
2002579e:	da1d      	bge.n	200257dc <bbm_write_talbe.isra.0+0x5c>
200257a0:	4f11      	ldr	r7, [pc, #68]	@ (200257e8 <bbm_write_talbe.isra.0+0x68>)
200257a2:	21ff      	movs	r1, #255	@ 0xff
200257a4:	6838      	ldr	r0, [r7, #0]
200257a6:	f005 f831 	bl	2002a80c <memset>
200257aa:	4264      	negs	r4, r4
200257ac:	490f      	ldr	r1, [pc, #60]	@ (200257ec <bbm_write_talbe.isra.0+0x6c>)
200257ae:	f404 7402 	and.w	r4, r4, #520	@ 0x208
200257b2:	f44f 7202 	mov.w	r2, #520	@ 0x208
200257b6:	6838      	ldr	r0, [r7, #0]
200257b8:	4421      	add	r1, r4
200257ba:	f005 f841 	bl	2002a840 <memcpy>
200257be:	6838      	ldr	r0, [r7, #0]
200257c0:	b160      	cbz	r0, 200257dc <bbm_write_talbe.isra.0+0x5c>
200257c2:	6802      	ldr	r2, [r0, #0]
200257c4:	4b0a      	ldr	r3, [pc, #40]	@ (200257f0 <bbm_write_talbe.isra.0+0x70>)
200257c6:	429a      	cmp	r2, r3
200257c8:	d108      	bne.n	200257dc <bbm_write_talbe.isra.0+0x5c>
200257ca:	f7ff fdbd 	bl	20025348 <bbm_map_check.part.0>
200257ce:	2300      	movs	r3, #0
200257d0:	9300      	str	r3, [sp, #0]
200257d2:	4629      	mov	r1, r5
200257d4:	4630      	mov	r0, r6
200257d6:	683a      	ldr	r2, [r7, #0]
200257d8:	f7ff ffcc 	bl	20025774 <port_write_page>
200257dc:	b003      	add	sp, #12
200257de:	bdf0      	pop	{r4, r5, r6, r7, pc}
200257e0:	2004494c 	.word	0x2004494c
200257e4:	20044950 	.word	0x20044950
200257e8:	2004cbe0 	.word	0x2004cbe0
200257ec:	2004cbf4 	.word	0x2004cbf4
200257f0:	5366424d 	.word	0x5366424d

200257f4 <port_erase_block>:
200257f4:	2000      	movs	r0, #0
200257f6:	4770      	bx	lr

200257f8 <bbm_init_table>:
200257f8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
200257fc:	4c7d      	ldr	r4, [pc, #500]	@ (200259f4 <bbm_init_table+0x1fc>)
200257fe:	4b7e      	ldr	r3, [pc, #504]	@ (200259f8 <bbm_init_table+0x200>)
20025800:	6822      	ldr	r2, [r4, #0]
20025802:	b085      	sub	sp, #20
20025804:	429a      	cmp	r2, r3
20025806:	f000 80ef 	beq.w	200259e8 <bbm_init_table+0x1f0>
2002580a:	f8d4 2208 	ldr.w	r2, [r4, #520]	@ 0x208
2002580e:	429a      	cmp	r2, r3
20025810:	f000 80ea 	beq.w	200259e8 <bbm_init_table+0x1f0>
20025814:	6023      	str	r3, [r4, #0]
20025816:	2301      	movs	r3, #1
20025818:	6063      	str	r3, [r4, #4]
2002581a:	2300      	movs	r3, #0
2002581c:	f8df 9210 	ldr.w	r9, [pc, #528]	@ 20025a30 <bbm_init_table+0x238>
20025820:	8123      	strh	r3, [r4, #8]
20025822:	f8d9 3000 	ldr.w	r3, [r9]
20025826:	4f75      	ldr	r7, [pc, #468]	@ (200259fc <bbm_init_table+0x204>)
20025828:	3b04      	subs	r3, #4
2002582a:	f8df a208 	ldr.w	sl, [pc, #520]	@ 20025a34 <bbm_init_table+0x23c>
2002582e:	8163      	strh	r3, [r4, #10]
20025830:	683b      	ldr	r3, [r7, #0]
20025832:	f8da 5000 	ldr.w	r5, [sl]
20025836:	3b01      	subs	r3, #1
20025838:	4e71      	ldr	r6, [pc, #452]	@ (20025a00 <bbm_init_table+0x208>)
2002583a:	81a3      	strh	r3, [r4, #12]
2002583c:	81e5      	strh	r5, [r4, #14]
2002583e:	683b      	ldr	r3, [r7, #0]
20025840:	429d      	cmp	r5, r3
20025842:	db10      	blt.n	20025866 <bbm_init_table+0x6e>
20025844:	2500      	movs	r5, #0
20025846:	46a8      	mov	r8, r5
20025848:	f8df b1b4 	ldr.w	fp, [pc, #436]	@ 20025a00 <bbm_init_table+0x208>
2002584c:	f8da 6000 	ldr.w	r6, [sl]
20025850:	42b5      	cmp	r5, r6
20025852:	db20      	blt.n	20025896 <bbm_init_table+0x9e>
20025854:	8963      	ldrh	r3, [r4, #10]
20025856:	2b00      	cmp	r3, #0
20025858:	d14d      	bne.n	200258f6 <bbm_init_table+0xfe>
2002585a:	4b69      	ldr	r3, [pc, #420]	@ (20025a00 <bbm_init_table+0x208>)
2002585c:	681b      	ldr	r3, [r3, #0]
2002585e:	b10b      	cbz	r3, 20025864 <bbm_init_table+0x6c>
20025860:	4868      	ldr	r0, [pc, #416]	@ (20025a04 <bbm_init_table+0x20c>)
20025862:	4798      	blx	r3
20025864:	e7fe      	b.n	20025864 <bbm_init_table+0x6c>
20025866:	4628      	mov	r0, r5
20025868:	f7fb f9ee 	bl	20020c48 <bbm_get_bb>
2002586c:	b968      	cbnz	r0, 2002588a <bbm_init_table+0x92>
2002586e:	4628      	mov	r0, r5
20025870:	f7ff ffc0 	bl	200257f4 <port_erase_block>
20025874:	b138      	cbz	r0, 20025886 <bbm_init_table+0x8e>
20025876:	6833      	ldr	r3, [r6, #0]
20025878:	b113      	cbz	r3, 20025880 <bbm_init_table+0x88>
2002587a:	4629      	mov	r1, r5
2002587c:	4862      	ldr	r0, [pc, #392]	@ (20025a08 <bbm_init_table+0x210>)
2002587e:	4798      	blx	r3
20025880:	8963      	ldrh	r3, [r4, #10]
20025882:	3b01      	subs	r3, #1
20025884:	8163      	strh	r3, [r4, #10]
20025886:	3501      	adds	r5, #1
20025888:	e7d9      	b.n	2002583e <bbm_init_table+0x46>
2002588a:	6833      	ldr	r3, [r6, #0]
2002588c:	2b00      	cmp	r3, #0
2002588e:	d0f7      	beq.n	20025880 <bbm_init_table+0x88>
20025890:	4629      	mov	r1, r5
20025892:	485e      	ldr	r0, [pc, #376]	@ (20025a0c <bbm_init_table+0x214>)
20025894:	e7f3      	b.n	2002587e <bbm_init_table+0x86>
20025896:	4628      	mov	r0, r5
20025898:	f7fb f9d6 	bl	20020c48 <bbm_get_bb>
2002589c:	b348      	cbz	r0, 200258f2 <bbm_init_table+0xfa>
2002589e:	f8db 3000 	ldr.w	r3, [fp]
200258a2:	b113      	cbz	r3, 200258aa <bbm_init_table+0xb2>
200258a4:	4629      	mov	r1, r5
200258a6:	485a      	ldr	r0, [pc, #360]	@ (20025a10 <bbm_init_table+0x218>)
200258a8:	4798      	blx	r3
200258aa:	89a0      	ldrh	r0, [r4, #12]
200258ac:	f7fb f9cc 	bl	20020c48 <bbm_get_bb>
200258b0:	89a3      	ldrh	r3, [r4, #12]
200258b2:	4606      	mov	r6, r0
200258b4:	3b01      	subs	r3, #1
200258b6:	81a3      	strh	r3, [r4, #12]
200258b8:	8963      	ldrh	r3, [r4, #10]
200258ba:	3b01      	subs	r3, #1
200258bc:	b29b      	uxth	r3, r3
200258be:	8163      	strh	r3, [r4, #10]
200258c0:	b108      	cbz	r0, 200258c6 <bbm_init_table+0xce>
200258c2:	2b00      	cmp	r3, #0
200258c4:	d1f1      	bne.n	200258aa <bbm_init_table+0xb2>
200258c6:	f8db 3000 	ldr.w	r3, [fp]
200258ca:	b11b      	cbz	r3, 200258d4 <bbm_init_table+0xdc>
200258cc:	4642      	mov	r2, r8
200258ce:	4629      	mov	r1, r5
200258d0:	4850      	ldr	r0, [pc, #320]	@ (20025a14 <bbm_init_table+0x21c>)
200258d2:	4798      	blx	r3
200258d4:	b946      	cbnz	r6, 200258e8 <bbm_init_table+0xf0>
200258d6:	89a2      	ldrh	r2, [r4, #12]
200258d8:	f108 0306 	add.w	r3, r8, #6
200258dc:	f824 5023 	strh.w	r5, [r4, r3, lsl #2]
200258e0:	3201      	adds	r2, #1
200258e2:	eb04 0383 	add.w	r3, r4, r3, lsl #2
200258e6:	805a      	strh	r2, [r3, #2]
200258e8:	8923      	ldrh	r3, [r4, #8]
200258ea:	f108 0801 	add.w	r8, r8, #1
200258ee:	3301      	adds	r3, #1
200258f0:	8123      	strh	r3, [r4, #8]
200258f2:	3501      	adds	r5, #1
200258f4:	e7aa      	b.n	2002584c <bbm_init_table+0x54>
200258f6:	2110      	movs	r1, #16
200258f8:	483e      	ldr	r0, [pc, #248]	@ (200259f4 <bbm_init_table+0x1fc>)
200258fa:	f7ff fd75 	bl	200253e8 <bbm_crc_check>
200258fe:	f8d9 1000 	ldr.w	r1, [r9]
20025902:	6120      	str	r0, [r4, #16]
20025904:	3904      	subs	r1, #4
20025906:	0089      	lsls	r1, r1, #2
20025908:	4843      	ldr	r0, [pc, #268]	@ (20025a18 <bbm_init_table+0x220>)
2002590a:	f7ff fd6d 	bl	200253e8 <bbm_crc_check>
2002590e:	f44f 7202 	mov.w	r2, #520	@ 0x208
20025912:	4938      	ldr	r1, [pc, #224]	@ (200259f4 <bbm_init_table+0x1fc>)
20025914:	6160      	str	r0, [r4, #20]
20025916:	1888      	adds	r0, r1, r2
20025918:	f004 ff92 	bl	2002a840 <memcpy>
2002591c:	f894 320f 	ldrb.w	r3, [r4, #527]	@ 0x20f
20025920:	2110      	movs	r1, #16
20025922:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
20025926:	f884 320f 	strb.w	r3, [r4, #527]	@ 0x20f
2002592a:	483c      	ldr	r0, [pc, #240]	@ (20025a1c <bbm_init_table+0x224>)
2002592c:	f7ff fd5c 	bl	200253e8 <bbm_crc_check>
20025930:	f8c4 0218 	str.w	r0, [r4, #536]	@ 0x218
20025934:	2400      	movs	r4, #0
20025936:	f8df 9100 	ldr.w	r9, [pc, #256]	@ 20025a38 <bbm_init_table+0x240>
2002593a:	f8df 8100 	ldr.w	r8, [pc, #256]	@ 20025a3c <bbm_init_table+0x244>
2002593e:	683b      	ldr	r3, [r7, #0]
20025940:	429e      	cmp	r6, r3
20025942:	db08      	blt.n	20025956 <bbm_init_table+0x15e>
20025944:	2c03      	cmp	r4, #3
20025946:	dc30      	bgt.n	200259aa <bbm_init_table+0x1b2>
20025948:	4b2d      	ldr	r3, [pc, #180]	@ (20025a00 <bbm_init_table+0x208>)
2002594a:	681b      	ldr	r3, [r3, #0]
2002594c:	b113      	cbz	r3, 20025954 <bbm_init_table+0x15c>
2002594e:	4621      	mov	r1, r4
20025950:	4833      	ldr	r0, [pc, #204]	@ (20025a20 <bbm_init_table+0x228>)
20025952:	4798      	blx	r3
20025954:	e7fe      	b.n	20025954 <bbm_init_table+0x15c>
20025956:	4630      	mov	r0, r6
20025958:	f7fb f976 	bl	20020c48 <bbm_get_bb>
2002595c:	4605      	mov	r5, r0
2002595e:	bb10      	cbnz	r0, 200259a6 <bbm_init_table+0x1ae>
20025960:	f8d9 a000 	ldr.w	sl, [r9]
20025964:	21ff      	movs	r1, #255	@ 0xff
20025966:	4652      	mov	r2, sl
20025968:	f8d8 0000 	ldr.w	r0, [r8]
2002596c:	f004 ff4e 	bl	2002a80c <memset>
20025970:	e9cd 5501 	strd	r5, r5, [sp, #4]
20025974:	f8cd a000 	str.w	sl, [sp]
20025978:	f8d8 3000 	ldr.w	r3, [r8]
2002597c:	462a      	mov	r2, r5
2002597e:	4629      	mov	r1, r5
20025980:	4630      	mov	r0, r6
20025982:	f7fb f901 	bl	20020b88 <port_read_page>
20025986:	f8d9 3000 	ldr.w	r3, [r9]
2002598a:	4298      	cmp	r0, r3
2002598c:	d109      	bne.n	200259a2 <bbm_init_table+0x1aa>
2002598e:	f8d8 3000 	ldr.w	r3, [r8]
20025992:	681b      	ldr	r3, [r3, #0]
20025994:	3301      	adds	r3, #1
20025996:	bf01      	itttt	eq
20025998:	4b22      	ldreq	r3, [pc, #136]	@ (20025a24 <bbm_init_table+0x22c>)
2002599a:	1d22      	addeq	r2, r4, #4
2002599c:	f823 6012 	strheq.w	r6, [r3, r2, lsl #1]
200259a0:	3401      	addeq	r4, #1
200259a2:	2c03      	cmp	r4, #3
200259a4:	dc01      	bgt.n	200259aa <bbm_init_table+0x1b2>
200259a6:	3601      	adds	r6, #1
200259a8:	e7c9      	b.n	2002593e <bbm_init_table+0x146>
200259aa:	2500      	movs	r5, #0
200259ac:	4c1d      	ldr	r4, [pc, #116]	@ (20025a24 <bbm_init_table+0x22c>)
200259ae:	2000      	movs	r0, #0
200259b0:	8921      	ldrh	r1, [r4, #8]
200259b2:	f7ff fee5 	bl	20025780 <bbm_write_talbe.isra.0>
200259b6:	8923      	ldrh	r3, [r4, #8]
200259b8:	2001      	movs	r0, #1
200259ba:	8961      	ldrh	r1, [r4, #10]
200259bc:	8023      	strh	r3, [r4, #0]
200259be:	8223      	strh	r3, [r4, #16]
200259c0:	8125      	strh	r5, [r4, #8]
200259c2:	f7ff fedd 	bl	20025780 <bbm_write_talbe.isra.0>
200259c6:	8963      	ldrh	r3, [r4, #10]
200259c8:	8165      	strh	r5, [r4, #10]
200259ca:	80a3      	strh	r3, [r4, #4]
200259cc:	8263      	strh	r3, [r4, #18]
200259ce:	89a3      	ldrh	r3, [r4, #12]
200259d0:	8063      	strh	r3, [r4, #2]
200259d2:	89e3      	ldrh	r3, [r4, #14]
200259d4:	80e3      	strh	r3, [r4, #6]
200259d6:	4b0a      	ldr	r3, [pc, #40]	@ (20025a00 <bbm_init_table+0x208>)
200259d8:	681b      	ldr	r3, [r3, #0]
200259da:	b10b      	cbz	r3, 200259e0 <bbm_init_table+0x1e8>
200259dc:	4812      	ldr	r0, [pc, #72]	@ (20025a28 <bbm_init_table+0x230>)
200259de:	4798      	blx	r3
200259e0:	2000      	movs	r0, #0
200259e2:	b005      	add	sp, #20
200259e4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200259e8:	4b05      	ldr	r3, [pc, #20]	@ (20025a00 <bbm_init_table+0x208>)
200259ea:	681b      	ldr	r3, [r3, #0]
200259ec:	b10b      	cbz	r3, 200259f2 <bbm_init_table+0x1fa>
200259ee:	480f      	ldr	r0, [pc, #60]	@ (20025a2c <bbm_init_table+0x234>)
200259f0:	4798      	blx	r3
200259f2:	e7fe      	b.n	200259f2 <bbm_init_table+0x1fa>
200259f4:	2004cbf4 	.word	0x2004cbf4
200259f8:	5366424d 	.word	0x5366424d
200259fc:	2004cbe8 	.word	0x2004cbe8
20025a00:	2004cbdc 	.word	0x2004cbdc
20025a04:	2002acb6 	.word	0x2002acb6
20025a08:	2002ac44 	.word	0x2002ac44
20025a0c:	2002ac66 	.word	0x2002ac66
20025a10:	2002ac83 	.word	0x2002ac83
20025a14:	2002aca2 	.word	0x2002aca2
20025a18:	2004cc0c 	.word	0x2004cc0c
20025a1c:	2004cdfc 	.word	0x2004cdfc
20025a20:	2002acd0 	.word	0x2002acd0
20025a24:	2004d004 	.word	0x2004d004
20025a28:	2002acf7 	.word	0x2002acf7
20025a2c:	2002ad13 	.word	0x2002ad13
20025a30:	2004cbec 	.word	0x2004cbec
20025a34:	2004cbf0 	.word	0x2004cbf0
20025a38:	2004494c 	.word	0x2004494c
20025a3c:	2004cbe0 	.word	0x2004cbe0

20025a40 <sif_bbm_init>:
20025a40:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20025a44:	b087      	sub	sp, #28
20025a46:	2900      	cmp	r1, #0
20025a48:	f000 8129 	beq.w	20025c9e <sif_bbm_init+0x25e>
20025a4c:	4b95      	ldr	r3, [pc, #596]	@ (20025ca4 <sif_bbm_init+0x264>)
20025a4e:	681a      	ldr	r2, [r3, #0]
20025a50:	2a01      	cmp	r2, #1
20025a52:	d108      	bne.n	20025a66 <sif_bbm_init+0x26>
20025a54:	4b94      	ldr	r3, [pc, #592]	@ (20025ca8 <sif_bbm_init+0x268>)
20025a56:	681b      	ldr	r3, [r3, #0]
20025a58:	b10b      	cbz	r3, 20025a5e <sif_bbm_init+0x1e>
20025a5a:	4894      	ldr	r0, [pc, #592]	@ (20025cac <sif_bbm_init+0x26c>)
20025a5c:	4798      	blx	r3
20025a5e:	2000      	movs	r0, #0
20025a60:	b007      	add	sp, #28
20025a62:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20025a66:	2201      	movs	r2, #1
20025a68:	601a      	str	r2, [r3, #0]
20025a6a:	4b91      	ldr	r3, [pc, #580]	@ (20025cb0 <sif_bbm_init+0x270>)
20025a6c:	681c      	ldr	r4, [r3, #0]
20025a6e:	b904      	cbnz	r4, 20025a72 <sif_bbm_init+0x32>
20025a70:	e7fe      	b.n	20025a70 <sif_bbm_init+0x30>
20025a72:	f8df a27c 	ldr.w	sl, [pc, #636]	@ 20025cf0 <sif_bbm_init+0x2b0>
20025a76:	f8da 2000 	ldr.w	r2, [sl]
20025a7a:	b902      	cbnz	r2, 20025a7e <sif_bbm_init+0x3e>
20025a7c:	e7fe      	b.n	20025a7c <sif_bbm_init+0x3c>
20025a7e:	fbb0 f4f4 	udiv	r4, r0, r4
20025a82:	f04f 0800 	mov.w	r8, #0
20025a86:	4a8b      	ldr	r2, [pc, #556]	@ (20025cb4 <sif_bbm_init+0x274>)
20025a88:	f8df b268 	ldr.w	fp, [pc, #616]	@ 20025cf4 <sif_bbm_init+0x2b4>
20025a8c:	0963      	lsrs	r3, r4, #5
20025a8e:	f8df 9268 	ldr.w	r9, [pc, #616]	@ 20025cf8 <sif_bbm_init+0x2b8>
20025a92:	6013      	str	r3, [r2, #0]
20025a94:	f8cb 4000 	str.w	r4, [fp]
20025a98:	1ae4      	subs	r4, r4, r3
20025a9a:	4b87      	ldr	r3, [pc, #540]	@ (20025cb8 <sif_bbm_init+0x278>)
20025a9c:	2218      	movs	r2, #24
20025a9e:	f8c9 1000 	str.w	r1, [r9]
20025aa2:	4886      	ldr	r0, [pc, #536]	@ (20025cbc <sif_bbm_init+0x27c>)
20025aa4:	2100      	movs	r1, #0
20025aa6:	601c      	str	r4, [r3, #0]
20025aa8:	f004 feb0 	bl	2002a80c <memset>
20025aac:	f44f 6282 	mov.w	r2, #1040	@ 0x410
20025ab0:	2100      	movs	r1, #0
20025ab2:	4883      	ldr	r0, [pc, #524]	@ (20025cc0 <sif_bbm_init+0x280>)
20025ab4:	f004 feaa 	bl	2002a80c <memset>
20025ab8:	4647      	mov	r7, r8
20025aba:	4646      	mov	r6, r8
20025abc:	f8db 3000 	ldr.w	r3, [fp]
20025ac0:	429c      	cmp	r4, r3
20025ac2:	db02      	blt.n	20025aca <sif_bbm_init+0x8a>
20025ac4:	f04f 35ff 	mov.w	r5, #4294967295	@ 0xffffffff
20025ac8:	e064      	b.n	20025b94 <sif_bbm_init+0x154>
20025aca:	4620      	mov	r0, r4
20025acc:	f7fb f8bc 	bl	20020c48 <bbm_get_bb>
20025ad0:	4605      	mov	r5, r0
20025ad2:	b138      	cbz	r0, 20025ae4 <sif_bbm_init+0xa4>
20025ad4:	4b74      	ldr	r3, [pc, #464]	@ (20025ca8 <sif_bbm_init+0x268>)
20025ad6:	681b      	ldr	r3, [r3, #0]
20025ad8:	b113      	cbz	r3, 20025ae0 <sif_bbm_init+0xa0>
20025ada:	487a      	ldr	r0, [pc, #488]	@ (20025cc4 <sif_bbm_init+0x284>)
20025adc:	1c61      	adds	r1, r4, #1
20025ade:	4798      	blx	r3
20025ae0:	3401      	adds	r4, #1
20025ae2:	e7eb      	b.n	20025abc <sif_bbm_init+0x7c>
20025ae4:	f8da 2000 	ldr.w	r2, [sl]
20025ae8:	21ff      	movs	r1, #255	@ 0xff
20025aea:	f8d9 0000 	ldr.w	r0, [r9]
20025aee:	9205      	str	r2, [sp, #20]
20025af0:	f004 fe8c 	bl	2002a80c <memset>
20025af4:	9a05      	ldr	r2, [sp, #20]
20025af6:	e9cd 5501 	strd	r5, r5, [sp, #4]
20025afa:	9200      	str	r2, [sp, #0]
20025afc:	f8d9 3000 	ldr.w	r3, [r9]
20025b00:	462a      	mov	r2, r5
20025b02:	4629      	mov	r1, r5
20025b04:	4620      	mov	r0, r4
20025b06:	f7fb f83f 	bl	20020b88 <port_read_page>
20025b0a:	f8da 3000 	ldr.w	r3, [sl]
20025b0e:	4298      	cmp	r0, r3
20025b10:	d12e      	bne.n	20025b70 <sif_bbm_init+0x130>
20025b12:	f8d9 1000 	ldr.w	r1, [r9]
20025b16:	486c      	ldr	r0, [pc, #432]	@ (20025cc8 <sif_bbm_init+0x288>)
20025b18:	680b      	ldr	r3, [r1, #0]
20025b1a:	b2a2      	uxth	r2, r4
20025b1c:	4283      	cmp	r3, r0
20025b1e:	4b67      	ldr	r3, [pc, #412]	@ (20025cbc <sif_bbm_init+0x27c>)
20025b20:	d11f      	bne.n	20025b62 <sif_bbm_init+0x122>
20025b22:	f991 1007 	ldrsb.w	r1, [r1, #7]
20025b26:	2900      	cmp	r1, #0
20025b28:	bfb5      	itete	lt
20025b2a:	eb03 0147 	addlt.w	r1, r3, r7, lsl #1
20025b2e:	f823 2016 	strhge.w	r2, [r3, r6, lsl #1]
20025b32:	808a      	strhlt	r2, [r1, #4]
20025b34:	3601      	addge	r6, #1
20025b36:	bfb8      	it	lt
20025b38:	3701      	addlt	r7, #1
20025b3a:	eb06 0208 	add.w	r2, r6, r8
20025b3e:	443a      	add	r2, r7
20025b40:	2a03      	cmp	r2, #3
20025b42:	ddcd      	ble.n	20025ae0 <sif_bbm_init+0xa0>
20025b44:	2e00      	cmp	r6, #0
20025b46:	f000 8081 	beq.w	20025c4c <sif_bbm_init+0x20c>
20025b4a:	2f00      	cmp	r7, #0
20025b4c:	d07e      	beq.n	20025c4c <sif_bbm_init+0x20c>
20025b4e:	2e01      	cmp	r6, #1
20025b50:	d001      	beq.n	20025b56 <sif_bbm_init+0x116>
20025b52:	2f01      	cmp	r7, #1
20025b54:	d11e      	bne.n	20025b94 <sif_bbm_init+0x154>
20025b56:	8819      	ldrh	r1, [r3, #0]
20025b58:	891a      	ldrh	r2, [r3, #8]
20025b5a:	b981      	cbnz	r1, 20025b7e <sif_bbm_init+0x13e>
20025b5c:	801a      	strh	r2, [r3, #0]
20025b5e:	895a      	ldrh	r2, [r3, #10]
20025b60:	e013      	b.n	20025b8a <sif_bbm_init+0x14a>
20025b62:	f108 0104 	add.w	r1, r8, #4
20025b66:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
20025b6a:	f108 0801 	add.w	r8, r8, #1
20025b6e:	e7e4      	b.n	20025b3a <sif_bbm_init+0xfa>
20025b70:	4b4d      	ldr	r3, [pc, #308]	@ (20025ca8 <sif_bbm_init+0x268>)
20025b72:	681b      	ldr	r3, [r3, #0]
20025b74:	2b00      	cmp	r3, #0
20025b76:	d0b3      	beq.n	20025ae0 <sif_bbm_init+0xa0>
20025b78:	4854      	ldr	r0, [pc, #336]	@ (20025ccc <sif_bbm_init+0x28c>)
20025b7a:	1c61      	adds	r1, r4, #1
20025b7c:	e7af      	b.n	20025ade <sif_bbm_init+0x9e>
20025b7e:	8859      	ldrh	r1, [r3, #2]
20025b80:	b909      	cbnz	r1, 20025b86 <sif_bbm_init+0x146>
20025b82:	805a      	strh	r2, [r3, #2]
20025b84:	e7eb      	b.n	20025b5e <sif_bbm_init+0x11e>
20025b86:	2a00      	cmp	r2, #0
20025b88:	d0e9      	beq.n	20025b5e <sif_bbm_init+0x11e>
20025b8a:	8899      	ldrh	r1, [r3, #4]
20025b8c:	2900      	cmp	r1, #0
20025b8e:	d158      	bne.n	20025c42 <sif_bbm_init+0x202>
20025b90:	809a      	strh	r2, [r3, #4]
20025b92:	2502      	movs	r5, #2
20025b94:	f8df 9110 	ldr.w	r9, [pc, #272]	@ 20025ca8 <sif_bbm_init+0x268>
20025b98:	f8d9 4000 	ldr.w	r4, [r9]
20025b9c:	b124      	cbz	r4, 20025ba8 <sif_bbm_init+0x168>
20025b9e:	4643      	mov	r3, r8
20025ba0:	463a      	mov	r2, r7
20025ba2:	4631      	mov	r1, r6
20025ba4:	484a      	ldr	r0, [pc, #296]	@ (20025cd0 <sif_bbm_init+0x290>)
20025ba6:	47a0      	blx	r4
20025ba8:	f8d9 3000 	ldr.w	r3, [r9]
20025bac:	b113      	cbz	r3, 20025bb4 <sif_bbm_init+0x174>
20025bae:	4629      	mov	r1, r5
20025bb0:	4848      	ldr	r0, [pc, #288]	@ (20025cd4 <sif_bbm_init+0x294>)
20025bb2:	4798      	blx	r3
20025bb4:	f035 0002 	bics.w	r0, r5, #2
20025bb8:	d164      	bne.n	20025c84 <sif_bbm_init+0x244>
20025bba:	f7ff fcc9 	bl	20025550 <bbm_get_map_table>
20025bbe:	4605      	mov	r5, r0
20025bc0:	2001      	movs	r0, #1
20025bc2:	f7ff fcc5 	bl	20025550 <bbm_get_map_table>
20025bc6:	f8d9 6000 	ldr.w	r6, [r9]
20025bca:	4604      	mov	r4, r0
20025bcc:	b13e      	cbz	r6, 20025bde <sif_bbm_init+0x19e>
20025bce:	4a3b      	ldr	r2, [pc, #236]	@ (20025cbc <sif_bbm_init+0x27c>)
20025bd0:	4629      	mov	r1, r5
20025bd2:	8a53      	ldrh	r3, [r2, #18]
20025bd4:	9300      	str	r3, [sp, #0]
20025bd6:	8a12      	ldrh	r2, [r2, #16]
20025bd8:	4603      	mov	r3, r0
20025bda:	483f      	ldr	r0, [pc, #252]	@ (20025cd8 <sif_bbm_init+0x298>)
20025bdc:	47b0      	blx	r6
20025bde:	42a5      	cmp	r5, r4
20025be0:	4c37      	ldr	r4, [pc, #220]	@ (20025cc0 <sif_bbm_init+0x280>)
20025be2:	dd35      	ble.n	20025c50 <sif_bbm_init+0x210>
20025be4:	f44f 7202 	mov.w	r2, #520	@ 0x208
20025be8:	4621      	mov	r1, r4
20025bea:	18a0      	adds	r0, r4, r2
20025bec:	f004 fe28 	bl	2002a840 <memcpy>
20025bf0:	f894 320f 	ldrb.w	r3, [r4, #527]	@ 0x20f
20025bf4:	2110      	movs	r1, #16
20025bf6:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
20025bfa:	f884 320f 	strb.w	r3, [r4, #527]	@ 0x20f
20025bfe:	f504 7002 	add.w	r0, r4, #520	@ 0x208
20025c02:	f7ff fbf1 	bl	200253e8 <bbm_crc_check>
20025c06:	f8c4 0218 	str.w	r0, [r4, #536]	@ 0x218
20025c0a:	2001      	movs	r0, #1
20025c0c:	4b2b      	ldr	r3, [pc, #172]	@ (20025cbc <sif_bbm_init+0x27c>)
20025c0e:	8a59      	ldrh	r1, [r3, #18]
20025c10:	f7ff fdb6 	bl	20025780 <bbm_write_talbe.isra.0>
20025c14:	6822      	ldr	r2, [r4, #0]
20025c16:	4b2c      	ldr	r3, [pc, #176]	@ (20025cc8 <sif_bbm_init+0x288>)
20025c18:	429a      	cmp	r2, r3
20025c1a:	d12d      	bne.n	20025c78 <sif_bbm_init+0x238>
20025c1c:	4828      	ldr	r0, [pc, #160]	@ (20025cc0 <sif_bbm_init+0x280>)
20025c1e:	f7ff fb93 	bl	20025348 <bbm_map_check.part.0>
20025c22:	f8d9 4000 	ldr.w	r4, [r9]
20025c26:	b12c      	cbz	r4, 20025c34 <sif_bbm_init+0x1f4>
20025c28:	4b2c      	ldr	r3, [pc, #176]	@ (20025cdc <sif_bbm_init+0x29c>)
20025c2a:	4924      	ldr	r1, [pc, #144]	@ (20025cbc <sif_bbm_init+0x27c>)
20025c2c:	482c      	ldr	r0, [pc, #176]	@ (20025ce0 <sif_bbm_init+0x2a0>)
20025c2e:	f5a3 7202 	sub.w	r2, r3, #520	@ 0x208
20025c32:	47a0      	blx	r4
20025c34:	f8d9 3000 	ldr.w	r3, [r9]
20025c38:	2b00      	cmp	r3, #0
20025c3a:	f43f af10 	beq.w	20025a5e <sif_bbm_init+0x1e>
20025c3e:	4829      	ldr	r0, [pc, #164]	@ (20025ce4 <sif_bbm_init+0x2a4>)
20025c40:	e70c      	b.n	20025a5c <sif_bbm_init+0x1c>
20025c42:	88d9      	ldrh	r1, [r3, #6]
20025c44:	2900      	cmp	r1, #0
20025c46:	d1a4      	bne.n	20025b92 <sif_bbm_init+0x152>
20025c48:	80da      	strh	r2, [r3, #6]
20025c4a:	e7a2      	b.n	20025b92 <sif_bbm_init+0x152>
20025c4c:	2501      	movs	r5, #1
20025c4e:	e7a1      	b.n	20025b94 <sif_bbm_init+0x154>
20025c50:	dae0      	bge.n	20025c14 <sif_bbm_init+0x1d4>
20025c52:	f44f 7202 	mov.w	r2, #520	@ 0x208
20025c56:	4620      	mov	r0, r4
20025c58:	18a1      	adds	r1, r4, r2
20025c5a:	f004 fdf1 	bl	2002a840 <memcpy>
20025c5e:	79e3      	ldrb	r3, [r4, #7]
20025c60:	2110      	movs	r1, #16
20025c62:	f023 0380 	bic.w	r3, r3, #128	@ 0x80
20025c66:	71e3      	strb	r3, [r4, #7]
20025c68:	4620      	mov	r0, r4
20025c6a:	f7ff fbbd 	bl	200253e8 <bbm_crc_check>
20025c6e:	4b13      	ldr	r3, [pc, #76]	@ (20025cbc <sif_bbm_init+0x27c>)
20025c70:	6120      	str	r0, [r4, #16]
20025c72:	8a19      	ldrh	r1, [r3, #16]
20025c74:	2000      	movs	r0, #0
20025c76:	e7cb      	b.n	20025c10 <sif_bbm_init+0x1d0>
20025c78:	f8d9 3000 	ldr.w	r3, [r9]
20025c7c:	b10b      	cbz	r3, 20025c82 <sif_bbm_init+0x242>
20025c7e:	481a      	ldr	r0, [pc, #104]	@ (20025ce8 <sif_bbm_init+0x2a8>)
20025c80:	4798      	blx	r3
20025c82:	e7fe      	b.n	20025c82 <sif_bbm_init+0x242>
20025c84:	2d01      	cmp	r5, #1
20025c86:	d102      	bne.n	20025c8e <sif_bbm_init+0x24e>
20025c88:	f7ff fdb6 	bl	200257f8 <bbm_init_table>
20025c8c:	e7c9      	b.n	20025c22 <sif_bbm_init+0x1e2>
20025c8e:	f8d9 3000 	ldr.w	r3, [r9]
20025c92:	b11b      	cbz	r3, 20025c9c <sif_bbm_init+0x25c>
20025c94:	f04f 31ff 	mov.w	r1, #4294967295	@ 0xffffffff
20025c98:	4814      	ldr	r0, [pc, #80]	@ (20025cec <sif_bbm_init+0x2ac>)
20025c9a:	4798      	blx	r3
20025c9c:	e7fe      	b.n	20025c9c <sif_bbm_init+0x25c>
20025c9e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20025ca2:	e6dd      	b.n	20025a60 <sif_bbm_init+0x20>
20025ca4:	2004cbe4 	.word	0x2004cbe4
20025ca8:	2004cbdc 	.word	0x2004cbdc
20025cac:	2002ad27 	.word	0x2002ad27
20025cb0:	20044950 	.word	0x20044950
20025cb4:	2004cbec 	.word	0x2004cbec
20025cb8:	2004cbf0 	.word	0x2004cbf0
20025cbc:	2004d004 	.word	0x2004d004
20025cc0:	2004cbf4 	.word	0x2004cbf4
20025cc4:	2002ad55 	.word	0x2002ad55
20025cc8:	5366424d 	.word	0x5366424d
20025ccc:	2002ad61 	.word	0x2002ad61
20025cd0:	2002ad80 	.word	0x2002ad80
20025cd4:	2002ad9f 	.word	0x2002ad9f
20025cd8:	2002adb1 	.word	0x2002adb1
20025cdc:	2004cdfc 	.word	0x2004cdfc
20025ce0:	2002ae0c 	.word	0x2002ae0c
20025ce4:	2002ae30 	.word	0x2002ae30
20025ce8:	2002add5 	.word	0x2002add5
20025cec:	2002adeb 	.word	0x2002adeb
20025cf0:	2004494c 	.word	0x2004494c
20025cf4:	2004cbe8 	.word	0x2004cbe8
20025cf8:	2004cbe0 	.word	0x2004cbe0

20025cfc <bbm_set_page_size>:
20025cfc:	4b01      	ldr	r3, [pc, #4]	@ (20025d04 <bbm_set_page_size+0x8>)
20025cfe:	6018      	str	r0, [r3, #0]
20025d00:	4770      	bx	lr
20025d02:	bf00      	nop
20025d04:	2004494c 	.word	0x2004494c

20025d08 <bbm_set_blk_size>:
20025d08:	4b01      	ldr	r3, [pc, #4]	@ (20025d10 <bbm_set_blk_size+0x8>)
20025d0a:	6018      	str	r0, [r3, #0]
20025d0c:	4770      	bx	lr
20025d0e:	bf00      	nop
20025d10:	20044950 	.word	0x20044950

20025d14 <boot_images>:
20025d14:	4770      	bx	lr

20025d16 <SystemPowerOnModeInit>:
20025d16:	4770      	bx	lr

20025d18 <SystemInit>:
20025d18:	b508      	push	{r3, lr}
20025d1a:	4a10      	ldr	r2, [pc, #64]	@ (20025d5c <SystemInit+0x44>)
20025d1c:	4b10      	ldr	r3, [pc, #64]	@ (20025d60 <SystemInit+0x48>)
20025d1e:	609a      	str	r2, [r3, #8]
20025d20:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
20025d24:	f042 023f 	orr.w	r2, r2, #63	@ 0x3f
20025d28:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
20025d2c:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
20025d30:	f442 0270 	orr.w	r2, r2, #15728640	@ 0xf00000
20025d34:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
20025d38:	f7fb fbe6 	bl	20021508 <hw_preinit0>
20025d3c:	f7fa fae6 	bl	2002030c <mpu_config>
20025d40:	4b08      	ldr	r3, [pc, #32]	@ (20025d64 <SystemInit+0x4c>)
20025d42:	681b      	ldr	r3, [r3, #0]
20025d44:	07db      	lsls	r3, r3, #31
20025d46:	d401      	bmi.n	20025d4c <SystemInit+0x34>
20025d48:	f7ff ffe4 	bl	20025d14 <boot_images>
20025d4c:	f7fa fadf 	bl	2002030e <cache_enable>
20025d50:	f7ff ffe1 	bl	20025d16 <SystemPowerOnModeInit>
20025d54:	4b04      	ldr	r3, [pc, #16]	@ (20025d68 <SystemInit+0x50>)
20025d56:	4a05      	ldr	r2, [pc, #20]	@ (20025d6c <SystemInit+0x54>)
20025d58:	601a      	str	r2, [r3, #0]
20025d5a:	bd08      	pop	{r3, pc}
20025d5c:	20020000 	.word	0x20020000
20025d60:	e000ed00 	.word	0xe000ed00
20025d64:	5000b000 	.word	0x5000b000
20025d68:	20044954 	.word	0x20044954
20025d6c:	017d7840 	.word	0x017d7840

20025d70 <Reset_Handler>:
20025d70:	f8df d048 	ldr.w	sp, [pc, #72]	@ 20025dbc <AES_IRQHandler+0x2>
20025d74:	4812      	ldr	r0, [pc, #72]	@ (20025dc0 <AES_IRQHandler+0x6>)
20025d76:	f380 880a 	msr	MSPLIM, r0
20025d7a:	f7ff ffcd 	bl	20025d18 <SystemInit>
20025d7e:	4c11      	ldr	r4, [pc, #68]	@ (20025dc4 <AES_IRQHandler+0xa>)
20025d80:	4d11      	ldr	r5, [pc, #68]	@ (20025dc8 <AES_IRQHandler+0xe>)
20025d82:	42ac      	cmp	r4, r5
20025d84:	da09      	bge.n	20025d9a <Reset_Handler+0x2a>
20025d86:	6821      	ldr	r1, [r4, #0]
20025d88:	6862      	ldr	r2, [r4, #4]
20025d8a:	68a3      	ldr	r3, [r4, #8]
20025d8c:	3b04      	subs	r3, #4
20025d8e:	bfa2      	ittt	ge
20025d90:	58c8      	ldrge	r0, [r1, r3]
20025d92:	50d0      	strge	r0, [r2, r3]
20025d94:	e7fa      	bge.n	20025d8c <Reset_Handler+0x1c>
20025d96:	340c      	adds	r4, #12
20025d98:	e7f3      	b.n	20025d82 <Reset_Handler+0x12>
20025d9a:	4b0c      	ldr	r3, [pc, #48]	@ (20025dcc <AES_IRQHandler+0x12>)
20025d9c:	4c0c      	ldr	r4, [pc, #48]	@ (20025dd0 <AES_IRQHandler+0x16>)
20025d9e:	42a3      	cmp	r3, r4
20025da0:	da08      	bge.n	20025db4 <Reset_Handler+0x44>
20025da2:	6819      	ldr	r1, [r3, #0]
20025da4:	685a      	ldr	r2, [r3, #4]
20025da6:	2000      	movs	r0, #0
20025da8:	3a04      	subs	r2, #4
20025daa:	bfa4      	itt	ge
20025dac:	5088      	strge	r0, [r1, r2]
20025dae:	e7fb      	bge.n	20025da8 <Reset_Handler+0x38>
20025db0:	3308      	adds	r3, #8
20025db2:	e7f4      	b.n	20025d9e <Reset_Handler+0x2e>
20025db4:	f7fb fbce 	bl	20021554 <entry>

20025db8 <HardFault_Handler>:
20025db8:	e7fe      	b.n	20025db8 <HardFault_Handler>

20025dba <AES_IRQHandler>:
20025dba:	e7fe      	b.n	20025dba <AES_IRQHandler>
20025dbc:	20042000 	.word	0x20042000
20025dc0:	20040000 	.word	0x20040000
20025dc4:	2002c3d4 	.word	0x2002c3d4
20025dc8:	2002c3e0 	.word	0x2002c3e0
20025dcc:	2002c3e0 	.word	0x2002c3e0
20025dd0:	2002c3e8 	.word	0x2002c3e8

20025dd4 <mbedtls_md_info_from_type>:
20025dd4:	3805      	subs	r0, #5
20025dd6:	b2c0      	uxtb	r0, r0
20025dd8:	2803      	cmp	r0, #3
20025dda:	bf9a      	itte	ls
20025ddc:	4b02      	ldrls	r3, [pc, #8]	@ (20025de8 <mbedtls_md_info_from_type+0x14>)
20025dde:	f853 0020 	ldrls.w	r0, [r3, r0, lsl #2]
20025de2:	2000      	movhi	r0, #0
20025de4:	4770      	bx	lr
20025de6:	bf00      	nop
20025de8:	2002bc84 	.word	0x2002bc84

20025dec <mbedtls_md_get_size>:
20025dec:	b100      	cbz	r0, 20025df0 <mbedtls_md_get_size+0x4>
20025dee:	7a00      	ldrb	r0, [r0, #8]
20025df0:	4770      	bx	lr

20025df2 <sha224_process_wrap>:
20025df2:	f000 b8a9 	b.w	20025f48 <mbedtls_sha256_process>

20025df6 <sha224_clone_wrap>:
20025df6:	f000 b85a 	b.w	20025eae <mbedtls_sha256_clone>

20025dfa <sha224_ctx_free>:
20025dfa:	b510      	push	{r4, lr}
20025dfc:	4604      	mov	r4, r0
20025dfe:	f000 f84c 	bl	20025e9a <mbedtls_sha256_free>
20025e02:	4620      	mov	r0, r4
20025e04:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20025e08:	f004 bc3a 	b.w	2002a680 <free>

20025e0c <sha224_ctx_alloc>:
20025e0c:	b510      	push	{r4, lr}
20025e0e:	216c      	movs	r1, #108	@ 0x6c
20025e10:	2001      	movs	r0, #1
20025e12:	f004 fc19 	bl	2002a648 <calloc>
20025e16:	4604      	mov	r4, r0
20025e18:	b108      	cbz	r0, 20025e1e <sha224_ctx_alloc+0x12>
20025e1a:	f000 f83a 	bl	20025e92 <mbedtls_sha256_init>
20025e1e:	4620      	mov	r0, r4
20025e20:	bd10      	pop	{r4, pc}

20025e22 <sha224_wrap>:
20025e22:	2301      	movs	r3, #1
20025e24:	f000 bc94 	b.w	20026750 <mbedtls_sha256>

20025e28 <sha256_wrap>:
20025e28:	2300      	movs	r3, #0
20025e2a:	f000 bc91 	b.w	20026750 <mbedtls_sha256>

20025e2e <sha224_finish_wrap>:
20025e2e:	f000 bc21 	b.w	20026674 <mbedtls_sha256_finish>

20025e32 <sha224_update_wrap>:
20025e32:	f000 bc1b 	b.w	2002666c <mbedtls_sha256_update>

20025e36 <sha224_starts_wrap>:
20025e36:	2101      	movs	r1, #1
20025e38:	f000 b83e 	b.w	20025eb8 <mbedtls_sha256_starts>

20025e3c <sha256_starts_wrap>:
20025e3c:	2100      	movs	r1, #0
20025e3e:	f000 b83b 	b.w	20025eb8 <mbedtls_sha256_starts>

20025e42 <sha384_process_wrap>:
20025e42:	f000 bd8d 	b.w	20026960 <mbedtls_sha512_process>

20025e46 <sha384_clone_wrap>:
20025e46:	f000 bcf5 	b.w	20026834 <mbedtls_sha512_clone>

20025e4a <sha384_ctx_free>:
20025e4a:	b510      	push	{r4, lr}
20025e4c:	4604      	mov	r4, r0
20025e4e:	f000 fce7 	bl	20026820 <mbedtls_sha512_free>
20025e52:	4620      	mov	r0, r4
20025e54:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20025e58:	f004 bc12 	b.w	2002a680 <free>

20025e5c <sha384_ctx_alloc>:
20025e5c:	b510      	push	{r4, lr}
20025e5e:	21d8      	movs	r1, #216	@ 0xd8
20025e60:	2001      	movs	r0, #1
20025e62:	f004 fbf1 	bl	2002a648 <calloc>
20025e66:	4604      	mov	r4, r0
20025e68:	b108      	cbz	r0, 20025e6e <sha384_ctx_alloc+0x12>
20025e6a:	f000 fcd5 	bl	20026818 <mbedtls_sha512_init>
20025e6e:	4620      	mov	r0, r4
20025e70:	bd10      	pop	{r4, pc}

20025e72 <sha384_wrap>:
20025e72:	2301      	movs	r3, #1
20025e74:	f001 bbf8 	b.w	20027668 <mbedtls_sha512>

20025e78 <sha512_wrap>:
20025e78:	2300      	movs	r3, #0
20025e7a:	f001 bbf5 	b.w	20027668 <mbedtls_sha512>

20025e7e <sha384_finish_wrap>:
20025e7e:	f001 baed 	b.w	2002745c <mbedtls_sha512_finish>

20025e82 <sha384_update_wrap>:
20025e82:	f001 bae6 	b.w	20027452 <mbedtls_sha512_update>

20025e86 <sha384_starts_wrap>:
20025e86:	2101      	movs	r1, #1
20025e88:	f000 bcda 	b.w	20026840 <mbedtls_sha512_starts>

20025e8c <sha512_starts_wrap>:
20025e8c:	2100      	movs	r1, #0
20025e8e:	f000 bcd7 	b.w	20026840 <mbedtls_sha512_starts>

20025e92 <mbedtls_sha256_init>:
20025e92:	226c      	movs	r2, #108	@ 0x6c
20025e94:	2100      	movs	r1, #0
20025e96:	f004 bcb9 	b.w	2002a80c <memset>

20025e9a <mbedtls_sha256_free>:
20025e9a:	b138      	cbz	r0, 20025eac <mbedtls_sha256_free+0x12>
20025e9c:	2100      	movs	r1, #0
20025e9e:	f100 036c 	add.w	r3, r0, #108	@ 0x6c
20025ea2:	4602      	mov	r2, r0
20025ea4:	3001      	adds	r0, #1
20025ea6:	4298      	cmp	r0, r3
20025ea8:	7011      	strb	r1, [r2, #0]
20025eaa:	d1fa      	bne.n	20025ea2 <mbedtls_sha256_free+0x8>
20025eac:	4770      	bx	lr

20025eae <mbedtls_sha256_clone>:
20025eae:	b508      	push	{r3, lr}
20025eb0:	226c      	movs	r2, #108	@ 0x6c
20025eb2:	f004 fcc5 	bl	2002a840 <memcpy>
20025eb6:	bd08      	pop	{r3, pc}

20025eb8 <mbedtls_sha256_starts>:
20025eb8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20025ebc:	b1c1      	cbz	r1, 20025ef0 <mbedtls_sha256_starts+0x38>
20025ebe:	f8df e078 	ldr.w	lr, [pc, #120]	@ 20025f38 <mbedtls_sha256_starts+0x80>
20025ec2:	f8df c078 	ldr.w	ip, [pc, #120]	@ 20025f3c <mbedtls_sha256_starts+0x84>
20025ec6:	4f10      	ldr	r7, [pc, #64]	@ (20025f08 <mbedtls_sha256_starts+0x50>)
20025ec8:	4e10      	ldr	r6, [pc, #64]	@ (20025f0c <mbedtls_sha256_starts+0x54>)
20025eca:	4d11      	ldr	r5, [pc, #68]	@ (20025f10 <mbedtls_sha256_starts+0x58>)
20025ecc:	4c11      	ldr	r4, [pc, #68]	@ (20025f14 <mbedtls_sha256_starts+0x5c>)
20025ece:	4a12      	ldr	r2, [pc, #72]	@ (20025f18 <mbedtls_sha256_starts+0x60>)
20025ed0:	4b12      	ldr	r3, [pc, #72]	@ (20025f1c <mbedtls_sha256_starts+0x64>)
20025ed2:	f04f 0800 	mov.w	r8, #0
20025ed6:	e9c0 ec02 	strd	lr, ip, [r0, #8]
20025eda:	e9c0 8800 	strd	r8, r8, [r0]
20025ede:	e9c0 7604 	strd	r7, r6, [r0, #16]
20025ee2:	e9c0 5406 	strd	r5, r4, [r0, #24]
20025ee6:	e9c0 2308 	strd	r2, r3, [r0, #32]
20025eea:	6681      	str	r1, [r0, #104]	@ 0x68
20025eec:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20025ef0:	f8df e04c 	ldr.w	lr, [pc, #76]	@ 20025f40 <mbedtls_sha256_starts+0x88>
20025ef4:	f8df c04c 	ldr.w	ip, [pc, #76]	@ 20025f44 <mbedtls_sha256_starts+0x8c>
20025ef8:	4f09      	ldr	r7, [pc, #36]	@ (20025f20 <mbedtls_sha256_starts+0x68>)
20025efa:	4e0a      	ldr	r6, [pc, #40]	@ (20025f24 <mbedtls_sha256_starts+0x6c>)
20025efc:	4d0a      	ldr	r5, [pc, #40]	@ (20025f28 <mbedtls_sha256_starts+0x70>)
20025efe:	4c0b      	ldr	r4, [pc, #44]	@ (20025f2c <mbedtls_sha256_starts+0x74>)
20025f00:	4a0b      	ldr	r2, [pc, #44]	@ (20025f30 <mbedtls_sha256_starts+0x78>)
20025f02:	4b0c      	ldr	r3, [pc, #48]	@ (20025f34 <mbedtls_sha256_starts+0x7c>)
20025f04:	e7e5      	b.n	20025ed2 <mbedtls_sha256_starts+0x1a>
20025f06:	bf00      	nop
20025f08:	3070dd17 	.word	0x3070dd17
20025f0c:	f70e5939 	.word	0xf70e5939
20025f10:	ffc00b31 	.word	0xffc00b31
20025f14:	68581511 	.word	0x68581511
20025f18:	64f98fa7 	.word	0x64f98fa7
20025f1c:	befa4fa4 	.word	0xbefa4fa4
20025f20:	3c6ef372 	.word	0x3c6ef372
20025f24:	a54ff53a 	.word	0xa54ff53a
20025f28:	510e527f 	.word	0x510e527f
20025f2c:	9b05688c 	.word	0x9b05688c
20025f30:	1f83d9ab 	.word	0x1f83d9ab
20025f34:	5be0cd19 	.word	0x5be0cd19
20025f38:	c1059ed8 	.word	0xc1059ed8
20025f3c:	367cd507 	.word	0x367cd507
20025f40:	6a09e667 	.word	0x6a09e667
20025f44:	bb67ae85 	.word	0xbb67ae85

20025f48 <mbedtls_sha256_process>:
20025f48:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20025f4c:	b0cf      	sub	sp, #316	@ 0x13c
20025f4e:	aa06      	add	r2, sp, #24
20025f50:	460b      	mov	r3, r1
20025f52:	4616      	mov	r6, r2
20025f54:	9004      	str	r0, [sp, #16]
20025f56:	f100 0408 	add.w	r4, r0, #8
20025f5a:	f100 0728 	add.w	r7, r0, #40	@ 0x28
20025f5e:	4635      	mov	r5, r6
20025f60:	6820      	ldr	r0, [r4, #0]
20025f62:	6861      	ldr	r1, [r4, #4]
20025f64:	3408      	adds	r4, #8
20025f66:	c503      	stmia	r5!, {r0, r1}
20025f68:	42bc      	cmp	r4, r7
20025f6a:	462e      	mov	r6, r5
20025f6c:	d1f7      	bne.n	20025f5e <mbedtls_sha256_process+0x16>
20025f6e:	f10d 0a38 	add.w	sl, sp, #56	@ 0x38
20025f72:	4619      	mov	r1, r3
20025f74:	4650      	mov	r0, sl
20025f76:	f103 0440 	add.w	r4, r3, #64	@ 0x40
20025f7a:	784b      	ldrb	r3, [r1, #1]
20025f7c:	780d      	ldrb	r5, [r1, #0]
20025f7e:	041b      	lsls	r3, r3, #16
20025f80:	ea43 6305 	orr.w	r3, r3, r5, lsl #24
20025f84:	78cd      	ldrb	r5, [r1, #3]
20025f86:	3104      	adds	r1, #4
20025f88:	432b      	orrs	r3, r5
20025f8a:	f811 5c02 	ldrb.w	r5, [r1, #-2]
20025f8e:	428c      	cmp	r4, r1
20025f90:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
20025f94:	f840 3b04 	str.w	r3, [r0], #4
20025f98:	d1ef      	bne.n	20025f7a <mbedtls_sha256_process+0x32>
20025f9a:	4996      	ldr	r1, [pc, #600]	@ (200261f4 <mbedtls_sha256_process+0x2ac>)
20025f9c:	46d4      	mov	ip, sl
20025f9e:	e9d2 e705 	ldrd	lr, r7, [r2, #20]
20025fa2:	e9d2 9600 	ldrd	r9, r6, [r2]
20025fa6:	460d      	mov	r5, r1
20025fa8:	9100      	str	r1, [sp, #0]
20025faa:	f8d2 801c 	ldr.w	r8, [r2, #28]
20025fae:	f8d2 b010 	ldr.w	fp, [r2, #16]
20025fb2:	e9d2 3202 	ldrd	r3, r2, [r2, #8]
20025fb6:	6829      	ldr	r1, [r5, #0]
20025fb8:	f8dc 0000 	ldr.w	r0, [ip]
20025fbc:	ea4f 24fb 	mov.w	r4, fp, ror #11
20025fc0:	ea84 14bb 	eor.w	r4, r4, fp, ror #6
20025fc4:	4401      	add	r1, r0
20025fc6:	ea87 000e 	eor.w	r0, r7, lr
20025fca:	ea84 647b 	eor.w	r4, r4, fp, ror #25
20025fce:	ea00 000b 	and.w	r0, r0, fp
20025fd2:	4078      	eors	r0, r7
20025fd4:	4421      	add	r1, r4
20025fd6:	4401      	add	r1, r0
20025fd8:	4441      	add	r1, r8
20025fda:	ea4f 3879 	mov.w	r8, r9, ror #13
20025fde:	ea88 08b9 	eor.w	r8, r8, r9, ror #2
20025fe2:	ea88 58b9 	eor.w	r8, r8, r9, ror #22
20025fe6:	440a      	add	r2, r1
20025fe8:	4488      	add	r8, r1
20025fea:	ea49 0106 	orr.w	r1, r9, r6
20025fee:	ea09 0006 	and.w	r0, r9, r6
20025ff2:	4019      	ands	r1, r3
20025ff4:	4301      	orrs	r1, r0
20025ff6:	4488      	add	r8, r1
20025ff8:	f8dc 0004 	ldr.w	r0, [ip, #4]
20025ffc:	6869      	ldr	r1, [r5, #4]
20025ffe:	ea4f 3478 	mov.w	r4, r8, ror #13
20026002:	4401      	add	r1, r0
20026004:	ea8b 000e 	eor.w	r0, fp, lr
20026008:	4010      	ands	r0, r2
2002600a:	ea80 000e 	eor.w	r0, r0, lr
2002600e:	4439      	add	r1, r7
20026010:	4401      	add	r1, r0
20026012:	ea4f 20f2 	mov.w	r0, r2, ror #11
20026016:	ea80 10b2 	eor.w	r0, r0, r2, ror #6
2002601a:	ea80 6072 	eor.w	r0, r0, r2, ror #25
2002601e:	ea84 04b8 	eor.w	r4, r4, r8, ror #2
20026022:	4401      	add	r1, r0
20026024:	ea84 54b8 	eor.w	r4, r4, r8, ror #22
20026028:	440b      	add	r3, r1
2002602a:	440c      	add	r4, r1
2002602c:	ea48 0109 	orr.w	r1, r8, r9
20026030:	ea08 0009 	and.w	r0, r8, r9
20026034:	4031      	ands	r1, r6
20026036:	4301      	orrs	r1, r0
20026038:	440c      	add	r4, r1
2002603a:	f8dc 0008 	ldr.w	r0, [ip, #8]
2002603e:	68a9      	ldr	r1, [r5, #8]
20026040:	ea82 0703 	eor.w	r7, r2, r3
20026044:	4401      	add	r1, r0
20026046:	ea82 000b 	eor.w	r0, r2, fp
2002604a:	4018      	ands	r0, r3
2002604c:	ea80 000b 	eor.w	r0, r0, fp
20026050:	4471      	add	r1, lr
20026052:	4401      	add	r1, r0
20026054:	ea4f 20f3 	mov.w	r0, r3, ror #11
20026058:	ea80 10b3 	eor.w	r0, r0, r3, ror #6
2002605c:	ea80 6073 	eor.w	r0, r0, r3, ror #25
20026060:	4401      	add	r1, r0
20026062:	ea4f 3074 	mov.w	r0, r4, ror #13
20026066:	ea80 00b4 	eor.w	r0, r0, r4, ror #2
2002606a:	ea80 50b4 	eor.w	r0, r0, r4, ror #22
2002606e:	eb06 0e01 	add.w	lr, r6, r1
20026072:	4408      	add	r0, r1
20026074:	ea48 0104 	orr.w	r1, r8, r4
20026078:	ea08 0604 	and.w	r6, r8, r4
2002607c:	ea01 0109 	and.w	r1, r1, r9
20026080:	4331      	orrs	r1, r6
20026082:	4408      	add	r0, r1
20026084:	f8dc 600c 	ldr.w	r6, [ip, #12]
20026088:	68e9      	ldr	r1, [r5, #12]
2002608a:	ea07 070e 	and.w	r7, r7, lr
2002608e:	440e      	add	r6, r1
20026090:	ea4f 21fe 	mov.w	r1, lr, ror #11
20026094:	4057      	eors	r7, r2
20026096:	445e      	add	r6, fp
20026098:	ea81 11be 	eor.w	r1, r1, lr, ror #6
2002609c:	ea81 617e 	eor.w	r1, r1, lr, ror #25
200260a0:	443e      	add	r6, r7
200260a2:	440e      	add	r6, r1
200260a4:	ea4f 3170 	mov.w	r1, r0, ror #13
200260a8:	ea81 01b0 	eor.w	r1, r1, r0, ror #2
200260ac:	ea81 51b0 	eor.w	r1, r1, r0, ror #22
200260b0:	44b1      	add	r9, r6
200260b2:	4431      	add	r1, r6
200260b4:	ea44 0600 	orr.w	r6, r4, r0
200260b8:	ea04 0700 	and.w	r7, r4, r0
200260bc:	ea06 0608 	and.w	r6, r6, r8
200260c0:	433e      	orrs	r6, r7
200260c2:	4431      	add	r1, r6
200260c4:	f8dc 7010 	ldr.w	r7, [ip, #16]
200260c8:	692e      	ldr	r6, [r5, #16]
200260ca:	3520      	adds	r5, #32
200260cc:	443e      	add	r6, r7
200260ce:	4416      	add	r6, r2
200260d0:	ea83 020e 	eor.w	r2, r3, lr
200260d4:	ea02 0209 	and.w	r2, r2, r9
200260d8:	405a      	eors	r2, r3
200260da:	4416      	add	r6, r2
200260dc:	ea4f 22f9 	mov.w	r2, r9, ror #11
200260e0:	ea82 12b9 	eor.w	r2, r2, r9, ror #6
200260e4:	ea82 6279 	eor.w	r2, r2, r9, ror #25
200260e8:	4416      	add	r6, r2
200260ea:	ea4f 3271 	mov.w	r2, r1, ror #13
200260ee:	ea82 02b1 	eor.w	r2, r2, r1, ror #2
200260f2:	ea82 52b1 	eor.w	r2, r2, r1, ror #22
200260f6:	44b0      	add	r8, r6
200260f8:	4432      	add	r2, r6
200260fa:	ea40 0601 	orr.w	r6, r0, r1
200260fe:	ea00 0701 	and.w	r7, r0, r1
20026102:	4026      	ands	r6, r4
20026104:	433e      	orrs	r6, r7
20026106:	4432      	add	r2, r6
20026108:	f8dc 7014 	ldr.w	r7, [ip, #20]
2002610c:	f855 6c0c 	ldr.w	r6, [r5, #-12]
20026110:	f10c 0c20 	add.w	ip, ip, #32
20026114:	443e      	add	r6, r7
20026116:	441e      	add	r6, r3
20026118:	ea8e 0309 	eor.w	r3, lr, r9
2002611c:	ea03 0308 	and.w	r3, r3, r8
20026120:	ea83 030e 	eor.w	r3, r3, lr
20026124:	441e      	add	r6, r3
20026126:	ea4f 23f8 	mov.w	r3, r8, ror #11
2002612a:	ea83 13b8 	eor.w	r3, r3, r8, ror #6
2002612e:	ea83 6378 	eor.w	r3, r3, r8, ror #25
20026132:	441e      	add	r6, r3
20026134:	ea4f 3372 	mov.w	r3, r2, ror #13
20026138:	ea83 03b2 	eor.w	r3, r3, r2, ror #2
2002613c:	19a7      	adds	r7, r4, r6
2002613e:	ea83 53b2 	eor.w	r3, r3, r2, ror #22
20026142:	ea41 0402 	orr.w	r4, r1, r2
20026146:	4433      	add	r3, r6
20026148:	4004      	ands	r4, r0
2002614a:	ea01 0602 	and.w	r6, r1, r2
2002614e:	4334      	orrs	r4, r6
20026150:	4423      	add	r3, r4
20026152:	f85c 6c08 	ldr.w	r6, [ip, #-8]
20026156:	f855 4c08 	ldr.w	r4, [r5, #-8]
2002615a:	4434      	add	r4, r6
2002615c:	ea89 0608 	eor.w	r6, r9, r8
20026160:	403e      	ands	r6, r7
20026162:	ea86 0609 	eor.w	r6, r6, r9
20026166:	4474      	add	r4, lr
20026168:	4434      	add	r4, r6
2002616a:	ea4f 26f7 	mov.w	r6, r7, ror #11
2002616e:	ea86 16b7 	eor.w	r6, r6, r7, ror #6
20026172:	ea86 6677 	eor.w	r6, r6, r7, ror #25
20026176:	4434      	add	r4, r6
20026178:	eb00 0e04 	add.w	lr, r0, r4
2002617c:	ea4f 3073 	mov.w	r0, r3, ror #13
20026180:	ea80 00b3 	eor.w	r0, r0, r3, ror #2
20026184:	ea80 50b3 	eor.w	r0, r0, r3, ror #22
20026188:	4420      	add	r0, r4
2002618a:	ea42 0403 	orr.w	r4, r2, r3
2002618e:	400c      	ands	r4, r1
20026190:	ea02 0603 	and.w	r6, r2, r3
20026194:	4334      	orrs	r4, r6
20026196:	1906      	adds	r6, r0, r4
20026198:	f855 0c04 	ldr.w	r0, [r5, #-4]
2002619c:	f85c 4c04 	ldr.w	r4, [ip, #-4]
200261a0:	4420      	add	r0, r4
200261a2:	ea88 0407 	eor.w	r4, r8, r7
200261a6:	ea04 040e 	and.w	r4, r4, lr
200261aa:	4448      	add	r0, r9
200261ac:	ea84 0408 	eor.w	r4, r4, r8
200261b0:	4420      	add	r0, r4
200261b2:	ea4f 24fe 	mov.w	r4, lr, ror #11
200261b6:	ea84 14be 	eor.w	r4, r4, lr, ror #6
200261ba:	ea84 647e 	eor.w	r4, r4, lr, ror #25
200261be:	4420      	add	r0, r4
200261c0:	eb01 0b00 	add.w	fp, r1, r0
200261c4:	ea4f 3176 	mov.w	r1, r6, ror #13
200261c8:	ea81 01b6 	eor.w	r1, r1, r6, ror #2
200261cc:	ea81 51b6 	eor.w	r1, r1, r6, ror #22
200261d0:	4401      	add	r1, r0
200261d2:	ea43 0006 	orr.w	r0, r3, r6
200261d6:	4010      	ands	r0, r2
200261d8:	ea03 0406 	and.w	r4, r3, r6
200261dc:	4320      	orrs	r0, r4
200261de:	eb01 0900 	add.w	r9, r1, r0
200261e2:	4905      	ldr	r1, [pc, #20]	@ (200261f8 <mbedtls_sha256_process+0x2b0>)
200261e4:	42a9      	cmp	r1, r5
200261e6:	f47f aee6 	bne.w	20025fb6 <mbedtls_sha256_process+0x6e>
200261ea:	f10a 01c0 	add.w	r1, sl, #192	@ 0xc0
200261ee:	9105      	str	r1, [sp, #20]
200261f0:	e004      	b.n	200261fc <mbedtls_sha256_process+0x2b4>
200261f2:	bf00      	nop
200261f4:	2002bd94 	.word	0x2002bd94
200261f8:	2002bdd4 	.word	0x2002bdd4
200261fc:	f8da 1038 	ldr.w	r1, [sl, #56]	@ 0x38
20026200:	f8da 5004 	ldr.w	r5, [sl, #4]
20026204:	ea4f 44f1 	mov.w	r4, r1, ror #19
20026208:	ea84 4471 	eor.w	r4, r4, r1, ror #17
2002620c:	f8da 0000 	ldr.w	r0, [sl]
20026210:	ea84 2491 	eor.w	r4, r4, r1, lsr #10
20026214:	f8da 1024 	ldr.w	r1, [sl, #36]	@ 0x24
20026218:	f10a 0a20 	add.w	sl, sl, #32
2002621c:	4401      	add	r1, r0
2002621e:	ea4f 40b5 	mov.w	r0, r5, ror #18
20026222:	ea80 10f5 	eor.w	r0, r0, r5, ror #7
20026226:	ea80 00d5 	eor.w	r0, r0, r5, lsr #3
2002622a:	4421      	add	r1, r4
2002622c:	4401      	add	r1, r0
2002622e:	9103      	str	r1, [sp, #12]
20026230:	ea87 000e 	eor.w	r0, r7, lr
20026234:	9900      	ldr	r1, [sp, #0]
20026236:	ea4f 24fb 	mov.w	r4, fp, ror #11
2002623a:	ea84 14bb 	eor.w	r4, r4, fp, ror #6
2002623e:	ea00 000b 	and.w	r0, r0, fp
20026242:	ea84 647b 	eor.w	r4, r4, fp, ror #25
20026246:	6c09      	ldr	r1, [r1, #64]	@ 0x40
20026248:	4078      	eors	r0, r7
2002624a:	4420      	add	r0, r4
2002624c:	4401      	add	r1, r0
2002624e:	9803      	ldr	r0, [sp, #12]
20026250:	ea4f 3479 	mov.w	r4, r9, ror #13
20026254:	4401      	add	r1, r0
20026256:	4441      	add	r1, r8
20026258:	eb02 0801 	add.w	r8, r2, r1
2002625c:	ea49 0206 	orr.w	r2, r9, r6
20026260:	f8ca 0020 	str.w	r0, [sl, #32]
20026264:	ea84 04b9 	eor.w	r4, r4, r9, ror #2
20026268:	ea09 0006 	and.w	r0, r9, r6
2002626c:	401a      	ands	r2, r3
2002626e:	4302      	orrs	r2, r0
20026270:	ea84 54b9 	eor.w	r4, r4, r9, ror #22
20026274:	4414      	add	r4, r2
20026276:	f8da 201c 	ldr.w	r2, [sl, #28]
2002627a:	440c      	add	r4, r1
2002627c:	ea4f 4cf2 	mov.w	ip, r2, ror #19
20026280:	ea8c 4c72 	eor.w	ip, ip, r2, ror #17
20026284:	f85a 1c18 	ldr.w	r1, [sl, #-24]
20026288:	ea8c 2c92 	eor.w	ip, ip, r2, lsr #10
2002628c:	f8da 2008 	ldr.w	r2, [sl, #8]
20026290:	18a8      	adds	r0, r5, r2
20026292:	ea4f 42b1 	mov.w	r2, r1, ror #18
20026296:	ea82 12f1 	eor.w	r2, r2, r1, ror #7
2002629a:	ea82 02d1 	eor.w	r2, r2, r1, lsr #3
2002629e:	4460      	add	r0, ip
200262a0:	4410      	add	r0, r2
200262a2:	9a00      	ldr	r2, [sp, #0]
200262a4:	ea8b 050e 	eor.w	r5, fp, lr
200262a8:	6c52      	ldr	r2, [r2, #68]	@ 0x44
200262aa:	ea05 0508 	and.w	r5, r5, r8
200262ae:	443a      	add	r2, r7
200262b0:	4402      	add	r2, r0
200262b2:	ea85 050e 	eor.w	r5, r5, lr
200262b6:	4415      	add	r5, r2
200262b8:	ea4f 22f8 	mov.w	r2, r8, ror #11
200262bc:	ea82 12b8 	eor.w	r2, r2, r8, ror #6
200262c0:	ea82 6278 	eor.w	r2, r2, r8, ror #25
200262c4:	442a      	add	r2, r5
200262c6:	4413      	add	r3, r2
200262c8:	9301      	str	r3, [sp, #4]
200262ca:	ea49 0504 	orr.w	r5, r9, r4
200262ce:	ea4f 3374 	mov.w	r3, r4, ror #13
200262d2:	ea09 0704 	and.w	r7, r9, r4
200262d6:	ea83 03b4 	eor.w	r3, r3, r4, ror #2
200262da:	4035      	ands	r5, r6
200262dc:	433d      	orrs	r5, r7
200262de:	ea83 53b4 	eor.w	r3, r3, r4, ror #22
200262e2:	442b      	add	r3, r5
200262e4:	4413      	add	r3, r2
200262e6:	9a03      	ldr	r2, [sp, #12]
200262e8:	f85a 5c14 	ldr.w	r5, [sl, #-20]
200262ec:	ea4f 4cf2 	mov.w	ip, r2, ror #19
200262f0:	ea8c 4c72 	eor.w	ip, ip, r2, ror #17
200262f4:	ea8c 2c92 	eor.w	ip, ip, r2, lsr #10
200262f8:	f8da 200c 	ldr.w	r2, [sl, #12]
200262fc:	f8ca 0024 	str.w	r0, [sl, #36]	@ 0x24
20026300:	188f      	adds	r7, r1, r2
20026302:	ea4f 42b5 	mov.w	r2, r5, ror #18
20026306:	ea82 12f5 	eor.w	r2, r2, r5, ror #7
2002630a:	ea82 02d5 	eor.w	r2, r2, r5, lsr #3
2002630e:	4467      	add	r7, ip
20026310:	4417      	add	r7, r2
20026312:	9a01      	ldr	r2, [sp, #4]
20026314:	ea8b 0108 	eor.w	r1, fp, r8
20026318:	4011      	ands	r1, r2
2002631a:	9a00      	ldr	r2, [sp, #0]
2002631c:	ea81 010b 	eor.w	r1, r1, fp
20026320:	6c92      	ldr	r2, [r2, #72]	@ 0x48
20026322:	f8ca 7028 	str.w	r7, [sl, #40]	@ 0x28
20026326:	4472      	add	r2, lr
20026328:	443a      	add	r2, r7
2002632a:	eb01 0c02 	add.w	ip, r1, r2
2002632e:	9a01      	ldr	r2, [sp, #4]
20026330:	9901      	ldr	r1, [sp, #4]
20026332:	ea4f 22f2 	mov.w	r2, r2, ror #11
20026336:	ea82 12b1 	eor.w	r2, r2, r1, ror #6
2002633a:	ea82 6271 	eor.w	r2, r2, r1, ror #25
2002633e:	4462      	add	r2, ip
20026340:	18b1      	adds	r1, r6, r2
20026342:	9102      	str	r1, [sp, #8]
20026344:	ea44 0603 	orr.w	r6, r4, r3
20026348:	ea4f 3173 	mov.w	r1, r3, ror #13
2002634c:	ea04 0c03 	and.w	ip, r4, r3
20026350:	ea81 01b3 	eor.w	r1, r1, r3, ror #2
20026354:	ea06 0609 	and.w	r6, r6, r9
20026358:	ea46 060c 	orr.w	r6, r6, ip
2002635c:	ea81 51b3 	eor.w	r1, r1, r3, ror #22
20026360:	4431      	add	r1, r6
20026362:	4411      	add	r1, r2
20026364:	ea4f 42f0 	mov.w	r2, r0, ror #19
20026368:	ea82 4270 	eor.w	r2, r2, r0, ror #17
2002636c:	f85a 6c10 	ldr.w	r6, [sl, #-16]
20026370:	ea82 2090 	eor.w	r0, r2, r0, lsr #10
20026374:	f8da 2010 	ldr.w	r2, [sl, #16]
20026378:	ea03 0e01 	and.w	lr, r3, r1
2002637c:	4415      	add	r5, r2
2002637e:	ea4f 42b6 	mov.w	r2, r6, ror #18
20026382:	ea82 12f6 	eor.w	r2, r2, r6, ror #7
20026386:	ea82 02d6 	eor.w	r2, r2, r6, lsr #3
2002638a:	4405      	add	r5, r0
2002638c:	4415      	add	r5, r2
2002638e:	9a01      	ldr	r2, [sp, #4]
20026390:	ea88 0002 	eor.w	r0, r8, r2
20026394:	9a02      	ldr	r2, [sp, #8]
20026396:	4010      	ands	r0, r2
20026398:	9a00      	ldr	r2, [sp, #0]
2002639a:	ea80 0008 	eor.w	r0, r0, r8
2002639e:	6cd2      	ldr	r2, [r2, #76]	@ 0x4c
200263a0:	f8ca 502c 	str.w	r5, [sl, #44]	@ 0x2c
200263a4:	445a      	add	r2, fp
200263a6:	442a      	add	r2, r5
200263a8:	eb00 0c02 	add.w	ip, r0, r2
200263ac:	9a02      	ldr	r2, [sp, #8]
200263ae:	9802      	ldr	r0, [sp, #8]
200263b0:	ea4f 22f2 	mov.w	r2, r2, ror #11
200263b4:	ea82 12b0 	eor.w	r2, r2, r0, ror #6
200263b8:	ea82 6270 	eor.w	r2, r2, r0, ror #25
200263bc:	4462      	add	r2, ip
200263be:	ea4f 3071 	mov.w	r0, r1, ror #13
200263c2:	ea43 0c01 	orr.w	ip, r3, r1
200263c6:	ea80 00b1 	eor.w	r0, r0, r1, ror #2
200263ca:	ea0c 0c04 	and.w	ip, ip, r4
200263ce:	ea4c 0c0e 	orr.w	ip, ip, lr
200263d2:	ea80 50b1 	eor.w	r0, r0, r1, ror #22
200263d6:	4460      	add	r0, ip
200263d8:	4410      	add	r0, r2
200263da:	4491      	add	r9, r2
200263dc:	ea4f 42f7 	mov.w	r2, r7, ror #19
200263e0:	ea82 4277 	eor.w	r2, r2, r7, ror #17
200263e4:	f85a cc0c 	ldr.w	ip, [sl, #-12]
200263e8:	ea82 2797 	eor.w	r7, r2, r7, lsr #10
200263ec:	f8da 2014 	ldr.w	r2, [sl, #20]
200263f0:	ea01 0e00 	and.w	lr, r1, r0
200263f4:	4416      	add	r6, r2
200263f6:	ea4f 42bc 	mov.w	r2, ip, ror #18
200263fa:	ea82 12fc 	eor.w	r2, r2, ip, ror #7
200263fe:	ea82 02dc 	eor.w	r2, r2, ip, lsr #3
20026402:	443e      	add	r6, r7
20026404:	4416      	add	r6, r2
20026406:	e9dd 2701 	ldrd	r2, r7, [sp, #4]
2002640a:	4057      	eors	r7, r2
2002640c:	ea07 0709 	and.w	r7, r7, r9
20026410:	4057      	eors	r7, r2
20026412:	9a00      	ldr	r2, [sp, #0]
20026414:	f8ca 6030 	str.w	r6, [sl, #48]	@ 0x30
20026418:	6d12      	ldr	r2, [r2, #80]	@ 0x50
2002641a:	4432      	add	r2, r6
2002641c:	4442      	add	r2, r8
2002641e:	443a      	add	r2, r7
20026420:	ea4f 27f9 	mov.w	r7, r9, ror #11
20026424:	ea87 17b9 	eor.w	r7, r7, r9, ror #6
20026428:	ea87 6779 	eor.w	r7, r7, r9, ror #25
2002642c:	4417      	add	r7, r2
2002642e:	eb04 0807 	add.w	r8, r4, r7
20026432:	ea4f 3270 	mov.w	r2, r0, ror #13
20026436:	ea41 0400 	orr.w	r4, r1, r0
2002643a:	ea82 02b0 	eor.w	r2, r2, r0, ror #2
2002643e:	401c      	ands	r4, r3
20026440:	ea44 040e 	orr.w	r4, r4, lr
20026444:	ea82 52b0 	eor.w	r2, r2, r0, ror #22
20026448:	4422      	add	r2, r4
2002644a:	ea4f 44f5 	mov.w	r4, r5, ror #19
2002644e:	ea84 4475 	eor.w	r4, r4, r5, ror #17
20026452:	ea84 2495 	eor.w	r4, r4, r5, lsr #10
20026456:	f8da 5018 	ldr.w	r5, [sl, #24]
2002645a:	f85a ec08 	ldr.w	lr, [sl, #-8]
2002645e:	4465      	add	r5, ip
20026460:	4425      	add	r5, r4
20026462:	ea4f 44be 	mov.w	r4, lr, ror #18
20026466:	ea84 14fe 	eor.w	r4, r4, lr, ror #7
2002646a:	ea84 04de 	eor.w	r4, r4, lr, lsr #3
2002646e:	4425      	add	r5, r4
20026470:	9c02      	ldr	r4, [sp, #8]
20026472:	443a      	add	r2, r7
20026474:	ea84 0709 	eor.w	r7, r4, r9
20026478:	ea07 0708 	and.w	r7, r7, r8
2002647c:	ea87 0c04 	eor.w	ip, r7, r4
20026480:	9c00      	ldr	r4, [sp, #0]
20026482:	9f01      	ldr	r7, [sp, #4]
20026484:	6d64      	ldr	r4, [r4, #84]	@ 0x54
20026486:	ea00 0b02 	and.w	fp, r0, r2
2002648a:	442c      	add	r4, r5
2002648c:	443c      	add	r4, r7
2002648e:	eb0c 0704 	add.w	r7, ip, r4
20026492:	ea4f 24f8 	mov.w	r4, r8, ror #11
20026496:	ea84 14b8 	eor.w	r4, r4, r8, ror #6
2002649a:	ea84 6478 	eor.w	r4, r4, r8, ror #25
2002649e:	443c      	add	r4, r7
200264a0:	191f      	adds	r7, r3, r4
200264a2:	ea40 0c02 	orr.w	ip, r0, r2
200264a6:	ea4f 3372 	mov.w	r3, r2, ror #13
200264aa:	ea0c 0c01 	and.w	ip, ip, r1
200264ae:	ea83 03b2 	eor.w	r3, r3, r2, ror #2
200264b2:	ea4c 0c0b 	orr.w	ip, ip, fp
200264b6:	ea83 53b2 	eor.w	r3, r3, r2, ror #22
200264ba:	4463      	add	r3, ip
200264bc:	4423      	add	r3, r4
200264be:	ea4f 44f6 	mov.w	r4, r6, ror #19
200264c2:	ea84 4476 	eor.w	r4, r4, r6, ror #17
200264c6:	ea84 2496 	eor.w	r4, r4, r6, lsr #10
200264ca:	f8da 601c 	ldr.w	r6, [sl, #28]
200264ce:	f85a cc04 	ldr.w	ip, [sl, #-4]
200264d2:	4476      	add	r6, lr
200264d4:	4426      	add	r6, r4
200264d6:	ea4f 44bc 	mov.w	r4, ip, ror #18
200264da:	ea84 14fc 	eor.w	r4, r4, ip, ror #7
200264de:	ea84 04dc 	eor.w	r4, r4, ip, lsr #3
200264e2:	eb06 0b04 	add.w	fp, r6, r4
200264e6:	9c00      	ldr	r4, [sp, #0]
200264e8:	9e02      	ldr	r6, [sp, #8]
200264ea:	6da4      	ldr	r4, [r4, #88]	@ 0x58
200264ec:	ea89 0e08 	eor.w	lr, r9, r8
200264f0:	445c      	add	r4, fp
200264f2:	4434      	add	r4, r6
200264f4:	ea0e 0e07 	and.w	lr, lr, r7
200264f8:	ea4f 26f7 	mov.w	r6, r7, ror #11
200264fc:	ea8e 0e09 	eor.w	lr, lr, r9
20026500:	ea86 16b7 	eor.w	r6, r6, r7, ror #6
20026504:	4474      	add	r4, lr
20026506:	ea86 6677 	eor.w	r6, r6, r7, ror #25
2002650a:	4434      	add	r4, r6
2002650c:	eb01 0e04 	add.w	lr, r1, r4
20026510:	ea42 0603 	orr.w	r6, r2, r3
20026514:	ea4f 3173 	mov.w	r1, r3, ror #13
20026518:	f8ca b038 	str.w	fp, [sl, #56]	@ 0x38
2002651c:	4006      	ands	r6, r0
2002651e:	ea02 0b03 	and.w	fp, r2, r3
20026522:	ea81 01b3 	eor.w	r1, r1, r3, ror #2
20026526:	ea46 060b 	orr.w	r6, r6, fp
2002652a:	ea81 51b3 	eor.w	r1, r1, r3, ror #22
2002652e:	4431      	add	r1, r6
20026530:	190e      	adds	r6, r1, r4
20026532:	ea4f 41f5 	mov.w	r1, r5, ror #19
20026536:	ea81 4175 	eor.w	r1, r1, r5, ror #17
2002653a:	f8ca 5034 	str.w	r5, [sl, #52]	@ 0x34
2002653e:	ea81 2195 	eor.w	r1, r1, r5, lsr #10
20026542:	9d03      	ldr	r5, [sp, #12]
20026544:	f8da 4000 	ldr.w	r4, [sl]
20026548:	4465      	add	r5, ip
2002654a:	4429      	add	r1, r5
2002654c:	ea4f 45b4 	mov.w	r5, r4, ror #18
20026550:	ea85 15f4 	eor.w	r5, r5, r4, ror #7
20026554:	ea85 05d4 	eor.w	r5, r5, r4, lsr #3
20026558:	194c      	adds	r4, r1, r5
2002655a:	9900      	ldr	r1, [sp, #0]
2002655c:	ea88 0507 	eor.w	r5, r8, r7
20026560:	6dc9      	ldr	r1, [r1, #92]	@ 0x5c
20026562:	ea05 050e 	and.w	r5, r5, lr
20026566:	4421      	add	r1, r4
20026568:	4449      	add	r1, r9
2002656a:	ea85 0508 	eor.w	r5, r5, r8
2002656e:	440d      	add	r5, r1
20026570:	ea4f 21fe 	mov.w	r1, lr, ror #11
20026574:	ea81 11be 	eor.w	r1, r1, lr, ror #6
20026578:	ea81 617e 	eor.w	r1, r1, lr, ror #25
2002657c:	4429      	add	r1, r5
2002657e:	f8ca 403c 	str.w	r4, [sl, #60]	@ 0x3c
20026582:	eb00 0b01 	add.w	fp, r0, r1
20026586:	ea43 0406 	orr.w	r4, r3, r6
2002658a:	ea4f 3076 	mov.w	r0, r6, ror #13
2002658e:	ea80 00b6 	eor.w	r0, r0, r6, ror #2
20026592:	4014      	ands	r4, r2
20026594:	ea03 0506 	and.w	r5, r3, r6
20026598:	ea80 50b6 	eor.w	r0, r0, r6, ror #22
2002659c:	432c      	orrs	r4, r5
2002659e:	4420      	add	r0, r4
200265a0:	eb00 0901 	add.w	r9, r0, r1
200265a4:	9900      	ldr	r1, [sp, #0]
200265a6:	3120      	adds	r1, #32
200265a8:	9100      	str	r1, [sp, #0]
200265aa:	9905      	ldr	r1, [sp, #20]
200265ac:	4551      	cmp	r1, sl
200265ae:	f47f ae25 	bne.w	200261fc <mbedtls_sha256_process+0x2b4>
200265b2:	9308      	str	r3, [sp, #32]
200265b4:	9b04      	ldr	r3, [sp, #16]
200265b6:	a906      	add	r1, sp, #24
200265b8:	60ca      	str	r2, [r1, #12]
200265ba:	f8c1 801c 	str.w	r8, [r1, #28]
200265be:	1d1a      	adds	r2, r3, #4
200265c0:	618f      	str	r7, [r1, #24]
200265c2:	3324      	adds	r3, #36	@ 0x24
200265c4:	f8c1 e014 	str.w	lr, [r1, #20]
200265c8:	604e      	str	r6, [r1, #4]
200265ca:	f8c1 b010 	str.w	fp, [r1, #16]
200265ce:	f8c1 9000 	str.w	r9, [r1]
200265d2:	f852 0f04 	ldr.w	r0, [r2, #4]!
200265d6:	f851 4b04 	ldr.w	r4, [r1], #4
200265da:	4293      	cmp	r3, r2
200265dc:	4420      	add	r0, r4
200265de:	6010      	str	r0, [r2, #0]
200265e0:	d1f7      	bne.n	200265d2 <mbedtls_sha256_process+0x68a>
200265e2:	b04f      	add	sp, #316	@ 0x13c
200265e4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

200265e8 <mbedtls_sha256_update.part.0>:
200265e8:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
200265ec:	6803      	ldr	r3, [r0, #0]
200265ee:	4605      	mov	r5, r0
200265f0:	f003 073f 	and.w	r7, r3, #63	@ 0x3f
200265f4:	189b      	adds	r3, r3, r2
200265f6:	6003      	str	r3, [r0, #0]
200265f8:	bf28      	it	cs
200265fa:	6843      	ldrcs	r3, [r0, #4]
200265fc:	460e      	mov	r6, r1
200265fe:	bf28      	it	cs
20026600:	3301      	addcs	r3, #1
20026602:	4614      	mov	r4, r2
20026604:	bf28      	it	cs
20026606:	6043      	strcs	r3, [r0, #4]
20026608:	b197      	cbz	r7, 20026630 <mbedtls_sha256_update.part.0+0x48>
2002660a:	f1c7 0940 	rsb	r9, r7, #64	@ 0x40
2002660e:	4591      	cmp	r9, r2
20026610:	d80e      	bhi.n	20026630 <mbedtls_sha256_update.part.0+0x48>
20026612:	f100 0828 	add.w	r8, r0, #40	@ 0x28
20026616:	464a      	mov	r2, r9
20026618:	eb08 0007 	add.w	r0, r8, r7
2002661c:	f004 f910 	bl	2002a840 <memcpy>
20026620:	3c40      	subs	r4, #64	@ 0x40
20026622:	4641      	mov	r1, r8
20026624:	4628      	mov	r0, r5
20026626:	443c      	add	r4, r7
20026628:	f7ff fc8e 	bl	20025f48 <mbedtls_sha256_process>
2002662c:	2700      	movs	r7, #0
2002662e:	444e      	add	r6, r9
20026630:	46a0      	mov	r8, r4
20026632:	eb04 0906 	add.w	r9, r4, r6
20026636:	e004      	b.n	20026642 <mbedtls_sha256_update.part.0+0x5a>
20026638:	4628      	mov	r0, r5
2002663a:	f7ff fc85 	bl	20025f48 <mbedtls_sha256_process>
2002663e:	f1a8 0840 	sub.w	r8, r8, #64	@ 0x40
20026642:	f1b8 0f3f 	cmp.w	r8, #63	@ 0x3f
20026646:	eba9 0108 	sub.w	r1, r9, r8
2002664a:	d8f5      	bhi.n	20026638 <mbedtls_sha256_update.part.0+0x50>
2002664c:	f06f 033f 	mvn.w	r3, #63	@ 0x3f
20026650:	09a1      	lsrs	r1, r4, #6
20026652:	4359      	muls	r1, r3
20026654:	1862      	adds	r2, r4, r1
20026656:	d007      	beq.n	20026668 <mbedtls_sha256_update.part.0+0x80>
20026658:	f105 0028 	add.w	r0, r5, #40	@ 0x28
2002665c:	1a71      	subs	r1, r6, r1
2002665e:	4438      	add	r0, r7
20026660:	e8bd 43f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20026664:	f004 b8ec 	b.w	2002a840 <memcpy>
20026668:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

2002666c <mbedtls_sha256_update>:
2002666c:	b10a      	cbz	r2, 20026672 <mbedtls_sha256_update+0x6>
2002666e:	f7ff bfbb 	b.w	200265e8 <mbedtls_sha256_update.part.0>
20026672:	4770      	bx	lr

20026674 <mbedtls_sha256_finish>:
20026674:	b537      	push	{r0, r1, r2, r4, r5, lr}
20026676:	4604      	mov	r4, r0
20026678:	460d      	mov	r5, r1
2002667a:	e9d0 2100 	ldrd	r2, r1, [r0]
2002667e:	0f53      	lsrs	r3, r2, #29
20026680:	ea43 03c1 	orr.w	r3, r3, r1, lsl #3
20026684:	ba1b      	rev	r3, r3
20026686:	9300      	str	r3, [sp, #0]
20026688:	00d3      	lsls	r3, r2, #3
2002668a:	f002 023f 	and.w	r2, r2, #63	@ 0x3f
2002668e:	2a37      	cmp	r2, #55	@ 0x37
20026690:	ba1b      	rev	r3, r3
20026692:	bf94      	ite	ls
20026694:	f1c2 0238 	rsbls	r2, r2, #56	@ 0x38
20026698:	f1c2 0278 	rsbhi	r2, r2, #120	@ 0x78
2002669c:	492b      	ldr	r1, [pc, #172]	@ (2002674c <mbedtls_sha256_finish+0xd8>)
2002669e:	9301      	str	r3, [sp, #4]
200266a0:	f7ff ffe4 	bl	2002666c <mbedtls_sha256_update>
200266a4:	2208      	movs	r2, #8
200266a6:	4669      	mov	r1, sp
200266a8:	4620      	mov	r0, r4
200266aa:	f7ff ff9d 	bl	200265e8 <mbedtls_sha256_update.part.0>
200266ae:	7ae3      	ldrb	r3, [r4, #11]
200266b0:	702b      	strb	r3, [r5, #0]
200266b2:	8963      	ldrh	r3, [r4, #10]
200266b4:	706b      	strb	r3, [r5, #1]
200266b6:	68a3      	ldr	r3, [r4, #8]
200266b8:	0a1b      	lsrs	r3, r3, #8
200266ba:	70ab      	strb	r3, [r5, #2]
200266bc:	68a3      	ldr	r3, [r4, #8]
200266be:	70eb      	strb	r3, [r5, #3]
200266c0:	7be3      	ldrb	r3, [r4, #15]
200266c2:	712b      	strb	r3, [r5, #4]
200266c4:	89e3      	ldrh	r3, [r4, #14]
200266c6:	716b      	strb	r3, [r5, #5]
200266c8:	68e3      	ldr	r3, [r4, #12]
200266ca:	0a1b      	lsrs	r3, r3, #8
200266cc:	71ab      	strb	r3, [r5, #6]
200266ce:	68e3      	ldr	r3, [r4, #12]
200266d0:	71eb      	strb	r3, [r5, #7]
200266d2:	7ce3      	ldrb	r3, [r4, #19]
200266d4:	722b      	strb	r3, [r5, #8]
200266d6:	8a63      	ldrh	r3, [r4, #18]
200266d8:	726b      	strb	r3, [r5, #9]
200266da:	6923      	ldr	r3, [r4, #16]
200266dc:	0a1b      	lsrs	r3, r3, #8
200266de:	72ab      	strb	r3, [r5, #10]
200266e0:	6923      	ldr	r3, [r4, #16]
200266e2:	72eb      	strb	r3, [r5, #11]
200266e4:	7de3      	ldrb	r3, [r4, #23]
200266e6:	732b      	strb	r3, [r5, #12]
200266e8:	8ae3      	ldrh	r3, [r4, #22]
200266ea:	736b      	strb	r3, [r5, #13]
200266ec:	6963      	ldr	r3, [r4, #20]
200266ee:	0a1b      	lsrs	r3, r3, #8
200266f0:	73ab      	strb	r3, [r5, #14]
200266f2:	6963      	ldr	r3, [r4, #20]
200266f4:	73eb      	strb	r3, [r5, #15]
200266f6:	7ee3      	ldrb	r3, [r4, #27]
200266f8:	742b      	strb	r3, [r5, #16]
200266fa:	8b63      	ldrh	r3, [r4, #26]
200266fc:	746b      	strb	r3, [r5, #17]
200266fe:	69a3      	ldr	r3, [r4, #24]
20026700:	0a1b      	lsrs	r3, r3, #8
20026702:	74ab      	strb	r3, [r5, #18]
20026704:	69a3      	ldr	r3, [r4, #24]
20026706:	74eb      	strb	r3, [r5, #19]
20026708:	7fe3      	ldrb	r3, [r4, #31]
2002670a:	752b      	strb	r3, [r5, #20]
2002670c:	8be3      	ldrh	r3, [r4, #30]
2002670e:	756b      	strb	r3, [r5, #21]
20026710:	69e3      	ldr	r3, [r4, #28]
20026712:	0a1b      	lsrs	r3, r3, #8
20026714:	75ab      	strb	r3, [r5, #22]
20026716:	69e3      	ldr	r3, [r4, #28]
20026718:	75eb      	strb	r3, [r5, #23]
2002671a:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
2002671e:	762b      	strb	r3, [r5, #24]
20026720:	8c63      	ldrh	r3, [r4, #34]	@ 0x22
20026722:	766b      	strb	r3, [r5, #25]
20026724:	6a23      	ldr	r3, [r4, #32]
20026726:	0a1b      	lsrs	r3, r3, #8
20026728:	76ab      	strb	r3, [r5, #26]
2002672a:	6a23      	ldr	r3, [r4, #32]
2002672c:	76eb      	strb	r3, [r5, #27]
2002672e:	6ea3      	ldr	r3, [r4, #104]	@ 0x68
20026730:	b94b      	cbnz	r3, 20026746 <mbedtls_sha256_finish+0xd2>
20026732:	f894 3027 	ldrb.w	r3, [r4, #39]	@ 0x27
20026736:	772b      	strb	r3, [r5, #28]
20026738:	8ce3      	ldrh	r3, [r4, #38]	@ 0x26
2002673a:	776b      	strb	r3, [r5, #29]
2002673c:	6a63      	ldr	r3, [r4, #36]	@ 0x24
2002673e:	0a1b      	lsrs	r3, r3, #8
20026740:	77ab      	strb	r3, [r5, #30]
20026742:	6a63      	ldr	r3, [r4, #36]	@ 0x24
20026744:	77eb      	strb	r3, [r5, #31]
20026746:	b003      	add	sp, #12
20026748:	bd30      	pop	{r4, r5, pc}
2002674a:	bf00      	nop
2002674c:	2002bd54 	.word	0x2002bd54

20026750 <mbedtls_sha256>:
20026750:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20026754:	461d      	mov	r5, r3
20026756:	b09c      	sub	sp, #112	@ 0x70
20026758:	4607      	mov	r7, r0
2002675a:	a801      	add	r0, sp, #4
2002675c:	4688      	mov	r8, r1
2002675e:	4616      	mov	r6, r2
20026760:	f7ff fb97 	bl	20025e92 <mbedtls_sha256_init>
20026764:	b355      	cbz	r5, 200267bc <mbedtls_sha256+0x6c>
20026766:	f8df a090 	ldr.w	sl, [pc, #144]	@ 200267f8 <mbedtls_sha256+0xa8>
2002676a:	f8df 9090 	ldr.w	r9, [pc, #144]	@ 200267fc <mbedtls_sha256+0xac>
2002676e:	f8df e090 	ldr.w	lr, [pc, #144]	@ 20026800 <mbedtls_sha256+0xb0>
20026772:	f8df c090 	ldr.w	ip, [pc, #144]	@ 20026804 <mbedtls_sha256+0xb4>
20026776:	4818      	ldr	r0, [pc, #96]	@ (200267d8 <mbedtls_sha256+0x88>)
20026778:	4918      	ldr	r1, [pc, #96]	@ (200267dc <mbedtls_sha256+0x8c>)
2002677a:	4a19      	ldr	r2, [pc, #100]	@ (200267e0 <mbedtls_sha256+0x90>)
2002677c:	4b19      	ldr	r3, [pc, #100]	@ (200267e4 <mbedtls_sha256+0x94>)
2002677e:	2400      	movs	r4, #0
20026780:	e9cd 2309 	strd	r2, r3, [sp, #36]	@ 0x24
20026784:	e9cd 0107 	strd	r0, r1, [sp, #28]
20026788:	4642      	mov	r2, r8
2002678a:	4639      	mov	r1, r7
2002678c:	a801      	add	r0, sp, #4
2002678e:	e9cd ec05 	strd	lr, ip, [sp, #20]
20026792:	e9cd 4401 	strd	r4, r4, [sp, #4]
20026796:	e9cd a903 	strd	sl, r9, [sp, #12]
2002679a:	951b      	str	r5, [sp, #108]	@ 0x6c
2002679c:	f7ff ff66 	bl	2002666c <mbedtls_sha256_update>
200267a0:	4631      	mov	r1, r6
200267a2:	a801      	add	r0, sp, #4
200267a4:	f7ff ff66 	bl	20026674 <mbedtls_sha256_finish>
200267a8:	4623      	mov	r3, r4
200267aa:	4622      	mov	r2, r4
200267ac:	a901      	add	r1, sp, #4
200267ae:	54ca      	strb	r2, [r1, r3]
200267b0:	3301      	adds	r3, #1
200267b2:	2b6c      	cmp	r3, #108	@ 0x6c
200267b4:	d1fa      	bne.n	200267ac <mbedtls_sha256+0x5c>
200267b6:	b01c      	add	sp, #112	@ 0x70
200267b8:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
200267bc:	f8df a048 	ldr.w	sl, [pc, #72]	@ 20026808 <mbedtls_sha256+0xb8>
200267c0:	f8df 9048 	ldr.w	r9, [pc, #72]	@ 2002680c <mbedtls_sha256+0xbc>
200267c4:	f8df e048 	ldr.w	lr, [pc, #72]	@ 20026810 <mbedtls_sha256+0xc0>
200267c8:	f8df c048 	ldr.w	ip, [pc, #72]	@ 20026814 <mbedtls_sha256+0xc4>
200267cc:	4806      	ldr	r0, [pc, #24]	@ (200267e8 <mbedtls_sha256+0x98>)
200267ce:	4907      	ldr	r1, [pc, #28]	@ (200267ec <mbedtls_sha256+0x9c>)
200267d0:	4a07      	ldr	r2, [pc, #28]	@ (200267f0 <mbedtls_sha256+0xa0>)
200267d2:	4b08      	ldr	r3, [pc, #32]	@ (200267f4 <mbedtls_sha256+0xa4>)
200267d4:	e7d3      	b.n	2002677e <mbedtls_sha256+0x2e>
200267d6:	bf00      	nop
200267d8:	ffc00b31 	.word	0xffc00b31
200267dc:	68581511 	.word	0x68581511
200267e0:	64f98fa7 	.word	0x64f98fa7
200267e4:	befa4fa4 	.word	0xbefa4fa4
200267e8:	510e527f 	.word	0x510e527f
200267ec:	9b05688c 	.word	0x9b05688c
200267f0:	1f83d9ab 	.word	0x1f83d9ab
200267f4:	5be0cd19 	.word	0x5be0cd19
200267f8:	c1059ed8 	.word	0xc1059ed8
200267fc:	367cd507 	.word	0x367cd507
20026800:	3070dd17 	.word	0x3070dd17
20026804:	f70e5939 	.word	0xf70e5939
20026808:	6a09e667 	.word	0x6a09e667
2002680c:	bb67ae85 	.word	0xbb67ae85
20026810:	3c6ef372 	.word	0x3c6ef372
20026814:	a54ff53a 	.word	0xa54ff53a

20026818 <mbedtls_sha512_init>:
20026818:	22d8      	movs	r2, #216	@ 0xd8
2002681a:	2100      	movs	r1, #0
2002681c:	f003 bff6 	b.w	2002a80c <memset>

20026820 <mbedtls_sha512_free>:
20026820:	b138      	cbz	r0, 20026832 <mbedtls_sha512_free+0x12>
20026822:	2100      	movs	r1, #0
20026824:	f100 03d8 	add.w	r3, r0, #216	@ 0xd8
20026828:	4602      	mov	r2, r0
2002682a:	3001      	adds	r0, #1
2002682c:	4298      	cmp	r0, r3
2002682e:	7011      	strb	r1, [r2, #0]
20026830:	d1fa      	bne.n	20026828 <mbedtls_sha512_free+0x8>
20026832:	4770      	bx	lr

20026834 <mbedtls_sha512_clone>:
20026834:	b508      	push	{r3, lr}
20026836:	22d8      	movs	r2, #216	@ 0xd8
20026838:	f004 f802 	bl	2002a840 <memcpy>
2002683c:	bd08      	pop	{r3, pc}
	...

20026840 <mbedtls_sha512_starts>:
20026840:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20026844:	b381      	cbz	r1, 200268a8 <mbedtls_sha512_starts+0x68>
20026846:	f20f 0bc8 	addw	fp, pc, #200	@ 0xc8
2002684a:	e9db ab00 	ldrd	sl, fp, [fp]
2002684e:	f20f 09c8 	addw	r9, pc, #200	@ 0xc8
20026852:	e9d9 8900 	ldrd	r8, r9, [r9]
20026856:	a732      	add	r7, pc, #200	@ (adr r7, 20026920 <mbedtls_sha512_starts+0xe0>)
20026858:	e9d7 6700 	ldrd	r6, r7, [r7]
2002685c:	a532      	add	r5, pc, #200	@ (adr r5, 20026928 <mbedtls_sha512_starts+0xe8>)
2002685e:	e9d5 4500 	ldrd	r4, r5, [r5]
20026862:	a333      	add	r3, pc, #204	@ (adr r3, 20026930 <mbedtls_sha512_starts+0xf0>)
20026864:	e9d3 2300 	ldrd	r2, r3, [r3]
20026868:	ed9f 5b1b 	vldr	d5, [pc, #108]	@ 200268d8 <mbedtls_sha512_starts+0x98>
2002686c:	ed9f 6b1c 	vldr	d6, [pc, #112]	@ 200268e0 <mbedtls_sha512_starts+0xa0>
20026870:	ed9f 7b1d 	vldr	d7, [pc, #116]	@ 200268e8 <mbedtls_sha512_starts+0xa8>
20026874:	ed9f 4b1e 	vldr	d4, [pc, #120]	@ 200268f0 <mbedtls_sha512_starts+0xb0>
20026878:	ed80 5b04 	vstr	d5, [r0, #16]
2002687c:	ed80 4b00 	vstr	d4, [r0]
20026880:	ed80 4b02 	vstr	d4, [r0, #8]
20026884:	ed80 6b06 	vstr	d6, [r0, #24]
20026888:	ed80 7b08 	vstr	d7, [r0, #32]
2002688c:	e9c0 ab0a 	strd	sl, fp, [r0, #40]	@ 0x28
20026890:	e9c0 890c 	strd	r8, r9, [r0, #48]	@ 0x30
20026894:	e9c0 670e 	strd	r6, r7, [r0, #56]	@ 0x38
20026898:	e9c0 4510 	strd	r4, r5, [r0, #64]	@ 0x40
2002689c:	e9c0 2312 	strd	r2, r3, [r0, #72]	@ 0x48
200268a0:	f8c0 10d0 	str.w	r1, [r0, #208]	@ 0xd0
200268a4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200268a8:	ed9f 5b13 	vldr	d5, [pc, #76]	@ 200268f8 <mbedtls_sha512_starts+0xb8>
200268ac:	f20f 0b88 	addw	fp, pc, #136	@ 0x88
200268b0:	e9db ab00 	ldrd	sl, fp, [fp]
200268b4:	f20f 0988 	addw	r9, pc, #136	@ 0x88
200268b8:	e9d9 8900 	ldrd	r8, r9, [r9]
200268bc:	a722      	add	r7, pc, #136	@ (adr r7, 20026948 <mbedtls_sha512_starts+0x108>)
200268be:	e9d7 6700 	ldrd	r6, r7, [r7]
200268c2:	a523      	add	r5, pc, #140	@ (adr r5, 20026950 <mbedtls_sha512_starts+0x110>)
200268c4:	e9d5 4500 	ldrd	r4, r5, [r5]
200268c8:	a323      	add	r3, pc, #140	@ (adr r3, 20026958 <mbedtls_sha512_starts+0x118>)
200268ca:	e9d3 2300 	ldrd	r2, r3, [r3]
200268ce:	ed9f 6b0c 	vldr	d6, [pc, #48]	@ 20026900 <mbedtls_sha512_starts+0xc0>
200268d2:	ed9f 7b0d 	vldr	d7, [pc, #52]	@ 20026908 <mbedtls_sha512_starts+0xc8>
200268d6:	e7cd      	b.n	20026874 <mbedtls_sha512_starts+0x34>
200268d8:	c1059ed8 	.word	0xc1059ed8
200268dc:	cbbb9d5d 	.word	0xcbbb9d5d
200268e0:	367cd507 	.word	0x367cd507
200268e4:	629a292a 	.word	0x629a292a
200268e8:	3070dd17 	.word	0x3070dd17
200268ec:	9159015a 	.word	0x9159015a
	...
200268f8:	f3bcc908 	.word	0xf3bcc908
200268fc:	6a09e667 	.word	0x6a09e667
20026900:	84caa73b 	.word	0x84caa73b
20026904:	bb67ae85 	.word	0xbb67ae85
20026908:	fe94f82b 	.word	0xfe94f82b
2002690c:	3c6ef372 	.word	0x3c6ef372
20026910:	f70e5939 	.word	0xf70e5939
20026914:	152fecd8 	.word	0x152fecd8
20026918:	ffc00b31 	.word	0xffc00b31
2002691c:	67332667 	.word	0x67332667
20026920:	68581511 	.word	0x68581511
20026924:	8eb44a87 	.word	0x8eb44a87
20026928:	64f98fa7 	.word	0x64f98fa7
2002692c:	db0c2e0d 	.word	0xdb0c2e0d
20026930:	befa4fa4 	.word	0xbefa4fa4
20026934:	47b5481d 	.word	0x47b5481d
20026938:	5f1d36f1 	.word	0x5f1d36f1
2002693c:	a54ff53a 	.word	0xa54ff53a
20026940:	ade682d1 	.word	0xade682d1
20026944:	510e527f 	.word	0x510e527f
20026948:	2b3e6c1f 	.word	0x2b3e6c1f
2002694c:	9b05688c 	.word	0x9b05688c
20026950:	fb41bd6b 	.word	0xfb41bd6b
20026954:	1f83d9ab 	.word	0x1f83d9ab
20026958:	137e2179 	.word	0x137e2179
2002695c:	5be0cd19 	.word	0x5be0cd19

20026960 <mbedtls_sha512_process>:
20026960:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20026964:	f5ad 7d3f 	sub.w	sp, sp, #764	@ 0x2fc
20026968:	4682      	mov	sl, r0
2002696a:	a81e      	add	r0, sp, #120	@ 0x78
2002696c:	4604      	mov	r4, r0
2002696e:	f101 0580 	add.w	r5, r1, #128	@ 0x80
20026972:	784b      	ldrb	r3, [r1, #1]
20026974:	780a      	ldrb	r2, [r1, #0]
20026976:	041b      	lsls	r3, r3, #16
20026978:	790f      	ldrb	r7, [r1, #4]
2002697a:	ea43 6302 	orr.w	r3, r3, r2, lsl #24
2002697e:	79ca      	ldrb	r2, [r1, #7]
20026980:	788e      	ldrb	r6, [r1, #2]
20026982:	ea42 6207 	orr.w	r2, r2, r7, lsl #24
20026986:	794f      	ldrb	r7, [r1, #5]
20026988:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
2002698c:	ea42 4207 	orr.w	r2, r2, r7, lsl #16
20026990:	78ce      	ldrb	r6, [r1, #3]
20026992:	798f      	ldrb	r7, [r1, #6]
20026994:	3108      	adds	r1, #8
20026996:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
2002699a:	4333      	orrs	r3, r6
2002699c:	428d      	cmp	r5, r1
2002699e:	e9c4 2300 	strd	r2, r3, [r4]
200269a2:	f104 0408 	add.w	r4, r4, #8
200269a6:	d1e4      	bne.n	20026972 <mbedtls_sha512_process+0x12>
200269a8:	4601      	mov	r1, r0
200269aa:	2610      	movs	r6, #16
200269ac:	e9d1 4c1c 	ldrd	r4, ip, [r1, #112]	@ 0x70
200269b0:	e9d1 2502 	ldrd	r2, r5, [r1, #8]
200269b4:	468e      	mov	lr, r1
200269b6:	0ce3      	lsrs	r3, r4, #19
200269b8:	ea4f 47dc 	mov.w	r7, ip, lsr #19
200269bc:	ea4f 09c4 	mov.w	r9, r4, lsl #3
200269c0:	ea4f 08cc 	mov.w	r8, ip, lsl #3
200269c4:	ea48 7854 	orr.w	r8, r8, r4, lsr #29
200269c8:	ea43 334c 	orr.w	r3, r3, ip, lsl #13
200269cc:	ea47 3744 	orr.w	r7, r7, r4, lsl #13
200269d0:	ea49 795c 	orr.w	r9, r9, ip, lsr #29
200269d4:	09a4      	lsrs	r4, r4, #6
200269d6:	ea87 0708 	eor.w	r7, r7, r8
200269da:	ea44 648c 	orr.w	r4, r4, ip, lsl #26
200269de:	ea83 0309 	eor.w	r3, r3, r9
200269e2:	4063      	eors	r3, r4
200269e4:	ea87 179c 	eor.w	r7, r7, ip, lsr #6
200269e8:	e9de 4c12 	ldrd	r4, ip, [lr, #72]	@ 0x48
200269ec:	e9de 8e00 	ldrd	r8, lr, [lr]
200269f0:	eb14 0408 	adds.w	r4, r4, r8
200269f4:	eb4c 0c0e 	adc.w	ip, ip, lr
200269f8:	191b      	adds	r3, r3, r4
200269fa:	eb47 070c 	adc.w	r7, r7, ip
200269fe:	0854      	lsrs	r4, r2, #1
20026a00:	ea4f 2812 	mov.w	r8, r2, lsr #8
20026a04:	ea4f 0c55 	mov.w	ip, r5, lsr #1
20026a08:	ea4f 2e15 	mov.w	lr, r5, lsr #8
20026a0c:	ea4c 7cc2 	orr.w	ip, ip, r2, lsl #31
20026a10:	ea4e 6e02 	orr.w	lr, lr, r2, lsl #24
20026a14:	ea44 74c5 	orr.w	r4, r4, r5, lsl #31
20026a18:	ea48 6805 	orr.w	r8, r8, r5, lsl #24
20026a1c:	09d2      	lsrs	r2, r2, #7
20026a1e:	ea84 0408 	eor.w	r4, r4, r8
20026a22:	ea42 6245 	orr.w	r2, r2, r5, lsl #25
20026a26:	4062      	eors	r2, r4
20026a28:	ea8c 0c0e 	eor.w	ip, ip, lr
20026a2c:	189b      	adds	r3, r3, r2
20026a2e:	ea8c 14d5 	eor.w	r4, ip, r5, lsr #7
20026a32:	f106 0601 	add.w	r6, r6, #1
20026a36:	eb47 0704 	adc.w	r7, r7, r4
20026a3a:	3108      	adds	r1, #8
20026a3c:	2e50      	cmp	r6, #80	@ 0x50
20026a3e:	e9c1 371e 	strd	r3, r7, [r1, #120]	@ 0x78
20026a42:	d1b3      	bne.n	200269ac <mbedtls_sha512_process+0x4c>
20026a44:	f8da 3010 	ldr.w	r3, [sl, #16]
20026a48:	930e      	str	r3, [sp, #56]	@ 0x38
20026a4a:	f8da 3014 	ldr.w	r3, [sl, #20]
20026a4e:	930f      	str	r3, [sp, #60]	@ 0x3c
20026a50:	f8da 3018 	ldr.w	r3, [sl, #24]
20026a54:	9310      	str	r3, [sp, #64]	@ 0x40
20026a56:	f8da 301c 	ldr.w	r3, [sl, #28]
20026a5a:	9311      	str	r3, [sp, #68]	@ 0x44
20026a5c:	f8da 3020 	ldr.w	r3, [sl, #32]
20026a60:	9312      	str	r3, [sp, #72]	@ 0x48
20026a62:	f8da 3024 	ldr.w	r3, [sl, #36]	@ 0x24
20026a66:	9313      	str	r3, [sp, #76]	@ 0x4c
20026a68:	f8da 3028 	ldr.w	r3, [sl, #40]	@ 0x28
20026a6c:	9314      	str	r3, [sp, #80]	@ 0x50
20026a6e:	f8da 302c 	ldr.w	r3, [sl, #44]	@ 0x2c
20026a72:	9315      	str	r3, [sp, #84]	@ 0x54
20026a74:	f8da 3030 	ldr.w	r3, [sl, #48]	@ 0x30
20026a78:	9316      	str	r3, [sp, #88]	@ 0x58
20026a7a:	f8da 3034 	ldr.w	r3, [sl, #52]	@ 0x34
20026a7e:	9317      	str	r3, [sp, #92]	@ 0x5c
20026a80:	f8da 3038 	ldr.w	r3, [sl, #56]	@ 0x38
20026a84:	9318      	str	r3, [sp, #96]	@ 0x60
20026a86:	f8da 303c 	ldr.w	r3, [sl, #60]	@ 0x3c
20026a8a:	9319      	str	r3, [sp, #100]	@ 0x64
20026a8c:	f8da 3040 	ldr.w	r3, [sl, #64]	@ 0x40
20026a90:	931a      	str	r3, [sp, #104]	@ 0x68
20026a92:	f8da 3044 	ldr.w	r3, [sl, #68]	@ 0x44
20026a96:	931b      	str	r3, [sp, #108]	@ 0x6c
20026a98:	f8da 3048 	ldr.w	r3, [sl, #72]	@ 0x48
20026a9c:	931c      	str	r3, [sp, #112]	@ 0x70
20026a9e:	f8da 304c 	ldr.w	r3, [sl, #76]	@ 0x4c
20026aa2:	931d      	str	r3, [sp, #116]	@ 0x74
20026aa4:	4b0f      	ldr	r3, [pc, #60]	@ (20026ae4 <mbedtls_sha512_process+0x184>)
20026aa6:	9300      	str	r3, [sp, #0]
20026aa8:	9b1c      	ldr	r3, [sp, #112]	@ 0x70
20026aaa:	f8dd b054 	ldr.w	fp, [sp, #84]	@ 0x54
20026aae:	930a      	str	r3, [sp, #40]	@ 0x28
20026ab0:	9b1d      	ldr	r3, [sp, #116]	@ 0x74
20026ab2:	e9dd ce10 	ldrd	ip, lr, [sp, #64]	@ 0x40
20026ab6:	930b      	str	r3, [sp, #44]	@ 0x2c
20026ab8:	9b1a      	ldr	r3, [sp, #104]	@ 0x68
20026aba:	9308      	str	r3, [sp, #32]
20026abc:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
20026abe:	9309      	str	r3, [sp, #36]	@ 0x24
20026ac0:	9b18      	ldr	r3, [sp, #96]	@ 0x60
20026ac2:	9306      	str	r3, [sp, #24]
20026ac4:	9b19      	ldr	r3, [sp, #100]	@ 0x64
20026ac6:	9307      	str	r3, [sp, #28]
20026ac8:	9b16      	ldr	r3, [sp, #88]	@ 0x58
20026aca:	9304      	str	r3, [sp, #16]
20026acc:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
20026ace:	9305      	str	r3, [sp, #20]
20026ad0:	9b14      	ldr	r3, [sp, #80]	@ 0x50
20026ad2:	9303      	str	r3, [sp, #12]
20026ad4:	9b12      	ldr	r3, [sp, #72]	@ 0x48
20026ad6:	9301      	str	r3, [sp, #4]
20026ad8:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
20026ada:	9302      	str	r3, [sp, #8]
20026adc:	e9dd 320e 	ldrd	r3, r2, [sp, #56]	@ 0x38
20026ae0:	e002      	b.n	20026ae8 <mbedtls_sha512_process+0x188>
20026ae2:	bf00      	nop
20026ae4:	2002bf18 	.word	0x2002bf18
20026ae8:	9c04      	ldr	r4, [sp, #16]
20026aea:	9e04      	ldr	r6, [sp, #16]
20026aec:	ea4f 3894 	mov.w	r8, r4, lsr #14
20026af0:	9c05      	ldr	r4, [sp, #20]
20026af2:	9900      	ldr	r1, [sp, #0]
20026af4:	ea48 4884 	orr.w	r8, r8, r4, lsl #18
20026af8:	ea4f 3994 	mov.w	r9, r4, lsr #14
20026afc:	9c04      	ldr	r4, [sp, #16]
20026afe:	ea49 4984 	orr.w	r9, r9, r4, lsl #18
20026b02:	0ca5      	lsrs	r5, r4, #18
20026b04:	9c05      	ldr	r4, [sp, #20]
20026b06:	ea45 3584 	orr.w	r5, r5, r4, lsl #14
20026b0a:	0ca4      	lsrs	r4, r4, #18
20026b0c:	ea44 3486 	orr.w	r4, r4, r6, lsl #14
20026b10:	ea89 0904 	eor.w	r9, r9, r4
20026b14:	9c05      	ldr	r4, [sp, #20]
20026b16:	ea88 0805 	eor.w	r8, r8, r5
20026b1a:	05f5      	lsls	r5, r6, #23
20026b1c:	ea45 2554 	orr.w	r5, r5, r4, lsr #9
20026b20:	05e4      	lsls	r4, r4, #23
20026b22:	ea44 2456 	orr.w	r4, r4, r6, lsr #9
20026b26:	ea88 0805 	eor.w	r8, r8, r5
20026b2a:	ea89 0904 	eor.w	r9, r9, r4
20026b2e:	e9d1 5700 	ldrd	r5, r7, [r1]
20026b32:	e9d0 6400 	ldrd	r6, r4, [r0]
20026b36:	19ad      	adds	r5, r5, r6
20026b38:	eb47 0404 	adc.w	r4, r7, r4
20026b3c:	9e06      	ldr	r6, [sp, #24]
20026b3e:	9f08      	ldr	r7, [sp, #32]
20026b40:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026b42:	407e      	eors	r6, r7
20026b44:	9f07      	ldr	r7, [sp, #28]
20026b46:	eb18 0505 	adds.w	r5, r8, r5
20026b4a:	ea87 0701 	eor.w	r7, r7, r1
20026b4e:	9904      	ldr	r1, [sp, #16]
20026b50:	eb49 0404 	adc.w	r4, r9, r4
20026b54:	400e      	ands	r6, r1
20026b56:	9905      	ldr	r1, [sp, #20]
20026b58:	ea4f 7813 	mov.w	r8, r3, lsr #28
20026b5c:	400f      	ands	r7, r1
20026b5e:	9908      	ldr	r1, [sp, #32]
20026b60:	ea4f 7983 	mov.w	r9, r3, lsl #30
20026b64:	404e      	eors	r6, r1
20026b66:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026b68:	19ad      	adds	r5, r5, r6
20026b6a:	ea87 0701 	eor.w	r7, r7, r1
20026b6e:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026b70:	eb44 0407 	adc.w	r4, r4, r7
20026b74:	186d      	adds	r5, r5, r1
20026b76:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026b78:	ea4f 7712 	mov.w	r7, r2, lsr #28
20026b7c:	eb41 0404 	adc.w	r4, r1, r4
20026b80:	9903      	ldr	r1, [sp, #12]
20026b82:	0796      	lsls	r6, r2, #30
20026b84:	1949      	adds	r1, r1, r5
20026b86:	ea46 0693 	orr.w	r6, r6, r3, lsr #2
20026b8a:	ea47 1703 	orr.w	r7, r7, r3, lsl #4
20026b8e:	910a      	str	r1, [sp, #40]	@ 0x28
20026b90:	ea87 0706 	eor.w	r7, r7, r6
20026b94:	eb4b 0104 	adc.w	r1, fp, r4
20026b98:	0656      	lsls	r6, r2, #25
20026b9a:	ea49 0992 	orr.w	r9, r9, r2, lsr #2
20026b9e:	ea46 16d3 	orr.w	r6, r6, r3, lsr #7
20026ba2:	910b      	str	r1, [sp, #44]	@ 0x2c
20026ba4:	ea48 1802 	orr.w	r8, r8, r2, lsl #4
20026ba8:	9901      	ldr	r1, [sp, #4]
20026baa:	ea88 0809 	eor.w	r8, r8, r9
20026bae:	4077      	eors	r7, r6
20026bb0:	ea4f 6943 	mov.w	r9, r3, lsl #25
20026bb4:	ea43 060c 	orr.w	r6, r3, ip
20026bb8:	ea49 19d2 	orr.w	r9, r9, r2, lsr #7
20026bbc:	400e      	ands	r6, r1
20026bbe:	9902      	ldr	r1, [sp, #8]
20026bc0:	ea03 0b0c 	and.w	fp, r3, ip
20026bc4:	ea88 0809 	eor.w	r8, r8, r9
20026bc8:	ea42 090e 	orr.w	r9, r2, lr
20026bcc:	ea09 0901 	and.w	r9, r9, r1
20026bd0:	ea46 060b 	orr.w	r6, r6, fp
20026bd4:	ea02 010e 	and.w	r1, r2, lr
20026bd8:	eb18 0606 	adds.w	r6, r8, r6
20026bdc:	ea49 0901 	orr.w	r9, r9, r1
20026be0:	eb47 0709 	adc.w	r7, r7, r9
20026be4:	1971      	adds	r1, r6, r5
20026be6:	9103      	str	r1, [sp, #12]
20026be8:	9900      	ldr	r1, [sp, #0]
20026bea:	eb44 0b07 	adc.w	fp, r4, r7
20026bee:	e9d0 6702 	ldrd	r6, r7, [r0, #8]
20026bf2:	e9d1 4502 	ldrd	r4, r5, [r1, #8]
20026bf6:	9908      	ldr	r1, [sp, #32]
20026bf8:	19a4      	adds	r4, r4, r6
20026bfa:	eb45 0507 	adc.w	r5, r5, r7
20026bfe:	1864      	adds	r4, r4, r1
20026c00:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026c02:	9e06      	ldr	r6, [sp, #24]
20026c04:	eb41 0505 	adc.w	r5, r1, r5
20026c08:	9904      	ldr	r1, [sp, #16]
20026c0a:	ea81 0706 	eor.w	r7, r1, r6
20026c0e:	9905      	ldr	r1, [sp, #20]
20026c10:	9e07      	ldr	r6, [sp, #28]
20026c12:	404e      	eors	r6, r1
20026c14:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c16:	400f      	ands	r7, r1
20026c18:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c1a:	400e      	ands	r6, r1
20026c1c:	9906      	ldr	r1, [sp, #24]
20026c1e:	404f      	eors	r7, r1
20026c20:	9907      	ldr	r1, [sp, #28]
20026c22:	19e4      	adds	r4, r4, r7
20026c24:	ea86 0601 	eor.w	r6, r6, r1
20026c28:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c2a:	eb45 0506 	adc.w	r5, r5, r6
20026c2e:	0b8f      	lsrs	r7, r1, #14
20026c30:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c32:	ea47 4781 	orr.w	r7, r7, r1, lsl #18
20026c36:	ea4f 3891 	mov.w	r8, r1, lsr #14
20026c3a:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c3c:	ea48 4881 	orr.w	r8, r8, r1, lsl #18
20026c40:	ea4f 4991 	mov.w	r9, r1, lsr #18
20026c44:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c46:	ea49 3981 	orr.w	r9, r9, r1, lsl #14
20026c4a:	0c8e      	lsrs	r6, r1, #18
20026c4c:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c4e:	ea87 0709 	eor.w	r7, r7, r9
20026c52:	ea46 3681 	orr.w	r6, r6, r1, lsl #14
20026c56:	ea88 0806 	eor.w	r8, r8, r6
20026c5a:	05ce      	lsls	r6, r1, #23
20026c5c:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c5e:	ea46 2651 	orr.w	r6, r6, r1, lsr #9
20026c62:	ea4f 59c1 	mov.w	r9, r1, lsl #23
20026c66:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c68:	407e      	eors	r6, r7
20026c6a:	ea49 2951 	orr.w	r9, r9, r1, lsr #9
20026c6e:	9901      	ldr	r1, [sp, #4]
20026c70:	19a4      	adds	r4, r4, r6
20026c72:	ea88 0809 	eor.w	r8, r8, r9
20026c76:	eb45 0808 	adc.w	r8, r5, r8
20026c7a:	1909      	adds	r1, r1, r4
20026c7c:	9108      	str	r1, [sp, #32]
20026c7e:	9902      	ldr	r1, [sp, #8]
20026c80:	ea4f 761b 	mov.w	r6, fp, lsr #28
20026c84:	eb41 0108 	adc.w	r1, r1, r8
20026c88:	9109      	str	r1, [sp, #36]	@ 0x24
20026c8a:	9903      	ldr	r1, [sp, #12]
20026c8c:	ea4f 758b 	mov.w	r5, fp, lsl #30
20026c90:	ea45 0591 	orr.w	r5, r5, r1, lsr #2
20026c94:	0f0f      	lsrs	r7, r1, #28
20026c96:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
20026c9a:	ea4f 7981 	mov.w	r9, r1, lsl #30
20026c9e:	ea49 099b 	orr.w	r9, r9, fp, lsr #2
20026ca2:	ea47 170b 	orr.w	r7, r7, fp, lsl #4
20026ca6:	406e      	eors	r6, r5
20026ca8:	ea4f 654b 	mov.w	r5, fp, lsl #25
20026cac:	ea45 15d1 	orr.w	r5, r5, r1, lsr #7
20026cb0:	ea87 0709 	eor.w	r7, r7, r9
20026cb4:	ea4f 6941 	mov.w	r9, r1, lsl #25
20026cb8:	ea49 19db 	orr.w	r9, r9, fp, lsr #7
20026cbc:	406e      	eors	r6, r5
20026cbe:	ea43 0501 	orr.w	r5, r3, r1
20026cc2:	ea87 0709 	eor.w	r7, r7, r9
20026cc6:	4019      	ands	r1, r3
20026cc8:	ea42 090b 	orr.w	r9, r2, fp
20026ccc:	ea05 050c 	and.w	r5, r5, ip
20026cd0:	ea09 090e 	and.w	r9, r9, lr
20026cd4:	430d      	orrs	r5, r1
20026cd6:	ea02 010b 	and.w	r1, r2, fp
20026cda:	197d      	adds	r5, r7, r5
20026cdc:	ea49 0901 	orr.w	r9, r9, r1
20026ce0:	eb46 0609 	adc.w	r6, r6, r9
20026ce4:	1929      	adds	r1, r5, r4
20026ce6:	9101      	str	r1, [sp, #4]
20026ce8:	eb48 0106 	adc.w	r1, r8, r6
20026cec:	9102      	str	r1, [sp, #8]
20026cee:	9900      	ldr	r1, [sp, #0]
20026cf0:	e9d0 6704 	ldrd	r6, r7, [r0, #16]
20026cf4:	e9d1 4504 	ldrd	r4, r5, [r1, #16]
20026cf8:	9906      	ldr	r1, [sp, #24]
20026cfa:	19a4      	adds	r4, r4, r6
20026cfc:	eb45 0507 	adc.w	r5, r5, r7
20026d00:	1864      	adds	r4, r4, r1
20026d02:	9907      	ldr	r1, [sp, #28]
20026d04:	eb41 0505 	adc.w	r5, r1, r5
20026d08:	9904      	ldr	r1, [sp, #16]
20026d0a:	9e0a      	ldr	r6, [sp, #40]	@ 0x28
20026d0c:	ea81 0706 	eor.w	r7, r1, r6
20026d10:	9905      	ldr	r1, [sp, #20]
20026d12:	9e0b      	ldr	r6, [sp, #44]	@ 0x2c
20026d14:	404e      	eors	r6, r1
20026d16:	9908      	ldr	r1, [sp, #32]
20026d18:	400f      	ands	r7, r1
20026d1a:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d1c:	400e      	ands	r6, r1
20026d1e:	9904      	ldr	r1, [sp, #16]
20026d20:	404f      	eors	r7, r1
20026d22:	9905      	ldr	r1, [sp, #20]
20026d24:	19e4      	adds	r4, r4, r7
20026d26:	ea86 0601 	eor.w	r6, r6, r1
20026d2a:	9908      	ldr	r1, [sp, #32]
20026d2c:	eb45 0506 	adc.w	r5, r5, r6
20026d30:	0b8f      	lsrs	r7, r1, #14
20026d32:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d34:	ea47 4781 	orr.w	r7, r7, r1, lsl #18
20026d38:	ea4f 3891 	mov.w	r8, r1, lsr #14
20026d3c:	9908      	ldr	r1, [sp, #32]
20026d3e:	ea48 4881 	orr.w	r8, r8, r1, lsl #18
20026d42:	ea4f 4991 	mov.w	r9, r1, lsr #18
20026d46:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d48:	ea49 3981 	orr.w	r9, r9, r1, lsl #14
20026d4c:	0c8e      	lsrs	r6, r1, #18
20026d4e:	9908      	ldr	r1, [sp, #32]
20026d50:	ea87 0709 	eor.w	r7, r7, r9
20026d54:	ea46 3681 	orr.w	r6, r6, r1, lsl #14
20026d58:	ea88 0806 	eor.w	r8, r8, r6
20026d5c:	05ce      	lsls	r6, r1, #23
20026d5e:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d60:	ea46 2651 	orr.w	r6, r6, r1, lsr #9
20026d64:	ea4f 59c1 	mov.w	r9, r1, lsl #23
20026d68:	9908      	ldr	r1, [sp, #32]
20026d6a:	407e      	eors	r6, r7
20026d6c:	ea49 2951 	orr.w	r9, r9, r1, lsr #9
20026d70:	19a4      	adds	r4, r4, r6
20026d72:	ea88 0809 	eor.w	r8, r8, r9
20026d76:	eb45 0808 	adc.w	r8, r5, r8
20026d7a:	eb1c 0104 	adds.w	r1, ip, r4
20026d7e:	9106      	str	r1, [sp, #24]
20026d80:	eb4e 0108 	adc.w	r1, lr, r8
20026d84:	9107      	str	r1, [sp, #28]
20026d86:	9901      	ldr	r1, [sp, #4]
20026d88:	0f0f      	lsrs	r7, r1, #28
20026d8a:	9902      	ldr	r1, [sp, #8]
20026d8c:	ea47 1701 	orr.w	r7, r7, r1, lsl #4
20026d90:	0f0e      	lsrs	r6, r1, #28
20026d92:	9901      	ldr	r1, [sp, #4]
20026d94:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
20026d98:	ea4f 7c81 	mov.w	ip, r1, lsl #30
20026d9c:	9902      	ldr	r1, [sp, #8]
20026d9e:	ea4c 0c91 	orr.w	ip, ip, r1, lsr #2
20026da2:	078d      	lsls	r5, r1, #30
20026da4:	9901      	ldr	r1, [sp, #4]
20026da6:	ea87 070c 	eor.w	r7, r7, ip
20026daa:	ea45 0591 	orr.w	r5, r5, r1, lsr #2
20026dae:	ea4f 6c41 	mov.w	ip, r1, lsl #25
20026db2:	9902      	ldr	r1, [sp, #8]
20026db4:	406e      	eors	r6, r5
20026db6:	ea4c 1cd1 	orr.w	ip, ip, r1, lsr #7
20026dba:	064d      	lsls	r5, r1, #25
20026dbc:	9901      	ldr	r1, [sp, #4]
20026dbe:	ea87 070c 	eor.w	r7, r7, ip
20026dc2:	ea45 15d1 	orr.w	r5, r5, r1, lsr #7
20026dc6:	406e      	eors	r6, r5
20026dc8:	9903      	ldr	r1, [sp, #12]
20026dca:	9d01      	ldr	r5, [sp, #4]
20026dcc:	430d      	orrs	r5, r1
20026dce:	9902      	ldr	r1, [sp, #8]
20026dd0:	ea4b 0c01 	orr.w	ip, fp, r1
20026dd4:	ea05 0103 	and.w	r1, r5, r3
20026dd8:	910c      	str	r1, [sp, #48]	@ 0x30
20026dda:	9d01      	ldr	r5, [sp, #4]
20026ddc:	9903      	ldr	r1, [sp, #12]
20026dde:	ea0c 0c02 	and.w	ip, ip, r2
20026de2:	ea01 0905 	and.w	r9, r1, r5
20026de6:	9902      	ldr	r1, [sp, #8]
20026de8:	ea0b 0e01 	and.w	lr, fp, r1
20026dec:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026dee:	ea4c 0c0e 	orr.w	ip, ip, lr
20026df2:	ea41 0509 	orr.w	r5, r1, r9
20026df6:	9900      	ldr	r1, [sp, #0]
20026df8:	197d      	adds	r5, r7, r5
20026dfa:	eb46 060c 	adc.w	r6, r6, ip
20026dfe:	eb15 0904 	adds.w	r9, r5, r4
20026e02:	e9d1 4506 	ldrd	r4, r5, [r1, #24]
20026e06:	9904      	ldr	r1, [sp, #16]
20026e08:	eb48 0806 	adc.w	r8, r8, r6
20026e0c:	e9d0 6706 	ldrd	r6, r7, [r0, #24]
20026e10:	19a4      	adds	r4, r4, r6
20026e12:	eb45 0507 	adc.w	r5, r5, r7
20026e16:	1864      	adds	r4, r4, r1
20026e18:	9905      	ldr	r1, [sp, #20]
20026e1a:	9e08      	ldr	r6, [sp, #32]
20026e1c:	eb41 0505 	adc.w	r5, r1, r5
20026e20:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026e22:	ea81 0706 	eor.w	r7, r1, r6
20026e26:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026e28:	9e09      	ldr	r6, [sp, #36]	@ 0x24
20026e2a:	404e      	eors	r6, r1
20026e2c:	9906      	ldr	r1, [sp, #24]
20026e2e:	400f      	ands	r7, r1
20026e30:	9907      	ldr	r1, [sp, #28]
20026e32:	400e      	ands	r6, r1
20026e34:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026e36:	404f      	eors	r7, r1
20026e38:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026e3a:	19e4      	adds	r4, r4, r7
20026e3c:	ea86 0601 	eor.w	r6, r6, r1
20026e40:	9906      	ldr	r1, [sp, #24]
20026e42:	eb45 0506 	adc.w	r5, r5, r6
20026e46:	ea4f 3c91 	mov.w	ip, r1, lsr #14
20026e4a:	9907      	ldr	r1, [sp, #28]
20026e4c:	ea4c 4c81 	orr.w	ip, ip, r1, lsl #18
20026e50:	0b8e      	lsrs	r6, r1, #14
20026e52:	9906      	ldr	r1, [sp, #24]
20026e54:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
20026e58:	ea4f 4e91 	mov.w	lr, r1, lsr #18
20026e5c:	9907      	ldr	r1, [sp, #28]
20026e5e:	ea4e 3e81 	orr.w	lr, lr, r1, lsl #14
20026e62:	0c8f      	lsrs	r7, r1, #18
20026e64:	9906      	ldr	r1, [sp, #24]
20026e66:	ea8c 0c0e 	eor.w	ip, ip, lr
20026e6a:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
20026e6e:	407e      	eors	r6, r7
20026e70:	05cf      	lsls	r7, r1, #23
20026e72:	9907      	ldr	r1, [sp, #28]
20026e74:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
20026e78:	ea4f 5ec1 	mov.w	lr, r1, lsl #23
20026e7c:	9906      	ldr	r1, [sp, #24]
20026e7e:	ea8c 0707 	eor.w	r7, ip, r7
20026e82:	ea4e 2e51 	orr.w	lr, lr, r1, lsr #9
20026e86:	19e4      	adds	r4, r4, r7
20026e88:	ea86 060e 	eor.w	r6, r6, lr
20026e8c:	eb45 0606 	adc.w	r6, r5, r6
20026e90:	191b      	adds	r3, r3, r4
20026e92:	930c      	str	r3, [sp, #48]	@ 0x30
20026e94:	eb42 0306 	adc.w	r3, r2, r6
20026e98:	930d      	str	r3, [sp, #52]	@ 0x34
20026e9a:	ea4f 7218 	mov.w	r2, r8, lsr #28
20026e9e:	ea4f 7388 	mov.w	r3, r8, lsl #30
20026ea2:	ea43 0399 	orr.w	r3, r3, r9, lsr #2
20026ea6:	ea4f 7519 	mov.w	r5, r9, lsr #28
20026eaa:	ea42 1209 	orr.w	r2, r2, r9, lsl #4
20026eae:	ea4f 7789 	mov.w	r7, r9, lsl #30
20026eb2:	ea47 0798 	orr.w	r7, r7, r8, lsr #2
20026eb6:	ea45 1508 	orr.w	r5, r5, r8, lsl #4
20026eba:	405a      	eors	r2, r3
20026ebc:	ea4f 6348 	mov.w	r3, r8, lsl #25
20026ec0:	9902      	ldr	r1, [sp, #8]
20026ec2:	ea43 13d9 	orr.w	r3, r3, r9, lsr #7
20026ec6:	407d      	eors	r5, r7
20026ec8:	ea4f 6749 	mov.w	r7, r9, lsl #25
20026ecc:	ea47 17d8 	orr.w	r7, r7, r8, lsr #7
20026ed0:	405a      	eors	r2, r3
20026ed2:	9b01      	ldr	r3, [sp, #4]
20026ed4:	407d      	eors	r5, r7
20026ed6:	ea41 0708 	orr.w	r7, r1, r8
20026eda:	9903      	ldr	r1, [sp, #12]
20026edc:	ea43 0309 	orr.w	r3, r3, r9
20026ee0:	400b      	ands	r3, r1
20026ee2:	9901      	ldr	r1, [sp, #4]
20026ee4:	ea07 070b 	and.w	r7, r7, fp
20026ee8:	ea01 0e09 	and.w	lr, r1, r9
20026eec:	9902      	ldr	r1, [sp, #8]
20026eee:	ea43 030e 	orr.w	r3, r3, lr
20026ef2:	ea01 0c08 	and.w	ip, r1, r8
20026ef6:	ea47 070c 	orr.w	r7, r7, ip
20026efa:	18eb      	adds	r3, r5, r3
20026efc:	eb42 0207 	adc.w	r2, r2, r7
20026f00:	191b      	adds	r3, r3, r4
20026f02:	9304      	str	r3, [sp, #16]
20026f04:	eb46 0302 	adc.w	r3, r6, r2
20026f08:	9305      	str	r3, [sp, #20]
20026f0a:	9b00      	ldr	r3, [sp, #0]
20026f0c:	6a1b      	ldr	r3, [r3, #32]
20026f0e:	9a00      	ldr	r2, [sp, #0]
20026f10:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026f12:	6a52      	ldr	r2, [r2, #36]	@ 0x24
20026f14:	e9d0 4508 	ldrd	r4, r5, [r0, #32]
20026f18:	191b      	adds	r3, r3, r4
20026f1a:	eb42 0205 	adc.w	r2, r2, r5
20026f1e:	185b      	adds	r3, r3, r1
20026f20:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026f22:	9c06      	ldr	r4, [sp, #24]
20026f24:	eb41 0202 	adc.w	r2, r1, r2
20026f28:	9908      	ldr	r1, [sp, #32]
20026f2a:	ea81 0504 	eor.w	r5, r1, r4
20026f2e:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026f30:	9c07      	ldr	r4, [sp, #28]
20026f32:	404c      	eors	r4, r1
20026f34:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f36:	400d      	ands	r5, r1
20026f38:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026f3a:	400c      	ands	r4, r1
20026f3c:	9908      	ldr	r1, [sp, #32]
20026f3e:	404d      	eors	r5, r1
20026f40:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026f42:	195b      	adds	r3, r3, r5
20026f44:	ea84 0401 	eor.w	r4, r4, r1
20026f48:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f4a:	eb42 0204 	adc.w	r2, r2, r4
20026f4e:	0b8e      	lsrs	r6, r1, #14
20026f50:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026f52:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
20026f56:	0b8c      	lsrs	r4, r1, #14
20026f58:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f5a:	ea44 4481 	orr.w	r4, r4, r1, lsl #18
20026f5e:	0c8f      	lsrs	r7, r1, #18
20026f60:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026f62:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
20026f66:	0c8d      	lsrs	r5, r1, #18
20026f68:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f6a:	407e      	eors	r6, r7
20026f6c:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
20026f70:	406c      	eors	r4, r5
20026f72:	05cd      	lsls	r5, r1, #23
20026f74:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026f76:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
20026f7a:	05cf      	lsls	r7, r1, #23
20026f7c:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f7e:	4075      	eors	r5, r6
20026f80:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
20026f84:	9903      	ldr	r1, [sp, #12]
20026f86:	195b      	adds	r3, r3, r5
20026f88:	ea84 0407 	eor.w	r4, r4, r7
20026f8c:	eb42 0204 	adc.w	r2, r2, r4
20026f90:	18c9      	adds	r1, r1, r3
20026f92:	910a      	str	r1, [sp, #40]	@ 0x28
20026f94:	eb4b 0102 	adc.w	r1, fp, r2
20026f98:	910b      	str	r1, [sp, #44]	@ 0x2c
20026f9a:	9904      	ldr	r1, [sp, #16]
20026f9c:	0f0e      	lsrs	r6, r1, #28
20026f9e:	9905      	ldr	r1, [sp, #20]
20026fa0:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
20026fa4:	0f0d      	lsrs	r5, r1, #28
20026fa6:	9904      	ldr	r1, [sp, #16]
20026fa8:	ea45 1501 	orr.w	r5, r5, r1, lsl #4
20026fac:	078f      	lsls	r7, r1, #30
20026fae:	9905      	ldr	r1, [sp, #20]
20026fb0:	ea47 0791 	orr.w	r7, r7, r1, lsr #2
20026fb4:	078c      	lsls	r4, r1, #30
20026fb6:	9904      	ldr	r1, [sp, #16]
20026fb8:	407e      	eors	r6, r7
20026fba:	ea44 0491 	orr.w	r4, r4, r1, lsr #2
20026fbe:	064f      	lsls	r7, r1, #25
20026fc0:	9905      	ldr	r1, [sp, #20]
20026fc2:	4065      	eors	r5, r4
20026fc4:	ea47 17d1 	orr.w	r7, r7, r1, lsr #7
20026fc8:	064c      	lsls	r4, r1, #25
20026fca:	9904      	ldr	r1, [sp, #16]
20026fcc:	407e      	eors	r6, r7
20026fce:	ea44 14d1 	orr.w	r4, r4, r1, lsr #7
20026fd2:	4065      	eors	r5, r4
20026fd4:	ea49 0401 	orr.w	r4, r9, r1
20026fd8:	9905      	ldr	r1, [sp, #20]
20026fda:	ea48 0701 	orr.w	r7, r8, r1
20026fde:	9901      	ldr	r1, [sp, #4]
20026fe0:	400c      	ands	r4, r1
20026fe2:	9902      	ldr	r1, [sp, #8]
20026fe4:	400f      	ands	r7, r1
20026fe6:	9904      	ldr	r1, [sp, #16]
20026fe8:	ea09 0e01 	and.w	lr, r9, r1
20026fec:	9905      	ldr	r1, [sp, #20]
20026fee:	ea44 040e 	orr.w	r4, r4, lr
20026ff2:	ea08 0c01 	and.w	ip, r8, r1
20026ff6:	1934      	adds	r4, r6, r4
20026ff8:	ea47 070c 	orr.w	r7, r7, ip
20026ffc:	eb45 0507 	adc.w	r5, r5, r7
20027000:	18e3      	adds	r3, r4, r3
20027002:	9303      	str	r3, [sp, #12]
20027004:	9b00      	ldr	r3, [sp, #0]
20027006:	eb42 0b05 	adc.w	fp, r2, r5
2002700a:	9a00      	ldr	r2, [sp, #0]
2002700c:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
2002700e:	9908      	ldr	r1, [sp, #32]
20027010:	6ad2      	ldr	r2, [r2, #44]	@ 0x2c
20027012:	e9d0 450a 	ldrd	r4, r5, [r0, #40]	@ 0x28
20027016:	191b      	adds	r3, r3, r4
20027018:	eb42 0205 	adc.w	r2, r2, r5
2002701c:	185b      	adds	r3, r3, r1
2002701e:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027020:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
20027022:	eb41 0202 	adc.w	r2, r1, r2
20027026:	9906      	ldr	r1, [sp, #24]
20027028:	ea81 0504 	eor.w	r5, r1, r4
2002702c:	9907      	ldr	r1, [sp, #28]
2002702e:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
20027030:	404c      	eors	r4, r1
20027032:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027034:	400d      	ands	r5, r1
20027036:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027038:	400c      	ands	r4, r1
2002703a:	9906      	ldr	r1, [sp, #24]
2002703c:	404d      	eors	r5, r1
2002703e:	9907      	ldr	r1, [sp, #28]
20027040:	195b      	adds	r3, r3, r5
20027042:	ea84 0401 	eor.w	r4, r4, r1
20027046:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027048:	eb42 0204 	adc.w	r2, r2, r4
2002704c:	0b8e      	lsrs	r6, r1, #14
2002704e:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027050:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
20027054:	0b8c      	lsrs	r4, r1, #14
20027056:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027058:	ea44 4481 	orr.w	r4, r4, r1, lsl #18
2002705c:	0c8f      	lsrs	r7, r1, #18
2002705e:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027060:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
20027064:	0c8d      	lsrs	r5, r1, #18
20027066:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027068:	407e      	eors	r6, r7
2002706a:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
2002706e:	406c      	eors	r4, r5
20027070:	05cd      	lsls	r5, r1, #23
20027072:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027074:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
20027078:	05cf      	lsls	r7, r1, #23
2002707a:	990a      	ldr	r1, [sp, #40]	@ 0x28
2002707c:	4075      	eors	r5, r6
2002707e:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
20027082:	9901      	ldr	r1, [sp, #4]
20027084:	195b      	adds	r3, r3, r5
20027086:	ea84 0407 	eor.w	r4, r4, r7
2002708a:	eb42 0204 	adc.w	r2, r2, r4
2002708e:	18c9      	adds	r1, r1, r3
20027090:	9108      	str	r1, [sp, #32]
20027092:	9902      	ldr	r1, [sp, #8]
20027094:	ea4f 751b 	mov.w	r5, fp, lsr #28
20027098:	eb41 0102 	adc.w	r1, r1, r2
2002709c:	9109      	str	r1, [sp, #36]	@ 0x24
2002709e:	9903      	ldr	r1, [sp, #12]
200270a0:	ea4f 748b 	mov.w	r4, fp, lsl #30
200270a4:	ea44 0491 	orr.w	r4, r4, r1, lsr #2
200270a8:	ea45 1501 	orr.w	r5, r5, r1, lsl #4
200270ac:	0f0e      	lsrs	r6, r1, #28
200270ae:	078f      	lsls	r7, r1, #30
200270b0:	4065      	eors	r5, r4
200270b2:	ea4f 644b 	mov.w	r4, fp, lsl #25
200270b6:	ea47 079b 	orr.w	r7, r7, fp, lsr #2
200270ba:	ea44 14d1 	orr.w	r4, r4, r1, lsr #7
200270be:	ea46 160b 	orr.w	r6, r6, fp, lsl #4
200270c2:	407e      	eors	r6, r7
200270c4:	4065      	eors	r5, r4
200270c6:	064f      	lsls	r7, r1, #25
200270c8:	e9dd 4103 	ldrd	r4, r1, [sp, #12]
200270cc:	430c      	orrs	r4, r1
200270ce:	9905      	ldr	r1, [sp, #20]
200270d0:	ea47 17db 	orr.w	r7, r7, fp, lsr #7
200270d4:	407e      	eors	r6, r7
200270d6:	ea41 070b 	orr.w	r7, r1, fp
200270da:	ea04 0109 	and.w	r1, r4, r9
200270de:	9101      	str	r1, [sp, #4]
200270e0:	e9dd 4103 	ldrd	r4, r1, [sp, #12]
200270e4:	ea01 0e04 	and.w	lr, r1, r4
200270e8:	9905      	ldr	r1, [sp, #20]
200270ea:	ea07 0708 	and.w	r7, r7, r8
200270ee:	ea01 0c0b 	and.w	ip, r1, fp
200270f2:	9901      	ldr	r1, [sp, #4]
200270f4:	ea47 070c 	orr.w	r7, r7, ip
200270f8:	ea41 040e 	orr.w	r4, r1, lr
200270fc:	1934      	adds	r4, r6, r4
200270fe:	eb45 0507 	adc.w	r5, r5, r7
20027102:	18e3      	adds	r3, r4, r3
20027104:	9301      	str	r3, [sp, #4]
20027106:	eb42 0305 	adc.w	r3, r2, r5
2002710a:	9302      	str	r3, [sp, #8]
2002710c:	9b00      	ldr	r3, [sp, #0]
2002710e:	9a00      	ldr	r2, [sp, #0]
20027110:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
20027112:	9906      	ldr	r1, [sp, #24]
20027114:	6b52      	ldr	r2, [r2, #52]	@ 0x34
20027116:	e9d0 450c 	ldrd	r4, r5, [r0, #48]	@ 0x30
2002711a:	191b      	adds	r3, r3, r4
2002711c:	eb42 0205 	adc.w	r2, r2, r5
20027120:	185b      	adds	r3, r3, r1
20027122:	9907      	ldr	r1, [sp, #28]
20027124:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
20027126:	eb41 0202 	adc.w	r2, r1, r2
2002712a:	990c      	ldr	r1, [sp, #48]	@ 0x30
2002712c:	ea81 0504 	eor.w	r5, r1, r4
20027130:	990d      	ldr	r1, [sp, #52]	@ 0x34
20027132:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
20027134:	404c      	eors	r4, r1
20027136:	9908      	ldr	r1, [sp, #32]
20027138:	400d      	ands	r5, r1
2002713a:	9909      	ldr	r1, [sp, #36]	@ 0x24
2002713c:	400c      	ands	r4, r1
2002713e:	990c      	ldr	r1, [sp, #48]	@ 0x30
20027140:	404d      	eors	r5, r1
20027142:	990d      	ldr	r1, [sp, #52]	@ 0x34
20027144:	195b      	adds	r3, r3, r5
20027146:	ea84 0401 	eor.w	r4, r4, r1
2002714a:	9908      	ldr	r1, [sp, #32]
2002714c:	eb42 0204 	adc.w	r2, r2, r4
20027150:	0b8e      	lsrs	r6, r1, #14
20027152:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027154:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
20027158:	0b8c      	lsrs	r4, r1, #14
2002715a:	9908      	ldr	r1, [sp, #32]
2002715c:	ea44 4481 	orr.w	r4, r4, r1, lsl #18
20027160:	0c8f      	lsrs	r7, r1, #18
20027162:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027164:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
20027168:	0c8d      	lsrs	r5, r1, #18
2002716a:	9908      	ldr	r1, [sp, #32]
2002716c:	407e      	eors	r6, r7
2002716e:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
20027172:	406c      	eors	r4, r5
20027174:	05cd      	lsls	r5, r1, #23
20027176:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027178:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
2002717c:	05cf      	lsls	r7, r1, #23
2002717e:	9908      	ldr	r1, [sp, #32]
20027180:	4075      	eors	r5, r6
20027182:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
20027186:	195b      	adds	r3, r3, r5
20027188:	ea84 0407 	eor.w	r4, r4, r7
2002718c:	eb42 0204 	adc.w	r2, r2, r4
20027190:	eb19 0103 	adds.w	r1, r9, r3
20027194:	9106      	str	r1, [sp, #24]
20027196:	eb48 0102 	adc.w	r1, r8, r2
2002719a:	9107      	str	r1, [sp, #28]
2002719c:	9901      	ldr	r1, [sp, #4]
2002719e:	0f0e      	lsrs	r6, r1, #28
200271a0:	9902      	ldr	r1, [sp, #8]
200271a2:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
200271a6:	0f0d      	lsrs	r5, r1, #28
200271a8:	9901      	ldr	r1, [sp, #4]
200271aa:	ea45 1501 	orr.w	r5, r5, r1, lsl #4
200271ae:	078f      	lsls	r7, r1, #30
200271b0:	9902      	ldr	r1, [sp, #8]
200271b2:	ea47 0791 	orr.w	r7, r7, r1, lsr #2
200271b6:	078c      	lsls	r4, r1, #30
200271b8:	9901      	ldr	r1, [sp, #4]
200271ba:	407e      	eors	r6, r7
200271bc:	ea44 0491 	orr.w	r4, r4, r1, lsr #2
200271c0:	064f      	lsls	r7, r1, #25
200271c2:	9902      	ldr	r1, [sp, #8]
200271c4:	4065      	eors	r5, r4
200271c6:	ea47 17d1 	orr.w	r7, r7, r1, lsr #7
200271ca:	064c      	lsls	r4, r1, #25
200271cc:	9901      	ldr	r1, [sp, #4]
200271ce:	407e      	eors	r6, r7
200271d0:	ea44 14d1 	orr.w	r4, r4, r1, lsr #7
200271d4:	4065      	eors	r5, r4
200271d6:	9903      	ldr	r1, [sp, #12]
200271d8:	9c01      	ldr	r4, [sp, #4]
200271da:	430c      	orrs	r4, r1
200271dc:	9902      	ldr	r1, [sp, #8]
200271de:	ea4b 0701 	orr.w	r7, fp, r1
200271e2:	9904      	ldr	r1, [sp, #16]
200271e4:	ea04 0801 	and.w	r8, r4, r1
200271e8:	9905      	ldr	r1, [sp, #20]
200271ea:	9c01      	ldr	r4, [sp, #4]
200271ec:	400f      	ands	r7, r1
200271ee:	9903      	ldr	r1, [sp, #12]
200271f0:	ea01 0e04 	and.w	lr, r1, r4
200271f4:	9902      	ldr	r1, [sp, #8]
200271f6:	ea48 040e 	orr.w	r4, r8, lr
200271fa:	ea0b 0c01 	and.w	ip, fp, r1
200271fe:	1934      	adds	r4, r6, r4
20027200:	ea47 070c 	orr.w	r7, r7, ip
20027204:	eb45 0507 	adc.w	r5, r5, r7
20027208:	eb14 0c03 	adds.w	ip, r4, r3
2002720c:	9b00      	ldr	r3, [sp, #0]
2002720e:	eb42 0e05 	adc.w	lr, r2, r5
20027212:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
20027214:	9a00      	ldr	r2, [sp, #0]
20027216:	e9d0 450e 	ldrd	r4, r5, [r0, #56]	@ 0x38
2002721a:	6bd2      	ldr	r2, [r2, #60]	@ 0x3c
2002721c:	191c      	adds	r4, r3, r4
2002721e:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
20027220:	eb42 0205 	adc.w	r2, r2, r5
20027224:	18e4      	adds	r4, r4, r3
20027226:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
20027228:	9908      	ldr	r1, [sp, #32]
2002722a:	eb43 0202 	adc.w	r2, r3, r2
2002722e:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
20027230:	3040      	adds	r0, #64	@ 0x40
20027232:	ea83 0501 	eor.w	r5, r3, r1
20027236:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027238:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
2002723a:	404b      	eors	r3, r1
2002723c:	9906      	ldr	r1, [sp, #24]
2002723e:	400d      	ands	r5, r1
20027240:	9907      	ldr	r1, [sp, #28]
20027242:	400b      	ands	r3, r1
20027244:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027246:	404d      	eors	r5, r1
20027248:	990b      	ldr	r1, [sp, #44]	@ 0x2c
2002724a:	1964      	adds	r4, r4, r5
2002724c:	ea83 0301 	eor.w	r3, r3, r1
20027250:	eb42 0203 	adc.w	r2, r2, r3
20027254:	9b06      	ldr	r3, [sp, #24]
20027256:	9906      	ldr	r1, [sp, #24]
20027258:	0b9e      	lsrs	r6, r3, #14
2002725a:	9b07      	ldr	r3, [sp, #28]
2002725c:	0c8f      	lsrs	r7, r1, #18
2002725e:	ea46 4683 	orr.w	r6, r6, r3, lsl #18
20027262:	0b9b      	lsrs	r3, r3, #14
20027264:	ea43 4381 	orr.w	r3, r3, r1, lsl #18
20027268:	9907      	ldr	r1, [sp, #28]
2002726a:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
2002726e:	0c8d      	lsrs	r5, r1, #18
20027270:	9906      	ldr	r1, [sp, #24]
20027272:	407e      	eors	r6, r7
20027274:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
20027278:	406b      	eors	r3, r5
2002727a:	05cd      	lsls	r5, r1, #23
2002727c:	9907      	ldr	r1, [sp, #28]
2002727e:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
20027282:	05cf      	lsls	r7, r1, #23
20027284:	9906      	ldr	r1, [sp, #24]
20027286:	4075      	eors	r5, r6
20027288:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
2002728c:	1964      	adds	r4, r4, r5
2002728e:	ea83 0307 	eor.w	r3, r3, r7
20027292:	eb42 0203 	adc.w	r2, r2, r3
20027296:	9b04      	ldr	r3, [sp, #16]
20027298:	ea4f 751e 	mov.w	r5, lr, lsr #28
2002729c:	191b      	adds	r3, r3, r4
2002729e:	9304      	str	r3, [sp, #16]
200272a0:	9b05      	ldr	r3, [sp, #20]
200272a2:	ea4f 761c 	mov.w	r6, ip, lsr #28
200272a6:	eb43 0302 	adc.w	r3, r3, r2
200272aa:	9305      	str	r3, [sp, #20]
200272ac:	ea4f 738e 	mov.w	r3, lr, lsl #30
200272b0:	ea43 039c 	orr.w	r3, r3, ip, lsr #2
200272b4:	ea45 150c 	orr.w	r5, r5, ip, lsl #4
200272b8:	ea4f 778c 	mov.w	r7, ip, lsl #30
200272bc:	ea47 079e 	orr.w	r7, r7, lr, lsr #2
200272c0:	405d      	eors	r5, r3
200272c2:	ea46 160e 	orr.w	r6, r6, lr, lsl #4
200272c6:	ea4f 634e 	mov.w	r3, lr, lsl #25
200272ca:	9902      	ldr	r1, [sp, #8]
200272cc:	407e      	eors	r6, r7
200272ce:	ea43 13dc 	orr.w	r3, r3, ip, lsr #7
200272d2:	ea4f 674c 	mov.w	r7, ip, lsl #25
200272d6:	ea47 17de 	orr.w	r7, r7, lr, lsr #7
200272da:	405d      	eors	r5, r3
200272dc:	9b01      	ldr	r3, [sp, #4]
200272de:	407e      	eors	r6, r7
200272e0:	ea41 070e 	orr.w	r7, r1, lr
200272e4:	9903      	ldr	r1, [sp, #12]
200272e6:	ea43 030c 	orr.w	r3, r3, ip
200272ea:	400b      	ands	r3, r1
200272ec:	9901      	ldr	r1, [sp, #4]
200272ee:	ea07 070b 	and.w	r7, r7, fp
200272f2:	ea01 090c 	and.w	r9, r1, ip
200272f6:	9902      	ldr	r1, [sp, #8]
200272f8:	ea43 0309 	orr.w	r3, r3, r9
200272fc:	ea01 080e 	and.w	r8, r1, lr
20027300:	9900      	ldr	r1, [sp, #0]
20027302:	18f3      	adds	r3, r6, r3
20027304:	f101 0140 	add.w	r1, r1, #64	@ 0x40
20027308:	9100      	str	r1, [sp, #0]
2002730a:	ea47 0708 	orr.w	r7, r7, r8
2002730e:	eb45 0507 	adc.w	r5, r5, r7
20027312:	4928      	ldr	r1, [pc, #160]	@ (200273b4 <mbedtls_sha512_process+0xa54>)
20027314:	191b      	adds	r3, r3, r4
20027316:	9c00      	ldr	r4, [sp, #0]
20027318:	eb42 0205 	adc.w	r2, r2, r5
2002731c:	42a1      	cmp	r1, r4
2002731e:	f47f abe3 	bne.w	20026ae8 <mbedtls_sha512_process+0x188>
20027322:	990e      	ldr	r1, [sp, #56]	@ 0x38
20027324:	18cb      	adds	r3, r1, r3
20027326:	990f      	ldr	r1, [sp, #60]	@ 0x3c
20027328:	eb42 0201 	adc.w	r2, r2, r1
2002732c:	e9ca 3204 	strd	r3, r2, [sl, #16]
20027330:	9b10      	ldr	r3, [sp, #64]	@ 0x40
20027332:	9a11      	ldr	r2, [sp, #68]	@ 0x44
20027334:	eb13 030c 	adds.w	r3, r3, ip
20027338:	eb4e 0202 	adc.w	r2, lr, r2
2002733c:	e9ca 3206 	strd	r3, r2, [sl, #24]
20027340:	9a01      	ldr	r2, [sp, #4]
20027342:	9b12      	ldr	r3, [sp, #72]	@ 0x48
20027344:	9913      	ldr	r1, [sp, #76]	@ 0x4c
20027346:	189b      	adds	r3, r3, r2
20027348:	9a02      	ldr	r2, [sp, #8]
2002734a:	eb42 0201 	adc.w	r2, r2, r1
2002734e:	e9ca 3208 	strd	r3, r2, [sl, #32]
20027352:	9a03      	ldr	r2, [sp, #12]
20027354:	9b14      	ldr	r3, [sp, #80]	@ 0x50
20027356:	9917      	ldr	r1, [sp, #92]	@ 0x5c
20027358:	189b      	adds	r3, r3, r2
2002735a:	9a15      	ldr	r2, [sp, #84]	@ 0x54
2002735c:	eb4b 0202 	adc.w	r2, fp, r2
20027360:	e9ca 320a 	strd	r3, r2, [sl, #40]	@ 0x28
20027364:	9a04      	ldr	r2, [sp, #16]
20027366:	9b16      	ldr	r3, [sp, #88]	@ 0x58
20027368:	189b      	adds	r3, r3, r2
2002736a:	9a05      	ldr	r2, [sp, #20]
2002736c:	eb42 0201 	adc.w	r2, r2, r1
20027370:	e9ca 320c 	strd	r3, r2, [sl, #48]	@ 0x30
20027374:	9b18      	ldr	r3, [sp, #96]	@ 0x60
20027376:	9a06      	ldr	r2, [sp, #24]
20027378:	9919      	ldr	r1, [sp, #100]	@ 0x64
2002737a:	189a      	adds	r2, r3, r2
2002737c:	9b07      	ldr	r3, [sp, #28]
2002737e:	eb43 0301 	adc.w	r3, r3, r1
20027382:	e9ca 230e 	strd	r2, r3, [sl, #56]	@ 0x38
20027386:	9b1a      	ldr	r3, [sp, #104]	@ 0x68
20027388:	9a08      	ldr	r2, [sp, #32]
2002738a:	991b      	ldr	r1, [sp, #108]	@ 0x6c
2002738c:	189a      	adds	r2, r3, r2
2002738e:	9b09      	ldr	r3, [sp, #36]	@ 0x24
20027390:	eb43 0301 	adc.w	r3, r3, r1
20027394:	e9ca 2310 	strd	r2, r3, [sl, #64]	@ 0x40
20027398:	9b1c      	ldr	r3, [sp, #112]	@ 0x70
2002739a:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
2002739c:	991d      	ldr	r1, [sp, #116]	@ 0x74
2002739e:	189a      	adds	r2, r3, r2
200273a0:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
200273a2:	eb43 0301 	adc.w	r3, r3, r1
200273a6:	e9ca 2312 	strd	r2, r3, [sl, #72]	@ 0x48
200273aa:	f50d 7d3f 	add.w	sp, sp, #764	@ 0x2fc
200273ae:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200273b2:	bf00      	nop
200273b4:	2002c198 	.word	0x2002c198

200273b8 <mbedtls_sha512_update.part.0>:
200273b8:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
200273bc:	4615      	mov	r5, r2
200273be:	e9d0 3200 	ldrd	r3, r2, [r0]
200273c2:	f003 077f 	and.w	r7, r3, #127	@ 0x7f
200273c6:	195b      	adds	r3, r3, r5
200273c8:	f152 0200 	adcs.w	r2, r2, #0
200273cc:	460e      	mov	r6, r1
200273ce:	f04f 0100 	mov.w	r1, #0
200273d2:	bf28      	it	cs
200273d4:	2101      	movcs	r1, #1
200273d6:	4604      	mov	r4, r0
200273d8:	e9c0 3200 	strd	r3, r2, [r0]
200273dc:	b131      	cbz	r1, 200273ec <mbedtls_sha512_update.part.0+0x34>
200273de:	e9d0 3202 	ldrd	r3, r2, [r0, #8]
200273e2:	3301      	adds	r3, #1
200273e4:	f142 0200 	adc.w	r2, r2, #0
200273e8:	e9c0 3202 	strd	r3, r2, [r0, #8]
200273ec:	b19f      	cbz	r7, 20027416 <mbedtls_sha512_update.part.0+0x5e>
200273ee:	f1c7 0980 	rsb	r9, r7, #128	@ 0x80
200273f2:	45a9      	cmp	r9, r5
200273f4:	d80f      	bhi.n	20027416 <mbedtls_sha512_update.part.0+0x5e>
200273f6:	f104 0850 	add.w	r8, r4, #80	@ 0x50
200273fa:	4631      	mov	r1, r6
200273fc:	464a      	mov	r2, r9
200273fe:	eb08 0007 	add.w	r0, r8, r7
20027402:	f003 fa1d 	bl	2002a840 <memcpy>
20027406:	3d80      	subs	r5, #128	@ 0x80
20027408:	4641      	mov	r1, r8
2002740a:	4620      	mov	r0, r4
2002740c:	443d      	add	r5, r7
2002740e:	f7ff faa7 	bl	20026960 <mbedtls_sha512_process>
20027412:	2700      	movs	r7, #0
20027414:	444e      	add	r6, r9
20027416:	46a8      	mov	r8, r5
20027418:	eb05 0906 	add.w	r9, r5, r6
2002741c:	e004      	b.n	20027428 <mbedtls_sha512_update.part.0+0x70>
2002741e:	4620      	mov	r0, r4
20027420:	f7ff fa9e 	bl	20026960 <mbedtls_sha512_process>
20027424:	f1a8 0880 	sub.w	r8, r8, #128	@ 0x80
20027428:	f1b8 0f7f 	cmp.w	r8, #127	@ 0x7f
2002742c:	eba9 0108 	sub.w	r1, r9, r8
20027430:	d8f5      	bhi.n	2002741e <mbedtls_sha512_update.part.0+0x66>
20027432:	f06f 037f 	mvn.w	r3, #127	@ 0x7f
20027436:	09e9      	lsrs	r1, r5, #7
20027438:	4359      	muls	r1, r3
2002743a:	186a      	adds	r2, r5, r1
2002743c:	d007      	beq.n	2002744e <mbedtls_sha512_update.part.0+0x96>
2002743e:	f104 0050 	add.w	r0, r4, #80	@ 0x50
20027442:	1a71      	subs	r1, r6, r1
20027444:	4438      	add	r0, r7
20027446:	e8bd 43f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
2002744a:	f003 b9f9 	b.w	2002a840 <memcpy>
2002744e:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

20027452 <mbedtls_sha512_update>:
20027452:	b10a      	cbz	r2, 20027458 <mbedtls_sha512_update+0x6>
20027454:	f7ff bfb0 	b.w	200273b8 <mbedtls_sha512_update.part.0>
20027458:	4770      	bx	lr
	...

2002745c <mbedtls_sha512_finish>:
2002745c:	b5f0      	push	{r4, r5, r6, r7, lr}
2002745e:	4604      	mov	r4, r0
20027460:	e9d0 2300 	ldrd	r2, r3, [r0]
20027464:	460d      	mov	r5, r1
20027466:	e9d0 6102 	ldrd	r6, r1, [r0, #8]
2002746a:	00c9      	lsls	r1, r1, #3
2002746c:	ea41 7156 	orr.w	r1, r1, r6, lsr #29
20027470:	b085      	sub	sp, #20
20027472:	0e0f      	lsrs	r7, r1, #24
20027474:	0f58      	lsrs	r0, r3, #29
20027476:	00db      	lsls	r3, r3, #3
20027478:	ea43 7352 	orr.w	r3, r3, r2, lsr #29
2002747c:	f88d 7000 	strb.w	r7, [sp]
20027480:	0c0f      	lsrs	r7, r1, #16
20027482:	f88d 7001 	strb.w	r7, [sp, #1]
20027486:	f88d 1003 	strb.w	r1, [sp, #3]
2002748a:	0a0f      	lsrs	r7, r1, #8
2002748c:	0e19      	lsrs	r1, r3, #24
2002748e:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20027492:	f88d 1008 	strb.w	r1, [sp, #8]
20027496:	00d6      	lsls	r6, r2, #3
20027498:	0c19      	lsrs	r1, r3, #16
2002749a:	f002 027f 	and.w	r2, r2, #127	@ 0x7f
2002749e:	2a6f      	cmp	r2, #111	@ 0x6f
200274a0:	ba00      	rev	r0, r0
200274a2:	f88d 1009 	strb.w	r1, [sp, #9]
200274a6:	ea4f 2113 	mov.w	r1, r3, lsr #8
200274aa:	bf94      	ite	ls
200274ac:	f1c2 0270 	rsbls	r2, r2, #112	@ 0x70
200274b0:	f1c2 02f0 	rsbhi	r2, r2, #240	@ 0xf0
200274b4:	9001      	str	r0, [sp, #4]
200274b6:	f88d 100a 	strb.w	r1, [sp, #10]
200274ba:	4620      	mov	r0, r4
200274bc:	4969      	ldr	r1, [pc, #420]	@ (20027664 <mbedtls_sha512_finish+0x208>)
200274be:	ba36      	rev	r6, r6
200274c0:	f88d 300b 	strb.w	r3, [sp, #11]
200274c4:	f88d 7002 	strb.w	r7, [sp, #2]
200274c8:	9603      	str	r6, [sp, #12]
200274ca:	f7ff ffc2 	bl	20027452 <mbedtls_sha512_update>
200274ce:	2210      	movs	r2, #16
200274d0:	4669      	mov	r1, sp
200274d2:	4620      	mov	r0, r4
200274d4:	f7ff ff70 	bl	200273b8 <mbedtls_sha512_update.part.0>
200274d8:	7de3      	ldrb	r3, [r4, #23]
200274da:	702b      	strb	r3, [r5, #0]
200274dc:	8ae3      	ldrh	r3, [r4, #22]
200274de:	706b      	strb	r3, [r5, #1]
200274e0:	6963      	ldr	r3, [r4, #20]
200274e2:	0a1b      	lsrs	r3, r3, #8
200274e4:	70ab      	strb	r3, [r5, #2]
200274e6:	6963      	ldr	r3, [r4, #20]
200274e8:	70eb      	strb	r3, [r5, #3]
200274ea:	7ce3      	ldrb	r3, [r4, #19]
200274ec:	712b      	strb	r3, [r5, #4]
200274ee:	8a63      	ldrh	r3, [r4, #18]
200274f0:	716b      	strb	r3, [r5, #5]
200274f2:	6923      	ldr	r3, [r4, #16]
200274f4:	0a1b      	lsrs	r3, r3, #8
200274f6:	71ab      	strb	r3, [r5, #6]
200274f8:	6923      	ldr	r3, [r4, #16]
200274fa:	71eb      	strb	r3, [r5, #7]
200274fc:	7fe3      	ldrb	r3, [r4, #31]
200274fe:	722b      	strb	r3, [r5, #8]
20027500:	8be3      	ldrh	r3, [r4, #30]
20027502:	726b      	strb	r3, [r5, #9]
20027504:	69e3      	ldr	r3, [r4, #28]
20027506:	0a1b      	lsrs	r3, r3, #8
20027508:	72ab      	strb	r3, [r5, #10]
2002750a:	69e3      	ldr	r3, [r4, #28]
2002750c:	72eb      	strb	r3, [r5, #11]
2002750e:	7ee3      	ldrb	r3, [r4, #27]
20027510:	732b      	strb	r3, [r5, #12]
20027512:	8b63      	ldrh	r3, [r4, #26]
20027514:	736b      	strb	r3, [r5, #13]
20027516:	69a3      	ldr	r3, [r4, #24]
20027518:	0a1b      	lsrs	r3, r3, #8
2002751a:	73ab      	strb	r3, [r5, #14]
2002751c:	69a3      	ldr	r3, [r4, #24]
2002751e:	73eb      	strb	r3, [r5, #15]
20027520:	f894 3027 	ldrb.w	r3, [r4, #39]	@ 0x27
20027524:	742b      	strb	r3, [r5, #16]
20027526:	8ce3      	ldrh	r3, [r4, #38]	@ 0x26
20027528:	746b      	strb	r3, [r5, #17]
2002752a:	6a63      	ldr	r3, [r4, #36]	@ 0x24
2002752c:	0a1b      	lsrs	r3, r3, #8
2002752e:	74ab      	strb	r3, [r5, #18]
20027530:	6a63      	ldr	r3, [r4, #36]	@ 0x24
20027532:	74eb      	strb	r3, [r5, #19]
20027534:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20027538:	752b      	strb	r3, [r5, #20]
2002753a:	8c63      	ldrh	r3, [r4, #34]	@ 0x22
2002753c:	756b      	strb	r3, [r5, #21]
2002753e:	6a23      	ldr	r3, [r4, #32]
20027540:	0a1b      	lsrs	r3, r3, #8
20027542:	75ab      	strb	r3, [r5, #22]
20027544:	6a23      	ldr	r3, [r4, #32]
20027546:	75eb      	strb	r3, [r5, #23]
20027548:	f894 302f 	ldrb.w	r3, [r4, #47]	@ 0x2f
2002754c:	762b      	strb	r3, [r5, #24]
2002754e:	8de3      	ldrh	r3, [r4, #46]	@ 0x2e
20027550:	766b      	strb	r3, [r5, #25]
20027552:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20027554:	0a1b      	lsrs	r3, r3, #8
20027556:	76ab      	strb	r3, [r5, #26]
20027558:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
2002755a:	76eb      	strb	r3, [r5, #27]
2002755c:	f894 302b 	ldrb.w	r3, [r4, #43]	@ 0x2b
20027560:	772b      	strb	r3, [r5, #28]
20027562:	8d63      	ldrh	r3, [r4, #42]	@ 0x2a
20027564:	776b      	strb	r3, [r5, #29]
20027566:	6aa3      	ldr	r3, [r4, #40]	@ 0x28
20027568:	0a1b      	lsrs	r3, r3, #8
2002756a:	77ab      	strb	r3, [r5, #30]
2002756c:	6aa3      	ldr	r3, [r4, #40]	@ 0x28
2002756e:	77eb      	strb	r3, [r5, #31]
20027570:	f894 3037 	ldrb.w	r3, [r4, #55]	@ 0x37
20027574:	f885 3020 	strb.w	r3, [r5, #32]
20027578:	8ee3      	ldrh	r3, [r4, #54]	@ 0x36
2002757a:	f885 3021 	strb.w	r3, [r5, #33]	@ 0x21
2002757e:	6b63      	ldr	r3, [r4, #52]	@ 0x34
20027580:	0a1b      	lsrs	r3, r3, #8
20027582:	f885 3022 	strb.w	r3, [r5, #34]	@ 0x22
20027586:	6b63      	ldr	r3, [r4, #52]	@ 0x34
20027588:	f885 3023 	strb.w	r3, [r5, #35]	@ 0x23
2002758c:	f894 3033 	ldrb.w	r3, [r4, #51]	@ 0x33
20027590:	f885 3024 	strb.w	r3, [r5, #36]	@ 0x24
20027594:	8e63      	ldrh	r3, [r4, #50]	@ 0x32
20027596:	f885 3025 	strb.w	r3, [r5, #37]	@ 0x25
2002759a:	6b23      	ldr	r3, [r4, #48]	@ 0x30
2002759c:	0a1b      	lsrs	r3, r3, #8
2002759e:	f885 3026 	strb.w	r3, [r5, #38]	@ 0x26
200275a2:	6b23      	ldr	r3, [r4, #48]	@ 0x30
200275a4:	f885 3027 	strb.w	r3, [r5, #39]	@ 0x27
200275a8:	f894 303f 	ldrb.w	r3, [r4, #63]	@ 0x3f
200275ac:	f885 3028 	strb.w	r3, [r5, #40]	@ 0x28
200275b0:	8fe3      	ldrh	r3, [r4, #62]	@ 0x3e
200275b2:	f885 3029 	strb.w	r3, [r5, #41]	@ 0x29
200275b6:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
200275b8:	0a1b      	lsrs	r3, r3, #8
200275ba:	f885 302a 	strb.w	r3, [r5, #42]	@ 0x2a
200275be:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
200275c0:	f885 302b 	strb.w	r3, [r5, #43]	@ 0x2b
200275c4:	f894 303b 	ldrb.w	r3, [r4, #59]	@ 0x3b
200275c8:	f885 302c 	strb.w	r3, [r5, #44]	@ 0x2c
200275cc:	8f63      	ldrh	r3, [r4, #58]	@ 0x3a
200275ce:	f885 302d 	strb.w	r3, [r5, #45]	@ 0x2d
200275d2:	6ba3      	ldr	r3, [r4, #56]	@ 0x38
200275d4:	0a1b      	lsrs	r3, r3, #8
200275d6:	f885 302e 	strb.w	r3, [r5, #46]	@ 0x2e
200275da:	6ba3      	ldr	r3, [r4, #56]	@ 0x38
200275dc:	f885 302f 	strb.w	r3, [r5, #47]	@ 0x2f
200275e0:	f8d4 30d0 	ldr.w	r3, [r4, #208]	@ 0xd0
200275e4:	2b00      	cmp	r3, #0
200275e6:	d13b      	bne.n	20027660 <mbedtls_sha512_finish+0x204>
200275e8:	f894 3047 	ldrb.w	r3, [r4, #71]	@ 0x47
200275ec:	f885 3030 	strb.w	r3, [r5, #48]	@ 0x30
200275f0:	f8b4 3046 	ldrh.w	r3, [r4, #70]	@ 0x46
200275f4:	f885 3031 	strb.w	r3, [r5, #49]	@ 0x31
200275f8:	6c63      	ldr	r3, [r4, #68]	@ 0x44
200275fa:	0a1b      	lsrs	r3, r3, #8
200275fc:	f885 3032 	strb.w	r3, [r5, #50]	@ 0x32
20027600:	6c63      	ldr	r3, [r4, #68]	@ 0x44
20027602:	f885 3033 	strb.w	r3, [r5, #51]	@ 0x33
20027606:	f894 3043 	ldrb.w	r3, [r4, #67]	@ 0x43
2002760a:	f885 3034 	strb.w	r3, [r5, #52]	@ 0x34
2002760e:	f8b4 3042 	ldrh.w	r3, [r4, #66]	@ 0x42
20027612:	f885 3035 	strb.w	r3, [r5, #53]	@ 0x35
20027616:	6c23      	ldr	r3, [r4, #64]	@ 0x40
20027618:	0a1b      	lsrs	r3, r3, #8
2002761a:	f885 3036 	strb.w	r3, [r5, #54]	@ 0x36
2002761e:	6c23      	ldr	r3, [r4, #64]	@ 0x40
20027620:	f885 3037 	strb.w	r3, [r5, #55]	@ 0x37
20027624:	f894 304f 	ldrb.w	r3, [r4, #79]	@ 0x4f
20027628:	f885 3038 	strb.w	r3, [r5, #56]	@ 0x38
2002762c:	f8b4 304e 	ldrh.w	r3, [r4, #78]	@ 0x4e
20027630:	f885 3039 	strb.w	r3, [r5, #57]	@ 0x39
20027634:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
20027636:	0a1b      	lsrs	r3, r3, #8
20027638:	f885 303a 	strb.w	r3, [r5, #58]	@ 0x3a
2002763c:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
2002763e:	f885 303b 	strb.w	r3, [r5, #59]	@ 0x3b
20027642:	f894 304b 	ldrb.w	r3, [r4, #75]	@ 0x4b
20027646:	f885 303c 	strb.w	r3, [r5, #60]	@ 0x3c
2002764a:	f8b4 304a 	ldrh.w	r3, [r4, #74]	@ 0x4a
2002764e:	f885 303d 	strb.w	r3, [r5, #61]	@ 0x3d
20027652:	6ca3      	ldr	r3, [r4, #72]	@ 0x48
20027654:	0a1b      	lsrs	r3, r3, #8
20027656:	f885 303e 	strb.w	r3, [r5, #62]	@ 0x3e
2002765a:	6ca3      	ldr	r3, [r4, #72]	@ 0x48
2002765c:	f885 303f 	strb.w	r3, [r5, #63]	@ 0x3f
20027660:	b005      	add	sp, #20
20027662:	bdf0      	pop	{r4, r5, r6, r7, pc}
20027664:	2002be94 	.word	0x2002be94

20027668 <mbedtls_sha512>:
20027668:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002766c:	461c      	mov	r4, r3
2002766e:	b0b7      	sub	sp, #220	@ 0xdc
20027670:	4606      	mov	r6, r0
20027672:	4668      	mov	r0, sp
20027674:	460f      	mov	r7, r1
20027676:	4615      	mov	r5, r2
20027678:	f7ff f8ce 	bl	20026818 <mbedtls_sha512_init>
2002767c:	2c00      	cmp	r4, #0
2002767e:	d03f      	beq.n	20027700 <mbedtls_sha512+0x98>
20027680:	f20f 0bf4 	addw	fp, pc, #244	@ 0xf4
20027684:	e9db ab00 	ldrd	sl, fp, [fp]
20027688:	f20f 09f4 	addw	r9, pc, #244	@ 0xf4
2002768c:	e9d9 8900 	ldrd	r8, r9, [r9]
20027690:	a13d      	add	r1, pc, #244	@ (adr r1, 20027788 <mbedtls_sha512+0x120>)
20027692:	e9d1 0100 	ldrd	r0, r1, [r1]
20027696:	a33e      	add	r3, pc, #248	@ (adr r3, 20027790 <mbedtls_sha512+0x128>)
20027698:	e9d3 2300 	ldrd	r2, r3, [r3]
2002769c:	ed9f 4b24 	vldr	d4, [pc, #144]	@ 20027730 <mbedtls_sha512+0xc8>
200276a0:	ed9f 5b25 	vldr	d5, [pc, #148]	@ 20027738 <mbedtls_sha512+0xd0>
200276a4:	ed9f 6b26 	vldr	d6, [pc, #152]	@ 20027740 <mbedtls_sha512+0xd8>
200276a8:	ed9f 7b27 	vldr	d7, [pc, #156]	@ 20027748 <mbedtls_sha512+0xe0>
200276ac:	ed9f 3b28 	vldr	d3, [pc, #160]	@ 20027750 <mbedtls_sha512+0xe8>
200276b0:	e9cd 2312 	strd	r2, r3, [sp, #72]	@ 0x48
200276b4:	e9cd 0110 	strd	r0, r1, [sp, #64]	@ 0x40
200276b8:	463a      	mov	r2, r7
200276ba:	4631      	mov	r1, r6
200276bc:	4668      	mov	r0, sp
200276be:	ed8d 3b00 	vstr	d3, [sp]
200276c2:	ed8d 3b02 	vstr	d3, [sp, #8]
200276c6:	ed8d 4b04 	vstr	d4, [sp, #16]
200276ca:	ed8d 5b06 	vstr	d5, [sp, #24]
200276ce:	ed8d 6b08 	vstr	d6, [sp, #32]
200276d2:	ed8d 7b0a 	vstr	d7, [sp, #40]	@ 0x28
200276d6:	e9cd ab0c 	strd	sl, fp, [sp, #48]	@ 0x30
200276da:	e9cd 890e 	strd	r8, r9, [sp, #56]	@ 0x38
200276de:	9434      	str	r4, [sp, #208]	@ 0xd0
200276e0:	f7ff feb7 	bl	20027452 <mbedtls_sha512_update>
200276e4:	4629      	mov	r1, r5
200276e6:	4668      	mov	r0, sp
200276e8:	f7ff feb8 	bl	2002745c <mbedtls_sha512_finish>
200276ec:	2300      	movs	r3, #0
200276ee:	461a      	mov	r2, r3
200276f0:	f80d 2003 	strb.w	r2, [sp, r3]
200276f4:	3301      	adds	r3, #1
200276f6:	2bd8      	cmp	r3, #216	@ 0xd8
200276f8:	d1fa      	bne.n	200276f0 <mbedtls_sha512+0x88>
200276fa:	b037      	add	sp, #220	@ 0xdc
200276fc:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20027700:	ed9f 4b15 	vldr	d4, [pc, #84]	@ 20027758 <mbedtls_sha512+0xf0>
20027704:	f20f 0b90 	addw	fp, pc, #144	@ 0x90
20027708:	e9db ab00 	ldrd	sl, fp, [fp]
2002770c:	f20f 0990 	addw	r9, pc, #144	@ 0x90
20027710:	e9d9 8900 	ldrd	r8, r9, [r9]
20027714:	a124      	add	r1, pc, #144	@ (adr r1, 200277a8 <mbedtls_sha512+0x140>)
20027716:	e9d1 0100 	ldrd	r0, r1, [r1]
2002771a:	a325      	add	r3, pc, #148	@ (adr r3, 200277b0 <mbedtls_sha512+0x148>)
2002771c:	e9d3 2300 	ldrd	r2, r3, [r3]
20027720:	ed9f 5b0f 	vldr	d5, [pc, #60]	@ 20027760 <mbedtls_sha512+0xf8>
20027724:	ed9f 6b10 	vldr	d6, [pc, #64]	@ 20027768 <mbedtls_sha512+0x100>
20027728:	ed9f 7b11 	vldr	d7, [pc, #68]	@ 20027770 <mbedtls_sha512+0x108>
2002772c:	e7be      	b.n	200276ac <mbedtls_sha512+0x44>
2002772e:	bf00      	nop
20027730:	c1059ed8 	.word	0xc1059ed8
20027734:	cbbb9d5d 	.word	0xcbbb9d5d
20027738:	367cd507 	.word	0x367cd507
2002773c:	629a292a 	.word	0x629a292a
20027740:	3070dd17 	.word	0x3070dd17
20027744:	9159015a 	.word	0x9159015a
20027748:	f70e5939 	.word	0xf70e5939
2002774c:	152fecd8 	.word	0x152fecd8
	...
20027758:	f3bcc908 	.word	0xf3bcc908
2002775c:	6a09e667 	.word	0x6a09e667
20027760:	84caa73b 	.word	0x84caa73b
20027764:	bb67ae85 	.word	0xbb67ae85
20027768:	fe94f82b 	.word	0xfe94f82b
2002776c:	3c6ef372 	.word	0x3c6ef372
20027770:	5f1d36f1 	.word	0x5f1d36f1
20027774:	a54ff53a 	.word	0xa54ff53a
20027778:	ffc00b31 	.word	0xffc00b31
2002777c:	67332667 	.word	0x67332667
20027780:	68581511 	.word	0x68581511
20027784:	8eb44a87 	.word	0x8eb44a87
20027788:	64f98fa7 	.word	0x64f98fa7
2002778c:	db0c2e0d 	.word	0xdb0c2e0d
20027790:	befa4fa4 	.word	0xbefa4fa4
20027794:	47b5481d 	.word	0x47b5481d
20027798:	ade682d1 	.word	0xade682d1
2002779c:	510e527f 	.word	0x510e527f
200277a0:	2b3e6c1f 	.word	0x2b3e6c1f
200277a4:	9b05688c 	.word	0x9b05688c
200277a8:	fb41bd6b 	.word	0xfb41bd6b
200277ac:	1f83d9ab 	.word	0x1f83d9ab
200277b0:	137e2179 	.word	0x137e2179
200277b4:	5be0cd19 	.word	0x5be0cd19

200277b8 <mbedtls_asn1_get_len>:
200277b8:	b570      	push	{r4, r5, r6, lr}
200277ba:	6803      	ldr	r3, [r0, #0]
200277bc:	1acd      	subs	r5, r1, r3
200277be:	2d00      	cmp	r5, #0
200277c0:	dc02      	bgt.n	200277c8 <mbedtls_asn1_get_len+0x10>
200277c2:	f06f 005f 	mvn.w	r0, #95	@ 0x5f
200277c6:	bd70      	pop	{r4, r5, r6, pc}
200277c8:	f993 6000 	ldrsb.w	r6, [r3]
200277cc:	781c      	ldrb	r4, [r3, #0]
200277ce:	2e00      	cmp	r6, #0
200277d0:	db0a      	blt.n	200277e8 <mbedtls_asn1_get_len+0x30>
200277d2:	1c5c      	adds	r4, r3, #1
200277d4:	6004      	str	r4, [r0, #0]
200277d6:	781b      	ldrb	r3, [r3, #0]
200277d8:	6013      	str	r3, [r2, #0]
200277da:	6803      	ldr	r3, [r0, #0]
200277dc:	1ac9      	subs	r1, r1, r3
200277de:	6813      	ldr	r3, [r2, #0]
200277e0:	428b      	cmp	r3, r1
200277e2:	d8ee      	bhi.n	200277c2 <mbedtls_asn1_get_len+0xa>
200277e4:	2000      	movs	r0, #0
200277e6:	e7ee      	b.n	200277c6 <mbedtls_asn1_get_len+0xe>
200277e8:	f004 047f 	and.w	r4, r4, #127	@ 0x7f
200277ec:	3c01      	subs	r4, #1
200277ee:	2c03      	cmp	r4, #3
200277f0:	d82b      	bhi.n	2002784a <mbedtls_asn1_get_len+0x92>
200277f2:	e8df f004 	tbb	[pc, r4]
200277f6:	0a02      	.short	0x0a02
200277f8:	2114      	.short	0x2114
200277fa:	2d01      	cmp	r5, #1
200277fc:	d0e1      	beq.n	200277c2 <mbedtls_asn1_get_len+0xa>
200277fe:	785b      	ldrb	r3, [r3, #1]
20027800:	6013      	str	r3, [r2, #0]
20027802:	6803      	ldr	r3, [r0, #0]
20027804:	3302      	adds	r3, #2
20027806:	6003      	str	r3, [r0, #0]
20027808:	e7e7      	b.n	200277da <mbedtls_asn1_get_len+0x22>
2002780a:	2d02      	cmp	r5, #2
2002780c:	ddd9      	ble.n	200277c2 <mbedtls_asn1_get_len+0xa>
2002780e:	f8b3 3001 	ldrh.w	r3, [r3, #1]
20027812:	ba5b      	rev16	r3, r3
20027814:	b29b      	uxth	r3, r3
20027816:	6013      	str	r3, [r2, #0]
20027818:	6803      	ldr	r3, [r0, #0]
2002781a:	3303      	adds	r3, #3
2002781c:	e7f3      	b.n	20027806 <mbedtls_asn1_get_len+0x4e>
2002781e:	2d03      	cmp	r5, #3
20027820:	ddcf      	ble.n	200277c2 <mbedtls_asn1_get_len+0xa>
20027822:	789c      	ldrb	r4, [r3, #2]
20027824:	785d      	ldrb	r5, [r3, #1]
20027826:	0224      	lsls	r4, r4, #8
20027828:	78db      	ldrb	r3, [r3, #3]
2002782a:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
2002782e:	4323      	orrs	r3, r4
20027830:	6013      	str	r3, [r2, #0]
20027832:	6803      	ldr	r3, [r0, #0]
20027834:	3304      	adds	r3, #4
20027836:	e7e6      	b.n	20027806 <mbedtls_asn1_get_len+0x4e>
20027838:	2d04      	cmp	r5, #4
2002783a:	ddc2      	ble.n	200277c2 <mbedtls_asn1_get_len+0xa>
2002783c:	f8d3 3001 	ldr.w	r3, [r3, #1]
20027840:	ba1b      	rev	r3, r3
20027842:	6013      	str	r3, [r2, #0]
20027844:	6803      	ldr	r3, [r0, #0]
20027846:	3305      	adds	r3, #5
20027848:	e7dd      	b.n	20027806 <mbedtls_asn1_get_len+0x4e>
2002784a:	f06f 0063 	mvn.w	r0, #99	@ 0x63
2002784e:	e7ba      	b.n	200277c6 <mbedtls_asn1_get_len+0xe>

20027850 <mbedtls_asn1_get_tag>:
20027850:	b470      	push	{r4, r5, r6}
20027852:	6804      	ldr	r4, [r0, #0]
20027854:	1b0e      	subs	r6, r1, r4
20027856:	2e00      	cmp	r6, #0
20027858:	dd07      	ble.n	2002786a <mbedtls_asn1_get_tag+0x1a>
2002785a:	7826      	ldrb	r6, [r4, #0]
2002785c:	429e      	cmp	r6, r3
2002785e:	d108      	bne.n	20027872 <mbedtls_asn1_get_tag+0x22>
20027860:	3401      	adds	r4, #1
20027862:	6004      	str	r4, [r0, #0]
20027864:	bc70      	pop	{r4, r5, r6}
20027866:	f7ff bfa7 	b.w	200277b8 <mbedtls_asn1_get_len>
2002786a:	f06f 005f 	mvn.w	r0, #95	@ 0x5f
2002786e:	bc70      	pop	{r4, r5, r6}
20027870:	4770      	bx	lr
20027872:	f06f 0061 	mvn.w	r0, #97	@ 0x61
20027876:	e7fa      	b.n	2002786e <mbedtls_asn1_get_tag+0x1e>

20027878 <mbedtls_asn1_get_mpi>:
20027878:	b573      	push	{r0, r1, r4, r5, r6, lr}
2002787a:	2302      	movs	r3, #2
2002787c:	4615      	mov	r5, r2
2002787e:	aa01      	add	r2, sp, #4
20027880:	4604      	mov	r4, r0
20027882:	f7ff ffe5 	bl	20027850 <mbedtls_asn1_get_tag>
20027886:	b940      	cbnz	r0, 2002789a <mbedtls_asn1_get_mpi+0x22>
20027888:	9e01      	ldr	r6, [sp, #4]
2002788a:	4628      	mov	r0, r5
2002788c:	4632      	mov	r2, r6
2002788e:	6821      	ldr	r1, [r4, #0]
20027890:	f000 fad4 	bl	20027e3c <mbedtls_mpi_read_binary>
20027894:	6823      	ldr	r3, [r4, #0]
20027896:	4433      	add	r3, r6
20027898:	6023      	str	r3, [r4, #0]
2002789a:	b002      	add	sp, #8
2002789c:	bd70      	pop	{r4, r5, r6, pc}

2002789e <mbedtls_asn1_get_bitstring_null>:
2002789e:	b538      	push	{r3, r4, r5, lr}
200278a0:	2303      	movs	r3, #3
200278a2:	4604      	mov	r4, r0
200278a4:	4615      	mov	r5, r2
200278a6:	f7ff ffd3 	bl	20027850 <mbedtls_asn1_get_tag>
200278aa:	b958      	cbnz	r0, 200278c4 <mbedtls_asn1_get_bitstring_null+0x26>
200278ac:	6813      	ldr	r3, [r2, #0]
200278ae:	1e5a      	subs	r2, r3, #1
200278b0:	2b01      	cmp	r3, #1
200278b2:	602a      	str	r2, [r5, #0]
200278b4:	d904      	bls.n	200278c0 <mbedtls_asn1_get_bitstring_null+0x22>
200278b6:	6823      	ldr	r3, [r4, #0]
200278b8:	1c5a      	adds	r2, r3, #1
200278ba:	6022      	str	r2, [r4, #0]
200278bc:	781b      	ldrb	r3, [r3, #0]
200278be:	b10b      	cbz	r3, 200278c4 <mbedtls_asn1_get_bitstring_null+0x26>
200278c0:	f06f 0067 	mvn.w	r0, #103	@ 0x67
200278c4:	bd38      	pop	{r3, r4, r5, pc}

200278c6 <mbedtls_asn1_get_alg>:
200278c6:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
200278ca:	4690      	mov	r8, r2
200278cc:	461e      	mov	r6, r3
200278ce:	aa01      	add	r2, sp, #4
200278d0:	2330      	movs	r3, #48	@ 0x30
200278d2:	4605      	mov	r5, r0
200278d4:	460f      	mov	r7, r1
200278d6:	f7ff ffbb 	bl	20027850 <mbedtls_asn1_get_tag>
200278da:	4604      	mov	r4, r0
200278dc:	bb10      	cbnz	r0, 20027924 <mbedtls_asn1_get_alg+0x5e>
200278de:	682b      	ldr	r3, [r5, #0]
200278e0:	1aff      	subs	r7, r7, r3
200278e2:	2f00      	cmp	r7, #0
200278e4:	dd38      	ble.n	20027958 <mbedtls_asn1_get_alg+0x92>
200278e6:	4642      	mov	r2, r8
200278e8:	781b      	ldrb	r3, [r3, #0]
200278ea:	4628      	mov	r0, r5
200278ec:	f842 3b04 	str.w	r3, [r2], #4
200278f0:	682f      	ldr	r7, [r5, #0]
200278f2:	9b01      	ldr	r3, [sp, #4]
200278f4:	441f      	add	r7, r3
200278f6:	4639      	mov	r1, r7
200278f8:	2306      	movs	r3, #6
200278fa:	f7ff ffa9 	bl	20027850 <mbedtls_asn1_get_tag>
200278fe:	4604      	mov	r4, r0
20027900:	b980      	cbnz	r0, 20027924 <mbedtls_asn1_get_alg+0x5e>
20027902:	682b      	ldr	r3, [r5, #0]
20027904:	f8d8 2004 	ldr.w	r2, [r8, #4]
20027908:	f8c8 3008 	str.w	r3, [r8, #8]
2002790c:	1899      	adds	r1, r3, r2
2002790e:	42b9      	cmp	r1, r7
20027910:	6029      	str	r1, [r5, #0]
20027912:	d10b      	bne.n	2002792c <mbedtls_asn1_get_alg+0x66>
20027914:	4601      	mov	r1, r0
20027916:	f106 030c 	add.w	r3, r6, #12
2002791a:	4632      	mov	r2, r6
2002791c:	3601      	adds	r6, #1
2002791e:	42b3      	cmp	r3, r6
20027920:	7011      	strb	r1, [r2, #0]
20027922:	d1fa      	bne.n	2002791a <mbedtls_asn1_get_alg+0x54>
20027924:	4620      	mov	r0, r4
20027926:	b002      	add	sp, #8
20027928:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
2002792c:	5c9b      	ldrb	r3, [r3, r2]
2002792e:	4632      	mov	r2, r6
20027930:	f842 3b04 	str.w	r3, [r2], #4
20027934:	682b      	ldr	r3, [r5, #0]
20027936:	4639      	mov	r1, r7
20027938:	3301      	adds	r3, #1
2002793a:	4628      	mov	r0, r5
2002793c:	602b      	str	r3, [r5, #0]
2002793e:	f7ff ff3b 	bl	200277b8 <mbedtls_asn1_get_len>
20027942:	b960      	cbnz	r0, 2002795e <mbedtls_asn1_get_alg+0x98>
20027944:	682b      	ldr	r3, [r5, #0]
20027946:	6872      	ldr	r2, [r6, #4]
20027948:	60b3      	str	r3, [r6, #8]
2002794a:	4413      	add	r3, r2
2002794c:	42bb      	cmp	r3, r7
2002794e:	bf18      	it	ne
20027950:	f06f 0465 	mvnne.w	r4, #101	@ 0x65
20027954:	602b      	str	r3, [r5, #0]
20027956:	e7e5      	b.n	20027924 <mbedtls_asn1_get_alg+0x5e>
20027958:	f06f 045f 	mvn.w	r4, #95	@ 0x5f
2002795c:	e7e2      	b.n	20027924 <mbedtls_asn1_get_alg+0x5e>
2002795e:	4604      	mov	r4, r0
20027960:	e7e0      	b.n	20027924 <mbedtls_asn1_get_alg+0x5e>

20027962 <mpi_sub_hlp>:
20027962:	2300      	movs	r3, #0
20027964:	b5f0      	push	{r4, r5, r6, r7, lr}
20027966:	461c      	mov	r4, r3
20027968:	1f16      	subs	r6, r2, #4
2002796a:	4284      	cmp	r4, r0
2002796c:	d103      	bne.n	20027976 <mpi_sub_hlp+0x14>
2002796e:	eb02 0284 	add.w	r2, r2, r4, lsl #2
20027972:	b9b3      	cbnz	r3, 200279a2 <mpi_sub_hlp+0x40>
20027974:	bdf0      	pop	{r4, r5, r6, r7, pc}
20027976:	f856 cf04 	ldr.w	ip, [r6, #4]!
2002797a:	ebac 0503 	sub.w	r5, ip, r3
2002797e:	6035      	str	r5, [r6, #0]
20027980:	f851 7024 	ldr.w	r7, [r1, r4, lsl #2]
20027984:	3401      	adds	r4, #1
20027986:	42bd      	cmp	r5, r7
20027988:	bf2c      	ite	cs
2002798a:	f04f 0e00 	movcs.w	lr, #0
2002798e:	f04f 0e01 	movcc.w	lr, #1
20027992:	1bed      	subs	r5, r5, r7
20027994:	459c      	cmp	ip, r3
20027996:	bf2c      	ite	cs
20027998:	4673      	movcs	r3, lr
2002799a:	f10e 0301 	addcc.w	r3, lr, #1
2002799e:	6035      	str	r5, [r6, #0]
200279a0:	e7e3      	b.n	2002796a <mpi_sub_hlp+0x8>
200279a2:	6811      	ldr	r1, [r2, #0]
200279a4:	1ac8      	subs	r0, r1, r3
200279a6:	4299      	cmp	r1, r3
200279a8:	bf2c      	ite	cs
200279aa:	2300      	movcs	r3, #0
200279ac:	2301      	movcc	r3, #1
200279ae:	f842 0b04 	str.w	r0, [r2], #4
200279b2:	e7de      	b.n	20027972 <mpi_sub_hlp+0x10>

200279b4 <mpi_mul_hlp>:
200279b4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
200279b8:	4694      	mov	ip, r2
200279ba:	460e      	mov	r6, r1
200279bc:	4686      	mov	lr, r0
200279be:	2500      	movs	r5, #0
200279c0:	f102 0440 	add.w	r4, r2, #64	@ 0x40
200279c4:	f1be 0f0f 	cmp.w	lr, #15
200279c8:	f854 7c40 	ldr.w	r7, [r4, #-64]
200279cc:	f106 0640 	add.w	r6, r6, #64	@ 0x40
200279d0:	f104 0440 	add.w	r4, r4, #64	@ 0x40
200279d4:	d87c      	bhi.n	20027ad0 <mpi_mul_hlp+0x11c>
200279d6:	f06f 080f 	mvn.w	r8, #15
200279da:	0902      	lsrs	r2, r0, #4
200279dc:	fb08 0002 	mla	r0, r8, r2, r0
200279e0:	2807      	cmp	r0, #7
200279e2:	ea4f 1e82 	mov.w	lr, r2, lsl #6
200279e6:	eb0c 1482 	add.w	r4, ip, r2, lsl #6
200279ea:	eb01 1682 	add.w	r6, r1, r2, lsl #6
200279ee:	d95b      	bls.n	20027aa8 <mpi_mul_hlp+0xf4>
200279f0:	f851 100e 	ldr.w	r1, [r1, lr]
200279f4:	3808      	subs	r0, #8
200279f6:	fba1 1203 	umull	r1, r2, r1, r3
200279fa:	1869      	adds	r1, r5, r1
200279fc:	f142 0200 	adc.w	r2, r2, #0
20027a00:	187f      	adds	r7, r7, r1
20027a02:	f84c 700e 	str.w	r7, [ip, lr]
20027a06:	6871      	ldr	r1, [r6, #4]
20027a08:	f142 0200 	adc.w	r2, r2, #0
20027a0c:	fba1 5103 	umull	r5, r1, r1, r3
20027a10:	1952      	adds	r2, r2, r5
20027a12:	6865      	ldr	r5, [r4, #4]
20027a14:	f141 0100 	adc.w	r1, r1, #0
20027a18:	1952      	adds	r2, r2, r5
20027a1a:	6062      	str	r2, [r4, #4]
20027a1c:	68b2      	ldr	r2, [r6, #8]
20027a1e:	f141 0100 	adc.w	r1, r1, #0
20027a22:	fba2 5203 	umull	r5, r2, r2, r3
20027a26:	1949      	adds	r1, r1, r5
20027a28:	68a5      	ldr	r5, [r4, #8]
20027a2a:	f142 0200 	adc.w	r2, r2, #0
20027a2e:	1949      	adds	r1, r1, r5
20027a30:	60a1      	str	r1, [r4, #8]
20027a32:	68f1      	ldr	r1, [r6, #12]
20027a34:	f142 0200 	adc.w	r2, r2, #0
20027a38:	fba1 5103 	umull	r5, r1, r1, r3
20027a3c:	1952      	adds	r2, r2, r5
20027a3e:	68e5      	ldr	r5, [r4, #12]
20027a40:	f141 0100 	adc.w	r1, r1, #0
20027a44:	1952      	adds	r2, r2, r5
20027a46:	60e2      	str	r2, [r4, #12]
20027a48:	6932      	ldr	r2, [r6, #16]
20027a4a:	f141 0100 	adc.w	r1, r1, #0
20027a4e:	fba2 5203 	umull	r5, r2, r2, r3
20027a52:	1949      	adds	r1, r1, r5
20027a54:	6925      	ldr	r5, [r4, #16]
20027a56:	f142 0200 	adc.w	r2, r2, #0
20027a5a:	1949      	adds	r1, r1, r5
20027a5c:	6121      	str	r1, [r4, #16]
20027a5e:	6971      	ldr	r1, [r6, #20]
20027a60:	f142 0200 	adc.w	r2, r2, #0
20027a64:	fba1 5103 	umull	r5, r1, r1, r3
20027a68:	1952      	adds	r2, r2, r5
20027a6a:	6965      	ldr	r5, [r4, #20]
20027a6c:	f141 0100 	adc.w	r1, r1, #0
20027a70:	1952      	adds	r2, r2, r5
20027a72:	6162      	str	r2, [r4, #20]
20027a74:	69b2      	ldr	r2, [r6, #24]
20027a76:	f141 0100 	adc.w	r1, r1, #0
20027a7a:	fba2 5203 	umull	r5, r2, r2, r3
20027a7e:	1949      	adds	r1, r1, r5
20027a80:	69a5      	ldr	r5, [r4, #24]
20027a82:	f142 0200 	adc.w	r2, r2, #0
20027a86:	1949      	adds	r1, r1, r5
20027a88:	61a1      	str	r1, [r4, #24]
20027a8a:	69f1      	ldr	r1, [r6, #28]
20027a8c:	f142 0200 	adc.w	r2, r2, #0
20027a90:	fba1 1503 	umull	r1, r5, r1, r3
20027a94:	1852      	adds	r2, r2, r1
20027a96:	69e1      	ldr	r1, [r4, #28]
20027a98:	f145 0500 	adc.w	r5, r5, #0
20027a9c:	1852      	adds	r2, r2, r1
20027a9e:	61e2      	str	r2, [r4, #28]
20027aa0:	f145 0500 	adc.w	r5, r5, #0
20027aa4:	3420      	adds	r4, #32
20027aa6:	3620      	adds	r6, #32
20027aa8:	4627      	mov	r7, r4
20027aaa:	ea4f 0c80 	mov.w	ip, r0, lsl #2
20027aae:	eb06 0080 	add.w	r0, r6, r0, lsl #2
20027ab2:	42b0      	cmp	r0, r6
20027ab4:	f857 1b04 	ldr.w	r1, [r7], #4
20027ab8:	f040 80eb 	bne.w	20027c92 <mpi_mul_hlp+0x2de>
20027abc:	4464      	add	r4, ip
20027abe:	6823      	ldr	r3, [r4, #0]
20027ac0:	195b      	adds	r3, r3, r5
20027ac2:	f844 3b04 	str.w	r3, [r4], #4
20027ac6:	f04f 0501 	mov.w	r5, #1
20027aca:	d2f8      	bcs.n	20027abe <mpi_mul_hlp+0x10a>
20027acc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20027ad0:	f856 2c40 	ldr.w	r2, [r6, #-64]
20027ad4:	f1ae 0e10 	sub.w	lr, lr, #16
20027ad8:	fba2 2803 	umull	r2, r8, r2, r3
20027adc:	18aa      	adds	r2, r5, r2
20027ade:	f148 0500 	adc.w	r5, r8, #0
20027ae2:	18ba      	adds	r2, r7, r2
20027ae4:	f844 2c80 	str.w	r2, [r4, #-128]
20027ae8:	f856 2c3c 	ldr.w	r2, [r6, #-60]
20027aec:	f145 0500 	adc.w	r5, r5, #0
20027af0:	fba2 7203 	umull	r7, r2, r2, r3
20027af4:	19ef      	adds	r7, r5, r7
20027af6:	f854 5c7c 	ldr.w	r5, [r4, #-124]
20027afa:	f142 0200 	adc.w	r2, r2, #0
20027afe:	19ed      	adds	r5, r5, r7
20027b00:	f844 5c7c 	str.w	r5, [r4, #-124]
20027b04:	f856 5c38 	ldr.w	r5, [r6, #-56]
20027b08:	f142 0200 	adc.w	r2, r2, #0
20027b0c:	fba5 7503 	umull	r7, r5, r5, r3
20027b10:	19d7      	adds	r7, r2, r7
20027b12:	f854 2c78 	ldr.w	r2, [r4, #-120]
20027b16:	f145 0500 	adc.w	r5, r5, #0
20027b1a:	19d2      	adds	r2, r2, r7
20027b1c:	f844 2c78 	str.w	r2, [r4, #-120]
20027b20:	f856 2c34 	ldr.w	r2, [r6, #-52]
20027b24:	f145 0500 	adc.w	r5, r5, #0
20027b28:	fba2 7203 	umull	r7, r2, r2, r3
20027b2c:	19ef      	adds	r7, r5, r7
20027b2e:	f854 5c74 	ldr.w	r5, [r4, #-116]
20027b32:	f142 0200 	adc.w	r2, r2, #0
20027b36:	19ed      	adds	r5, r5, r7
20027b38:	f844 5c74 	str.w	r5, [r4, #-116]
20027b3c:	f856 5c30 	ldr.w	r5, [r6, #-48]
20027b40:	f142 0200 	adc.w	r2, r2, #0
20027b44:	fba5 7503 	umull	r7, r5, r5, r3
20027b48:	19d7      	adds	r7, r2, r7
20027b4a:	f854 2c70 	ldr.w	r2, [r4, #-112]
20027b4e:	f145 0500 	adc.w	r5, r5, #0
20027b52:	19d2      	adds	r2, r2, r7
20027b54:	f844 2c70 	str.w	r2, [r4, #-112]
20027b58:	f856 2c2c 	ldr.w	r2, [r6, #-44]
20027b5c:	f145 0500 	adc.w	r5, r5, #0
20027b60:	fba2 7203 	umull	r7, r2, r2, r3
20027b64:	19ef      	adds	r7, r5, r7
20027b66:	f854 5c6c 	ldr.w	r5, [r4, #-108]
20027b6a:	f142 0200 	adc.w	r2, r2, #0
20027b6e:	19ed      	adds	r5, r5, r7
20027b70:	f844 5c6c 	str.w	r5, [r4, #-108]
20027b74:	f856 5c28 	ldr.w	r5, [r6, #-40]
20027b78:	f142 0200 	adc.w	r2, r2, #0
20027b7c:	fba5 7503 	umull	r7, r5, r5, r3
20027b80:	19d7      	adds	r7, r2, r7
20027b82:	f854 2c68 	ldr.w	r2, [r4, #-104]
20027b86:	f145 0500 	adc.w	r5, r5, #0
20027b8a:	19d2      	adds	r2, r2, r7
20027b8c:	f844 2c68 	str.w	r2, [r4, #-104]
20027b90:	f856 2c24 	ldr.w	r2, [r6, #-36]
20027b94:	f145 0500 	adc.w	r5, r5, #0
20027b98:	fba2 7203 	umull	r7, r2, r2, r3
20027b9c:	19ef      	adds	r7, r5, r7
20027b9e:	f854 5c64 	ldr.w	r5, [r4, #-100]
20027ba2:	f142 0200 	adc.w	r2, r2, #0
20027ba6:	19ed      	adds	r5, r5, r7
20027ba8:	f844 5c64 	str.w	r5, [r4, #-100]
20027bac:	f856 5c20 	ldr.w	r5, [r6, #-32]
20027bb0:	f142 0200 	adc.w	r2, r2, #0
20027bb4:	fba5 7503 	umull	r7, r5, r5, r3
20027bb8:	19d7      	adds	r7, r2, r7
20027bba:	f854 2c60 	ldr.w	r2, [r4, #-96]
20027bbe:	f145 0500 	adc.w	r5, r5, #0
20027bc2:	19d2      	adds	r2, r2, r7
20027bc4:	f844 2c60 	str.w	r2, [r4, #-96]
20027bc8:	f856 2c1c 	ldr.w	r2, [r6, #-28]
20027bcc:	f145 0500 	adc.w	r5, r5, #0
20027bd0:	fba2 7203 	umull	r7, r2, r2, r3
20027bd4:	19ef      	adds	r7, r5, r7
20027bd6:	f854 5c5c 	ldr.w	r5, [r4, #-92]
20027bda:	f142 0200 	adc.w	r2, r2, #0
20027bde:	19ed      	adds	r5, r5, r7
20027be0:	f844 5c5c 	str.w	r5, [r4, #-92]
20027be4:	f856 5c18 	ldr.w	r5, [r6, #-24]
20027be8:	f142 0200 	adc.w	r2, r2, #0
20027bec:	fba5 7503 	umull	r7, r5, r5, r3
20027bf0:	19d7      	adds	r7, r2, r7
20027bf2:	f854 2c58 	ldr.w	r2, [r4, #-88]
20027bf6:	f145 0500 	adc.w	r5, r5, #0
20027bfa:	19d2      	adds	r2, r2, r7
20027bfc:	f844 2c58 	str.w	r2, [r4, #-88]
20027c00:	f856 2c14 	ldr.w	r2, [r6, #-20]
20027c04:	f145 0500 	adc.w	r5, r5, #0
20027c08:	fba2 7203 	umull	r7, r2, r2, r3
20027c0c:	19ef      	adds	r7, r5, r7
20027c0e:	f854 5c54 	ldr.w	r5, [r4, #-84]
20027c12:	f142 0200 	adc.w	r2, r2, #0
20027c16:	19ed      	adds	r5, r5, r7
20027c18:	f844 5c54 	str.w	r5, [r4, #-84]
20027c1c:	f856 5c10 	ldr.w	r5, [r6, #-16]
20027c20:	f142 0200 	adc.w	r2, r2, #0
20027c24:	fba5 7503 	umull	r7, r5, r5, r3
20027c28:	19d7      	adds	r7, r2, r7
20027c2a:	f854 2c50 	ldr.w	r2, [r4, #-80]
20027c2e:	f145 0500 	adc.w	r5, r5, #0
20027c32:	19d2      	adds	r2, r2, r7
20027c34:	f844 2c50 	str.w	r2, [r4, #-80]
20027c38:	f856 2c0c 	ldr.w	r2, [r6, #-12]
20027c3c:	f145 0500 	adc.w	r5, r5, #0
20027c40:	fba2 7203 	umull	r7, r2, r2, r3
20027c44:	19ef      	adds	r7, r5, r7
20027c46:	f854 5c4c 	ldr.w	r5, [r4, #-76]
20027c4a:	f142 0200 	adc.w	r2, r2, #0
20027c4e:	19ed      	adds	r5, r5, r7
20027c50:	f844 5c4c 	str.w	r5, [r4, #-76]
20027c54:	f856 5c08 	ldr.w	r5, [r6, #-8]
20027c58:	f142 0200 	adc.w	r2, r2, #0
20027c5c:	fba5 5703 	umull	r5, r7, r5, r3
20027c60:	1955      	adds	r5, r2, r5
20027c62:	f854 2c48 	ldr.w	r2, [r4, #-72]
20027c66:	f147 0700 	adc.w	r7, r7, #0
20027c6a:	1952      	adds	r2, r2, r5
20027c6c:	f844 2c48 	str.w	r2, [r4, #-72]
20027c70:	f856 2c04 	ldr.w	r2, [r6, #-4]
20027c74:	f147 0700 	adc.w	r7, r7, #0
20027c78:	fba2 2503 	umull	r2, r5, r2, r3
20027c7c:	18bf      	adds	r7, r7, r2
20027c7e:	f854 2c44 	ldr.w	r2, [r4, #-68]
20027c82:	f145 0500 	adc.w	r5, r5, #0
20027c86:	19d2      	adds	r2, r2, r7
20027c88:	f145 0500 	adc.w	r5, r5, #0
20027c8c:	f844 2c44 	str.w	r2, [r4, #-68]
20027c90:	e698      	b.n	200279c4 <mpi_mul_hlp+0x10>
20027c92:	f856 2b04 	ldr.w	r2, [r6], #4
20027c96:	fba2 2e03 	umull	r2, lr, r2, r3
20027c9a:	18aa      	adds	r2, r5, r2
20027c9c:	f14e 0500 	adc.w	r5, lr, #0
20027ca0:	1889      	adds	r1, r1, r2
20027ca2:	f145 0500 	adc.w	r5, r5, #0
20027ca6:	f847 1c04 	str.w	r1, [r7, #-4]
20027caa:	e702      	b.n	20027ab2 <mpi_mul_hlp+0xfe>

20027cac <mbedtls_mpi_init>:
20027cac:	b120      	cbz	r0, 20027cb8 <mbedtls_mpi_init+0xc>
20027cae:	2300      	movs	r3, #0
20027cb0:	2201      	movs	r2, #1
20027cb2:	e9c0 2300 	strd	r2, r3, [r0]
20027cb6:	6083      	str	r3, [r0, #8]
20027cb8:	4770      	bx	lr

20027cba <mbedtls_mpi_free>:
20027cba:	b510      	push	{r4, lr}
20027cbc:	4604      	mov	r4, r0
20027cbe:	b168      	cbz	r0, 20027cdc <mbedtls_mpi_free+0x22>
20027cc0:	6883      	ldr	r3, [r0, #8]
20027cc2:	b133      	cbz	r3, 20027cd2 <mbedtls_mpi_free+0x18>
20027cc4:	2100      	movs	r1, #0
20027cc6:	6842      	ldr	r2, [r0, #4]
20027cc8:	3a01      	subs	r2, #1
20027cca:	d208      	bcs.n	20027cde <mbedtls_mpi_free+0x24>
20027ccc:	68a0      	ldr	r0, [r4, #8]
20027cce:	f002 fcd7 	bl	2002a680 <free>
20027cd2:	2300      	movs	r3, #0
20027cd4:	2201      	movs	r2, #1
20027cd6:	e9c4 2300 	strd	r2, r3, [r4]
20027cda:	60a3      	str	r3, [r4, #8]
20027cdc:	bd10      	pop	{r4, pc}
20027cde:	f843 1b04 	str.w	r1, [r3], #4
20027ce2:	e7f1      	b.n	20027cc8 <mbedtls_mpi_free+0xe>

20027ce4 <mbedtls_mpi_grow>:
20027ce4:	f242 7310 	movw	r3, #10000	@ 0x2710
20027ce8:	4299      	cmp	r1, r3
20027cea:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20027cee:	4605      	mov	r5, r0
20027cf0:	460f      	mov	r7, r1
20027cf2:	d903      	bls.n	20027cfc <mbedtls_mpi_grow+0x18>
20027cf4:	f06f 000f 	mvn.w	r0, #15
20027cf8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20027cfc:	6846      	ldr	r6, [r0, #4]
20027cfe:	428e      	cmp	r6, r1
20027d00:	d301      	bcc.n	20027d06 <mbedtls_mpi_grow+0x22>
20027d02:	2000      	movs	r0, #0
20027d04:	e7f8      	b.n	20027cf8 <mbedtls_mpi_grow+0x14>
20027d06:	2104      	movs	r1, #4
20027d08:	4638      	mov	r0, r7
20027d0a:	f002 fc9d 	bl	2002a648 <calloc>
20027d0e:	4680      	mov	r8, r0
20027d10:	2800      	cmp	r0, #0
20027d12:	d0ef      	beq.n	20027cf4 <mbedtls_mpi_grow+0x10>
20027d14:	68ac      	ldr	r4, [r5, #8]
20027d16:	b15c      	cbz	r4, 20027d30 <mbedtls_mpi_grow+0x4c>
20027d18:	00b6      	lsls	r6, r6, #2
20027d1a:	4632      	mov	r2, r6
20027d1c:	4621      	mov	r1, r4
20027d1e:	f002 fd8f 	bl	2002a840 <memcpy>
20027d22:	2300      	movs	r3, #0
20027d24:	4426      	add	r6, r4
20027d26:	42b4      	cmp	r4, r6
20027d28:	d105      	bne.n	20027d36 <mbedtls_mpi_grow+0x52>
20027d2a:	68a8      	ldr	r0, [r5, #8]
20027d2c:	f002 fca8 	bl	2002a680 <free>
20027d30:	e9c5 7801 	strd	r7, r8, [r5, #4]
20027d34:	e7e5      	b.n	20027d02 <mbedtls_mpi_grow+0x1e>
20027d36:	f844 3b04 	str.w	r3, [r4], #4
20027d3a:	e7f4      	b.n	20027d26 <mbedtls_mpi_grow+0x42>

20027d3c <mbedtls_mpi_copy>:
20027d3c:	4288      	cmp	r0, r1
20027d3e:	b570      	push	{r4, r5, r6, lr}
20027d40:	4605      	mov	r5, r0
20027d42:	460e      	mov	r6, r1
20027d44:	d003      	beq.n	20027d4e <mbedtls_mpi_copy+0x12>
20027d46:	688b      	ldr	r3, [r1, #8]
20027d48:	b91b      	cbnz	r3, 20027d52 <mbedtls_mpi_copy+0x16>
20027d4a:	f7ff ffb6 	bl	20027cba <mbedtls_mpi_free>
20027d4e:	2000      	movs	r0, #0
20027d50:	bd70      	pop	{r4, r5, r6, pc}
20027d52:	684a      	ldr	r2, [r1, #4]
20027d54:	3a01      	subs	r2, #1
20027d56:	b11a      	cbz	r2, 20027d60 <mbedtls_mpi_copy+0x24>
20027d58:	f853 1022 	ldr.w	r1, [r3, r2, lsl #2]
20027d5c:	2900      	cmp	r1, #0
20027d5e:	d0f9      	beq.n	20027d54 <mbedtls_mpi_copy+0x18>
20027d60:	6833      	ldr	r3, [r6, #0]
20027d62:	1c54      	adds	r4, r2, #1
20027d64:	4621      	mov	r1, r4
20027d66:	4628      	mov	r0, r5
20027d68:	602b      	str	r3, [r5, #0]
20027d6a:	f7ff ffbb 	bl	20027ce4 <mbedtls_mpi_grow>
20027d6e:	4601      	mov	r1, r0
20027d70:	b950      	cbnz	r0, 20027d88 <mbedtls_mpi_copy+0x4c>
20027d72:	686a      	ldr	r2, [r5, #4]
20027d74:	68a8      	ldr	r0, [r5, #8]
20027d76:	0092      	lsls	r2, r2, #2
20027d78:	f002 fd48 	bl	2002a80c <memset>
20027d7c:	68b1      	ldr	r1, [r6, #8]
20027d7e:	68a8      	ldr	r0, [r5, #8]
20027d80:	00a2      	lsls	r2, r4, #2
20027d82:	f002 fd5d 	bl	2002a840 <memcpy>
20027d86:	e7e2      	b.n	20027d4e <mbedtls_mpi_copy+0x12>
20027d88:	f06f 000f 	mvn.w	r0, #15
20027d8c:	e7e0      	b.n	20027d50 <mbedtls_mpi_copy+0x14>

20027d8e <mbedtls_mpi_lset>:
20027d8e:	b570      	push	{r4, r5, r6, lr}
20027d90:	460e      	mov	r6, r1
20027d92:	2101      	movs	r1, #1
20027d94:	4604      	mov	r4, r0
20027d96:	f7ff ffa5 	bl	20027ce4 <mbedtls_mpi_grow>
20027d9a:	4605      	mov	r5, r0
20027d9c:	b988      	cbnz	r0, 20027dc2 <mbedtls_mpi_lset+0x34>
20027d9e:	6862      	ldr	r2, [r4, #4]
20027da0:	4601      	mov	r1, r0
20027da2:	0092      	lsls	r2, r2, #2
20027da4:	68a0      	ldr	r0, [r4, #8]
20027da6:	f002 fd31 	bl	2002a80c <memset>
20027daa:	68a3      	ldr	r3, [r4, #8]
20027dac:	ea86 72e6 	eor.w	r2, r6, r6, asr #31
20027db0:	2e00      	cmp	r6, #0
20027db2:	eba2 72e6 	sub.w	r2, r2, r6, asr #31
20027db6:	601a      	str	r2, [r3, #0]
20027db8:	bfac      	ite	ge
20027dba:	2301      	movge	r3, #1
20027dbc:	f04f 33ff 	movlt.w	r3, #4294967295	@ 0xffffffff
20027dc0:	6023      	str	r3, [r4, #0]
20027dc2:	4628      	mov	r0, r5
20027dc4:	bd70      	pop	{r4, r5, r6, pc}

20027dc6 <mbedtls_mpi_lsb>:
20027dc6:	2300      	movs	r3, #0
20027dc8:	4619      	mov	r1, r3
20027dca:	b570      	push	{r4, r5, r6, lr}
20027dcc:	6844      	ldr	r4, [r0, #4]
20027dce:	428c      	cmp	r4, r1
20027dd0:	d101      	bne.n	20027dd6 <mbedtls_mpi_lsb+0x10>
20027dd2:	2000      	movs	r0, #0
20027dd4:	e008      	b.n	20027de8 <mbedtls_mpi_lsb+0x22>
20027dd6:	6882      	ldr	r2, [r0, #8]
20027dd8:	f852 5021 	ldr.w	r5, [r2, r1, lsl #2]
20027ddc:	2200      	movs	r2, #0
20027dde:	fa25 f602 	lsr.w	r6, r5, r2
20027de2:	07f6      	lsls	r6, r6, #31
20027de4:	d501      	bpl.n	20027dea <mbedtls_mpi_lsb+0x24>
20027de6:	1898      	adds	r0, r3, r2
20027de8:	bd70      	pop	{r4, r5, r6, pc}
20027dea:	3201      	adds	r2, #1
20027dec:	2a20      	cmp	r2, #32
20027dee:	d1f6      	bne.n	20027dde <mbedtls_mpi_lsb+0x18>
20027df0:	3320      	adds	r3, #32
20027df2:	3101      	adds	r1, #1
20027df4:	e7eb      	b.n	20027dce <mbedtls_mpi_lsb+0x8>

20027df6 <mbedtls_mpi_bitlen>:
20027df6:	4602      	mov	r2, r0
20027df8:	6840      	ldr	r0, [r0, #4]
20027dfa:	b188      	cbz	r0, 20027e20 <mbedtls_mpi_bitlen+0x2a>
20027dfc:	6891      	ldr	r1, [r2, #8]
20027dfe:	1e43      	subs	r3, r0, #1
20027e00:	b97b      	cbnz	r3, 20027e22 <mbedtls_mpi_bitlen+0x2c>
20027e02:	461a      	mov	r2, r3
20027e04:	5889      	ldr	r1, [r1, r2]
20027e06:	2000      	movs	r0, #0
20027e08:	f04f 4200 	mov.w	r2, #2147483648	@ 0x80000000
20027e0c:	4211      	tst	r1, r2
20027e0e:	d104      	bne.n	20027e1a <mbedtls_mpi_bitlen+0x24>
20027e10:	3001      	adds	r0, #1
20027e12:	2820      	cmp	r0, #32
20027e14:	ea4f 0252 	mov.w	r2, r2, lsr #1
20027e18:	d1f8      	bne.n	20027e0c <mbedtls_mpi_bitlen+0x16>
20027e1a:	3301      	adds	r3, #1
20027e1c:	ebc0 1043 	rsb	r0, r0, r3, lsl #5
20027e20:	4770      	bx	lr
20027e22:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
20027e26:	009a      	lsls	r2, r3, #2
20027e28:	2800      	cmp	r0, #0
20027e2a:	d1eb      	bne.n	20027e04 <mbedtls_mpi_bitlen+0xe>
20027e2c:	3b01      	subs	r3, #1
20027e2e:	e7e7      	b.n	20027e00 <mbedtls_mpi_bitlen+0xa>

20027e30 <mbedtls_mpi_size>:
20027e30:	b508      	push	{r3, lr}
20027e32:	f7ff ffe0 	bl	20027df6 <mbedtls_mpi_bitlen>
20027e36:	3007      	adds	r0, #7
20027e38:	08c0      	lsrs	r0, r0, #3
20027e3a:	bd08      	pop	{r3, pc}

20027e3c <mbedtls_mpi_read_binary>:
20027e3c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20027e3e:	4607      	mov	r7, r0
20027e40:	460c      	mov	r4, r1
20027e42:	4616      	mov	r6, r2
20027e44:	2500      	movs	r5, #0
20027e46:	42b5      	cmp	r5, r6
20027e48:	d001      	beq.n	20027e4e <mbedtls_mpi_read_binary+0x12>
20027e4a:	5d63      	ldrb	r3, [r4, r5]
20027e4c:	b173      	cbz	r3, 20027e6c <mbedtls_mpi_read_binary+0x30>
20027e4e:	1b71      	subs	r1, r6, r5
20027e50:	f011 0303 	ands.w	r3, r1, #3
20027e54:	bf18      	it	ne
20027e56:	2301      	movne	r3, #1
20027e58:	4638      	mov	r0, r7
20027e5a:	eb03 0191 	add.w	r1, r3, r1, lsr #2
20027e5e:	f7ff ff41 	bl	20027ce4 <mbedtls_mpi_grow>
20027e62:	4601      	mov	r1, r0
20027e64:	b120      	cbz	r0, 20027e70 <mbedtls_mpi_read_binary+0x34>
20027e66:	f06f 000f 	mvn.w	r0, #15
20027e6a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20027e6c:	3501      	adds	r5, #1
20027e6e:	e7ea      	b.n	20027e46 <mbedtls_mpi_read_binary+0xa>
20027e70:	4638      	mov	r0, r7
20027e72:	f7ff ff8c 	bl	20027d8e <mbedtls_mpi_lset>
20027e76:	2800      	cmp	r0, #0
20027e78:	d1f5      	bne.n	20027e66 <mbedtls_mpi_read_binary+0x2a>
20027e7a:	4603      	mov	r3, r0
20027e7c:	4434      	add	r4, r6
20027e7e:	1af2      	subs	r2, r6, r3
20027e80:	4295      	cmp	r5, r2
20027e82:	d2f2      	bcs.n	20027e6a <mbedtls_mpi_read_binary+0x2e>
20027e84:	f8d7 e008 	ldr.w	lr, [r7, #8]
20027e88:	f814 1d01 	ldrb.w	r1, [r4, #-1]!
20027e8c:	00da      	lsls	r2, r3, #3
20027e8e:	f023 0c03 	bic.w	ip, r3, #3
20027e92:	f002 0218 	and.w	r2, r2, #24
20027e96:	4091      	lsls	r1, r2
20027e98:	f85e 200c 	ldr.w	r2, [lr, ip]
20027e9c:	3301      	adds	r3, #1
20027e9e:	430a      	orrs	r2, r1
20027ea0:	f84e 200c 	str.w	r2, [lr, ip]
20027ea4:	e7eb      	b.n	20027e7e <mbedtls_mpi_read_binary+0x42>

20027ea6 <mbedtls_mpi_write_binary>:
20027ea6:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20027ea8:	4615      	mov	r5, r2
20027eaa:	4607      	mov	r7, r0
20027eac:	460c      	mov	r4, r1
20027eae:	f7ff ffbf 	bl	20027e30 <mbedtls_mpi_size>
20027eb2:	42a8      	cmp	r0, r5
20027eb4:	4606      	mov	r6, r0
20027eb6:	d816      	bhi.n	20027ee6 <mbedtls_mpi_write_binary+0x40>
20027eb8:	4620      	mov	r0, r4
20027eba:	462a      	mov	r2, r5
20027ebc:	2100      	movs	r1, #0
20027ebe:	f002 fca5 	bl	2002a80c <memset>
20027ec2:	2300      	movs	r3, #0
20027ec4:	442c      	add	r4, r5
20027ec6:	42b3      	cmp	r3, r6
20027ec8:	d101      	bne.n	20027ece <mbedtls_mpi_write_binary+0x28>
20027eca:	2000      	movs	r0, #0
20027ecc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20027ece:	68b8      	ldr	r0, [r7, #8]
20027ed0:	f023 0203 	bic.w	r2, r3, #3
20027ed4:	5882      	ldr	r2, [r0, r2]
20027ed6:	00d9      	lsls	r1, r3, #3
20027ed8:	f001 0118 	and.w	r1, r1, #24
20027edc:	40ca      	lsrs	r2, r1
20027ede:	f804 2d01 	strb.w	r2, [r4, #-1]!
20027ee2:	3301      	adds	r3, #1
20027ee4:	e7ef      	b.n	20027ec6 <mbedtls_mpi_write_binary+0x20>
20027ee6:	f06f 0007 	mvn.w	r0, #7
20027eea:	e7ef      	b.n	20027ecc <mbedtls_mpi_write_binary+0x26>

20027eec <mbedtls_mpi_shift_l>:
20027eec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20027eee:	4605      	mov	r5, r0
20027ef0:	460e      	mov	r6, r1
20027ef2:	094c      	lsrs	r4, r1, #5
20027ef4:	f001 071f 	and.w	r7, r1, #31
20027ef8:	f7ff ff7d 	bl	20027df6 <mbedtls_mpi_bitlen>
20027efc:	686b      	ldr	r3, [r5, #4]
20027efe:	4430      	add	r0, r6
20027f00:	ebb0 1f43 	cmp.w	r0, r3, lsl #5
20027f04:	d805      	bhi.n	20027f12 <mbedtls_mpi_shift_l+0x26>
20027f06:	2e1f      	cmp	r6, #31
20027f08:	d811      	bhi.n	20027f2e <mbedtls_mpi_shift_l+0x42>
20027f0a:	2f00      	cmp	r7, #0
20027f0c:	d143      	bne.n	20027f96 <mbedtls_mpi_shift_l+0xaa>
20027f0e:	2000      	movs	r0, #0
20027f10:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20027f12:	f010 011f 	ands.w	r1, r0, #31
20027f16:	bf18      	it	ne
20027f18:	2101      	movne	r1, #1
20027f1a:	eb01 1150 	add.w	r1, r1, r0, lsr #5
20027f1e:	4628      	mov	r0, r5
20027f20:	f7ff fee0 	bl	20027ce4 <mbedtls_mpi_grow>
20027f24:	2800      	cmp	r0, #0
20027f26:	d0ee      	beq.n	20027f06 <mbedtls_mpi_shift_l+0x1a>
20027f28:	f06f 000f 	mvn.w	r0, #15
20027f2c:	e7f0      	b.n	20027f10 <mbedtls_mpi_shift_l+0x24>
20027f2e:	f06f 0003 	mvn.w	r0, #3
20027f32:	686a      	ldr	r2, [r5, #4]
20027f34:	4360      	muls	r0, r4
20027f36:	4611      	mov	r1, r2
20027f38:	0093      	lsls	r3, r2, #2
20027f3a:	42a1      	cmp	r1, r4
20027f3c:	f1a3 0304 	sub.w	r3, r3, #4
20027f40:	d80c      	bhi.n	20027f5c <mbedtls_mpi_shift_l+0x70>
20027f42:	1aa3      	subs	r3, r4, r2
20027f44:	4294      	cmp	r4, r2
20027f46:	bf88      	it	hi
20027f48:	2300      	movhi	r3, #0
20027f4a:	4413      	add	r3, r2
20027f4c:	2200      	movs	r2, #0
20027f4e:	009b      	lsls	r3, r3, #2
20027f50:	3b04      	subs	r3, #4
20027f52:	1d19      	adds	r1, r3, #4
20027f54:	d0d9      	beq.n	20027f0a <mbedtls_mpi_shift_l+0x1e>
20027f56:	68a9      	ldr	r1, [r5, #8]
20027f58:	50ca      	str	r2, [r1, r3]
20027f5a:	e7f9      	b.n	20027f50 <mbedtls_mpi_shift_l+0x64>
20027f5c:	68ae      	ldr	r6, [r5, #8]
20027f5e:	3901      	subs	r1, #1
20027f60:	eb06 0c03 	add.w	ip, r6, r3
20027f64:	f85c c000 	ldr.w	ip, [ip, r0]
20027f68:	f846 c003 	str.w	ip, [r6, r3]
20027f6c:	e7e5      	b.n	20027f3a <mbedtls_mpi_shift_l+0x4e>
20027f6e:	68ab      	ldr	r3, [r5, #8]
20027f70:	f853 1024 	ldr.w	r1, [r3, r4, lsl #2]
20027f74:	fa01 f007 	lsl.w	r0, r1, r7
20027f78:	f843 0024 	str.w	r0, [r3, r4, lsl #2]
20027f7c:	68a8      	ldr	r0, [r5, #8]
20027f7e:	f850 3024 	ldr.w	r3, [r0, r4, lsl #2]
20027f82:	4313      	orrs	r3, r2
20027f84:	f840 3024 	str.w	r3, [r0, r4, lsl #2]
20027f88:	fa21 f206 	lsr.w	r2, r1, r6
20027f8c:	3401      	adds	r4, #1
20027f8e:	686b      	ldr	r3, [r5, #4]
20027f90:	42a3      	cmp	r3, r4
20027f92:	d8ec      	bhi.n	20027f6e <mbedtls_mpi_shift_l+0x82>
20027f94:	e7bb      	b.n	20027f0e <mbedtls_mpi_shift_l+0x22>
20027f96:	2200      	movs	r2, #0
20027f98:	f1c7 0620 	rsb	r6, r7, #32
20027f9c:	e7f7      	b.n	20027f8e <mbedtls_mpi_shift_l+0xa2>

20027f9e <mbedtls_mpi_shift_r>:
20027f9e:	b4f0      	push	{r4, r5, r6, r7}
20027fa0:	6843      	ldr	r3, [r0, #4]
20027fa2:	094c      	lsrs	r4, r1, #5
20027fa4:	42a3      	cmp	r3, r4
20027fa6:	f001 021f 	and.w	r2, r1, #31
20027faa:	d301      	bcc.n	20027fb0 <mbedtls_mpi_shift_r+0x12>
20027fac:	d104      	bne.n	20027fb8 <mbedtls_mpi_shift_r+0x1a>
20027fae:	b392      	cbz	r2, 20028016 <mbedtls_mpi_shift_r+0x78>
20027fb0:	bcf0      	pop	{r4, r5, r6, r7}
20027fb2:	2100      	movs	r1, #0
20027fb4:	f7ff beeb 	b.w	20027d8e <mbedtls_mpi_lset>
20027fb8:	291f      	cmp	r1, #31
20027fba:	d82e      	bhi.n	2002801a <mbedtls_mpi_shift_r+0x7c>
20027fbc:	b9aa      	cbnz	r2, 20027fea <mbedtls_mpi_shift_r+0x4c>
20027fbe:	bcf0      	pop	{r4, r5, r6, r7}
20027fc0:	2000      	movs	r0, #0
20027fc2:	4770      	bx	lr
20027fc4:	6885      	ldr	r5, [r0, #8]
20027fc6:	586e      	ldr	r6, [r5, r1]
20027fc8:	3104      	adds	r1, #4
20027fca:	f845 6023 	str.w	r6, [r5, r3, lsl #2]
20027fce:	3301      	adds	r3, #1
20027fd0:	6845      	ldr	r5, [r0, #4]
20027fd2:	1b2d      	subs	r5, r5, r4
20027fd4:	429d      	cmp	r5, r3
20027fd6:	d8f5      	bhi.n	20027fc4 <mbedtls_mpi_shift_r+0x26>
20027fd8:	2400      	movs	r4, #0
20027fda:	6841      	ldr	r1, [r0, #4]
20027fdc:	4299      	cmp	r1, r3
20027fde:	d9ed      	bls.n	20027fbc <mbedtls_mpi_shift_r+0x1e>
20027fe0:	6881      	ldr	r1, [r0, #8]
20027fe2:	f841 4023 	str.w	r4, [r1, r3, lsl #2]
20027fe6:	3301      	adds	r3, #1
20027fe8:	e7f7      	b.n	20027fda <mbedtls_mpi_shift_r+0x3c>
20027fea:	2400      	movs	r4, #0
20027fec:	6843      	ldr	r3, [r0, #4]
20027fee:	f1c2 0720 	rsb	r7, r2, #32
20027ff2:	3b01      	subs	r3, #1
20027ff4:	d3e3      	bcc.n	20027fbe <mbedtls_mpi_shift_r+0x20>
20027ff6:	6881      	ldr	r1, [r0, #8]
20027ff8:	f851 5023 	ldr.w	r5, [r1, r3, lsl #2]
20027ffc:	fa25 f602 	lsr.w	r6, r5, r2
20028000:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
20028004:	6886      	ldr	r6, [r0, #8]
20028006:	f856 1023 	ldr.w	r1, [r6, r3, lsl #2]
2002800a:	4321      	orrs	r1, r4
2002800c:	f846 1023 	str.w	r1, [r6, r3, lsl #2]
20028010:	fa05 f407 	lsl.w	r4, r5, r7
20028014:	e7ed      	b.n	20027ff2 <mbedtls_mpi_shift_r+0x54>
20028016:	291f      	cmp	r1, #31
20028018:	d9d1      	bls.n	20027fbe <mbedtls_mpi_shift_r+0x20>
2002801a:	2300      	movs	r3, #0
2002801c:	00a1      	lsls	r1, r4, #2
2002801e:	e7d7      	b.n	20027fd0 <mbedtls_mpi_shift_r+0x32>

20028020 <mbedtls_mpi_cmp_abs>:
20028020:	b530      	push	{r4, r5, lr}
20028022:	6842      	ldr	r2, [r0, #4]
20028024:	b922      	cbnz	r2, 20028030 <mbedtls_mpi_cmp_abs+0x10>
20028026:	684b      	ldr	r3, [r1, #4]
20028028:	b95b      	cbnz	r3, 20028042 <mbedtls_mpi_cmp_abs+0x22>
2002802a:	b19a      	cbz	r2, 20028054 <mbedtls_mpi_cmp_abs+0x34>
2002802c:	2001      	movs	r0, #1
2002802e:	e015      	b.n	2002805c <mbedtls_mpi_cmp_abs+0x3c>
20028030:	6883      	ldr	r3, [r0, #8]
20028032:	eb03 0382 	add.w	r3, r3, r2, lsl #2
20028036:	f853 3c04 	ldr.w	r3, [r3, #-4]
2002803a:	2b00      	cmp	r3, #0
2002803c:	d1f3      	bne.n	20028026 <mbedtls_mpi_cmp_abs+0x6>
2002803e:	3a01      	subs	r2, #1
20028040:	e7f0      	b.n	20028024 <mbedtls_mpi_cmp_abs+0x4>
20028042:	688c      	ldr	r4, [r1, #8]
20028044:	eb04 0583 	add.w	r5, r4, r3, lsl #2
20028048:	f855 5c04 	ldr.w	r5, [r5, #-4]
2002804c:	b90d      	cbnz	r5, 20028052 <mbedtls_mpi_cmp_abs+0x32>
2002804e:	3b01      	subs	r3, #1
20028050:	e7ea      	b.n	20028028 <mbedtls_mpi_cmp_abs+0x8>
20028052:	b922      	cbnz	r2, 2002805e <mbedtls_mpi_cmp_abs+0x3e>
20028054:	1e18      	subs	r0, r3, #0
20028056:	bf18      	it	ne
20028058:	2001      	movne	r0, #1
2002805a:	4240      	negs	r0, r0
2002805c:	bd30      	pop	{r4, r5, pc}
2002805e:	4293      	cmp	r3, r2
20028060:	d3e4      	bcc.n	2002802c <mbedtls_mpi_cmp_abs+0xc>
20028062:	d80e      	bhi.n	20028082 <mbedtls_mpi_cmp_abs+0x62>
20028064:	3a01      	subs	r2, #1
20028066:	6883      	ldr	r3, [r0, #8]
20028068:	f853 1022 	ldr.w	r1, [r3, r2, lsl #2]
2002806c:	f854 3022 	ldr.w	r3, [r4, r2, lsl #2]
20028070:	4299      	cmp	r1, r3
20028072:	d8db      	bhi.n	2002802c <mbedtls_mpi_cmp_abs+0xc>
20028074:	f102 32ff 	add.w	r2, r2, #4294967295	@ 0xffffffff
20028078:	d303      	bcc.n	20028082 <mbedtls_mpi_cmp_abs+0x62>
2002807a:	1c53      	adds	r3, r2, #1
2002807c:	d1f3      	bne.n	20028066 <mbedtls_mpi_cmp_abs+0x46>
2002807e:	2000      	movs	r0, #0
20028080:	e7ec      	b.n	2002805c <mbedtls_mpi_cmp_abs+0x3c>
20028082:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20028086:	e7e9      	b.n	2002805c <mbedtls_mpi_cmp_abs+0x3c>

20028088 <mpi_montmul>:
20028088:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002808c:	4615      	mov	r5, r2
2002808e:	b087      	sub	sp, #28
20028090:	9305      	str	r3, [sp, #20]
20028092:	9b10      	ldr	r3, [sp, #64]	@ 0x40
20028094:	4606      	mov	r6, r0
20028096:	685a      	ldr	r2, [r3, #4]
20028098:	686b      	ldr	r3, [r5, #4]
2002809a:	4689      	mov	r9, r1
2002809c:	3301      	adds	r3, #1
2002809e:	429a      	cmp	r2, r3
200280a0:	d359      	bcc.n	20028156 <mpi_montmul+0xce>
200280a2:	9b10      	ldr	r3, [sp, #64]	@ 0x40
200280a4:	6898      	ldr	r0, [r3, #8]
200280a6:	2800      	cmp	r0, #0
200280a8:	d055      	beq.n	20028156 <mpi_montmul+0xce>
200280aa:	0092      	lsls	r2, r2, #2
200280ac:	2100      	movs	r1, #0
200280ae:	f002 fbad 	bl	2002a80c <memset>
200280b2:	9b10      	ldr	r3, [sp, #64]	@ 0x40
200280b4:	f8d5 8004 	ldr.w	r8, [r5, #4]
200280b8:	f8d3 a008 	ldr.w	sl, [r3, #8]
200280bc:	f8d9 3004 	ldr.w	r3, [r9, #4]
200280c0:	46d3      	mov	fp, sl
200280c2:	4543      	cmp	r3, r8
200280c4:	bf28      	it	cs
200280c6:	4643      	movcs	r3, r8
200280c8:	2400      	movs	r4, #0
200280ca:	9304      	str	r3, [sp, #16]
200280cc:	f108 0301 	add.w	r3, r8, #1
200280d0:	009a      	lsls	r2, r3, #2
200280d2:	eb0a 0383 	add.w	r3, sl, r3, lsl #2
200280d6:	9202      	str	r2, [sp, #8]
200280d8:	9303      	str	r3, [sp, #12]
200280da:	4544      	cmp	r4, r8
200280dc:	68b0      	ldr	r0, [r6, #8]
200280de:	d118      	bne.n	20028112 <mpi_montmul+0x8a>
200280e0:	9b02      	ldr	r3, [sp, #8]
200280e2:	1f19      	subs	r1, r3, #4
200280e4:	461a      	mov	r2, r3
200280e6:	4451      	add	r1, sl
200280e8:	f002 fbaa 	bl	2002a840 <memcpy>
200280ec:	4629      	mov	r1, r5
200280ee:	4630      	mov	r0, r6
200280f0:	f7ff ff96 	bl	20028020 <mbedtls_mpi_cmp_abs>
200280f4:	3001      	adds	r0, #1
200280f6:	68b1      	ldr	r1, [r6, #8]
200280f8:	bf0c      	ite	eq
200280fa:	9b10      	ldreq	r3, [sp, #64]	@ 0x40
200280fc:	460a      	movne	r2, r1
200280fe:	4620      	mov	r0, r4
20028100:	bf14      	ite	ne
20028102:	68a9      	ldrne	r1, [r5, #8]
20028104:	689a      	ldreq	r2, [r3, #8]
20028106:	f7ff fc2c 	bl	20027962 <mpi_sub_hlp>
2002810a:	2000      	movs	r0, #0
2002810c:	b007      	add	sp, #28
2002810e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20028112:	f850 3024 	ldr.w	r3, [r0, r4, lsl #2]
20028116:	f8d9 1008 	ldr.w	r1, [r9, #8]
2002811a:	9301      	str	r3, [sp, #4]
2002811c:	9a01      	ldr	r2, [sp, #4]
2002811e:	680b      	ldr	r3, [r1, #0]
20028120:	f8db 7000 	ldr.w	r7, [fp]
20028124:	9804      	ldr	r0, [sp, #16]
20028126:	fb03 7702 	mla	r7, r3, r2, r7
2002812a:	9b05      	ldr	r3, [sp, #20]
2002812c:	3401      	adds	r4, #1
2002812e:	435f      	muls	r7, r3
20028130:	4613      	mov	r3, r2
20028132:	465a      	mov	r2, fp
20028134:	f7ff fc3e 	bl	200279b4 <mpi_mul_hlp>
20028138:	465a      	mov	r2, fp
2002813a:	463b      	mov	r3, r7
2002813c:	4640      	mov	r0, r8
2002813e:	68a9      	ldr	r1, [r5, #8]
20028140:	f7ff fc38 	bl	200279b4 <mpi_mul_hlp>
20028144:	2200      	movs	r2, #0
20028146:	9b01      	ldr	r3, [sp, #4]
20028148:	f84b 3b04 	str.w	r3, [fp], #4
2002814c:	9b03      	ldr	r3, [sp, #12]
2002814e:	f843 2f04 	str.w	r2, [r3, #4]!
20028152:	9303      	str	r3, [sp, #12]
20028154:	e7c1      	b.n	200280da <mpi_montmul+0x52>
20028156:	f06f 0003 	mvn.w	r0, #3
2002815a:	e7d7      	b.n	2002810c <mpi_montmul+0x84>

2002815c <mbedtls_mpi_cmp_mpi>:
2002815c:	4602      	mov	r2, r0
2002815e:	b530      	push	{r4, r5, lr}
20028160:	6843      	ldr	r3, [r0, #4]
20028162:	b923      	cbnz	r3, 2002816e <mbedtls_mpi_cmp_mpi+0x12>
20028164:	6848      	ldr	r0, [r1, #4]
20028166:	b958      	cbnz	r0, 20028180 <mbedtls_mpi_cmp_mpi+0x24>
20028168:	2b00      	cmp	r3, #0
2002816a:	d136      	bne.n	200281da <mbedtls_mpi_cmp_mpi+0x7e>
2002816c:	e02f      	b.n	200281ce <mbedtls_mpi_cmp_mpi+0x72>
2002816e:	6890      	ldr	r0, [r2, #8]
20028170:	eb00 0083 	add.w	r0, r0, r3, lsl #2
20028174:	f850 0c04 	ldr.w	r0, [r0, #-4]
20028178:	2800      	cmp	r0, #0
2002817a:	d1f3      	bne.n	20028164 <mbedtls_mpi_cmp_mpi+0x8>
2002817c:	3b01      	subs	r3, #1
2002817e:	e7f0      	b.n	20028162 <mbedtls_mpi_cmp_mpi+0x6>
20028180:	688c      	ldr	r4, [r1, #8]
20028182:	eb04 0580 	add.w	r5, r4, r0, lsl #2
20028186:	f855 5c04 	ldr.w	r5, [r5, #-4]
2002818a:	bb15      	cbnz	r5, 200281d2 <mbedtls_mpi_cmp_mpi+0x76>
2002818c:	3801      	subs	r0, #1
2002818e:	e7ea      	b.n	20028166 <mbedtls_mpi_cmp_mpi+0xa>
20028190:	680d      	ldr	r5, [r1, #0]
20028192:	d202      	bcs.n	2002819a <mbedtls_mpi_cmp_mpi+0x3e>
20028194:	6808      	ldr	r0, [r1, #0]
20028196:	4240      	negs	r0, r0
20028198:	e020      	b.n	200281dc <mbedtls_mpi_cmp_mpi+0x80>
2002819a:	6810      	ldr	r0, [r2, #0]
2002819c:	2800      	cmp	r0, #0
2002819e:	dd03      	ble.n	200281a8 <mbedtls_mpi_cmp_mpi+0x4c>
200281a0:	2d00      	cmp	r5, #0
200281a2:	da07      	bge.n	200281b4 <mbedtls_mpi_cmp_mpi+0x58>
200281a4:	2001      	movs	r0, #1
200281a6:	e019      	b.n	200281dc <mbedtls_mpi_cmp_mpi+0x80>
200281a8:	2d00      	cmp	r5, #0
200281aa:	dd03      	ble.n	200281b4 <mbedtls_mpi_cmp_mpi+0x58>
200281ac:	b110      	cbz	r0, 200281b4 <mbedtls_mpi_cmp_mpi+0x58>
200281ae:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
200281b2:	e013      	b.n	200281dc <mbedtls_mpi_cmp_mpi+0x80>
200281b4:	3b01      	subs	r3, #1
200281b6:	6891      	ldr	r1, [r2, #8]
200281b8:	f851 5023 	ldr.w	r5, [r1, r3, lsl #2]
200281bc:	f854 1023 	ldr.w	r1, [r4, r3, lsl #2]
200281c0:	428d      	cmp	r5, r1
200281c2:	d80b      	bhi.n	200281dc <mbedtls_mpi_cmp_mpi+0x80>
200281c4:	f103 33ff 	add.w	r3, r3, #4294967295	@ 0xffffffff
200281c8:	d3e5      	bcc.n	20028196 <mbedtls_mpi_cmp_mpi+0x3a>
200281ca:	1c59      	adds	r1, r3, #1
200281cc:	d1f3      	bne.n	200281b6 <mbedtls_mpi_cmp_mpi+0x5a>
200281ce:	2000      	movs	r0, #0
200281d0:	e004      	b.n	200281dc <mbedtls_mpi_cmp_mpi+0x80>
200281d2:	2b00      	cmp	r3, #0
200281d4:	d0de      	beq.n	20028194 <mbedtls_mpi_cmp_mpi+0x38>
200281d6:	4283      	cmp	r3, r0
200281d8:	d9da      	bls.n	20028190 <mbedtls_mpi_cmp_mpi+0x34>
200281da:	6810      	ldr	r0, [r2, #0]
200281dc:	bd30      	pop	{r4, r5, pc}

200281de <mbedtls_mpi_cmp_int>:
200281de:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200281e0:	ea81 73e1 	eor.w	r3, r1, r1, asr #31
200281e4:	eba3 73e1 	sub.w	r3, r3, r1, asr #31
200281e8:	2900      	cmp	r1, #0
200281ea:	9300      	str	r3, [sp, #0]
200281ec:	bfac      	ite	ge
200281ee:	2301      	movge	r3, #1
200281f0:	f04f 33ff 	movlt.w	r3, #4294967295	@ 0xffffffff
200281f4:	9301      	str	r3, [sp, #4]
200281f6:	2301      	movs	r3, #1
200281f8:	a901      	add	r1, sp, #4
200281fa:	9302      	str	r3, [sp, #8]
200281fc:	f8cd d00c 	str.w	sp, [sp, #12]
20028200:	f7ff ffac 	bl	2002815c <mbedtls_mpi_cmp_mpi>
20028204:	b005      	add	sp, #20
20028206:	f85d fb04 	ldr.w	pc, [sp], #4

2002820a <mbedtls_mpi_add_abs>:
2002820a:	4290      	cmp	r0, r2
2002820c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20028210:	4606      	mov	r6, r0
20028212:	460c      	mov	r4, r1
20028214:	4615      	mov	r5, r2
20028216:	d002      	beq.n	2002821e <mbedtls_mpi_add_abs+0x14>
20028218:	4288      	cmp	r0, r1
2002821a:	d12c      	bne.n	20028276 <mbedtls_mpi_add_abs+0x6c>
2002821c:	462c      	mov	r4, r5
2002821e:	2301      	movs	r3, #1
20028220:	6033      	str	r3, [r6, #0]
20028222:	6865      	ldr	r5, [r4, #4]
20028224:	bb85      	cbnz	r5, 20028288 <mbedtls_mpi_add_abs+0x7e>
20028226:	4629      	mov	r1, r5
20028228:	4630      	mov	r0, r6
2002822a:	f7ff fd5b 	bl	20027ce4 <mbedtls_mpi_grow>
2002822e:	4607      	mov	r7, r0
20028230:	bb28      	cbnz	r0, 2002827e <mbedtls_mpi_add_abs+0x74>
20028232:	68b3      	ldr	r3, [r6, #8]
20028234:	68a1      	ldr	r1, [r4, #8]
20028236:	469c      	mov	ip, r3
20028238:	4604      	mov	r4, r0
2002823a:	42a8      	cmp	r0, r5
2002823c:	d12d      	bne.n	2002829a <mbedtls_mpi_add_abs+0x90>
2002823e:	eb03 0385 	add.w	r3, r3, r5, lsl #2
20028242:	b1f4      	cbz	r4, 20028282 <mbedtls_mpi_add_abs+0x78>
20028244:	6872      	ldr	r2, [r6, #4]
20028246:	f105 0801 	add.w	r8, r5, #1
2002824a:	42aa      	cmp	r2, r5
2002824c:	d807      	bhi.n	2002825e <mbedtls_mpi_add_abs+0x54>
2002824e:	4641      	mov	r1, r8
20028250:	4630      	mov	r0, r6
20028252:	f7ff fd47 	bl	20027ce4 <mbedtls_mpi_grow>
20028256:	b990      	cbnz	r0, 2002827e <mbedtls_mpi_add_abs+0x74>
20028258:	68b3      	ldr	r3, [r6, #8]
2002825a:	eb03 0385 	add.w	r3, r3, r5, lsl #2
2002825e:	681a      	ldr	r2, [r3, #0]
20028260:	4645      	mov	r5, r8
20028262:	1912      	adds	r2, r2, r4
20028264:	bf2c      	ite	cs
20028266:	2401      	movcs	r4, #1
20028268:	2400      	movcc	r4, #0
2002826a:	3c00      	subs	r4, #0
2002826c:	bf18      	it	ne
2002826e:	2401      	movne	r4, #1
20028270:	f843 2b04 	str.w	r2, [r3], #4
20028274:	e7e5      	b.n	20028242 <mbedtls_mpi_add_abs+0x38>
20028276:	f7ff fd61 	bl	20027d3c <mbedtls_mpi_copy>
2002827a:	2800      	cmp	r0, #0
2002827c:	d0ce      	beq.n	2002821c <mbedtls_mpi_add_abs+0x12>
2002827e:	f06f 070f 	mvn.w	r7, #15
20028282:	4638      	mov	r0, r7
20028284:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20028288:	68a3      	ldr	r3, [r4, #8]
2002828a:	eb03 0385 	add.w	r3, r3, r5, lsl #2
2002828e:	f853 3c04 	ldr.w	r3, [r3, #-4]
20028292:	2b00      	cmp	r3, #0
20028294:	d1c7      	bne.n	20028226 <mbedtls_mpi_add_abs+0x1c>
20028296:	3d01      	subs	r5, #1
20028298:	e7c4      	b.n	20028224 <mbedtls_mpi_add_abs+0x1a>
2002829a:	f8dc 2000 	ldr.w	r2, [ip]
2002829e:	1912      	adds	r2, r2, r4
200282a0:	bf2c      	ite	cs
200282a2:	f04f 0e01 	movcs.w	lr, #1
200282a6:	f04f 0e00 	movcc.w	lr, #0
200282aa:	f851 4020 	ldr.w	r4, [r1, r0, lsl #2]
200282ae:	3001      	adds	r0, #1
200282b0:	1912      	adds	r2, r2, r4
200282b2:	f84c 2b04 	str.w	r2, [ip], #4
200282b6:	f14e 0400 	adc.w	r4, lr, #0
200282ba:	e7be      	b.n	2002823a <mbedtls_mpi_add_abs+0x30>

200282bc <mbedtls_mpi_sub_abs>:
200282bc:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
200282be:	460e      	mov	r6, r1
200282c0:	4605      	mov	r5, r0
200282c2:	4611      	mov	r1, r2
200282c4:	4630      	mov	r0, r6
200282c6:	4614      	mov	r4, r2
200282c8:	f7ff feaa 	bl	20028020 <mbedtls_mpi_cmp_abs>
200282cc:	3001      	adds	r0, #1
200282ce:	d02f      	beq.n	20028330 <mbedtls_mpi_sub_abs+0x74>
200282d0:	2300      	movs	r3, #0
200282d2:	2201      	movs	r2, #1
200282d4:	42ac      	cmp	r4, r5
200282d6:	e9cd 2301 	strd	r2, r3, [sp, #4]
200282da:	9303      	str	r3, [sp, #12]
200282dc:	d10d      	bne.n	200282fa <mbedtls_mpi_sub_abs+0x3e>
200282de:	4621      	mov	r1, r4
200282e0:	a801      	add	r0, sp, #4
200282e2:	f7ff fd2b 	bl	20027d3c <mbedtls_mpi_copy>
200282e6:	b138      	cbz	r0, 200282f8 <mbedtls_mpi_sub_abs+0x3c>
200282e8:	f06f 040f 	mvn.w	r4, #15
200282ec:	a801      	add	r0, sp, #4
200282ee:	f7ff fce4 	bl	20027cba <mbedtls_mpi_free>
200282f2:	4620      	mov	r0, r4
200282f4:	b004      	add	sp, #16
200282f6:	bd70      	pop	{r4, r5, r6, pc}
200282f8:	ac01      	add	r4, sp, #4
200282fa:	42ae      	cmp	r6, r5
200282fc:	d109      	bne.n	20028312 <mbedtls_mpi_sub_abs+0x56>
200282fe:	2301      	movs	r3, #1
20028300:	602b      	str	r3, [r5, #0]
20028302:	e9d4 0101 	ldrd	r0, r1, [r4, #4]
20028306:	b958      	cbnz	r0, 20028320 <mbedtls_mpi_sub_abs+0x64>
20028308:	68aa      	ldr	r2, [r5, #8]
2002830a:	f7ff fb2a 	bl	20027962 <mpi_sub_hlp>
2002830e:	2400      	movs	r4, #0
20028310:	e7ec      	b.n	200282ec <mbedtls_mpi_sub_abs+0x30>
20028312:	4631      	mov	r1, r6
20028314:	4628      	mov	r0, r5
20028316:	f7ff fd11 	bl	20027d3c <mbedtls_mpi_copy>
2002831a:	2800      	cmp	r0, #0
2002831c:	d0ef      	beq.n	200282fe <mbedtls_mpi_sub_abs+0x42>
2002831e:	e7e3      	b.n	200282e8 <mbedtls_mpi_sub_abs+0x2c>
20028320:	eb01 0380 	add.w	r3, r1, r0, lsl #2
20028324:	f853 3c04 	ldr.w	r3, [r3, #-4]
20028328:	2b00      	cmp	r3, #0
2002832a:	d1ed      	bne.n	20028308 <mbedtls_mpi_sub_abs+0x4c>
2002832c:	3801      	subs	r0, #1
2002832e:	e7ea      	b.n	20028306 <mbedtls_mpi_sub_abs+0x4a>
20028330:	f06f 0409 	mvn.w	r4, #9
20028334:	e7dd      	b.n	200282f2 <mbedtls_mpi_sub_abs+0x36>

20028336 <mbedtls_mpi_add_mpi>:
20028336:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20028338:	680d      	ldr	r5, [r1, #0]
2002833a:	6813      	ldr	r3, [r2, #0]
2002833c:	4604      	mov	r4, r0
2002833e:	436b      	muls	r3, r5
20028340:	460f      	mov	r7, r1
20028342:	4616      	mov	r6, r2
20028344:	d516      	bpl.n	20028374 <mbedtls_mpi_add_mpi+0x3e>
20028346:	4611      	mov	r1, r2
20028348:	4638      	mov	r0, r7
2002834a:	f7ff fe69 	bl	20028020 <mbedtls_mpi_cmp_abs>
2002834e:	3001      	adds	r0, #1
20028350:	d007      	beq.n	20028362 <mbedtls_mpi_add_mpi+0x2c>
20028352:	4632      	mov	r2, r6
20028354:	4639      	mov	r1, r7
20028356:	4620      	mov	r0, r4
20028358:	f7ff ffb0 	bl	200282bc <mbedtls_mpi_sub_abs>
2002835c:	b900      	cbnz	r0, 20028360 <mbedtls_mpi_add_mpi+0x2a>
2002835e:	6025      	str	r5, [r4, #0]
20028360:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20028362:	463a      	mov	r2, r7
20028364:	4631      	mov	r1, r6
20028366:	4620      	mov	r0, r4
20028368:	f7ff ffa8 	bl	200282bc <mbedtls_mpi_sub_abs>
2002836c:	2800      	cmp	r0, #0
2002836e:	d1f7      	bne.n	20028360 <mbedtls_mpi_add_mpi+0x2a>
20028370:	426d      	negs	r5, r5
20028372:	e7f4      	b.n	2002835e <mbedtls_mpi_add_mpi+0x28>
20028374:	f7ff ff49 	bl	2002820a <mbedtls_mpi_add_abs>
20028378:	2800      	cmp	r0, #0
2002837a:	d0f0      	beq.n	2002835e <mbedtls_mpi_add_mpi+0x28>
2002837c:	f06f 000f 	mvn.w	r0, #15
20028380:	e7ee      	b.n	20028360 <mbedtls_mpi_add_mpi+0x2a>

20028382 <mbedtls_mpi_sub_mpi>:
20028382:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20028384:	680d      	ldr	r5, [r1, #0]
20028386:	6813      	ldr	r3, [r2, #0]
20028388:	4604      	mov	r4, r0
2002838a:	436b      	muls	r3, r5
2002838c:	2b00      	cmp	r3, #0
2002838e:	460f      	mov	r7, r1
20028390:	4616      	mov	r6, r2
20028392:	dd16      	ble.n	200283c2 <mbedtls_mpi_sub_mpi+0x40>
20028394:	4611      	mov	r1, r2
20028396:	4638      	mov	r0, r7
20028398:	f7ff fe42 	bl	20028020 <mbedtls_mpi_cmp_abs>
2002839c:	3001      	adds	r0, #1
2002839e:	d007      	beq.n	200283b0 <mbedtls_mpi_sub_mpi+0x2e>
200283a0:	4632      	mov	r2, r6
200283a2:	4639      	mov	r1, r7
200283a4:	4620      	mov	r0, r4
200283a6:	f7ff ff89 	bl	200282bc <mbedtls_mpi_sub_abs>
200283aa:	b900      	cbnz	r0, 200283ae <mbedtls_mpi_sub_mpi+0x2c>
200283ac:	6025      	str	r5, [r4, #0]
200283ae:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
200283b0:	463a      	mov	r2, r7
200283b2:	4631      	mov	r1, r6
200283b4:	4620      	mov	r0, r4
200283b6:	f7ff ff81 	bl	200282bc <mbedtls_mpi_sub_abs>
200283ba:	2800      	cmp	r0, #0
200283bc:	d1f7      	bne.n	200283ae <mbedtls_mpi_sub_mpi+0x2c>
200283be:	426d      	negs	r5, r5
200283c0:	e7f4      	b.n	200283ac <mbedtls_mpi_sub_mpi+0x2a>
200283c2:	f7ff ff22 	bl	2002820a <mbedtls_mpi_add_abs>
200283c6:	2800      	cmp	r0, #0
200283c8:	d0f0      	beq.n	200283ac <mbedtls_mpi_sub_mpi+0x2a>
200283ca:	f06f 000f 	mvn.w	r0, #15
200283ce:	e7ee      	b.n	200283ae <mbedtls_mpi_sub_mpi+0x2c>

200283d0 <mbedtls_mpi_sub_int>:
200283d0:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200283d2:	ea82 73e2 	eor.w	r3, r2, r2, asr #31
200283d6:	eba3 73e2 	sub.w	r3, r3, r2, asr #31
200283da:	2a00      	cmp	r2, #0
200283dc:	9300      	str	r3, [sp, #0]
200283de:	bfac      	ite	ge
200283e0:	2301      	movge	r3, #1
200283e2:	f04f 33ff 	movlt.w	r3, #4294967295	@ 0xffffffff
200283e6:	9301      	str	r3, [sp, #4]
200283e8:	2301      	movs	r3, #1
200283ea:	aa01      	add	r2, sp, #4
200283ec:	9302      	str	r3, [sp, #8]
200283ee:	f8cd d00c 	str.w	sp, [sp, #12]
200283f2:	f7ff ffc6 	bl	20028382 <mbedtls_mpi_sub_mpi>
200283f6:	b005      	add	sp, #20
200283f8:	f85d fb04 	ldr.w	pc, [sp], #4

200283fc <mbedtls_mpi_mul_mpi>:
200283fc:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
20028400:	2300      	movs	r3, #0
20028402:	4615      	mov	r5, r2
20028404:	2201      	movs	r2, #1
20028406:	b087      	sub	sp, #28
20028408:	4288      	cmp	r0, r1
2002840a:	4607      	mov	r7, r0
2002840c:	460e      	mov	r6, r1
2002840e:	e9cd 2300 	strd	r2, r3, [sp]
20028412:	e9cd 3202 	strd	r3, r2, [sp, #8]
20028416:	e9cd 3304 	strd	r3, r3, [sp, #16]
2002841a:	d110      	bne.n	2002843e <mbedtls_mpi_mul_mpi+0x42>
2002841c:	4668      	mov	r0, sp
2002841e:	f7ff fc8d 	bl	20027d3c <mbedtls_mpi_copy>
20028422:	b158      	cbz	r0, 2002843c <mbedtls_mpi_mul_mpi+0x40>
20028424:	f06f 090f 	mvn.w	r9, #15
20028428:	a803      	add	r0, sp, #12
2002842a:	f7ff fc46 	bl	20027cba <mbedtls_mpi_free>
2002842e:	4668      	mov	r0, sp
20028430:	f7ff fc43 	bl	20027cba <mbedtls_mpi_free>
20028434:	4648      	mov	r0, r9
20028436:	b007      	add	sp, #28
20028438:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
2002843c:	466e      	mov	r6, sp
2002843e:	42af      	cmp	r7, r5
20028440:	d106      	bne.n	20028450 <mbedtls_mpi_mul_mpi+0x54>
20028442:	4639      	mov	r1, r7
20028444:	a803      	add	r0, sp, #12
20028446:	f7ff fc79 	bl	20027d3c <mbedtls_mpi_copy>
2002844a:	2800      	cmp	r0, #0
2002844c:	d1ea      	bne.n	20028424 <mbedtls_mpi_mul_mpi+0x28>
2002844e:	ad03      	add	r5, sp, #12
20028450:	f8d6 8004 	ldr.w	r8, [r6, #4]
20028454:	f1b8 0f00 	cmp.w	r8, #0
20028458:	d116      	bne.n	20028488 <mbedtls_mpi_mul_mpi+0x8c>
2002845a:	686c      	ldr	r4, [r5, #4]
2002845c:	b9f4      	cbnz	r4, 2002849c <mbedtls_mpi_mul_mpi+0xa0>
2002845e:	eb08 0104 	add.w	r1, r8, r4
20028462:	4638      	mov	r0, r7
20028464:	f7ff fc3e 	bl	20027ce4 <mbedtls_mpi_grow>
20028468:	4601      	mov	r1, r0
2002846a:	2800      	cmp	r0, #0
2002846c:	d1da      	bne.n	20028424 <mbedtls_mpi_mul_mpi+0x28>
2002846e:	4638      	mov	r0, r7
20028470:	f7ff fc8d 	bl	20027d8e <mbedtls_mpi_lset>
20028474:	4681      	mov	r9, r0
20028476:	2800      	cmp	r0, #0
20028478:	d1d4      	bne.n	20028424 <mbedtls_mpi_mul_mpi+0x28>
2002847a:	3c01      	subs	r4, #1
2002847c:	d217      	bcs.n	200284ae <mbedtls_mpi_mul_mpi+0xb2>
2002847e:	6833      	ldr	r3, [r6, #0]
20028480:	682a      	ldr	r2, [r5, #0]
20028482:	4353      	muls	r3, r2
20028484:	603b      	str	r3, [r7, #0]
20028486:	e7cf      	b.n	20028428 <mbedtls_mpi_mul_mpi+0x2c>
20028488:	68b3      	ldr	r3, [r6, #8]
2002848a:	eb03 0388 	add.w	r3, r3, r8, lsl #2
2002848e:	f853 3c04 	ldr.w	r3, [r3, #-4]
20028492:	2b00      	cmp	r3, #0
20028494:	d1e1      	bne.n	2002845a <mbedtls_mpi_mul_mpi+0x5e>
20028496:	f108 38ff 	add.w	r8, r8, #4294967295	@ 0xffffffff
2002849a:	e7db      	b.n	20028454 <mbedtls_mpi_mul_mpi+0x58>
2002849c:	68ab      	ldr	r3, [r5, #8]
2002849e:	eb03 0384 	add.w	r3, r3, r4, lsl #2
200284a2:	f853 3c04 	ldr.w	r3, [r3, #-4]
200284a6:	2b00      	cmp	r3, #0
200284a8:	d1d9      	bne.n	2002845e <mbedtls_mpi_mul_mpi+0x62>
200284aa:	3c01      	subs	r4, #1
200284ac:	e7d6      	b.n	2002845c <mbedtls_mpi_mul_mpi+0x60>
200284ae:	68ab      	ldr	r3, [r5, #8]
200284b0:	68ba      	ldr	r2, [r7, #8]
200284b2:	4640      	mov	r0, r8
200284b4:	f853 3024 	ldr.w	r3, [r3, r4, lsl #2]
200284b8:	68b1      	ldr	r1, [r6, #8]
200284ba:	eb02 0284 	add.w	r2, r2, r4, lsl #2
200284be:	f7ff fa79 	bl	200279b4 <mpi_mul_hlp>
200284c2:	e7da      	b.n	2002847a <mbedtls_mpi_mul_mpi+0x7e>

200284c4 <mbedtls_mpi_mul_int>:
200284c4:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200284c6:	2301      	movs	r3, #1
200284c8:	9200      	str	r2, [sp, #0]
200284ca:	aa01      	add	r2, sp, #4
200284cc:	e9cd 3301 	strd	r3, r3, [sp, #4]
200284d0:	f8cd d00c 	str.w	sp, [sp, #12]
200284d4:	f7ff ff92 	bl	200283fc <mbedtls_mpi_mul_mpi>
200284d8:	b005      	add	sp, #20
200284da:	f85d fb04 	ldr.w	pc, [sp], #4

200284de <mbedtls_mpi_div_mpi>:
200284de:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
200284e2:	b09f      	sub	sp, #124	@ 0x7c
200284e4:	e9cd 1203 	strd	r1, r2, [sp, #12]
200284e8:	9005      	str	r0, [sp, #20]
200284ea:	2100      	movs	r1, #0
200284ec:	4618      	mov	r0, r3
200284ee:	9309      	str	r3, [sp, #36]	@ 0x24
200284f0:	f7ff fe75 	bl	200281de <mbedtls_mpi_cmp_int>
200284f4:	2800      	cmp	r0, #0
200284f6:	f000 81f3 	beq.w	200288e0 <mbedtls_mpi_div_mpi+0x402>
200284fa:	2501      	movs	r5, #1
200284fc:	2400      	movs	r4, #0
200284fe:	9909      	ldr	r1, [sp, #36]	@ 0x24
20028500:	9804      	ldr	r0, [sp, #16]
20028502:	e9cd 5418 	strd	r5, r4, [sp, #96]	@ 0x60
20028506:	e9cd 541b 	strd	r5, r4, [sp, #108]	@ 0x6c
2002850a:	950f      	str	r5, [sp, #60]	@ 0x3c
2002850c:	9512      	str	r5, [sp, #72]	@ 0x48
2002850e:	9515      	str	r5, [sp, #84]	@ 0x54
20028510:	9416      	str	r4, [sp, #88]	@ 0x58
20028512:	f7ff fd85 	bl	20028020 <mbedtls_mpi_cmp_abs>
20028516:	3001      	adds	r0, #1
20028518:	d11f      	bne.n	2002855a <mbedtls_mpi_div_mpi+0x7c>
2002851a:	9b05      	ldr	r3, [sp, #20]
2002851c:	b933      	cbnz	r3, 2002852c <mbedtls_mpi_div_mpi+0x4e>
2002851e:	9b03      	ldr	r3, [sp, #12]
20028520:	b9a3      	cbnz	r3, 2002854c <mbedtls_mpi_div_mpi+0x6e>
20028522:	2100      	movs	r1, #0
20028524:	4608      	mov	r0, r1
20028526:	b01f      	add	sp, #124	@ 0x7c
20028528:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002852c:	4621      	mov	r1, r4
2002852e:	9805      	ldr	r0, [sp, #20]
20028530:	f7ff fc2d 	bl	20027d8e <mbedtls_mpi_lset>
20028534:	2800      	cmp	r0, #0
20028536:	d0f2      	beq.n	2002851e <mbedtls_mpi_div_mpi+0x40>
20028538:	2400      	movs	r4, #0
2002853a:	4625      	mov	r5, r4
2002853c:	46a1      	mov	r9, r4
2002853e:	46a0      	mov	r8, r4
20028540:	4626      	mov	r6, r4
20028542:	4627      	mov	r7, r4
20028544:	9402      	str	r4, [sp, #8]
20028546:	f06f 010f 	mvn.w	r1, #15
2002854a:	e0ef      	b.n	2002872c <mbedtls_mpi_div_mpi+0x24e>
2002854c:	e9dd 0103 	ldrd	r0, r1, [sp, #12]
20028550:	f7ff fbf4 	bl	20027d3c <mbedtls_mpi_copy>
20028554:	2800      	cmp	r0, #0
20028556:	d1ef      	bne.n	20028538 <mbedtls_mpi_div_mpi+0x5a>
20028558:	e7e3      	b.n	20028522 <mbedtls_mpi_div_mpi+0x44>
2002855a:	9904      	ldr	r1, [sp, #16]
2002855c:	a80f      	add	r0, sp, #60	@ 0x3c
2002855e:	e9cd 4410 	strd	r4, r4, [sp, #64]	@ 0x40
20028562:	f7ff fbeb 	bl	20027d3c <mbedtls_mpi_copy>
20028566:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
2002856a:	4682      	mov	sl, r0
2002856c:	2800      	cmp	r0, #0
2002856e:	f040 81a9 	bne.w	200288c4 <mbedtls_mpi_div_mpi+0x3e6>
20028572:	e9cd 0013 	strd	r0, r0, [sp, #76]	@ 0x4c
20028576:	9909      	ldr	r1, [sp, #36]	@ 0x24
20028578:	a812      	add	r0, sp, #72	@ 0x48
2002857a:	f7ff fbdf 	bl	20027d3c <mbedtls_mpi_copy>
2002857e:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
20028582:	4604      	mov	r4, r0
20028584:	2800      	cmp	r0, #0
20028586:	f040 81a2 	bne.w	200288ce <mbedtls_mpi_div_mpi+0x3f0>
2002858a:	9b04      	ldr	r3, [sp, #16]
2002858c:	9017      	str	r0, [sp, #92]	@ 0x5c
2002858e:	6859      	ldr	r1, [r3, #4]
20028590:	a815      	add	r0, sp, #84	@ 0x54
20028592:	3102      	adds	r1, #2
20028594:	9512      	str	r5, [sp, #72]	@ 0x48
20028596:	950f      	str	r5, [sp, #60]	@ 0x3c
20028598:	f7ff fba4 	bl	20027ce4 <mbedtls_mpi_grow>
2002859c:	4605      	mov	r5, r0
2002859e:	b118      	cbz	r0, 200285a8 <mbedtls_mpi_div_mpi+0xca>
200285a0:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
200285a2:	9302      	str	r3, [sp, #8]
200285a4:	4625      	mov	r5, r4
200285a6:	e7ce      	b.n	20028546 <mbedtls_mpi_div_mpi+0x68>
200285a8:	4601      	mov	r1, r0
200285aa:	a815      	add	r0, sp, #84	@ 0x54
200285ac:	f7ff fbef 	bl	20027d8e <mbedtls_mpi_lset>
200285b0:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
200285b2:	4604      	mov	r4, r0
200285b4:	9302      	str	r3, [sp, #8]
200285b6:	2800      	cmp	r0, #0
200285b8:	f040 818e 	bne.w	200288d8 <mbedtls_mpi_div_mpi+0x3fa>
200285bc:	901a      	str	r0, [sp, #104]	@ 0x68
200285be:	2102      	movs	r1, #2
200285c0:	a818      	add	r0, sp, #96	@ 0x60
200285c2:	f7ff fb8f 	bl	20027ce4 <mbedtls_mpi_grow>
200285c6:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200285c8:	2800      	cmp	r0, #0
200285ca:	d1bc      	bne.n	20028546 <mbedtls_mpi_div_mpi+0x68>
200285cc:	901d      	str	r0, [sp, #116]	@ 0x74
200285ce:	2103      	movs	r1, #3
200285d0:	a81b      	add	r0, sp, #108	@ 0x6c
200285d2:	f7ff fb87 	bl	20027ce4 <mbedtls_mpi_grow>
200285d6:	9c1d      	ldr	r4, [sp, #116]	@ 0x74
200285d8:	4683      	mov	fp, r0
200285da:	2800      	cmp	r0, #0
200285dc:	d1b3      	bne.n	20028546 <mbedtls_mpi_div_mpi+0x68>
200285de:	a812      	add	r0, sp, #72	@ 0x48
200285e0:	f7ff fc09 	bl	20027df6 <mbedtls_mpi_bitlen>
200285e4:	f000 001f 	and.w	r0, r0, #31
200285e8:	281f      	cmp	r0, #31
200285ea:	f000 808a 	beq.w	20028702 <mbedtls_mpi_div_mpi+0x224>
200285ee:	f1c0 031f 	rsb	r3, r0, #31
200285f2:	4619      	mov	r1, r3
200285f4:	a80f      	add	r0, sp, #60	@ 0x3c
200285f6:	9306      	str	r3, [sp, #24]
200285f8:	f7ff fc78 	bl	20027eec <mbedtls_mpi_shift_l>
200285fc:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
20028600:	2800      	cmp	r0, #0
20028602:	d1a0      	bne.n	20028546 <mbedtls_mpi_div_mpi+0x68>
20028604:	9906      	ldr	r1, [sp, #24]
20028606:	a812      	add	r0, sp, #72	@ 0x48
20028608:	f7ff fc70 	bl	20027eec <mbedtls_mpi_shift_l>
2002860c:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
20028610:	2800      	cmp	r0, #0
20028612:	d198      	bne.n	20028546 <mbedtls_mpi_div_mpi+0x68>
20028614:	46ba      	mov	sl, r7
20028616:	f8cd 8020 	str.w	r8, [sp, #32]
2002861a:	eba7 0b08 	sub.w	fp, r7, r8
2002861e:	ea4f 134b 	mov.w	r3, fp, lsl #5
20028622:	4619      	mov	r1, r3
20028624:	a812      	add	r0, sp, #72	@ 0x48
20028626:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
2002862a:	9301      	str	r3, [sp, #4]
2002862c:	f7ff fc5e 	bl	20027eec <mbedtls_mpi_shift_l>
20028630:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
20028634:	2800      	cmp	r0, #0
20028636:	d186      	bne.n	20028546 <mbedtls_mpi_div_mpi+0x68>
20028638:	ea4f 038b 	mov.w	r3, fp, lsl #2
2002863c:	930b      	str	r3, [sp, #44]	@ 0x2c
2002863e:	9b02      	ldr	r3, [sp, #8]
20028640:	eb03 0b8b 	add.w	fp, r3, fp, lsl #2
20028644:	a912      	add	r1, sp, #72	@ 0x48
20028646:	a80f      	add	r0, sp, #60	@ 0x3c
20028648:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
2002864c:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
20028650:	f7ff fd84 	bl	2002815c <mbedtls_mpi_cmp_mpi>
20028654:	2800      	cmp	r0, #0
20028656:	da5a      	bge.n	2002870e <mbedtls_mpi_div_mpi+0x230>
20028658:	9901      	ldr	r1, [sp, #4]
2002865a:	a812      	add	r0, sp, #72	@ 0x48
2002865c:	f7ff fc9f 	bl	20027f9e <mbedtls_mpi_shift_r>
20028660:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
20028664:	2800      	cmp	r0, #0
20028666:	f47f af6e 	bne.w	20028546 <mbedtls_mpi_div_mpi+0x68>
2002866a:	f10a 33ff 	add.w	r3, sl, #4294967295	@ 0xffffffff
2002866e:	9301      	str	r3, [sp, #4]
20028670:	9b08      	ldr	r3, [sp, #32]
20028672:	9a02      	ldr	r2, [sp, #8]
20028674:	3b01      	subs	r3, #1
20028676:	9307      	str	r3, [sp, #28]
20028678:	eb09 0383 	add.w	r3, r9, r3, lsl #2
2002867c:	930a      	str	r3, [sp, #40]	@ 0x28
2002867e:	9b08      	ldr	r3, [sp, #32]
20028680:	f103 4380 	add.w	r3, r3, #1073741824	@ 0x40000000
20028684:	3b02      	subs	r3, #2
20028686:	eb09 0383 	add.w	r3, r9, r3, lsl #2
2002868a:	930c      	str	r3, [sp, #48]	@ 0x30
2002868c:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
2002868e:	4413      	add	r3, r2
20028690:	469a      	mov	sl, r3
20028692:	9b01      	ldr	r3, [sp, #4]
20028694:	9a07      	ldr	r2, [sp, #28]
20028696:	4293      	cmp	r3, r2
20028698:	d862      	bhi.n	20028760 <mbedtls_mpi_div_mpi+0x282>
2002869a:	9b05      	ldr	r3, [sp, #20]
2002869c:	b16b      	cbz	r3, 200286ba <mbedtls_mpi_div_mpi+0x1dc>
2002869e:	4618      	mov	r0, r3
200286a0:	a915      	add	r1, sp, #84	@ 0x54
200286a2:	f7ff fb4b 	bl	20027d3c <mbedtls_mpi_copy>
200286a6:	2800      	cmp	r0, #0
200286a8:	f47f af4d 	bne.w	20028546 <mbedtls_mpi_div_mpi+0x68>
200286ac:	9b04      	ldr	r3, [sp, #16]
200286ae:	9a09      	ldr	r2, [sp, #36]	@ 0x24
200286b0:	681b      	ldr	r3, [r3, #0]
200286b2:	6812      	ldr	r2, [r2, #0]
200286b4:	4353      	muls	r3, r2
200286b6:	9a05      	ldr	r2, [sp, #20]
200286b8:	6013      	str	r3, [r2, #0]
200286ba:	9b03      	ldr	r3, [sp, #12]
200286bc:	2b00      	cmp	r3, #0
200286be:	f000 810d 	beq.w	200288dc <mbedtls_mpi_div_mpi+0x3fe>
200286c2:	9906      	ldr	r1, [sp, #24]
200286c4:	a80f      	add	r0, sp, #60	@ 0x3c
200286c6:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
200286ca:	f7ff fc68 	bl	20027f9e <mbedtls_mpi_shift_r>
200286ce:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
200286d2:	2800      	cmp	r0, #0
200286d4:	f47f af37 	bne.w	20028546 <mbedtls_mpi_div_mpi+0x68>
200286d8:	9b04      	ldr	r3, [sp, #16]
200286da:	a90f      	add	r1, sp, #60	@ 0x3c
200286dc:	681b      	ldr	r3, [r3, #0]
200286de:	9803      	ldr	r0, [sp, #12]
200286e0:	930f      	str	r3, [sp, #60]	@ 0x3c
200286e2:	f7ff fb2b 	bl	20027d3c <mbedtls_mpi_copy>
200286e6:	4601      	mov	r1, r0
200286e8:	2800      	cmp	r0, #0
200286ea:	f47f af2c 	bne.w	20028546 <mbedtls_mpi_div_mpi+0x68>
200286ee:	9001      	str	r0, [sp, #4]
200286f0:	9803      	ldr	r0, [sp, #12]
200286f2:	f7ff fd74 	bl	200281de <mbedtls_mpi_cmp_int>
200286f6:	9901      	ldr	r1, [sp, #4]
200286f8:	b9c0      	cbnz	r0, 2002872c <mbedtls_mpi_div_mpi+0x24e>
200286fa:	2301      	movs	r3, #1
200286fc:	9a03      	ldr	r2, [sp, #12]
200286fe:	6013      	str	r3, [r2, #0]
20028700:	e014      	b.n	2002872c <mbedtls_mpi_div_mpi+0x24e>
20028702:	46ba      	mov	sl, r7
20028704:	f8cd 8020 	str.w	r8, [sp, #32]
20028708:	f8cd b018 	str.w	fp, [sp, #24]
2002870c:	e785      	b.n	2002861a <mbedtls_mpi_div_mpi+0x13c>
2002870e:	f8db 2000 	ldr.w	r2, [fp]
20028712:	a90f      	add	r1, sp, #60	@ 0x3c
20028714:	3201      	adds	r2, #1
20028716:	4608      	mov	r0, r1
20028718:	f8cb 2000 	str.w	r2, [fp]
2002871c:	aa12      	add	r2, sp, #72	@ 0x48
2002871e:	f7ff fe30 	bl	20028382 <mbedtls_mpi_sub_mpi>
20028722:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
20028726:	4601      	mov	r1, r0
20028728:	2800      	cmp	r0, #0
2002872a:	d08b      	beq.n	20028644 <mbedtls_mpi_div_mpi+0x166>
2002872c:	a80f      	add	r0, sp, #60	@ 0x3c
2002872e:	9101      	str	r1, [sp, #4]
20028730:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
20028734:	f7ff fac1 	bl	20027cba <mbedtls_mpi_free>
20028738:	a812      	add	r0, sp, #72	@ 0x48
2002873a:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
2002873e:	f7ff fabc 	bl	20027cba <mbedtls_mpi_free>
20028742:	9b02      	ldr	r3, [sp, #8]
20028744:	a815      	add	r0, sp, #84	@ 0x54
20028746:	9317      	str	r3, [sp, #92]	@ 0x5c
20028748:	f7ff fab7 	bl	20027cba <mbedtls_mpi_free>
2002874c:	a818      	add	r0, sp, #96	@ 0x60
2002874e:	951a      	str	r5, [sp, #104]	@ 0x68
20028750:	f7ff fab3 	bl	20027cba <mbedtls_mpi_free>
20028754:	a81b      	add	r0, sp, #108	@ 0x6c
20028756:	941d      	str	r4, [sp, #116]	@ 0x74
20028758:	f7ff faaf 	bl	20027cba <mbedtls_mpi_free>
2002875c:	9901      	ldr	r1, [sp, #4]
2002875e:	e6e1      	b.n	20028524 <mbedtls_mpi_div_mpi+0x46>
20028760:	9b01      	ldr	r3, [sp, #4]
20028762:	ea4f 0b83 	mov.w	fp, r3, lsl #2
20028766:	eb06 0383 	add.w	r3, r6, r3, lsl #2
2002876a:	930b      	str	r3, [sp, #44]	@ 0x2c
2002876c:	9b01      	ldr	r3, [sp, #4]
2002876e:	f1ab 0004 	sub.w	r0, fp, #4
20028772:	f856 1023 	ldr.w	r1, [r6, r3, lsl #2]
20028776:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
20028778:	681a      	ldr	r2, [r3, #0]
2002877a:	1833      	adds	r3, r6, r0
2002877c:	4291      	cmp	r1, r2
2002877e:	930d      	str	r3, [sp, #52]	@ 0x34
20028780:	d255      	bcs.n	2002882e <mbedtls_mpi_div_mpi+0x350>
20028782:	2300      	movs	r3, #0
20028784:	5830      	ldr	r0, [r6, r0]
20028786:	f001 fd9f 	bl	2002a2c8 <__aeabi_uldivmod>
2002878a:	2900      	cmp	r1, #0
2002878c:	bf14      	ite	ne
2002878e:	f04f 33ff 	movne.w	r3, #4294967295	@ 0xffffffff
20028792:	4603      	moveq	r3, r0
20028794:	3301      	adds	r3, #1
20028796:	f1ab 0b08 	sub.w	fp, fp, #8
2002879a:	f84a 3c04 	str.w	r3, [sl, #-4]
2002879e:	44b3      	add	fp, r6
200287a0:	f85a 3c04 	ldr.w	r3, [sl, #-4]
200287a4:	2100      	movs	r1, #0
200287a6:	3b01      	subs	r3, #1
200287a8:	f84a 3c04 	str.w	r3, [sl, #-4]
200287ac:	a818      	add	r0, sp, #96	@ 0x60
200287ae:	951a      	str	r5, [sp, #104]	@ 0x68
200287b0:	f7ff faed 	bl	20027d8e <mbedtls_mpi_lset>
200287b4:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200287b6:	2800      	cmp	r0, #0
200287b8:	f47f aec5 	bne.w	20028546 <mbedtls_mpi_div_mpi+0x68>
200287bc:	9b07      	ldr	r3, [sp, #28]
200287be:	2b00      	cmp	r3, #0
200287c0:	d038      	beq.n	20028834 <mbedtls_mpi_div_mpi+0x356>
200287c2:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
200287c4:	681b      	ldr	r3, [r3, #0]
200287c6:	602b      	str	r3, [r5, #0]
200287c8:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
200287ca:	a918      	add	r1, sp, #96	@ 0x60
200287cc:	681b      	ldr	r3, [r3, #0]
200287ce:	4608      	mov	r0, r1
200287d0:	606b      	str	r3, [r5, #4]
200287d2:	f85a 2c04 	ldr.w	r2, [sl, #-4]
200287d6:	f7ff fe75 	bl	200284c4 <mbedtls_mpi_mul_int>
200287da:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200287dc:	4601      	mov	r1, r0
200287de:	2800      	cmp	r0, #0
200287e0:	f47f aeb1 	bne.w	20028546 <mbedtls_mpi_div_mpi+0x68>
200287e4:	a81b      	add	r0, sp, #108	@ 0x6c
200287e6:	941d      	str	r4, [sp, #116]	@ 0x74
200287e8:	f7ff fad1 	bl	20027d8e <mbedtls_mpi_lset>
200287ec:	9c1d      	ldr	r4, [sp, #116]	@ 0x74
200287ee:	2800      	cmp	r0, #0
200287f0:	f47f aea9 	bne.w	20028546 <mbedtls_mpi_div_mpi+0x68>
200287f4:	9b01      	ldr	r3, [sp, #4]
200287f6:	a91b      	add	r1, sp, #108	@ 0x6c
200287f8:	2b01      	cmp	r3, #1
200287fa:	bf18      	it	ne
200287fc:	f8db 0000 	ldrne.w	r0, [fp]
20028800:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
20028802:	6020      	str	r0, [r4, #0]
20028804:	681b      	ldr	r3, [r3, #0]
20028806:	a818      	add	r0, sp, #96	@ 0x60
20028808:	6063      	str	r3, [r4, #4]
2002880a:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
2002880c:	681b      	ldr	r3, [r3, #0]
2002880e:	60a3      	str	r3, [r4, #8]
20028810:	f7ff fca4 	bl	2002815c <mbedtls_mpi_cmp_mpi>
20028814:	2800      	cmp	r0, #0
20028816:	dcc3      	bgt.n	200287a0 <mbedtls_mpi_div_mpi+0x2c2>
20028818:	f85a 2c04 	ldr.w	r2, [sl, #-4]
2002881c:	a912      	add	r1, sp, #72	@ 0x48
2002881e:	a818      	add	r0, sp, #96	@ 0x60
20028820:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
20028824:	f7ff fe4e 	bl	200284c4 <mbedtls_mpi_mul_int>
20028828:	b130      	cbz	r0, 20028838 <mbedtls_mpi_div_mpi+0x35a>
2002882a:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
2002882c:	e68b      	b.n	20028546 <mbedtls_mpi_div_mpi+0x68>
2002882e:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
20028832:	e7af      	b.n	20028794 <mbedtls_mpi_div_mpi+0x2b6>
20028834:	9b07      	ldr	r3, [sp, #28]
20028836:	e7c6      	b.n	200287c6 <mbedtls_mpi_div_mpi+0x2e8>
20028838:	f06f 0b1f 	mvn.w	fp, #31
2002883c:	9b08      	ldr	r3, [sp, #32]
2002883e:	a818      	add	r0, sp, #96	@ 0x60
20028840:	fb0b fb03 	mul.w	fp, fp, r3
20028844:	9b01      	ldr	r3, [sp, #4]
20028846:	eb0b 1b43 	add.w	fp, fp, r3, lsl #5
2002884a:	4659      	mov	r1, fp
2002884c:	f7ff fb4e 	bl	20027eec <mbedtls_mpi_shift_l>
20028850:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20028852:	2800      	cmp	r0, #0
20028854:	f47f ae77 	bne.w	20028546 <mbedtls_mpi_div_mpi+0x68>
20028858:	a90f      	add	r1, sp, #60	@ 0x3c
2002885a:	4608      	mov	r0, r1
2002885c:	aa18      	add	r2, sp, #96	@ 0x60
2002885e:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
20028862:	f7ff fd8e 	bl	20028382 <mbedtls_mpi_sub_mpi>
20028866:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
2002886a:	4601      	mov	r1, r0
2002886c:	2800      	cmp	r0, #0
2002886e:	f47f af5d 	bne.w	2002872c <mbedtls_mpi_div_mpi+0x24e>
20028872:	a80f      	add	r0, sp, #60	@ 0x3c
20028874:	f7ff fcb3 	bl	200281de <mbedtls_mpi_cmp_int>
20028878:	2800      	cmp	r0, #0
2002887a:	da1d      	bge.n	200288b8 <mbedtls_mpi_div_mpi+0x3da>
2002887c:	a912      	add	r1, sp, #72	@ 0x48
2002887e:	a818      	add	r0, sp, #96	@ 0x60
20028880:	f7ff fa5c 	bl	20027d3c <mbedtls_mpi_copy>
20028884:	2800      	cmp	r0, #0
20028886:	d1d0      	bne.n	2002882a <mbedtls_mpi_div_mpi+0x34c>
20028888:	4659      	mov	r1, fp
2002888a:	a818      	add	r0, sp, #96	@ 0x60
2002888c:	f7ff fb2e 	bl	20027eec <mbedtls_mpi_shift_l>
20028890:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20028892:	2800      	cmp	r0, #0
20028894:	f47f ae57 	bne.w	20028546 <mbedtls_mpi_div_mpi+0x68>
20028898:	a90f      	add	r1, sp, #60	@ 0x3c
2002889a:	4608      	mov	r0, r1
2002889c:	aa18      	add	r2, sp, #96	@ 0x60
2002889e:	f7ff fd4a 	bl	20028336 <mbedtls_mpi_add_mpi>
200288a2:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
200288a6:	4601      	mov	r1, r0
200288a8:	2800      	cmp	r0, #0
200288aa:	f47f af3f 	bne.w	2002872c <mbedtls_mpi_div_mpi+0x24e>
200288ae:	f85a 3c04 	ldr.w	r3, [sl, #-4]
200288b2:	3b01      	subs	r3, #1
200288b4:	f84a 3c04 	str.w	r3, [sl, #-4]
200288b8:	9b01      	ldr	r3, [sp, #4]
200288ba:	f1aa 0a04 	sub.w	sl, sl, #4
200288be:	3b01      	subs	r3, #1
200288c0:	9301      	str	r3, [sp, #4]
200288c2:	e6e6      	b.n	20028692 <mbedtls_mpi_div_mpi+0x1b4>
200288c4:	4625      	mov	r5, r4
200288c6:	46a1      	mov	r9, r4
200288c8:	46a0      	mov	r8, r4
200288ca:	9402      	str	r4, [sp, #8]
200288cc:	e63b      	b.n	20028546 <mbedtls_mpi_div_mpi+0x68>
200288ce:	4654      	mov	r4, sl
200288d0:	4655      	mov	r5, sl
200288d2:	f8cd a008 	str.w	sl, [sp, #8]
200288d6:	e636      	b.n	20028546 <mbedtls_mpi_div_mpi+0x68>
200288d8:	462c      	mov	r4, r5
200288da:	e663      	b.n	200285a4 <mbedtls_mpi_div_mpi+0xc6>
200288dc:	9903      	ldr	r1, [sp, #12]
200288de:	e725      	b.n	2002872c <mbedtls_mpi_div_mpi+0x24e>
200288e0:	f06f 010b 	mvn.w	r1, #11
200288e4:	e61e      	b.n	20028524 <mbedtls_mpi_div_mpi+0x46>

200288e6 <mbedtls_mpi_mod_mpi>:
200288e6:	b570      	push	{r4, r5, r6, lr}
200288e8:	4604      	mov	r4, r0
200288ea:	460d      	mov	r5, r1
200288ec:	4610      	mov	r0, r2
200288ee:	2100      	movs	r1, #0
200288f0:	4616      	mov	r6, r2
200288f2:	f7ff fc74 	bl	200281de <mbedtls_mpi_cmp_int>
200288f6:	2800      	cmp	r0, #0
200288f8:	db24      	blt.n	20028944 <mbedtls_mpi_mod_mpi+0x5e>
200288fa:	462a      	mov	r2, r5
200288fc:	4633      	mov	r3, r6
200288fe:	4621      	mov	r1, r4
20028900:	2000      	movs	r0, #0
20028902:	f7ff fdec 	bl	200284de <mbedtls_mpi_div_mpi>
20028906:	4605      	mov	r5, r0
20028908:	b138      	cbz	r0, 2002891a <mbedtls_mpi_mod_mpi+0x34>
2002890a:	4628      	mov	r0, r5
2002890c:	bd70      	pop	{r4, r5, r6, pc}
2002890e:	4632      	mov	r2, r6
20028910:	4621      	mov	r1, r4
20028912:	4620      	mov	r0, r4
20028914:	f7ff fd0f 	bl	20028336 <mbedtls_mpi_add_mpi>
20028918:	b990      	cbnz	r0, 20028940 <mbedtls_mpi_mod_mpi+0x5a>
2002891a:	2100      	movs	r1, #0
2002891c:	4620      	mov	r0, r4
2002891e:	f7ff fc5e 	bl	200281de <mbedtls_mpi_cmp_int>
20028922:	2800      	cmp	r0, #0
20028924:	dbf3      	blt.n	2002890e <mbedtls_mpi_mod_mpi+0x28>
20028926:	4631      	mov	r1, r6
20028928:	4620      	mov	r0, r4
2002892a:	f7ff fc17 	bl	2002815c <mbedtls_mpi_cmp_mpi>
2002892e:	2800      	cmp	r0, #0
20028930:	dbeb      	blt.n	2002890a <mbedtls_mpi_mod_mpi+0x24>
20028932:	4632      	mov	r2, r6
20028934:	4621      	mov	r1, r4
20028936:	4620      	mov	r0, r4
20028938:	f7ff fd23 	bl	20028382 <mbedtls_mpi_sub_mpi>
2002893c:	2800      	cmp	r0, #0
2002893e:	d0f2      	beq.n	20028926 <mbedtls_mpi_mod_mpi+0x40>
20028940:	4605      	mov	r5, r0
20028942:	e7e2      	b.n	2002890a <mbedtls_mpi_mod_mpi+0x24>
20028944:	f06f 0509 	mvn.w	r5, #9
20028948:	e7df      	b.n	2002890a <mbedtls_mpi_mod_mpi+0x24>

2002894a <mbedtls_mpi_exp_mod>:
2002894a:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002894e:	4605      	mov	r5, r0
20028950:	f2ad 6d54 	subw	sp, sp, #1620	@ 0x654
20028954:	4688      	mov	r8, r1
20028956:	4618      	mov	r0, r3
20028958:	2100      	movs	r1, #0
2002895a:	461c      	mov	r4, r3
2002895c:	9203      	str	r2, [sp, #12]
2002895e:	f7ff fc3e 	bl	200281de <mbedtls_mpi_cmp_int>
20028962:	2800      	cmp	r0, #0
20028964:	f2c0 8202 	blt.w	20028d6c <mbedtls_mpi_exp_mod+0x422>
20028968:	68a3      	ldr	r3, [r4, #8]
2002896a:	681f      	ldr	r7, [r3, #0]
2002896c:	f017 0301 	ands.w	r3, r7, #1
20028970:	9305      	str	r3, [sp, #20]
20028972:	f000 81fb 	beq.w	20028d6c <mbedtls_mpi_exp_mod+0x422>
20028976:	2100      	movs	r1, #0
20028978:	9803      	ldr	r0, [sp, #12]
2002897a:	f7ff fc30 	bl	200281de <mbedtls_mpi_cmp_int>
2002897e:	2800      	cmp	r0, #0
20028980:	f2c0 81f4 	blt.w	20028d6c <mbedtls_mpi_exp_mod+0x422>
20028984:	2100      	movs	r1, #0
20028986:	2301      	movs	r3, #1
20028988:	f44f 62c0 	mov.w	r2, #1536	@ 0x600
2002898c:	a814      	add	r0, sp, #80	@ 0x50
2002898e:	e9cd 3108 	strd	r3, r1, [sp, #32]
20028992:	e9cd 130a 	strd	r1, r3, [sp, #40]	@ 0x28
20028996:	e9cd 110c 	strd	r1, r1, [sp, #48]	@ 0x30
2002899a:	e9cd 310e 	strd	r3, r1, [sp, #56]	@ 0x38
2002899e:	9110      	str	r1, [sp, #64]	@ 0x40
200289a0:	f001 ff34 	bl	2002a80c <memset>
200289a4:	9803      	ldr	r0, [sp, #12]
200289a6:	f7ff fa26 	bl	20027df6 <mbedtls_mpi_bitlen>
200289aa:	f5b0 7f28 	cmp.w	r0, #672	@ 0x2a0
200289ae:	d233      	bcs.n	20028a18 <mbedtls_mpi_exp_mod+0xce>
200289b0:	28ef      	cmp	r0, #239	@ 0xef
200289b2:	d833      	bhi.n	20028a1c <mbedtls_mpi_exp_mod+0xd2>
200289b4:	284f      	cmp	r0, #79	@ 0x4f
200289b6:	d833      	bhi.n	20028a20 <mbedtls_mpi_exp_mod+0xd6>
200289b8:	9b05      	ldr	r3, [sp, #20]
200289ba:	2818      	cmp	r0, #24
200289bc:	bf34      	ite	cc
200289be:	461e      	movcc	r6, r3
200289c0:	2603      	movcs	r6, #3
200289c2:	6863      	ldr	r3, [r4, #4]
200289c4:	4628      	mov	r0, r5
200289c6:	f103 0901 	add.w	r9, r3, #1
200289ca:	4649      	mov	r1, r9
200289cc:	f7ff f98a 	bl	20027ce4 <mbedtls_mpi_grow>
200289d0:	b340      	cbz	r0, 20028a24 <mbedtls_mpi_exp_mod+0xda>
200289d2:	f06f 090f 	mvn.w	r9, #15
200289d6:	2301      	movs	r3, #1
200289d8:	1e74      	subs	r4, r6, #1
200289da:	fa03 f506 	lsl.w	r5, r3, r6
200289de:	260c      	movs	r6, #12
200289e0:	fa03 f404 	lsl.w	r4, r3, r4
200289e4:	af14      	add	r7, sp, #80	@ 0x50
200289e6:	42a5      	cmp	r5, r4
200289e8:	f200 81ba 	bhi.w	20028d60 <mbedtls_mpi_exp_mod+0x416>
200289ec:	a817      	add	r0, sp, #92	@ 0x5c
200289ee:	f7ff f964 	bl	20027cba <mbedtls_mpi_free>
200289f2:	a80b      	add	r0, sp, #44	@ 0x2c
200289f4:	f7ff f961 	bl	20027cba <mbedtls_mpi_free>
200289f8:	a80e      	add	r0, sp, #56	@ 0x38
200289fa:	f7ff f95e 	bl	20027cba <mbedtls_mpi_free>
200289fe:	f8dd 3678 	ldr.w	r3, [sp, #1656]	@ 0x678
20028a02:	b10b      	cbz	r3, 20028a08 <mbedtls_mpi_exp_mod+0xbe>
20028a04:	689b      	ldr	r3, [r3, #8]
20028a06:	b913      	cbnz	r3, 20028a0e <mbedtls_mpi_exp_mod+0xc4>
20028a08:	a808      	add	r0, sp, #32
20028a0a:	f7ff f956 	bl	20027cba <mbedtls_mpi_free>
20028a0e:	4648      	mov	r0, r9
20028a10:	f20d 6d54 	addw	sp, sp, #1620	@ 0x654
20028a14:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20028a18:	2606      	movs	r6, #6
20028a1a:	e7d2      	b.n	200289c2 <mbedtls_mpi_exp_mod+0x78>
20028a1c:	2605      	movs	r6, #5
20028a1e:	e7d0      	b.n	200289c2 <mbedtls_mpi_exp_mod+0x78>
20028a20:	2604      	movs	r6, #4
20028a22:	e7ce      	b.n	200289c2 <mbedtls_mpi_exp_mod+0x78>
20028a24:	4649      	mov	r1, r9
20028a26:	a817      	add	r0, sp, #92	@ 0x5c
20028a28:	f7ff f95c 	bl	20027ce4 <mbedtls_mpi_grow>
20028a2c:	2800      	cmp	r0, #0
20028a2e:	d1d0      	bne.n	200289d2 <mbedtls_mpi_exp_mod+0x88>
20028a30:	ea4f 0149 	mov.w	r1, r9, lsl #1
20028a34:	a80b      	add	r0, sp, #44	@ 0x2c
20028a36:	f7ff f955 	bl	20027ce4 <mbedtls_mpi_grow>
20028a3a:	2800      	cmp	r0, #0
20028a3c:	d1c9      	bne.n	200289d2 <mbedtls_mpi_exp_mod+0x88>
20028a3e:	f8d8 3000 	ldr.w	r3, [r8]
20028a42:	9304      	str	r3, [sp, #16]
20028a44:	3301      	adds	r3, #1
20028a46:	d109      	bne.n	20028a5c <mbedtls_mpi_exp_mod+0x112>
20028a48:	4641      	mov	r1, r8
20028a4a:	a80e      	add	r0, sp, #56	@ 0x38
20028a4c:	f7ff f976 	bl	20027d3c <mbedtls_mpi_copy>
20028a50:	2800      	cmp	r0, #0
20028a52:	d1be      	bne.n	200289d2 <mbedtls_mpi_exp_mod+0x88>
20028a54:	2301      	movs	r3, #1
20028a56:	f10d 0838 	add.w	r8, sp, #56	@ 0x38
20028a5a:	930e      	str	r3, [sp, #56]	@ 0x38
20028a5c:	f8dd 3678 	ldr.w	r3, [sp, #1656]	@ 0x678
20028a60:	b11b      	cbz	r3, 20028a6a <mbedtls_mpi_exp_mod+0x120>
20028a62:	689b      	ldr	r3, [r3, #8]
20028a64:	2b00      	cmp	r3, #0
20028a66:	f040 80ab 	bne.w	20028bc0 <mbedtls_mpi_exp_mod+0x276>
20028a6a:	2101      	movs	r1, #1
20028a6c:	a808      	add	r0, sp, #32
20028a6e:	f7ff f98e 	bl	20027d8e <mbedtls_mpi_lset>
20028a72:	2800      	cmp	r0, #0
20028a74:	d1ad      	bne.n	200289d2 <mbedtls_mpi_exp_mod+0x88>
20028a76:	6861      	ldr	r1, [r4, #4]
20028a78:	a808      	add	r0, sp, #32
20028a7a:	0189      	lsls	r1, r1, #6
20028a7c:	f7ff fa36 	bl	20027eec <mbedtls_mpi_shift_l>
20028a80:	2800      	cmp	r0, #0
20028a82:	d1a6      	bne.n	200289d2 <mbedtls_mpi_exp_mod+0x88>
20028a84:	a908      	add	r1, sp, #32
20028a86:	4622      	mov	r2, r4
20028a88:	4608      	mov	r0, r1
20028a8a:	f7ff ff2c 	bl	200288e6 <mbedtls_mpi_mod_mpi>
20028a8e:	4681      	mov	r9, r0
20028a90:	2800      	cmp	r0, #0
20028a92:	d1a0      	bne.n	200289d6 <mbedtls_mpi_exp_mod+0x8c>
20028a94:	f8dd 3678 	ldr.w	r3, [sp, #1656]	@ 0x678
20028a98:	b13b      	cbz	r3, 20028aaa <mbedtls_mpi_exp_mod+0x160>
20028a9a:	f8dd 2678 	ldr.w	r2, [sp, #1656]	@ 0x678
20028a9e:	ab08      	add	r3, sp, #32
20028aa0:	cb03      	ldmia	r3!, {r0, r1}
20028aa2:	6010      	str	r0, [r2, #0]
20028aa4:	6818      	ldr	r0, [r3, #0]
20028aa6:	6051      	str	r1, [r2, #4]
20028aa8:	6090      	str	r0, [r2, #8]
20028aaa:	4621      	mov	r1, r4
20028aac:	4640      	mov	r0, r8
20028aae:	f7ff fb55 	bl	2002815c <mbedtls_mpi_cmp_mpi>
20028ab2:	2800      	cmp	r0, #0
20028ab4:	f2c0 808d 	blt.w	20028bd2 <mbedtls_mpi_exp_mod+0x288>
20028ab8:	4622      	mov	r2, r4
20028aba:	4641      	mov	r1, r8
20028abc:	a817      	add	r0, sp, #92	@ 0x5c
20028abe:	f7ff ff12 	bl	200288e6 <mbedtls_mpi_mod_mpi>
20028ac2:	4681      	mov	r9, r0
20028ac4:	2800      	cmp	r0, #0
20028ac6:	d186      	bne.n	200289d6 <mbedtls_mpi_exp_mod+0x8c>
20028ac8:	1cba      	adds	r2, r7, #2
20028aca:	0052      	lsls	r2, r2, #1
20028acc:	f002 0208 	and.w	r2, r2, #8
20028ad0:	443a      	add	r2, r7
20028ad2:	fb02 f307 	mul.w	r3, r2, r7
20028ad6:	f1c3 0302 	rsb	r3, r3, #2
20028ada:	4353      	muls	r3, r2
20028adc:	fb03 f207 	mul.w	r2, r3, r7
20028ae0:	f1c2 0202 	rsb	r2, r2, #2
20028ae4:	4353      	muls	r3, r2
20028ae6:	435f      	muls	r7, r3
20028ae8:	3f02      	subs	r7, #2
20028aea:	437b      	muls	r3, r7
20028aec:	f10d 0b2c 	add.w	fp, sp, #44	@ 0x2c
20028af0:	4622      	mov	r2, r4
20028af2:	f8cd b000 	str.w	fp, [sp]
20028af6:	a908      	add	r1, sp, #32
20028af8:	a817      	add	r0, sp, #92	@ 0x5c
20028afa:	9302      	str	r3, [sp, #8]
20028afc:	f7ff fac4 	bl	20028088 <mpi_montmul>
20028b00:	2800      	cmp	r0, #0
20028b02:	f040 80e4 	bne.w	20028cce <mbedtls_mpi_exp_mod+0x384>
20028b06:	4628      	mov	r0, r5
20028b08:	a908      	add	r1, sp, #32
20028b0a:	f7ff f917 	bl	20027d3c <mbedtls_mpi_copy>
20028b0e:	2800      	cmp	r0, #0
20028b10:	f47f af5f 	bne.w	200289d2 <mbedtls_mpi_exp_mod+0x88>
20028b14:	2301      	movs	r3, #1
20028b16:	aa07      	add	r2, sp, #28
20028b18:	e9cd 3311 	strd	r3, r3, [sp, #68]	@ 0x44
20028b1c:	9307      	str	r3, [sp, #28]
20028b1e:	9213      	str	r2, [sp, #76]	@ 0x4c
20028b20:	4628      	mov	r0, r5
20028b22:	4622      	mov	r2, r4
20028b24:	9b02      	ldr	r3, [sp, #8]
20028b26:	f8cd b000 	str.w	fp, [sp]
20028b2a:	a911      	add	r1, sp, #68	@ 0x44
20028b2c:	f7ff faac 	bl	20028088 <mpi_montmul>
20028b30:	2800      	cmp	r0, #0
20028b32:	f040 80cc 	bne.w	20028cce <mbedtls_mpi_exp_mod+0x384>
20028b36:	2e01      	cmp	r6, #1
20028b38:	d153      	bne.n	20028be2 <mbedtls_mpi_exp_mod+0x298>
20028b3a:	f04f 0900 	mov.w	r9, #0
20028b3e:	464f      	mov	r7, r9
20028b40:	46ca      	mov	sl, r9
20028b42:	46c8      	mov	r8, r9
20028b44:	9b03      	ldr	r3, [sp, #12]
20028b46:	f8d3 b004 	ldr.w	fp, [r3, #4]
20028b4a:	f1ba 0f00 	cmp.w	sl, #0
20028b4e:	f040 80a1 	bne.w	20028c94 <mbedtls_mpi_exp_mod+0x34a>
20028b52:	f1bb 0f00 	cmp.w	fp, #0
20028b56:	f040 8099 	bne.w	20028c8c <mbedtls_mpi_exp_mod+0x342>
20028b5a:	f04f 0a01 	mov.w	sl, #1
20028b5e:	f10d 092c 	add.w	r9, sp, #44	@ 0x2c
20028b62:	fa0a fa06 	lsl.w	sl, sl, r6
20028b66:	45bb      	cmp	fp, r7
20028b68:	f040 80dd 	bne.w	20028d26 <mbedtls_mpi_exp_mod+0x3dc>
20028b6c:	2301      	movs	r3, #1
20028b6e:	aa07      	add	r2, sp, #28
20028b70:	e9cd 3311 	strd	r3, r3, [sp, #68]	@ 0x44
20028b74:	9307      	str	r3, [sp, #28]
20028b76:	9213      	str	r2, [sp, #76]	@ 0x4c
20028b78:	f8cd 9000 	str.w	r9, [sp]
20028b7c:	4622      	mov	r2, r4
20028b7e:	4628      	mov	r0, r5
20028b80:	9b02      	ldr	r3, [sp, #8]
20028b82:	a911      	add	r1, sp, #68	@ 0x44
20028b84:	f7ff fa80 	bl	20028088 <mpi_montmul>
20028b88:	4681      	mov	r9, r0
20028b8a:	2800      	cmp	r0, #0
20028b8c:	f040 809f 	bne.w	20028cce <mbedtls_mpi_exp_mod+0x384>
20028b90:	9b04      	ldr	r3, [sp, #16]
20028b92:	3301      	adds	r3, #1
20028b94:	f47f af1f 	bne.w	200289d6 <mbedtls_mpi_exp_mod+0x8c>
20028b98:	9b03      	ldr	r3, [sp, #12]
20028b9a:	685b      	ldr	r3, [r3, #4]
20028b9c:	2b00      	cmp	r3, #0
20028b9e:	f43f af1a 	beq.w	200289d6 <mbedtls_mpi_exp_mod+0x8c>
20028ba2:	9b03      	ldr	r3, [sp, #12]
20028ba4:	689b      	ldr	r3, [r3, #8]
20028ba6:	681b      	ldr	r3, [r3, #0]
20028ba8:	07db      	lsls	r3, r3, #31
20028baa:	f57f af14 	bpl.w	200289d6 <mbedtls_mpi_exp_mod+0x8c>
20028bae:	9b04      	ldr	r3, [sp, #16]
20028bb0:	462a      	mov	r2, r5
20028bb2:	4621      	mov	r1, r4
20028bb4:	4628      	mov	r0, r5
20028bb6:	602b      	str	r3, [r5, #0]
20028bb8:	f7ff fbbd 	bl	20028336 <mbedtls_mpi_add_mpi>
20028bbc:	4681      	mov	r9, r0
20028bbe:	e70a      	b.n	200289d6 <mbedtls_mpi_exp_mod+0x8c>
20028bc0:	f8dd 2678 	ldr.w	r2, [sp, #1656]	@ 0x678
20028bc4:	ab08      	add	r3, sp, #32
20028bc6:	6810      	ldr	r0, [r2, #0]
20028bc8:	6851      	ldr	r1, [r2, #4]
20028bca:	c303      	stmia	r3!, {r0, r1}
20028bcc:	6890      	ldr	r0, [r2, #8]
20028bce:	6018      	str	r0, [r3, #0]
20028bd0:	e76b      	b.n	20028aaa <mbedtls_mpi_exp_mod+0x160>
20028bd2:	4641      	mov	r1, r8
20028bd4:	a817      	add	r0, sp, #92	@ 0x5c
20028bd6:	f7ff f8b1 	bl	20027d3c <mbedtls_mpi_copy>
20028bda:	2800      	cmp	r0, #0
20028bdc:	f43f af74 	beq.w	20028ac8 <mbedtls_mpi_exp_mod+0x17e>
20028be0:	e6f7      	b.n	200289d2 <mbedtls_mpi_exp_mod+0x88>
20028be2:	f04f 0a0c 	mov.w	sl, #12
20028be6:	1e77      	subs	r7, r6, #1
20028be8:	6861      	ldr	r1, [r4, #4]
20028bea:	fa0a fa07 	lsl.w	sl, sl, r7
20028bee:	f10d 0950 	add.w	r9, sp, #80	@ 0x50
20028bf2:	44d1      	add	r9, sl
20028bf4:	4648      	mov	r0, r9
20028bf6:	3101      	adds	r1, #1
20028bf8:	f7ff f874 	bl	20027ce4 <mbedtls_mpi_grow>
20028bfc:	2800      	cmp	r0, #0
20028bfe:	f47f aee8 	bne.w	200289d2 <mbedtls_mpi_exp_mod+0x88>
20028c02:	4648      	mov	r0, r9
20028c04:	a917      	add	r1, sp, #92	@ 0x5c
20028c06:	f7ff f899 	bl	20027d3c <mbedtls_mpi_copy>
20028c0a:	2800      	cmp	r0, #0
20028c0c:	f47f aee1 	bne.w	200289d2 <mbedtls_mpi_exp_mod+0x88>
20028c10:	4680      	mov	r8, r0
20028c12:	4622      	mov	r2, r4
20028c14:	4649      	mov	r1, r9
20028c16:	4648      	mov	r0, r9
20028c18:	9b02      	ldr	r3, [sp, #8]
20028c1a:	f8cd b000 	str.w	fp, [sp]
20028c1e:	f7ff fa33 	bl	20028088 <mpi_montmul>
20028c22:	2800      	cmp	r0, #0
20028c24:	d153      	bne.n	20028cce <mbedtls_mpi_exp_mod+0x384>
20028c26:	f108 0801 	add.w	r8, r8, #1
20028c2a:	45b8      	cmp	r8, r7
20028c2c:	d3f1      	bcc.n	20028c12 <mbedtls_mpi_exp_mod+0x2c8>
20028c2e:	f04f 0801 	mov.w	r8, #1
20028c32:	f10d 0b50 	add.w	fp, sp, #80	@ 0x50
20028c36:	fa08 f707 	lsl.w	r7, r8, r7
20028c3a:	4447      	add	r7, r8
20028c3c:	44d3      	add	fp, sl
20028c3e:	fa08 f806 	lsl.w	r8, r8, r6
20028c42:	f10d 0a2c 	add.w	sl, sp, #44	@ 0x2c
20028c46:	45b8      	cmp	r8, r7
20028c48:	f67f af77 	bls.w	20028b3a <mbedtls_mpi_exp_mod+0x1f0>
20028c4c:	6861      	ldr	r1, [r4, #4]
20028c4e:	f10b 090c 	add.w	r9, fp, #12
20028c52:	4648      	mov	r0, r9
20028c54:	3101      	adds	r1, #1
20028c56:	f7ff f845 	bl	20027ce4 <mbedtls_mpi_grow>
20028c5a:	2800      	cmp	r0, #0
20028c5c:	f47f aeb9 	bne.w	200289d2 <mbedtls_mpi_exp_mod+0x88>
20028c60:	4659      	mov	r1, fp
20028c62:	4648      	mov	r0, r9
20028c64:	f7ff f86a 	bl	20027d3c <mbedtls_mpi_copy>
20028c68:	2800      	cmp	r0, #0
20028c6a:	f47f aeb2 	bne.w	200289d2 <mbedtls_mpi_exp_mod+0x88>
20028c6e:	4622      	mov	r2, r4
20028c70:	4648      	mov	r0, r9
20028c72:	9b02      	ldr	r3, [sp, #8]
20028c74:	f8cd a000 	str.w	sl, [sp]
20028c78:	a917      	add	r1, sp, #92	@ 0x5c
20028c7a:	f7ff fa05 	bl	20028088 <mpi_montmul>
20028c7e:	bb30      	cbnz	r0, 20028cce <mbedtls_mpi_exp_mod+0x384>
20028c80:	46cb      	mov	fp, r9
20028c82:	3701      	adds	r7, #1
20028c84:	e7df      	b.n	20028c46 <mbedtls_mpi_exp_mod+0x2fc>
20028c86:	f04f 0902 	mov.w	r9, #2
20028c8a:	e75e      	b.n	20028b4a <mbedtls_mpi_exp_mod+0x200>
20028c8c:	f04f 0a20 	mov.w	sl, #32
20028c90:	f10b 3bff 	add.w	fp, fp, #4294967295	@ 0xffffffff
20028c94:	9b03      	ldr	r3, [sp, #12]
20028c96:	f10a 3aff 	add.w	sl, sl, #4294967295	@ 0xffffffff
20028c9a:	689b      	ldr	r3, [r3, #8]
20028c9c:	f853 302b 	ldr.w	r3, [r3, fp, lsl #2]
20028ca0:	fa23 f30a 	lsr.w	r3, r3, sl
20028ca4:	f013 0301 	ands.w	r3, r3, #1
20028ca8:	d114      	bne.n	20028cd4 <mbedtls_mpi_exp_mod+0x38a>
20028caa:	f1b9 0f00 	cmp.w	r9, #0
20028cae:	f43f af4c 	beq.w	20028b4a <mbedtls_mpi_exp_mod+0x200>
20028cb2:	f1b9 0f01 	cmp.w	r9, #1
20028cb6:	d10d      	bne.n	20028cd4 <mbedtls_mpi_exp_mod+0x38a>
20028cb8:	ab0b      	add	r3, sp, #44	@ 0x2c
20028cba:	9300      	str	r3, [sp, #0]
20028cbc:	4622      	mov	r2, r4
20028cbe:	4629      	mov	r1, r5
20028cc0:	4628      	mov	r0, r5
20028cc2:	9b02      	ldr	r3, [sp, #8]
20028cc4:	f7ff f9e0 	bl	20028088 <mpi_montmul>
20028cc8:	2800      	cmp	r0, #0
20028cca:	f43f af3e 	beq.w	20028b4a <mbedtls_mpi_exp_mod+0x200>
20028cce:	f06f 0903 	mvn.w	r9, #3
20028cd2:	e680      	b.n	200289d6 <mbedtls_mpi_exp_mod+0x8c>
20028cd4:	3701      	adds	r7, #1
20028cd6:	1bf2      	subs	r2, r6, r7
20028cd8:	4093      	lsls	r3, r2
20028cda:	42be      	cmp	r6, r7
20028cdc:	ea48 0803 	orr.w	r8, r8, r3
20028ce0:	d1d1      	bne.n	20028c86 <mbedtls_mpi_exp_mod+0x33c>
20028ce2:	f04f 0900 	mov.w	r9, #0
20028ce6:	ab0b      	add	r3, sp, #44	@ 0x2c
20028ce8:	9300      	str	r3, [sp, #0]
20028cea:	4622      	mov	r2, r4
20028cec:	4629      	mov	r1, r5
20028cee:	4628      	mov	r0, r5
20028cf0:	9b02      	ldr	r3, [sp, #8]
20028cf2:	f7ff f9c9 	bl	20028088 <mpi_montmul>
20028cf6:	2800      	cmp	r0, #0
20028cf8:	d1e9      	bne.n	20028cce <mbedtls_mpi_exp_mod+0x384>
20028cfa:	f109 0901 	add.w	r9, r9, #1
20028cfe:	454f      	cmp	r7, r9
20028d00:	d8f1      	bhi.n	20028ce6 <mbedtls_mpi_exp_mod+0x39c>
20028d02:	200c      	movs	r0, #12
20028d04:	ab0b      	add	r3, sp, #44	@ 0x2c
20028d06:	a914      	add	r1, sp, #80	@ 0x50
20028d08:	fb00 1108 	mla	r1, r0, r8, r1
20028d0c:	9300      	str	r3, [sp, #0]
20028d0e:	4622      	mov	r2, r4
20028d10:	4628      	mov	r0, r5
20028d12:	9b02      	ldr	r3, [sp, #8]
20028d14:	f7ff f9b8 	bl	20028088 <mpi_montmul>
20028d18:	4607      	mov	r7, r0
20028d1a:	2800      	cmp	r0, #0
20028d1c:	d1d7      	bne.n	20028cce <mbedtls_mpi_exp_mod+0x384>
20028d1e:	4680      	mov	r8, r0
20028d20:	f8dd 9014 	ldr.w	r9, [sp, #20]
20028d24:	e711      	b.n	20028b4a <mbedtls_mpi_exp_mod+0x200>
20028d26:	4622      	mov	r2, r4
20028d28:	4629      	mov	r1, r5
20028d2a:	4628      	mov	r0, r5
20028d2c:	9b02      	ldr	r3, [sp, #8]
20028d2e:	f8cd 9000 	str.w	r9, [sp]
20028d32:	f7ff f9a9 	bl	20028088 <mpi_montmul>
20028d36:	2800      	cmp	r0, #0
20028d38:	d1c9      	bne.n	20028cce <mbedtls_mpi_exp_mod+0x384>
20028d3a:	ea4f 0848 	mov.w	r8, r8, lsl #1
20028d3e:	ea18 0f0a 	tst.w	r8, sl
20028d42:	d102      	bne.n	20028d4a <mbedtls_mpi_exp_mod+0x400>
20028d44:	f10b 0b01 	add.w	fp, fp, #1
20028d48:	e70d      	b.n	20028b66 <mbedtls_mpi_exp_mod+0x21c>
20028d4a:	4622      	mov	r2, r4
20028d4c:	4628      	mov	r0, r5
20028d4e:	9b02      	ldr	r3, [sp, #8]
20028d50:	f8cd 9000 	str.w	r9, [sp]
20028d54:	a917      	add	r1, sp, #92	@ 0x5c
20028d56:	f7ff f997 	bl	20028088 <mpi_montmul>
20028d5a:	2800      	cmp	r0, #0
20028d5c:	d0f2      	beq.n	20028d44 <mbedtls_mpi_exp_mod+0x3fa>
20028d5e:	e7b6      	b.n	20028cce <mbedtls_mpi_exp_mod+0x384>
20028d60:	fb06 7004 	mla	r0, r6, r4, r7
20028d64:	f7fe ffa9 	bl	20027cba <mbedtls_mpi_free>
20028d68:	3401      	adds	r4, #1
20028d6a:	e63c      	b.n	200289e6 <mbedtls_mpi_exp_mod+0x9c>
20028d6c:	f06f 0903 	mvn.w	r9, #3
20028d70:	e64d      	b.n	20028a0e <mbedtls_mpi_exp_mod+0xc4>

20028d72 <mbedtls_mpi_gcd>:
20028d72:	b570      	push	{r4, r5, r6, lr}
20028d74:	2300      	movs	r3, #0
20028d76:	2401      	movs	r4, #1
20028d78:	b086      	sub	sp, #24
20028d7a:	4606      	mov	r6, r0
20028d7c:	4668      	mov	r0, sp
20028d7e:	4615      	mov	r5, r2
20028d80:	e9cd 4300 	strd	r4, r3, [sp]
20028d84:	e9cd 3402 	strd	r3, r4, [sp, #8]
20028d88:	e9cd 3304 	strd	r3, r3, [sp, #16]
20028d8c:	f7fe ffd6 	bl	20027d3c <mbedtls_mpi_copy>
20028d90:	b150      	cbz	r0, 20028da8 <mbedtls_mpi_gcd+0x36>
20028d92:	f06f 040f 	mvn.w	r4, #15
20028d96:	4668      	mov	r0, sp
20028d98:	f7fe ff8f 	bl	20027cba <mbedtls_mpi_free>
20028d9c:	a803      	add	r0, sp, #12
20028d9e:	f7fe ff8c 	bl	20027cba <mbedtls_mpi_free>
20028da2:	4620      	mov	r0, r4
20028da4:	b006      	add	sp, #24
20028da6:	bd70      	pop	{r4, r5, r6, pc}
20028da8:	4629      	mov	r1, r5
20028daa:	a803      	add	r0, sp, #12
20028dac:	f7fe ffc6 	bl	20027d3c <mbedtls_mpi_copy>
20028db0:	2800      	cmp	r0, #0
20028db2:	d1ee      	bne.n	20028d92 <mbedtls_mpi_gcd+0x20>
20028db4:	4668      	mov	r0, sp
20028db6:	f7ff f806 	bl	20027dc6 <mbedtls_mpi_lsb>
20028dba:	4605      	mov	r5, r0
20028dbc:	a803      	add	r0, sp, #12
20028dbe:	f7ff f802 	bl	20027dc6 <mbedtls_mpi_lsb>
20028dc2:	4285      	cmp	r5, r0
20028dc4:	bf28      	it	cs
20028dc6:	4605      	movcs	r5, r0
20028dc8:	4668      	mov	r0, sp
20028dca:	4629      	mov	r1, r5
20028dcc:	f7ff f8e7 	bl	20027f9e <mbedtls_mpi_shift_r>
20028dd0:	2800      	cmp	r0, #0
20028dd2:	d1de      	bne.n	20028d92 <mbedtls_mpi_gcd+0x20>
20028dd4:	4629      	mov	r1, r5
20028dd6:	a803      	add	r0, sp, #12
20028dd8:	f7ff f8e1 	bl	20027f9e <mbedtls_mpi_shift_r>
20028ddc:	2800      	cmp	r0, #0
20028dde:	d1d8      	bne.n	20028d92 <mbedtls_mpi_gcd+0x20>
20028de0:	9403      	str	r4, [sp, #12]
20028de2:	9400      	str	r4, [sp, #0]
20028de4:	2100      	movs	r1, #0
20028de6:	4668      	mov	r0, sp
20028de8:	f7ff f9f9 	bl	200281de <mbedtls_mpi_cmp_int>
20028dec:	b968      	cbnz	r0, 20028e0a <mbedtls_mpi_gcd+0x98>
20028dee:	4629      	mov	r1, r5
20028df0:	a803      	add	r0, sp, #12
20028df2:	f7ff f87b 	bl	20027eec <mbedtls_mpi_shift_l>
20028df6:	2800      	cmp	r0, #0
20028df8:	d1cb      	bne.n	20028d92 <mbedtls_mpi_gcd+0x20>
20028dfa:	4630      	mov	r0, r6
20028dfc:	a903      	add	r1, sp, #12
20028dfe:	f7fe ff9d 	bl	20027d3c <mbedtls_mpi_copy>
20028e02:	4604      	mov	r4, r0
20028e04:	2800      	cmp	r0, #0
20028e06:	d0c6      	beq.n	20028d96 <mbedtls_mpi_gcd+0x24>
20028e08:	e7c3      	b.n	20028d92 <mbedtls_mpi_gcd+0x20>
20028e0a:	4668      	mov	r0, sp
20028e0c:	f7fe ffdb 	bl	20027dc6 <mbedtls_mpi_lsb>
20028e10:	4601      	mov	r1, r0
20028e12:	4668      	mov	r0, sp
20028e14:	f7ff f8c3 	bl	20027f9e <mbedtls_mpi_shift_r>
20028e18:	2800      	cmp	r0, #0
20028e1a:	d1ba      	bne.n	20028d92 <mbedtls_mpi_gcd+0x20>
20028e1c:	a803      	add	r0, sp, #12
20028e1e:	f7fe ffd2 	bl	20027dc6 <mbedtls_mpi_lsb>
20028e22:	4601      	mov	r1, r0
20028e24:	a803      	add	r0, sp, #12
20028e26:	f7ff f8ba 	bl	20027f9e <mbedtls_mpi_shift_r>
20028e2a:	2800      	cmp	r0, #0
20028e2c:	d1b1      	bne.n	20028d92 <mbedtls_mpi_gcd+0x20>
20028e2e:	4668      	mov	r0, sp
20028e30:	a903      	add	r1, sp, #12
20028e32:	f7ff f993 	bl	2002815c <mbedtls_mpi_cmp_mpi>
20028e36:	2800      	cmp	r0, #0
20028e38:	db0e      	blt.n	20028e58 <mbedtls_mpi_gcd+0xe6>
20028e3a:	4669      	mov	r1, sp
20028e3c:	4668      	mov	r0, sp
20028e3e:	aa03      	add	r2, sp, #12
20028e40:	f7ff fa3c 	bl	200282bc <mbedtls_mpi_sub_abs>
20028e44:	4604      	mov	r4, r0
20028e46:	2800      	cmp	r0, #0
20028e48:	d1a5      	bne.n	20028d96 <mbedtls_mpi_gcd+0x24>
20028e4a:	2101      	movs	r1, #1
20028e4c:	4668      	mov	r0, sp
20028e4e:	f7ff f8a6 	bl	20027f9e <mbedtls_mpi_shift_r>
20028e52:	2800      	cmp	r0, #0
20028e54:	d0c6      	beq.n	20028de4 <mbedtls_mpi_gcd+0x72>
20028e56:	e79c      	b.n	20028d92 <mbedtls_mpi_gcd+0x20>
20028e58:	a903      	add	r1, sp, #12
20028e5a:	466a      	mov	r2, sp
20028e5c:	4608      	mov	r0, r1
20028e5e:	f7ff fa2d 	bl	200282bc <mbedtls_mpi_sub_abs>
20028e62:	4604      	mov	r4, r0
20028e64:	2800      	cmp	r0, #0
20028e66:	d196      	bne.n	20028d96 <mbedtls_mpi_gcd+0x24>
20028e68:	2101      	movs	r1, #1
20028e6a:	a803      	add	r0, sp, #12
20028e6c:	e7ef      	b.n	20028e4e <mbedtls_mpi_gcd+0xdc>

20028e6e <mbedtls_mpi_fill_random>:
20028e6e:	b570      	push	{r4, r5, r6, lr}
20028e70:	f5b1 6f80 	cmp.w	r1, #1024	@ 0x400
20028e74:	4605      	mov	r5, r0
20028e76:	460c      	mov	r4, r1
20028e78:	4616      	mov	r6, r2
20028e7a:	4618      	mov	r0, r3
20028e7c:	f5ad 6d80 	sub.w	sp, sp, #1024	@ 0x400
20028e80:	d80f      	bhi.n	20028ea2 <mbedtls_mpi_fill_random+0x34>
20028e82:	460a      	mov	r2, r1
20028e84:	4669      	mov	r1, sp
20028e86:	47b0      	blx	r6
20028e88:	b940      	cbnz	r0, 20028e9c <mbedtls_mpi_fill_random+0x2e>
20028e8a:	4622      	mov	r2, r4
20028e8c:	4669      	mov	r1, sp
20028e8e:	4628      	mov	r0, r5
20028e90:	f7fe ffd4 	bl	20027e3c <mbedtls_mpi_read_binary>
20028e94:	2800      	cmp	r0, #0
20028e96:	bf18      	it	ne
20028e98:	f06f 000f 	mvnne.w	r0, #15
20028e9c:	f50d 6d80 	add.w	sp, sp, #1024	@ 0x400
20028ea0:	bd70      	pop	{r4, r5, r6, pc}
20028ea2:	f06f 0003 	mvn.w	r0, #3
20028ea6:	e7f9      	b.n	20028e9c <mbedtls_mpi_fill_random+0x2e>

20028ea8 <mbedtls_mpi_inv_mod>:
20028ea8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20028eac:	b09f      	sub	sp, #124	@ 0x7c
20028eae:	9001      	str	r0, [sp, #4]
20028eb0:	460f      	mov	r7, r1
20028eb2:	4610      	mov	r0, r2
20028eb4:	2101      	movs	r1, #1
20028eb6:	4692      	mov	sl, r2
20028eb8:	f7ff f991 	bl	200281de <mbedtls_mpi_cmp_int>
20028ebc:	2800      	cmp	r0, #0
20028ebe:	f340 81b5 	ble.w	2002922c <mbedtls_mpi_inv_mod+0x384>
20028ec2:	2500      	movs	r5, #0
20028ec4:	2601      	movs	r6, #1
20028ec6:	4652      	mov	r2, sl
20028ec8:	4639      	mov	r1, r7
20028eca:	a803      	add	r0, sp, #12
20028ecc:	e9cd 6506 	strd	r6, r5, [sp, #24]
20028ed0:	e9cd 5608 	strd	r5, r6, [sp, #32]
20028ed4:	e9cd 650c 	strd	r6, r5, [sp, #48]	@ 0x30
20028ed8:	e9cd 650f 	strd	r6, r5, [sp, #60]	@ 0x3c
20028edc:	e9cd 6503 	strd	r6, r5, [sp, #12]
20028ee0:	e9cd 6512 	strd	r6, r5, [sp, #72]	@ 0x48
20028ee4:	e9cd 5614 	strd	r5, r6, [sp, #80]	@ 0x50
20028ee8:	e9cd 6518 	strd	r6, r5, [sp, #96]	@ 0x60
20028eec:	e9cd 651b 	strd	r6, r5, [sp, #108]	@ 0x6c
20028ef0:	950a      	str	r5, [sp, #40]	@ 0x28
20028ef2:	9505      	str	r5, [sp, #20]
20028ef4:	9516      	str	r5, [sp, #88]	@ 0x58
20028ef6:	f7ff ff3c 	bl	20028d72 <mbedtls_mpi_gcd>
20028efa:	4604      	mov	r4, r0
20028efc:	2800      	cmp	r0, #0
20028efe:	f040 8182 	bne.w	20029206 <mbedtls_mpi_inv_mod+0x35e>
20028f02:	4631      	mov	r1, r6
20028f04:	a803      	add	r0, sp, #12
20028f06:	f7ff f96a 	bl	200281de <mbedtls_mpi_cmp_int>
20028f0a:	4605      	mov	r5, r0
20028f0c:	2800      	cmp	r0, #0
20028f0e:	f040 8171 	bne.w	200291f4 <mbedtls_mpi_inv_mod+0x34c>
20028f12:	4652      	mov	r2, sl
20028f14:	4639      	mov	r1, r7
20028f16:	a806      	add	r0, sp, #24
20028f18:	f7ff fce5 	bl	200288e6 <mbedtls_mpi_mod_mpi>
20028f1c:	4604      	mov	r4, r0
20028f1e:	2800      	cmp	r0, #0
20028f20:	f040 8171 	bne.w	20029206 <mbedtls_mpi_inv_mod+0x35e>
20028f24:	900b      	str	r0, [sp, #44]	@ 0x2c
20028f26:	a906      	add	r1, sp, #24
20028f28:	a809      	add	r0, sp, #36	@ 0x24
20028f2a:	f7fe ff07 	bl	20027d3c <mbedtls_mpi_copy>
20028f2e:	f8dd 902c 	ldr.w	r9, [sp, #44]	@ 0x2c
20028f32:	b920      	cbnz	r0, 20028f3e <mbedtls_mpi_inv_mod+0x96>
20028f34:	4651      	mov	r1, sl
20028f36:	a812      	add	r0, sp, #72	@ 0x48
20028f38:	f7fe ff00 	bl	20027d3c <mbedtls_mpi_copy>
20028f3c:	b130      	cbz	r0, 20028f4c <mbedtls_mpi_inv_mod+0xa4>
20028f3e:	f04f 0b00 	mov.w	fp, #0
20028f42:	465d      	mov	r5, fp
20028f44:	46d8      	mov	r8, fp
20028f46:	465e      	mov	r6, fp
20028f48:	465f      	mov	r7, fp
20028f4a:	e0f5      	b.n	20029138 <mbedtls_mpi_inv_mod+0x290>
20028f4c:	9017      	str	r0, [sp, #92]	@ 0x5c
20028f4e:	4651      	mov	r1, sl
20028f50:	a815      	add	r0, sp, #84	@ 0x54
20028f52:	f7fe fef3 	bl	20027d3c <mbedtls_mpi_copy>
20028f56:	f8dd 805c 	ldr.w	r8, [sp, #92]	@ 0x5c
20028f5a:	2800      	cmp	r0, #0
20028f5c:	f040 8159 	bne.w	20029212 <mbedtls_mpi_inv_mod+0x36a>
20028f60:	4631      	mov	r1, r6
20028f62:	900e      	str	r0, [sp, #56]	@ 0x38
20028f64:	a80c      	add	r0, sp, #48	@ 0x30
20028f66:	f7fe ff12 	bl	20027d8e <mbedtls_mpi_lset>
20028f6a:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
20028f6c:	4601      	mov	r1, r0
20028f6e:	2800      	cmp	r0, #0
20028f70:	f040 8152 	bne.w	20029218 <mbedtls_mpi_inv_mod+0x370>
20028f74:	9011      	str	r0, [sp, #68]	@ 0x44
20028f76:	a80f      	add	r0, sp, #60	@ 0x3c
20028f78:	f7fe ff09 	bl	20027d8e <mbedtls_mpi_lset>
20028f7c:	9e11      	ldr	r6, [sp, #68]	@ 0x44
20028f7e:	4683      	mov	fp, r0
20028f80:	2800      	cmp	r0, #0
20028f82:	f040 814d 	bne.w	20029220 <mbedtls_mpi_inv_mod+0x378>
20028f86:	4601      	mov	r1, r0
20028f88:	901a      	str	r0, [sp, #104]	@ 0x68
20028f8a:	a818      	add	r0, sp, #96	@ 0x60
20028f8c:	f7fe feff 	bl	20027d8e <mbedtls_mpi_lset>
20028f90:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20028f92:	2800      	cmp	r0, #0
20028f94:	f040 8147 	bne.w	20029226 <mbedtls_mpi_inv_mod+0x37e>
20028f98:	2101      	movs	r1, #1
20028f9a:	a81b      	add	r0, sp, #108	@ 0x6c
20028f9c:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
20028fa0:	f7fe fef5 	bl	20027d8e <mbedtls_mpi_lset>
20028fa4:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
20028fa8:	2800      	cmp	r0, #0
20028faa:	f040 80c5 	bne.w	20029138 <mbedtls_mpi_inv_mod+0x290>
20028fae:	f8d9 2000 	ldr.w	r2, [r9]
20028fb2:	07d0      	lsls	r0, r2, #31
20028fb4:	d554      	bpl.n	20029060 <mbedtls_mpi_inv_mod+0x1b8>
20028fb6:	f8d8 2000 	ldr.w	r2, [r8]
20028fba:	07d3      	lsls	r3, r2, #31
20028fbc:	f140 8083 	bpl.w	200290c6 <mbedtls_mpi_inv_mod+0x21e>
20028fc0:	a915      	add	r1, sp, #84	@ 0x54
20028fc2:	a809      	add	r0, sp, #36	@ 0x24
20028fc4:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
20028fc8:	f8cd 805c 	str.w	r8, [sp, #92]	@ 0x5c
20028fcc:	f7ff f8c6 	bl	2002815c <mbedtls_mpi_cmp_mpi>
20028fd0:	2800      	cmp	r0, #0
20028fd2:	f2c0 80b4 	blt.w	2002913e <mbedtls_mpi_inv_mod+0x296>
20028fd6:	a909      	add	r1, sp, #36	@ 0x24
20028fd8:	4608      	mov	r0, r1
20028fda:	aa15      	add	r2, sp, #84	@ 0x54
20028fdc:	f7ff f9d1 	bl	20028382 <mbedtls_mpi_sub_mpi>
20028fe0:	f8dd 902c 	ldr.w	r9, [sp, #44]	@ 0x2c
20028fe4:	4604      	mov	r4, r0
20028fe6:	2800      	cmp	r0, #0
20028fe8:	f040 80d1 	bne.w	2002918e <mbedtls_mpi_inv_mod+0x2e6>
20028fec:	a90c      	add	r1, sp, #48	@ 0x30
20028fee:	4608      	mov	r0, r1
20028ff0:	aa18      	add	r2, sp, #96	@ 0x60
20028ff2:	970e      	str	r7, [sp, #56]	@ 0x38
20028ff4:	951a      	str	r5, [sp, #104]	@ 0x68
20028ff6:	f7ff f9c4 	bl	20028382 <mbedtls_mpi_sub_mpi>
20028ffa:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
20028ffc:	4604      	mov	r4, r0
20028ffe:	2800      	cmp	r0, #0
20029000:	f040 80c5 	bne.w	2002918e <mbedtls_mpi_inv_mod+0x2e6>
20029004:	a90f      	add	r1, sp, #60	@ 0x3c
20029006:	4608      	mov	r0, r1
20029008:	aa1b      	add	r2, sp, #108	@ 0x6c
2002900a:	9611      	str	r6, [sp, #68]	@ 0x44
2002900c:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
20029010:	f7ff f9b7 	bl	20028382 <mbedtls_mpi_sub_mpi>
20029014:	9e11      	ldr	r6, [sp, #68]	@ 0x44
20029016:	4604      	mov	r4, r0
20029018:	2800      	cmp	r0, #0
2002901a:	f040 80b8 	bne.w	2002918e <mbedtls_mpi_inv_mod+0x2e6>
2002901e:	2100      	movs	r1, #0
20029020:	a809      	add	r0, sp, #36	@ 0x24
20029022:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
20029026:	f7ff f8da 	bl	200281de <mbedtls_mpi_cmp_int>
2002902a:	2800      	cmp	r0, #0
2002902c:	d1bf      	bne.n	20028fae <mbedtls_mpi_inv_mod+0x106>
2002902e:	2100      	movs	r1, #0
20029030:	a818      	add	r0, sp, #96	@ 0x60
20029032:	951a      	str	r5, [sp, #104]	@ 0x68
20029034:	f7ff f8d3 	bl	200281de <mbedtls_mpi_cmp_int>
20029038:	2800      	cmp	r0, #0
2002903a:	f2c0 809e 	blt.w	2002917a <mbedtls_mpi_inv_mod+0x2d2>
2002903e:	4651      	mov	r1, sl
20029040:	a818      	add	r0, sp, #96	@ 0x60
20029042:	951a      	str	r5, [sp, #104]	@ 0x68
20029044:	f7ff f88a 	bl	2002815c <mbedtls_mpi_cmp_mpi>
20029048:	2800      	cmp	r0, #0
2002904a:	f280 80c8 	bge.w	200291de <mbedtls_mpi_inv_mod+0x336>
2002904e:	9801      	ldr	r0, [sp, #4]
20029050:	a918      	add	r1, sp, #96	@ 0x60
20029052:	f7fe fe73 	bl	20027d3c <mbedtls_mpi_copy>
20029056:	1e04      	subs	r4, r0, #0
20029058:	bf18      	it	ne
2002905a:	f06f 040f 	mvnne.w	r4, #15
2002905e:	e096      	b.n	2002918e <mbedtls_mpi_inv_mod+0x2e6>
20029060:	2101      	movs	r1, #1
20029062:	a809      	add	r0, sp, #36	@ 0x24
20029064:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
20029068:	f7fe ff99 	bl	20027f9e <mbedtls_mpi_shift_r>
2002906c:	f8dd 902c 	ldr.w	r9, [sp, #44]	@ 0x2c
20029070:	2800      	cmp	r0, #0
20029072:	d161      	bne.n	20029138 <mbedtls_mpi_inv_mod+0x290>
20029074:	683a      	ldr	r2, [r7, #0]
20029076:	07d3      	lsls	r3, r2, #31
20029078:	d402      	bmi.n	20029080 <mbedtls_mpi_inv_mod+0x1d8>
2002907a:	6832      	ldr	r2, [r6, #0]
2002907c:	07d4      	lsls	r4, r2, #31
2002907e:	d513      	bpl.n	200290a8 <mbedtls_mpi_inv_mod+0x200>
20029080:	a90c      	add	r1, sp, #48	@ 0x30
20029082:	4608      	mov	r0, r1
20029084:	aa12      	add	r2, sp, #72	@ 0x48
20029086:	970e      	str	r7, [sp, #56]	@ 0x38
20029088:	f7ff f955 	bl	20028336 <mbedtls_mpi_add_mpi>
2002908c:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
2002908e:	4604      	mov	r4, r0
20029090:	2800      	cmp	r0, #0
20029092:	d17c      	bne.n	2002918e <mbedtls_mpi_inv_mod+0x2e6>
20029094:	a90f      	add	r1, sp, #60	@ 0x3c
20029096:	4608      	mov	r0, r1
20029098:	aa06      	add	r2, sp, #24
2002909a:	9611      	str	r6, [sp, #68]	@ 0x44
2002909c:	f7ff f971 	bl	20028382 <mbedtls_mpi_sub_mpi>
200290a0:	9e11      	ldr	r6, [sp, #68]	@ 0x44
200290a2:	4604      	mov	r4, r0
200290a4:	2800      	cmp	r0, #0
200290a6:	d172      	bne.n	2002918e <mbedtls_mpi_inv_mod+0x2e6>
200290a8:	2101      	movs	r1, #1
200290aa:	a80c      	add	r0, sp, #48	@ 0x30
200290ac:	970e      	str	r7, [sp, #56]	@ 0x38
200290ae:	f7fe ff76 	bl	20027f9e <mbedtls_mpi_shift_r>
200290b2:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
200290b4:	2800      	cmp	r0, #0
200290b6:	d13f      	bne.n	20029138 <mbedtls_mpi_inv_mod+0x290>
200290b8:	2101      	movs	r1, #1
200290ba:	a80f      	add	r0, sp, #60	@ 0x3c
200290bc:	9611      	str	r6, [sp, #68]	@ 0x44
200290be:	f7fe ff6e 	bl	20027f9e <mbedtls_mpi_shift_r>
200290c2:	9e11      	ldr	r6, [sp, #68]	@ 0x44
200290c4:	e770      	b.n	20028fa8 <mbedtls_mpi_inv_mod+0x100>
200290c6:	2101      	movs	r1, #1
200290c8:	a815      	add	r0, sp, #84	@ 0x54
200290ca:	f8cd 805c 	str.w	r8, [sp, #92]	@ 0x5c
200290ce:	f7fe ff66 	bl	20027f9e <mbedtls_mpi_shift_r>
200290d2:	f8dd 805c 	ldr.w	r8, [sp, #92]	@ 0x5c
200290d6:	2800      	cmp	r0, #0
200290d8:	d12e      	bne.n	20029138 <mbedtls_mpi_inv_mod+0x290>
200290da:	682a      	ldr	r2, [r5, #0]
200290dc:	07d1      	lsls	r1, r2, #31
200290de:	d403      	bmi.n	200290e8 <mbedtls_mpi_inv_mod+0x240>
200290e0:	f8db 2000 	ldr.w	r2, [fp]
200290e4:	07d2      	lsls	r2, r2, #31
200290e6:	d515      	bpl.n	20029114 <mbedtls_mpi_inv_mod+0x26c>
200290e8:	a918      	add	r1, sp, #96	@ 0x60
200290ea:	4608      	mov	r0, r1
200290ec:	aa12      	add	r2, sp, #72	@ 0x48
200290ee:	951a      	str	r5, [sp, #104]	@ 0x68
200290f0:	f7ff f921 	bl	20028336 <mbedtls_mpi_add_mpi>
200290f4:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200290f6:	4604      	mov	r4, r0
200290f8:	2800      	cmp	r0, #0
200290fa:	d148      	bne.n	2002918e <mbedtls_mpi_inv_mod+0x2e6>
200290fc:	a91b      	add	r1, sp, #108	@ 0x6c
200290fe:	4608      	mov	r0, r1
20029100:	aa06      	add	r2, sp, #24
20029102:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
20029106:	f7ff f93c 	bl	20028382 <mbedtls_mpi_sub_mpi>
2002910a:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
2002910e:	4604      	mov	r4, r0
20029110:	2800      	cmp	r0, #0
20029112:	d13c      	bne.n	2002918e <mbedtls_mpi_inv_mod+0x2e6>
20029114:	2101      	movs	r1, #1
20029116:	a818      	add	r0, sp, #96	@ 0x60
20029118:	951a      	str	r5, [sp, #104]	@ 0x68
2002911a:	f7fe ff40 	bl	20027f9e <mbedtls_mpi_shift_r>
2002911e:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20029120:	b950      	cbnz	r0, 20029138 <mbedtls_mpi_inv_mod+0x290>
20029122:	2101      	movs	r1, #1
20029124:	a81b      	add	r0, sp, #108	@ 0x6c
20029126:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
2002912a:	f7fe ff38 	bl	20027f9e <mbedtls_mpi_shift_r>
2002912e:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
20029132:	2800      	cmp	r0, #0
20029134:	f43f af3f 	beq.w	20028fb6 <mbedtls_mpi_inv_mod+0x10e>
20029138:	f06f 040f 	mvn.w	r4, #15
2002913c:	e027      	b.n	2002918e <mbedtls_mpi_inv_mod+0x2e6>
2002913e:	a915      	add	r1, sp, #84	@ 0x54
20029140:	4608      	mov	r0, r1
20029142:	aa09      	add	r2, sp, #36	@ 0x24
20029144:	f7ff f91d 	bl	20028382 <mbedtls_mpi_sub_mpi>
20029148:	f8dd 805c 	ldr.w	r8, [sp, #92]	@ 0x5c
2002914c:	4604      	mov	r4, r0
2002914e:	b9f0      	cbnz	r0, 2002918e <mbedtls_mpi_inv_mod+0x2e6>
20029150:	a918      	add	r1, sp, #96	@ 0x60
20029152:	4608      	mov	r0, r1
20029154:	aa0c      	add	r2, sp, #48	@ 0x30
20029156:	951a      	str	r5, [sp, #104]	@ 0x68
20029158:	970e      	str	r7, [sp, #56]	@ 0x38
2002915a:	f7ff f912 	bl	20028382 <mbedtls_mpi_sub_mpi>
2002915e:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20029160:	4604      	mov	r4, r0
20029162:	b9a0      	cbnz	r0, 2002918e <mbedtls_mpi_inv_mod+0x2e6>
20029164:	a91b      	add	r1, sp, #108	@ 0x6c
20029166:	4608      	mov	r0, r1
20029168:	aa0f      	add	r2, sp, #60	@ 0x3c
2002916a:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
2002916e:	9611      	str	r6, [sp, #68]	@ 0x44
20029170:	f7ff f907 	bl	20028382 <mbedtls_mpi_sub_mpi>
20029174:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
20029178:	e74d      	b.n	20029016 <mbedtls_mpi_inv_mod+0x16e>
2002917a:	a918      	add	r1, sp, #96	@ 0x60
2002917c:	4652      	mov	r2, sl
2002917e:	4608      	mov	r0, r1
20029180:	f7ff f8d9 	bl	20028336 <mbedtls_mpi_add_mpi>
20029184:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20029186:	4604      	mov	r4, r0
20029188:	2800      	cmp	r0, #0
2002918a:	f43f af50 	beq.w	2002902e <mbedtls_mpi_inv_mod+0x186>
2002918e:	a806      	add	r0, sp, #24
20029190:	f7fe fd93 	bl	20027cba <mbedtls_mpi_free>
20029194:	a809      	add	r0, sp, #36	@ 0x24
20029196:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
2002919a:	f7fe fd8e 	bl	20027cba <mbedtls_mpi_free>
2002919e:	a80c      	add	r0, sp, #48	@ 0x30
200291a0:	970e      	str	r7, [sp, #56]	@ 0x38
200291a2:	f7fe fd8a 	bl	20027cba <mbedtls_mpi_free>
200291a6:	a80f      	add	r0, sp, #60	@ 0x3c
200291a8:	9611      	str	r6, [sp, #68]	@ 0x44
200291aa:	f7fe fd86 	bl	20027cba <mbedtls_mpi_free>
200291ae:	a803      	add	r0, sp, #12
200291b0:	f7fe fd83 	bl	20027cba <mbedtls_mpi_free>
200291b4:	a812      	add	r0, sp, #72	@ 0x48
200291b6:	f7fe fd80 	bl	20027cba <mbedtls_mpi_free>
200291ba:	a815      	add	r0, sp, #84	@ 0x54
200291bc:	f8cd 805c 	str.w	r8, [sp, #92]	@ 0x5c
200291c0:	f7fe fd7b 	bl	20027cba <mbedtls_mpi_free>
200291c4:	a818      	add	r0, sp, #96	@ 0x60
200291c6:	951a      	str	r5, [sp, #104]	@ 0x68
200291c8:	f7fe fd77 	bl	20027cba <mbedtls_mpi_free>
200291cc:	a81b      	add	r0, sp, #108	@ 0x6c
200291ce:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
200291d2:	f7fe fd72 	bl	20027cba <mbedtls_mpi_free>
200291d6:	4620      	mov	r0, r4
200291d8:	b01f      	add	sp, #124	@ 0x7c
200291da:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200291de:	a918      	add	r1, sp, #96	@ 0x60
200291e0:	4652      	mov	r2, sl
200291e2:	4608      	mov	r0, r1
200291e4:	f7ff f8cd 	bl	20028382 <mbedtls_mpi_sub_mpi>
200291e8:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200291ea:	4604      	mov	r4, r0
200291ec:	2800      	cmp	r0, #0
200291ee:	f43f af26 	beq.w	2002903e <mbedtls_mpi_inv_mod+0x196>
200291f2:	e7cc      	b.n	2002918e <mbedtls_mpi_inv_mod+0x2e6>
200291f4:	46a3      	mov	fp, r4
200291f6:	4625      	mov	r5, r4
200291f8:	46a0      	mov	r8, r4
200291fa:	4626      	mov	r6, r4
200291fc:	4627      	mov	r7, r4
200291fe:	46a1      	mov	r9, r4
20029200:	f06f 040d 	mvn.w	r4, #13
20029204:	e7c3      	b.n	2002918e <mbedtls_mpi_inv_mod+0x2e6>
20029206:	46ab      	mov	fp, r5
20029208:	46a8      	mov	r8, r5
2002920a:	462e      	mov	r6, r5
2002920c:	462f      	mov	r7, r5
2002920e:	46a9      	mov	r9, r5
20029210:	e7bd      	b.n	2002918e <mbedtls_mpi_inv_mod+0x2e6>
20029212:	46a3      	mov	fp, r4
20029214:	4625      	mov	r5, r4
20029216:	e696      	b.n	20028f46 <mbedtls_mpi_inv_mod+0x9e>
20029218:	46a3      	mov	fp, r4
2002921a:	4625      	mov	r5, r4
2002921c:	4626      	mov	r6, r4
2002921e:	e78b      	b.n	20029138 <mbedtls_mpi_inv_mod+0x290>
20029220:	46a3      	mov	fp, r4
20029222:	4625      	mov	r5, r4
20029224:	e788      	b.n	20029138 <mbedtls_mpi_inv_mod+0x290>
20029226:	f04f 0b00 	mov.w	fp, #0
2002922a:	e785      	b.n	20029138 <mbedtls_mpi_inv_mod+0x290>
2002922c:	f06f 0403 	mvn.w	r4, #3
20029230:	e7d1      	b.n	200291d6 <mbedtls_mpi_inv_mod+0x32e>
	...

20029234 <mbedtls_oid_get_pk_alg>:
20029234:	b570      	push	{r4, r5, r6, lr}
20029236:	460e      	mov	r6, r1
20029238:	4605      	mov	r5, r0
2002923a:	b110      	cbz	r0, 20029242 <mbedtls_oid_get_pk_alg+0xe>
2002923c:	4c09      	ldr	r4, [pc, #36]	@ (20029264 <mbedtls_oid_get_pk_alg+0x30>)
2002923e:	6820      	ldr	r0, [r4, #0]
20029240:	b910      	cbnz	r0, 20029248 <mbedtls_oid_get_pk_alg+0x14>
20029242:	f06f 002d 	mvn.w	r0, #45	@ 0x2d
20029246:	bd70      	pop	{r4, r5, r6, pc}
20029248:	686b      	ldr	r3, [r5, #4]
2002924a:	6862      	ldr	r2, [r4, #4]
2002924c:	429a      	cmp	r2, r3
2002924e:	d103      	bne.n	20029258 <mbedtls_oid_get_pk_alg+0x24>
20029250:	68a9      	ldr	r1, [r5, #8]
20029252:	f001 facb 	bl	2002a7ec <memcmp>
20029256:	b108      	cbz	r0, 2002925c <mbedtls_oid_get_pk_alg+0x28>
20029258:	3414      	adds	r4, #20
2002925a:	e7f0      	b.n	2002923e <mbedtls_oid_get_pk_alg+0xa>
2002925c:	7c23      	ldrb	r3, [r4, #16]
2002925e:	7033      	strb	r3, [r6, #0]
20029260:	e7f1      	b.n	20029246 <mbedtls_oid_get_pk_alg+0x12>
20029262:	bf00      	nop
20029264:	2002c1fc 	.word	0x2002c1fc

20029268 <mbedtls_oid_get_md_alg>:
20029268:	b570      	push	{r4, r5, r6, lr}
2002926a:	460e      	mov	r6, r1
2002926c:	4605      	mov	r5, r0
2002926e:	b110      	cbz	r0, 20029276 <mbedtls_oid_get_md_alg+0xe>
20029270:	4c09      	ldr	r4, [pc, #36]	@ (20029298 <mbedtls_oid_get_md_alg+0x30>)
20029272:	6820      	ldr	r0, [r4, #0]
20029274:	b910      	cbnz	r0, 2002927c <mbedtls_oid_get_md_alg+0x14>
20029276:	f06f 002d 	mvn.w	r0, #45	@ 0x2d
2002927a:	bd70      	pop	{r4, r5, r6, pc}
2002927c:	686b      	ldr	r3, [r5, #4]
2002927e:	6862      	ldr	r2, [r4, #4]
20029280:	429a      	cmp	r2, r3
20029282:	d103      	bne.n	2002928c <mbedtls_oid_get_md_alg+0x24>
20029284:	68a9      	ldr	r1, [r5, #8]
20029286:	f001 fab1 	bl	2002a7ec <memcmp>
2002928a:	b108      	cbz	r0, 20029290 <mbedtls_oid_get_md_alg+0x28>
2002928c:	3414      	adds	r4, #20
2002928e:	e7f0      	b.n	20029272 <mbedtls_oid_get_md_alg+0xa>
20029290:	7c23      	ldrb	r3, [r4, #16]
20029292:	7033      	strb	r3, [r6, #0]
20029294:	e7f1      	b.n	2002927a <mbedtls_oid_get_md_alg+0x12>
20029296:	bf00      	nop
20029298:	2002c198 	.word	0x2002c198

2002929c <mbedtls_oid_get_oid_by_md>:
2002929c:	b530      	push	{r4, r5, lr}
2002929e:	4b08      	ldr	r3, [pc, #32]	@ (200292c0 <mbedtls_oid_get_oid_by_md+0x24>)
200292a0:	681c      	ldr	r4, [r3, #0]
200292a2:	b914      	cbnz	r4, 200292aa <mbedtls_oid_get_oid_by_md+0xe>
200292a4:	f06f 002d 	mvn.w	r0, #45	@ 0x2d
200292a8:	e006      	b.n	200292b8 <mbedtls_oid_get_oid_by_md+0x1c>
200292aa:	7c1d      	ldrb	r5, [r3, #16]
200292ac:	4285      	cmp	r5, r0
200292ae:	d104      	bne.n	200292ba <mbedtls_oid_get_oid_by_md+0x1e>
200292b0:	2000      	movs	r0, #0
200292b2:	600c      	str	r4, [r1, #0]
200292b4:	685b      	ldr	r3, [r3, #4]
200292b6:	6013      	str	r3, [r2, #0]
200292b8:	bd30      	pop	{r4, r5, pc}
200292ba:	3314      	adds	r3, #20
200292bc:	e7f0      	b.n	200292a0 <mbedtls_oid_get_oid_by_md+0x4>
200292be:	bf00      	nop
200292c0:	2002c198 	.word	0x2002c198

200292c4 <mbedtls_pk_init>:
200292c4:	b110      	cbz	r0, 200292cc <mbedtls_pk_init+0x8>
200292c6:	2300      	movs	r3, #0
200292c8:	e9c0 3300 	strd	r3, r3, [r0]
200292cc:	4770      	bx	lr

200292ce <mbedtls_pk_free>:
200292ce:	b510      	push	{r4, lr}
200292d0:	4604      	mov	r4, r0
200292d2:	b160      	cbz	r0, 200292ee <mbedtls_pk_free+0x20>
200292d4:	6803      	ldr	r3, [r0, #0]
200292d6:	b153      	cbz	r3, 200292ee <mbedtls_pk_free+0x20>
200292d8:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
200292da:	6840      	ldr	r0, [r0, #4]
200292dc:	4798      	blx	r3
200292de:	2100      	movs	r1, #0
200292e0:	f104 0308 	add.w	r3, r4, #8
200292e4:	4622      	mov	r2, r4
200292e6:	3401      	adds	r4, #1
200292e8:	429c      	cmp	r4, r3
200292ea:	7011      	strb	r1, [r2, #0]
200292ec:	d1fa      	bne.n	200292e4 <mbedtls_pk_free+0x16>
200292ee:	bd10      	pop	{r4, pc}

200292f0 <mbedtls_pk_info_from_type>:
200292f0:	2801      	cmp	r0, #1
200292f2:	4802      	ldr	r0, [pc, #8]	@ (200292fc <mbedtls_pk_info_from_type+0xc>)
200292f4:	bf18      	it	ne
200292f6:	2000      	movne	r0, #0
200292f8:	4770      	bx	lr
200292fa:	bf00      	nop
200292fc:	2002c24c 	.word	0x2002c24c

20029300 <mbedtls_pk_setup>:
20029300:	b570      	push	{r4, r5, r6, lr}
20029302:	460e      	mov	r6, r1
20029304:	4605      	mov	r5, r0
20029306:	b148      	cbz	r0, 2002931c <mbedtls_pk_setup+0x1c>
20029308:	b141      	cbz	r1, 2002931c <mbedtls_pk_setup+0x1c>
2002930a:	6804      	ldr	r4, [r0, #0]
2002930c:	b934      	cbnz	r4, 2002931c <mbedtls_pk_setup+0x1c>
2002930e:	6a4b      	ldr	r3, [r1, #36]	@ 0x24
20029310:	4798      	blx	r3
20029312:	6068      	str	r0, [r5, #4]
20029314:	b120      	cbz	r0, 20029320 <mbedtls_pk_setup+0x20>
20029316:	4620      	mov	r0, r4
20029318:	602e      	str	r6, [r5, #0]
2002931a:	bd70      	pop	{r4, r5, r6, pc}
2002931c:	4801      	ldr	r0, [pc, #4]	@ (20029324 <mbedtls_pk_setup+0x24>)
2002931e:	e7fc      	b.n	2002931a <mbedtls_pk_setup+0x1a>
20029320:	4801      	ldr	r0, [pc, #4]	@ (20029328 <mbedtls_pk_setup+0x28>)
20029322:	e7fa      	b.n	2002931a <mbedtls_pk_setup+0x1a>
20029324:	ffffc180 	.word	0xffffc180
20029328:	ffffc080 	.word	0xffffc080

2002932c <mbedtls_pk_verify>:
2002932c:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20029330:	460d      	mov	r5, r1
20029332:	e9dd 8908 	ldrd	r8, r9, [sp, #32]
20029336:	4616      	mov	r6, r2
20029338:	4604      	mov	r4, r0
2002933a:	b910      	cbnz	r0, 20029342 <mbedtls_pk_verify+0x16>
2002933c:	480e      	ldr	r0, [pc, #56]	@ (20029378 <mbedtls_pk_verify+0x4c>)
2002933e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20029342:	6802      	ldr	r2, [r0, #0]
20029344:	2a00      	cmp	r2, #0
20029346:	d0f9      	beq.n	2002933c <mbedtls_pk_verify+0x10>
20029348:	b93b      	cbnz	r3, 2002935a <mbedtls_pk_verify+0x2e>
2002934a:	4608      	mov	r0, r1
2002934c:	f7fc fd42 	bl	20025dd4 <mbedtls_md_info_from_type>
20029350:	2800      	cmp	r0, #0
20029352:	d0f3      	beq.n	2002933c <mbedtls_pk_verify+0x10>
20029354:	f7fc fd4a 	bl	20025dec <mbedtls_md_get_size>
20029358:	4603      	mov	r3, r0
2002935a:	6822      	ldr	r2, [r4, #0]
2002935c:	6917      	ldr	r7, [r2, #16]
2002935e:	b147      	cbz	r7, 20029372 <mbedtls_pk_verify+0x46>
20029360:	e9cd 8908 	strd	r8, r9, [sp, #32]
20029364:	4632      	mov	r2, r6
20029366:	4629      	mov	r1, r5
20029368:	46bc      	mov	ip, r7
2002936a:	6860      	ldr	r0, [r4, #4]
2002936c:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20029370:	4760      	bx	ip
20029372:	4802      	ldr	r0, [pc, #8]	@ (2002937c <mbedtls_pk_verify+0x50>)
20029374:	e7e3      	b.n	2002933e <mbedtls_pk_verify+0x12>
20029376:	bf00      	nop
20029378:	ffffc180 	.word	0xffffc180
2002937c:	ffffc100 	.word	0xffffc100

20029380 <pk_get_pk_alg>:
20029380:	b530      	push	{r4, r5, lr}
20029382:	4615      	mov	r5, r2
20029384:	2200      	movs	r2, #0
20029386:	b085      	sub	sp, #20
20029388:	e9c3 2200 	strd	r2, r2, [r3]
2002938c:	609a      	str	r2, [r3, #8]
2002938e:	aa01      	add	r2, sp, #4
20029390:	461c      	mov	r4, r3
20029392:	f7fe fa98 	bl	200278c6 <mbedtls_asn1_get_alg>
20029396:	b118      	cbz	r0, 200293a0 <pk_get_pk_alg+0x20>
20029398:	f5a0 506a 	sub.w	r0, r0, #14976	@ 0x3a80
2002939c:	b005      	add	sp, #20
2002939e:	bd30      	pop	{r4, r5, pc}
200293a0:	4629      	mov	r1, r5
200293a2:	a801      	add	r0, sp, #4
200293a4:	f7ff ff46 	bl	20029234 <mbedtls_oid_get_pk_alg>
200293a8:	b960      	cbnz	r0, 200293c4 <pk_get_pk_alg+0x44>
200293aa:	782b      	ldrb	r3, [r5, #0]
200293ac:	2b01      	cmp	r3, #1
200293ae:	d1f5      	bne.n	2002939c <pk_get_pk_alg+0x1c>
200293b0:	6823      	ldr	r3, [r4, #0]
200293b2:	2b05      	cmp	r3, #5
200293b4:	d000      	beq.n	200293b8 <pk_get_pk_alg+0x38>
200293b6:	b93b      	cbnz	r3, 200293c8 <pk_get_pk_alg+0x48>
200293b8:	6862      	ldr	r2, [r4, #4]
200293ba:	4b04      	ldr	r3, [pc, #16]	@ (200293cc <pk_get_pk_alg+0x4c>)
200293bc:	2a00      	cmp	r2, #0
200293be:	bf18      	it	ne
200293c0:	4618      	movne	r0, r3
200293c2:	e7eb      	b.n	2002939c <pk_get_pk_alg+0x1c>
200293c4:	4802      	ldr	r0, [pc, #8]	@ (200293d0 <pk_get_pk_alg+0x50>)
200293c6:	e7e9      	b.n	2002939c <pk_get_pk_alg+0x1c>
200293c8:	4800      	ldr	r0, [pc, #0]	@ (200293cc <pk_get_pk_alg+0x4c>)
200293ca:	e7e7      	b.n	2002939c <pk_get_pk_alg+0x1c>
200293cc:	ffffc580 	.word	0xffffc580
200293d0:	ffffc380 	.word	0xffffc380

200293d4 <mbedtls_pk_parse_subpubkey>:
200293d4:	2300      	movs	r3, #0
200293d6:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
200293da:	b087      	sub	sp, #28
200293dc:	4690      	mov	r8, r2
200293de:	f88d 3003 	strb.w	r3, [sp, #3]
200293e2:	aa01      	add	r2, sp, #4
200293e4:	2330      	movs	r3, #48	@ 0x30
200293e6:	4606      	mov	r6, r0
200293e8:	f7fe fa32 	bl	20027850 <mbedtls_asn1_get_tag>
200293ec:	b128      	cbz	r0, 200293fa <mbedtls_pk_parse_subpubkey+0x26>
200293ee:	f5a0 5474 	sub.w	r4, r0, #15616	@ 0x3d00
200293f2:	4620      	mov	r0, r4
200293f4:	b007      	add	sp, #28
200293f6:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
200293fa:	9b01      	ldr	r3, [sp, #4]
200293fc:	6837      	ldr	r7, [r6, #0]
200293fe:	4630      	mov	r0, r6
20029400:	441f      	add	r7, r3
20029402:	4639      	mov	r1, r7
20029404:	ab03      	add	r3, sp, #12
20029406:	f10d 0203 	add.w	r2, sp, #3
2002940a:	f7ff ffb9 	bl	20029380 <pk_get_pk_alg>
2002940e:	4604      	mov	r4, r0
20029410:	2800      	cmp	r0, #0
20029412:	d1ee      	bne.n	200293f2 <mbedtls_pk_parse_subpubkey+0x1e>
20029414:	4639      	mov	r1, r7
20029416:	4630      	mov	r0, r6
20029418:	aa01      	add	r2, sp, #4
2002941a:	f7fe fa40 	bl	2002789e <mbedtls_asn1_get_bitstring_null>
2002941e:	b110      	cbz	r0, 20029426 <mbedtls_pk_parse_subpubkey+0x52>
20029420:	f5a0 546c 	sub.w	r4, r0, #15104	@ 0x3b00
20029424:	e7e5      	b.n	200293f2 <mbedtls_pk_parse_subpubkey+0x1e>
20029426:	6833      	ldr	r3, [r6, #0]
20029428:	9a01      	ldr	r2, [sp, #4]
2002942a:	4413      	add	r3, r2
2002942c:	429f      	cmp	r7, r3
2002942e:	d14b      	bne.n	200294c8 <mbedtls_pk_parse_subpubkey+0xf4>
20029430:	f89d 0003 	ldrb.w	r0, [sp, #3]
20029434:	f7ff ff5c 	bl	200292f0 <mbedtls_pk_info_from_type>
20029438:	4601      	mov	r1, r0
2002943a:	2800      	cmp	r0, #0
2002943c:	d046      	beq.n	200294cc <mbedtls_pk_parse_subpubkey+0xf8>
2002943e:	4640      	mov	r0, r8
20029440:	f7ff ff5e 	bl	20029300 <mbedtls_pk_setup>
20029444:	4604      	mov	r4, r0
20029446:	2800      	cmp	r0, #0
20029448:	d1d3      	bne.n	200293f2 <mbedtls_pk_parse_subpubkey+0x1e>
2002944a:	f89d 3003 	ldrb.w	r3, [sp, #3]
2002944e:	2b01      	cmp	r3, #1
20029450:	d138      	bne.n	200294c4 <mbedtls_pk_parse_subpubkey+0xf0>
20029452:	2330      	movs	r3, #48	@ 0x30
20029454:	4639      	mov	r1, r7
20029456:	4630      	mov	r0, r6
20029458:	aa02      	add	r2, sp, #8
2002945a:	f8d8 5004 	ldr.w	r5, [r8, #4]
2002945e:	f7fe f9f7 	bl	20027850 <mbedtls_asn1_get_tag>
20029462:	b138      	cbz	r0, 20029474 <mbedtls_pk_parse_subpubkey+0xa0>
20029464:	f5a0 556c 	sub.w	r5, r0, #15104	@ 0x3b00
20029468:	bb3d      	cbnz	r5, 200294ba <mbedtls_pk_parse_subpubkey+0xe6>
2002946a:	6833      	ldr	r3, [r6, #0]
2002946c:	42bb      	cmp	r3, r7
2002946e:	d0c0      	beq.n	200293f2 <mbedtls_pk_parse_subpubkey+0x1e>
20029470:	4d17      	ldr	r5, [pc, #92]	@ (200294d0 <mbedtls_pk_parse_subpubkey+0xfc>)
20029472:	e022      	b.n	200294ba <mbedtls_pk_parse_subpubkey+0xe6>
20029474:	6833      	ldr	r3, [r6, #0]
20029476:	9a02      	ldr	r2, [sp, #8]
20029478:	4413      	add	r3, r2
2002947a:	429f      	cmp	r7, r3
2002947c:	d1f8      	bne.n	20029470 <mbedtls_pk_parse_subpubkey+0x9c>
2002947e:	f105 0a08 	add.w	sl, r5, #8
20029482:	4652      	mov	r2, sl
20029484:	4639      	mov	r1, r7
20029486:	4630      	mov	r0, r6
20029488:	f7fe f9f6 	bl	20027878 <mbedtls_asn1_get_mpi>
2002948c:	2800      	cmp	r0, #0
2002948e:	d1e9      	bne.n	20029464 <mbedtls_pk_parse_subpubkey+0x90>
20029490:	4639      	mov	r1, r7
20029492:	4630      	mov	r0, r6
20029494:	f105 0214 	add.w	r2, r5, #20
20029498:	f7fe f9ee 	bl	20027878 <mbedtls_asn1_get_mpi>
2002949c:	2800      	cmp	r0, #0
2002949e:	d1e1      	bne.n	20029464 <mbedtls_pk_parse_subpubkey+0x90>
200294a0:	6833      	ldr	r3, [r6, #0]
200294a2:	429f      	cmp	r7, r3
200294a4:	d1e4      	bne.n	20029470 <mbedtls_pk_parse_subpubkey+0x9c>
200294a6:	4628      	mov	r0, r5
200294a8:	f000 f8c2 	bl	20029630 <mbedtls_rsa_check_pubkey>
200294ac:	b920      	cbnz	r0, 200294b8 <mbedtls_pk_parse_subpubkey+0xe4>
200294ae:	4650      	mov	r0, sl
200294b0:	f7fe fcbe 	bl	20027e30 <mbedtls_mpi_size>
200294b4:	6068      	str	r0, [r5, #4]
200294b6:	e7d8      	b.n	2002946a <mbedtls_pk_parse_subpubkey+0x96>
200294b8:	4d06      	ldr	r5, [pc, #24]	@ (200294d4 <mbedtls_pk_parse_subpubkey+0x100>)
200294ba:	4640      	mov	r0, r8
200294bc:	f7ff ff07 	bl	200292ce <mbedtls_pk_free>
200294c0:	462c      	mov	r4, r5
200294c2:	e796      	b.n	200293f2 <mbedtls_pk_parse_subpubkey+0x1e>
200294c4:	4d04      	ldr	r5, [pc, #16]	@ (200294d8 <mbedtls_pk_parse_subpubkey+0x104>)
200294c6:	e7f8      	b.n	200294ba <mbedtls_pk_parse_subpubkey+0xe6>
200294c8:	4c01      	ldr	r4, [pc, #4]	@ (200294d0 <mbedtls_pk_parse_subpubkey+0xfc>)
200294ca:	e792      	b.n	200293f2 <mbedtls_pk_parse_subpubkey+0x1e>
200294cc:	4c02      	ldr	r4, [pc, #8]	@ (200294d8 <mbedtls_pk_parse_subpubkey+0x104>)
200294ce:	e790      	b.n	200293f2 <mbedtls_pk_parse_subpubkey+0x1e>
200294d0:	ffffc49a 	.word	0xffffc49a
200294d4:	ffffc500 	.word	0xffffc500
200294d8:	ffffc380 	.word	0xffffc380

200294dc <mbedtls_pk_parse_public_key>:
200294dc:	4613      	mov	r3, r2
200294de:	b507      	push	{r0, r1, r2, lr}
200294e0:	4602      	mov	r2, r0
200294e2:	9101      	str	r1, [sp, #4]
200294e4:	a801      	add	r0, sp, #4
200294e6:	4419      	add	r1, r3
200294e8:	f7ff ff74 	bl	200293d4 <mbedtls_pk_parse_subpubkey>
200294ec:	b003      	add	sp, #12
200294ee:	f85d fb04 	ldr.w	pc, [sp], #4

200294f2 <rsa_can_do>:
200294f2:	2801      	cmp	r0, #1
200294f4:	d002      	beq.n	200294fc <rsa_can_do+0xa>
200294f6:	1f83      	subs	r3, r0, #6
200294f8:	4258      	negs	r0, r3
200294fa:	4158      	adcs	r0, r3
200294fc:	4770      	bx	lr

200294fe <rsa_get_bitlen>:
200294fe:	6840      	ldr	r0, [r0, #4]
20029500:	00c0      	lsls	r0, r0, #3
20029502:	4770      	bx	lr

20029504 <rsa_debug>:
20029504:	2301      	movs	r3, #1
20029506:	4a06      	ldr	r2, [pc, #24]	@ (20029520 <rsa_debug+0x1c>)
20029508:	700b      	strb	r3, [r1, #0]
2002950a:	730b      	strb	r3, [r1, #12]
2002950c:	4b05      	ldr	r3, [pc, #20]	@ (20029524 <rsa_debug+0x20>)
2002950e:	604a      	str	r2, [r1, #4]
20029510:	f100 0208 	add.w	r2, r0, #8
20029514:	3014      	adds	r0, #20
20029516:	608a      	str	r2, [r1, #8]
20029518:	610b      	str	r3, [r1, #16]
2002951a:	6148      	str	r0, [r1, #20]
2002951c:	4770      	bx	lr
2002951e:	bf00      	nop
20029520:	2002b028 	.word	0x2002b028
20029524:	2002b02e 	.word	0x2002b02e

20029528 <rsa_free_wrap>:
20029528:	b510      	push	{r4, lr}
2002952a:	4604      	mov	r4, r0
2002952c:	f000 fe7c 	bl	2002a228 <mbedtls_rsa_free>
20029530:	4620      	mov	r0, r4
20029532:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20029536:	f001 b8a3 	b.w	2002a680 <free>

2002953a <rsa_alloc_wrap>:
2002953a:	b510      	push	{r4, lr}
2002953c:	21ac      	movs	r1, #172	@ 0xac
2002953e:	2001      	movs	r0, #1
20029540:	f001 f882 	bl	2002a648 <calloc>
20029544:	4604      	mov	r4, r0
20029546:	b118      	cbz	r0, 20029550 <rsa_alloc_wrap+0x16>
20029548:	2200      	movs	r2, #0
2002954a:	4611      	mov	r1, r2
2002954c:	f000 f862 	bl	20029614 <mbedtls_rsa_init>
20029550:	4620      	mov	r0, r4
20029552:	bd10      	pop	{r4, pc}

20029554 <rsa_check_pair_wrap>:
20029554:	f000 b99c 	b.w	20029890 <mbedtls_rsa_check_pub_priv>

20029558 <rsa_encrypt_wrap>:
20029558:	b4f0      	push	{r4, r5, r6, r7}
2002955a:	9f04      	ldr	r7, [sp, #16]
2002955c:	6846      	ldr	r6, [r0, #4]
2002955e:	460d      	mov	r5, r1
20029560:	603e      	str	r6, [r7, #0]
20029562:	9f05      	ldr	r7, [sp, #20]
20029564:	4614      	mov	r4, r2
20029566:	e9dd 1206 	ldrd	r1, r2, [sp, #24]
2002956a:	42be      	cmp	r6, r7
2002956c:	d806      	bhi.n	2002957c <rsa_encrypt_wrap+0x24>
2002956e:	e9cd 5305 	strd	r5, r3, [sp, #20]
20029572:	9404      	str	r4, [sp, #16]
20029574:	2300      	movs	r3, #0
20029576:	bcf0      	pop	{r4, r5, r6, r7}
20029578:	f000 bbe2 	b.w	20029d40 <mbedtls_rsa_pkcs1_encrypt>
2002957c:	4801      	ldr	r0, [pc, #4]	@ (20029584 <rsa_encrypt_wrap+0x2c>)
2002957e:	bcf0      	pop	{r4, r5, r6, r7}
20029580:	4770      	bx	lr
20029582:	bf00      	nop
20029584:	ffffbc00 	.word	0xffffbc00

20029588 <rsa_decrypt_wrap>:
20029588:	b4f0      	push	{r4, r5, r6, r7}
2002958a:	4616      	mov	r6, r2
2002958c:	6847      	ldr	r7, [r0, #4]
2002958e:	460c      	mov	r4, r1
20029590:	e9dd 5105 	ldrd	r5, r1, [sp, #20]
20029594:	42b7      	cmp	r7, r6
20029596:	9a07      	ldr	r2, [sp, #28]
20029598:	d106      	bne.n	200295a8 <rsa_decrypt_wrap+0x20>
2002959a:	e9cd 3506 	strd	r3, r5, [sp, #24]
2002959e:	9405      	str	r4, [sp, #20]
200295a0:	2301      	movs	r3, #1
200295a2:	bcf0      	pop	{r4, r5, r6, r7}
200295a4:	f000 bc6e 	b.w	20029e84 <mbedtls_rsa_pkcs1_decrypt>
200295a8:	4801      	ldr	r0, [pc, #4]	@ (200295b0 <rsa_decrypt_wrap+0x28>)
200295aa:	bcf0      	pop	{r4, r5, r6, r7}
200295ac:	4770      	bx	lr
200295ae:	bf00      	nop
200295b0:	ffffbf80 	.word	0xffffbf80

200295b4 <rsa_sign_wrap>:
200295b4:	b4f0      	push	{r4, r5, r6, r7}
200295b6:	460c      	mov	r4, r1
200295b8:	4615      	mov	r5, r2
200295ba:	e9dd 1206 	ldrd	r1, r2, [sp, #24]
200295be:	6847      	ldr	r7, [r0, #4]
200295c0:	9e05      	ldr	r6, [sp, #20]
200295c2:	6037      	str	r7, [r6, #0]
200295c4:	9e04      	ldr	r6, [sp, #16]
200295c6:	e9cd 4304 	strd	r4, r3, [sp, #16]
200295ca:	e9cd 5606 	strd	r5, r6, [sp, #24]
200295ce:	bcf0      	pop	{r4, r5, r6, r7}
200295d0:	2301      	movs	r3, #1
200295d2:	f000 bd31 	b.w	2002a038 <mbedtls_rsa_pkcs1_sign>
	...

200295d8 <rsa_verify_wrap>:
200295d8:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
200295da:	9d09      	ldr	r5, [sp, #36]	@ 0x24
200295dc:	6846      	ldr	r6, [r0, #4]
200295de:	4604      	mov	r4, r0
200295e0:	42ae      	cmp	r6, r5
200295e2:	d811      	bhi.n	20029608 <rsa_verify_wrap+0x30>
200295e4:	e9cd 1300 	strd	r1, r3, [sp]
200295e8:	2300      	movs	r3, #0
200295ea:	9e08      	ldr	r6, [sp, #32]
200295ec:	4619      	mov	r1, r3
200295ee:	e9cd 2602 	strd	r2, r6, [sp, #8]
200295f2:	461a      	mov	r2, r3
200295f4:	f000 fe08 	bl	2002a208 <mbedtls_rsa_pkcs1_verify>
200295f8:	b920      	cbnz	r0, 20029604 <rsa_verify_wrap+0x2c>
200295fa:	6862      	ldr	r2, [r4, #4]
200295fc:	4b03      	ldr	r3, [pc, #12]	@ (2002960c <rsa_verify_wrap+0x34>)
200295fe:	42aa      	cmp	r2, r5
20029600:	bf38      	it	cc
20029602:	4618      	movcc	r0, r3
20029604:	b004      	add	sp, #16
20029606:	bd70      	pop	{r4, r5, r6, pc}
20029608:	4801      	ldr	r0, [pc, #4]	@ (20029610 <rsa_verify_wrap+0x38>)
2002960a:	e7fb      	b.n	20029604 <rsa_verify_wrap+0x2c>
2002960c:	ffffc700 	.word	0xffffc700
20029610:	ffffbc80 	.word	0xffffbc80

20029614 <mbedtls_rsa_init>:
20029614:	b570      	push	{r4, r5, r6, lr}
20029616:	4604      	mov	r4, r0
20029618:	460e      	mov	r6, r1
2002961a:	4615      	mov	r5, r2
2002961c:	2100      	movs	r1, #0
2002961e:	22ac      	movs	r2, #172	@ 0xac
20029620:	f001 f8f4 	bl	2002a80c <memset>
20029624:	e9c4 6529 	strd	r6, r5, [r4, #164]	@ 0xa4
20029628:	bd70      	pop	{r4, r5, r6, pc}

2002962a <mbedtls_rsa_set_padding>:
2002962a:	e9c0 1229 	strd	r1, r2, [r0, #164]	@ 0xa4
2002962e:	4770      	bx	lr

20029630 <mbedtls_rsa_check_pubkey>:
20029630:	b538      	push	{r3, r4, r5, lr}
20029632:	6902      	ldr	r2, [r0, #16]
20029634:	4604      	mov	r4, r0
20029636:	b10a      	cbz	r2, 2002963c <mbedtls_rsa_check_pubkey+0xc>
20029638:	69c3      	ldr	r3, [r0, #28]
2002963a:	b90b      	cbnz	r3, 20029640 <mbedtls_rsa_check_pubkey+0x10>
2002963c:	4811      	ldr	r0, [pc, #68]	@ (20029684 <mbedtls_rsa_check_pubkey+0x54>)
2002963e:	bd38      	pop	{r3, r4, r5, pc}
20029640:	6812      	ldr	r2, [r2, #0]
20029642:	07d2      	lsls	r2, r2, #31
20029644:	d5fa      	bpl.n	2002963c <mbedtls_rsa_check_pubkey+0xc>
20029646:	681b      	ldr	r3, [r3, #0]
20029648:	07db      	lsls	r3, r3, #31
2002964a:	d5f7      	bpl.n	2002963c <mbedtls_rsa_check_pubkey+0xc>
2002964c:	f100 0508 	add.w	r5, r0, #8
20029650:	4628      	mov	r0, r5
20029652:	f7fe fbd0 	bl	20027df6 <mbedtls_mpi_bitlen>
20029656:	287f      	cmp	r0, #127	@ 0x7f
20029658:	d9f0      	bls.n	2002963c <mbedtls_rsa_check_pubkey+0xc>
2002965a:	4628      	mov	r0, r5
2002965c:	f7fe fbcb 	bl	20027df6 <mbedtls_mpi_bitlen>
20029660:	f5b0 5f00 	cmp.w	r0, #8192	@ 0x2000
20029664:	d8ea      	bhi.n	2002963c <mbedtls_rsa_check_pubkey+0xc>
20029666:	3414      	adds	r4, #20
20029668:	4620      	mov	r0, r4
2002966a:	f7fe fbc4 	bl	20027df6 <mbedtls_mpi_bitlen>
2002966e:	2801      	cmp	r0, #1
20029670:	d9e4      	bls.n	2002963c <mbedtls_rsa_check_pubkey+0xc>
20029672:	4629      	mov	r1, r5
20029674:	4620      	mov	r0, r4
20029676:	f7fe fd71 	bl	2002815c <mbedtls_mpi_cmp_mpi>
2002967a:	2800      	cmp	r0, #0
2002967c:	dade      	bge.n	2002963c <mbedtls_rsa_check_pubkey+0xc>
2002967e:	2000      	movs	r0, #0
20029680:	e7dd      	b.n	2002963e <mbedtls_rsa_check_pubkey+0xe>
20029682:	bf00      	nop
20029684:	ffffbe00 	.word	0xffffbe00

20029688 <mbedtls_rsa_check_privkey>:
20029688:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
2002968c:	b0a9      	sub	sp, #164	@ 0xa4
2002968e:	4605      	mov	r5, r0
20029690:	f7ff ffce 	bl	20029630 <mbedtls_rsa_check_pubkey>
20029694:	b120      	cbz	r0, 200296a0 <mbedtls_rsa_check_privkey+0x18>
20029696:	4c7d      	ldr	r4, [pc, #500]	@ (2002988c <mbedtls_rsa_check_privkey+0x204>)
20029698:	4620      	mov	r0, r4
2002969a:	b029      	add	sp, #164	@ 0xa4
2002969c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
200296a0:	6b6b      	ldr	r3, [r5, #52]	@ 0x34
200296a2:	2b00      	cmp	r3, #0
200296a4:	d0f7      	beq.n	20029696 <mbedtls_rsa_check_privkey+0xe>
200296a6:	6c2b      	ldr	r3, [r5, #64]	@ 0x40
200296a8:	2b00      	cmp	r3, #0
200296aa:	d0f4      	beq.n	20029696 <mbedtls_rsa_check_privkey+0xe>
200296ac:	6aab      	ldr	r3, [r5, #40]	@ 0x28
200296ae:	2b00      	cmp	r3, #0
200296b0:	d0f1      	beq.n	20029696 <mbedtls_rsa_check_privkey+0xe>
200296b2:	a801      	add	r0, sp, #4
200296b4:	f7fe fafa 	bl	20027cac <mbedtls_mpi_init>
200296b8:	a804      	add	r0, sp, #16
200296ba:	f7fe faf7 	bl	20027cac <mbedtls_mpi_init>
200296be:	a807      	add	r0, sp, #28
200296c0:	f7fe faf4 	bl	20027cac <mbedtls_mpi_init>
200296c4:	a80a      	add	r0, sp, #40	@ 0x28
200296c6:	f7fe faf1 	bl	20027cac <mbedtls_mpi_init>
200296ca:	a80d      	add	r0, sp, #52	@ 0x34
200296cc:	f7fe faee 	bl	20027cac <mbedtls_mpi_init>
200296d0:	a810      	add	r0, sp, #64	@ 0x40
200296d2:	f7fe faeb 	bl	20027cac <mbedtls_mpi_init>
200296d6:	a813      	add	r0, sp, #76	@ 0x4c
200296d8:	f7fe fae8 	bl	20027cac <mbedtls_mpi_init>
200296dc:	a816      	add	r0, sp, #88	@ 0x58
200296de:	f7fe fae5 	bl	20027cac <mbedtls_mpi_init>
200296e2:	a819      	add	r0, sp, #100	@ 0x64
200296e4:	f7fe fae2 	bl	20027cac <mbedtls_mpi_init>
200296e8:	a81c      	add	r0, sp, #112	@ 0x70
200296ea:	f7fe fadf 	bl	20027cac <mbedtls_mpi_init>
200296ee:	a81f      	add	r0, sp, #124	@ 0x7c
200296f0:	f7fe fadc 	bl	20027cac <mbedtls_mpi_init>
200296f4:	a822      	add	r0, sp, #136	@ 0x88
200296f6:	f7fe fad9 	bl	20027cac <mbedtls_mpi_init>
200296fa:	f105 072c 	add.w	r7, r5, #44	@ 0x2c
200296fe:	a825      	add	r0, sp, #148	@ 0x94
20029700:	f105 0638 	add.w	r6, r5, #56	@ 0x38
20029704:	f7fe fad2 	bl	20027cac <mbedtls_mpi_init>
20029708:	4632      	mov	r2, r6
2002970a:	4639      	mov	r1, r7
2002970c:	a801      	add	r0, sp, #4
2002970e:	f7fe fe75 	bl	200283fc <mbedtls_mpi_mul_mpi>
20029712:	4604      	mov	r4, r0
20029714:	2800      	cmp	r0, #0
20029716:	d15e      	bne.n	200297d6 <mbedtls_rsa_check_privkey+0x14e>
20029718:	f105 0820 	add.w	r8, r5, #32
2002971c:	f105 0914 	add.w	r9, r5, #20
20029720:	464a      	mov	r2, r9
20029722:	4641      	mov	r1, r8
20029724:	a804      	add	r0, sp, #16
20029726:	f7fe fe69 	bl	200283fc <mbedtls_mpi_mul_mpi>
2002972a:	4604      	mov	r4, r0
2002972c:	2800      	cmp	r0, #0
2002972e:	d152      	bne.n	200297d6 <mbedtls_rsa_check_privkey+0x14e>
20029730:	2201      	movs	r2, #1
20029732:	4639      	mov	r1, r7
20029734:	a807      	add	r0, sp, #28
20029736:	f7fe fe4b 	bl	200283d0 <mbedtls_mpi_sub_int>
2002973a:	4604      	mov	r4, r0
2002973c:	2800      	cmp	r0, #0
2002973e:	d14a      	bne.n	200297d6 <mbedtls_rsa_check_privkey+0x14e>
20029740:	2201      	movs	r2, #1
20029742:	4631      	mov	r1, r6
20029744:	a80a      	add	r0, sp, #40	@ 0x28
20029746:	f7fe fe43 	bl	200283d0 <mbedtls_mpi_sub_int>
2002974a:	4604      	mov	r4, r0
2002974c:	2800      	cmp	r0, #0
2002974e:	d142      	bne.n	200297d6 <mbedtls_rsa_check_privkey+0x14e>
20029750:	aa0a      	add	r2, sp, #40	@ 0x28
20029752:	a907      	add	r1, sp, #28
20029754:	a80d      	add	r0, sp, #52	@ 0x34
20029756:	f7fe fe51 	bl	200283fc <mbedtls_mpi_mul_mpi>
2002975a:	4604      	mov	r4, r0
2002975c:	2800      	cmp	r0, #0
2002975e:	d13a      	bne.n	200297d6 <mbedtls_rsa_check_privkey+0x14e>
20029760:	4649      	mov	r1, r9
20029762:	aa0d      	add	r2, sp, #52	@ 0x34
20029764:	a813      	add	r0, sp, #76	@ 0x4c
20029766:	f7ff fb04 	bl	20028d72 <mbedtls_mpi_gcd>
2002976a:	4604      	mov	r4, r0
2002976c:	2800      	cmp	r0, #0
2002976e:	d132      	bne.n	200297d6 <mbedtls_rsa_check_privkey+0x14e>
20029770:	aa0a      	add	r2, sp, #40	@ 0x28
20029772:	a907      	add	r1, sp, #28
20029774:	a816      	add	r0, sp, #88	@ 0x58
20029776:	f7ff fafc 	bl	20028d72 <mbedtls_mpi_gcd>
2002977a:	4604      	mov	r4, r0
2002977c:	bb58      	cbnz	r0, 200297d6 <mbedtls_rsa_check_privkey+0x14e>
2002977e:	ab16      	add	r3, sp, #88	@ 0x58
20029780:	aa0d      	add	r2, sp, #52	@ 0x34
20029782:	a91c      	add	r1, sp, #112	@ 0x70
20029784:	a819      	add	r0, sp, #100	@ 0x64
20029786:	f7fe feaa 	bl	200284de <mbedtls_mpi_div_mpi>
2002978a:	4604      	mov	r4, r0
2002978c:	bb18      	cbnz	r0, 200297d6 <mbedtls_rsa_check_privkey+0x14e>
2002978e:	aa19      	add	r2, sp, #100	@ 0x64
20029790:	a904      	add	r1, sp, #16
20029792:	a810      	add	r0, sp, #64	@ 0x40
20029794:	f7ff f8a7 	bl	200288e6 <mbedtls_mpi_mod_mpi>
20029798:	4604      	mov	r4, r0
2002979a:	b9e0      	cbnz	r0, 200297d6 <mbedtls_rsa_check_privkey+0x14e>
2002979c:	4641      	mov	r1, r8
2002979e:	aa07      	add	r2, sp, #28
200297a0:	a81f      	add	r0, sp, #124	@ 0x7c
200297a2:	f7ff f8a0 	bl	200288e6 <mbedtls_mpi_mod_mpi>
200297a6:	4604      	mov	r4, r0
200297a8:	b9a8      	cbnz	r0, 200297d6 <mbedtls_rsa_check_privkey+0x14e>
200297aa:	4641      	mov	r1, r8
200297ac:	aa0a      	add	r2, sp, #40	@ 0x28
200297ae:	a822      	add	r0, sp, #136	@ 0x88
200297b0:	f7ff f899 	bl	200288e6 <mbedtls_mpi_mod_mpi>
200297b4:	4604      	mov	r4, r0
200297b6:	b970      	cbnz	r0, 200297d6 <mbedtls_rsa_check_privkey+0x14e>
200297b8:	463a      	mov	r2, r7
200297ba:	4631      	mov	r1, r6
200297bc:	a825      	add	r0, sp, #148	@ 0x94
200297be:	f7ff fb73 	bl	20028ea8 <mbedtls_mpi_inv_mod>
200297c2:	4604      	mov	r4, r0
200297c4:	b938      	cbnz	r0, 200297d6 <mbedtls_rsa_check_privkey+0x14e>
200297c6:	f105 0108 	add.w	r1, r5, #8
200297ca:	a801      	add	r0, sp, #4
200297cc:	f7fe fcc6 	bl	2002815c <mbedtls_mpi_cmp_mpi>
200297d0:	2800      	cmp	r0, #0
200297d2:	d031      	beq.n	20029838 <mbedtls_rsa_check_privkey+0x1b0>
200297d4:	4c2d      	ldr	r4, [pc, #180]	@ (2002988c <mbedtls_rsa_check_privkey+0x204>)
200297d6:	a801      	add	r0, sp, #4
200297d8:	f7fe fa6f 	bl	20027cba <mbedtls_mpi_free>
200297dc:	a804      	add	r0, sp, #16
200297de:	f7fe fa6c 	bl	20027cba <mbedtls_mpi_free>
200297e2:	a807      	add	r0, sp, #28
200297e4:	f7fe fa69 	bl	20027cba <mbedtls_mpi_free>
200297e8:	a80a      	add	r0, sp, #40	@ 0x28
200297ea:	f7fe fa66 	bl	20027cba <mbedtls_mpi_free>
200297ee:	a80d      	add	r0, sp, #52	@ 0x34
200297f0:	f7fe fa63 	bl	20027cba <mbedtls_mpi_free>
200297f4:	a810      	add	r0, sp, #64	@ 0x40
200297f6:	f7fe fa60 	bl	20027cba <mbedtls_mpi_free>
200297fa:	a813      	add	r0, sp, #76	@ 0x4c
200297fc:	f7fe fa5d 	bl	20027cba <mbedtls_mpi_free>
20029800:	a816      	add	r0, sp, #88	@ 0x58
20029802:	f7fe fa5a 	bl	20027cba <mbedtls_mpi_free>
20029806:	a819      	add	r0, sp, #100	@ 0x64
20029808:	f7fe fa57 	bl	20027cba <mbedtls_mpi_free>
2002980c:	a81c      	add	r0, sp, #112	@ 0x70
2002980e:	f7fe fa54 	bl	20027cba <mbedtls_mpi_free>
20029812:	a81f      	add	r0, sp, #124	@ 0x7c
20029814:	f7fe fa51 	bl	20027cba <mbedtls_mpi_free>
20029818:	a822      	add	r0, sp, #136	@ 0x88
2002981a:	f7fe fa4e 	bl	20027cba <mbedtls_mpi_free>
2002981e:	a825      	add	r0, sp, #148	@ 0x94
20029820:	f7fe fa4b 	bl	20027cba <mbedtls_mpi_free>
20029824:	f514 4f84 	cmn.w	r4, #16896	@ 0x4200
20029828:	f43f af35 	beq.w	20029696 <mbedtls_rsa_check_privkey+0xe>
2002982c:	2c00      	cmp	r4, #0
2002982e:	f43f af33 	beq.w	20029698 <mbedtls_rsa_check_privkey+0x10>
20029832:	f5a4 4484 	sub.w	r4, r4, #16896	@ 0x4200
20029836:	e72f      	b.n	20029698 <mbedtls_rsa_check_privkey+0x10>
20029838:	f105 0144 	add.w	r1, r5, #68	@ 0x44
2002983c:	a81f      	add	r0, sp, #124	@ 0x7c
2002983e:	f7fe fc8d 	bl	2002815c <mbedtls_mpi_cmp_mpi>
20029842:	2800      	cmp	r0, #0
20029844:	d1c6      	bne.n	200297d4 <mbedtls_rsa_check_privkey+0x14c>
20029846:	f105 0150 	add.w	r1, r5, #80	@ 0x50
2002984a:	a822      	add	r0, sp, #136	@ 0x88
2002984c:	f7fe fc86 	bl	2002815c <mbedtls_mpi_cmp_mpi>
20029850:	2800      	cmp	r0, #0
20029852:	d1bf      	bne.n	200297d4 <mbedtls_rsa_check_privkey+0x14c>
20029854:	f105 015c 	add.w	r1, r5, #92	@ 0x5c
20029858:	a825      	add	r0, sp, #148	@ 0x94
2002985a:	f7fe fc7f 	bl	2002815c <mbedtls_mpi_cmp_mpi>
2002985e:	2800      	cmp	r0, #0
20029860:	d1b8      	bne.n	200297d4 <mbedtls_rsa_check_privkey+0x14c>
20029862:	2100      	movs	r1, #0
20029864:	a81c      	add	r0, sp, #112	@ 0x70
20029866:	f7fe fcba 	bl	200281de <mbedtls_mpi_cmp_int>
2002986a:	2800      	cmp	r0, #0
2002986c:	d1b2      	bne.n	200297d4 <mbedtls_rsa_check_privkey+0x14c>
2002986e:	2101      	movs	r1, #1
20029870:	a810      	add	r0, sp, #64	@ 0x40
20029872:	f7fe fcb4 	bl	200281de <mbedtls_mpi_cmp_int>
20029876:	2800      	cmp	r0, #0
20029878:	d1ac      	bne.n	200297d4 <mbedtls_rsa_check_privkey+0x14c>
2002987a:	2101      	movs	r1, #1
2002987c:	a813      	add	r0, sp, #76	@ 0x4c
2002987e:	f7fe fcae 	bl	200281de <mbedtls_mpi_cmp_int>
20029882:	4604      	mov	r4, r0
20029884:	2800      	cmp	r0, #0
20029886:	d1a5      	bne.n	200297d4 <mbedtls_rsa_check_privkey+0x14c>
20029888:	e7a5      	b.n	200297d6 <mbedtls_rsa_check_privkey+0x14e>
2002988a:	bf00      	nop
2002988c:	ffffbe00 	.word	0xffffbe00

20029890 <mbedtls_rsa_check_pub_priv>:
20029890:	b538      	push	{r3, r4, r5, lr}
20029892:	4605      	mov	r5, r0
20029894:	460c      	mov	r4, r1
20029896:	f7ff fecb 	bl	20029630 <mbedtls_rsa_check_pubkey>
2002989a:	b918      	cbnz	r0, 200298a4 <mbedtls_rsa_check_pub_priv+0x14>
2002989c:	4620      	mov	r0, r4
2002989e:	f7ff fef3 	bl	20029688 <mbedtls_rsa_check_privkey>
200298a2:	b108      	cbz	r0, 200298a8 <mbedtls_rsa_check_pub_priv+0x18>
200298a4:	4809      	ldr	r0, [pc, #36]	@ (200298cc <mbedtls_rsa_check_pub_priv+0x3c>)
200298a6:	bd38      	pop	{r3, r4, r5, pc}
200298a8:	f104 0108 	add.w	r1, r4, #8
200298ac:	f105 0008 	add.w	r0, r5, #8
200298b0:	f7fe fc54 	bl	2002815c <mbedtls_mpi_cmp_mpi>
200298b4:	2800      	cmp	r0, #0
200298b6:	d1f5      	bne.n	200298a4 <mbedtls_rsa_check_pub_priv+0x14>
200298b8:	f104 0114 	add.w	r1, r4, #20
200298bc:	f105 0014 	add.w	r0, r5, #20
200298c0:	f7fe fc4c 	bl	2002815c <mbedtls_mpi_cmp_mpi>
200298c4:	2800      	cmp	r0, #0
200298c6:	d0ee      	beq.n	200298a6 <mbedtls_rsa_check_pub_priv+0x16>
200298c8:	e7ec      	b.n	200298a4 <mbedtls_rsa_check_pub_priv+0x14>
200298ca:	bf00      	nop
200298cc:	ffffbe00 	.word	0xffffbe00

200298d0 <mbedtls_rsa_public>:
200298d0:	b5f0      	push	{r4, r5, r6, r7, lr}
200298d2:	460c      	mov	r4, r1
200298d4:	4605      	mov	r5, r0
200298d6:	b087      	sub	sp, #28
200298d8:	a803      	add	r0, sp, #12
200298da:	4616      	mov	r6, r2
200298dc:	f7fe f9e6 	bl	20027cac <mbedtls_mpi_init>
200298e0:	4621      	mov	r1, r4
200298e2:	686a      	ldr	r2, [r5, #4]
200298e4:	a803      	add	r0, sp, #12
200298e6:	f7fe faa9 	bl	20027e3c <mbedtls_mpi_read_binary>
200298ea:	4604      	mov	r4, r0
200298ec:	b9d0      	cbnz	r0, 20029924 <mbedtls_rsa_public+0x54>
200298ee:	f105 0408 	add.w	r4, r5, #8
200298f2:	4621      	mov	r1, r4
200298f4:	a803      	add	r0, sp, #12
200298f6:	f7fe fc31 	bl	2002815c <mbedtls_mpi_cmp_mpi>
200298fa:	2800      	cmp	r0, #0
200298fc:	da1b      	bge.n	20029936 <mbedtls_rsa_public+0x66>
200298fe:	f105 0368 	add.w	r3, r5, #104	@ 0x68
20029902:	a903      	add	r1, sp, #12
20029904:	686f      	ldr	r7, [r5, #4]
20029906:	4608      	mov	r0, r1
20029908:	9300      	str	r3, [sp, #0]
2002990a:	f105 0214 	add.w	r2, r5, #20
2002990e:	4623      	mov	r3, r4
20029910:	f7ff f81b 	bl	2002894a <mbedtls_mpi_exp_mod>
20029914:	4604      	mov	r4, r0
20029916:	b928      	cbnz	r0, 20029924 <mbedtls_rsa_public+0x54>
20029918:	463a      	mov	r2, r7
2002991a:	4631      	mov	r1, r6
2002991c:	a803      	add	r0, sp, #12
2002991e:	f7fe fac2 	bl	20027ea6 <mbedtls_mpi_write_binary>
20029922:	4604      	mov	r4, r0
20029924:	a803      	add	r0, sp, #12
20029926:	f7fe f9c8 	bl	20027cba <mbedtls_mpi_free>
2002992a:	b10c      	cbz	r4, 20029930 <mbedtls_rsa_public+0x60>
2002992c:	f5a4 4485 	sub.w	r4, r4, #17024	@ 0x4280
20029930:	4620      	mov	r0, r4
20029932:	b007      	add	sp, #28
20029934:	bdf0      	pop	{r4, r5, r6, r7, pc}
20029936:	f06f 0403 	mvn.w	r4, #3
2002993a:	e7f3      	b.n	20029924 <mbedtls_rsa_public+0x54>

2002993c <mbedtls_rsa_private>:
2002993c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029940:	461e      	mov	r6, r3
20029942:	6b43      	ldr	r3, [r0, #52]	@ 0x34
20029944:	4604      	mov	r4, r0
20029946:	460d      	mov	r5, r1
20029948:	4617      	mov	r7, r2
2002994a:	b09d      	sub	sp, #116	@ 0x74
2002994c:	2b00      	cmp	r3, #0
2002994e:	f000 8179 	beq.w	20029c44 <mbedtls_rsa_private+0x308>
20029952:	6c03      	ldr	r3, [r0, #64]	@ 0x40
20029954:	2b00      	cmp	r3, #0
20029956:	f000 8175 	beq.w	20029c44 <mbedtls_rsa_private+0x308>
2002995a:	6a83      	ldr	r3, [r0, #40]	@ 0x28
2002995c:	2b00      	cmp	r3, #0
2002995e:	f000 8171 	beq.w	20029c44 <mbedtls_rsa_private+0x308>
20029962:	a804      	add	r0, sp, #16
20029964:	f7fe f9a2 	bl	20027cac <mbedtls_mpi_init>
20029968:	a807      	add	r0, sp, #28
2002996a:	f7fe f99f 	bl	20027cac <mbedtls_mpi_init>
2002996e:	a80a      	add	r0, sp, #40	@ 0x28
20029970:	f7fe f99c 	bl	20027cac <mbedtls_mpi_init>
20029974:	a80d      	add	r0, sp, #52	@ 0x34
20029976:	f7fe f999 	bl	20027cac <mbedtls_mpi_init>
2002997a:	a810      	add	r0, sp, #64	@ 0x40
2002997c:	f7fe f996 	bl	20027cac <mbedtls_mpi_init>
20029980:	a813      	add	r0, sp, #76	@ 0x4c
20029982:	f7fe f993 	bl	20027cac <mbedtls_mpi_init>
20029986:	b12d      	cbz	r5, 20029994 <mbedtls_rsa_private+0x58>
20029988:	a816      	add	r0, sp, #88	@ 0x58
2002998a:	f7fe f98f 	bl	20027cac <mbedtls_mpi_init>
2002998e:	a819      	add	r0, sp, #100	@ 0x64
20029990:	f7fe f98c 	bl	20027cac <mbedtls_mpi_init>
20029994:	4631      	mov	r1, r6
20029996:	6862      	ldr	r2, [r4, #4]
20029998:	a804      	add	r0, sp, #16
2002999a:	f7fe fa4f 	bl	20027e3c <mbedtls_mpi_read_binary>
2002999e:	4603      	mov	r3, r0
200299a0:	2800      	cmp	r0, #0
200299a2:	f040 80e0 	bne.w	20029b66 <mbedtls_rsa_private+0x22a>
200299a6:	f104 0608 	add.w	r6, r4, #8
200299aa:	4631      	mov	r1, r6
200299ac:	a804      	add	r0, sp, #16
200299ae:	f7fe fbd5 	bl	2002815c <mbedtls_mpi_cmp_mpi>
200299b2:	2800      	cmp	r0, #0
200299b4:	f280 8143 	bge.w	20029c3e <mbedtls_rsa_private+0x302>
200299b8:	f104 0a44 	add.w	sl, r4, #68	@ 0x44
200299bc:	f104 0950 	add.w	r9, r4, #80	@ 0x50
200299c0:	2d00      	cmp	r5, #0
200299c2:	f000 8089 	beq.w	20029ad8 <mbedtls_rsa_private+0x19c>
200299c6:	f8d4 30a0 	ldr.w	r3, [r4, #160]	@ 0xa0
200299ca:	2b00      	cmp	r3, #0
200299cc:	f000 80f4 	beq.w	20029bb8 <mbedtls_rsa_private+0x27c>
200299d0:	f104 088c 	add.w	r8, r4, #140	@ 0x8c
200299d4:	4642      	mov	r2, r8
200299d6:	4641      	mov	r1, r8
200299d8:	4640      	mov	r0, r8
200299da:	f7fe fd0f 	bl	200283fc <mbedtls_mpi_mul_mpi>
200299de:	4603      	mov	r3, r0
200299e0:	2800      	cmp	r0, #0
200299e2:	f040 80c0 	bne.w	20029b66 <mbedtls_rsa_private+0x22a>
200299e6:	4632      	mov	r2, r6
200299e8:	4641      	mov	r1, r8
200299ea:	4640      	mov	r0, r8
200299ec:	f7fe ff7b 	bl	200288e6 <mbedtls_mpi_mod_mpi>
200299f0:	4603      	mov	r3, r0
200299f2:	2800      	cmp	r0, #0
200299f4:	f040 80b7 	bne.w	20029b66 <mbedtls_rsa_private+0x22a>
200299f8:	f104 0898 	add.w	r8, r4, #152	@ 0x98
200299fc:	4642      	mov	r2, r8
200299fe:	4641      	mov	r1, r8
20029a00:	4640      	mov	r0, r8
20029a02:	f7fe fcfb 	bl	200283fc <mbedtls_mpi_mul_mpi>
20029a06:	4603      	mov	r3, r0
20029a08:	2800      	cmp	r0, #0
20029a0a:	f040 80ac 	bne.w	20029b66 <mbedtls_rsa_private+0x22a>
20029a0e:	4632      	mov	r2, r6
20029a10:	4641      	mov	r1, r8
20029a12:	4640      	mov	r0, r8
20029a14:	f7fe ff67 	bl	200288e6 <mbedtls_mpi_mod_mpi>
20029a18:	4603      	mov	r3, r0
20029a1a:	2800      	cmp	r0, #0
20029a1c:	f040 80a3 	bne.w	20029b66 <mbedtls_rsa_private+0x22a>
20029a20:	a904      	add	r1, sp, #16
20029a22:	4608      	mov	r0, r1
20029a24:	f104 028c 	add.w	r2, r4, #140	@ 0x8c
20029a28:	f7fe fce8 	bl	200283fc <mbedtls_mpi_mul_mpi>
20029a2c:	4603      	mov	r3, r0
20029a2e:	2800      	cmp	r0, #0
20029a30:	f040 8099 	bne.w	20029b66 <mbedtls_rsa_private+0x22a>
20029a34:	a904      	add	r1, sp, #16
20029a36:	4632      	mov	r2, r6
20029a38:	4608      	mov	r0, r1
20029a3a:	f7fe ff54 	bl	200288e6 <mbedtls_mpi_mod_mpi>
20029a3e:	4603      	mov	r3, r0
20029a40:	2800      	cmp	r0, #0
20029a42:	f040 8090 	bne.w	20029b66 <mbedtls_rsa_private+0x22a>
20029a46:	2201      	movs	r2, #1
20029a48:	f104 012c 	add.w	r1, r4, #44	@ 0x2c
20029a4c:	a80d      	add	r0, sp, #52	@ 0x34
20029a4e:	f7fe fcbf 	bl	200283d0 <mbedtls_mpi_sub_int>
20029a52:	4603      	mov	r3, r0
20029a54:	2800      	cmp	r0, #0
20029a56:	f040 8086 	bne.w	20029b66 <mbedtls_rsa_private+0x22a>
20029a5a:	2201      	movs	r2, #1
20029a5c:	f104 0138 	add.w	r1, r4, #56	@ 0x38
20029a60:	a810      	add	r0, sp, #64	@ 0x40
20029a62:	f7fe fcb5 	bl	200283d0 <mbedtls_mpi_sub_int>
20029a66:	4603      	mov	r3, r0
20029a68:	2800      	cmp	r0, #0
20029a6a:	d17c      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029a6c:	463b      	mov	r3, r7
20029a6e:	462a      	mov	r2, r5
20029a70:	211c      	movs	r1, #28
20029a72:	a813      	add	r0, sp, #76	@ 0x4c
20029a74:	f7ff f9fb 	bl	20028e6e <mbedtls_mpi_fill_random>
20029a78:	4603      	mov	r3, r0
20029a7a:	2800      	cmp	r0, #0
20029a7c:	d173      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029a7e:	aa13      	add	r2, sp, #76	@ 0x4c
20029a80:	a90d      	add	r1, sp, #52	@ 0x34
20029a82:	a816      	add	r0, sp, #88	@ 0x58
20029a84:	f7fe fcba 	bl	200283fc <mbedtls_mpi_mul_mpi>
20029a88:	4603      	mov	r3, r0
20029a8a:	2800      	cmp	r0, #0
20029a8c:	d16b      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029a8e:	a916      	add	r1, sp, #88	@ 0x58
20029a90:	4652      	mov	r2, sl
20029a92:	4608      	mov	r0, r1
20029a94:	f7fe fc4f 	bl	20028336 <mbedtls_mpi_add_mpi>
20029a98:	4603      	mov	r3, r0
20029a9a:	2800      	cmp	r0, #0
20029a9c:	d163      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029a9e:	463b      	mov	r3, r7
20029aa0:	462a      	mov	r2, r5
20029aa2:	211c      	movs	r1, #28
20029aa4:	a813      	add	r0, sp, #76	@ 0x4c
20029aa6:	f7ff f9e2 	bl	20028e6e <mbedtls_mpi_fill_random>
20029aaa:	4603      	mov	r3, r0
20029aac:	2800      	cmp	r0, #0
20029aae:	d15a      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029ab0:	aa13      	add	r2, sp, #76	@ 0x4c
20029ab2:	a910      	add	r1, sp, #64	@ 0x40
20029ab4:	a819      	add	r0, sp, #100	@ 0x64
20029ab6:	f7fe fca1 	bl	200283fc <mbedtls_mpi_mul_mpi>
20029aba:	4603      	mov	r3, r0
20029abc:	2800      	cmp	r0, #0
20029abe:	d152      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029ac0:	a919      	add	r1, sp, #100	@ 0x64
20029ac2:	464a      	mov	r2, r9
20029ac4:	4608      	mov	r0, r1
20029ac6:	f7fe fc36 	bl	20028336 <mbedtls_mpi_add_mpi>
20029aca:	4603      	mov	r3, r0
20029acc:	2800      	cmp	r0, #0
20029ace:	d14a      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029ad0:	f10d 0964 	add.w	r9, sp, #100	@ 0x64
20029ad4:	f10d 0a58 	add.w	sl, sp, #88	@ 0x58
20029ad8:	f104 0374 	add.w	r3, r4, #116	@ 0x74
20029adc:	f104 082c 	add.w	r8, r4, #44	@ 0x2c
20029ae0:	9300      	str	r3, [sp, #0]
20029ae2:	4652      	mov	r2, sl
20029ae4:	4643      	mov	r3, r8
20029ae6:	a904      	add	r1, sp, #16
20029ae8:	a807      	add	r0, sp, #28
20029aea:	f7fe ff2e 	bl	2002894a <mbedtls_mpi_exp_mod>
20029aee:	4603      	mov	r3, r0
20029af0:	2800      	cmp	r0, #0
20029af2:	d138      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029af4:	f104 0380 	add.w	r3, r4, #128	@ 0x80
20029af8:	f104 0738 	add.w	r7, r4, #56	@ 0x38
20029afc:	9300      	str	r3, [sp, #0]
20029afe:	464a      	mov	r2, r9
20029b00:	463b      	mov	r3, r7
20029b02:	a904      	add	r1, sp, #16
20029b04:	a80a      	add	r0, sp, #40	@ 0x28
20029b06:	f7fe ff20 	bl	2002894a <mbedtls_mpi_exp_mod>
20029b0a:	4603      	mov	r3, r0
20029b0c:	bb58      	cbnz	r0, 20029b66 <mbedtls_rsa_private+0x22a>
20029b0e:	aa0a      	add	r2, sp, #40	@ 0x28
20029b10:	a907      	add	r1, sp, #28
20029b12:	a804      	add	r0, sp, #16
20029b14:	f7fe fc35 	bl	20028382 <mbedtls_mpi_sub_mpi>
20029b18:	4603      	mov	r3, r0
20029b1a:	bb20      	cbnz	r0, 20029b66 <mbedtls_rsa_private+0x22a>
20029b1c:	f104 025c 	add.w	r2, r4, #92	@ 0x5c
20029b20:	a904      	add	r1, sp, #16
20029b22:	a807      	add	r0, sp, #28
20029b24:	f7fe fc6a 	bl	200283fc <mbedtls_mpi_mul_mpi>
20029b28:	4603      	mov	r3, r0
20029b2a:	b9e0      	cbnz	r0, 20029b66 <mbedtls_rsa_private+0x22a>
20029b2c:	4642      	mov	r2, r8
20029b2e:	a907      	add	r1, sp, #28
20029b30:	a804      	add	r0, sp, #16
20029b32:	f7fe fed8 	bl	200288e6 <mbedtls_mpi_mod_mpi>
20029b36:	4603      	mov	r3, r0
20029b38:	b9a8      	cbnz	r0, 20029b66 <mbedtls_rsa_private+0x22a>
20029b3a:	463a      	mov	r2, r7
20029b3c:	a904      	add	r1, sp, #16
20029b3e:	a807      	add	r0, sp, #28
20029b40:	f7fe fc5c 	bl	200283fc <mbedtls_mpi_mul_mpi>
20029b44:	4603      	mov	r3, r0
20029b46:	b970      	cbnz	r0, 20029b66 <mbedtls_rsa_private+0x22a>
20029b48:	aa07      	add	r2, sp, #28
20029b4a:	a90a      	add	r1, sp, #40	@ 0x28
20029b4c:	a804      	add	r0, sp, #16
20029b4e:	f7fe fbf2 	bl	20028336 <mbedtls_mpi_add_mpi>
20029b52:	4603      	mov	r3, r0
20029b54:	b938      	cbnz	r0, 20029b66 <mbedtls_rsa_private+0x22a>
20029b56:	2d00      	cmp	r5, #0
20029b58:	d15f      	bne.n	20029c1a <mbedtls_rsa_private+0x2de>
20029b5a:	6862      	ldr	r2, [r4, #4]
20029b5c:	9926      	ldr	r1, [sp, #152]	@ 0x98
20029b5e:	a804      	add	r0, sp, #16
20029b60:	f7fe f9a1 	bl	20027ea6 <mbedtls_mpi_write_binary>
20029b64:	4603      	mov	r3, r0
20029b66:	a804      	add	r0, sp, #16
20029b68:	9303      	str	r3, [sp, #12]
20029b6a:	f7fe f8a6 	bl	20027cba <mbedtls_mpi_free>
20029b6e:	a807      	add	r0, sp, #28
20029b70:	f7fe f8a3 	bl	20027cba <mbedtls_mpi_free>
20029b74:	a80a      	add	r0, sp, #40	@ 0x28
20029b76:	f7fe f8a0 	bl	20027cba <mbedtls_mpi_free>
20029b7a:	a80d      	add	r0, sp, #52	@ 0x34
20029b7c:	f7fe f89d 	bl	20027cba <mbedtls_mpi_free>
20029b80:	a810      	add	r0, sp, #64	@ 0x40
20029b82:	f7fe f89a 	bl	20027cba <mbedtls_mpi_free>
20029b86:	a813      	add	r0, sp, #76	@ 0x4c
20029b88:	f7fe f897 	bl	20027cba <mbedtls_mpi_free>
20029b8c:	9b03      	ldr	r3, [sp, #12]
20029b8e:	b135      	cbz	r5, 20029b9e <mbedtls_rsa_private+0x262>
20029b90:	a816      	add	r0, sp, #88	@ 0x58
20029b92:	f7fe f892 	bl	20027cba <mbedtls_mpi_free>
20029b96:	a819      	add	r0, sp, #100	@ 0x64
20029b98:	f7fe f88f 	bl	20027cba <mbedtls_mpi_free>
20029b9c:	9b03      	ldr	r3, [sp, #12]
20029b9e:	b10b      	cbz	r3, 20029ba4 <mbedtls_rsa_private+0x268>
20029ba0:	f5a3 4386 	sub.w	r3, r3, #17152	@ 0x4300
20029ba4:	4618      	mov	r0, r3
20029ba6:	b01d      	add	sp, #116	@ 0x74
20029ba8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20029bac:	9b03      	ldr	r3, [sp, #12]
20029bae:	3b01      	subs	r3, #1
20029bb0:	9303      	str	r3, [sp, #12]
20029bb2:	d107      	bne.n	20029bc4 <mbedtls_rsa_private+0x288>
20029bb4:	4b24      	ldr	r3, [pc, #144]	@ (20029c48 <mbedtls_rsa_private+0x30c>)
20029bb6:	e7d6      	b.n	20029b66 <mbedtls_rsa_private+0x22a>
20029bb8:	230b      	movs	r3, #11
20029bba:	f104 0b98 	add.w	fp, r4, #152	@ 0x98
20029bbe:	9303      	str	r3, [sp, #12]
20029bc0:	f104 088c 	add.w	r8, r4, #140	@ 0x8c
20029bc4:	6861      	ldr	r1, [r4, #4]
20029bc6:	463b      	mov	r3, r7
20029bc8:	462a      	mov	r2, r5
20029bca:	4658      	mov	r0, fp
20029bcc:	3901      	subs	r1, #1
20029bce:	f7ff f94e 	bl	20028e6e <mbedtls_mpi_fill_random>
20029bd2:	4603      	mov	r3, r0
20029bd4:	2800      	cmp	r0, #0
20029bd6:	d1c6      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029bd8:	4632      	mov	r2, r6
20029bda:	4659      	mov	r1, fp
20029bdc:	4640      	mov	r0, r8
20029bde:	f7ff f8c8 	bl	20028d72 <mbedtls_mpi_gcd>
20029be2:	4603      	mov	r3, r0
20029be4:	2800      	cmp	r0, #0
20029be6:	d1be      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029be8:	2101      	movs	r1, #1
20029bea:	4640      	mov	r0, r8
20029bec:	f7fe faf7 	bl	200281de <mbedtls_mpi_cmp_int>
20029bf0:	2800      	cmp	r0, #0
20029bf2:	d1db      	bne.n	20029bac <mbedtls_rsa_private+0x270>
20029bf4:	4632      	mov	r2, r6
20029bf6:	4659      	mov	r1, fp
20029bf8:	4640      	mov	r0, r8
20029bfa:	f7ff f955 	bl	20028ea8 <mbedtls_mpi_inv_mod>
20029bfe:	4603      	mov	r3, r0
20029c00:	2800      	cmp	r0, #0
20029c02:	d1b0      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029c04:	f104 0368 	add.w	r3, r4, #104	@ 0x68
20029c08:	9300      	str	r3, [sp, #0]
20029c0a:	4641      	mov	r1, r8
20029c0c:	4633      	mov	r3, r6
20029c0e:	4640      	mov	r0, r8
20029c10:	f104 0214 	add.w	r2, r4, #20
20029c14:	f7fe fe99 	bl	2002894a <mbedtls_mpi_exp_mod>
20029c18:	e6fe      	b.n	20029a18 <mbedtls_rsa_private+0xdc>
20029c1a:	a904      	add	r1, sp, #16
20029c1c:	4608      	mov	r0, r1
20029c1e:	f104 0298 	add.w	r2, r4, #152	@ 0x98
20029c22:	f7fe fbeb 	bl	200283fc <mbedtls_mpi_mul_mpi>
20029c26:	4603      	mov	r3, r0
20029c28:	2800      	cmp	r0, #0
20029c2a:	d19c      	bne.n	20029b66 <mbedtls_rsa_private+0x22a>
20029c2c:	a904      	add	r1, sp, #16
20029c2e:	4632      	mov	r2, r6
20029c30:	4608      	mov	r0, r1
20029c32:	f7fe fe58 	bl	200288e6 <mbedtls_mpi_mod_mpi>
20029c36:	4603      	mov	r3, r0
20029c38:	2800      	cmp	r0, #0
20029c3a:	d08e      	beq.n	20029b5a <mbedtls_rsa_private+0x21e>
20029c3c:	e793      	b.n	20029b66 <mbedtls_rsa_private+0x22a>
20029c3e:	f06f 0303 	mvn.w	r3, #3
20029c42:	e790      	b.n	20029b66 <mbedtls_rsa_private+0x22a>
20029c44:	4b01      	ldr	r3, [pc, #4]	@ (20029c4c <mbedtls_rsa_private+0x310>)
20029c46:	e7ad      	b.n	20029ba4 <mbedtls_rsa_private+0x268>
20029c48:	ffffbb80 	.word	0xffffbb80
20029c4c:	ffffbf80 	.word	0xffffbf80

20029c50 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt>:
20029c50:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029c54:	4698      	mov	r8, r3
20029c56:	e9dd a30c 	ldrd	sl, r3, [sp, #48]	@ 0x30
20029c5a:	f1b8 0f01 	cmp.w	r8, #1
20029c5e:	4606      	mov	r6, r0
20029c60:	460f      	mov	r7, r1
20029c62:	4691      	mov	r9, r2
20029c64:	9d0e      	ldr	r5, [sp, #56]	@ 0x38
20029c66:	d103      	bne.n	20029c70 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x20>
20029c68:	f8d0 20a4 	ldr.w	r2, [r0, #164]	@ 0xa4
20029c6c:	2a00      	cmp	r2, #0
20029c6e:	d162      	bne.n	20029d36 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c70:	2f00      	cmp	r7, #0
20029c72:	d060      	beq.n	20029d36 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c74:	2b00      	cmp	r3, #0
20029c76:	d05e      	beq.n	20029d36 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c78:	2d00      	cmp	r5, #0
20029c7a:	d05c      	beq.n	20029d36 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c7c:	f11a 0f0c 	cmn.w	sl, #12
20029c80:	6874      	ldr	r4, [r6, #4]
20029c82:	d858      	bhi.n	20029d36 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c84:	f10a 020b 	add.w	r2, sl, #11
20029c88:	42a2      	cmp	r2, r4
20029c8a:	d854      	bhi.n	20029d36 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c8c:	4629      	mov	r1, r5
20029c8e:	2200      	movs	r2, #0
20029c90:	eba4 040a 	sub.w	r4, r4, sl
20029c94:	3c03      	subs	r4, #3
20029c96:	f801 2b02 	strb.w	r2, [r1], #2
20029c9a:	f1b8 0f00 	cmp.w	r8, #0
20029c9e:	d131      	bne.n	20029d04 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xb4>
20029ca0:	2202      	movs	r2, #2
20029ca2:	4414      	add	r4, r2
20029ca4:	706a      	strb	r2, [r5, #1]
20029ca6:	442c      	add	r4, r5
20029ca8:	42a1      	cmp	r1, r4
20029caa:	d112      	bne.n	20029cd2 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x82>
20029cac:	2200      	movs	r2, #0
20029cae:	4620      	mov	r0, r4
20029cb0:	4619      	mov	r1, r3
20029cb2:	f800 2b01 	strb.w	r2, [r0], #1
20029cb6:	4652      	mov	r2, sl
20029cb8:	f000 fdc2 	bl	2002a840 <memcpy>
20029cbc:	f1b8 0f00 	cmp.w	r8, #0
20029cc0:	d12f      	bne.n	20029d22 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xd2>
20029cc2:	462a      	mov	r2, r5
20029cc4:	4629      	mov	r1, r5
20029cc6:	4630      	mov	r0, r6
20029cc8:	b003      	add	sp, #12
20029cca:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029cce:	f7ff bdff 	b.w	200298d0 <mbedtls_rsa_public>
20029cd2:	f04f 0b64 	mov.w	fp, #100	@ 0x64
20029cd6:	2201      	movs	r2, #1
20029cd8:	4648      	mov	r0, r9
20029cda:	9301      	str	r3, [sp, #4]
20029cdc:	9100      	str	r1, [sp, #0]
20029cde:	47b8      	blx	r7
20029ce0:	9900      	ldr	r1, [sp, #0]
20029ce2:	9b01      	ldr	r3, [sp, #4]
20029ce4:	780a      	ldrb	r2, [r1, #0]
20029ce6:	b94a      	cbnz	r2, 20029cfc <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xac>
20029ce8:	f1bb 0b01 	subs.w	fp, fp, #1
20029cec:	d001      	beq.n	20029cf2 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xa2>
20029cee:	2800      	cmp	r0, #0
20029cf0:	d0f1      	beq.n	20029cd6 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x86>
20029cf2:	f5a0 4089 	sub.w	r0, r0, #17536	@ 0x4480
20029cf6:	b003      	add	sp, #12
20029cf8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20029cfc:	2800      	cmp	r0, #0
20029cfe:	d1f8      	bne.n	20029cf2 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xa2>
20029d00:	3101      	adds	r1, #1
20029d02:	e7d1      	b.n	20029ca8 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x58>
20029d04:	2001      	movs	r0, #1
20029d06:	462a      	mov	r2, r5
20029d08:	f04f 0cff 	mov.w	ip, #255	@ 0xff
20029d0c:	f802 0f01 	strb.w	r0, [r2, #1]!
20029d10:	1820      	adds	r0, r4, r0
20029d12:	4428      	add	r0, r5
20029d14:	4282      	cmp	r2, r0
20029d16:	d101      	bne.n	20029d1c <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xcc>
20029d18:	440c      	add	r4, r1
20029d1a:	e7c7      	b.n	20029cac <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x5c>
20029d1c:	f802 cf01 	strb.w	ip, [r2, #1]!
20029d20:	e7f8      	b.n	20029d14 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xc4>
20029d22:	462b      	mov	r3, r5
20029d24:	464a      	mov	r2, r9
20029d26:	4639      	mov	r1, r7
20029d28:	4630      	mov	r0, r6
20029d2a:	950c      	str	r5, [sp, #48]	@ 0x30
20029d2c:	b003      	add	sp, #12
20029d2e:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029d32:	f7ff be03 	b.w	2002993c <mbedtls_rsa_private>
20029d36:	4801      	ldr	r0, [pc, #4]	@ (20029d3c <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xec>)
20029d38:	e7dd      	b.n	20029cf6 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xa6>
20029d3a:	bf00      	nop
20029d3c:	ffffbf80 	.word	0xffffbf80

20029d40 <mbedtls_rsa_pkcs1_encrypt>:
20029d40:	b410      	push	{r4}
20029d42:	f8d0 40a4 	ldr.w	r4, [r0, #164]	@ 0xa4
20029d46:	b91c      	cbnz	r4, 20029d50 <mbedtls_rsa_pkcs1_encrypt+0x10>
20029d48:	f85d 4b04 	ldr.w	r4, [sp], #4
20029d4c:	f7ff bf80 	b.w	20029c50 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt>
20029d50:	4801      	ldr	r0, [pc, #4]	@ (20029d58 <mbedtls_rsa_pkcs1_encrypt+0x18>)
20029d52:	f85d 4b04 	ldr.w	r4, [sp], #4
20029d56:	4770      	bx	lr
20029d58:	ffffbf00 	.word	0xffffbf00

20029d5c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt>:
20029d5c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20029d60:	4698      	mov	r8, r3
20029d62:	f5ad 6d81 	sub.w	sp, sp, #1032	@ 0x408
20029d66:	f1b8 0f01 	cmp.w	r8, #1
20029d6a:	f8dd 3424 	ldr.w	r3, [sp, #1060]	@ 0x424
20029d6e:	d103      	bne.n	20029d78 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x1c>
20029d70:	f8d0 40a4 	ldr.w	r4, [r0, #164]	@ 0xa4
20029d74:	2c00      	cmp	r4, #0
20029d76:	d17c      	bne.n	20029e72 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x116>
20029d78:	6845      	ldr	r5, [r0, #4]
20029d7a:	f1a5 0410 	sub.w	r4, r5, #16
20029d7e:	f5b4 7f7c 	cmp.w	r4, #1008	@ 0x3f0
20029d82:	d876      	bhi.n	20029e72 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x116>
20029d84:	ae02      	add	r6, sp, #8
20029d86:	f1b8 0f00 	cmp.w	r8, #0
20029d8a:	d153      	bne.n	20029e34 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xd8>
20029d8c:	4632      	mov	r2, r6
20029d8e:	4619      	mov	r1, r3
20029d90:	f7ff fd9e 	bl	200298d0 <mbedtls_rsa_public>
20029d94:	4604      	mov	r4, r0
20029d96:	2800      	cmp	r0, #0
20029d98:	d140      	bne.n	20029e1c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc0>
20029d9a:	f1b8 0f01 	cmp.w	r8, #1
20029d9e:	7831      	ldrb	r1, [r6, #0]
20029da0:	7872      	ldrb	r2, [r6, #1]
20029da2:	f1a5 0703 	sub.w	r7, r5, #3
20029da6:	d149      	bne.n	20029e3c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xe0>
20029da8:	f082 0202 	eor.w	r2, r2, #2
20029dac:	ea41 0302 	orr.w	r3, r1, r2
20029db0:	4684      	mov	ip, r0
20029db2:	4686      	mov	lr, r0
20029db4:	4602      	mov	r2, r0
20029db6:	f10d 0109 	add.w	r1, sp, #9
20029dba:	f811 0f01 	ldrb.w	r0, [r1, #1]!
20029dbe:	f10e 0e01 	add.w	lr, lr, #1
20029dc2:	f1c0 0800 	rsb	r8, r0, #0
20029dc6:	ea40 0008 	orr.w	r0, r0, r8
20029dca:	f3c0 10c0 	ubfx	r0, r0, #7, #1
20029dce:	f080 0001 	eor.w	r0, r0, #1
20029dd2:	ea4c 0c00 	orr.w	ip, ip, r0
20029dd6:	f1cc 0000 	rsb	r0, ip, #0
20029dda:	ea4c 0000 	orr.w	r0, ip, r0
20029dde:	f3c0 10c0 	ubfx	r0, r0, #7, #1
20029de2:	f080 0001 	eor.w	r0, r0, #1
20029de6:	45be      	cmp	lr, r7
20029de8:	4402      	add	r2, r0
20029dea:	d3e6      	bcc.n	20029dba <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x5e>
20029dec:	f10d 000a 	add.w	r0, sp, #10
20029df0:	1881      	adds	r1, r0, r2
20029df2:	5c80      	ldrb	r0, [r0, r2]
20029df4:	3101      	adds	r1, #1
20029df6:	4303      	orrs	r3, r0
20029df8:	2a07      	cmp	r2, #7
20029dfa:	bf98      	it	ls
20029dfc:	f043 0301 	orrls.w	r3, r3, #1
20029e00:	bb9b      	cbnz	r3, 20029e6a <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x10e>
20029e02:	1b8b      	subs	r3, r1, r6
20029e04:	1aea      	subs	r2, r5, r3
20029e06:	f8dd 342c 	ldr.w	r3, [sp, #1068]	@ 0x42c
20029e0a:	429a      	cmp	r2, r3
20029e0c:	d82f      	bhi.n	20029e6e <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x112>
20029e0e:	f8dd 3420 	ldr.w	r3, [sp, #1056]	@ 0x420
20029e12:	f8dd 0428 	ldr.w	r0, [sp, #1064]	@ 0x428
20029e16:	601a      	str	r2, [r3, #0]
20029e18:	f000 fd12 	bl	2002a840 <memcpy>
20029e1c:	2300      	movs	r3, #0
20029e1e:	461a      	mov	r2, r3
20029e20:	54f2      	strb	r2, [r6, r3]
20029e22:	3301      	adds	r3, #1
20029e24:	f5b3 6f80 	cmp.w	r3, #1024	@ 0x400
20029e28:	d1fa      	bne.n	20029e20 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc4>
20029e2a:	4620      	mov	r0, r4
20029e2c:	f50d 6d81 	add.w	sp, sp, #1032	@ 0x408
20029e30:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20029e34:	9600      	str	r6, [sp, #0]
20029e36:	f7ff fd81 	bl	2002993c <mbedtls_rsa_private>
20029e3a:	e7ab      	b.n	20029d94 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x38>
20029e3c:	f082 0201 	eor.w	r2, r2, #1
20029e40:	ea41 0302 	orr.w	r3, r1, r2
20029e44:	4684      	mov	ip, r0
20029e46:	4602      	mov	r2, r0
20029e48:	f10d 0109 	add.w	r1, sp, #9
20029e4c:	f811 ef01 	ldrb.w	lr, [r1, #1]!
20029e50:	3001      	adds	r0, #1
20029e52:	f1be 0fff 	cmp.w	lr, #255	@ 0xff
20029e56:	bf18      	it	ne
20029e58:	f04c 0c01 	orrne.w	ip, ip, #1
20029e5c:	42b8      	cmp	r0, r7
20029e5e:	f08c 0e01 	eor.w	lr, ip, #1
20029e62:	fa52 f28e 	uxtab	r2, r2, lr
20029e66:	d3f1      	bcc.n	20029e4c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xf0>
20029e68:	e7c0      	b.n	20029dec <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x90>
20029e6a:	4c03      	ldr	r4, [pc, #12]	@ (20029e78 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x11c>)
20029e6c:	e7d6      	b.n	20029e1c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc0>
20029e6e:	4c03      	ldr	r4, [pc, #12]	@ (20029e7c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x120>)
20029e70:	e7d4      	b.n	20029e1c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc0>
20029e72:	4c03      	ldr	r4, [pc, #12]	@ (20029e80 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x124>)
20029e74:	e7d9      	b.n	20029e2a <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xce>
20029e76:	bf00      	nop
20029e78:	ffffbf00 	.word	0xffffbf00
20029e7c:	ffffbc00 	.word	0xffffbc00
20029e80:	ffffbf80 	.word	0xffffbf80

20029e84 <mbedtls_rsa_pkcs1_decrypt>:
20029e84:	b410      	push	{r4}
20029e86:	f8d0 40a4 	ldr.w	r4, [r0, #164]	@ 0xa4
20029e8a:	b91c      	cbnz	r4, 20029e94 <mbedtls_rsa_pkcs1_decrypt+0x10>
20029e8c:	f85d 4b04 	ldr.w	r4, [sp], #4
20029e90:	f7ff bf64 	b.w	20029d5c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt>
20029e94:	4801      	ldr	r0, [pc, #4]	@ (20029e9c <mbedtls_rsa_pkcs1_decrypt+0x18>)
20029e96:	f85d 4b04 	ldr.w	r4, [sp], #4
20029e9a:	4770      	bx	lr
20029e9c:	ffffbf00 	.word	0xffffbf00

20029ea0 <mbedtls_rsa_rsassa_pkcs1_v15_sign>:
20029ea0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029ea4:	4692      	mov	sl, r2
20029ea6:	2200      	movs	r2, #0
20029ea8:	b089      	sub	sp, #36	@ 0x24
20029eaa:	2b01      	cmp	r3, #1
20029eac:	4604      	mov	r4, r0
20029eae:	461f      	mov	r7, r3
20029eb0:	e9cd 2206 	strd	r2, r2, [sp, #24]
20029eb4:	f89d 8048 	ldrb.w	r8, [sp, #72]	@ 0x48
20029eb8:	f8dd 904c 	ldr.w	r9, [sp, #76]	@ 0x4c
20029ebc:	9e15      	ldr	r6, [sp, #84]	@ 0x54
20029ebe:	9102      	str	r1, [sp, #8]
20029ec0:	d107      	bne.n	20029ed2 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x32>
20029ec2:	f8d0 20a4 	ldr.w	r2, [r0, #164]	@ 0xa4
20029ec6:	b122      	cbz	r2, 20029ed2 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x32>
20029ec8:	4d59      	ldr	r5, [pc, #356]	@ (2002a030 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x190>)
20029eca:	4628      	mov	r0, r5
20029ecc:	b009      	add	sp, #36	@ 0x24
20029ece:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20029ed2:	f8d4 b004 	ldr.w	fp, [r4, #4]
20029ed6:	f1ab 0503 	sub.w	r5, fp, #3
20029eda:	f1b8 0f00 	cmp.w	r8, #0
20029ede:	d014      	beq.n	20029f0a <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x6a>
20029ee0:	4640      	mov	r0, r8
20029ee2:	f7fb ff77 	bl	20025dd4 <mbedtls_md_info_from_type>
20029ee6:	4681      	mov	r9, r0
20029ee8:	2800      	cmp	r0, #0
20029eea:	d0ed      	beq.n	20029ec8 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029eec:	4640      	mov	r0, r8
20029eee:	aa06      	add	r2, sp, #24
20029ef0:	a907      	add	r1, sp, #28
20029ef2:	f7ff f9d3 	bl	2002929c <mbedtls_oid_get_oid_by_md>
20029ef6:	2800      	cmp	r0, #0
20029ef8:	d1e6      	bne.n	20029ec8 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029efa:	9a06      	ldr	r2, [sp, #24]
20029efc:	4648      	mov	r0, r9
20029efe:	1aaa      	subs	r2, r5, r2
20029f00:	f1a2 050a 	sub.w	r5, r2, #10
20029f04:	f7fb ff72 	bl	20025dec <mbedtls_md_get_size>
20029f08:	4681      	mov	r9, r0
20029f0a:	eba5 0209 	sub.w	r2, r5, r9
20029f0e:	2a07      	cmp	r2, #7
20029f10:	d9da      	bls.n	20029ec8 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029f12:	4593      	cmp	fp, r2
20029f14:	d3d8      	bcc.n	20029ec8 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029f16:	46b3      	mov	fp, r6
20029f18:	2500      	movs	r5, #0
20029f1a:	2101      	movs	r1, #1
20029f1c:	f80b 5b02 	strb.w	r5, [fp], #2
20029f20:	4658      	mov	r0, fp
20029f22:	7071      	strb	r1, [r6, #1]
20029f24:	21ff      	movs	r1, #255	@ 0xff
20029f26:	9203      	str	r2, [sp, #12]
20029f28:	f000 fc70 	bl	2002a80c <memset>
20029f2c:	9a03      	ldr	r2, [sp, #12]
20029f2e:	eb0b 0002 	add.w	r0, fp, r2
20029f32:	f80b 5002 	strb.w	r5, [fp, r2]
20029f36:	f1b8 0f00 	cmp.w	r8, #0
20029f3a:	d10c      	bne.n	20029f56 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0xb6>
20029f3c:	464a      	mov	r2, r9
20029f3e:	9914      	ldr	r1, [sp, #80]	@ 0x50
20029f40:	3001      	adds	r0, #1
20029f42:	f000 fc7d 	bl	2002a840 <memcpy>
20029f46:	bb8f      	cbnz	r7, 20029fac <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x10c>
20029f48:	4632      	mov	r2, r6
20029f4a:	4631      	mov	r1, r6
20029f4c:	4620      	mov	r0, r4
20029f4e:	f7ff fcbf 	bl	200298d0 <mbedtls_rsa_public>
20029f52:	4605      	mov	r5, r0
20029f54:	e7b9      	b.n	20029eca <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x2a>
20029f56:	2130      	movs	r1, #48	@ 0x30
20029f58:	7041      	strb	r1, [r0, #1]
20029f5a:	9a06      	ldr	r2, [sp, #24]
20029f5c:	70c1      	strb	r1, [r0, #3]
20029f5e:	3208      	adds	r2, #8
20029f60:	fa52 f289 	uxtab	r2, r2, r9
20029f64:	7082      	strb	r2, [r0, #2]
20029f66:	9a06      	ldr	r2, [sp, #24]
20029f68:	f100 0807 	add.w	r8, r0, #7
20029f6c:	b2d1      	uxtb	r1, r2
20029f6e:	f101 0c04 	add.w	ip, r1, #4
20029f72:	f880 c004 	strb.w	ip, [r0, #4]
20029f76:	f04f 0c06 	mov.w	ip, #6
20029f7a:	7181      	strb	r1, [r0, #6]
20029f7c:	f880 c005 	strb.w	ip, [r0, #5]
20029f80:	9907      	ldr	r1, [sp, #28]
20029f82:	4640      	mov	r0, r8
20029f84:	9203      	str	r2, [sp, #12]
20029f86:	f000 fc5b 	bl	2002a840 <memcpy>
20029f8a:	2105      	movs	r1, #5
20029f8c:	9a03      	ldr	r2, [sp, #12]
20029f8e:	fa5f fb89 	uxtb.w	fp, r9
20029f92:	eb08 0002 	add.w	r0, r8, r2
20029f96:	f808 1002 	strb.w	r1, [r8, r2]
20029f9a:	2204      	movs	r2, #4
20029f9c:	7045      	strb	r5, [r0, #1]
20029f9e:	7082      	strb	r2, [r0, #2]
20029fa0:	f880 b003 	strb.w	fp, [r0, #3]
20029fa4:	464a      	mov	r2, r9
20029fa6:	9914      	ldr	r1, [sp, #80]	@ 0x50
20029fa8:	3004      	adds	r0, #4
20029faa:	e7ca      	b.n	20029f42 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0xa2>
20029fac:	6865      	ldr	r5, [r4, #4]
20029fae:	2001      	movs	r0, #1
20029fb0:	4629      	mov	r1, r5
20029fb2:	f000 fb49 	bl	2002a648 <calloc>
20029fb6:	4607      	mov	r7, r0
20029fb8:	b140      	cbz	r0, 20029fcc <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x12c>
20029fba:	4629      	mov	r1, r5
20029fbc:	2001      	movs	r0, #1
20029fbe:	f000 fb43 	bl	2002a648 <calloc>
20029fc2:	4680      	mov	r8, r0
20029fc4:	b928      	cbnz	r0, 20029fd2 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x132>
20029fc6:	4638      	mov	r0, r7
20029fc8:	f000 fb5a 	bl	2002a680 <free>
20029fcc:	f06f 050f 	mvn.w	r5, #15
20029fd0:	e77b      	b.n	20029eca <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x2a>
20029fd2:	4633      	mov	r3, r6
20029fd4:	4652      	mov	r2, sl
20029fd6:	4620      	mov	r0, r4
20029fd8:	9902      	ldr	r1, [sp, #8]
20029fda:	9700      	str	r7, [sp, #0]
20029fdc:	f7ff fcae 	bl	2002993c <mbedtls_rsa_private>
20029fe0:	4605      	mov	r5, r0
20029fe2:	b9a0      	cbnz	r0, 2002a00e <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x16e>
20029fe4:	4642      	mov	r2, r8
20029fe6:	4639      	mov	r1, r7
20029fe8:	4620      	mov	r0, r4
20029fea:	f7ff fc71 	bl	200298d0 <mbedtls_rsa_public>
20029fee:	4605      	mov	r5, r0
20029ff0:	b968      	cbnz	r0, 2002a00e <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x16e>
20029ff2:	4601      	mov	r1, r0
20029ff4:	4603      	mov	r3, r0
20029ff6:	6862      	ldr	r2, [r4, #4]
20029ff8:	429a      	cmp	r2, r3
20029ffa:	d10f      	bne.n	2002a01c <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x17c>
20029ffc:	f88d 1017 	strb.w	r1, [sp, #23]
2002a000:	f89d 3017 	ldrb.w	r3, [sp, #23]
2002a004:	b98b      	cbnz	r3, 2002a02a <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x18a>
2002a006:	4639      	mov	r1, r7
2002a008:	4630      	mov	r0, r6
2002a00a:	f000 fc19 	bl	2002a840 <memcpy>
2002a00e:	4638      	mov	r0, r7
2002a010:	f000 fb36 	bl	2002a680 <free>
2002a014:	4640      	mov	r0, r8
2002a016:	f000 fb33 	bl	2002a680 <free>
2002a01a:	e756      	b.n	20029eca <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x2a>
2002a01c:	f818 0003 	ldrb.w	r0, [r8, r3]
2002a020:	5cf4      	ldrb	r4, [r6, r3]
2002a022:	3301      	adds	r3, #1
2002a024:	4060      	eors	r0, r4
2002a026:	4301      	orrs	r1, r0
2002a028:	e7e6      	b.n	20029ff8 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x158>
2002a02a:	4d02      	ldr	r5, [pc, #8]	@ (2002a034 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x194>)
2002a02c:	e7ef      	b.n	2002a00e <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x16e>
2002a02e:	bf00      	nop
2002a030:	ffffbf80 	.word	0xffffbf80
2002a034:	ffffbd00 	.word	0xffffbd00

2002a038 <mbedtls_rsa_pkcs1_sign>:
2002a038:	b430      	push	{r4, r5}
2002a03a:	f8d0 50a4 	ldr.w	r5, [r0, #164]	@ 0xa4
2002a03e:	f89d 4008 	ldrb.w	r4, [sp, #8]
2002a042:	b91d      	cbnz	r5, 2002a04c <mbedtls_rsa_pkcs1_sign+0x14>
2002a044:	9402      	str	r4, [sp, #8]
2002a046:	bc30      	pop	{r4, r5}
2002a048:	f7ff bf2a 	b.w	20029ea0 <mbedtls_rsa_rsassa_pkcs1_v15_sign>
2002a04c:	4801      	ldr	r0, [pc, #4]	@ (2002a054 <mbedtls_rsa_pkcs1_sign+0x1c>)
2002a04e:	bc30      	pop	{r4, r5}
2002a050:	4770      	bx	lr
2002a052:	bf00      	nop
2002a054:	ffffbf00 	.word	0xffffbf00

2002a058 <mbedtls_rsa_rsassa_pkcs1_v15_verify>:
2002a058:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002a05c:	461c      	mov	r4, r3
2002a05e:	f2ad 4d2c 	subw	sp, sp, #1068	@ 0x42c
2002a062:	f89d 3450 	ldrb.w	r3, [sp, #1104]	@ 0x450
2002a066:	2c01      	cmp	r4, #1
2002a068:	9303      	str	r3, [sp, #12]
2002a06a:	f8dd 8454 	ldr.w	r8, [sp, #1108]	@ 0x454
2002a06e:	f8dd 345c 	ldr.w	r3, [sp, #1116]	@ 0x45c
2002a072:	d108      	bne.n	2002a086 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x2e>
2002a074:	f8d0 50a4 	ldr.w	r5, [r0, #164]	@ 0xa4
2002a078:	b12d      	cbz	r5, 2002a086 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x2e>
2002a07a:	4d60      	ldr	r5, [pc, #384]	@ (2002a1fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x1a4>)
2002a07c:	4628      	mov	r0, r5
2002a07e:	f20d 4d2c 	addw	sp, sp, #1068	@ 0x42c
2002a082:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002a086:	6846      	ldr	r6, [r0, #4]
2002a088:	f1a6 0510 	sub.w	r5, r6, #16
2002a08c:	f5b5 7f7c 	cmp.w	r5, #1008	@ 0x3f0
2002a090:	d8f3      	bhi.n	2002a07a <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x22>
2002a092:	af0a      	add	r7, sp, #40	@ 0x28
2002a094:	b954      	cbnz	r4, 2002a0ac <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x54>
2002a096:	463a      	mov	r2, r7
2002a098:	4619      	mov	r1, r3
2002a09a:	f7ff fc19 	bl	200298d0 <mbedtls_rsa_public>
2002a09e:	4605      	mov	r5, r0
2002a0a0:	2800      	cmp	r0, #0
2002a0a2:	d1eb      	bne.n	2002a07c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a0a4:	783b      	ldrb	r3, [r7, #0]
2002a0a6:	b12b      	cbz	r3, 2002a0b4 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x5c>
2002a0a8:	4d55      	ldr	r5, [pc, #340]	@ (2002a200 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x1a8>)
2002a0aa:	e7e7      	b.n	2002a07c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a0ac:	9700      	str	r7, [sp, #0]
2002a0ae:	f7ff fc45 	bl	2002993c <mbedtls_rsa_private>
2002a0b2:	e7f4      	b.n	2002a09e <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x46>
2002a0b4:	787b      	ldrb	r3, [r7, #1]
2002a0b6:	ac06      	add	r4, sp, #24
2002a0b8:	f10d 002a 	add.w	r0, sp, #42	@ 0x2a
2002a0bc:	2b01      	cmp	r3, #1
2002a0be:	6020      	str	r0, [r4, #0]
2002a0c0:	d1f2      	bne.n	2002a0a8 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a0c2:	1e73      	subs	r3, r6, #1
2002a0c4:	443b      	add	r3, r7
2002a0c6:	7802      	ldrb	r2, [r0, #0]
2002a0c8:	b992      	cbnz	r2, 2002a0f0 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x98>
2002a0ca:	3001      	adds	r0, #1
2002a0cc:	1bc7      	subs	r7, r0, r7
2002a0ce:	2f0a      	cmp	r7, #10
2002a0d0:	6020      	str	r0, [r4, #0]
2002a0d2:	dde9      	ble.n	2002a0a8 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a0d4:	1bf6      	subs	r6, r6, r7
2002a0d6:	4546      	cmp	r6, r8
2002a0d8:	d112      	bne.n	2002a100 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0xa8>
2002a0da:	9b03      	ldr	r3, [sp, #12]
2002a0dc:	b983      	cbnz	r3, 2002a100 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0xa8>
2002a0de:	4642      	mov	r2, r8
2002a0e0:	f8dd 1458 	ldr.w	r1, [sp, #1112]	@ 0x458
2002a0e4:	f000 fb82 	bl	2002a7ec <memcmp>
2002a0e8:	2800      	cmp	r0, #0
2002a0ea:	d0c7      	beq.n	2002a07c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a0ec:	4d45      	ldr	r5, [pc, #276]	@ (2002a204 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x1ac>)
2002a0ee:	e7c5      	b.n	2002a07c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a0f0:	4298      	cmp	r0, r3
2002a0f2:	d2d9      	bcs.n	2002a0a8 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a0f4:	2aff      	cmp	r2, #255	@ 0xff
2002a0f6:	f100 0001 	add.w	r0, r0, #1
2002a0fa:	d1d5      	bne.n	2002a0a8 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a0fc:	6020      	str	r0, [r4, #0]
2002a0fe:	e7e2      	b.n	2002a0c6 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x6e>
2002a100:	9803      	ldr	r0, [sp, #12]
2002a102:	f7fb fe67 	bl	20025dd4 <mbedtls_md_info_from_type>
2002a106:	2800      	cmp	r0, #0
2002a108:	d0b7      	beq.n	2002a07a <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x22>
2002a10a:	f7fb fe6f 	bl	20025dec <mbedtls_md_get_size>
2002a10e:	f8d4 a000 	ldr.w	sl, [r4]
2002a112:	af05      	add	r7, sp, #20
2002a114:	eb0a 0806 	add.w	r8, sl, r6
2002a118:	4681      	mov	r9, r0
2002a11a:	2330      	movs	r3, #48	@ 0x30
2002a11c:	463a      	mov	r2, r7
2002a11e:	4641      	mov	r1, r8
2002a120:	4620      	mov	r0, r4
2002a122:	f7fd fb95 	bl	20027850 <mbedtls_asn1_get_tag>
2002a126:	2800      	cmp	r0, #0
2002a128:	d1e0      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a12a:	f8d4 b000 	ldr.w	fp, [r4]
2002a12e:	f10a 0a02 	add.w	sl, sl, #2
2002a132:	45d3      	cmp	fp, sl
2002a134:	d1da      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a136:	683b      	ldr	r3, [r7, #0]
2002a138:	3302      	adds	r3, #2
2002a13a:	42b3      	cmp	r3, r6
2002a13c:	d1d6      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a13e:	2330      	movs	r3, #48	@ 0x30
2002a140:	463a      	mov	r2, r7
2002a142:	4641      	mov	r1, r8
2002a144:	4620      	mov	r0, r4
2002a146:	f7fd fb83 	bl	20027850 <mbedtls_asn1_get_tag>
2002a14a:	2800      	cmp	r0, #0
2002a14c:	d1ce      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a14e:	f8d4 a000 	ldr.w	sl, [r4]
2002a152:	f10b 0b02 	add.w	fp, fp, #2
2002a156:	45da      	cmp	sl, fp
2002a158:	d1c8      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a15a:	683b      	ldr	r3, [r7, #0]
2002a15c:	3306      	adds	r3, #6
2002a15e:	444b      	add	r3, r9
2002a160:	42b3      	cmp	r3, r6
2002a162:	d1c3      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a164:	2306      	movs	r3, #6
2002a166:	4641      	mov	r1, r8
2002a168:	4620      	mov	r0, r4
2002a16a:	aa08      	add	r2, sp, #32
2002a16c:	ae07      	add	r6, sp, #28
2002a16e:	f7fd fb6f 	bl	20027850 <mbedtls_asn1_get_tag>
2002a172:	2800      	cmp	r0, #0
2002a174:	d1ba      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a176:	6823      	ldr	r3, [r4, #0]
2002a178:	f10a 0a02 	add.w	sl, sl, #2
2002a17c:	4553      	cmp	r3, sl
2002a17e:	d1b5      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a180:	9a08      	ldr	r2, [sp, #32]
2002a182:	f10d 0a13 	add.w	sl, sp, #19
2002a186:	9309      	str	r3, [sp, #36]	@ 0x24
2002a188:	4651      	mov	r1, sl
2002a18a:	4413      	add	r3, r2
2002a18c:	4630      	mov	r0, r6
2002a18e:	6023      	str	r3, [r4, #0]
2002a190:	f7ff f86a 	bl	20029268 <mbedtls_oid_get_md_alg>
2002a194:	2800      	cmp	r0, #0
2002a196:	d1a9      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a198:	f89d 3013 	ldrb.w	r3, [sp, #19]
2002a19c:	9a03      	ldr	r2, [sp, #12]
2002a19e:	4293      	cmp	r3, r2
2002a1a0:	d1a4      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1a2:	2305      	movs	r3, #5
2002a1a4:	463a      	mov	r2, r7
2002a1a6:	4641      	mov	r1, r8
2002a1a8:	4620      	mov	r0, r4
2002a1aa:	f8d4 a000 	ldr.w	sl, [r4]
2002a1ae:	f7fd fb4f 	bl	20027850 <mbedtls_asn1_get_tag>
2002a1b2:	2800      	cmp	r0, #0
2002a1b4:	d19a      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1b6:	6826      	ldr	r6, [r4, #0]
2002a1b8:	f10a 0a02 	add.w	sl, sl, #2
2002a1bc:	4556      	cmp	r6, sl
2002a1be:	d195      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1c0:	2304      	movs	r3, #4
2002a1c2:	463a      	mov	r2, r7
2002a1c4:	4641      	mov	r1, r8
2002a1c6:	4620      	mov	r0, r4
2002a1c8:	f7fd fb42 	bl	20027850 <mbedtls_asn1_get_tag>
2002a1cc:	2800      	cmp	r0, #0
2002a1ce:	d18d      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1d0:	6824      	ldr	r4, [r4, #0]
2002a1d2:	3602      	adds	r6, #2
2002a1d4:	42b4      	cmp	r4, r6
2002a1d6:	d189      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1d8:	683b      	ldr	r3, [r7, #0]
2002a1da:	454b      	cmp	r3, r9
2002a1dc:	d186      	bne.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1de:	464a      	mov	r2, r9
2002a1e0:	4620      	mov	r0, r4
2002a1e2:	f8dd 1458 	ldr.w	r1, [sp, #1112]	@ 0x458
2002a1e6:	f000 fb01 	bl	2002a7ec <memcmp>
2002a1ea:	2800      	cmp	r0, #0
2002a1ec:	f47f af7e 	bne.w	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1f0:	444c      	add	r4, r9
2002a1f2:	45a0      	cmp	r8, r4
2002a1f4:	f43f af42 	beq.w	2002a07c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a1f8:	e778      	b.n	2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1fa:	bf00      	nop
2002a1fc:	ffffbf80 	.word	0xffffbf80
2002a200:	ffffbf00 	.word	0xffffbf00
2002a204:	ffffbc80 	.word	0xffffbc80

2002a208 <mbedtls_rsa_pkcs1_verify>:
2002a208:	b430      	push	{r4, r5}
2002a20a:	f8d0 50a4 	ldr.w	r5, [r0, #164]	@ 0xa4
2002a20e:	f89d 4008 	ldrb.w	r4, [sp, #8]
2002a212:	b91d      	cbnz	r5, 2002a21c <mbedtls_rsa_pkcs1_verify+0x14>
2002a214:	9402      	str	r4, [sp, #8]
2002a216:	bc30      	pop	{r4, r5}
2002a218:	f7ff bf1e 	b.w	2002a058 <mbedtls_rsa_rsassa_pkcs1_v15_verify>
2002a21c:	4801      	ldr	r0, [pc, #4]	@ (2002a224 <mbedtls_rsa_pkcs1_verify+0x1c>)
2002a21e:	bc30      	pop	{r4, r5}
2002a220:	4770      	bx	lr
2002a222:	bf00      	nop
2002a224:	ffffbf00 	.word	0xffffbf00

2002a228 <mbedtls_rsa_free>:
2002a228:	b510      	push	{r4, lr}
2002a22a:	4604      	mov	r4, r0
2002a22c:	308c      	adds	r0, #140	@ 0x8c
2002a22e:	f7fd fd44 	bl	20027cba <mbedtls_mpi_free>
2002a232:	f104 0098 	add.w	r0, r4, #152	@ 0x98
2002a236:	f7fd fd40 	bl	20027cba <mbedtls_mpi_free>
2002a23a:	f104 0080 	add.w	r0, r4, #128	@ 0x80
2002a23e:	f7fd fd3c 	bl	20027cba <mbedtls_mpi_free>
2002a242:	f104 0074 	add.w	r0, r4, #116	@ 0x74
2002a246:	f7fd fd38 	bl	20027cba <mbedtls_mpi_free>
2002a24a:	f104 0068 	add.w	r0, r4, #104	@ 0x68
2002a24e:	f7fd fd34 	bl	20027cba <mbedtls_mpi_free>
2002a252:	f104 005c 	add.w	r0, r4, #92	@ 0x5c
2002a256:	f7fd fd30 	bl	20027cba <mbedtls_mpi_free>
2002a25a:	f104 0050 	add.w	r0, r4, #80	@ 0x50
2002a25e:	f7fd fd2c 	bl	20027cba <mbedtls_mpi_free>
2002a262:	f104 0044 	add.w	r0, r4, #68	@ 0x44
2002a266:	f7fd fd28 	bl	20027cba <mbedtls_mpi_free>
2002a26a:	f104 0038 	add.w	r0, r4, #56	@ 0x38
2002a26e:	f7fd fd24 	bl	20027cba <mbedtls_mpi_free>
2002a272:	f104 002c 	add.w	r0, r4, #44	@ 0x2c
2002a276:	f7fd fd20 	bl	20027cba <mbedtls_mpi_free>
2002a27a:	f104 0020 	add.w	r0, r4, #32
2002a27e:	f7fd fd1c 	bl	20027cba <mbedtls_mpi_free>
2002a282:	f104 0014 	add.w	r0, r4, #20
2002a286:	f7fd fd18 	bl	20027cba <mbedtls_mpi_free>
2002a28a:	f104 0008 	add.w	r0, r4, #8
2002a28e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002a292:	f7fd bd12 	b.w	20027cba <mbedtls_mpi_free>
	...

2002a298 <BSP_GetFlash1DIV>:
2002a298:	4b01      	ldr	r3, [pc, #4]	@ (2002a2a0 <BSP_GetFlash1DIV+0x8>)
2002a29a:	8818      	ldrh	r0, [r3, #0]
2002a29c:	4770      	bx	lr
2002a29e:	bf00      	nop
2002a2a0:	2004495a 	.word	0x2004495a

2002a2a4 <BSP_GetFlash2DIV>:
2002a2a4:	4b01      	ldr	r3, [pc, #4]	@ (2002a2ac <BSP_GetFlash2DIV+0x8>)
2002a2a6:	8818      	ldrh	r0, [r3, #0]
2002a2a8:	4770      	bx	lr
2002a2aa:	bf00      	nop
2002a2ac:	20044958 	.word	0x20044958

2002a2b0 <BSP_SetFlash1DIV>:
2002a2b0:	4b01      	ldr	r3, [pc, #4]	@ (2002a2b8 <BSP_SetFlash1DIV+0x8>)
2002a2b2:	8018      	strh	r0, [r3, #0]
2002a2b4:	4770      	bx	lr
2002a2b6:	bf00      	nop
2002a2b8:	2004495a 	.word	0x2004495a

2002a2bc <BSP_SetFlash2DIV>:
2002a2bc:	4b01      	ldr	r3, [pc, #4]	@ (2002a2c4 <BSP_SetFlash2DIV+0x8>)
2002a2be:	8018      	strh	r0, [r3, #0]
2002a2c0:	4770      	bx	lr
2002a2c2:	bf00      	nop
2002a2c4:	20044958 	.word	0x20044958

2002a2c8 <__aeabi_uldivmod>:
2002a2c8:	b953      	cbnz	r3, 2002a2e0 <__aeabi_uldivmod+0x18>
2002a2ca:	b94a      	cbnz	r2, 2002a2e0 <__aeabi_uldivmod+0x18>
2002a2cc:	2900      	cmp	r1, #0
2002a2ce:	bf08      	it	eq
2002a2d0:	2800      	cmpeq	r0, #0
2002a2d2:	bf1c      	itt	ne
2002a2d4:	f04f 31ff 	movne.w	r1, #4294967295	@ 0xffffffff
2002a2d8:	f04f 30ff 	movne.w	r0, #4294967295	@ 0xffffffff
2002a2dc:	f000 b9b2 	b.w	2002a644 <__aeabi_idiv0>
2002a2e0:	f1ad 0c08 	sub.w	ip, sp, #8
2002a2e4:	e96d ce04 	strd	ip, lr, [sp, #-16]!
2002a2e8:	f000 f806 	bl	2002a2f8 <__udivmoddi4>
2002a2ec:	f8dd e004 	ldr.w	lr, [sp, #4]
2002a2f0:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
2002a2f4:	b004      	add	sp, #16
2002a2f6:	4770      	bx	lr

2002a2f8 <__udivmoddi4>:
2002a2f8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002a2fc:	468c      	mov	ip, r1
2002a2fe:	9e09      	ldr	r6, [sp, #36]	@ 0x24
2002a300:	4604      	mov	r4, r0
2002a302:	460f      	mov	r7, r1
2002a304:	2b00      	cmp	r3, #0
2002a306:	d148      	bne.n	2002a39a <__udivmoddi4+0xa2>
2002a308:	428a      	cmp	r2, r1
2002a30a:	4615      	mov	r5, r2
2002a30c:	d95e      	bls.n	2002a3cc <__udivmoddi4+0xd4>
2002a30e:	fab2 f382 	clz	r3, r2
2002a312:	b13b      	cbz	r3, 2002a324 <__udivmoddi4+0x2c>
2002a314:	f1c3 0220 	rsb	r2, r3, #32
2002a318:	409f      	lsls	r7, r3
2002a31a:	409d      	lsls	r5, r3
2002a31c:	409c      	lsls	r4, r3
2002a31e:	fa20 f202 	lsr.w	r2, r0, r2
2002a322:	4317      	orrs	r7, r2
2002a324:	ea4f 4e15 	mov.w	lr, r5, lsr #16
2002a328:	fa1f fc85 	uxth.w	ip, r5
2002a32c:	0c22      	lsrs	r2, r4, #16
2002a32e:	fbb7 f1fe 	udiv	r1, r7, lr
2002a332:	fb0e 7711 	mls	r7, lr, r1, r7
2002a336:	fb01 f00c 	mul.w	r0, r1, ip
2002a33a:	ea42 4207 	orr.w	r2, r2, r7, lsl #16
2002a33e:	4290      	cmp	r0, r2
2002a340:	d907      	bls.n	2002a352 <__udivmoddi4+0x5a>
2002a342:	18aa      	adds	r2, r5, r2
2002a344:	f101 37ff 	add.w	r7, r1, #4294967295	@ 0xffffffff
2002a348:	d202      	bcs.n	2002a350 <__udivmoddi4+0x58>
2002a34a:	4290      	cmp	r0, r2
2002a34c:	f200 8158 	bhi.w	2002a600 <__udivmoddi4+0x308>
2002a350:	4639      	mov	r1, r7
2002a352:	1a12      	subs	r2, r2, r0
2002a354:	b2a4      	uxth	r4, r4
2002a356:	fbb2 f0fe 	udiv	r0, r2, lr
2002a35a:	fb0e 2210 	mls	r2, lr, r0, r2
2002a35e:	fb00 fc0c 	mul.w	ip, r0, ip
2002a362:	ea44 4402 	orr.w	r4, r4, r2, lsl #16
2002a366:	45a4      	cmp	ip, r4
2002a368:	d90b      	bls.n	2002a382 <__udivmoddi4+0x8a>
2002a36a:	192c      	adds	r4, r5, r4
2002a36c:	f100 32ff 	add.w	r2, r0, #4294967295	@ 0xffffffff
2002a370:	bf2c      	ite	cs
2002a372:	2701      	movcs	r7, #1
2002a374:	2700      	movcc	r7, #0
2002a376:	45a4      	cmp	ip, r4
2002a378:	d902      	bls.n	2002a380 <__udivmoddi4+0x88>
2002a37a:	2f00      	cmp	r7, #0
2002a37c:	f000 8143 	beq.w	2002a606 <__udivmoddi4+0x30e>
2002a380:	4610      	mov	r0, r2
2002a382:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
2002a386:	eba4 040c 	sub.w	r4, r4, ip
2002a38a:	2100      	movs	r1, #0
2002a38c:	b11e      	cbz	r6, 2002a396 <__udivmoddi4+0x9e>
2002a38e:	40dc      	lsrs	r4, r3
2002a390:	2300      	movs	r3, #0
2002a392:	e9c6 4300 	strd	r4, r3, [r6]
2002a396:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002a39a:	428b      	cmp	r3, r1
2002a39c:	d906      	bls.n	2002a3ac <__udivmoddi4+0xb4>
2002a39e:	b10e      	cbz	r6, 2002a3a4 <__udivmoddi4+0xac>
2002a3a0:	e9c6 0100 	strd	r0, r1, [r6]
2002a3a4:	2100      	movs	r1, #0
2002a3a6:	4608      	mov	r0, r1
2002a3a8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002a3ac:	fab3 f183 	clz	r1, r3
2002a3b0:	2900      	cmp	r1, #0
2002a3b2:	d151      	bne.n	2002a458 <__udivmoddi4+0x160>
2002a3b4:	4563      	cmp	r3, ip
2002a3b6:	f0c0 8116 	bcc.w	2002a5e6 <__udivmoddi4+0x2ee>
2002a3ba:	4282      	cmp	r2, r0
2002a3bc:	f240 8113 	bls.w	2002a5e6 <__udivmoddi4+0x2ee>
2002a3c0:	4608      	mov	r0, r1
2002a3c2:	2e00      	cmp	r6, #0
2002a3c4:	d0e7      	beq.n	2002a396 <__udivmoddi4+0x9e>
2002a3c6:	e9c6 4700 	strd	r4, r7, [r6]
2002a3ca:	e7e4      	b.n	2002a396 <__udivmoddi4+0x9e>
2002a3cc:	2a00      	cmp	r2, #0
2002a3ce:	f000 80af 	beq.w	2002a530 <__udivmoddi4+0x238>
2002a3d2:	fab2 f382 	clz	r3, r2
2002a3d6:	2b00      	cmp	r3, #0
2002a3d8:	f040 80c2 	bne.w	2002a560 <__udivmoddi4+0x268>
2002a3dc:	1a8a      	subs	r2, r1, r2
2002a3de:	ea4f 4e15 	mov.w	lr, r5, lsr #16
2002a3e2:	b2af      	uxth	r7, r5
2002a3e4:	2101      	movs	r1, #1
2002a3e6:	0c20      	lsrs	r0, r4, #16
2002a3e8:	fbb2 fcfe 	udiv	ip, r2, lr
2002a3ec:	fb0e 221c 	mls	r2, lr, ip, r2
2002a3f0:	ea40 4202 	orr.w	r2, r0, r2, lsl #16
2002a3f4:	fb07 f00c 	mul.w	r0, r7, ip
2002a3f8:	4290      	cmp	r0, r2
2002a3fa:	d90e      	bls.n	2002a41a <__udivmoddi4+0x122>
2002a3fc:	18aa      	adds	r2, r5, r2
2002a3fe:	f10c 38ff 	add.w	r8, ip, #4294967295	@ 0xffffffff
2002a402:	bf2c      	ite	cs
2002a404:	f04f 0901 	movcs.w	r9, #1
2002a408:	f04f 0900 	movcc.w	r9, #0
2002a40c:	4290      	cmp	r0, r2
2002a40e:	d903      	bls.n	2002a418 <__udivmoddi4+0x120>
2002a410:	f1b9 0f00 	cmp.w	r9, #0
2002a414:	f000 80f0 	beq.w	2002a5f8 <__udivmoddi4+0x300>
2002a418:	46c4      	mov	ip, r8
2002a41a:	1a12      	subs	r2, r2, r0
2002a41c:	b2a4      	uxth	r4, r4
2002a41e:	fbb2 f0fe 	udiv	r0, r2, lr
2002a422:	fb0e 2210 	mls	r2, lr, r0, r2
2002a426:	fb00 f707 	mul.w	r7, r0, r7
2002a42a:	ea44 4402 	orr.w	r4, r4, r2, lsl #16
2002a42e:	42a7      	cmp	r7, r4
2002a430:	d90e      	bls.n	2002a450 <__udivmoddi4+0x158>
2002a432:	192c      	adds	r4, r5, r4
2002a434:	f100 32ff 	add.w	r2, r0, #4294967295	@ 0xffffffff
2002a438:	bf2c      	ite	cs
2002a43a:	f04f 0e01 	movcs.w	lr, #1
2002a43e:	f04f 0e00 	movcc.w	lr, #0
2002a442:	42a7      	cmp	r7, r4
2002a444:	d903      	bls.n	2002a44e <__udivmoddi4+0x156>
2002a446:	f1be 0f00 	cmp.w	lr, #0
2002a44a:	f000 80d2 	beq.w	2002a5f2 <__udivmoddi4+0x2fa>
2002a44e:	4610      	mov	r0, r2
2002a450:	1be4      	subs	r4, r4, r7
2002a452:	ea40 400c 	orr.w	r0, r0, ip, lsl #16
2002a456:	e799      	b.n	2002a38c <__udivmoddi4+0x94>
2002a458:	f1c1 0520 	rsb	r5, r1, #32
2002a45c:	408b      	lsls	r3, r1
2002a45e:	fa0c f401 	lsl.w	r4, ip, r1
2002a462:	fa00 f901 	lsl.w	r9, r0, r1
2002a466:	fa22 f705 	lsr.w	r7, r2, r5
2002a46a:	fa2c fc05 	lsr.w	ip, ip, r5
2002a46e:	408a      	lsls	r2, r1
2002a470:	431f      	orrs	r7, r3
2002a472:	fa20 f305 	lsr.w	r3, r0, r5
2002a476:	0c38      	lsrs	r0, r7, #16
2002a478:	4323      	orrs	r3, r4
2002a47a:	fa1f fe87 	uxth.w	lr, r7
2002a47e:	0c1c      	lsrs	r4, r3, #16
2002a480:	fbbc f8f0 	udiv	r8, ip, r0
2002a484:	fb00 cc18 	mls	ip, r0, r8, ip
2002a488:	ea44 440c 	orr.w	r4, r4, ip, lsl #16
2002a48c:	fb08 fc0e 	mul.w	ip, r8, lr
2002a490:	45a4      	cmp	ip, r4
2002a492:	d90e      	bls.n	2002a4b2 <__udivmoddi4+0x1ba>
2002a494:	193c      	adds	r4, r7, r4
2002a496:	f108 3aff 	add.w	sl, r8, #4294967295	@ 0xffffffff
2002a49a:	bf2c      	ite	cs
2002a49c:	f04f 0b01 	movcs.w	fp, #1
2002a4a0:	f04f 0b00 	movcc.w	fp, #0
2002a4a4:	45a4      	cmp	ip, r4
2002a4a6:	d903      	bls.n	2002a4b0 <__udivmoddi4+0x1b8>
2002a4a8:	f1bb 0f00 	cmp.w	fp, #0
2002a4ac:	f000 80b8 	beq.w	2002a620 <__udivmoddi4+0x328>
2002a4b0:	46d0      	mov	r8, sl
2002a4b2:	eba4 040c 	sub.w	r4, r4, ip
2002a4b6:	fa1f fc83 	uxth.w	ip, r3
2002a4ba:	fbb4 f3f0 	udiv	r3, r4, r0
2002a4be:	fb00 4413 	mls	r4, r0, r3, r4
2002a4c2:	fb03 fe0e 	mul.w	lr, r3, lr
2002a4c6:	ea4c 4404 	orr.w	r4, ip, r4, lsl #16
2002a4ca:	45a6      	cmp	lr, r4
2002a4cc:	d90e      	bls.n	2002a4ec <__udivmoddi4+0x1f4>
2002a4ce:	193c      	adds	r4, r7, r4
2002a4d0:	f103 30ff 	add.w	r0, r3, #4294967295	@ 0xffffffff
2002a4d4:	bf2c      	ite	cs
2002a4d6:	f04f 0c01 	movcs.w	ip, #1
2002a4da:	f04f 0c00 	movcc.w	ip, #0
2002a4de:	45a6      	cmp	lr, r4
2002a4e0:	d903      	bls.n	2002a4ea <__udivmoddi4+0x1f2>
2002a4e2:	f1bc 0f00 	cmp.w	ip, #0
2002a4e6:	f000 809f 	beq.w	2002a628 <__udivmoddi4+0x330>
2002a4ea:	4603      	mov	r3, r0
2002a4ec:	ea43 4008 	orr.w	r0, r3, r8, lsl #16
2002a4f0:	eba4 040e 	sub.w	r4, r4, lr
2002a4f4:	fba0 ec02 	umull	lr, ip, r0, r2
2002a4f8:	4564      	cmp	r4, ip
2002a4fa:	4673      	mov	r3, lr
2002a4fc:	46e0      	mov	r8, ip
2002a4fe:	d302      	bcc.n	2002a506 <__udivmoddi4+0x20e>
2002a500:	d107      	bne.n	2002a512 <__udivmoddi4+0x21a>
2002a502:	45f1      	cmp	r9, lr
2002a504:	d205      	bcs.n	2002a512 <__udivmoddi4+0x21a>
2002a506:	ebbe 0302 	subs.w	r3, lr, r2
2002a50a:	eb6c 0c07 	sbc.w	ip, ip, r7
2002a50e:	3801      	subs	r0, #1
2002a510:	46e0      	mov	r8, ip
2002a512:	b15e      	cbz	r6, 2002a52c <__udivmoddi4+0x234>
2002a514:	ebb9 0203 	subs.w	r2, r9, r3
2002a518:	eb64 0408 	sbc.w	r4, r4, r8
2002a51c:	fa04 f505 	lsl.w	r5, r4, r5
2002a520:	fa22 f301 	lsr.w	r3, r2, r1
2002a524:	40cc      	lsrs	r4, r1
2002a526:	431d      	orrs	r5, r3
2002a528:	e9c6 5400 	strd	r5, r4, [r6]
2002a52c:	2100      	movs	r1, #0
2002a52e:	e732      	b.n	2002a396 <__udivmoddi4+0x9e>
2002a530:	0842      	lsrs	r2, r0, #1
2002a532:	462f      	mov	r7, r5
2002a534:	084b      	lsrs	r3, r1, #1
2002a536:	46ac      	mov	ip, r5
2002a538:	ea42 72c1 	orr.w	r2, r2, r1, lsl #31
2002a53c:	46ae      	mov	lr, r5
2002a53e:	07c4      	lsls	r4, r0, #31
2002a540:	0c11      	lsrs	r1, r2, #16
2002a542:	b292      	uxth	r2, r2
2002a544:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
2002a548:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
2002a54c:	fbb1 f1f5 	udiv	r1, r1, r5
2002a550:	fbb3 f0f5 	udiv	r0, r3, r5
2002a554:	231f      	movs	r3, #31
2002a556:	eba2 020c 	sub.w	r2, r2, ip
2002a55a:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
2002a55e:	e742      	b.n	2002a3e6 <__udivmoddi4+0xee>
2002a560:	409d      	lsls	r5, r3
2002a562:	f1c3 0220 	rsb	r2, r3, #32
2002a566:	4099      	lsls	r1, r3
2002a568:	409c      	lsls	r4, r3
2002a56a:	fa2c fc02 	lsr.w	ip, ip, r2
2002a56e:	ea4f 4e15 	mov.w	lr, r5, lsr #16
2002a572:	fa20 f202 	lsr.w	r2, r0, r2
2002a576:	b2af      	uxth	r7, r5
2002a578:	fbbc f8fe 	udiv	r8, ip, lr
2002a57c:	430a      	orrs	r2, r1
2002a57e:	fb0e cc18 	mls	ip, lr, r8, ip
2002a582:	0c11      	lsrs	r1, r2, #16
2002a584:	ea41 410c 	orr.w	r1, r1, ip, lsl #16
2002a588:	fb08 fc07 	mul.w	ip, r8, r7
2002a58c:	458c      	cmp	ip, r1
2002a58e:	d950      	bls.n	2002a632 <__udivmoddi4+0x33a>
2002a590:	1869      	adds	r1, r5, r1
2002a592:	f108 30ff 	add.w	r0, r8, #4294967295	@ 0xffffffff
2002a596:	bf2c      	ite	cs
2002a598:	f04f 0901 	movcs.w	r9, #1
2002a59c:	f04f 0900 	movcc.w	r9, #0
2002a5a0:	458c      	cmp	ip, r1
2002a5a2:	d902      	bls.n	2002a5aa <__udivmoddi4+0x2b2>
2002a5a4:	f1b9 0f00 	cmp.w	r9, #0
2002a5a8:	d030      	beq.n	2002a60c <__udivmoddi4+0x314>
2002a5aa:	eba1 010c 	sub.w	r1, r1, ip
2002a5ae:	fbb1 f8fe 	udiv	r8, r1, lr
2002a5b2:	fb08 fc07 	mul.w	ip, r8, r7
2002a5b6:	fb0e 1118 	mls	r1, lr, r8, r1
2002a5ba:	b292      	uxth	r2, r2
2002a5bc:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
2002a5c0:	4562      	cmp	r2, ip
2002a5c2:	d234      	bcs.n	2002a62e <__udivmoddi4+0x336>
2002a5c4:	18aa      	adds	r2, r5, r2
2002a5c6:	f108 31ff 	add.w	r1, r8, #4294967295	@ 0xffffffff
2002a5ca:	bf2c      	ite	cs
2002a5cc:	f04f 0901 	movcs.w	r9, #1
2002a5d0:	f04f 0900 	movcc.w	r9, #0
2002a5d4:	4562      	cmp	r2, ip
2002a5d6:	d2be      	bcs.n	2002a556 <__udivmoddi4+0x25e>
2002a5d8:	f1b9 0f00 	cmp.w	r9, #0
2002a5dc:	d1bb      	bne.n	2002a556 <__udivmoddi4+0x25e>
2002a5de:	f1a8 0102 	sub.w	r1, r8, #2
2002a5e2:	442a      	add	r2, r5
2002a5e4:	e7b7      	b.n	2002a556 <__udivmoddi4+0x25e>
2002a5e6:	1a84      	subs	r4, r0, r2
2002a5e8:	eb6c 0203 	sbc.w	r2, ip, r3
2002a5ec:	2001      	movs	r0, #1
2002a5ee:	4617      	mov	r7, r2
2002a5f0:	e6e7      	b.n	2002a3c2 <__udivmoddi4+0xca>
2002a5f2:	442c      	add	r4, r5
2002a5f4:	3802      	subs	r0, #2
2002a5f6:	e72b      	b.n	2002a450 <__udivmoddi4+0x158>
2002a5f8:	f1ac 0c02 	sub.w	ip, ip, #2
2002a5fc:	442a      	add	r2, r5
2002a5fe:	e70c      	b.n	2002a41a <__udivmoddi4+0x122>
2002a600:	3902      	subs	r1, #2
2002a602:	442a      	add	r2, r5
2002a604:	e6a5      	b.n	2002a352 <__udivmoddi4+0x5a>
2002a606:	442c      	add	r4, r5
2002a608:	3802      	subs	r0, #2
2002a60a:	e6ba      	b.n	2002a382 <__udivmoddi4+0x8a>
2002a60c:	eba5 0c0c 	sub.w	ip, r5, ip
2002a610:	f1a8 0002 	sub.w	r0, r8, #2
2002a614:	4461      	add	r1, ip
2002a616:	fbb1 f8fe 	udiv	r8, r1, lr
2002a61a:	fb08 fc07 	mul.w	ip, r8, r7
2002a61e:	e7ca      	b.n	2002a5b6 <__udivmoddi4+0x2be>
2002a620:	f1a8 0802 	sub.w	r8, r8, #2
2002a624:	443c      	add	r4, r7
2002a626:	e744      	b.n	2002a4b2 <__udivmoddi4+0x1ba>
2002a628:	3b02      	subs	r3, #2
2002a62a:	443c      	add	r4, r7
2002a62c:	e75e      	b.n	2002a4ec <__udivmoddi4+0x1f4>
2002a62e:	4641      	mov	r1, r8
2002a630:	e791      	b.n	2002a556 <__udivmoddi4+0x25e>
2002a632:	eba1 010c 	sub.w	r1, r1, ip
2002a636:	4640      	mov	r0, r8
2002a638:	fbb1 f8fe 	udiv	r8, r1, lr
2002a63c:	fb08 fc07 	mul.w	ip, r8, r7
2002a640:	e7b9      	b.n	2002a5b6 <__udivmoddi4+0x2be>
2002a642:	bf00      	nop

2002a644 <__aeabi_idiv0>:
2002a644:	4770      	bx	lr
2002a646:	bf00      	nop

2002a648 <calloc>:
2002a648:	4b02      	ldr	r3, [pc, #8]	@ (2002a654 <calloc+0xc>)
2002a64a:	460a      	mov	r2, r1
2002a64c:	4601      	mov	r1, r0
2002a64e:	6818      	ldr	r0, [r3, #0]
2002a650:	f000 b802 	b.w	2002a658 <_calloc_r>
2002a654:	2004495c 	.word	0x2004495c

2002a658 <_calloc_r>:
2002a658:	b570      	push	{r4, r5, r6, lr}
2002a65a:	fba1 5402 	umull	r5, r4, r1, r2
2002a65e:	b934      	cbnz	r4, 2002a66e <_calloc_r+0x16>
2002a660:	4629      	mov	r1, r5
2002a662:	f000 f837 	bl	2002a6d4 <_malloc_r>
2002a666:	4606      	mov	r6, r0
2002a668:	b928      	cbnz	r0, 2002a676 <_calloc_r+0x1e>
2002a66a:	4630      	mov	r0, r6
2002a66c:	bd70      	pop	{r4, r5, r6, pc}
2002a66e:	220c      	movs	r2, #12
2002a670:	2600      	movs	r6, #0
2002a672:	6002      	str	r2, [r0, #0]
2002a674:	e7f9      	b.n	2002a66a <_calloc_r+0x12>
2002a676:	462a      	mov	r2, r5
2002a678:	4621      	mov	r1, r4
2002a67a:	f000 f8c7 	bl	2002a80c <memset>
2002a67e:	e7f4      	b.n	2002a66a <_calloc_r+0x12>

2002a680 <free>:
2002a680:	4b02      	ldr	r3, [pc, #8]	@ (2002a68c <free+0xc>)
2002a682:	4601      	mov	r1, r0
2002a684:	6818      	ldr	r0, [r3, #0]
2002a686:	f000 b8e9 	b.w	2002a85c <_free_r>
2002a68a:	bf00      	nop
2002a68c:	2004495c 	.word	0x2004495c

2002a690 <sbrk_aligned>:
2002a690:	b570      	push	{r4, r5, r6, lr}
2002a692:	4e0f      	ldr	r6, [pc, #60]	@ (2002a6d0 <sbrk_aligned+0x40>)
2002a694:	460c      	mov	r4, r1
2002a696:	4605      	mov	r5, r0
2002a698:	6831      	ldr	r1, [r6, #0]
2002a69a:	b911      	cbnz	r1, 2002a6a2 <sbrk_aligned+0x12>
2002a69c:	f000 f8be 	bl	2002a81c <_sbrk_r>
2002a6a0:	6030      	str	r0, [r6, #0]
2002a6a2:	4621      	mov	r1, r4
2002a6a4:	4628      	mov	r0, r5
2002a6a6:	f000 f8b9 	bl	2002a81c <_sbrk_r>
2002a6aa:	1c43      	adds	r3, r0, #1
2002a6ac:	d103      	bne.n	2002a6b6 <sbrk_aligned+0x26>
2002a6ae:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
2002a6b2:	4620      	mov	r0, r4
2002a6b4:	bd70      	pop	{r4, r5, r6, pc}
2002a6b6:	1cc4      	adds	r4, r0, #3
2002a6b8:	f024 0403 	bic.w	r4, r4, #3
2002a6bc:	42a0      	cmp	r0, r4
2002a6be:	d0f8      	beq.n	2002a6b2 <sbrk_aligned+0x22>
2002a6c0:	1a21      	subs	r1, r4, r0
2002a6c2:	4628      	mov	r0, r5
2002a6c4:	f000 f8aa 	bl	2002a81c <_sbrk_r>
2002a6c8:	3001      	adds	r0, #1
2002a6ca:	d1f2      	bne.n	2002a6b2 <sbrk_aligned+0x22>
2002a6cc:	e7ef      	b.n	2002a6ae <sbrk_aligned+0x1e>
2002a6ce:	bf00      	nop
2002a6d0:	2004d01c 	.word	0x2004d01c

2002a6d4 <_malloc_r>:
2002a6d4:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
2002a6d8:	1ccd      	adds	r5, r1, #3
2002a6da:	4606      	mov	r6, r0
2002a6dc:	f025 0503 	bic.w	r5, r5, #3
2002a6e0:	3508      	adds	r5, #8
2002a6e2:	2d0c      	cmp	r5, #12
2002a6e4:	bf38      	it	cc
2002a6e6:	250c      	movcc	r5, #12
2002a6e8:	2d00      	cmp	r5, #0
2002a6ea:	db01      	blt.n	2002a6f0 <_malloc_r+0x1c>
2002a6ec:	42a9      	cmp	r1, r5
2002a6ee:	d904      	bls.n	2002a6fa <_malloc_r+0x26>
2002a6f0:	230c      	movs	r3, #12
2002a6f2:	6033      	str	r3, [r6, #0]
2002a6f4:	2000      	movs	r0, #0
2002a6f6:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
2002a6fa:	f8df 80d4 	ldr.w	r8, [pc, #212]	@ 2002a7d0 <_malloc_r+0xfc>
2002a6fe:	f000 f869 	bl	2002a7d4 <__malloc_lock>
2002a702:	f8d8 3000 	ldr.w	r3, [r8]
2002a706:	461c      	mov	r4, r3
2002a708:	bb44      	cbnz	r4, 2002a75c <_malloc_r+0x88>
2002a70a:	4629      	mov	r1, r5
2002a70c:	4630      	mov	r0, r6
2002a70e:	f7ff ffbf 	bl	2002a690 <sbrk_aligned>
2002a712:	1c43      	adds	r3, r0, #1
2002a714:	4604      	mov	r4, r0
2002a716:	d158      	bne.n	2002a7ca <_malloc_r+0xf6>
2002a718:	f8d8 4000 	ldr.w	r4, [r8]
2002a71c:	4627      	mov	r7, r4
2002a71e:	2f00      	cmp	r7, #0
2002a720:	d143      	bne.n	2002a7aa <_malloc_r+0xd6>
2002a722:	2c00      	cmp	r4, #0
2002a724:	d04b      	beq.n	2002a7be <_malloc_r+0xea>
2002a726:	6823      	ldr	r3, [r4, #0]
2002a728:	4639      	mov	r1, r7
2002a72a:	4630      	mov	r0, r6
2002a72c:	eb04 0903 	add.w	r9, r4, r3
2002a730:	f000 f874 	bl	2002a81c <_sbrk_r>
2002a734:	4581      	cmp	r9, r0
2002a736:	d142      	bne.n	2002a7be <_malloc_r+0xea>
2002a738:	6821      	ldr	r1, [r4, #0]
2002a73a:	4630      	mov	r0, r6
2002a73c:	1a6d      	subs	r5, r5, r1
2002a73e:	4629      	mov	r1, r5
2002a740:	f7ff ffa6 	bl	2002a690 <sbrk_aligned>
2002a744:	3001      	adds	r0, #1
2002a746:	d03a      	beq.n	2002a7be <_malloc_r+0xea>
2002a748:	6823      	ldr	r3, [r4, #0]
2002a74a:	442b      	add	r3, r5
2002a74c:	6023      	str	r3, [r4, #0]
2002a74e:	f8d8 3000 	ldr.w	r3, [r8]
2002a752:	685a      	ldr	r2, [r3, #4]
2002a754:	bb62      	cbnz	r2, 2002a7b0 <_malloc_r+0xdc>
2002a756:	f8c8 7000 	str.w	r7, [r8]
2002a75a:	e00f      	b.n	2002a77c <_malloc_r+0xa8>
2002a75c:	6822      	ldr	r2, [r4, #0]
2002a75e:	1b52      	subs	r2, r2, r5
2002a760:	d420      	bmi.n	2002a7a4 <_malloc_r+0xd0>
2002a762:	2a0b      	cmp	r2, #11
2002a764:	d917      	bls.n	2002a796 <_malloc_r+0xc2>
2002a766:	1961      	adds	r1, r4, r5
2002a768:	42a3      	cmp	r3, r4
2002a76a:	6025      	str	r5, [r4, #0]
2002a76c:	bf18      	it	ne
2002a76e:	6059      	strne	r1, [r3, #4]
2002a770:	6863      	ldr	r3, [r4, #4]
2002a772:	bf08      	it	eq
2002a774:	f8c8 1000 	streq.w	r1, [r8]
2002a778:	5162      	str	r2, [r4, r5]
2002a77a:	604b      	str	r3, [r1, #4]
2002a77c:	4630      	mov	r0, r6
2002a77e:	f000 f82f 	bl	2002a7e0 <__malloc_unlock>
2002a782:	f104 000b 	add.w	r0, r4, #11
2002a786:	1d23      	adds	r3, r4, #4
2002a788:	f020 0007 	bic.w	r0, r0, #7
2002a78c:	1ac2      	subs	r2, r0, r3
2002a78e:	bf1c      	itt	ne
2002a790:	1a1b      	subne	r3, r3, r0
2002a792:	50a3      	strne	r3, [r4, r2]
2002a794:	e7af      	b.n	2002a6f6 <_malloc_r+0x22>
2002a796:	6862      	ldr	r2, [r4, #4]
2002a798:	42a3      	cmp	r3, r4
2002a79a:	bf0c      	ite	eq
2002a79c:	f8c8 2000 	streq.w	r2, [r8]
2002a7a0:	605a      	strne	r2, [r3, #4]
2002a7a2:	e7eb      	b.n	2002a77c <_malloc_r+0xa8>
2002a7a4:	4623      	mov	r3, r4
2002a7a6:	6864      	ldr	r4, [r4, #4]
2002a7a8:	e7ae      	b.n	2002a708 <_malloc_r+0x34>
2002a7aa:	463c      	mov	r4, r7
2002a7ac:	687f      	ldr	r7, [r7, #4]
2002a7ae:	e7b6      	b.n	2002a71e <_malloc_r+0x4a>
2002a7b0:	461a      	mov	r2, r3
2002a7b2:	685b      	ldr	r3, [r3, #4]
2002a7b4:	42a3      	cmp	r3, r4
2002a7b6:	d1fb      	bne.n	2002a7b0 <_malloc_r+0xdc>
2002a7b8:	2300      	movs	r3, #0
2002a7ba:	6053      	str	r3, [r2, #4]
2002a7bc:	e7de      	b.n	2002a77c <_malloc_r+0xa8>
2002a7be:	230c      	movs	r3, #12
2002a7c0:	4630      	mov	r0, r6
2002a7c2:	6033      	str	r3, [r6, #0]
2002a7c4:	f000 f80c 	bl	2002a7e0 <__malloc_unlock>
2002a7c8:	e794      	b.n	2002a6f4 <_malloc_r+0x20>
2002a7ca:	6005      	str	r5, [r0, #0]
2002a7cc:	e7d6      	b.n	2002a77c <_malloc_r+0xa8>
2002a7ce:	bf00      	nop
2002a7d0:	2004d020 	.word	0x2004d020

2002a7d4 <__malloc_lock>:
2002a7d4:	4801      	ldr	r0, [pc, #4]	@ (2002a7dc <__malloc_lock+0x8>)
2002a7d6:	f000 b831 	b.w	2002a83c <__retarget_lock_acquire_recursive>
2002a7da:	bf00      	nop
2002a7dc:	2004d15c 	.word	0x2004d15c

2002a7e0 <__malloc_unlock>:
2002a7e0:	4801      	ldr	r0, [pc, #4]	@ (2002a7e8 <__malloc_unlock+0x8>)
2002a7e2:	f000 b82c 	b.w	2002a83e <__retarget_lock_release_recursive>
2002a7e6:	bf00      	nop
2002a7e8:	2004d15c 	.word	0x2004d15c

2002a7ec <memcmp>:
2002a7ec:	3901      	subs	r1, #1
2002a7ee:	4402      	add	r2, r0
2002a7f0:	b510      	push	{r4, lr}
2002a7f2:	4290      	cmp	r0, r2
2002a7f4:	d101      	bne.n	2002a7fa <memcmp+0xe>
2002a7f6:	2000      	movs	r0, #0
2002a7f8:	e005      	b.n	2002a806 <memcmp+0x1a>
2002a7fa:	7803      	ldrb	r3, [r0, #0]
2002a7fc:	f811 4f01 	ldrb.w	r4, [r1, #1]!
2002a800:	42a3      	cmp	r3, r4
2002a802:	d001      	beq.n	2002a808 <memcmp+0x1c>
2002a804:	1b18      	subs	r0, r3, r4
2002a806:	bd10      	pop	{r4, pc}
2002a808:	3001      	adds	r0, #1
2002a80a:	e7f2      	b.n	2002a7f2 <memcmp+0x6>

2002a80c <memset>:
2002a80c:	4402      	add	r2, r0
2002a80e:	4603      	mov	r3, r0
2002a810:	4293      	cmp	r3, r2
2002a812:	d100      	bne.n	2002a816 <memset+0xa>
2002a814:	4770      	bx	lr
2002a816:	f803 1b01 	strb.w	r1, [r3], #1
2002a81a:	e7f9      	b.n	2002a810 <memset+0x4>

2002a81c <_sbrk_r>:
2002a81c:	b538      	push	{r3, r4, r5, lr}
2002a81e:	2300      	movs	r3, #0
2002a820:	4d05      	ldr	r5, [pc, #20]	@ (2002a838 <_sbrk_r+0x1c>)
2002a822:	4604      	mov	r4, r0
2002a824:	4608      	mov	r0, r1
2002a826:	602b      	str	r3, [r5, #0]
2002a828:	f000 f862 	bl	2002a8f0 <_sbrk>
2002a82c:	1c43      	adds	r3, r0, #1
2002a82e:	d102      	bne.n	2002a836 <_sbrk_r+0x1a>
2002a830:	682b      	ldr	r3, [r5, #0]
2002a832:	b103      	cbz	r3, 2002a836 <_sbrk_r+0x1a>
2002a834:	6023      	str	r3, [r4, #0]
2002a836:	bd38      	pop	{r3, r4, r5, pc}
2002a838:	2004d160 	.word	0x2004d160

2002a83c <__retarget_lock_acquire_recursive>:
2002a83c:	4770      	bx	lr

2002a83e <__retarget_lock_release_recursive>:
2002a83e:	4770      	bx	lr

2002a840 <memcpy>:
2002a840:	440a      	add	r2, r1
2002a842:	1e43      	subs	r3, r0, #1
2002a844:	4291      	cmp	r1, r2
2002a846:	d100      	bne.n	2002a84a <memcpy+0xa>
2002a848:	4770      	bx	lr
2002a84a:	b510      	push	{r4, lr}
2002a84c:	f811 4b01 	ldrb.w	r4, [r1], #1
2002a850:	4291      	cmp	r1, r2
2002a852:	f803 4f01 	strb.w	r4, [r3, #1]!
2002a856:	d1f9      	bne.n	2002a84c <memcpy+0xc>
2002a858:	bd10      	pop	{r4, pc}
	...

2002a85c <_free_r>:
2002a85c:	b538      	push	{r3, r4, r5, lr}
2002a85e:	4605      	mov	r5, r0
2002a860:	2900      	cmp	r1, #0
2002a862:	d041      	beq.n	2002a8e8 <_free_r+0x8c>
2002a864:	f851 3c04 	ldr.w	r3, [r1, #-4]
2002a868:	1f0c      	subs	r4, r1, #4
2002a86a:	2b00      	cmp	r3, #0
2002a86c:	bfb8      	it	lt
2002a86e:	18e4      	addlt	r4, r4, r3
2002a870:	f7ff ffb0 	bl	2002a7d4 <__malloc_lock>
2002a874:	4a1d      	ldr	r2, [pc, #116]	@ (2002a8ec <_free_r+0x90>)
2002a876:	6813      	ldr	r3, [r2, #0]
2002a878:	b933      	cbnz	r3, 2002a888 <_free_r+0x2c>
2002a87a:	6063      	str	r3, [r4, #4]
2002a87c:	6014      	str	r4, [r2, #0]
2002a87e:	4628      	mov	r0, r5
2002a880:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
2002a884:	f7ff bfac 	b.w	2002a7e0 <__malloc_unlock>
2002a888:	42a3      	cmp	r3, r4
2002a88a:	d908      	bls.n	2002a89e <_free_r+0x42>
2002a88c:	6820      	ldr	r0, [r4, #0]
2002a88e:	1821      	adds	r1, r4, r0
2002a890:	428b      	cmp	r3, r1
2002a892:	bf01      	itttt	eq
2002a894:	6819      	ldreq	r1, [r3, #0]
2002a896:	685b      	ldreq	r3, [r3, #4]
2002a898:	1809      	addeq	r1, r1, r0
2002a89a:	6021      	streq	r1, [r4, #0]
2002a89c:	e7ed      	b.n	2002a87a <_free_r+0x1e>
2002a89e:	461a      	mov	r2, r3
2002a8a0:	685b      	ldr	r3, [r3, #4]
2002a8a2:	b10b      	cbz	r3, 2002a8a8 <_free_r+0x4c>
2002a8a4:	42a3      	cmp	r3, r4
2002a8a6:	d9fa      	bls.n	2002a89e <_free_r+0x42>
2002a8a8:	6811      	ldr	r1, [r2, #0]
2002a8aa:	1850      	adds	r0, r2, r1
2002a8ac:	42a0      	cmp	r0, r4
2002a8ae:	d10b      	bne.n	2002a8c8 <_free_r+0x6c>
2002a8b0:	6820      	ldr	r0, [r4, #0]
2002a8b2:	4401      	add	r1, r0
2002a8b4:	1850      	adds	r0, r2, r1
2002a8b6:	6011      	str	r1, [r2, #0]
2002a8b8:	4283      	cmp	r3, r0
2002a8ba:	d1e0      	bne.n	2002a87e <_free_r+0x22>
2002a8bc:	6818      	ldr	r0, [r3, #0]
2002a8be:	685b      	ldr	r3, [r3, #4]
2002a8c0:	4408      	add	r0, r1
2002a8c2:	6053      	str	r3, [r2, #4]
2002a8c4:	6010      	str	r0, [r2, #0]
2002a8c6:	e7da      	b.n	2002a87e <_free_r+0x22>
2002a8c8:	d902      	bls.n	2002a8d0 <_free_r+0x74>
2002a8ca:	230c      	movs	r3, #12
2002a8cc:	602b      	str	r3, [r5, #0]
2002a8ce:	e7d6      	b.n	2002a87e <_free_r+0x22>
2002a8d0:	6820      	ldr	r0, [r4, #0]
2002a8d2:	1821      	adds	r1, r4, r0
2002a8d4:	428b      	cmp	r3, r1
2002a8d6:	bf02      	ittt	eq
2002a8d8:	6819      	ldreq	r1, [r3, #0]
2002a8da:	685b      	ldreq	r3, [r3, #4]
2002a8dc:	1809      	addeq	r1, r1, r0
2002a8de:	6063      	str	r3, [r4, #4]
2002a8e0:	bf08      	it	eq
2002a8e2:	6021      	streq	r1, [r4, #0]
2002a8e4:	6054      	str	r4, [r2, #4]
2002a8e6:	e7ca      	b.n	2002a87e <_free_r+0x22>
2002a8e8:	bd38      	pop	{r3, r4, r5, pc}
2002a8ea:	bf00      	nop
2002a8ec:	2004d020 	.word	0x2004d020

2002a8f0 <_sbrk>:
2002a8f0:	4a05      	ldr	r2, [pc, #20]	@ (2002a908 <_sbrk+0x18>)
2002a8f2:	4603      	mov	r3, r0
2002a8f4:	6810      	ldr	r0, [r2, #0]
2002a8f6:	b110      	cbz	r0, 2002a8fe <_sbrk+0xe>
2002a8f8:	4403      	add	r3, r0
2002a8fa:	6013      	str	r3, [r2, #0]
2002a8fc:	4770      	bx	lr
2002a8fe:	4803      	ldr	r0, [pc, #12]	@ (2002a90c <_sbrk+0x1c>)
2002a900:	4403      	add	r3, r0
2002a902:	6013      	str	r3, [r2, #0]
2002a904:	4770      	bx	lr
2002a906:	bf00      	nop
2002a908:	2004d164 	.word	0x2004d164
2002a90c:	20042000 	.word	0x20042000
2002a910:	50041000 	.word	0x50041000
2002a914:	00000002 	.word	0x00000002
2002a918:	10000000 	.word	0x10000000
2002a91c:	00000004 	.word	0x00000004
2002a920:	00000000 	.word	0x00000000
2002a924:	50081008 	.word	0x50081008
2002a928:	00000000 	.word	0x00000000
2002a92c:	00000032 	.word	0x00000032
2002a930:	00000000 	.word	0x00000000
2002a934:	50042000 	.word	0x50042000
2002a938:	00000002 	.word	0x00000002
2002a93c:	12000000 	.word	0x12000000
2002a940:	00000004 	.word	0x00000004
2002a944:	00000000 	.word	0x00000000
2002a948:	5008101c 	.word	0x5008101c
2002a94c:	00000000 	.word	0x00000000
2002a950:	00000033 	.word	0x00000033
2002a954:	00000001 	.word	0x00000001
2002a958:	62636573 	.word	0x62636573
2002a95c:	20746f6f 	.word	0x20746f6f
2002a960:	6b676973 	.word	0x6b676973
2002a964:	70207965 	.word	0x70207965
2002a968:	65206275 	.word	0x65206275
2002a96c:	00217272 	.word	0x00217272
2002a970:	62636573 	.word	0x62636573
2002a974:	20746f6f 	.word	0x20746f6f
2002a978:	20676d69 	.word	0x20676d69
2002a97c:	68736168 	.word	0x68736168
2002a980:	67697320 	.word	0x67697320
2002a984:	72726520 	.word	0x72726520
2002a988:	65730021 	.word	0x65730021
2002a98c:	6f6f6263 	.word	0x6f6f6263
2002a990:	78652074 	.word	0x78652074
2002a994:	20747063 	.word	0x20747063
2002a998:	6c6c756e 	.word	0x6c6c756e
2002a99c:	41480021 	.word	0x41480021
2002a9a0:	535f4853 	.word	0x535f4853
2002a9a4:	49545445 	.word	0x49545445
2002a9a8:	253d474e 	.word	0x253d474e
2002a9ac:	0a583830 	.word	0x0a583830
2002a9b0:	616f4c00 	.word	0x616f4c00
2002a9b4:	56492064 	.word	0x56492064
2002a9b8:	646e6120 	.word	0x646e6120
2002a9bc:	6e656c20 	.word	0x6e656c20
2002a9c0:	20687467 	.word	0x20687467
2002a9c4:	48534148 	.word	0x48534148
2002a9c8:	5445535f 	.word	0x5445535f
2002a9cc:	474e4954 	.word	0x474e4954
2002a9d0:	3830253d 	.word	0x3830253d
2002a9d4:	69202c58 	.word	0x69202c58
2002a9d8:	656c2076 	.word	0x656c2076
2002a9dc:	6874676e 	.word	0x6874676e
2002a9e0:	0a64253d 	.word	0x0a64253d
2002a9e4:	73655200 	.word	0x73655200
2002a9e8:	20746c75 	.word	0x20746c75
2002a9ec:	3d6e656c 	.word	0x3d6e656c
2002a9f0:	000a6425 	.word	0x000a6425
2002a9f4:	2070614d 	.word	0x2070614d
2002a9f8:	6f727265 	.word	0x6f727265
2002a9fc:	6c203a72 	.word	0x6c203a72
2002aa00:	6369676f 	.word	0x6369676f
2002aa04:	2c642520 	.word	0x2c642520
2002aa08:	79687020 	.word	0x79687020
2002aa0c:	0a642520 	.word	0x0a642520
2002aa10:	52524500 	.word	0x52524500
2002aa14:	2032203a 	.word	0x2032203a
2002aa18:	69676f6c 	.word	0x69676f6c
2002aa1c:	6c622063 	.word	0x6c622063
2002aa20:	736b636f 	.word	0x736b636f
2002aa24:	70616d20 	.word	0x70616d20
2002aa28:	206f7420 	.word	0x206f7420
2002aa2c:	656d6173 	.word	0x656d6173
2002aa30:	6b6c6220 	.word	0x6b6c6220
2002aa34:	6f6c203a 	.word	0x6f6c203a
2002aa38:	30636967 	.word	0x30636967
2002aa3c:	2c642520 	.word	0x2c642520
2002aa40:	79687020 	.word	0x79687020
2002aa44:	64252030 	.word	0x64252030
2002aa48:	6f6c202c 	.word	0x6f6c202c
2002aa4c:	31636967 	.word	0x31636967
2002aa50:	2c642520 	.word	0x2c642520
2002aa54:	79687020 	.word	0x79687020
2002aa58:	64252031 	.word	0x64252031
2002aa5c:	614d000a 	.word	0x614d000a
2002aa60:	72652070 	.word	0x72652070
2002aa64:	30726f72 	.word	0x30726f72
2002aa68:	6f6c203a 	.word	0x6f6c203a
2002aa6c:	20636967 	.word	0x20636967
2002aa70:	202c6425 	.word	0x202c6425
2002aa74:	20796870 	.word	0x20796870
2002aa78:	000a6425 	.word	0x000a6425
2002aa7c:	20746547 	.word	0x20746547
2002aa80:	2070616d 	.word	0x2070616d
2002aa84:	636f6c62 	.word	0x636f6c62
2002aa88:	7265206b 	.word	0x7265206b
2002aa8c:	20726f72 	.word	0x20726f72
2002aa90:	2d206425 	.word	0x2d206425
2002aa94:	25203e2d 	.word	0x25203e2d
2002aa98:	42000a64 	.word	0x42000a64
2002aa9c:	76204d42 	.word	0x76204d42
2002aaa0:	69737265 	.word	0x69737265
2002aaa4:	6e206e6f 	.word	0x6e206e6f
2002aaa8:	6920746f 	.word	0x6920746f
2002aaac:	6572636e 	.word	0x6572636e
2002aab0:	64657361 	.word	0x64657361
2002aab4:	7270203a 	.word	0x7270203a
2002aab8:	25207665 	.word	0x25207665
2002aabc:	63202c64 	.word	0x63202c64
2002aac0:	20727275 	.word	0x20727275
2002aac4:	000a6425 	.word	0x000a6425
2002aac8:	41544144 	.word	0x41544144
2002aacc:	746f6e20 	.word	0x746f6e20
2002aad0:	61657220 	.word	0x61657220
2002aad4:	616e6f73 	.word	0x616e6f73
2002aad8:	20656c62 	.word	0x20656c62
2002aadc:	42206e69 	.word	0x42206e69
2002aae0:	62204d42 	.word	0x62204d42
2002aae4:	25206b6c 	.word	0x25206b6c
2002aae8:	61702064 	.word	0x61702064
2002aaec:	25206567 	.word	0x25206567
2002aaf0:	30203a64 	.word	0x30203a64
2002aaf4:	0a782578 	.word	0x0a782578
2002aaf8:	61655200 	.word	0x61655200
2002aafc:	62622064 	.word	0x62622064
2002ab00:	6c62206d 	.word	0x6c62206d
2002ab04:	6425206b 	.word	0x6425206b
2002ab08:	67617020 	.word	0x67617020
2002ab0c:	64252065 	.word	0x64252065
2002ab10:	69616620 	.word	0x69616620
2002ab14:	49000a6c 	.word	0x49000a6c
2002ab18:	6c61766e 	.word	0x6c61766e
2002ab1c:	42206469 	.word	0x42206469
2002ab20:	49204d42 	.word	0x49204d42
2002ab24:	25205844 	.word	0x25205844
2002ab28:	56000a64 	.word	0x56000a64
2002ab2c:	64252031 	.word	0x64252031
2002ab30:	206e6920 	.word	0x206e6920
2002ab34:	636f6c62 	.word	0x636f6c62
2002ab38:	6425206b 	.word	0x6425206b
2002ab3c:	3256202c 	.word	0x3256202c
2002ab40:	20642520 	.word	0x20642520
2002ab44:	62206e69 	.word	0x62206e69
2002ab48:	6b636f6c 	.word	0x6b636f6c
2002ab4c:	0a642520 	.word	0x0a642520
2002ab50:	6d615300 	.word	0x6d615300
2002ab54:	69687465 	.word	0x69687465
2002ab58:	6d20676e 	.word	0x6d20676e
2002ab5c:	20747375 	.word	0x20747375
2002ab60:	77206562 	.word	0x77206562
2002ab64:	676e6f72 	.word	0x676e6f72
2002ab68:	6567202c 	.word	0x6567202c
2002ab6c:	656e2074 	.word	0x656e2074
2002ab70:	65762077 	.word	0x65762077
2002ab74:	6f697372 	.word	0x6f697372
2002ab78:	6425206e 	.word	0x6425206e
2002ab7c:	206f6420 	.word	0x206f6420
2002ab80:	20746f6e 	.word	0x20746f6e
2002ab84:	656d6173 	.word	0x656d6173
2002ab88:	206f7420 	.word	0x206f7420
2002ab8c:	76657270 	.word	0x76657270
2002ab90:	65686320 	.word	0x65686320
2002ab94:	25206b63 	.word	0x25206b63
2002ab98:	43000a64 	.word	0x43000a64
2002ab9c:	63204352 	.word	0x63204352
2002aba0:	6b636568 	.word	0x6b636568
2002aba4:	72726520 	.word	0x72726520
2002aba8:	0a20726f 	.word	0x0a20726f
2002abac:	61655200 	.word	0x61655200
2002abb0:	62622064 	.word	0x62622064
2002abb4:	6c62206d 	.word	0x6c62206d
2002abb8:	6425206b 	.word	0x6425206b
2002abbc:	67617020 	.word	0x67617020
2002abc0:	64252065 	.word	0x64252065
2002abc4:	74616420 	.word	0x74616420
2002abc8:	6f6e2061 	.word	0x6f6e2061
2002abcc:	72772074 	.word	0x72772074
2002abd0:	20657469 	.word	0x20657469
2002abd4:	20726f66 	.word	0x20726f66
2002abd8:	20646e32 	.word	0x20646e32
2002abdc:	656d6974 	.word	0x656d6974
2002abe0:	6552000a 	.word	0x6552000a
2002abe4:	62206461 	.word	0x62206461
2002abe8:	62206d62 	.word	0x62206d62
2002abec:	25206b6c 	.word	0x25206b6c
2002abf0:	61702064 	.word	0x61702064
2002abf4:	25206567 	.word	0x25206567
2002abf8:	61662064 	.word	0x61662064
2002abfc:	66206c69 	.word	0x66206c69
2002ac00:	3220726f 	.word	0x3220726f
2002ac04:	7420646e 	.word	0x7420646e
2002ac08:	3f656d69 	.word	0x3f656d69
2002ac0c:	614c000a 	.word	0x614c000a
2002ac10:	74736574 	.word	0x74736574
2002ac14:	72657620 	.word	0x72657620
2002ac18:	6e6f6973 	.word	0x6e6f6973
2002ac1c:	0a642520 	.word	0x0a642520
2002ac20:	74654700 	.word	0x74654700
2002ac24:	79687020 	.word	0x79687020
2002ac28:	6b6c6220 	.word	0x6b6c6220
2002ac2c:	726f6620 	.word	0x726f6620
2002ac30:	20642520 	.word	0x20642520
2002ac34:	6c696166 	.word	0x6c696166
2002ac38:	65687720 	.word	0x65687720
2002ac3c:	6572206e 	.word	0x6572206e
2002ac40:	000a6461 	.word	0x000a6461
2002ac44:	636f6c42 	.word	0x636f6c42
2002ac48:	6425206b 	.word	0x6425206b
2002ac4c:	61726520 	.word	0x61726520
2002ac50:	66206573 	.word	0x66206573
2002ac54:	2c6c6961 	.word	0x2c6c6961
2002ac58:	72616d20 	.word	0x72616d20
2002ac5c:	7361206b 	.word	0x7361206b
2002ac60:	64616220 	.word	0x64616220
2002ac64:	6c42000a 	.word	0x6c42000a
2002ac68:	206b636f 	.word	0x206b636f
2002ac6c:	63206425 	.word	0x63206425
2002ac70:	6b636568 	.word	0x6b636568
2002ac74:	20736120 	.word	0x20736120
2002ac78:	20646162 	.word	0x20646162
2002ac7c:	636f6c62 	.word	0x636f6c62
2002ac80:	42000a6b 	.word	0x42000a6b
2002ac84:	6b636f6c 	.word	0x6b636f6c
2002ac88:	20642520 	.word	0x20642520
2002ac8c:	62207369 	.word	0x62207369
2002ac90:	69206461 	.word	0x69206461
2002ac94:	7375206e 	.word	0x7375206e
2002ac98:	62207265 	.word	0x62207265
2002ac9c:	6b636f6c 	.word	0x6b636f6c
2002aca0:	6162000a 	.word	0x6162000a
2002aca4:	64252064 	.word	0x64252064
2002aca8:	6572202c 	.word	0x6572202c
2002acac:	63616c70 	.word	0x63616c70
2002acb0:	64252065 	.word	0x64252065
2002acb4:	6f4e000a 	.word	0x6f4e000a
2002acb8:	63616220 	.word	0x63616220
2002acbc:	2070756b 	.word	0x2070756b
2002acc0:	636f6c62 	.word	0x636f6c62
2002acc4:	6e61206b 	.word	0x6e61206b
2002acc8:	6f6d2079 	.word	0x6f6d2079
2002accc:	000a6572 	.word	0x000a6572
2002acd0:	74706d65 	.word	0x74706d65
2002acd4:	61742079 	.word	0x61742079
2002acd8:	20656c62 	.word	0x20656c62
2002acdc:	6e206425 	.word	0x6e206425
2002ace0:	6520746f 	.word	0x6520746f
2002ace4:	67756f6e 	.word	0x67756f6e
2002ace8:	6f662068 	.word	0x6f662068
2002acec:	6e692072 	.word	0x6e692072
2002acf0:	61697469 	.word	0x61697469
2002acf4:	55000a6c 	.word	0x55000a6c
2002acf8:	74616470 	.word	0x74616470
2002acfc:	61742065 	.word	0x61742065
2002ad00:	20656c62 	.word	0x20656c62
2002ad04:	66206f74 	.word	0x66206f74
2002ad08:	6873616c 	.word	0x6873616c
2002ad0c:	6e6f6420 	.word	0x6e6f6420
2002ad10:	49000a65 	.word	0x49000a65
2002ad14:	6974696e 	.word	0x6974696e
2002ad18:	74206c61 	.word	0x74206c61
2002ad1c:	656c6261 	.word	0x656c6261
2002ad20:	69616620 	.word	0x69616620
2002ad24:	42000a6c 	.word	0x42000a6c
2002ad28:	69204d42 	.word	0x69204d42
2002ad2c:	6974696e 	.word	0x6974696e
2002ad30:	7a696c61 	.word	0x7a696c61
2002ad34:	62206465 	.word	0x62206465
2002ad38:	726f6665 	.word	0x726f6665
2002ad3c:	64202c65 	.word	0x64202c65
2002ad40:	6f6e206f 	.word	0x6f6e206f
2002ad44:	6e692074 	.word	0x6e692074
2002ad48:	61207469 	.word	0x61207469
2002ad4c:	6d20796e 	.word	0x6d20796e
2002ad50:	0a65726f 	.word	0x0a65726f
2002ad54:	54454400 	.word	0x54454400
2002ad58:	20642520 	.word	0x20642520
2002ad5c:	0a646162 	.word	0x0a646162
2002ad60:	4b4c4200 	.word	0x4b4c4200
2002ad64:	20642520 	.word	0x20642520
2002ad68:	64616572 	.word	0x64616572
2002ad6c:	69616620 	.word	0x69616620
2002ad70:	6d202c6c 	.word	0x6d202c6c
2002ad74:	206b7261 	.word	0x206b7261
2002ad78:	62207361 	.word	0x62207361
2002ad7c:	000a6461 	.word	0x000a6461
2002ad80:	20746564 	.word	0x20746564
2002ad84:	206d6262 	.word	0x206d6262
2002ad88:	6c626174 	.word	0x6c626174
2002ad8c:	69772065 	.word	0x69772065
2002ad90:	25206874 	.word	0x25206874
2002ad94:	25202c64 	.word	0x25202c64
2002ad98:	25202c64 	.word	0x25202c64
2002ad9c:	64000a64 	.word	0x64000a64
2002ada0:	63657465 	.word	0x63657465
2002ada4:	65722074 	.word	0x65722074
2002ada8:	746c7573 	.word	0x746c7573
2002adac:	0a642520 	.word	0x0a642520
2002adb0:	20317600 	.word	0x20317600
2002adb4:	69206425 	.word	0x69206425
2002adb8:	6c62206e 	.word	0x6c62206e
2002adbc:	6425206b 	.word	0x6425206b
2002adc0:	3276202c 	.word	0x3276202c
2002adc4:	20642520 	.word	0x20642520
2002adc8:	62206e69 	.word	0x62206e69
2002adcc:	6b636f6c 	.word	0x6b636f6c
2002add0:	0a642520 	.word	0x0a642520
2002add4:	65684300 	.word	0x65684300
2002add8:	62206b63 	.word	0x62206b63
2002addc:	74206d62 	.word	0x74206d62
2002ade0:	656c6261 	.word	0x656c6261
2002ade4:	69616620 	.word	0x69616620
2002ade8:	64000a6c 	.word	0x64000a6c
2002adec:	63657465 	.word	0x63657465
2002adf0:	65722074 	.word	0x65722074
2002adf4:	746c7573 	.word	0x746c7573
2002adf8:	20642520 	.word	0x20642520
2002adfc:	20746f6e 	.word	0x20746f6e
2002ae00:	73616572 	.word	0x73616572
2002ae04:	62616e6f 	.word	0x62616e6f
2002ae08:	000a656c 	.word	0x000a656c
2002ae0c:	204d4242 	.word	0x204d4242
2002ae10:	3a4d454d 	.word	0x3a4d454d
2002ae14:	78746320 	.word	0x78746320
2002ae18:	2c702520 	.word	0x2c702520
2002ae1c:	70616d20 	.word	0x70616d20
2002ae20:	70252031 	.word	0x70252031
2002ae24:	616d202c 	.word	0x616d202c
2002ae28:	25203270 	.word	0x25203270
2002ae2c:	000a2070 	.word	0x000a2070
2002ae30:	5f666973 	.word	0x5f666973
2002ae34:	5f6d6262 	.word	0x5f6d6262
2002ae38:	74696e69 	.word	0x74696e69
2002ae3c:	6e6f6420 	.word	0x6e6f6420
2002ae40:	53000a65 	.word	0x53000a65
2002ae44:	31354148 	.word	0x31354148
2002ae48:	48530032 	.word	0x48530032
2002ae4c:	34383341 	.word	0x34383341
2002ae50:	41485300 	.word	0x41485300
2002ae54:	00363532 	.word	0x00363532
2002ae58:	32414853 	.word	0x32414853
2002ae5c:	60003432 	.word	0x60003432
2002ae60:	65014886 	.word	0x65014886
2002ae64:	04020403 	.word	0x04020403
2002ae68:	2d646900 	.word	0x2d646900
2002ae6c:	32616873 	.word	0x32616873
2002ae70:	60003432 	.word	0x60003432
2002ae74:	65014886 	.word	0x65014886
2002ae78:	01020403 	.word	0x01020403
2002ae7c:	2d646900 	.word	0x2d646900
2002ae80:	32616873 	.word	0x32616873
2002ae84:	60003635 	.word	0x60003635
2002ae88:	65014886 	.word	0x65014886
2002ae8c:	02020403 	.word	0x02020403
2002ae90:	2d646900 	.word	0x2d646900
2002ae94:	33616873 	.word	0x33616873
2002ae98:	60003438 	.word	0x60003438
2002ae9c:	65014886 	.word	0x65014886
2002aea0:	03020403 	.word	0x03020403
2002aea4:	2d646900 	.word	0x2d646900
2002aea8:	35616873 	.word	0x35616873
2002aeac:	2b003231 	.word	0x2b003231
2002aeb0:	0702030e 	.word	0x0702030e
2002aeb4:	73656400 	.word	0x73656400
2002aeb8:	00434243 	.word	0x00434243
2002aebc:	2d534544 	.word	0x2d534544
2002aec0:	00434243 	.word	0x00434243
2002aec4:	8648862a 	.word	0x8648862a
2002aec8:	07030df7 	.word	0x07030df7
2002aecc:	73656400 	.word	0x73656400
2002aed0:	6564652d 	.word	0x6564652d
2002aed4:	62632d33 	.word	0x62632d33
2002aed8:	45440063 	.word	0x45440063
2002aedc:	44452d53 	.word	0x44452d53
2002aee0:	432d3345 	.word	0x432d3345
2002aee4:	2a004342 	.word	0x2a004342
2002aee8:	f7864886 	.word	0xf7864886
2002aeec:	0101010d 	.word	0x0101010d
2002aef0:	61737200 	.word	0x61737200
2002aef4:	72636e45 	.word	0x72636e45
2002aef8:	69747079 	.word	0x69747079
2002aefc:	52006e6f 	.word	0x52006e6f
2002af00:	2a004153 	.word	0x2a004153
2002af04:	3dce4886 	.word	0x3dce4886
2002af08:	69000102 	.word	0x69000102
2002af0c:	63652d64 	.word	0x63652d64
2002af10:	6c627550 	.word	0x6c627550
2002af14:	654b6369 	.word	0x654b6369
2002af18:	65470079 	.word	0x65470079
2002af1c:	6972656e 	.word	0x6972656e
2002af20:	43452063 	.word	0x43452063
2002af24:	79656b20 	.word	0x79656b20
2002af28:	04812b00 	.word	0x04812b00
2002af2c:	69000c01 	.word	0x69000c01
2002af30:	63652d64 	.word	0x63652d64
2002af34:	45004844 	.word	0x45004844
2002af38:	656b2043 	.word	0x656b2043
2002af3c:	6f662079 	.word	0x6f662079
2002af40:	43452072 	.word	0x43452072
2002af44:	2a004844 	.word	0x2a004844
2002af48:	f7864886 	.word	0xf7864886
2002af4c:	0e01010d 	.word	0x0e01010d
2002af50:	61687300 	.word	0x61687300
2002af54:	57343232 	.word	0x57343232
2002af58:	52687469 	.word	0x52687469
2002af5c:	6e454153 	.word	0x6e454153
2002af60:	70797263 	.word	0x70797263
2002af64:	6e6f6974 	.word	0x6e6f6974
2002af68:	41535200 	.word	0x41535200
2002af6c:	74697720 	.word	0x74697720
2002af70:	48532068 	.word	0x48532068
2002af74:	32322d41 	.word	0x32322d41
2002af78:	862a0034 	.word	0x862a0034
2002af7c:	0df78648 	.word	0x0df78648
2002af80:	000b0101 	.word	0x000b0101
2002af84:	32616873 	.word	0x32616873
2002af88:	69573635 	.word	0x69573635
2002af8c:	53526874 	.word	0x53526874
2002af90:	636e4541 	.word	0x636e4541
2002af94:	74707972 	.word	0x74707972
2002af98:	006e6f69 	.word	0x006e6f69
2002af9c:	20415352 	.word	0x20415352
2002afa0:	68746977 	.word	0x68746977
2002afa4:	41485320 	.word	0x41485320
2002afa8:	3635322d 	.word	0x3635322d
2002afac:	48862a00 	.word	0x48862a00
2002afb0:	010df786 	.word	0x010df786
2002afb4:	73000c01 	.word	0x73000c01
2002afb8:	38336168 	.word	0x38336168
2002afbc:	74695734 	.word	0x74695734
2002afc0:	41535268 	.word	0x41535268
2002afc4:	72636e45 	.word	0x72636e45
2002afc8:	69747079 	.word	0x69747079
2002afcc:	52006e6f 	.word	0x52006e6f
2002afd0:	77204153 	.word	0x77204153
2002afd4:	20687469 	.word	0x20687469
2002afd8:	2d414853 	.word	0x2d414853
2002afdc:	00343833 	.word	0x00343833
2002afe0:	8648862a 	.word	0x8648862a
2002afe4:	01010df7 	.word	0x01010df7
2002afe8:	6873000d 	.word	0x6873000d
2002afec:	32313561 	.word	0x32313561
2002aff0:	68746957 	.word	0x68746957
2002aff4:	45415352 	.word	0x45415352
2002aff8:	7972636e 	.word	0x7972636e
2002affc:	6f697470 	.word	0x6f697470
2002b000:	5352006e 	.word	0x5352006e
2002b004:	69772041 	.word	0x69772041
2002b008:	53206874 	.word	0x53206874
2002b00c:	352d4148 	.word	0x352d4148
2002b010:	2a003231 	.word	0x2a003231
2002b014:	f7864886 	.word	0xf7864886
2002b018:	0a01010d 	.word	0x0a01010d
2002b01c:	41535200 	.word	0x41535200
2002b020:	2d415353 	.word	0x2d415353
2002b024:	00535350 	.word	0x00535350
2002b028:	2e617372 	.word	0x2e617372
2002b02c:	7372004e 	.word	0x7372004e
2002b030:	00452e61 	.word	0x00452e61

2002b034 <HASH_SIZE>:
2002b034:	20202014 00000000 04030201 00000000     .   ............
2002b044:	01060204                                ....

2002b048 <CSWTCH.52>:
2002b048:	0000003f 00003f00 003f0000              ?....?....?.

2002b054 <hpsys_dll2_limit>:
	...
2002b05c:	112a8800 112a8800                       ..*...*.

2002b064 <hpsys_dvfs_config>:
2002b064:	000906fb 00100330 000a08fd 00110331     ....0.......1...
2002b074:	000d0b00 00130213 000f0d02 00130213     ................

2002b084 <crc32tab>:
2002b084:	00000000 77073096 ee0e612c 990951ba     .....0.w,a...Q..
2002b094:	076dc419 706af48f e963a535 9e6495a3     ..m...jp5.c...d.
2002b0a4:	0edb8832 79dcb8a4 e0d5e91e 97d2d988     2......y........
2002b0b4:	09b64c2b 7eb17cbd e7b82d07 90bf1d91     +L...|.~.-......
2002b0c4:	1db71064 6ab020f2 f3b97148 84be41de     d.... .jHq...A..
2002b0d4:	1adad47d 6ddde4eb f4d4b551 83d385c7     }......mQ.......
2002b0e4:	136c9856 646ba8c0 fd62f97a 8a65c9ec     V.l...kdz.b...e.
2002b0f4:	14015c4f 63066cd9 fa0f3d63 8d080df5     O\...l.cc=......
2002b104:	3b6e20c8 4c69105e d56041e4 a2677172     . n;^.iL.A`.rqg.
2002b114:	3c03e4d1 4b04d447 d20d85fd a50ab56b     ...<G..K....k...
2002b124:	35b5a8fa 42b2986c dbbbc9d6 acbcf940     ...5l..B....@...
2002b134:	32d86ce3 45df5c75 dcd60dcf abd13d59     .l.2u\.E....Y=..
2002b144:	26d930ac 51de003a c8d75180 bfd06116     .0.&:..Q.Q...a..
2002b154:	21b4f4b5 56b3c423 cfba9599 b8bda50f     ...!#..V........
2002b164:	2802b89e 5f058808 c60cd9b2 b10be924     ...(..._....$...
2002b174:	2f6f7c87 58684c11 c1611dab b6662d3d     .|o/.LhX..a.=-f.
2002b184:	76dc4190 01db7106 98d220bc efd5102a     .A.v.q... ..*...
2002b194:	71b18589 06b6b51f 9fbfe4a5 e8b8d433     ...q........3...
2002b1a4:	7807c9a2 0f00f934 9609a88e e10e9818     ...x4...........
2002b1b4:	7f6a0dbb 086d3d2d 91646c97 e6635c01     ..j.-=m..ld..\c.
2002b1c4:	6b6b51f4 1c6c6162 856530d8 f262004e     .Qkkbal..0e.N.b.
2002b1d4:	6c0695ed 1b01a57b 8208f4c1 f50fc457     ...l{.......W...
2002b1e4:	65b0d9c6 12b7e950 8bbeb8ea fcb9887c     ...eP.......|...
2002b1f4:	62dd1ddf 15da2d49 8cd37cf3 fbd44c65     ...bI-...|..eL..
2002b204:	4db26158 3ab551ce a3bc0074 d4bb30e2     Xa.M.Q.:t....0..
2002b214:	4adfa541 3dd895d7 a4d1c46d d3d6f4fb     A..J...=m.......
2002b224:	4369e96a 346ed9fc ad678846 da60b8d0     j.iC..n4F.g...`.
2002b234:	44042d73 33031de5 aa0a4c5f dd0d7cc9     s-.D...3_L...|..
2002b244:	5005713c 270241aa be0b1010 c90c2086     <q.P.A.'..... ..
2002b254:	5768b525 206f85b3 b966d409 ce61e49f     %.hW..o ..f...a.
2002b264:	5edef90e 29d9c998 b0d09822 c7d7a8b4     ...^...)".......
2002b274:	59b33d17 2eb40d81 b7bd5c3b c0ba6cad     .=.Y....;\...l..
2002b284:	edb88320 9abfb3b6 03b6e20c 74b1d29a      ..............t
2002b294:	ead54739 9dd277af 04db2615 73dc1683     9G...w...&.....s
2002b2a4:	e3630b12 94643b84 0d6d6a3e 7a6a5aa8     ..c..;d.>jm..Zjz
2002b2b4:	e40ecf0b 9309ff9d 0a00ae27 7d079eb1     ........'......}
2002b2c4:	f00f9344 8708a3d2 1e01f268 6906c2fe     D.......h......i
2002b2d4:	f762575d 806567cb 196c3671 6e6b06e7     ]Wb..ge.q6l...kn
2002b2e4:	fed41b76 89d32be0 10da7a5a 67dd4acc     v....+..Zz...J.g
2002b2f4:	f9b9df6f 8ebeeff9 17b7be43 60b08ed5     o.......C......`
2002b304:	d6d6a3e8 a1d1937e 38d8c2c4 4fdff252     ....~......8R..O
2002b314:	d1bb67f1 a6bc5767 3fb506dd 48b2364b     .g..gW.....?K6.H
2002b324:	d80d2bda af0a1b4c 36034af6 41047a60     .+..L....J.6`z.A
2002b334:	df60efc3 a867df55 316e8eef 4669be79     ..`.U.g...n1y.iF
2002b344:	cb61b38c bc66831a 256fd2a0 5268e236     ..a...f...o%6.hR
2002b354:	cc0c7795 bb0b4703 220216b9 5505262f     .w...G....."/&.U
2002b364:	c5ba3bbe b2bd0b28 2bb45a92 5cb36a04     .;..(....Z.+.j.\
2002b374:	c2d7ffa7 b5d0cf31 2cd99e8b 5bdeae1d     ....1......,...[
2002b384:	9b64c2b0 ec63f226 756aa39c 026d930a     ..d.&.c...ju..m.
2002b394:	9c0906a9 eb0e363f 72076785 05005713     ....?6...g.r.W..
2002b3a4:	95bf4a82 e2b87a14 7bb12bae 0cb61b38     .J...z...+.{8...
2002b3b4:	92d28e9b e5d5be0d 7cdcefb7 0bdbdf21     ...........|!...
2002b3c4:	86d3d2d4 f1d4e242 68ddb3f8 1fda836e     ....B......hn...
2002b3d4:	81be16cd f6b9265b 6fb077e1 18b74777     ....[&...w.owG..
2002b3e4:	88085ae6 ff0f6a70 66063bca 11010b5c     .Z..pj...;.f\...
2002b3f4:	8f659eff f862ae69 616bffd3 166ccf45     ..e.i.b...kaE.l.
2002b404:	a00ae278 d70dd2ee 4e048354 3903b3c2     x.......T..N...9
2002b414:	a7672661 d06016f7 4969474d 3e6e77db     a&g...`.MGiI.wn>
2002b424:	aed16a4a d9d65adc 40df0b66 37d83bf0     Jj...Z..f..@.;.7
2002b434:	a9bcae53 debb9ec5 47b2cf7f 30b5ffe9     S..........G...0
2002b444:	bdbdf21c cabac28a 53b39330 24b4a3a6     ........0..S...$
2002b454:	bad03605 cdd70693 54de5729 23d967bf     .6......)W.T.g.#
2002b464:	b3667a2e c4614ab8 5d681b02 2a6f2b94     .zf..Ja...h].+o*
2002b474:	b40bbe37 c30c8ea1 5a05df1b 2d02ef8d     7..........Z...-

2002b484 <pin_pad_func_lcpu>:
	...
2002b4a4:	032100b2 00000301 00000000 024b023b     ..!.........;.K.
2002b4b4:	00000237 00000000 00000000 00000000     7...............
2002b4c4:	032200b3 00000302 00000000 024b023c     ..".........<.K.
2002b4d4:	00000238 00000000 00000000 00000000     8...............
2002b4e4:	032300b4 00000303 00000000 024b023d     ..#.........=.K.
2002b4f4:	0000023a 00000000 00000000 00000000     :...............
2002b504:	032400b5 00000304 00000000 024b023e     ..$.........>.K.
2002b514:	00000239 00000000 00000000 00000000     9...............

2002b524 <pin_pad_func_hcpu>:
	...
2002b544:	000400f2 00000000 000b0000 00000000     ................
	...
2002b564:	000900f3 00000000 00030000 00000000     ................
	...
2002b584:	000a00f4 00000000 000a0000 00000000     ................
	...
2002b5a4:	000b00f5 00000000 000b0000 00000000     ................
	...
2002b5c4:	000c00f6 00000000 00030000 00000000     ................
	...
2002b5e4:	000300f7 000d0000 00000009 00000000     ................
	...
2002b604:	000200f8 000e0000 0000000b 00000000     ................
	...
2002b624:	000100f9 000f0000 0009000a 00000000     ................
	...
2002b644:	000d00fa 00100000 000c0003 00000000     ................
	...
2002b664:	000e00fb 00060000 00010001 00000000     ................
	...
2002b684:	000f00fc 00010000 000c000c 00000000     ................
	...
2002b6a4:	001000fd 00030000 00090000 00000000     ................
	...
2002b6c4:	000500fe 00000006 00000000 00000000     ................
	...
2002b6e4:	01540052 00000000 026302b2 016a0000     R.T.......c...j.
	...
2002b704:	00000053 00000000 026402b3 00000000     S.........d.....
	...
2002b724:	01550054 01c60000 026502b4 016b019a     T.U.......e...k.
2002b734:	023b0000 02270000 00000000 00000000     ..;...'.........
2002b744:	014e0055 01c80000 026602b5 015f0199     U.N.......f..._.
2002b754:	023c0000 02280000 00000000 00000000     ..<...(.........
2002b764:	014f0056 01c70000 026702b6 015e0197     V.O.......g...^.
2002b774:	023d0000 02290000 00000000 00000000     ..=...).........
2002b784:	01500057 01c40000 026802b7 01680195     W.P.......h...h.
2002b794:	023e0000 022a0000 00000000 00000000     ..>...*.........
2002b7a4:	01510058 01c50000 026902b8 01690194     X.Q.......i...i.
2002b7b4:	023f0000 022b0000 00000000 00000000     ..?...+.........
2002b7c4:	01520059 01d40000 026a02b9 01600192     Y.R.......j...`.
2002b7d4:	02400000 022c0000 00000000 00000000     ..@...,.........
2002b7e4:	0153005a 01d50000 026b02ba 01610191     Z.S.......k...a.
2002b7f4:	02410000 0000023a 00000000 00000000     ..A.:...........
2002b804:	0000005b 00000000 026c02bb 00000000     [.........l.....
2002b814:	02420000 00000239 00000000 00000000     ..B.9...........
2002b824:	0000005c 00000000 026d02bc 00000000     \.........m.....
	...
2002b844:	0000005d 00000000 026e02bd 00000000     ].........n.....
2002b854:	01d30000 02210237 00000000 00000000     ....7.!.........
2002b864:	001b005e 000001b7 026f02be 00000000     ^.........o.....
2002b874:	00000000 02220238 00000000 00000000     ....8.".........
2002b884:	0022005f 000001b8 027002bf 00000000     _.".......p.....
2002b894:	00000000 02230000 00000000 00000000     ......#.........
2002b8a4:	00230060 000001b2 027102c0 00000000     `.#.......q.....
2002b8b4:	00000000 02240000 00000000 00000000     ......$.........
2002b8c4:	00210061 000001b4 027202c1 00000000     a.!.......r.....
2002b8d4:	00000000 02250000 00000000 00000000     ......%.........
2002b8e4:	00190062 000001b5 027302c2 00000000     b.........s.....
2002b8f4:	00000000 02260000 00000000 00000000     ......&.........
2002b904:	00240063 000001b6 027402c3 00000000     c.$.......t.....
	...
2002b924:	00000064 0000021a 027502c4 00000000     d.........u.....
	...
2002b944:	00000065 00000219 027602c5 00000000     e.........v.....
	...
2002b964:	00000066 00000000 027702c6 00000000     f.........w.....
2002b974:	024b0000 00000000 00000000 00000000     ..K.............
2002b984:	00000067 00000000 027802c7 00000000     g.........x.....
	...
2002b9a4:	00000068 01d40000 027902c8 00000000     h.........y.....
	...
2002b9c4:	00000069 01d50000 027a02c9 00000000     i.........z.....
	...
2002b9e4:	0000006a 01c60149 027b02ca 03620361     j...I.....{.a.b.
2002b9f4:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002ba04:	0000006b 01c80148 027c02cb 03620361     k...H.....|.a.b.
2002ba14:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002ba24:	0000006c 00000000 027d02cc 03620361     l.........}.a.b.
2002ba34:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002ba44:	0000006d 00000000 027e02cd 03620361     m.........~.a.b.
2002ba54:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002ba64:	0000006e 01c70146 027f02ce 00000000     n...F...........
	...
2002ba84:	0000006f 01c40147 028002cf 00000000     o...G...........
	...
2002baa4:	00000070 01c50000 028102d0 00000000     p...............
	...
2002bac4:	00000071 00000000 028202d1 00000000     q...............
2002bad4:	02430000 00000000 00000000 00000000     ..C.............
2002bae4:	00000072 00000000 028302d2 00000000     r...............
	...
2002bb04:	00000073 00000000 028402d3 00000000     s...............
	...
2002bb24:	00000074 00000000 028502d4 00000000     t...............
	...
2002bb44:	00000075 00000000 028602d5 00000000     u...............
	...
2002bb64:	00000076 00000000 028702d6 00000000     v...............
	...
2002bb84:	00000077 0000014d 028802d7 01620000     w...M.........b.
2002bb94:	02440000 00000000 00000000 00000000     ..D.............
2002bba4:	00000078 0000014c 028902d8 00000000     x...L...........
	...
2002bbc4:	00000079 0000014a 028a02d9 01630190     y...J.........c.
2002bbd4:	02450000 022f0000 00000000 00000000     ..E.../.........
2002bbe4:	0000007a 0000014b 028b02da 0164018f     z...K.........d.
2002bbf4:	02460000 02300000 00000000 00000000     ..F...0.........
2002bc04:	0000007b 00000000 028c02db 01650193     {.............e.
2002bc14:	02470000 02310000 00000000 00000000     ..G...1.........
2002bc24:	0000007c 00000000 028d02dc 01660196     |.............f.
2002bc34:	02480000 02320000 00000000 00000000     ..H...2.........
2002bc44:	0000007d 00000000 028e02dd 01670198     }.............g.
2002bc54:	02490000 02330000 00000000 00000000     ..I...3.........
2002bc64:	0000007e 00000000 028f02de 00000000     ~...............
2002bc74:	024a0000 02340000 00000000 00000000     ..J...4.........

2002bc84 <CSWTCH.5>:
2002bc84:	2002bd24 2002bcf4 2002bcc4 2002bc94     $.. ... ... ... 

2002bc94 <mbedtls_sha512_info>:
2002bc94:	00000008 2002ae43 00000040 00000080     ....C.. @.......
2002bca4:	20025e8d 20025e83 20025e7f 20025e79     .^. .^. .^. y^. 
2002bcb4:	20025e5d 20025e4b 20025e47 20025e43     ]^. K^. G^. C^. 

2002bcc4 <mbedtls_sha384_info>:
2002bcc4:	00000007 2002ae4a 00000030 00000080     ....J.. 0.......
2002bcd4:	20025e87 20025e83 20025e7f 20025e73     .^. .^. .^. s^. 
2002bce4:	20025e5d 20025e4b 20025e47 20025e43     ]^. K^. G^. C^. 

2002bcf4 <mbedtls_sha256_info>:
2002bcf4:	00000006 2002ae51 00000020 00000040     ....Q..  ...@...
2002bd04:	20025e3d 20025e33 20025e2f 20025e29     =^. 3^. /^. )^. 
2002bd14:	20025e0d 20025dfb 20025df7 20025df3     .^. .]. .]. .]. 

2002bd24 <mbedtls_sha224_info>:
2002bd24:	00000005 2002ae58 0000001c 00000040     ....X.. ....@...
2002bd34:	20025e37 20025e33 20025e2f 20025e23     7^. 3^. /^. #^. 
2002bd44:	20025e0d 20025dfb 20025df7 20025df3     .^. .]. .]. .]. 

2002bd54 <sha256_padding>:
2002bd54:	00000080 00000000 00000000 00000000     ................
	...

2002bd94 <K>:
2002bd94:	428a2f98 71374491 b5c0fbcf e9b5dba5     ./.B.D7q........
2002bda4:	3956c25b 59f111f1 923f82a4 ab1c5ed5     [.V9...Y..?..^..
2002bdb4:	d807aa98 12835b01 243185be 550c7dc3     .....[....1$.}.U
2002bdc4:	72be5d74 80deb1fe 9bdc06a7 c19bf174     t].r........t...
2002bdd4:	e49b69c1 efbe4786 0fc19dc6 240ca1cc     .i...G.........$
2002bde4:	2de92c6f 4a7484aa 5cb0a9dc 76f988da     o,.-..tJ...\...v
2002bdf4:	983e5152 a831c66d b00327c8 bf597fc7     RQ>.m.1..'....Y.
2002be04:	c6e00bf3 d5a79147 06ca6351 14292967     ....G...Qc..g)).
2002be14:	27b70a85 2e1b2138 4d2c6dfc 53380d13     ...'8!...m,M..8S
2002be24:	650a7354 766a0abb 81c2c92e 92722c85     Ts.e..jv.....,r.
2002be34:	a2bfe8a1 a81a664b c24b8b70 c76c51a3     ....Kf..p.K..Ql.
2002be44:	d192e819 d6990624 f40e3585 106aa070     ....$....5..p.j.
2002be54:	19a4c116 1e376c08 2748774c 34b0bcb5     .....l7.LwH'...4
2002be64:	391c0cb3 4ed8aa4a 5b9cca4f 682e6ff3     ...9J..NO..[.o.h
2002be74:	748f82ee 78a5636f 84c87814 8cc70208     ...toc.x.x......
2002be84:	90befffa a4506ceb bef9a3f7 c67178f2     .....lP......xq.

2002be94 <sha512_padding>:
2002be94:	00000080 00000000 00000000 00000000     ................
	...

2002bf18 <K>:
2002bf18:	d728ae22 428a2f98 23ef65cd 71374491     ".(../.B.e.#.D7q
2002bf28:	ec4d3b2f b5c0fbcf 8189dbbc e9b5dba5     /;M.............
2002bf38:	f348b538 3956c25b b605d019 59f111f1     8.H.[.V9.......Y
2002bf48:	af194f9b 923f82a4 da6d8118 ab1c5ed5     .O....?...m..^..
2002bf58:	a3030242 d807aa98 45706fbe 12835b01     B........opE.[..
2002bf68:	4ee4b28c 243185be d5ffb4e2 550c7dc3     ...N..1$.....}.U
2002bf78:	f27b896f 72be5d74 3b1696b1 80deb1fe     o.{.t].r...;....
2002bf88:	25c71235 9bdc06a7 cf692694 c19bf174     5..%.....&i.t...
2002bf98:	9ef14ad2 e49b69c1 384f25e3 efbe4786     .J...i...%O8.G..
2002bfa8:	8b8cd5b5 0fc19dc6 77ac9c65 240ca1cc     ........e..w...$
2002bfb8:	592b0275 2de92c6f 6ea6e483 4a7484aa     u.+Yo,.-...n..tJ
2002bfc8:	bd41fbd4 5cb0a9dc 831153b5 76f988da     ..A....\.S.....v
2002bfd8:	ee66dfab 983e5152 2db43210 a831c66d     ..f.RQ>..2.-m.1.
2002bfe8:	98fb213f b00327c8 beef0ee4 bf597fc7     ?!...'........Y.
2002bff8:	3da88fc2 c6e00bf3 930aa725 d5a79147     ...=....%...G...
2002c008:	e003826f 06ca6351 0a0e6e70 14292967     o...Qc..pn..g)).
2002c018:	46d22ffc 27b70a85 5c26c926 2e1b2138     ./.F...'&.&\8!..
2002c028:	5ac42aed 4d2c6dfc 9d95b3df 53380d13     .*.Z.m,M......8S
2002c038:	8baf63de 650a7354 3c77b2a8 766a0abb     .c..Ts.e..w<..jv
2002c048:	47edaee6 81c2c92e 1482353b 92722c85     ...G....;5...,r.
2002c058:	4cf10364 a2bfe8a1 bc423001 a81a664b     d..L.....0B.Kf..
2002c068:	d0f89791 c24b8b70 0654be30 c76c51a3     ....p.K.0.T..Ql.
2002c078:	d6ef5218 d192e819 5565a910 d6990624     .R........eU$...
2002c088:	5771202a f40e3585 32bbd1b8 106aa070     * qW.5.....2p.j.
2002c098:	b8d2d0c8 19a4c116 5141ab53 1e376c08     ........S.AQ.l7.
2002c0a8:	df8eeb99 2748774c e19b48a8 34b0bcb5     ....LwH'.H.....4
2002c0b8:	c5c95a63 391c0cb3 e3418acb 4ed8aa4a     cZ.....9..A.J..N
2002c0c8:	7763e373 5b9cca4f d6b2b8a3 682e6ff3     s.cwO..[.....o.h
2002c0d8:	5defb2fc 748f82ee 43172f60 78a5636f     ...]...t`/.Coc.x
2002c0e8:	a1f0ab72 84c87814 1a6439ec 8cc70208     r....x...9d.....
2002c0f8:	23631e28 90befffa de82bde9 a4506ceb     (.c#.........lP.
2002c108:	b2c67915 bef9a3f7 e372532b c67178f2     .y......+Sr..xq.
2002c118:	ea26619c ca273ece 21c0c207 d186b8c7     .a&..>'....!....
2002c128:	cde0eb1e eada7dd6 ee6ed178 f57d4f7f     .....}..x.n..O}.
2002c138:	72176fba 06f067aa a2c898a6 0a637dc5     .o.r.g.......}c.
2002c148:	bef90dae 113f9804 131c471b 1b710b35     ......?..G..5.q.
2002c158:	23047d84 28db77f5 40c72493 32caab7b     .}.#.w.(.$.@{..2
2002c168:	15c9bebc 3c9ebe0a 9c100d4c 431d67c4     .......<L....g.C
2002c178:	cb3e42b6 4cc5d4be fc657e2a 597f299c     .B>....L*~e..).Y
2002c188:	3ad6faec 5fcb6fab 4a475817 6c44198c     ...:.o._.XGJ..Dl

2002c198 <oid_md_alg>:
2002c198:	2002ae5f 00000009 2002ae69 2002af72     _.. ....i.. r.. 
2002c1a8:	00000005 2002ae73 00000009 2002ae7d     ....s.. ....}.. 
2002c1b8:	2002afa5 00000006 2002ae87 00000009     ... ....... ....
2002c1c8:	2002ae91 2002afd8 00000007 2002ae9b     ... ... ....... 
2002c1d8:	00000009 2002aea5 2002b00b 00000008     ....... ... ....
	...

2002c1fc <oid_pk_alg>:
2002c1fc:	2002aee7 00000009 2002aef1 2002aeff     ... ....... ... 
2002c20c:	00000001 2002af03 00000007 2002af0b     ....... ....... 
2002c21c:	2002af1a 00000002 2002af29 00000005     ... ....).. ....
2002c22c:	2002af2f 2002af37 00000003 00000000     /.. 7.. ........
	...

2002c24c <mbedtls_rsa_info>:
2002c24c:	00000001 2002aeff 200294ff 200294f3     ....... ... ... 
2002c25c:	200295d9 200295b5 20029589 20029559     ... ... ... Y.. 
2002c26c:	20029555 2002953b 20029529 20029505     U.. ;.. ).. ... 

2002c27c <_init>:
2002c27c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002c27e:	bf00      	nop
2002c280:	bcf8      	pop	{r3, r4, r5, r6, r7}
2002c282:	bc08      	pop	{r3}
2002c284:	469e      	mov	lr, r3
2002c286:	4770      	bx	lr

2002c288 <_fini>:
2002c288:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002c28a:	bf00      	nop
2002c28c:	bcf8      	pop	{r3, r4, r5, r6, r7}
2002c28e:	bc08      	pop	{r3}
2002c290:	469e      	mov	lr, r3
2002c292:	4770      	bx	lr

2002c294 <__EH_FRAME_BEGIN__>:
2002c294:	0000 0000                                   ....

Disassembly of section .l1_ret_text_HAL_Set_backup:

2002c298 <HAL_Set_backup>:
2002c298:	4b01      	ldr	r3, [pc, #4]	@ (2002c2a0 <HAL_Set_backup+0x8>)
2002c29a:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
2002c29e:	4770      	bx	lr
2002c2a0:	500cb030 	.word	0x500cb030

Disassembly of section .l1_ret_text_HAL_Get_backup:

2002c2a4 <HAL_Get_backup>:
2002c2a4:	4b01      	ldr	r3, [pc, #4]	@ (2002c2ac <HAL_Get_backup+0x8>)
2002c2a6:	f853 0020 	ldr.w	r0, [r3, r0, lsl #2]
2002c2aa:	4770      	bx	lr
2002c2ac:	500cb030 	.word	0x500cb030

Disassembly of section .l1_ret_text_HAL_PMU_ConfigPeriLdo:

2002c2b0 <HAL_PMU_ConfigPeriLdo>:
2002c2b0:	b538      	push	{r3, r4, r5, lr}
2002c2b2:	b160      	cbz	r0, 2002c2ce <HAL_PMU_ConfigPeriLdo+0x1e>
2002c2b4:	4c11      	ldr	r4, [pc, #68]	@ (2002c2fc <HAL_PMU_ConfigPeriLdo+0x4c>)
2002c2b6:	6863      	ldr	r3, [r4, #4]
2002c2b8:	b2db      	uxtb	r3, r3
2002c2ba:	2b07      	cmp	r3, #7
2002c2bc:	d01a      	beq.n	2002c2f4 <HAL_PMU_ConfigPeriLdo+0x44>
2002c2be:	6863      	ldr	r3, [r4, #4]
2002c2c0:	b2db      	uxtb	r3, r3
2002c2c2:	2b0f      	cmp	r3, #15
2002c2c4:	d016      	beq.n	2002c2f4 <HAL_PMU_ConfigPeriLdo+0x44>
2002c2c6:	2808      	cmp	r0, #8
2002c2c8:	d001      	beq.n	2002c2ce <HAL_PMU_ConfigPeriLdo+0x1e>
2002c2ca:	2810      	cmp	r0, #16
2002c2cc:	d114      	bne.n	2002c2f8 <HAL_PMU_ConfigPeriLdo+0x48>
2002c2ce:	2900      	cmp	r1, #0
2002c2d0:	f04f 0421 	mov.w	r4, #33	@ 0x21
2002c2d4:	bf0c      	ite	eq
2002c2d6:	2120      	moveq	r1, #32
2002c2d8:	2101      	movne	r1, #1
2002c2da:	4d09      	ldr	r5, [pc, #36]	@ (2002c300 <HAL_PMU_ConfigPeriLdo+0x50>)
2002c2dc:	4084      	lsls	r4, r0
2002c2de:	6deb      	ldr	r3, [r5, #92]	@ 0x5c
2002c2e0:	4081      	lsls	r1, r0
2002c2e2:	ea23 0304 	bic.w	r3, r3, r4
2002c2e6:	430b      	orrs	r3, r1
2002c2e8:	65eb      	str	r3, [r5, #92]	@ 0x5c
2002c2ea:	b11a      	cbz	r2, 2002c2f4 <HAL_PMU_ConfigPeriLdo+0x44>
2002c2ec:	f241 3088 	movw	r0, #5000	@ 0x1388
2002c2f0:	f7f5 fe1d 	bl	20021f2e <HAL_Delay_us>
2002c2f4:	2000      	movs	r0, #0
2002c2f6:	bd38      	pop	{r3, r4, r5, pc}
2002c2f8:	2001      	movs	r0, #1
2002c2fa:	e7fc      	b.n	2002c2f6 <HAL_PMU_ConfigPeriLdo+0x46>
2002c2fc:	5000b000 	.word	0x5000b000
2002c300:	500ca000 	.word	0x500ca000

Disassembly of section .l1_ret_text_HAL_PMU_Reboot:

2002c304 <HAL_PMU_Reboot>:
2002c304:	b538      	push	{r3, r4, r5, lr}
2002c306:	f3ef 8310 	mrs	r3, PRIMASK
2002c30a:	2501      	movs	r5, #1
2002c30c:	f385 8810 	msr	PRIMASK, r5
2002c310:	2002      	movs	r0, #2
2002c312:	f7f6 fb1d 	bl	20022950 <HAL_HPAON_WakeCore>
2002c316:	4628      	mov	r0, r5
2002c318:	f7f8 ff2a 	bl	20025170 <HAL_RCC_Reset_and_Halt_LCPU>
2002c31c:	462a      	mov	r2, r5
2002c31e:	2100      	movs	r1, #0
2002c320:	2008      	movs	r0, #8
2002c322:	f7ff ffc5 	bl	2002c2b0 <HAL_PMU_ConfigPeriLdo>
2002c326:	f44f 50fa 	mov.w	r0, #8000	@ 0x1f40
2002c32a:	f7f5 fda1 	bl	20021e70 <HAL_Delay_us_>
2002c32e:	2000      	movs	r0, #0
2002c330:	f7f8 fd1e 	bl	20024d70 <HAL_RCC_HCPU_GetClockSrc>
2002c334:	4604      	mov	r4, r0
2002c336:	b928      	cbnz	r0, 2002c344 <HAL_PMU_Reboot+0x40>
2002c338:	f7f6 fb34 	bl	200229a4 <HAL_HPAON_EnableXT48>
2002c33c:	4629      	mov	r1, r5
2002c33e:	4620      	mov	r0, r4
2002c340:	f7f8 fdde 	bl	20024f00 <HAL_RCC_HCPU_ClockSelect>
2002c344:	4b10      	ldr	r3, [pc, #64]	@ (2002c388 <HAL_PMU_Reboot+0x84>)
2002c346:	4c11      	ldr	r4, [pc, #68]	@ (2002c38c <HAL_PMU_Reboot+0x88>)
2002c348:	2000      	movs	r0, #0
2002c34a:	6763      	str	r3, [r4, #116]	@ 0x74
2002c34c:	f7ff ffaa 	bl	2002c2a4 <HAL_Get_backup>
2002c350:	4601      	mov	r1, r0
2002c352:	f020 407f 	bic.w	r0, r0, #4278190080	@ 0xff000000
2002c356:	f020 000f 	bic.w	r0, r0, #15
2002c35a:	b928      	cbnz	r0, 2002c368 <HAL_PMU_Reboot+0x64>
2002c35c:	f441 41a0 	orr.w	r1, r1, #20480	@ 0x5000
2002c360:	f041 0150 	orr.w	r1, r1, #80	@ 0x50
2002c364:	f7ff ff98 	bl	2002c298 <HAL_Set_backup>
2002c368:	6823      	ldr	r3, [r4, #0]
2002c36a:	075b      	lsls	r3, r3, #29
2002c36c:	d506      	bpl.n	2002c37c <HAL_PMU_Reboot+0x78>
2002c36e:	6823      	ldr	r3, [r4, #0]
2002c370:	4807      	ldr	r0, [pc, #28]	@ (2002c390 <HAL_PMU_Reboot+0x8c>)
2002c372:	f023 0304 	bic.w	r3, r3, #4
2002c376:	6023      	str	r3, [r4, #0]
2002c378:	f7f5 fdd9 	bl	20021f2e <HAL_Delay_us>
2002c37c:	4a03      	ldr	r2, [pc, #12]	@ (2002c38c <HAL_PMU_Reboot+0x88>)
2002c37e:	6813      	ldr	r3, [r2, #0]
2002c380:	f043 0304 	orr.w	r3, r3, #4
2002c384:	6013      	str	r3, [r2, #0]
2002c386:	e7fe      	b.n	2002c386 <HAL_PMU_Reboot+0x82>
2002c388:	0a50c015 	.word	0x0a50c015
2002c38c:	500ca000 	.word	0x500ca000
2002c390:	000186a0 	.word	0x000186a0

Disassembly of section .l1_ret_text_HAL_PMU_GetHpsysVoutRef:

2002c394 <HAL_PMU_GetHpsysVoutRef>:
2002c394:	4b04      	ldr	r3, [pc, #16]	@ (2002c3a8 <HAL_PMU_GetHpsysVoutRef+0x14>)
2002c396:	781a      	ldrb	r2, [r3, #0]
2002c398:	b122      	cbz	r2, 2002c3a4 <HAL_PMU_GetHpsysVoutRef+0x10>
2002c39a:	b118      	cbz	r0, 2002c3a4 <HAL_PMU_GetHpsysVoutRef+0x10>
2002c39c:	78db      	ldrb	r3, [r3, #3]
2002c39e:	7003      	strb	r3, [r0, #0]
2002c3a0:	2000      	movs	r0, #0
2002c3a2:	4770      	bx	lr
2002c3a4:	2001      	movs	r0, #1
2002c3a6:	4770      	bx	lr
2002c3a8:	2004cbcc 	.word	0x2004cbcc

Disassembly of section .l1_ret_text_HAL_PMU_GetHpsysVoutRef2:

2002c3ac <HAL_PMU_GetHpsysVoutRef2>:
2002c3ac:	4b04      	ldr	r3, [pc, #16]	@ (2002c3c0 <HAL_PMU_GetHpsysVoutRef2+0x14>)
2002c3ae:	781a      	ldrb	r2, [r3, #0]
2002c3b0:	b122      	cbz	r2, 2002c3bc <HAL_PMU_GetHpsysVoutRef2+0x10>
2002c3b2:	b118      	cbz	r0, 2002c3bc <HAL_PMU_GetHpsysVoutRef2+0x10>
2002c3b4:	7b5b      	ldrb	r3, [r3, #13]
2002c3b6:	7003      	strb	r3, [r0, #0]
2002c3b8:	2000      	movs	r0, #0
2002c3ba:	4770      	bx	lr
2002c3bc:	2001      	movs	r0, #1
2002c3be:	4770      	bx	lr
2002c3c0:	2004cbcc 	.word	0x2004cbcc
