
_main:

;LAP2.c,31 :: 		void main()
;LAP2.c,33 :: 		ioConfi();
	CALL       _ioConfi+0
;LAP2.c,34 :: 		initialValues();
	CALL       _initialValues+0
;LAP2.c,35 :: 		while(1)
L_main0:
;LAP2.c,37 :: 		checkButton();
	CALL       _checkButton+0
;LAP2.c,38 :: 		}
	GOTO       L_main0
;LAP2.c,39 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_initialValues:

;LAP2.c,41 :: 		void initialValues(void)
;LAP2.c,43 :: 		offLed1(void) ;
	CALL       _offLed1+0
;LAP2.c,44 :: 		offLed2(void) ;
	CALL       _offLed2+0
;LAP2.c,45 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_ioConfi:

;LAP2.c,48 :: 		void ioConfi(void)
;LAP2.c,50 :: 		but1_dir = in;
	BSF        TRISB+0, 7
;LAP2.c,51 :: 		but2_dir = in;
	BSF        TRISB+0, 6
;LAP2.c,52 :: 		led1_dir = out;
	BCF        TRISB+0, 0
;LAP2.c,53 :: 		led2_dir = out;
	BCF        TRISB+0, 1
;LAP2.c,54 :: 		}
L_end_ioConfi:
	RETURN
; end of _ioConfi

_offLed1:

;LAP2.c,55 :: 		void offLed1(void)
;LAP2.c,57 :: 		led1 = off;
	BCF        PORTB+0, 0
;LAP2.c,58 :: 		}
L_end_offLed1:
	RETURN
; end of _offLed1

_offLed2:

;LAP2.c,59 :: 		void offLed2(void)
;LAP2.c,61 :: 		led2 = off;
	BCF        PORTB+0, 1
;LAP2.c,62 :: 		}
L_end_offLed2:
	RETURN
; end of _offLed2

_onLed1:

;LAP2.c,63 :: 		void onLed1(void)
;LAP2.c,65 :: 		led1 = on;
	BSF        PORTB+0, 0
;LAP2.c,66 :: 		}
L_end_onLed1:
	RETURN
; end of _onLed1

_onLed2:

;LAP2.c,67 :: 		void onLed2(void)
;LAP2.c,69 :: 		led2 = on;
	BSF        PORTB+0, 1
;LAP2.c,70 :: 		}
L_end_onLed2:
	RETURN
; end of _onLed2

_checkButton:

;LAP2.c,72 :: 		void checkButton(void)
;LAP2.c,74 :: 		while(1)
L_checkButton2:
;LAP2.c,76 :: 		if(but1 = pushed)
	BSF        PORTB+0, 7
	BTFSS      PORTB+0, 7
	GOTO       L_checkButton4
;LAP2.c,78 :: 		onLed1();
	CALL       _onLed1+0
;LAP2.c,79 :: 		offLed2();
	CALL       _offLed2+0
;LAP2.c,80 :: 		}
	GOTO       L_checkButton5
L_checkButton4:
;LAP2.c,81 :: 		else if (but2 = pushed)
	BSF        PORTB+0, 6
	BTFSS      PORTB+0, 6
	GOTO       L_checkButton6
;LAP2.c,83 :: 		onLed2();
	CALL       _onLed2+0
;LAP2.c,84 :: 		offLed1();
	CALL       _offLed1+0
;LAP2.c,85 :: 		}
L_checkButton6:
L_checkButton5:
;LAP2.c,86 :: 		}
	GOTO       L_checkButton2
;LAP2.c,87 :: 		}
L_end_checkButton:
	RETURN
; end of _checkButton
