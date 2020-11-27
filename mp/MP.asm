;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			include<p18f4550.inc>

loop_cnt1 set 0x00
loop_cnt2 set 0x01

			org 0x00
			goto start
			org 0x08
			retfie
			org 0x18
			retfie

;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; Delay Function (10ms)

dup_nop			macro yy
				variable i
i = 0 		
				while i < yy
				nop
i += 1
				endw
				endm

Delay			movlw	D'20'
				movwf	loop_cnt2, A
Again			movlw	D'250'
				movwf	loop_cnt1, A
Again1			dup_nop D'17'
				Decfsz	loop_cnt1, F, A
				Bra		Again1
				Decfsz 	loop_cnt2, F, A
				Bra 	Again

				nop
				return

;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;Configuration of Command & Data


ConfiCom		bcf 	PORTC,4,A 		;RS = 0
				bcf		PORTC,5,A 		;RW = 0
				bsf 	PORTC,6,A 		;EN = 1
				call	Delay 			;DELAY for 10ms
				bcf		PORTC,6,A 		;EN = 0
				return

SendData		bsf		PORTC,4,A		;RS = 1
				bcf		PORTC,5,A		;RW = 0
				bsf		PORTC,6,A		;EN = 1
				call	Delay			;DELAY for 10ms
				bcf		PORTC,6,A		;EN = 0
				return

;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;Subroutine to display my name

YWY				movlw	 D'89'			;Y
				movwf	PORTD, A
				call	SendData
				
				movlw	 D'69'			;E
				movwf	PORTD, A
				call	SendData

				movlw	 D'69'			;E
				movwf	PORTD, A
				call	SendData

				movlw	 D'08'			;Space
				movwf	PORTD, A
				call	SendData
				
				movlw	 D'87'			;W
				movwf	PORTD, A
				call	SendData

				movlw	 D'69'			;E
				movwf	PORTD, A
				call	SendData
				
				movlw	 D'73'			;I
				movwf	PORTD, A
				call	SendData

				movlw	 D'08'			;Space
				movwf	PORTD, A
				call	SendData

				movlw	 D'89'			;Y
				movwf	PORTD, A
				call	SendData
				
				movlw	 D'73'			;I
				movwf	PORTD, A
				call	SendData
				
				movlw	 D'78'			;N
				movwf	PORTD, A
				call	SendData
				
				movlw	 D'71'			;G
				movwf	PORTD, A
				call	SendData
				
				Bra		Check1

;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;Subroutine to display my student id

YWYSI			movlw	 D'68'			;D
				movwf	PORTD, A
				call	SendData
				
				movlw	 D'69'			;E
				movwf	PORTD, A
				call	SendData
				
				movlw	 D'57'			;9
				movwf	PORTD, A
				call	SendData
				
				movlw	 D'55'			;7
				movwf	PORTD, A
				call	SendData
				
				movlw	 D'50'			;2
				movwf	PORTD, A
				call	SendData

				movlw	 D'57'			;9
				movwf	PORTD, A
				call	SendData

				movlw	 D'52'			;4
				movwf	PORTD, A
				call	SendData
				
				Bra 	Check2

;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;Subroutines for Keypad Buttons

Number1			movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'49'			;Display 1
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return
			

Number2			movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'50'			;Display 2
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return
				
	
Number3			movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'51'			;Display 3
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return				

Number4			movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'52'			;Display 4
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return

Number5			movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'53'			;Display 5
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return

Number6			movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'54'			;Display 6
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return

Number7			movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'55'			;Display 7
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return

Number8			movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'56'			;Display 8
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return

Number9			movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'57'			;Display 9
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return

Number0			movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'48'			;Display 0
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return
	
Asterisk		movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'42'			;Display *
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return

Hashtag			movlw	0xC0			;Force to display on 2nd row					
				movwf	PORTD, A
				call	ConfiCom
				movlw	D'35'			;Display #
				movwf	PORTD, A
				call	SendData
				Bra		Check1
				return

;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;Main Program

start			clrf	TRISC, A
				clrf	TRISD, A
				setf	TRISB, A
				bcf		TRISB, 0, A
				bcf		TRISB, 1, A
				bcf		TRISB, 2, A
				bcf		TRISB, 3, A
				bcf		TRISB, 4, A
				bcf		TRISB, 5, A
				bcf		TRISB, 6, A
				bcf		TRISB, 7, A
	
							
				movlw	0x38			;Configure 2 lines and 5x7 matrix
				movwf	PORTD, A
				call 	ConfiCom

				movlw	0x0F			;Display on, cursor blinks
				movwf	PORTD, A
				call	ConfiCom
				
				movlw	0x01			;Clear Screen
				movwf	PORTD, A
				call 	ConfiCom

				movlw	0x80			;Force to begin on 1st line
				movwf	PORTD, A
				call	ConfiCom


Check1			btfsc	PORTA, 0, A
				Bra		YWY
				call	Check1
Check2			btfsc	PORTA, 1, A
				Bra		YWYSI
				call	Check2

Keypad1			clrf	PORTB, A
				bsf		PORTB, 0, A
				btfsc	PORTB, 4, A
				Bra		Number1
				clrf	PORTD, A

Keypad2			clrf	PORTB, A
				bsf		PORTB, 0, A
				btfsc	PORTB, 5, A
				Bra		Number2
				clrf	PORTD, A

Keypad3			clrf	PORTB, A
				bsf		PORTB, 0, A
				btfsc	PORTB, 6, A
				Bra		Number3
				clrf	PORTD, A

Keypad4			clrf	PORTB, A
				bsf		PORTB, 1, A
				btfsc	PORTB, 4, A
				Bra		Number4
				clrf	PORTD, A

Keypad5			clrf	PORTB, A
				bsf		PORTB, 1, A
				btfsc	PORTB, 5, A
				Bra		Number5
				clrf	PORTD, A

Keypad6			clrf	PORTB, A
				bsf		PORTB, 1, A
				btfsc	PORTB, 6, A
				Bra		Number6
				clrf	PORTD, A

Keypad7			clrf	PORTB, A
				bsf		PORTB, 2, A
				btfsc	PORTB, 4, A
				Bra		Number7
				clrf	PORTD, A

Keypad8			clrf	PORTB, A
				bsf		PORTB, 2, A
				btfsc	PORTB, 5, A
				Bra		Number8
				clrf	PORTD, A

Keypad9			clrf	PORTB, A
				bsf		PORTB, 2, A
				btfsc	PORTB, 6, A
				Bra		Number9
				clrf	PORTD, A

Keypad0			clrf	PORTB, A
				bsf		PORTB, 3, A
				btfsc	PORTB, 4, A
				Bra		Number0
				clrf	PORTD, A

KeypadA			clrf	PORTB, A
				bsf		PORTB, 3, A
				btfsc	PORTB, 5, A
				Bra		Asterisk
				clrf	PORTD, A

KeypadH			clrf	PORTB, A
				bsf		PORTB, 3, A
				btfsc	PORTB, 6, A
				Bra		Hashtag
				clrf	PORTD, A

				nop 
				end