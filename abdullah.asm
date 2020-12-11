

drawm macro a,b,c,d

mov al,a
mov marioc1 , al
mov al,b
mov marioc2 , al
mov al,c
mov marior1 , al
mov al,d
mov marior2, al
;22,23,4,5


	drawbox 10111101b,marioc1,marioc2,marior1,marior2	;middle body
dec marioc1	
sub marioc2,2	
dec marior1	
inc marior2
	
	drawbox 11111101b,marioc1,marioc2,marior1,marior2	;head
add marioc1,3
add marioc2,3
sub marior2,3	
	
	drawbox 11111101b,marioc1,marioc2,marior1,marior2	;left leg
add marior1,3
add marior2,3	
	
	drawbox 11111101b,marioc1,marioc2,marior1,marior2	;right leg

endm
;----------------------------------------------------------------------------
drawenemy macro a,b
mov al,a
mov bl,b
mov en1r1,al
mov en1r2,bl
mov en1c1,22
mov en1c2,23



	drawbox 01001101b,en1c1,en1c2,en1r1,en1r2
dec en1c1	
sub en1c2,2	
dec en1r1	
inc en1r2
	
	drawbox 11011101b,en1c1,en1c2,en1r1,en1r2
add en1c1,3
add en1c2,3
sub en1r2,3	
	
	drawbox 11011101b,en1c1,en1c2,en1r1,en1r2	;left leg
add en1r1,3
add en1r2,3	
	
	drawbox 11011101b,en1c1,en1c2,en1r1,en1r2	;right leg



endm
;------------------------------------------------------------------------------

displaycharacter macro char
	call pushaa
	mov  ah,9      		; write character/attribute
	mov  al,char  		; character to display
	mov  bh,0      		; video page 0
	mov  bl,0101b		; attribute
	;or   bl,10000000b	; set blink/intensity bit
	mov  cx,1   
			; display it one time
	int  10h
	call popaa
endm

Gotoxy macro row,col
;
; Sets the cursor position on video page 0.
; Receives: DH,DL = row, column
; Returns: nothing
;---------------------------------------------------

	mov dl,row	;for row
	mov dh,col	;for column
	mov ah,2
	mov bh,0
	int 10h

	endm


drawbox macro color,d1,d2,e1,e2
	mov ah,6	
	mov al,0	
	mov bh,color
 
	mov ch,d1	;col ch-dh	;ch aur dh ke coordinates column ko reperent karte
	mov dh,d2
	mov cl,e1	;row cl-dl	;cl aur dl ke coordinates row ko reperent karte
	mov dl,e2

	int 10h
endm

drawcharacters macro rowpos,colpos
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,rowpos     ;SET ROW 
	MOV DL,colpos  ;SET COLUMN
	INT 10H                 ;CALLING BIOS

endm	

.model small
.stack 0100h
.data
	scanCode  BYTE ?
	axx word ? 
	ASCIICode BYTE ? 
	chj db '*$'
	count db 0
	var db 0
en1r1 db 0
en1r2 db 0	

er1 db 21
er2 db 22
en1c1 db ?
en1c2 db ?
counte1 db 0
counte2 db 0
	msg db "CONGRATS!!! YOU WON$"

oc1 db 22
oc2 db 23
or1 db 4
or2 db 5
subb db ?
marioc1 db 0
marioc2 db 0
marior1 db 0
marior2 db 0
lvl db 1



	
Row_poistion db 0     ;SET ROW 
Column_poistion db 0
.code
  
  
 main proc

  mov ax,@data
  mov ds,ax
  

	
	
  mov ax,0
  mov ax,0
; .while ah!=1
call clearscreen

drawbox 10111101b,25,26,4,8
 ;drawm c1,c2,r1,r2
	;add r1,5
	;add r2,5
;mov cx,2
	call clearscreen
	call displayl1
	drawm oc1,oc2,or1,or2
	
	

	
l1:

	
	mov ah,1
	int 16h
	
	; jz l1
	mov ah,0
	int 16h
	call move
	.if ah==-1
		jmp exit
	.endif
	.if or2 >75
	call main2
	.endif
	;call clearscreen
	;drawm c1,c2,r1,r2
	;inc c1
	;inc c2
	;add r1,5
	;add r2,
	jmp l1
	
exit:	
LOL:
; .endw	
	;Gotoxy 0,0
	;character



MOV AH,4CH
INT 21h

main endp



main2 proc
  mov ax,0
  mov ax,0
  mov lvl,2
; .while ah!=1
call clearscreen

drawbox 10111101b,25,26,4,8
 ;drawm c1,c2,r1,r2
	;add r1,5
	;add r2,5
;mov cx,2
mov oc1, 22
mov oc2,23
mov or1,4
mov or2,5
	call clearscreen
	call display2
	drawm oc1,oc2,or1,or2
	
	

	
l2:

	
	mov ah,1
	int 16h
	
	; jz l1
	mov ah,0
	int 16h
	call move
	.if ah==-1
		jmp exit2
	.endif
	.if or2 >75
	call main3
	.endif
	;call clearscreen
	;drawm c1,c2,r1,r2
	;inc c1
	;inc c2
	;add r1,5
	;add r2,
	jmp l2
	
exit2:	
LOL2:
; .endw	
	;Gotoxy 0,0
	;character



MOV AH,4CH
INT 21h
ret
main2 endp



main3 proc

  mov ax,0
  mov ax,0
  mov lvl,3
; .while ah!=1
call clearscreen

drawbox 10111101b,25,26,4,8
 ;drawm c1,c2,r1,r2
	;add r1,5
	;add r2,5
;mov cx,2
mov oc1, 22
mov oc2,23
mov or1,4
mov or2,5
	call clearscreen
	call display3
	drawm oc1,oc2,or1,or2
	
	

	
l3:

	
	mov ah,1
	int 16h
	
	; jz l1
	mov ah,0
	int 16h
	call move
	.if ah==-1
		jmp exit3
	.endif
	.if or2 >75
	call wingame
	.endif
	;call clearscreen
	;drawm c1,c2,r1,r2
	;inc c1
	;inc c2
	;add r1,5
	;add r2,
	jmp l3
	
exit3:	
LOL3:
; .endw	
	;Gotoxy 0,0
	;character



MOV AH,4CH
INT 21h
ret




main3 endp









enemymov proc


.if counte1<=10			
		
			add er1,1
			add er2,1
			inc counte1
			;call clearscreen
;drawbox 11110101b,23,24,er1,er2
drawenemy er1,er2		
		
 .elseif  counte2<=10
			.if counte2==10
			mov counte1,1
			mov counte2,0
			.endif
			;call delay2
			sub er1,1
			sub er2,1
		inc counte2
			;drawbox 11110101b,23,24,er1,er2
		drawenemy er1,er2		

		
	.endif

ret
enemymov endp






Move proc
	
	.if ah==04Dh || ah==20h;right,D
	
	; call clearscreen
	; call displayl1
	; add or1,2
	; add or2,2
	
	; drawm oc1,oc2,or1,or2
	call rightmov
	; mov bl,or1
	; sub cl,er1
	; mov subb,bl
	; .if bl==er1 || bl==er2 || cl<=1 && cl>=-1
	; call clearscreen
	; mov ah,-1	
	;.endif
	
	.elseif ah==4Bh || ah==1Eh	;left,A
	
	call leftmov
	; mov bl,or1
	; sub cl,er1
	; mov subb,bl
	; .if bl==er1 || bl==er2 || cl<=1 && cl>=-1
	; call clearscreen
	; mov ah,-1	
	; .endif
	

	
	
	.elseif ah==48h || ah==11h	;Up,W	

	call up
	
	.elseif ah==50h || ah==1Fh	;Down,S	
	
	.elseif ah==1
	call clearscreen
	mov ah,-1
	;jmp LOL
	.endif
	
	
	ret
move endp

endgame proc
call clearscreen
mov ah, 4ch
int 21h
ret

endgame endp

rightmov proc
.if oc2 > 21 &&  or1>0 && or1<13  ||  or1>19 && or1 < 30 || or1>37 && or1<48 || or1> 54 && or1<61 || or1>67
	call clearscreen
	.if lvl==1
	call displayl1
	.endif
	.if lvl==2
	call display2
	.endif
	.if lvl==3
	call display3
	.endif
	add or1,2
	add or2,2
	drawm oc1,oc2,or1,or2
.if lvl==2 || lvl==3
	call enemymov
	.endif


; .elseif oc2 < 19 && or1 >=12 && or1 <= 24 || or1 >=29 && or1 <= 42 || or1 >=49 && or1 <= 57 
	; call clearscreen
	; .if lvl==1
	; call displayl1
	; .endif
	; .if lvl==2
	; call display2
	; .endif
	; .if lvl==3
	; call display3
	; .endif
	; add or1,2
	; add or2,2
	; .if or1 >= 21 && or1 <= 24 || (or1 >=39  && or1<=42) || (or1 >= 54 && or1<=57) || (or1 >= 67 && or1<=70)
		; add oc1,8
		; add oc2,8
	; .endif
	; drawm oc1,oc2,or1,or2
	; .if lvl==2|| lvl==3
	; call enemymov
	;;call collision
	; .endif
.endif
call collision
ret
rightmov endp





leftmov proc
.if  oc2 > 22 && or1>5 && or1<15 || or1>23 && or1 < 33 || or1>41 && or1<50 || or1> 57 && or1<66 || or1>70
call clearscreen
	.if lvl==1
	call displayl1
	.endif
	.if lvl==2
	call display2
	.endif
	.if lvl==3
	call display3
	.endif
	sub or1,2
	sub or2,2
	drawm oc1,oc2,or1,or2
	.if lvl==2 || lvl==3
	call enemymov
	;call collision
	.endif

	
.endif
call collision
ret
leftmov endp



up proc

	;call clearscreen
	;call displayl1

mov cx,6
sub oc1,8
sub oc2,8
mov var,6
	jumpp:
		call delay
		call clearscreen
	.if lvl==1
	call displayl1
	.endif
	.if lvl==2
	call display2
	.endif
	.if lvl==3
	call display3
	.endif
		add or1,2
		add or2,2	
		drawm oc1,oc2,or1,or2
	.if lvl==2 || lvl==3
	call enemymov
	.endif

		dec var
	.if var>0
	jmp jumpp
	.endif
	
call clearscreen
.if lvl==1
	call displayl1
	.endif
	.if lvl==2
	call display2
	.endif
	.if lvl==3
	call display3
	.endif

call detectup
; add oc1,8
; add oc2,8

drawm oc1,oc2,or1,or2
	.if lvl==2 || lvl==3
	call enemymov
	.endif
		
ret 
up endp

;====================================================================================
detectup proc

.if or1 >= 17 && or1 <= 20 || or1 >= 34 && or1<=37 || or1 >= 51 && or1<=54 || or1 >= 64 && or1<=68
jmp eeend
.endif
add oc1,8
add oc2,8

eeend:

ret
detectup endp


collision proc

.if lvl==2 || lvl==4
	mov bl,er1
mov al,er2
 
	.if bl == or1 || al==or1
		call endgame
	.endif
	sub bl,1
	sub al,1
	.if bl == or1 || al==or1
		call endgame
	.endif
	add bl,2
	add al,2
	.if bl == or1 || al==or1
		call endgame
	.endif
	add bl,1
	add bl,1
	.if bl == or1 || al==or1
		call endgame
	.endif
	sub bl,4
	sub al,4
	.if bl == or1  || al==or1
		call endgame
	.endif

; mov dl,er1
; add dl,48
; mov ah,2
; int 21h
; mov dl,or1
; add dl,48
; mov ah,2
; int 21h
.endif

ret
collision endp

wingame proc

mov ah,06
mov al,0
;mov cx,0
mov ch,0	;c1
mov cl,00	;r1
mov dh,30	;c1
mov dl,79	;r2

mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,12
mov dl,30
int 10h
lea dx,msg
mov ah,09
int 21h


mov dh,12
mov dl,30
int 10h 

ret


wingame endp




displayl1 proc
	;flag
	drawbox 11111111b,2,24,78,78
	drawbox 10101111b,2,5,66,77
 
 
		;obstacles
	drawbox 01001111b,19,24,18,19
	drawbox 11101111b,18,19,17,20

	drawbox 01001111b,18,24,35,36
	drawbox 11101111b,17,18,34,37


	drawbox 01001111b,19,24,52,53
	drawbox 11101111b,18,19,51,54


	drawbox 11101111b,23,24,65,67
	ret
	;---------------------------------

displayl1 endp



display2 proc
;flag
	drawbox 01111111b,2,24,78,78
	drawbox 01011111b,2,5,66,77
 
 
		;obstacles
	drawbox 10011111b,19,24,18,19
	drawbox 00111111b,18,19,17,20

	drawbox 10011111b,18,24,35,36
	drawbox 00111111b,17,18,34,37



	drawbox 10011111b,19,24,52,53
	drawbox 00111111b,18,19,51,54


	drawbox 10011111b,23,24,65,67
	
	ret
	;---------------------------------
	
display2 endp



display3 proc
;flag
	drawbox 11111111b,15,21,76,76
	drawbox 10101111b,15,16,71,75
	
	drawbox 11001111b,18,24,78,80
	drawbox 01111111b,20,24,75,77
	drawbox 11001111b,18,24,72,74
  
		;obstacles
	drawbox 10011111b,19,24,18,19
	drawbox 00111111b,18,19,17,20

	drawbox 10011111b,18,24,35,36
	drawbox 00111111b,17,18,34,37



	drawbox 10011111b,19,24,52,53
	drawbox 00111111b,18,19,51,54


	drawbox 10011111b,23,24,65,67
	
	ret





display3 endp









comment&
drawmario proc
mov marioc1 , 21
mov marioc2 , 23
mov marior1 , 4
mov marior2, 5

	drawbox 10111101b,marioc1,marioc2,marior1,marior2
dec marioc1	
sub marioc2,2	
dec marior1	
inc marior2
	
	drawbox 11111101b,marioc1,marioc2,marior1,marior2
add marioc1,3
add marioc2,3
sub marior2,3	
	
	drawbox 11111101b,marioc1,marioc2,marior1,marior2
add marior1,3
add marior2,3	
	
	drawbox 11111101b,marioc1,marioc2,marior1,marior2
	ret
drawmario endp
&
drawline proc

mov ax,6	;select mode 6.high res
int 10h
;draw line
mov ah,0ch ; write pixel
mov al,1  ;white
mov cx,301  ;beginning col
mov dx,100   ;row
l1:
int 10h
inc dx  ;next col
cmp dx,200  ;more cols?
jle l1   ;yes, repeat

;read keyboard 
mov ah,0
int 16h
;set to text mode
mov ax,3   ;select mode 3,text mode
int 10h
ret

drawline endp


delay proc


push ax
push bx
push cx
push dx

mov cx,1000
mydelay:
mov bx,200      ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
mydelay1:
dec bx
jnz mydelay1
loop mydelay


pop dx
pop cx
pop bx
pop ax

ret

delay endp


delay2 proc


push ax
push bx
push cx
push dx

mov cx,1000
mydelay:
mov bx,200      ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
mydelay1:
dec bx
jnz mydelay1
loop mydelay


pop dx
pop cx
pop bx
pop ax

ret

delay2 endp




box proc
	
	call clearscreen

	mov ah,6	
	mov al,0	
	mov bh,11111101b
	mov cl,3	;row cl-dl	;cl aur dl ke coordinates row ko reperent karte
	mov dl,7
	mov ch,20	;col ch-dh	;ch aur dh ke coordinates column ko reperent karte
	mov dh,23

	int 10h
	ret
box endp

clearscreen proc
	mov al,03
	mov ah,0
	int 10h
	ret
clearscreen endp




draw_border proc

	call clearscreen

	;-------left side----------


	mov Row_poistion, 18
	mov Column_poistion,10
	


	left:
		inc count
		MOV AH,2                ;SET CURSOR POSITION                 
		MOV DH,Row_poistion     ;SET ROW 
		MOV DL,Column_poistion  ;SET COLUMN
		INT 10H                 ;CALLING BIOS	

		mov ah,09h
		mov al,'|'
		mov bh,0
		mov bl,02
		mov cx,1
		int 10h
		add Row_poistion,1
	
		cmp	count,2
		jbe left

	;-------right side----------

	mov Row_poistion, 9
	mov Column_poistion, 45

	mov count,0
	right:
		inc count
		MOV AH,2                ;SET CURSOR POSITION                 
		MOV DH,Row_poistion     ;SET ROW 
		MOV DL,Column_poistion  ;SET COLUMN
		INT 10H                 ;CALLING BIOS

		mov ah,09h
		mov al,'|'
		mov bh,0
		mov bl,02
		mov cx,1
		int 10h
		add Row_poistion,1
	
		cmp	count,2
		jbe right

		add Row_poistion,1


	;-------top side-----------

	mov Row_poistion, 8			;row on dosbox
	mov Column_poistion, 28		;column on dosbox
	
	mov count,0
	top:
		inc count
		MOV AH,2                ;SET CURSOR POSITION                 
		MOV DH,Row_poistion     ;SET ROW 
		MOV DL,Column_poistion  ;SET COLUMN
		INT 10H                 ;CALLING BIOS
	
	
	
		mov ah,09h
		mov al,'-'
		mov bh,0
		mov bl,02
		mov cx,1
		int 10h
		add Column_poistion,1
	
		cmp	count,18
		jbe top

	;-------bottom side----------

	mov Row_poistion, 12
	mov Column_poistion, 28

	mov count,0

	bottom:
		inc count
		MOV AH,2                ;SET CURSOR POSITION                 
		MOV DH,Row_poistion     ;SET ROW 
		MOV DL,Column_poistion  ;SET COLUMN
		INT 10H                 ;CALLING BIOS

		mov ah,09h
		mov al,'-'
		mov bh,0
		mov bl,02
		mov cx,1
		int 10h
		add Column_poistion,1
		
		cmp	count,18
		jbe bottom

	;--------------------------------------

ret
draw_border endp


pushaa proc
push dx
	push cx
	push bx
	push ax
	ret
pushaa endp

popaa proc
pop ax
	pop bx
	pop cx
	pop dx
	ret
popaa endp 






clearreg proc
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	ret
clearreg endp


endline proc
	mov ah,02h
	mov dl,13
	int 21h
	mov dl,10
	int 21h
	ret
endline endp

end main

