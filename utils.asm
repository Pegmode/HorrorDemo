;MemCopyLong
;==========================================================
;Input requirements: hl = Source Address, bc = destination, de = data length
MemCopyLong:
	ld a,[hl+]
	ld [bc],a
	inc bc
	dec de
	xor a
	or e
	jp nz,MemCopyLong
	or d
	jp nz,MemCopyLong
	ret

;MemCopy
;==========================================================
;Input requirements: hl = Source Address, bc = destination, d = data length
MemCopy:
	ld a,[hl+]
	ld [bc],a
	inc bc
	dec d
	jp nz,MemCopy
	ret

;Input requirements: hl = destination, bc = legnth
clearMem:
	xor a
.clearLoop
	ld [hl+], a
	dec bc
	cp c
	jr nz,.clearLoop
	cp b
	jr nz,.clearLoop
	ret

;MemSet
;==========================================================
;Input requirements: a = data, hl = destination, d = data length
MemSet:
	ld [hl+], a
	dec d
	jr nz, MemSet
	ret

	

	
  
;Load Standard DMG pallet
;============================================================
LoadNormalPallet:
	ld a,$E4
	ld [$FF47],a
	ret

;Wait for V/HBlank
;==========================================================
;Total time: 52 cycles
;stat %xxxxxx0x
WaitBlank:
	ld a,[rSTAT]    ;16C
	and 2						;8C
	jr	nz,WaitBlank;12 ~ 8C
	ret							;16C

;Wait for VBlank
;==========================================================
;wait for Beginning of vBlank
;holds for a long time
;stat %xxxxxx01
WaitVBlank:
	ld a,[rSTAT]
	bit 0,a
	jr nz,WaitVBlank;wait for non vBlankState
.waitforVBlank;
	ld a,[rSTAT]
	bit 0,a
	jr z,.waitforVBlank
	bit 1,a
	jr nz,.waitforVBlank
	ret


	;Read Joypad input (from GB cpu man)
;==========================================================
;[OldJoyData] return values:
;$8= start , $80=DOWN
;$4= select,$40=Up
;$2=b , $20=left
;$1=A, $10= right
ReadJoy:
	ld a,%00100000
	ld [rP1],a;Select P14
	ld a,[rP1]
	ld a,[rP1];wait
	cpl ;inv
	and %00001111;get only first 4 bits
	swap a;swap it
	ld b,a; store a in b
	ld a,%00010000
	ld [rP1],a;Select P15
	ld a,[rP1]
	ld a,[rP1]
	ld a,[rP1]
	ld a,[rP1]
	ld a,[rP1]
	ld a,[rP1];wait
	cpl ;inv
	and %00001111;get first 4 bits
	or b;put a and b together
	ld b,a;store a in d
	ld a,[OldJoyData];read old joy data from RAM
	xor b; toggle w/current button bit backup
	and b; get current button bit backup
	ld [NewJoyData],a;save in new NewJoyData storage
	ld a,b;put original value in a
	ld [OldJoyData],a;store it as old jow Data
	ld a,$30;deslect p14 and P15
	ld [rP1],A;Reset Joypad
	ret

	;Random Number Generator	(credit Jeff Frohwein)
;==========================================================
; (Allocate 3 bytes of ram labeled 'Seed')
; Exit: A = 0-255, random number

RandomNumber:
	push hl
			ld      hl,Seed
			ld      a,[hl+]
			sra     a
			sra     a
			sra     a
			xor     [hl]
			inc     hl
			rra
			rl      [hl]
			dec     hl
			rl      [hl]
			dec     hl
			rl      [hl]
			ld      a,[$fff4]          ; get divider register to increase
.randomness
			add     [hl]
			pop hl
			ret

			

;vcrTextWriteAll
;==========================================================
;Input requirements: b = x coord, c = y coord , hl = text ptr
;de = offsetcounter (normally $FE00)
;writes entire string to screen, REQUIRES 8x16 mode, translation table must be ALIGN [8, 0]
;CLEAN THIS UP
;NO NEWLINES
vcrTextWriteAll:
	;ld de, $FE00;offset counter
.l1
	push de
	ld a, [hl+]
	cp 0
	jr z, .exit
	cp " "
	jr z, .space
	sub $20;move to offset base
	ld de, vhsTranslationTable
	add a, e
	ld e, a
	ld a, [de];a = tile
	ldh [$FF80], a;store tile for later
	pop de
	;load y coord
	ld a, c
	ld [de], a
	inc de
	;load x coord
	ld a, b
	ld [de], a
	inc de
	add a, 10;x spacing
	ld b, a
	;load tile
	ldh a, [$FF80]
	ld [de], a
	inc de
	inc de
	jr .l1

.space;save sprites
	ld a, 8
	add a, b
	ld b, a
	pop de
	jr .l1

.exit
	pop de
	ret

;test function
;d = flag
setAllObjFlag:
	ld e, 40
	ld hl, $FE00+3
	ld bc, 4
.l1
	xor a
	cp e
	jr z, .exit
	ld [hl], d
	add hl, bc
	dec e
	jr .l1
.exit
	ret