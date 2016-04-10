
strpalin:     file format elf64-x86-64


Disassembly of section .interp:

0000000000400200 <.interp>:
  400200:	2f                   	(bad)  
  400201:	6c                   	ins    BYTE PTR es:[rdi],dx
  400202:	69 62 36 34 2f 6c 64 	imul   esp,DWORD PTR [rdx+0x36],0x646c2f34
  400209:	2d 6c 69 6e 75       	sub    eax,0x756e696c
  40020e:	78 2d                	js     40023d <_init-0x203>
  400210:	78 38                	js     40024a <_init-0x1f6>
  400212:	36 2d 36 34 2e 73    	ss sub eax,0x732e3436
  400218:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  400219:	2e 32 00             	xor    al,BYTE PTR cs:[rax]

Disassembly of section .note.ABI-tag:

000000000040021c <.note.ABI-tag>:
  40021c:	04 00                	add    al,0x0
  40021e:	00 00                	add    BYTE PTR [rax],al
  400220:	10 00                	adc    BYTE PTR [rax],al
  400222:	00 00                	add    BYTE PTR [rax],al
  400224:	01 00                	add    DWORD PTR [rax],eax
  400226:	00 00                	add    BYTE PTR [rax],al
  400228:	47                   	rex.RXB
  400229:	4e 55                	rex.WRX push rbp
  40022b:	00 00                	add    BYTE PTR [rax],al
  40022d:	00 00                	add    BYTE PTR [rax],al
  40022f:	00 02                	add    BYTE PTR [rdx],al
  400231:	00 00                	add    BYTE PTR [rax],al
  400233:	00 06                	add    BYTE PTR [rsi],al
  400235:	00 00                	add    BYTE PTR [rax],al
  400237:	00 20                	add    BYTE PTR [rax],ah
  400239:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .note.gnu.build-id:

000000000040023c <.note.gnu.build-id>:
  40023c:	04 00                	add    al,0x0
  40023e:	00 00                	add    BYTE PTR [rax],al
  400240:	14 00                	adc    al,0x0
  400242:	00 00                	add    BYTE PTR [rax],al
  400244:	03 00                	add    eax,DWORD PTR [rax]
  400246:	00 00                	add    BYTE PTR [rax],al
  400248:	47                   	rex.RXB
  400249:	4e 55                	rex.WRX push rbp
  40024b:	00 a2 a2 62 1e 19    	add    BYTE PTR [rdx+0x191e62a2],ah
  400251:	d5                   	(bad)  
  400252:	01 f0                	add    eax,esi
  400254:	a8 a1                	test   al,0xa1
  400256:	5e                   	pop    rsi
  400257:	15 66 42 7b 9a       	adc    eax,0x9a7b4266
  40025c:	2d                   	.byte 0x2d
  40025d:	24 19                	and    al,0x19
  40025f:	65                   	gs

Disassembly of section .gnu.hash:

0000000000400260 <.gnu.hash>:
  400260:	01 00                	add    DWORD PTR [rax],eax
  400262:	00 00                	add    BYTE PTR [rax],al
  400264:	01 00                	add    DWORD PTR [rax],eax
  400266:	00 00                	add    BYTE PTR [rax],al
  400268:	01 00                	add    DWORD PTR [rax],eax
	...

Disassembly of section .dynsym:

0000000000400280 <.dynsym>:
	...
  400298:	1a 00                	sbb    al,BYTE PTR [rax]
  40029a:	00 00                	add    BYTE PTR [rax],al
  40029c:	12 00                	adc    al,BYTE PTR [rax]
	...
  4002ae:	00 00                	add    BYTE PTR [rax],al
  4002b0:	1f                   	(bad)  
  4002b1:	00 00                	add    BYTE PTR [rax],al
  4002b3:	00 12                	add    BYTE PTR [rdx],dl
	...
  4002c5:	00 00                	add    BYTE PTR [rax],al
  4002c7:	00 26                	add    BYTE PTR [rsi],ah
  4002c9:	00 00                	add    BYTE PTR [rax],al
  4002cb:	00 12                	add    BYTE PTR [rdx],dl
	...
  4002dd:	00 00                	add    BYTE PTR [rax],al
  4002df:	00 38                	add    BYTE PTR [rax],bh
  4002e1:	00 00                	add    BYTE PTR [rax],al
  4002e3:	00 20                	add    BYTE PTR [rax],ah
	...
  4002f5:	00 00                	add    BYTE PTR [rax],al
  4002f7:	00 0b                	add    BYTE PTR [rbx],cl
  4002f9:	00 00                	add    BYTE PTR [rax],al
  4002fb:	00 12                	add    BYTE PTR [rdx],dl
	...

Disassembly of section .dynstr:

0000000000400310 <.dynstr>:
  400310:	00 6c 69 62          	add    BYTE PTR [rcx+rbp*2+0x62],ch
  400314:	63 2e                	movsxd ebp,DWORD PTR [rsi]
  400316:	73 6f                	jae    400387 <_init-0xb9>
  400318:	2e 36 00 5f 5f       	cs add BYTE PTR ss:[rdi+0x5f],bl
  40031d:	69 73 6f 63 39 39 5f 	imul   esi,DWORD PTR [rbx+0x6f],0x5f393963
  400324:	73 63                	jae    400389 <_init-0xb7>
  400326:	61                   	(bad)  
  400327:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  400328:	66 00 70 75          	data16 add BYTE PTR [rax+0x75],dh
  40032c:	74 73                	je     4003a1 <_init-0x9f>
  40032e:	00 73 74             	add    BYTE PTR [rbx+0x74],dh
  400331:	72 6c                	jb     40039f <_init-0xa1>
  400333:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
  400335:	00 5f 5f             	add    BYTE PTR [rdi+0x5f],bl
  400338:	6c                   	ins    BYTE PTR es:[rdi],dx
  400339:	69 62 63 5f 73 74 61 	imul   esp,DWORD PTR [rdx+0x63],0x6174735f
  400340:	72 74                	jb     4003b6 <_init-0x8a>
  400342:	5f                   	pop    rdi
  400343:	6d                   	ins    DWORD PTR es:[rdi],dx
  400344:	61                   	(bad)  
  400345:	69 6e 00 5f 5f 67 6d 	imul   ebp,DWORD PTR [rsi+0x0],0x6d675f5f
  40034c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  40034d:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  40034e:	5f                   	pop    rdi
  40034f:	73 74                	jae    4003c5 <_init-0x7b>
  400351:	61                   	(bad)  
  400352:	72 74                	jb     4003c8 <_init-0x78>
  400354:	5f                   	pop    rdi
  400355:	5f                   	pop    rdi
  400356:	00 47 4c             	add    BYTE PTR [rdi+0x4c],al
  400359:	49                   	rex.WB
  40035a:	42                   	rex.X
  40035b:	43 5f                	rex.XB pop r15
  40035d:	32 2e                	xor    ch,BYTE PTR [rsi]
  40035f:	37                   	(bad)  
  400360:	00 47 4c             	add    BYTE PTR [rdi+0x4c],al
  400363:	49                   	rex.WB
  400364:	42                   	rex.X
  400365:	43 5f                	rex.XB pop r15
  400367:	32 2e                	xor    ch,BYTE PTR [rsi]
  400369:	32 2e                	xor    ch,BYTE PTR [rsi]
  40036b:	35                   	.byte 0x35
	...

Disassembly of section .gnu.version:

000000000040036e <.gnu.version>:
  40036e:	00 00                	add    BYTE PTR [rax],al
  400370:	02 00                	add    al,BYTE PTR [rax]
  400372:	02 00                	add    al,BYTE PTR [rax]
  400374:	02 00                	add    al,BYTE PTR [rax]
  400376:	00 00                	add    BYTE PTR [rax],al
  400378:	03 00                	add    eax,DWORD PTR [rax]

Disassembly of section .gnu.version_r:

0000000000400380 <.gnu.version_r>:
  400380:	01 00                	add    DWORD PTR [rax],eax
  400382:	02 00                	add    al,BYTE PTR [rax]
  400384:	01 00                	add    DWORD PTR [rax],eax
  400386:	00 00                	add    BYTE PTR [rax],al
  400388:	10 00                	adc    BYTE PTR [rax],al
  40038a:	00 00                	add    BYTE PTR [rax],al
  40038c:	00 00                	add    BYTE PTR [rax],al
  40038e:	00 00                	add    BYTE PTR [rax],al
  400390:	17                   	(bad)  
  400391:	69 69 0d 00 00 03 00 	imul   ebp,DWORD PTR [rcx+0xd],0x30000
  400398:	47 00 00             	rex.RXB add BYTE PTR [r8],r8b
  40039b:	00 10                	add    BYTE PTR [rax],dl
  40039d:	00 00                	add    BYTE PTR [rax],al
  40039f:	00 75 1a             	add    BYTE PTR [rbp+0x1a],dh
  4003a2:	69 09 00 00 02 00    	imul   ecx,DWORD PTR [rcx],0x20000
  4003a8:	51                   	push   rcx
  4003a9:	00 00                	add    BYTE PTR [rax],al
  4003ab:	00 00                	add    BYTE PTR [rax],al
  4003ad:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .rela.dyn:

00000000004003b0 <.rela.dyn>:
  4003b0:	d8 0b                	fmul   DWORD PTR [rbx]
  4003b2:	60                   	(bad)  
  4003b3:	00 00                	add    BYTE PTR [rax],al
  4003b5:	00 00                	add    BYTE PTR [rax],al
  4003b7:	00 06                	add    BYTE PTR [rsi],al
  4003b9:	00 00                	add    BYTE PTR [rax],al
  4003bb:	00 04 00             	add    BYTE PTR [rax+rax*1],al
	...

Disassembly of section .rela.plt:

00000000004003c8 <.rela.plt>:
  4003c8:	f8                   	clc    
  4003c9:	0b 60 00             	or     esp,DWORD PTR [rax+0x0]
  4003cc:	00 00                	add    BYTE PTR [rax],al
  4003ce:	00 00                	add    BYTE PTR [rax],al
  4003d0:	07                   	(bad)  
  4003d1:	00 00                	add    BYTE PTR [rax],al
  4003d3:	00 01                	add    BYTE PTR [rcx],al
	...
  4003e1:	0c 60                	or     al,0x60
  4003e3:	00 00                	add    BYTE PTR [rax],al
  4003e5:	00 00                	add    BYTE PTR [rax],al
  4003e7:	00 07                	add    BYTE PTR [rdi],al
  4003e9:	00 00                	add    BYTE PTR [rax],al
  4003eb:	00 02                	add    BYTE PTR [rdx],al
	...
  4003f5:	00 00                	add    BYTE PTR [rax],al
  4003f7:	00 08                	add    BYTE PTR [rax],cl
  4003f9:	0c 60                	or     al,0x60
  4003fb:	00 00                	add    BYTE PTR [rax],al
  4003fd:	00 00                	add    BYTE PTR [rax],al
  4003ff:	00 07                	add    BYTE PTR [rdi],al
  400401:	00 00                	add    BYTE PTR [rax],al
  400403:	00 03                	add    BYTE PTR [rbx],al
	...
  40040d:	00 00                	add    BYTE PTR [rax],al
  40040f:	00 10                	add    BYTE PTR [rax],dl
  400411:	0c 60                	or     al,0x60
  400413:	00 00                	add    BYTE PTR [rax],al
  400415:	00 00                	add    BYTE PTR [rax],al
  400417:	00 07                	add    BYTE PTR [rdi],al
  400419:	00 00                	add    BYTE PTR [rax],al
  40041b:	00 04 00             	add    BYTE PTR [rax+rax*1],al
	...
  400426:	00 00                	add    BYTE PTR [rax],al
  400428:	18 0c 60             	sbb    BYTE PTR [rax+riz*2],cl
  40042b:	00 00                	add    BYTE PTR [rax],al
  40042d:	00 00                	add    BYTE PTR [rax],al
  40042f:	00 07                	add    BYTE PTR [rdi],al
  400431:	00 00                	add    BYTE PTR [rax],al
  400433:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 400439 <_init-0x7>
  400439:	00 00                	add    BYTE PTR [rax],al
  40043b:	00 00                	add    BYTE PTR [rax],al
  40043d:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .init:

0000000000400440 <_init>:
  400440:	48 83 ec 08          	sub    rsp,0x8
  400444:	48 8b 05 8d 07 20 00 	mov    rax,QWORD PTR [rip+0x20078d]        # 600bd8 <_DYNAMIC+0x1d0>
  40044b:	48 85 c0             	test   rax,rax
  40044e:	74 05                	je     400455 <_init+0x15>
  400450:	e8 4b 00 00 00       	call   4004a0 <__gmon_start__@plt>
  400455:	48 83 c4 08          	add    rsp,0x8
  400459:	c3                   	ret    

Disassembly of section .plt:

0000000000400460 <puts@plt-0x10>:
  400460:	ff 35 82 07 20 00    	push   QWORD PTR [rip+0x200782]        # 600be8 <_GLOBAL_OFFSET_TABLE_+0x8>
  400466:	ff 25 84 07 20 00    	jmp    QWORD PTR [rip+0x200784]        # 600bf0 <_GLOBAL_OFFSET_TABLE_+0x10>
  40046c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000400470 <puts@plt>:
  400470:	ff 25 82 07 20 00    	jmp    QWORD PTR [rip+0x200782]        # 600bf8 <_GLOBAL_OFFSET_TABLE_+0x18>
  400476:	68 00 00 00 00       	push   0x0
  40047b:	e9 e0 ff ff ff       	jmp    400460 <_init+0x20>

0000000000400480 <strlen@plt>:
  400480:	ff 25 7a 07 20 00    	jmp    QWORD PTR [rip+0x20077a]        # 600c00 <_GLOBAL_OFFSET_TABLE_+0x20>
  400486:	68 01 00 00 00       	push   0x1
  40048b:	e9 d0 ff ff ff       	jmp    400460 <_init+0x20>

0000000000400490 <__libc_start_main@plt>:
  400490:	ff 25 72 07 20 00    	jmp    QWORD PTR [rip+0x200772]        # 600c08 <_GLOBAL_OFFSET_TABLE_+0x28>
  400496:	68 02 00 00 00       	push   0x2
  40049b:	e9 c0 ff ff ff       	jmp    400460 <_init+0x20>

00000000004004a0 <__gmon_start__@plt>:
  4004a0:	ff 25 6a 07 20 00    	jmp    QWORD PTR [rip+0x20076a]        # 600c10 <_GLOBAL_OFFSET_TABLE_+0x30>
  4004a6:	68 03 00 00 00       	push   0x3
  4004ab:	e9 b0 ff ff ff       	jmp    400460 <_init+0x20>

00000000004004b0 <__isoc99_scanf@plt>:
  4004b0:	ff 25 62 07 20 00    	jmp    QWORD PTR [rip+0x200762]        # 600c18 <_GLOBAL_OFFSET_TABLE_+0x38>
  4004b6:	68 04 00 00 00       	push   0x4
  4004bb:	e9 a0 ff ff ff       	jmp    400460 <_init+0x20>

Disassembly of section .text:

00000000004004c0 <_start>:
  4004c0:	31 ed                	xor    ebp,ebp
  4004c2:	49 89 d1             	mov    r9,rdx
  4004c5:	5e                   	pop    rsi
  4004c6:	48 89 e2             	mov    rdx,rsp
  4004c9:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  4004cd:	50                   	push   rax
  4004ce:	54                   	push   rsp
  4004cf:	49 c7 c0 90 08 40 00 	mov    r8,0x400890
  4004d6:	48 c7 c1 20 08 40 00 	mov    rcx,0x400820
  4004dd:	48 c7 c7 b6 05 40 00 	mov    rdi,0x4005b6
  4004e4:	e8 a7 ff ff ff       	call   400490 <__libc_start_main@plt>
  4004e9:	f4                   	hlt    
  4004ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000004004f0 <deregister_tm_clones>:
  4004f0:	b8 37 0c 60 00       	mov    eax,0x600c37
  4004f5:	55                   	push   rbp
  4004f6:	48 2d 30 0c 60 00    	sub    rax,0x600c30
  4004fc:	48 83 f8 0e          	cmp    rax,0xe
  400500:	48 89 e5             	mov    rbp,rsp
  400503:	76 1b                	jbe    400520 <deregister_tm_clones+0x30>
  400505:	b8 00 00 00 00       	mov    eax,0x0
  40050a:	48 85 c0             	test   rax,rax
  40050d:	74 11                	je     400520 <deregister_tm_clones+0x30>
  40050f:	5d                   	pop    rbp
  400510:	bf 30 0c 60 00       	mov    edi,0x600c30
  400515:	ff e0                	jmp    rax
  400517:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40051e:	00 00 
  400520:	5d                   	pop    rbp
  400521:	c3                   	ret    
  400522:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400526:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40052d:	00 00 00 

0000000000400530 <register_tm_clones>:
  400530:	be 30 0c 60 00       	mov    esi,0x600c30
  400535:	55                   	push   rbp
  400536:	48 81 ee 30 0c 60 00 	sub    rsi,0x600c30
  40053d:	48 c1 fe 03          	sar    rsi,0x3
  400541:	48 89 e5             	mov    rbp,rsp
  400544:	48 89 f0             	mov    rax,rsi
  400547:	48 c1 e8 3f          	shr    rax,0x3f
  40054b:	48 01 c6             	add    rsi,rax
  40054e:	48 d1 fe             	sar    rsi,1
  400551:	74 15                	je     400568 <register_tm_clones+0x38>
  400553:	b8 00 00 00 00       	mov    eax,0x0
  400558:	48 85 c0             	test   rax,rax
  40055b:	74 0b                	je     400568 <register_tm_clones+0x38>
  40055d:	5d                   	pop    rbp
  40055e:	bf 30 0c 60 00       	mov    edi,0x600c30
  400563:	ff e0                	jmp    rax
  400565:	0f 1f 00             	nop    DWORD PTR [rax]
  400568:	5d                   	pop    rbp
  400569:	c3                   	ret    
  40056a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000400570 <__do_global_dtors_aux>:
  400570:	80 3d b9 06 20 00 00 	cmp    BYTE PTR [rip+0x2006b9],0x0        # 600c30 <__TMC_END__>
  400577:	75 11                	jne    40058a <__do_global_dtors_aux+0x1a>
  400579:	55                   	push   rbp
  40057a:	48 89 e5             	mov    rbp,rsp
  40057d:	e8 6e ff ff ff       	call   4004f0 <deregister_tm_clones>
  400582:	5d                   	pop    rbp
  400583:	c6 05 a6 06 20 00 01 	mov    BYTE PTR [rip+0x2006a6],0x1        # 600c30 <__TMC_END__>
  40058a:	f3 c3                	repz ret 
  40058c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000400590 <frame_dummy>:
  400590:	bf 00 0a 60 00       	mov    edi,0x600a00
  400595:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  400599:	75 05                	jne    4005a0 <frame_dummy+0x10>
  40059b:	eb 93                	jmp    400530 <register_tm_clones>
  40059d:	0f 1f 00             	nop    DWORD PTR [rax]
  4005a0:	b8 00 00 00 00       	mov    eax,0x0
  4005a5:	48 85 c0             	test   rax,rax
  4005a8:	74 f1                	je     40059b <frame_dummy+0xb>
  4005aa:	55                   	push   rbp
  4005ab:	48 89 e5             	mov    rbp,rsp
  4005ae:	ff d0                	call   rax
  4005b0:	5d                   	pop    rbp
  4005b1:	e9 7a ff ff ff       	jmp    400530 <register_tm_clones>

00000000004005b6 <main>:
  4005b6:	55                   	push   rbp
  4005b7:	48 89 e5             	mov    rbp,rsp
  4005ba:	41 57                	push   r15
  4005bc:	41 56                	push   r14
  4005be:	41 55                	push   r13
  4005c0:	41 54                	push   r12
  4005c2:	53                   	push   rbx
  4005c3:	48 83 ec 48          	sub    rsp,0x48
  4005c7:	48 89 e0             	mov    rax,rsp
  4005ca:	48 89 c3             	mov    rbx,rax
  4005cd:	c7 45 9c 00 00 00 00 	mov    DWORD PTR [rbp-0x64],0x0
  4005d4:	48 8d 45 9c          	lea    rax,[rbp-0x64]
  4005d8:	48 89 c6             	mov    rsi,rax
  4005db:	bf a4 08 40 00       	mov    edi,0x4008a4
  4005e0:	b8 00 00 00 00       	mov    eax,0x0
  4005e5:	e8 c6 fe ff ff       	call   4004b0 <__isoc99_scanf@plt>
  4005ea:	8b 7d 9c             	mov    edi,DWORD PTR [rbp-0x64]
  4005ed:	48 63 d7             	movsxd rdx,edi
  4005f0:	48 83 ea 01          	sub    rdx,0x1
  4005f4:	48 89 55 b0          	mov    QWORD PTR [rbp-0x50],rdx
  4005f8:	48 63 d7             	movsxd rdx,edi
  4005fb:	49 89 d6             	mov    r14,rdx
  4005fe:	41 bf 00 00 00 00    	mov    r15d,0x0
  400604:	49 69 cf 90 3e 00 00 	imul   rcx,r15,0x3e90
  40060b:	49 6b d6 00          	imul   rdx,r14,0x0
  40060f:	48 8d 34 11          	lea    rsi,[rcx+rdx*1]
  400613:	b9 90 3e 00 00       	mov    ecx,0x3e90
  400618:	48 89 c8             	mov    rax,rcx
  40061b:	49 f7 e6             	mul    r14
  40061e:	48 89 d1             	mov    rcx,rdx
  400621:	48 89 c2             	mov    rdx,rax
  400624:	48 01 ce             	add    rsi,rcx
  400627:	48 89 f1             	mov    rcx,rsi
  40062a:	48 63 d7             	movsxd rdx,edi
  40062d:	49 89 d4             	mov    r12,rdx
  400630:	41 bd 00 00 00 00    	mov    r13d,0x0
  400636:	49 69 cd 90 3e 00 00 	imul   rcx,r13,0x3e90
  40063d:	49 6b d4 00          	imul   rdx,r12,0x0
  400641:	48 8d 34 11          	lea    rsi,[rcx+rdx*1]
  400645:	b9 90 3e 00 00       	mov    ecx,0x3e90
  40064a:	48 89 c8             	mov    rax,rcx
  40064d:	49 f7 e4             	mul    r12
  400650:	48 89 d1             	mov    rcx,rdx
  400653:	48 89 c2             	mov    rdx,rax
  400656:	48 01 ce             	add    rsi,rcx
  400659:	48 89 f1             	mov    rcx,rsi
  40065c:	48 63 c7             	movsxd rax,edi
  40065f:	48 69 c0 d2 07 00 00 	imul   rax,rax,0x7d2
  400666:	ba 10 00 00 00       	mov    edx,0x10
  40066b:	48 83 ea 01          	sub    rdx,0x1
  40066f:	48 01 d0             	add    rax,rdx
  400672:	bf 10 00 00 00       	mov    edi,0x10
  400677:	ba 00 00 00 00       	mov    edx,0x0
  40067c:	48 f7 f7             	div    rdi
  40067f:	48 6b c0 10          	imul   rax,rax,0x10
  400683:	48 29 c4             	sub    rsp,rax
  400686:	48 89 e0             	mov    rax,rsp
  400689:	48 83 c0 00          	add    rax,0x0
  40068d:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
  400691:	c7 45 cc 00 00 00 00 	mov    DWORD PTR [rbp-0x34],0x0
  400698:	eb 59                	jmp    4006f3 <main+0x13d>
  40069a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  40069d:	48 98                	cdqe   
  40069f:	48 69 d0 d2 07 00 00 	imul   rdx,rax,0x7d2
  4006a6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4006aa:	48 01 d0             	add    rax,rdx
  4006ad:	48 89 c6             	mov    rsi,rax
  4006b0:	bf a7 08 40 00       	mov    edi,0x4008a7
  4006b5:	b8 00 00 00 00       	mov    eax,0x0
  4006ba:	e8 f1 fd ff ff       	call   4004b0 <__isoc99_scanf@plt>
  4006bf:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  4006c2:	48 98                	cdqe   
  4006c4:	48 69 c0 d2 07 00 00 	imul   rax,rax,0x7d2
  4006cb:	48 8d 90 e0 03 00 00 	lea    rdx,[rax+0x3e0]
  4006d2:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4006d6:	48 01 d0             	add    rax,rdx
  4006d9:	48 83 c0 09          	add    rax,0x9
  4006dd:	48 89 c6             	mov    rsi,rax
  4006e0:	bf a7 08 40 00       	mov    edi,0x4008a7
  4006e5:	b8 00 00 00 00       	mov    eax,0x0
  4006ea:	e8 c1 fd ff ff       	call   4004b0 <__isoc99_scanf@plt>
  4006ef:	83 45 cc 01          	add    DWORD PTR [rbp-0x34],0x1
  4006f3:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  4006f6:	39 45 cc             	cmp    DWORD PTR [rbp-0x34],eax
  4006f9:	7c 9f                	jl     40069a <main+0xe4>
  4006fb:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [rbp-0x38],0x0
  400702:	e9 f0 00 00 00       	jmp    4007f7 <main+0x241>
  400707:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
  40070e:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  400711:	48 98                	cdqe   
  400713:	48 69 d0 d2 07 00 00 	imul   rdx,rax,0x7d2
  40071a:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  40071e:	48 01 d0             	add    rax,rdx
  400721:	48 89 c7             	mov    rdi,rax
  400724:	e8 57 fd ff ff       	call   400480 <strlen@plt>
  400729:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
  40072c:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  40072f:	48 98                	cdqe   
  400731:	48 69 c0 d2 07 00 00 	imul   rax,rax,0x7d2
  400738:	48 8d 90 e0 03 00 00 	lea    rdx,[rax+0x3e0]
  40073f:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  400743:	48 01 d0             	add    rax,rdx
  400746:	48 83 c0 09          	add    rax,0x9
  40074a:	48 89 c7             	mov    rdi,rax
  40074d:	e8 2e fd ff ff       	call   400480 <strlen@plt>
  400752:	89 45 a0             	mov    DWORD PTR [rbp-0x60],eax
  400755:	c7 45 c0 00 00 00 00 	mov    DWORD PTR [rbp-0x40],0x0
  40075c:	eb 71                	jmp    4007cf <main+0x219>
  40075e:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
  400765:	eb 56                	jmp    4007bd <main+0x207>
  400767:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  40076b:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  40076e:	48 63 c8             	movsxd rcx,eax
  400771:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  400774:	48 98                	cdqe   
  400776:	48 69 c0 d2 07 00 00 	imul   rax,rax,0x7d2
  40077d:	48 01 c8             	add    rax,rcx
  400780:	48 01 d0             	add    rax,rdx
  400783:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  400786:	48 8b 75 a8          	mov    rsi,QWORD PTR [rbp-0x58]
  40078a:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  40078d:	48 98                	cdqe   
  40078f:	8b 4d c8             	mov    ecx,DWORD PTR [rbp-0x38]
  400792:	48 63 c9             	movsxd rcx,ecx
  400795:	48 69 c9 d2 07 00 00 	imul   rcx,rcx,0x7d2
  40079c:	48 01 f1             	add    rcx,rsi
  40079f:	48 01 c8             	add    rax,rcx
  4007a2:	48 05 e0 03 00 00    	add    rax,0x3e0
  4007a8:	0f b6 40 09          	movzx  eax,BYTE PTR [rax+0x9]
  4007ac:	38 c2                	cmp    dl,al
  4007ae:	75 09                	jne    4007b9 <main+0x203>
  4007b0:	c7 45 c4 01 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x1
  4007b7:	eb 12                	jmp    4007cb <main+0x215>
  4007b9:	83 45 bc 01          	add    DWORD PTR [rbp-0x44],0x1
  4007bd:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  4007c0:	3b 45 a0             	cmp    eax,DWORD PTR [rbp-0x60]
  4007c3:	7d 06                	jge    4007cb <main+0x215>
  4007c5:	83 7d c4 00          	cmp    DWORD PTR [rbp-0x3c],0x0
  4007c9:	74 9c                	je     400767 <main+0x1b1>
  4007cb:	83 45 c0 01          	add    DWORD PTR [rbp-0x40],0x1
  4007cf:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  4007d2:	3b 45 a4             	cmp    eax,DWORD PTR [rbp-0x5c]
  4007d5:	7c 87                	jl     40075e <main+0x1a8>
  4007d7:	83 7d c4 00          	cmp    DWORD PTR [rbp-0x3c],0x0
  4007db:	74 0c                	je     4007e9 <main+0x233>
  4007dd:	bf aa 08 40 00       	mov    edi,0x4008aa
  4007e2:	e8 89 fc ff ff       	call   400470 <puts@plt>
  4007e7:	eb 0a                	jmp    4007f3 <main+0x23d>
  4007e9:	bf ae 08 40 00       	mov    edi,0x4008ae
  4007ee:	e8 7d fc ff ff       	call   400470 <puts@plt>
  4007f3:	83 45 c8 01          	add    DWORD PTR [rbp-0x38],0x1
  4007f7:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  4007fa:	39 45 c8             	cmp    DWORD PTR [rbp-0x38],eax
  4007fd:	0f 8c 04 ff ff ff    	jl     400707 <main+0x151>
  400803:	48 89 dc             	mov    rsp,rbx
  400806:	b8 00 00 00 00       	mov    eax,0x0
  40080b:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  40080f:	5b                   	pop    rbx
  400810:	41 5c                	pop    r12
  400812:	41 5d                	pop    r13
  400814:	41 5e                	pop    r14
  400816:	41 5f                	pop    r15
  400818:	5d                   	pop    rbp
  400819:	c3                   	ret    
  40081a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000400820 <__libc_csu_init>:
  400820:	41 57                	push   r15
  400822:	41 89 ff             	mov    r15d,edi
  400825:	41 56                	push   r14
  400827:	49 89 f6             	mov    r14,rsi
  40082a:	41 55                	push   r13
  40082c:	49 89 d5             	mov    r13,rdx
  40082f:	41 54                	push   r12
  400831:	4c 8d 25 b8 01 20 00 	lea    r12,[rip+0x2001b8]        # 6009f0 <__frame_dummy_init_array_entry>
  400838:	55                   	push   rbp
  400839:	48 8d 2d b8 01 20 00 	lea    rbp,[rip+0x2001b8]        # 6009f8 <__init_array_end>
  400840:	53                   	push   rbx
  400841:	4c 29 e5             	sub    rbp,r12
  400844:	31 db                	xor    ebx,ebx
  400846:	48 c1 fd 03          	sar    rbp,0x3
  40084a:	48 83 ec 08          	sub    rsp,0x8
  40084e:	e8 ed fb ff ff       	call   400440 <_init>
  400853:	48 85 ed             	test   rbp,rbp
  400856:	74 1e                	je     400876 <__libc_csu_init+0x56>
  400858:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40085f:	00 
  400860:	4c 89 ea             	mov    rdx,r13
  400863:	4c 89 f6             	mov    rsi,r14
  400866:	44 89 ff             	mov    edi,r15d
  400869:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  40086d:	48 83 c3 01          	add    rbx,0x1
  400871:	48 39 eb             	cmp    rbx,rbp
  400874:	75 ea                	jne    400860 <__libc_csu_init+0x40>
  400876:	48 83 c4 08          	add    rsp,0x8
  40087a:	5b                   	pop    rbx
  40087b:	5d                   	pop    rbp
  40087c:	41 5c                	pop    r12
  40087e:	41 5d                	pop    r13
  400880:	41 5e                	pop    r14
  400882:	41 5f                	pop    r15
  400884:	c3                   	ret    
  400885:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  40088c:	00 00 00 00 

0000000000400890 <__libc_csu_fini>:
  400890:	f3 c3                	repz ret 

Disassembly of section .fini:

0000000000400894 <_fini>:
  400894:	48 83 ec 08          	sub    rsp,0x8
  400898:	48 83 c4 08          	add    rsp,0x8
  40089c:	c3                   	ret    

Disassembly of section .rodata:

00000000004008a0 <_IO_stdin_used>:
  4008a0:	01 00                	add    DWORD PTR [rax],eax
  4008a2:	02 00                	add    al,BYTE PTR [rax]
  4008a4:	25 64 00 25 73       	and    eax,0x73250064
  4008a9:	00 59 65             	add    BYTE PTR [rcx+0x65],bl
  4008ac:	73 00                	jae    4008ae <_IO_stdin_used+0xe>
  4008ae:	4e 6f                	rex.WRX outs dx,DWORD PTR ds:[rsi]
	...

Disassembly of section .eh_frame_hdr:

00000000004008b4 <.eh_frame_hdr>:
  4008b4:	01 1b                	add    DWORD PTR [rbx],ebx
  4008b6:	03 3b                	add    edi,DWORD PTR [rbx]
  4008b8:	30 00                	xor    BYTE PTR [rax],al
  4008ba:	00 00                	add    BYTE PTR [rax],al
  4008bc:	05 00 00 00 ac       	add    eax,0xac000000
  4008c1:	fb                   	sti    
  4008c2:	ff                   	(bad)  
  4008c3:	ff                   	(bad)  
  4008c4:	7c 00                	jl     4008c6 <_IO_stdin_used+0x26>
  4008c6:	00 00                	add    BYTE PTR [rax],al
  4008c8:	0c fc                	or     al,0xfc
  4008ca:	ff                   	(bad)  
  4008cb:	ff 4c 00 00          	dec    DWORD PTR [rax+rax*1+0x0]
  4008cf:	00 02                	add    BYTE PTR [rdx],al
  4008d1:	fd                   	std    
  4008d2:	ff                   	(bad)  
  4008d3:	ff a4 00 00 00 6c ff 	jmp    QWORD PTR [rax+rax*1-0x940000]
  4008da:	ff                   	(bad)  
  4008db:	ff d4                	call   rsp
  4008dd:	00 00                	add    BYTE PTR [rax],al
  4008df:	00 dc                	add    ah,bl
  4008e1:	ff                   	(bad)  
  4008e2:	ff                   	(bad)  
  4008e3:	ff 1c 01             	call   FWORD PTR [rcx+rax*1]
	...

Disassembly of section .eh_frame:

00000000004008e8 <__FRAME_END__-0x100>:
  4008e8:	14 00                	adc    al,0x0
  4008ea:	00 00                	add    BYTE PTR [rax],al
  4008ec:	00 00                	add    BYTE PTR [rax],al
  4008ee:	00 00                	add    BYTE PTR [rax],al
  4008f0:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
  4008f3:	00 01                	add    BYTE PTR [rcx],al
  4008f5:	78 10                	js     400907 <_IO_stdin_used+0x67>
  4008f7:	01 1b                	add    DWORD PTR [rbx],ebx
  4008f9:	0c 07                	or     al,0x7
  4008fb:	08 90 01 07 10 14    	or     BYTE PTR [rax+0x14100701],dl
  400901:	00 00                	add    BYTE PTR [rax],al
  400903:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
  400906:	00 00                	add    BYTE PTR [rax],al
  400908:	b8 fb ff ff 2a       	mov    eax,0x2afffffb
	...
  400915:	00 00                	add    BYTE PTR [rax],al
  400917:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
  40091a:	00 00                	add    BYTE PTR [rax],al
  40091c:	00 00                	add    BYTE PTR [rax],al
  40091e:	00 00                	add    BYTE PTR [rax],al
  400920:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
  400923:	00 01                	add    BYTE PTR [rcx],al
  400925:	78 10                	js     400937 <_IO_stdin_used+0x97>
  400927:	01 1b                	add    DWORD PTR [rbx],ebx
  400929:	0c 07                	or     al,0x7
  40092b:	08 90 01 00 00 24    	or     BYTE PTR [rax+0x24000001],dl
  400931:	00 00                	add    BYTE PTR [rax],al
  400933:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
  400936:	00 00                	add    BYTE PTR [rax],al
  400938:	28 fb                	sub    bl,bh
  40093a:	ff                   	(bad)  
  40093b:	ff 60 00             	jmp    QWORD PTR [rax+0x0]
  40093e:	00 00                	add    BYTE PTR [rax],al
  400940:	00 0e                	add    BYTE PTR [rsi],cl
  400942:	10 46 0e             	adc    BYTE PTR [rsi+0xe],al
  400945:	18 4a 0f             	sbb    BYTE PTR [rdx+0xf],cl
  400948:	0b 77 08             	or     esi,DWORD PTR [rdi+0x8]
  40094b:	80 00 3f             	add    BYTE PTR [rax],0x3f
  40094e:	1a 3b                	sbb    bh,BYTE PTR [rbx]
  400950:	2a 33                	sub    dh,BYTE PTR [rbx]
  400952:	24 22                	and    al,0x22
  400954:	00 00                	add    BYTE PTR [rax],al
  400956:	00 00                	add    BYTE PTR [rax],al
  400958:	2c 00                	sub    al,0x0
  40095a:	00 00                	add    BYTE PTR [rax],al
  40095c:	44 00 00             	add    BYTE PTR [rax],r8b
  40095f:	00 56 fc             	add    BYTE PTR [rsi-0x4],dl
  400962:	ff                   	(bad)  
  400963:	ff 64 02 00          	jmp    QWORD PTR [rdx+rax*1+0x0]
  400967:	00 00                	add    BYTE PTR [rax],al
  400969:	41 0e                	rex.B (bad) 
  40096b:	10 86 02 43 0d 06    	adc    BYTE PTR [rsi+0x60d4302],al
  400971:	4d 8f 03             	rex.WRB pop QWORD PTR [r11]
  400974:	8e 04 8d 05 8c 06 83 	mov    es,WORD PTR [rcx*4-0x7cf973fb]
  40097b:	07                   	(bad)  
  40097c:	03 52 02             	add    edx,DWORD PTR [rdx+0x2]
  40097f:	0c 07                	or     al,0x7
  400981:	08 00                	or     BYTE PTR [rax],al
  400983:	00 00                	add    BYTE PTR [rax],al
  400985:	00 00                	add    BYTE PTR [rax],al
  400987:	00 44 00 00          	add    BYTE PTR [rax+rax*1+0x0],al
  40098b:	00 74 00 00          	add    BYTE PTR [rax+rax*1+0x0],dh
  40098f:	00 90 fe ff ff 65    	add    BYTE PTR [rax+0x65fffffe],dl
  400995:	00 00                	add    BYTE PTR [rax],al
  400997:	00 00                	add    BYTE PTR [rax],al
  400999:	42 0e                	rex.X (bad) 
  40099b:	10 8f 02 45 0e 18    	adc    BYTE PTR [rdi+0x180e4502],cl
  4009a1:	8e 03                	mov    es,WORD PTR [rbx]
  4009a3:	45 0e                	rex.RB (bad) 
  4009a5:	20 8d 04 45 0e 28    	and    BYTE PTR [rbp+0x280e4504],cl
  4009ab:	8c 05 48 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e48],es        # ffffffff867017f9 <_end+0xffffffff86100bc1>
  4009b1:	06                   	(bad)  
  4009b2:	48 0e                	rex.W (bad) 
  4009b4:	38 83 07 4d 0e 40    	cmp    BYTE PTR [rbx+0x400e4d07],al
  4009ba:	6c                   	ins    BYTE PTR es:[rdi],dx
  4009bb:	0e                   	(bad)  
  4009bc:	38 41 0e             	cmp    BYTE PTR [rcx+0xe],al
  4009bf:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
  4009c2:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
  4009c5:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
  4009c8:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
  4009cb:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
  4009ce:	08 00                	or     BYTE PTR [rax],al
  4009d0:	14 00                	adc    al,0x0
  4009d2:	00 00                	add    BYTE PTR [rax],al
  4009d4:	bc 00 00 00 b8       	mov    esp,0xb8000000
  4009d9:	fe                   	(bad)  
  4009da:	ff                   	(bad)  
  4009db:	ff 02                	inc    DWORD PTR [rdx]
	...

00000000004009e8 <__FRAME_END__>:
  4009e8:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .init_array:

00000000006009f0 <__frame_dummy_init_array_entry>:
  6009f0:	90                   	nop
  6009f1:	05 40 00 00 00       	add    eax,0x40
	...

Disassembly of section .fini_array:

00000000006009f8 <__do_global_dtors_aux_fini_array_entry>:
  6009f8:	70 05                	jo     6009ff <__do_global_dtors_aux_fini_array_entry+0x7>
  6009fa:	40 00 00             	add    BYTE PTR [rax],al
  6009fd:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .jcr:

0000000000600a00 <__JCR_END__>:
	...

Disassembly of section .dynamic:

0000000000600a08 <_DYNAMIC>:
  600a08:	01 00                	add    DWORD PTR [rax],eax
  600a0a:	00 00                	add    BYTE PTR [rax],al
  600a0c:	00 00                	add    BYTE PTR [rax],al
  600a0e:	00 00                	add    BYTE PTR [rax],al
  600a10:	01 00                	add    DWORD PTR [rax],eax
  600a12:	00 00                	add    BYTE PTR [rax],al
  600a14:	00 00                	add    BYTE PTR [rax],al
  600a16:	00 00                	add    BYTE PTR [rax],al
  600a18:	0c 00                	or     al,0x0
  600a1a:	00 00                	add    BYTE PTR [rax],al
  600a1c:	00 00                	add    BYTE PTR [rax],al
  600a1e:	00 00                	add    BYTE PTR [rax],al
  600a20:	40 04 40             	add    al,0x40
  600a23:	00 00                	add    BYTE PTR [rax],al
  600a25:	00 00                	add    BYTE PTR [rax],al
  600a27:	00 0d 00 00 00 00    	add    BYTE PTR [rip+0x0],cl        # 600a2d <_DYNAMIC+0x25>
  600a2d:	00 00                	add    BYTE PTR [rax],al
  600a2f:	00 94 08 40 00 00 00 	add    BYTE PTR [rax+rcx*1+0x40],dl
  600a36:	00 00                	add    BYTE PTR [rax],al
  600a38:	19 00                	sbb    DWORD PTR [rax],eax
  600a3a:	00 00                	add    BYTE PTR [rax],al
  600a3c:	00 00                	add    BYTE PTR [rax],al
  600a3e:	00 00                	add    BYTE PTR [rax],al
  600a40:	f0 09 60 00          	lock or DWORD PTR [rax+0x0],esp
  600a44:	00 00                	add    BYTE PTR [rax],al
  600a46:	00 00                	add    BYTE PTR [rax],al
  600a48:	1b 00                	sbb    eax,DWORD PTR [rax]
  600a4a:	00 00                	add    BYTE PTR [rax],al
  600a4c:	00 00                	add    BYTE PTR [rax],al
  600a4e:	00 00                	add    BYTE PTR [rax],al
  600a50:	08 00                	or     BYTE PTR [rax],al
  600a52:	00 00                	add    BYTE PTR [rax],al
  600a54:	00 00                	add    BYTE PTR [rax],al
  600a56:	00 00                	add    BYTE PTR [rax],al
  600a58:	1a 00                	sbb    al,BYTE PTR [rax]
  600a5a:	00 00                	add    BYTE PTR [rax],al
  600a5c:	00 00                	add    BYTE PTR [rax],al
  600a5e:	00 00                	add    BYTE PTR [rax],al
  600a60:	f8                   	clc    
  600a61:	09 60 00             	or     DWORD PTR [rax+0x0],esp
  600a64:	00 00                	add    BYTE PTR [rax],al
  600a66:	00 00                	add    BYTE PTR [rax],al
  600a68:	1c 00                	sbb    al,0x0
  600a6a:	00 00                	add    BYTE PTR [rax],al
  600a6c:	00 00                	add    BYTE PTR [rax],al
  600a6e:	00 00                	add    BYTE PTR [rax],al
  600a70:	08 00                	or     BYTE PTR [rax],al
  600a72:	00 00                	add    BYTE PTR [rax],al
  600a74:	00 00                	add    BYTE PTR [rax],al
  600a76:	00 00                	add    BYTE PTR [rax],al
  600a78:	f5                   	cmc    
  600a79:	fe                   	(bad)  
  600a7a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  600a7d:	00 00                	add    BYTE PTR [rax],al
  600a7f:	00 60 02             	add    BYTE PTR [rax+0x2],ah
  600a82:	40 00 00             	add    BYTE PTR [rax],al
  600a85:	00 00                	add    BYTE PTR [rax],al
  600a87:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 600a8d <_DYNAMIC+0x85>
  600a8d:	00 00                	add    BYTE PTR [rax],al
  600a8f:	00 10                	add    BYTE PTR [rax],dl
  600a91:	03 40 00             	add    eax,DWORD PTR [rax+0x0]
  600a94:	00 00                	add    BYTE PTR [rax],al
  600a96:	00 00                	add    BYTE PTR [rax],al
  600a98:	06                   	(bad)  
  600a99:	00 00                	add    BYTE PTR [rax],al
  600a9b:	00 00                	add    BYTE PTR [rax],al
  600a9d:	00 00                	add    BYTE PTR [rax],al
  600a9f:	00 80 02 40 00 00    	add    BYTE PTR [rax+0x4002],al
  600aa5:	00 00                	add    BYTE PTR [rax],al
  600aa7:	00 0a                	add    BYTE PTR [rdx],cl
  600aa9:	00 00                	add    BYTE PTR [rax],al
  600aab:	00 00                	add    BYTE PTR [rax],al
  600aad:	00 00                	add    BYTE PTR [rax],al
  600aaf:	00 5d 00             	add    BYTE PTR [rbp+0x0],bl
  600ab2:	00 00                	add    BYTE PTR [rax],al
  600ab4:	00 00                	add    BYTE PTR [rax],al
  600ab6:	00 00                	add    BYTE PTR [rax],al
  600ab8:	0b 00                	or     eax,DWORD PTR [rax]
  600aba:	00 00                	add    BYTE PTR [rax],al
  600abc:	00 00                	add    BYTE PTR [rax],al
  600abe:	00 00                	add    BYTE PTR [rax],al
  600ac0:	18 00                	sbb    BYTE PTR [rax],al
  600ac2:	00 00                	add    BYTE PTR [rax],al
  600ac4:	00 00                	add    BYTE PTR [rax],al
  600ac6:	00 00                	add    BYTE PTR [rax],al
  600ac8:	15 00 00 00 00       	adc    eax,0x0
	...
  600ad5:	00 00                	add    BYTE PTR [rax],al
  600ad7:	00 03                	add    BYTE PTR [rbx],al
  600ad9:	00 00                	add    BYTE PTR [rax],al
  600adb:	00 00                	add    BYTE PTR [rax],al
  600add:	00 00                	add    BYTE PTR [rax],al
  600adf:	00 e0                	add    al,ah
  600ae1:	0b 60 00             	or     esp,DWORD PTR [rax+0x0]
  600ae4:	00 00                	add    BYTE PTR [rax],al
  600ae6:	00 00                	add    BYTE PTR [rax],al
  600ae8:	02 00                	add    al,BYTE PTR [rax]
  600aea:	00 00                	add    BYTE PTR [rax],al
  600aec:	00 00                	add    BYTE PTR [rax],al
  600aee:	00 00                	add    BYTE PTR [rax],al
  600af0:	78 00                	js     600af2 <_DYNAMIC+0xea>
  600af2:	00 00                	add    BYTE PTR [rax],al
  600af4:	00 00                	add    BYTE PTR [rax],al
  600af6:	00 00                	add    BYTE PTR [rax],al
  600af8:	14 00                	adc    al,0x0
  600afa:	00 00                	add    BYTE PTR [rax],al
  600afc:	00 00                	add    BYTE PTR [rax],al
  600afe:	00 00                	add    BYTE PTR [rax],al
  600b00:	07                   	(bad)  
  600b01:	00 00                	add    BYTE PTR [rax],al
  600b03:	00 00                	add    BYTE PTR [rax],al
  600b05:	00 00                	add    BYTE PTR [rax],al
  600b07:	00 17                	add    BYTE PTR [rdi],dl
  600b09:	00 00                	add    BYTE PTR [rax],al
  600b0b:	00 00                	add    BYTE PTR [rax],al
  600b0d:	00 00                	add    BYTE PTR [rax],al
  600b0f:	00 c8                	add    al,cl
  600b11:	03 40 00             	add    eax,DWORD PTR [rax+0x0]
  600b14:	00 00                	add    BYTE PTR [rax],al
  600b16:	00 00                	add    BYTE PTR [rax],al
  600b18:	07                   	(bad)  
  600b19:	00 00                	add    BYTE PTR [rax],al
  600b1b:	00 00                	add    BYTE PTR [rax],al
  600b1d:	00 00                	add    BYTE PTR [rax],al
  600b1f:	00 b0 03 40 00 00    	add    BYTE PTR [rax+0x4003],dh
  600b25:	00 00                	add    BYTE PTR [rax],al
  600b27:	00 08                	add    BYTE PTR [rax],cl
  600b29:	00 00                	add    BYTE PTR [rax],al
  600b2b:	00 00                	add    BYTE PTR [rax],al
  600b2d:	00 00                	add    BYTE PTR [rax],al
  600b2f:	00 18                	add    BYTE PTR [rax],bl
  600b31:	00 00                	add    BYTE PTR [rax],al
  600b33:	00 00                	add    BYTE PTR [rax],al
  600b35:	00 00                	add    BYTE PTR [rax],al
  600b37:	00 09                	add    BYTE PTR [rcx],cl
  600b39:	00 00                	add    BYTE PTR [rax],al
  600b3b:	00 00                	add    BYTE PTR [rax],al
  600b3d:	00 00                	add    BYTE PTR [rax],al
  600b3f:	00 18                	add    BYTE PTR [rax],bl
  600b41:	00 00                	add    BYTE PTR [rax],al
  600b43:	00 00                	add    BYTE PTR [rax],al
  600b45:	00 00                	add    BYTE PTR [rax],al
  600b47:	00 fe                	add    dh,bh
  600b49:	ff                   	(bad)  
  600b4a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  600b4d:	00 00                	add    BYTE PTR [rax],al
  600b4f:	00 80 03 40 00 00    	add    BYTE PTR [rax+0x4003],al
  600b55:	00 00                	add    BYTE PTR [rax],al
  600b57:	00 ff                	add    bh,bh
  600b59:	ff                   	(bad)  
  600b5a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  600b5d:	00 00                	add    BYTE PTR [rax],al
  600b5f:	00 01                	add    BYTE PTR [rcx],al
  600b61:	00 00                	add    BYTE PTR [rax],al
  600b63:	00 00                	add    BYTE PTR [rax],al
  600b65:	00 00                	add    BYTE PTR [rax],al
  600b67:	00 f0                	add    al,dh
  600b69:	ff                   	(bad)  
  600b6a:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
  600b6d:	00 00                	add    BYTE PTR [rax],al
  600b6f:	00 6e 03             	add    BYTE PTR [rsi+0x3],ch
  600b72:	40 00 00             	add    BYTE PTR [rax],al
	...

Disassembly of section .got:

0000000000600bd8 <.got>:
	...

Disassembly of section .got.plt:

0000000000600be0 <_GLOBAL_OFFSET_TABLE_>:
  600be0:	08 0a                	or     BYTE PTR [rdx],cl
  600be2:	60                   	(bad)  
	...
  600bf7:	00 76 04             	add    BYTE PTR [rsi+0x4],dh
  600bfa:	40 00 00             	add    BYTE PTR [rax],al
  600bfd:	00 00                	add    BYTE PTR [rax],al
  600bff:	00 86 04 40 00 00    	add    BYTE PTR [rsi+0x4004],al
  600c05:	00 00                	add    BYTE PTR [rax],al
  600c07:	00 96 04 40 00 00    	add    BYTE PTR [rsi+0x4004],dl
  600c0d:	00 00                	add    BYTE PTR [rax],al
  600c0f:	00 a6 04 40 00 00    	add    BYTE PTR [rsi+0x4004],ah
  600c15:	00 00                	add    BYTE PTR [rax],al
  600c17:	00 b6 04 40 00 00    	add    BYTE PTR [rsi+0x4004],dh
  600c1d:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .data:

0000000000600c20 <__data_start>:
	...

0000000000600c28 <__dso_handle>:
	...

Disassembly of section .bss:

0000000000600c30 <__bss_start>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp spl,BYTE PTR [r8]
   5:	28 44 65 62          	sub    BYTE PTR [rbp+riz*2+0x62],al
   9:	69 61 6e 20 34 2e 39 	imul   esp,DWORD PTR [rcx+0x6e],0x392e3420
  10:	2e 32 2d 31 39 29 20 	xor    ch,BYTE PTR cs:[rip+0x20293931]        # 20293948 <_end+0x1fc92d10>
  17:	34 2e                	xor    al,0x2e
  19:	39 2e                	cmp    DWORD PTR [rsi],ebp
  1b:	32 00                	xor    al,BYTE PTR [rax]
  1d:	47                   	rex.RXB
  1e:	43                   	rex.XB
  1f:	43 3a 20             	rex.XB cmp spl,BYTE PTR [r8]
  22:	28 44 65 62          	sub    BYTE PTR [rbp+riz*2+0x62],al
  26:	69 61 6e 20 34 2e 38 	imul   esp,DWORD PTR [rcx+0x6e],0x382e3420
  2d:	2e 34 2d             	cs xor al,0x2d
  30:	31 29                	xor    DWORD PTR [rcx],ebp
  32:	20 34 2e             	and    BYTE PTR [rsi+rbp*1],dh
  35:	38 2e                	cmp    BYTE PTR [rsi],ch
  37:	34 00                	xor    al,0x0
