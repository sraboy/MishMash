
strpalin32:     file format elf32-i386


Disassembly of section .interp:

08048134 <.interp>:
 8048134:	2f                   	das    
 8048135:	6c                   	ins    BYTE PTR es:[edi],dx
 8048136:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 804813d:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 8048144:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .note.ABI-tag:

08048148 <.note.ABI-tag>:
 8048148:	04 00                	add    al,0x0
 804814a:	00 00                	add    BYTE PTR [eax],al
 804814c:	10 00                	adc    BYTE PTR [eax],al
 804814e:	00 00                	add    BYTE PTR [eax],al
 8048150:	01 00                	add    DWORD PTR [eax],eax
 8048152:	00 00                	add    BYTE PTR [eax],al
 8048154:	47                   	inc    edi
 8048155:	4e                   	dec    esi
 8048156:	55                   	push   ebp
 8048157:	00 00                	add    BYTE PTR [eax],al
 8048159:	00 00                	add    BYTE PTR [eax],al
 804815b:	00 02                	add    BYTE PTR [edx],al
 804815d:	00 00                	add    BYTE PTR [eax],al
 804815f:	00 06                	add    BYTE PTR [esi],al
 8048161:	00 00                	add    BYTE PTR [eax],al
 8048163:	00 20                	add    BYTE PTR [eax],ah
 8048165:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .note.gnu.build-id:

08048168 <.note.gnu.build-id>:
 8048168:	04 00                	add    al,0x0
 804816a:	00 00                	add    BYTE PTR [eax],al
 804816c:	14 00                	adc    al,0x0
 804816e:	00 00                	add    BYTE PTR [eax],al
 8048170:	03 00                	add    eax,DWORD PTR [eax]
 8048172:	00 00                	add    BYTE PTR [eax],al
 8048174:	47                   	inc    edi
 8048175:	4e                   	dec    esi
 8048176:	55                   	push   ebp
 8048177:	00 4c fd 12          	add    BYTE PTR [ebp+edi*8+0x12],cl
 804817b:	0b d4                	or     edx,esp
 804817d:	10 35 eb f2 8e 6b    	adc    BYTE PTR ds:0x6b8ef2eb,dh
 8048183:	42                   	inc    edx
 8048184:	c6                   	(bad)  
 8048185:	31 40 44             	xor    DWORD PTR [eax+0x44],eax
 8048188:	62 3c b8             	bound  edi,QWORD PTR [eax+edi*4]
 804818b:	7f                   	.byte 0x7f

Disassembly of section .gnu.hash:

0804818c <.gnu.hash>:
 804818c:	02 00                	add    al,BYTE PTR [eax]
 804818e:	00 00                	add    BYTE PTR [eax],al
 8048190:	06                   	push   es
 8048191:	00 00                	add    BYTE PTR [eax],al
 8048193:	00 01                	add    BYTE PTR [ecx],al
 8048195:	00 00                	add    BYTE PTR [eax],al
 8048197:	00 05 00 00 00 00    	add    BYTE PTR ds:0x0,al
 804819d:	20 00                	and    BYTE PTR [eax],al
 804819f:	20 00                	and    BYTE PTR [eax],al
 80481a1:	00 00                	add    BYTE PTR [eax],al
 80481a3:	00 06                	add    BYTE PTR [esi],al
 80481a5:	00 00                	add    BYTE PTR [eax],al
 80481a7:	00                   	.byte 0x0
 80481a8:	ad                   	lods   eax,DWORD PTR ds:[esi]
 80481a9:	4b                   	dec    ebx
 80481aa:	e3 c0                	jecxz  804816c <_init-0x188>

Disassembly of section .dynsym:

080481ac <.dynsym>:
	...
 80481bc:	29 00                	sub    DWORD PTR [eax],eax
	...
 80481c6:	00 00                	add    BYTE PTR [eax],al
 80481c8:	12 00                	adc    al,BYTE PTR [eax]
 80481ca:	00 00                	add    BYTE PTR [eax],al
 80481cc:	47                   	inc    edi
	...
 80481d5:	00 00                	add    BYTE PTR [eax],al
 80481d7:	00 20                	add    BYTE PTR [eax],ah
 80481d9:	00 00                	add    BYTE PTR [eax],al
 80481db:	00 2e                	add    BYTE PTR [esi],ch
	...
 80481e5:	00 00                	add    BYTE PTR [eax],al
 80481e7:	00 12                	add    BYTE PTR [edx],dl
 80481e9:	00 00                	add    BYTE PTR [eax],al
 80481eb:	00 35 00 00 00 00    	add    BYTE PTR ds:0x0,dh
 80481f1:	00 00                	add    BYTE PTR [eax],al
 80481f3:	00 00                	add    BYTE PTR [eax],al
 80481f5:	00 00                	add    BYTE PTR [eax],al
 80481f7:	00 12                	add    BYTE PTR [edx],dl
 80481f9:	00 00                	add    BYTE PTR [eax],al
 80481fb:	00 1a                	add    BYTE PTR [edx],bl
	...
 8048205:	00 00                	add    BYTE PTR [eax],al
 8048207:	00 12                	add    BYTE PTR [edx],dl
 8048209:	00 00                	add    BYTE PTR [eax],al
 804820b:	00 0b                	add    BYTE PTR [ebx],cl
 804820d:	00 00                	add    BYTE PTR [eax],al
 804820f:	00 1c 87             	add    BYTE PTR [edi+eax*4],bl
 8048212:	04 08                	add    al,0x8
 8048214:	04 00                	add    al,0x0
 8048216:	00 00                	add    BYTE PTR [eax],al
 8048218:	11 00                	adc    DWORD PTR [eax],eax
 804821a:	0f                   	.byte 0xf
	...

Disassembly of section .dynstr:

0804821c <.dynstr>:
 804821c:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 8048220:	63 2e                	arpl   WORD PTR [esi],bp
 8048222:	73 6f                	jae    8048293 <_init-0x61>
 8048224:	2e 36 00 5f 49       	cs add BYTE PTR ss:[edi+0x49],bl
 8048229:	4f                   	dec    edi
 804822a:	5f                   	pop    edi
 804822b:	73 74                	jae    80482a1 <_init-0x53>
 804822d:	64 69 6e 5f 75 73 65 	imul   ebp,DWORD PTR fs:[esi+0x5f],0x64657375
 8048234:	64 
 8048235:	00 5f 5f             	add    BYTE PTR [edi+0x5f],bl
 8048238:	69 73 6f 63 39 39 5f 	imul   esi,DWORD PTR [ebx+0x6f],0x5f393963
 804823f:	73 63                	jae    80482a4 <_init-0x50>
 8048241:	61                   	popa   
 8048242:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8048243:	66 00 70 75          	data16 add BYTE PTR [eax+0x75],dh
 8048247:	74 73                	je     80482bc <_init-0x38>
 8048249:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 804824c:	72 6c                	jb     80482ba <_init-0x3a>
 804824e:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 8048250:	00 5f 5f             	add    BYTE PTR [edi+0x5f],bl
 8048253:	6c                   	ins    BYTE PTR es:[edi],dx
 8048254:	69 62 63 5f 73 74 61 	imul   esp,DWORD PTR [edx+0x63],0x6174735f
 804825b:	72 74                	jb     80482d1 <_init-0x23>
 804825d:	5f                   	pop    edi
 804825e:	6d                   	ins    DWORD PTR es:[edi],dx
 804825f:	61                   	popa   
 8048260:	69 6e 00 5f 5f 67 6d 	imul   ebp,DWORD PTR [esi+0x0],0x6d675f5f
 8048267:	6f                   	outs   dx,DWORD PTR ds:[esi]
 8048268:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8048269:	5f                   	pop    edi
 804826a:	73 74                	jae    80482e0 <_init-0x14>
 804826c:	61                   	popa   
 804826d:	72 74                	jb     80482e3 <_init-0x11>
 804826f:	5f                   	pop    edi
 8048270:	5f                   	pop    edi
 8048271:	00 47 4c             	add    BYTE PTR [edi+0x4c],al
 8048274:	49                   	dec    ecx
 8048275:	42                   	inc    edx
 8048276:	43                   	inc    ebx
 8048277:	5f                   	pop    edi
 8048278:	32 2e                	xor    ch,BYTE PTR [esi]
 804827a:	37                   	aaa    
 804827b:	00 47 4c             	add    BYTE PTR [edi+0x4c],al
 804827e:	49                   	dec    ecx
 804827f:	42                   	inc    edx
 8048280:	43                   	inc    ebx
 8048281:	5f                   	pop    edi
 8048282:	32 2e                	xor    ch,BYTE PTR [esi]
 8048284:	30 00                	xor    BYTE PTR [eax],al

Disassembly of section .gnu.version:

08048286 <.gnu.version>:
 8048286:	00 00                	add    BYTE PTR [eax],al
 8048288:	02 00                	add    al,BYTE PTR [eax]
 804828a:	00 00                	add    BYTE PTR [eax],al
 804828c:	02 00                	add    al,BYTE PTR [eax]
 804828e:	02 00                	add    al,BYTE PTR [eax]
 8048290:	03 00                	add    eax,DWORD PTR [eax]
 8048292:	01 00                	add    DWORD PTR [eax],eax

Disassembly of section .gnu.version_r:

08048294 <.gnu.version_r>:
 8048294:	01 00                	add    DWORD PTR [eax],eax
 8048296:	02 00                	add    al,BYTE PTR [eax]
 8048298:	01 00                	add    DWORD PTR [eax],eax
 804829a:	00 00                	add    BYTE PTR [eax],al
 804829c:	10 00                	adc    BYTE PTR [eax],al
 804829e:	00 00                	add    BYTE PTR [eax],al
 80482a0:	00 00                	add    BYTE PTR [eax],al
 80482a2:	00 00                	add    BYTE PTR [eax],al
 80482a4:	17                   	pop    ss
 80482a5:	69 69 0d 00 00 03 00 	imul   ebp,DWORD PTR [ecx+0xd],0x30000
 80482ac:	56                   	push   esi
 80482ad:	00 00                	add    BYTE PTR [eax],al
 80482af:	00 10                	add    BYTE PTR [eax],dl
 80482b1:	00 00                	add    BYTE PTR [eax],al
 80482b3:	00 10                	add    BYTE PTR [eax],dl
 80482b5:	69 69 0d 00 00 02 00 	imul   ebp,DWORD PTR [ecx+0xd],0x20000
 80482bc:	60                   	pusha  
 80482bd:	00 00                	add    BYTE PTR [eax],al
 80482bf:	00 00                	add    BYTE PTR [eax],al
 80482c1:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .rel.dyn:

080482c4 <.rel.dyn>:
 80482c4:	24 99                	and    al,0x99
 80482c6:	04 08                	add    al,0x8
 80482c8:	06                   	push   es
 80482c9:	02 00                	add    al,BYTE PTR [eax]
	...

Disassembly of section .rel.plt:

080482cc <.rel.plt>:
 80482cc:	34 99                	xor    al,0x99
 80482ce:	04 08                	add    al,0x8
 80482d0:	07                   	pop    es
 80482d1:	01 00                	add    DWORD PTR [eax],eax
 80482d3:	00 38                	add    BYTE PTR [eax],bh
 80482d5:	99                   	cdq    
 80482d6:	04 08                	add    al,0x8
 80482d8:	07                   	pop    es
 80482d9:	02 00                	add    al,BYTE PTR [eax]
 80482db:	00 3c 99             	add    BYTE PTR [ecx+ebx*4],bh
 80482de:	04 08                	add    al,0x8
 80482e0:	07                   	pop    es
 80482e1:	03 00                	add    eax,DWORD PTR [eax]
 80482e3:	00 40 99             	add    BYTE PTR [eax-0x67],al
 80482e6:	04 08                	add    al,0x8
 80482e8:	07                   	pop    es
 80482e9:	04 00                	add    al,0x0
 80482eb:	00 44 99 04          	add    BYTE PTR [ecx+ebx*4+0x4],al
 80482ef:	08 07                	or     BYTE PTR [edi],al
 80482f1:	05                   	.byte 0x5
	...

Disassembly of section .init:

080482f4 <_init>:
 80482f4:	53                   	push   ebx
 80482f5:	83 ec 08             	sub    esp,0x8
 80482f8:	e8 b3 00 00 00       	call   80483b0 <__x86.get_pc_thunk.bx>
 80482fd:	81 c3 2b 16 00 00    	add    ebx,0x162b
 8048303:	8b 83 fc ff ff ff    	mov    eax,DWORD PTR [ebx-0x4]
 8048309:	85 c0                	test   eax,eax
 804830b:	74 05                	je     8048312 <_init+0x1e>
 804830d:	e8 2e 00 00 00       	call   8048340 <__gmon_start__@plt>
 8048312:	83 c4 08             	add    esp,0x8
 8048315:	5b                   	pop    ebx
 8048316:	c3                   	ret    

Disassembly of section .plt:

08048320 <puts@plt-0x10>:
 8048320:	ff 35 2c 99 04 08    	push   DWORD PTR ds:0x804992c
 8048326:	ff 25 30 99 04 08    	jmp    DWORD PTR ds:0x8049930
 804832c:	00 00                	add    BYTE PTR [eax],al
	...

08048330 <puts@plt>:
 8048330:	ff 25 34 99 04 08    	jmp    DWORD PTR ds:0x8049934
 8048336:	68 00 00 00 00       	push   0x0
 804833b:	e9 e0 ff ff ff       	jmp    8048320 <_init+0x2c>

08048340 <__gmon_start__@plt>:
 8048340:	ff 25 38 99 04 08    	jmp    DWORD PTR ds:0x8049938
 8048346:	68 08 00 00 00       	push   0x8
 804834b:	e9 d0 ff ff ff       	jmp    8048320 <_init+0x2c>

08048350 <strlen@plt>:
 8048350:	ff 25 3c 99 04 08    	jmp    DWORD PTR ds:0x804993c
 8048356:	68 10 00 00 00       	push   0x10
 804835b:	e9 c0 ff ff ff       	jmp    8048320 <_init+0x2c>

08048360 <__libc_start_main@plt>:
 8048360:	ff 25 40 99 04 08    	jmp    DWORD PTR ds:0x8049940
 8048366:	68 18 00 00 00       	push   0x18
 804836b:	e9 b0 ff ff ff       	jmp    8048320 <_init+0x2c>

08048370 <__isoc99_scanf@plt>:
 8048370:	ff 25 44 99 04 08    	jmp    DWORD PTR ds:0x8049944
 8048376:	68 20 00 00 00       	push   0x20
 804837b:	e9 a0 ff ff ff       	jmp    8048320 <_init+0x2c>

Disassembly of section .text:

08048380 <_start>:
 8048380:	31 ed                	xor    ebp,ebp
 8048382:	5e                   	pop    esi
 8048383:	89 e1                	mov    ecx,esp
 8048385:	83 e4 f0             	and    esp,0xfffffff0
 8048388:	50                   	push   eax
 8048389:	54                   	push   esp
 804838a:	52                   	push   edx
 804838b:	68 00 87 04 08       	push   0x8048700
 8048390:	68 90 86 04 08       	push   0x8048690
 8048395:	51                   	push   ecx
 8048396:	56                   	push   esi
 8048397:	68 7b 84 04 08       	push   0x804847b
 804839c:	e8 bf ff ff ff       	call   8048360 <__libc_start_main@plt>
 80483a1:	f4                   	hlt    
 80483a2:	66 90                	xchg   ax,ax
 80483a4:	66 90                	xchg   ax,ax
 80483a6:	66 90                	xchg   ax,ax
 80483a8:	66 90                	xchg   ax,ax
 80483aa:	66 90                	xchg   ax,ax
 80483ac:	66 90                	xchg   ax,ax
 80483ae:	66 90                	xchg   ax,ax

080483b0 <__x86.get_pc_thunk.bx>:
 80483b0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 80483b3:	c3                   	ret    
 80483b4:	66 90                	xchg   ax,ax
 80483b6:	66 90                	xchg   ax,ax
 80483b8:	66 90                	xchg   ax,ax
 80483ba:	66 90                	xchg   ax,ax
 80483bc:	66 90                	xchg   ax,ax
 80483be:	66 90                	xchg   ax,ax

080483c0 <deregister_tm_clones>:
 80483c0:	b8 53 99 04 08       	mov    eax,0x8049953
 80483c5:	2d 50 99 04 08       	sub    eax,0x8049950
 80483ca:	83 f8 06             	cmp    eax,0x6
 80483cd:	76 1a                	jbe    80483e9 <deregister_tm_clones+0x29>
 80483cf:	b8 00 00 00 00       	mov    eax,0x0
 80483d4:	85 c0                	test   eax,eax
 80483d6:	74 11                	je     80483e9 <deregister_tm_clones+0x29>
 80483d8:	55                   	push   ebp
 80483d9:	89 e5                	mov    ebp,esp
 80483db:	83 ec 14             	sub    esp,0x14
 80483de:	68 50 99 04 08       	push   0x8049950
 80483e3:	ff d0                	call   eax
 80483e5:	83 c4 10             	add    esp,0x10
 80483e8:	c9                   	leave  
 80483e9:	f3 c3                	repz ret 
 80483eb:	90                   	nop
 80483ec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

080483f0 <register_tm_clones>:
 80483f0:	b8 50 99 04 08       	mov    eax,0x8049950
 80483f5:	2d 50 99 04 08       	sub    eax,0x8049950
 80483fa:	c1 f8 02             	sar    eax,0x2
 80483fd:	89 c2                	mov    edx,eax
 80483ff:	c1 ea 1f             	shr    edx,0x1f
 8048402:	01 d0                	add    eax,edx
 8048404:	d1 f8                	sar    eax,1
 8048406:	74 1b                	je     8048423 <register_tm_clones+0x33>
 8048408:	ba 00 00 00 00       	mov    edx,0x0
 804840d:	85 d2                	test   edx,edx
 804840f:	74 12                	je     8048423 <register_tm_clones+0x33>
 8048411:	55                   	push   ebp
 8048412:	89 e5                	mov    ebp,esp
 8048414:	83 ec 10             	sub    esp,0x10
 8048417:	50                   	push   eax
 8048418:	68 50 99 04 08       	push   0x8049950
 804841d:	ff d2                	call   edx
 804841f:	83 c4 10             	add    esp,0x10
 8048422:	c9                   	leave  
 8048423:	f3 c3                	repz ret 
 8048425:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8048429:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

08048430 <__do_global_dtors_aux>:
 8048430:	80 3d 50 99 04 08 00 	cmp    BYTE PTR ds:0x8049950,0x0
 8048437:	75 13                	jne    804844c <__do_global_dtors_aux+0x1c>
 8048439:	55                   	push   ebp
 804843a:	89 e5                	mov    ebp,esp
 804843c:	83 ec 08             	sub    esp,0x8
 804843f:	e8 7c ff ff ff       	call   80483c0 <deregister_tm_clones>
 8048444:	c6 05 50 99 04 08 01 	mov    BYTE PTR ds:0x8049950,0x1
 804844b:	c9                   	leave  
 804844c:	f3 c3                	repz ret 
 804844e:	66 90                	xchg   ax,ax

08048450 <frame_dummy>:
 8048450:	b8 38 98 04 08       	mov    eax,0x8049838
 8048455:	8b 10                	mov    edx,DWORD PTR [eax]
 8048457:	85 d2                	test   edx,edx
 8048459:	75 05                	jne    8048460 <frame_dummy+0x10>
 804845b:	eb 93                	jmp    80483f0 <register_tm_clones>
 804845d:	8d 76 00             	lea    esi,[esi+0x0]
 8048460:	ba 00 00 00 00       	mov    edx,0x0
 8048465:	85 d2                	test   edx,edx
 8048467:	74 f2                	je     804845b <frame_dummy+0xb>
 8048469:	55                   	push   ebp
 804846a:	89 e5                	mov    ebp,esp
 804846c:	83 ec 14             	sub    esp,0x14
 804846f:	50                   	push   eax
 8048470:	ff d2                	call   edx
 8048472:	83 c4 10             	add    esp,0x10
 8048475:	c9                   	leave  
 8048476:	e9 75 ff ff ff       	jmp    80483f0 <register_tm_clones>

0804847b <main>:
 804847b:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 804847f:	83 e4 f0             	and    esp,0xfffffff0
 8048482:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 8048485:	55                   	push   ebp
 8048486:	89 e5                	mov    ebp,esp
 8048488:	57                   	push   edi
 8048489:	56                   	push   esi
 804848a:	53                   	push   ebx
 804848b:	51                   	push   ecx
 804848c:	83 ec 38             	sub    esp,0x38
 804848f:	89 e0                	mov    eax,esp
 8048491:	89 c7                	mov    edi,eax
 8048493:	c7 45 c0 00 00 00 00 	mov    DWORD PTR [ebp-0x40],0x0
 804849a:	83 ec 08             	sub    esp,0x8
 804849d:	8d 45 c0             	lea    eax,[ebp-0x40]
 80484a0:	50                   	push   eax
 80484a1:	68 20 87 04 08       	push   0x8048720
 80484a6:	e8 c5 fe ff ff       	call   8048370 <__isoc99_scanf@plt>
 80484ab:	83 c4 10             	add    esp,0x10
 80484ae:	8b 4d c0             	mov    ecx,DWORD PTR [ebp-0x40]
 80484b1:	8d 41 ff             	lea    eax,[ecx-0x1]
 80484b4:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 80484b7:	89 c8                	mov    eax,ecx
 80484b9:	ba 00 00 00 00       	mov    edx,0x0
 80484be:	69 f2 90 3e 00 00    	imul   esi,edx,0x3e90
 80484c4:	6b d8 00             	imul   ebx,eax,0x0
 80484c7:	01 f3                	add    ebx,esi
 80484c9:	be 90 3e 00 00       	mov    esi,0x3e90
 80484ce:	f7 e6                	mul    esi
 80484d0:	01 d3                	add    ebx,edx
 80484d2:	89 da                	mov    edx,ebx
 80484d4:	89 c8                	mov    eax,ecx
 80484d6:	ba 00 00 00 00       	mov    edx,0x0
 80484db:	69 f2 90 3e 00 00    	imul   esi,edx,0x3e90
 80484e1:	6b d8 00             	imul   ebx,eax,0x0
 80484e4:	01 f3                	add    ebx,esi
 80484e6:	be 90 3e 00 00       	mov    esi,0x3e90
 80484eb:	f7 e6                	mul    esi
 80484ed:	01 d3                	add    ebx,edx
 80484ef:	89 da                	mov    edx,ebx
 80484f1:	89 c8                	mov    eax,ecx
 80484f3:	69 c0 d2 07 00 00    	imul   eax,eax,0x7d2
 80484f9:	ba 10 00 00 00       	mov    edx,0x10
 80484fe:	83 ea 01             	sub    edx,0x1
 8048501:	01 d0                	add    eax,edx
 8048503:	be 10 00 00 00       	mov    esi,0x10
 8048508:	ba 00 00 00 00       	mov    edx,0x0
 804850d:	f7 f6                	div    esi
 804850f:	6b c0 10             	imul   eax,eax,0x10
 8048512:	29 c4                	sub    esp,eax
 8048514:	89 e0                	mov    eax,esp
 8048516:	83 c0 00             	add    eax,0x0
 8048519:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 804851c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 8048523:	eb 4b                	jmp    8048570 <main+0xf5>
 8048525:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 8048528:	69 d0 d2 07 00 00    	imul   edx,eax,0x7d2
 804852e:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 8048531:	01 d0                	add    eax,edx
 8048533:	83 ec 08             	sub    esp,0x8
 8048536:	50                   	push   eax
 8048537:	68 23 87 04 08       	push   0x8048723
 804853c:	e8 2f fe ff ff       	call   8048370 <__isoc99_scanf@plt>
 8048541:	83 c4 10             	add    esp,0x10
 8048544:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 8048547:	69 c0 d2 07 00 00    	imul   eax,eax,0x7d2
 804854d:	8d 90 e0 03 00 00    	lea    edx,[eax+0x3e0]
 8048553:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 8048556:	01 d0                	add    eax,edx
 8048558:	83 c0 09             	add    eax,0x9
 804855b:	83 ec 08             	sub    esp,0x8
 804855e:	50                   	push   eax
 804855f:	68 23 87 04 08       	push   0x8048723
 8048564:	e8 07 fe ff ff       	call   8048370 <__isoc99_scanf@plt>
 8048569:	83 c4 10             	add    esp,0x10
 804856c:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 8048570:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 8048573:	39 45 e4             	cmp    DWORD PTR [ebp-0x1c],eax
 8048576:	7c ad                	jl     8048525 <main+0xaa>
 8048578:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 804857f:	e9 e5 00 00 00       	jmp    8048669 <main+0x1ee>
 8048584:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 804858b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 804858e:	69 d0 d2 07 00 00    	imul   edx,eax,0x7d2
 8048594:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 8048597:	01 d0                	add    eax,edx
 8048599:	83 ec 0c             	sub    esp,0xc
 804859c:	50                   	push   eax
 804859d:	e8 ae fd ff ff       	call   8048350 <strlen@plt>
 80485a2:	83 c4 10             	add    esp,0x10
 80485a5:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 80485a8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 80485ab:	69 c0 d2 07 00 00    	imul   eax,eax,0x7d2
 80485b1:	8d 90 e0 03 00 00    	lea    edx,[eax+0x3e0]
 80485b7:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 80485ba:	01 d0                	add    eax,edx
 80485bc:	83 c0 09             	add    eax,0x9
 80485bf:	83 ec 0c             	sub    esp,0xc
 80485c2:	50                   	push   eax
 80485c3:	e8 88 fd ff ff       	call   8048350 <strlen@plt>
 80485c8:	83 c4 10             	add    esp,0x10
 80485cb:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 80485ce:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 80485d5:	eb 5e                	jmp    8048635 <main+0x1ba>
 80485d7:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
 80485de:	eb 43                	jmp    8048623 <main+0x1a8>
 80485e0:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 80485e3:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 80485e6:	69 ca d2 07 00 00    	imul   ecx,edx,0x7d2
 80485ec:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 80485ef:	01 ca                	add    edx,ecx
 80485f1:	01 d0                	add    eax,edx
 80485f3:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 80485f6:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
 80485f9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 80485fc:	69 c0 d2 07 00 00    	imul   eax,eax,0x7d2
 8048602:	01 c1                	add    ecx,eax
 8048604:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 8048607:	01 c8                	add    eax,ecx
 8048609:	05 e0 03 00 00       	add    eax,0x3e0
 804860e:	0f b6 40 09          	movzx  eax,BYTE PTR [eax+0x9]
 8048612:	38 c2                	cmp    dl,al
 8048614:	75 09                	jne    804861f <main+0x1a4>
 8048616:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
 804861d:	eb 12                	jmp    8048631 <main+0x1b6>
 804861f:	83 45 d4 01          	add    DWORD PTR [ebp-0x2c],0x1
 8048623:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 8048626:	3b 45 c4             	cmp    eax,DWORD PTR [ebp-0x3c]
 8048629:	7d 06                	jge    8048631 <main+0x1b6>
 804862b:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 804862f:	74 af                	je     80485e0 <main+0x165>
 8048631:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 8048635:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 8048638:	3b 45 c8             	cmp    eax,DWORD PTR [ebp-0x38]
 804863b:	7c 9a                	jl     80485d7 <main+0x15c>
 804863d:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 8048641:	74 12                	je     8048655 <main+0x1da>
 8048643:	83 ec 0c             	sub    esp,0xc
 8048646:	68 26 87 04 08       	push   0x8048726
 804864b:	e8 e0 fc ff ff       	call   8048330 <puts@plt>
 8048650:	83 c4 10             	add    esp,0x10
 8048653:	eb 10                	jmp    8048665 <main+0x1ea>
 8048655:	83 ec 0c             	sub    esp,0xc
 8048658:	68 2a 87 04 08       	push   0x804872a
 804865d:	e8 ce fc ff ff       	call   8048330 <puts@plt>
 8048662:	83 c4 10             	add    esp,0x10
 8048665:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
 8048669:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 804866c:	39 45 e0             	cmp    DWORD PTR [ebp-0x20],eax
 804866f:	0f 8c 0f ff ff ff    	jl     8048584 <main+0x109>
 8048675:	89 fc                	mov    esp,edi
 8048677:	b8 00 00 00 00       	mov    eax,0x0
 804867c:	8d 65 f0             	lea    esp,[ebp-0x10]
 804867f:	59                   	pop    ecx
 8048680:	5b                   	pop    ebx
 8048681:	5e                   	pop    esi
 8048682:	5f                   	pop    edi
 8048683:	5d                   	pop    ebp
 8048684:	8d 61 fc             	lea    esp,[ecx-0x4]
 8048687:	c3                   	ret    
 8048688:	66 90                	xchg   ax,ax
 804868a:	66 90                	xchg   ax,ax
 804868c:	66 90                	xchg   ax,ax
 804868e:	66 90                	xchg   ax,ax

08048690 <__libc_csu_init>:
 8048690:	55                   	push   ebp
 8048691:	57                   	push   edi
 8048692:	31 ff                	xor    edi,edi
 8048694:	56                   	push   esi
 8048695:	53                   	push   ebx
 8048696:	e8 15 fd ff ff       	call   80483b0 <__x86.get_pc_thunk.bx>
 804869b:	81 c3 8d 12 00 00    	add    ebx,0x128d
 80486a1:	83 ec 1c             	sub    esp,0x1c
 80486a4:	8b 6c 24 30          	mov    ebp,DWORD PTR [esp+0x30]
 80486a8:	8d b3 0c ff ff ff    	lea    esi,[ebx-0xf4]
 80486ae:	e8 41 fc ff ff       	call   80482f4 <_init>
 80486b3:	8d 83 08 ff ff ff    	lea    eax,[ebx-0xf8]
 80486b9:	29 c6                	sub    esi,eax
 80486bb:	c1 fe 02             	sar    esi,0x2
 80486be:	85 f6                	test   esi,esi
 80486c0:	74 27                	je     80486e9 <__libc_csu_init+0x59>
 80486c2:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 80486c8:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
 80486cc:	89 2c 24             	mov    DWORD PTR [esp],ebp
 80486cf:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
 80486d3:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
 80486d7:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 80486db:	ff 94 bb 08 ff ff ff 	call   DWORD PTR [ebx+edi*4-0xf8]
 80486e2:	83 c7 01             	add    edi,0x1
 80486e5:	39 f7                	cmp    edi,esi
 80486e7:	75 df                	jne    80486c8 <__libc_csu_init+0x38>
 80486e9:	83 c4 1c             	add    esp,0x1c
 80486ec:	5b                   	pop    ebx
 80486ed:	5e                   	pop    esi
 80486ee:	5f                   	pop    edi
 80486ef:	5d                   	pop    ebp
 80486f0:	c3                   	ret    
 80486f1:	eb 0d                	jmp    8048700 <__libc_csu_fini>
 80486f3:	90                   	nop
 80486f4:	90                   	nop
 80486f5:	90                   	nop
 80486f6:	90                   	nop
 80486f7:	90                   	nop
 80486f8:	90                   	nop
 80486f9:	90                   	nop
 80486fa:	90                   	nop
 80486fb:	90                   	nop
 80486fc:	90                   	nop
 80486fd:	90                   	nop
 80486fe:	90                   	nop
 80486ff:	90                   	nop

08048700 <__libc_csu_fini>:
 8048700:	f3 c3                	repz ret 

Disassembly of section .fini:

08048704 <_fini>:
 8048704:	53                   	push   ebx
 8048705:	83 ec 08             	sub    esp,0x8
 8048708:	e8 a3 fc ff ff       	call   80483b0 <__x86.get_pc_thunk.bx>
 804870d:	81 c3 1b 12 00 00    	add    ebx,0x121b
 8048713:	83 c4 08             	add    esp,0x8
 8048716:	5b                   	pop    ebx
 8048717:	c3                   	ret    

Disassembly of section .rodata:

08048718 <_fp_hw>:
 8048718:	03 00                	add    eax,DWORD PTR [eax]
	...

0804871c <_IO_stdin_used>:
 804871c:	01 00                	add    DWORD PTR [eax],eax
 804871e:	02 00                	add    al,BYTE PTR [eax]
 8048720:	25 64 00 25 73       	and    eax,0x73250064
 8048725:	00 59 65             	add    BYTE PTR [ecx+0x65],bl
 8048728:	73 00                	jae    804872a <_IO_stdin_used+0xe>
 804872a:	4e                   	dec    esi
 804872b:	6f                   	outs   dx,DWORD PTR ds:[esi]
	...

Disassembly of section .eh_frame_hdr:

08048730 <.eh_frame_hdr>:
 8048730:	01 1b                	add    DWORD PTR [ebx],ebx
 8048732:	03 3b                	add    edi,DWORD PTR [ebx]
 8048734:	28 00                	sub    BYTE PTR [eax],al
 8048736:	00 00                	add    BYTE PTR [eax],al
 8048738:	04 00                	add    al,0x0
 804873a:	00 00                	add    BYTE PTR [eax],al
 804873c:	f0 fb                	lock sti 
 804873e:	ff                   	(bad)  
 804873f:	ff 44 00 00          	inc    DWORD PTR [eax+eax*1+0x0]
 8048743:	00 4b fd             	add    BYTE PTR [ebx-0x3],cl
 8048746:	ff                   	(bad)  
 8048747:	ff 68 00             	jmp    FWORD PTR [eax+0x0]
 804874a:	00 00                	add    BYTE PTR [eax],al
 804874c:	60                   	pusha  
 804874d:	ff                   	(bad)  
 804874e:	ff                   	(bad)  
 804874f:	ff ac 00 00 00 d0 ff 	jmp    FWORD PTR [eax+eax*1-0x300000]
 8048756:	ff                   	(bad)  
 8048757:	ff                   	(bad)  
 8048758:	e8                   	.byte 0xe8
 8048759:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

0804875c <__FRAME_END__-0xd0>:
 804875c:	14 00                	adc    al,0x0
 804875e:	00 00                	add    BYTE PTR [eax],al
 8048760:	00 00                	add    BYTE PTR [eax],al
 8048762:	00 00                	add    BYTE PTR [eax],al
 8048764:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 8048767:	00 01                	add    BYTE PTR [ecx],al
 8048769:	7c 08                	jl     8048773 <_IO_stdin_used+0x57>
 804876b:	01 1b                	add    DWORD PTR [ebx],ebx
 804876d:	0c 04                	or     al,0x4
 804876f:	04 88                	add    al,0x88
 8048771:	01 00                	add    DWORD PTR [eax],eax
 8048773:	00 20                	add    BYTE PTR [eax],ah
 8048775:	00 00                	add    BYTE PTR [eax],al
 8048777:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 804877a:	00 00                	add    BYTE PTR [eax],al
 804877c:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 804877d:	fb                   	sti    
 804877e:	ff                   	(bad)  
 804877f:	ff 60 00             	jmp    DWORD PTR [eax+0x0]
 8048782:	00 00                	add    BYTE PTR [eax],al
 8048784:	00 0e                	add    BYTE PTR [esi],cl
 8048786:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 8048789:	0c 4a                	or     al,0x4a
 804878b:	0f 0b                	ud2    
 804878d:	74 04                	je     8048793 <_IO_stdin_used+0x77>
 804878f:	78 00                	js     8048791 <_IO_stdin_used+0x75>
 8048791:	3f                   	aas    
 8048792:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 8048794:	2a 32                	sub    dh,BYTE PTR [edx]
 8048796:	24 22                	and    al,0x22
 8048798:	40                   	inc    eax
 8048799:	00 00                	add    BYTE PTR [eax],al
 804879b:	00 40 00             	add    BYTE PTR [eax+0x0],al
 804879e:	00 00                	add    BYTE PTR [eax],al
 80487a0:	db fc                	(bad)  
 80487a2:	ff                   	(bad)  
 80487a3:	ff 0d 02 00 00 00    	dec    DWORD PTR ds:0x2
 80487a9:	44                   	inc    esp
 80487aa:	0c 01                	or     al,0x1
 80487ac:	00 47 10             	add    BYTE PTR [edi+0x10],al
 80487af:	05 02 75 00 46       	add    eax,0x46007502
 80487b4:	0f 03 75 70          	lsl    esi,WORD PTR [ebp+0x70]
 80487b8:	06                   	push   es
 80487b9:	10 07                	adc    BYTE PTR [edi],al
 80487bb:	02 75 7c             	add    dh,BYTE PTR [ebp+0x7c]
 80487be:	10 06                	adc    BYTE PTR [esi],al
 80487c0:	02 75 78             	add    dh,BYTE PTR [ebp+0x78]
 80487c3:	10 03                	adc    BYTE PTR [ebx],al
 80487c5:	02 75 74             	add    dh,BYTE PTR [ebp+0x74]
 80487c8:	03 f4                	add    esi,esp
 80487ca:	01 c1                	add    ecx,eax
 80487cc:	0c 01                	or     al,0x1
 80487ce:	00 41 c3             	add    BYTE PTR [ecx-0x3d],al
 80487d1:	41                   	inc    ecx
 80487d2:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
 80487d6:	c5 43 0c             	lds    eax,FWORD PTR [ebx+0xc]
 80487d9:	04 04                	add    al,0x4
 80487db:	00 38                	add    BYTE PTR [eax],bh
 80487dd:	00 00                	add    BYTE PTR [eax],al
 80487df:	00 84 00 00 00 ac fe 	add    BYTE PTR [eax+eax*1-0x1540000],al
 80487e6:	ff                   	(bad)  
 80487e7:	ff 61 00             	jmp    DWORD PTR [ecx+0x0]
 80487ea:	00 00                	add    BYTE PTR [eax],al
 80487ec:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 80487ef:	08 85 02 41 0e 0c    	or     BYTE PTR [ebp+0xc0e4102],al
 80487f5:	87 03                	xchg   DWORD PTR [ebx],eax
 80487f7:	43                   	inc    ebx
 80487f8:	0e                   	push   cs
 80487f9:	10 86 04 41 0e 14    	adc    BYTE PTR [esi+0x140e4104],al
 80487ff:	83 05 4e 0e 30 02 48 	add    DWORD PTR ds:0x2300e4e,0x48
 8048806:	0e                   	push   cs
 8048807:	14 41                	adc    al,0x41
 8048809:	c3                   	ret    
 804880a:	0e                   	push   cs
 804880b:	10 41 c6             	adc    BYTE PTR [ecx-0x3a],al
 804880e:	0e                   	push   cs
 804880f:	0c 41                	or     al,0x41
 8048811:	c7                   	(bad)  
 8048812:	0e                   	push   cs
 8048813:	08 41 c5             	or     BYTE PTR [ecx-0x3b],al
 8048816:	0e                   	push   cs
 8048817:	04 10                	add    al,0x10
 8048819:	00 00                	add    BYTE PTR [eax],al
 804881b:	00 c0                	add    al,al
 804881d:	00 00                	add    BYTE PTR [eax],al
 804881f:	00 e0                	add    al,ah
 8048821:	fe                   	(bad)  
 8048822:	ff                   	(bad)  
 8048823:	ff 02                	inc    DWORD PTR [edx]
 8048825:	00 00                	add    BYTE PTR [eax],al
 8048827:	00 00                	add    BYTE PTR [eax],al
 8048829:	00 00                	add    BYTE PTR [eax],al
	...

0804882c <__FRAME_END__>:
 804882c:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .init_array:

08049830 <__frame_dummy_init_array_entry>:
 8049830:	50                   	push   eax
 8049831:	84 04 08             	test   BYTE PTR [eax+ecx*1],al

Disassembly of section .fini_array:

08049834 <__do_global_dtors_aux_fini_array_entry>:
 8049834:	30                   	.byte 0x30
 8049835:	84 04 08             	test   BYTE PTR [eax+ecx*1],al

Disassembly of section .jcr:

08049838 <__JCR_END__>:
 8049838:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynamic:

0804983c <_DYNAMIC>:
 804983c:	01 00                	add    DWORD PTR [eax],eax
 804983e:	00 00                	add    BYTE PTR [eax],al
 8049840:	01 00                	add    DWORD PTR [eax],eax
 8049842:	00 00                	add    BYTE PTR [eax],al
 8049844:	0c 00                	or     al,0x0
 8049846:	00 00                	add    BYTE PTR [eax],al
 8049848:	f4                   	hlt    
 8049849:	82                   	(bad)  
 804984a:	04 08                	add    al,0x8
 804984c:	0d 00 00 00 04       	or     eax,0x4000000
 8049851:	87 04 08             	xchg   DWORD PTR [eax+ecx*1],eax
 8049854:	19 00                	sbb    DWORD PTR [eax],eax
 8049856:	00 00                	add    BYTE PTR [eax],al
 8049858:	30 98 04 08 1b 00    	xor    BYTE PTR [eax+0x1b0804],bl
 804985e:	00 00                	add    BYTE PTR [eax],al
 8049860:	04 00                	add    al,0x0
 8049862:	00 00                	add    BYTE PTR [eax],al
 8049864:	1a 00                	sbb    al,BYTE PTR [eax]
 8049866:	00 00                	add    BYTE PTR [eax],al
 8049868:	34 98                	xor    al,0x98
 804986a:	04 08                	add    al,0x8
 804986c:	1c 00                	sbb    al,0x0
 804986e:	00 00                	add    BYTE PTR [eax],al
 8049870:	04 00                	add    al,0x0
 8049872:	00 00                	add    BYTE PTR [eax],al
 8049874:	f5                   	cmc    
 8049875:	fe                   	(bad)  
 8049876:	ff 6f 8c             	jmp    FWORD PTR [edi-0x74]
 8049879:	81 04 08 05 00 00 00 	add    DWORD PTR [eax+ecx*1],0x5
 8049880:	1c 82                	sbb    al,0x82
 8049882:	04 08                	add    al,0x8
 8049884:	06                   	push   es
 8049885:	00 00                	add    BYTE PTR [eax],al
 8049887:	00 ac 81 04 08 0a 00 	add    BYTE PTR [ecx+eax*4+0xa0804],ch
 804988e:	00 00                	add    BYTE PTR [eax],al
 8049890:	6a 00                	push   0x0
 8049892:	00 00                	add    BYTE PTR [eax],al
 8049894:	0b 00                	or     eax,DWORD PTR [eax]
 8049896:	00 00                	add    BYTE PTR [eax],al
 8049898:	10 00                	adc    BYTE PTR [eax],al
 804989a:	00 00                	add    BYTE PTR [eax],al
 804989c:	15 00 00 00 00       	adc    eax,0x0
 80498a1:	00 00                	add    BYTE PTR [eax],al
 80498a3:	00 03                	add    BYTE PTR [ebx],al
 80498a5:	00 00                	add    BYTE PTR [eax],al
 80498a7:	00 28                	add    BYTE PTR [eax],ch
 80498a9:	99                   	cdq    
 80498aa:	04 08                	add    al,0x8
 80498ac:	02 00                	add    al,BYTE PTR [eax]
 80498ae:	00 00                	add    BYTE PTR [eax],al
 80498b0:	28 00                	sub    BYTE PTR [eax],al
 80498b2:	00 00                	add    BYTE PTR [eax],al
 80498b4:	14 00                	adc    al,0x0
 80498b6:	00 00                	add    BYTE PTR [eax],al
 80498b8:	11 00                	adc    DWORD PTR [eax],eax
 80498ba:	00 00                	add    BYTE PTR [eax],al
 80498bc:	17                   	pop    ss
 80498bd:	00 00                	add    BYTE PTR [eax],al
 80498bf:	00 cc                	add    ah,cl
 80498c1:	82                   	(bad)  
 80498c2:	04 08                	add    al,0x8
 80498c4:	11 00                	adc    DWORD PTR [eax],eax
 80498c6:	00 00                	add    BYTE PTR [eax],al
 80498c8:	c4 82 04 08 12 00    	les    eax,FWORD PTR [edx+0x120804]
 80498ce:	00 00                	add    BYTE PTR [eax],al
 80498d0:	08 00                	or     BYTE PTR [eax],al
 80498d2:	00 00                	add    BYTE PTR [eax],al
 80498d4:	13 00                	adc    eax,DWORD PTR [eax]
 80498d6:	00 00                	add    BYTE PTR [eax],al
 80498d8:	08 00                	or     BYTE PTR [eax],al
 80498da:	00 00                	add    BYTE PTR [eax],al
 80498dc:	fe                   	(bad)  
 80498dd:	ff                   	(bad)  
 80498de:	ff 6f 94             	jmp    FWORD PTR [edi-0x6c]
 80498e1:	82                   	(bad)  
 80498e2:	04 08                	add    al,0x8
 80498e4:	ff                   	(bad)  
 80498e5:	ff                   	(bad)  
 80498e6:	ff 6f 01             	jmp    FWORD PTR [edi+0x1]
 80498e9:	00 00                	add    BYTE PTR [eax],al
 80498eb:	00 f0                	add    al,dh
 80498ed:	ff                   	(bad)  
 80498ee:	ff 6f 86             	jmp    FWORD PTR [edi-0x7a]
 80498f1:	82                   	(bad)  
 80498f2:	04 08                	add    al,0x8
	...

Disassembly of section .got:

08049924 <.got>:
 8049924:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .got.plt:

08049928 <_GLOBAL_OFFSET_TABLE_>:
 8049928:	3c 98                	cmp    al,0x98
 804992a:	04 08                	add    al,0x8
	...
 8049934:	36 83 04 08 46       	add    DWORD PTR ss:[eax+ecx*1],0x46
 8049939:	83 04 08 56          	add    DWORD PTR [eax+ecx*1],0x56
 804993d:	83 04 08 66          	add    DWORD PTR [eax+ecx*1],0x66
 8049941:	83 04 08 76          	add    DWORD PTR [eax+ecx*1],0x76
 8049945:	83                   	.byte 0x83
 8049946:	04 08                	add    al,0x8

Disassembly of section .data:

08049948 <__data_start>:
 8049948:	00 00                	add    BYTE PTR [eax],al
	...

0804994c <__dso_handle>:
 804994c:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .bss:

08049950 <__bss_start>:
 8049950:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    edi
   1:	43                   	inc    ebx
   2:	43                   	inc    ebx
   3:	3a 20                	cmp    ah,BYTE PTR [eax]
   5:	28 44 65 62          	sub    BYTE PTR [ebp+eiz*2+0x62],al
   9:	69 61 6e 20 34 2e 39 	imul   esp,DWORD PTR [ecx+0x6e],0x392e3420
  10:	2e 32 2d 31 39 29 20 	xor    ch,BYTE PTR cs:0x20293931
  17:	34 2e                	xor    al,0x2e
  19:	39 2e                	cmp    DWORD PTR [esi],ebp
  1b:	32 00                	xor    al,BYTE PTR [eax]
  1d:	47                   	inc    edi
  1e:	43                   	inc    ebx
  1f:	43                   	inc    ebx
  20:	3a 20                	cmp    ah,BYTE PTR [eax]
  22:	28 44 65 62          	sub    BYTE PTR [ebp+eiz*2+0x62],al
  26:	69 61 6e 20 34 2e 38 	imul   esp,DWORD PTR [ecx+0x6e],0x382e3420
  2d:	2e 34 2d             	cs xor al,0x2d
  30:	31 29                	xor    DWORD PTR [ecx],ebp
  32:	20 34 2e             	and    BYTE PTR [esi+ebp*1],dh
  35:	38 2e                	cmp    BYTE PTR [esi],ch
  37:	34 00                	xor    al,0x0
