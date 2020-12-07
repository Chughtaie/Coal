
;lesgo
;Lets Rocksssgg
;are you ready?
;is it working?
;coal
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


drawbox macro color,c1,c2,r1,r2
	mov ah,6	
	mov al,0	
	mov bh,color
 
	mov ch,c1	;col ch-dh	;ch aur dh ke coordinates column ko reperent karte
	mov dh,c2
	mov cl,r1	;row cl-dl	;cl aur dl ke coordinates row ko reperent karte
	mov dl,r2

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
marioc1 db 21
marioc2 db 23
marior1 db 4
marior2 db 5




	
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
call drawmario 
l1:
	
	
;call drawline
	
	call displayl1
	mov ah,1
	int 16h
	
	; jz l1
	mov ah,0
	int 16h
	.if ah==04Dh
	
	;inc marioc1
	;inc marioc2
	;inc marior1
	;inc marior2
	call drawmario 

	
	.elseif ah==1
	jmp exit
.endif
	call clearscreen
call drawmario 
	jmp l1
exit:	
; .endw	
	;Gotoxy 0,0
	;character



MOV AH,4CH
INT 21h

main endp

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

