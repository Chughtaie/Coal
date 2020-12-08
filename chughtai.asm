

drawm macro a,b,c,d

mov al,a
mov marioc1 , al
mov al,b
mov marioc2 , al
mov al,c
mov marior1 , al
mov al,d
mov marior2, al



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
	;ret
endm



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
oc1 db 22
oc2 db 23
or1 db 4
or2 db 5
marioc1 db 0
marioc2 db 0
marior1 db 0
marior2 db 0



	
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

	
	
;call drawline
	
	;call displayl1
	
	mov ah,1
	int 16h
	
	; jz l1
	mov ah,0
	int 16h
	call move
	.if ah==-1
		jmp exit
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


Move proc
	
	.if ah==04Dh || ah==20h;right,D
	call clearscreen
	call displayl1
	add or1,2
	add or2,2
	;inc marioc1
	;inc marioc2
	;inc marior1
	;inc marior2
	drawm oc1,oc2,or1,or2
	;inc c1
	;inc c2
	
	.elseif ah==4Bh || ah==1Eh	;left,A
	
	
	
	
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
		call displayl1
		add or1,2
		add or2,2	
		drawm oc1,oc2,or1,or2
		dec var
	.if var>0
	jmp jumpp
	.endif
	
call clearscreen
call displayl1
add oc1,8
add oc2,8
;add or1,2
;add or2,2	
drawm oc1,oc2,or1,or2
		
ret 
up endp

displayl1 proc
	;flag
	drawbox 11111111b,0,24,78,78
	drawbox 10101111b,0,3,66,77
 
 
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
mov bx,873      ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
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

