


shoot macro ;a,b,c,d,p

	drawbox 10111101b,sc1,sc2,sr1,sr2	;middle body
	;call delay
endm


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



;	drawbox 01001101b,en1c1,en1c2,en1r1,en1r2
dec en1c1	
sub en1c2,2	
dec en1r1	
inc en1r2
	
;	drawbox 11011101b,en1c1,en1c2,en1r1,en1r2
add en1c1,3
add en1c2,3
sub en1r2,3	
	
	drawbox 11011101b,en1c1,en1c2,en1r1,en1r2	;left leg
add en1r1,1
add en1r2,1	
dec en1c1
dec en1c2
	drawbox 01001101b,en1c1,en1c2,en1r1,en1r2	;left leg
add en1r1,1
add en1r2,1	
	drawbox 01001101b,en1c1,en1c2,en1r1,en1r2	;left leg
add en1r1,1
add en1r2,1	
inc en1c1
inc en1c2	
	
	
	drawbox 11011101b,en1c1,en1c2,en1r1,en1r2	;right leg



endm
;------------------------------------------------------------------------------

drawenemy2 macro a,b
mov al,a
mov bl,b
mov en1r1,al
mov en1r2,bl
mov en1c1,22
mov en1c2,23



;	drawbox 01001101b,en1c1,en1c2,en1r1,en1r2
dec en1c1	
sub en1c2,2	
dec en1r1	
inc en1r2
	
;	drawbox 11011101b,en1c1,en1c2,en1r1,en1r2
add en1c1,3
add en1c2,3
sub en1r2,3	
	
	drawbox 11011101b,en1c1,en1c2,en1r1,en1r2	;left leg
add en1r1,1
add en1r2,1	
dec en1c1
dec en1c2
	drawbox 01001101b,en1c1,en1c2,en1r1,en1r2	;left leg
add en1r1,1
add en1r2,1	
	drawbox 01001101b,en1c1,en1c2,en1r1,en1r2	;left leg
add en1r1,1
add en1r2,1	
inc en1c1
inc en1c2	
	
	
	drawbox 11011101b,en1c1,en1c2,en1r1,en1r2	;right leg

endm




drawbigenemy macro a,b,c,d
mov al,a
mov en1c1 , al
mov al,b
mov en1c2 , al
mov al,c
mov en1r1 , al
mov al,d
mov en1r2, al

;drawbox 01001101b,en1c1,en1c2,en1r1,en1r2
;1,2,65,66
inc en1c2
sub en1r1,2
sub en1r2,2

;1,3,63,64
drawbox 01001101b,en1c1,en1c2,en1r1,en1r2


dec en1c2
sub en1r1,2
sub en1r2,2
;1,2,61,62
drawbox 01001101b,en1c1,en1c2,en1r1,en1r2

ADD en1c2,2
sub en1r1,2
sub en1r2,2

drawbox 01001101b,en1c1,en1c2,en1r1,en1r2

SUB en1c2,2
sub en1r1,2
sub en1r2,2

drawbox 01001101b,en1c1,en1c2,en1r1,en1r2

INC en1c2
sub en1r1,2
sub en1r2,2

drawbox 01001101b,en1c1,en1c2,en1r1,en1r2

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
en1r1 db 0
en1r2 db 0	

er1 db 21
er2 db 22
bol db 1

eer1 db 48
eer2 db 49

en1c1 db ?
en1c2 db ?
counte1 db 0
countee1 db 1
countee2 db 0
counte2 db 0
countb1 db 0
countb2 db 0
	msg db "CONGRATS!!! YOU WON, $"
	msglost db "YOU LOST, $"
	enterr db "ENTER YOUR NAME : $"
	welcome db "WELCOME TO SUPER MARIO$"
	press db "Press any key to contine...$"
	yourscore db "YOUR SCORE: $"
	
handle dw ?	
bc1 db 3
bc2 db 4
br1 db 65	
br2 db 65
sr1 db 0
sr2 db 0
sc1 db 0
sc2 db 0
phew db 8

oc1 db 22
oc2 db 23
or1 db 4
or2 db 5
subb db ?
namee db 30 dup("$")
marioc1 db 0
marioc2 db 0
marior1 db 0
marior2 db 0
score db "SCORE: $"
lvl db 1
lvlstr db " $"
lostlvl db "LEVEL:$"
scr db " $"
zero db " $"
abszero db "0$"

endll db '13$'

Row_poistion db 0     ;SET ROW 
Column_poistion db 0

file db "scores.txt",0
er db "Error!",10,13d,'$'




.code
  
  
 main proc

  mov ax,@data
  mov ds,ax
  call clearscreen

  call input

	
	
  mov ax,0
  mov ax,0
; .while ah!=1
call clearscreen

drawbox 10111101b,25,26,4,8

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
	.elseif or2 >75
	call flagging
		call main2
	.endif
	jmp l1
	
exit:	
LOL:
; .endw	
	;Gotoxy 0,0
	;character

call filing

MOV AH,4CH
INT 21h

main endp

input proc

mov ah,9
mov dx,offset enterr
int 21h




mov ah,3fh
mov dx,offset namee
int 21h


call clearscreen
call draw_border
mov ah,06
mov al,0
;mov cx,0
mov ch,10	;c1
mov cl,00	;r1
mov dh,00	;c1
mov dl,79	;r2

mov bh,10011101b
int 10h
mov ah,02
mov bh,0
mov dh,12
mov dl,30
int 10h
lea dx,namee
mov ah,09
int 21h

mov bh,10011101b
int 10h
mov ah,02
mov bh,0
mov dh,10
mov dl,24
int 10h

lea dx,welcome
mov ah,09
int 21h

mov bh,10011101b
int 10h
mov ah,02
mov bh,0
mov dh,14
mov dl,24
int 10h

lea dx,press
mov ah,09
int 21h


mov dh,12
mov dl,30
int 10h 


mov marioc1 , 12
mov marioc2 , 13
mov marior1 , 12
mov marior2, 13

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
	
	
	

mov en1r1,60
mov en1r2,61
mov en1c1,12
mov en1c2,13


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
	
	drawbox 11011101b,en1c1,en1c2,en1r1,en1r2
	
	
	
	
	

mov ah,1
int 21h







input endp

ret
main2 proc
  mov ax,0
  mov ax,0
  mov lvl,2
; .while ah!=1
call clearscreen

drawbox 10111101b,25,26,4,8

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

		mov ah,0
		int 16h
	
	call move
	.if ah==-1
		jmp exit2	
	.elseif or2 >75
	call flagging
		call main3
	.endif

	jmp l2
	
exit2:	
LOL2:
; .endw	
	;Gotoxy 0,0
	;character

call filing


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

		mov ah,0
		int 16h
		call move
	
		.if ah==-1
			jmp exit3
		.elseif or2 >75
			call wingame
		.endif

	jmp l3
	
exit3:	
LOL3:


MOV AH,4CH
INT 21h
ret




main3 endp


bigenemymov proc

;---------SHOOTING----------------
	dec phew
	.if(phew<=0)
		
		mov al,br1
		mov sr1,al
		sub sr1,8
		;mov al,br2
		mov sr2,al
		sub sr2,8
		mov al,bc1
		mov sc1,al
		mov al,bc2
		mov sc2,al
		
		add sc1,4
		add sc2,4
		
		mov phew,10

	.endif
	.if(phew!=1)
		drawbox 10111101b,sc1,sc2,sr1,sr2
		add sc1,2
		add sc2,2
	.endif
	;drawbigenemy bc1,bc2,br1,br2
	;shoot 	
	
	mov al,oc1
	;sub al,2
	mov ah,oc2
	mov bl,or1
	
	mov bh,or2
	add bh,2
	.if (sc2>=al && sr1>=bl && sr1<=bh) 
		call delay
		;call delay
		call endgame
	.endif
;-----------END SHOOOTING-----------------------


	.if countb1<=35
		
		sub br1,1 
		sub br2,1
		inc countb1
		
		drawbigenemy bc1,bc2,br1,br2		
		
	.elseif  countb2<=35
	
		.if countb2==35
			mov countb1,1
			mov countb2,0
		.endif
		add br1,1
		add br2,1
		inc countb2
		drawbigenemy bc1,bc2,br1,br2		
		
	.endif

ret
bigenemymov endp

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
;--------
 .if countee1<=10			
		
			sub eer1,1
			sub eer2,1
			inc countee1
			
drawenemy2 eer1,eer2		
		
 .elseif  countee2<=10
			.if countee2==10
			mov countee1,1
			mov countee2,0
			.endif
			add eer1,1
			add eer2,1
		inc countee2
		drawenemy2 eer1,eer2		

		
	.endif




ret
enemymov endp


Move proc
	
	.if ah==04Dh || ah==20h;right,D
	
		call rightmov
	
	.elseif ah==4Bh || ah==1Eh	;left,A
	
		call leftmov
	
	.elseif ah==48h || ah==11h	;Up,W	

		call up
	
	.elseif ah==50h || ah==1Fh	;Down,S	
	
	call down
	
	.elseif ah==1
	call clearscreen
	mov ah,-1
	;jmp LOL
	.endif
	
	
	ret
move endp



scoring proc

.if lvl==1 
	.if or1>17 
	mov scr,"1"
	.endif
	.if or1>37 
	mov scr,"2"
	.endif
	.if or1>53 
	mov scr,"3"
	.endif
	.if or1>65 
	mov scr,"4"
	.endif




.elseif lvl==2
	.if or1>17 
	mov scr,"5"
	.endif
	.if or1>37 
	mov scr,"6"
	.endif
	.if or1>53 
	mov scr,"7"
	.endif
	.if or1>65 
	mov scr,"8"
	.endif


.elseif lvl==3
	.if or1>17 
	mov scr,"9"
	.endif
	.if or1>37 
	mov zero,"1"
	mov scr,"0"
	.endif
	.if or1>53 
	mov scr,"1"
	.endif
	.if or1>65 
	mov scr,"2"
	.endif


.endif
ret
scoring endp


showscore proc

call scoring
;mov cx,0
mov ch,0	;c1
mov cl,0	;r1
mov dh,00	;c1
mov dl,9	;r2

mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,02 ;c
mov dl,10 ;
int 10h
lea dx,score
mov ah,09
int 21h

mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,02 ;c
mov dl,16 ;
int 10h
lea dx,zero
mov ah,09
int 21h

mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,02 ;c
mov dl,17 ;
int 10h
lea dx,scr
mov ah,09
int 21h

mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,02 ;c
mov dl,18 ;
int 10h
lea dx,abszero
mov ah,09
int 21h




mov dh,12
mov dl,30
int 10h 



ret
showscore endp


endgame proc
;call clearscreen

call clearscreen
mov ah,06
mov al,0
;mov cx,0
mov ch,0	;c1
mov cl,00	;r1
mov dh,0	;c1
mov dl,79	;r2

mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,10
mov dl,30
int 10h
lea dx,msglost
mov ah,09
int 21h

mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,10
mov dl,40
int 10h
lea dx,namee
mov ah,09
int 21h


.if lvl==2
mov lvlstr,"2"
.endif
.if lvl==3
mov lvlstr,"3"
.endif


mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,12
mov dl,35
int 10h
lea dx,lostlvl
mov ah,09
int 21h




mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,12
mov dl,42
int 10h
lea dx,lvlstr
mov ah,09
int 21h




mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,14
mov dl,30
int 10h
lea dx,yourscore
mov ah,09
int 21h

mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,14
mov dl,43
int 10h
lea dx,zero
mov ah,09
int 21h


mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,14
mov dl,44
int 10h
lea dx,scr
mov ah,09
int 21h


mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,14
mov dl,45
int 10h
lea dx,abszero
mov ah,09
int 21h


mov dh,12
mov dl,30
int 10h 


call filing



mov ah,4ch
int 21h


ret

endgame endp

down proc

call clearscreen
call clearscreen
	.if lvl==1
	call displayl1
	.elseif lvl==2
	call display2
	.elseif lvl==3
	call display3
	.endif



mov al,oc1
mov marioc1 , al
mov al,oc2
mov marioc2 , al
mov al,or1
mov marior1 , al
mov al,or2
mov marior2, al
;22,23,4,5


inc marioc1

	drawbox 10111101b,marioc1,marioc2,marior1,marior2	;middle body
dec marioc1	
dec marioc2	
dec marior1	
inc marior2
	
	drawbox 11111101b,marioc1,marioc2,marior1,marior2;head
add marioc1,2
add marioc2,2
sub marior2,3	
	;25,25,,3
	drawbox 11111101b,marioc1,marioc2,marior1,marior2	;left leg
add marior1,3
add marior2,3	
	;25,25,+3,6
	drawbox 11111101b,marioc1,marioc2,marior1,marior2	;



	
	.if lvl==2 || lvl==3
		call enemymov
	.endif
	.if  lvl==3
		call bigenemymov
	.endif
call collision

call delay
call show
ret
down endp



rightmov proc
.if lvl<4
.if  or1==14 || or1==30 || or1==48 || or1==62 
mov ax,ax
.else

	add or1,2
	add or2,2
	
	call show

.endif
call collision
call detectup
.endif
ret
rightmov endp





leftmov proc
;.if  oc2 > 22 && or1>5 && or1<15 || or1>23 && or1 < 33 || or1>41 && or1<50 || or1> 57 && or1<66 || or1>70
.if lvl<4
.if  (or1==22 || or1==38 || or1==56 || or1==70)
mov ax,ax
.elseif or1>4


	sub or1,2
	sub or2,2
	
	call show
	
.endif
call detectup
call collision
.endif
ret
leftmov endp



up proc
.if lvl<4
	;call clearscreen
	;call displayl1
.if oc1!=22
	ret
.endif
mov cx,2

mov oc1,14
mov oc2,15

.if or1<20
add oc1,1
add oc2,1
.elseif or1<55&&or1>35
add oc1,1
add oc2,1
.elseif or1>55
add oc1,6
add oc2,6
.endif


call show
mov var,1

	jumpp:
	
		;call delay
		
		add or1,2
		add or2,2	
		call show
		
		call delay
		dec var

	.if var>0
		jmp jumpp
	.endif
	
	
call detectup

call show
.endif	
ret 
up endp

;====================================================================================
detectup proc

.if (or1 > 14 && or1 <= 20) || (or1 > 30 && or1<=38) || (or1 > 48 && or1<=54) || (or1 > 62 && or1<=68)
	ret
.else

mov oc1,22
mov oc2,23
call show

.endif

eeend:

ret
detectup endp


Show proc

	call clearscreen
	.if lvl==1
	call displayl1
	.elseif lvl==2
	call display2
	.elseif lvl==3
	call display3
	.endif

	drawm  oc1,oc2,or1,or2
	
	.if lvl==2 || lvl==3
		call enemymov
	.endif
	.if  lvl==3
		call bigenemymov
	.endif
		call showscore

	ret

SHOW endp


collision proc

.if lvl==2 || lvl==3
	mov bl,er1
mov al,er2
 mov cl,eer1
 mov dl,eer2

	.if (bl == or1 || al==or1 || cl == or1 || dl==or1) &&  oc1>=21
		call endgame
	
	.endif
	sub bl,1
	sub al,1
	sub cl,1
	sub dl,1
	.if (bl == or1 || al==or1 || cl == or1 || dl==or1) &&  oc1>=21
		call endgame
	
	.endif
	add bl,2
	add al,2
	add cl,2
	add dl,2
	.if (bl == or1 || al==or1 || cl == or1 || dl==or1) &&  oc1>=21
	
		call endgame
	
	.endif
	add bl,1
	add al,1
	add cl,1
	add dl,1
	.if (bl == or1 || al==or1 || cl == or1 || dl==or1) &&  oc1>=21
		call endgame
	
	.endif
	sub bl,4
	sub al,4
	sub cl,4
	sub dl,4
	.if (bl == or1  || al==or1 || cl == or1 || dl==or1) &&  oc1>=21
		call endgame
	.endif
.endif

ret
collision endp

wingame proc
mov lvl,4

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
mov dl,27
int 10h
lea dx,msg
mov ah,09
int 21h


mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,12
mov dl,27
add dl,lengthof msg



int 10h
lea dx,namee
mov ah,09
int 21h


mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,14
mov dl,30
int 10h
lea dx,yourscore
mov ah,09
int 21h

mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,14
mov dl,43
int 10h
lea dx,zero
mov ah,09
int 21h


mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,14
mov dl,44
int 10h
lea dx,scr
mov ah,09
int 21h


mov bh,10001101b
int 10h
mov ah,02
mov bh,0
mov dh,14
mov dl,45
int 10h
lea dx,abszero
mov ah,09
int 21h



mov dh,12
mov dl,30
int 10h 

call filing


ret


wingame endp



flagging proc
mov bol,0

.if lvl==1
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2
drawbox 10101111b,5,8,66,77
call delay2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2
drawbox 10101111b,8,11,66,77
call delay2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2
drawbox 10101111b,11,14,66,77
call delay2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2

drawbox 10101111b,14,17,66,77
call delay2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2
drawbox 10101111b,17,21,66,77
call delay2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2
drawbox 10101111b,21,24,66,77
.endif


.if lvl==2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2
	drawbox 01011111b,2,5,66,77
call delay2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2
	drawbox 01011111b,5,8,66,77
call delay2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2
	drawbox 01011111b,8,11,66,77
call delay2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2

	drawbox 01011111b,11,14,66,77
call delay2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2
	drawbox 01011111b,14,17,66,77
call delay2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2
	drawbox 01011111b,17,21,66,77
	call delay2
call clearscreen
call displayl1
drawm oc1,oc2,or1,or2
	drawbox 01011111b,21,24,66,77
.endif



mov bol,1
ret
flagging endp



displayl1 proc

	;flag
	
	
	
	drawbox 11111111b,2,24,78,78
.if bol==1
	drawbox 10101111b,2,5,66,77
 .endif
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
	.if bol==1
	drawbox 01011111b,2,5,66,77
 .endif
 
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
	drawbox 11101111b,19,24,18,19
	drawbox 10101111b,18,19,17,20

	drawbox 11101111b,18,24,35,36
	drawbox 10101111b,17,18,34,37



	drawbox 11101111b,19,24,52,53
	drawbox 10101111b,18,19,51,54


	drawbox 10101111b,23,24,65,67
	ret

display3 endp


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
mov bx,800      ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
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
mov bx,100      ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
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
draw_border proc


	;-------left side----------


	mov Row_poistion, 9
	mov Column_poistion,20
		mov count,0



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
	mov Column_poistion, 49

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

	mov Row_poistion, 9		;row on dosbox
	mov Column_poistion, 22		;column on dosbox
	
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
	
		cmp	count,25
		jbe top

	;-------bottom side----------

	mov Row_poistion, 11
	mov Column_poistion, 22

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
		
		cmp	count,25
		jbe bottom

	;--------------------------------------

ret
draw_border endp


filing proc

mov si,0
.while si<=29
.if namee[si]=='$'|| namee[si]==10d || namee[si]==13d
mov namee[si],' '
.endif
inc si
.endw

mov ah,abszero[0]
mov namee[27],ah
mov ah,scr[0]
mov namee[26],ah
mov ah,zero[0]
mov namee[25],ah
mov ah,13d
mov namee[28],ah


mov ah,3dh	;opens
mov dx,offset file
mov al,2
int 21h

mov handle,ax
jc eror

mov bx,handle
mov cx,0
mov dx,0
mov ah,42h ; Move file pointer
mov al,02h ; End of File
int 21h

mov ah,40h	;appending
mov bx,handle
mov cx,lengthof namee
lea dx,namee
int 21h

jc eror


mov bx,handle
mov ah,3eh
int 21h


jmp endd
eror:
mov ah,9h
mov dx,offset er
int 21h

endd:






ret
filing endp



endline proc
	mov ah,02h
	mov dl,13
	int 21h
	mov dl,10
	int 21h
	ret
endline endp

end main
;The end 
