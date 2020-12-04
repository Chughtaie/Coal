
.model small 


.stack

.data


.code

	mov ax,0
	mov ah,01h
	int 21h

	mov bl,al
	sub bl,48
	
	mov al,0
	mov ah,01h
	int 21h

	sub al,48
	mul bl


	add ax,48
	mov dx,ax
	mov ah,02h
	int 21h




mov ah,4ch
int 21h
end