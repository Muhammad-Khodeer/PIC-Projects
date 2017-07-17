
_main:

;MyProject.c,36 :: 		void main()
;MyProject.c,38 :: 		ioConfi();
	CALL       _ioConfi+0
;MyProject.c,39 :: 		initialValues();
	CALL       _initialValues+0
;MyProject.c,40 :: 		while(1)
L_main0:
;MyProject.c,42 :: 		checkButton();
	CALL       _checkButton+0
;MyProject.c,44 :: 		}
	GOTO       L_main0
;MyProject.c,46 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_initialValues:

;MyProject.c,48 :: 		void initialValues(void)
;MyProject.c,50 :: 		offLed1(void) ;
	CALL       _offLed1+0
;MyProject.c,51 :: 		offLed2(void) ;
	CALL       _offLed2+0
;MyProject.c,52 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_ioConfi:

;MyProject.c,54 :: 		void ioConfi(void)
;MyProject.c,57 :: 		but2_dir = in;
	BSF        TRISB+0, 6
;MyProject.c,59 :: 		led1_dir = out;
	BCF        TRISB+0, 0
;MyProject.c,61 :: 		}
L_end_ioConfi:
	RETURN
; end of _ioConfi

_offLed1:

;MyProject.c,63 :: 		void offLed1(void)
;MyProject.c,65 :: 		led1 = off;
	BCF        PORTB+0, 0
;MyProject.c,66 :: 		}
L_end_offLed1:
	RETURN
; end of _offLed1

_onLed1:

;MyProject.c,68 :: 		void onLed1(void)
;MyProject.c,70 :: 		led1 = on;
	BSF        PORTB+0, 0
;MyProject.c,71 :: 		}
L_end_onLed1:
	RETURN
; end of _onLed1

_offLed2:

;MyProject.c,72 :: 		void offLed2(void)
;MyProject.c,75 :: 		}
L_end_offLed2:
	RETURN
; end of _offLed2

_onLed2:

;MyProject.c,77 :: 		void onLed2(void)
;MyProject.c,80 :: 		}
L_end_onLed2:
	RETURN
; end of _onLed2

_checkButton:

;MyProject.c,82 :: 		void checkButton(void)
;MyProject.c,84 :: 		if (but2 == pushed && n==0)
	BTFSS      PORTB+0, 6
	GOTO       L_checkButton4
	MOVF       _n+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_checkButton4
L__checkButton14:
;MyProject.c,86 :: 		n++;
	INCF       _n+0, 1
;MyProject.c,87 :: 		offLed2() ;
	CALL       _offLed2+0
;MyProject.c,88 :: 		onLed1() ;
	CALL       _onLed1+0
;MyProject.c,89 :: 		while (but2 == pushed) ;
L_checkButton5:
	BTFSS      PORTB+0, 6
	GOTO       L_checkButton6
	GOTO       L_checkButton5
L_checkButton6:
;MyProject.c,90 :: 		}
	GOTO       L_checkButton7
L_checkButton4:
;MyProject.c,91 :: 		else if(but2 == pushed && n==1)
	BTFSS      PORTB+0, 6
	GOTO       L_checkButton10
	MOVF       _n+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_checkButton10
L__checkButton13:
;MyProject.c,93 :: 		n--;
	DECF       _n+0, 1
;MyProject.c,94 :: 		offLed1() ;
	CALL       _offLed1+0
;MyProject.c,95 :: 		onLed2() ;
	CALL       _onLed2+0
;MyProject.c,96 :: 		while (but2 == pushed) ;
L_checkButton11:
	BTFSS      PORTB+0, 6
	GOTO       L_checkButton12
	GOTO       L_checkButton11
L_checkButton12:
;MyProject.c,97 :: 		}
L_checkButton10:
L_checkButton7:
;MyProject.c,98 :: 		}
L_end_checkButton:
	RETURN
; end of _checkButton
