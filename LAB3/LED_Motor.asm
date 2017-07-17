
_main:

;LED_Motor.c,26 :: 		void main()
;LED_Motor.c,28 :: 		ioConfi();
	CALL       _ioConfi+0
;LED_Motor.c,29 :: 		initialValues();
	CALL       _initialValues+0
;LED_Motor.c,30 :: 		while(1)
L_main0:
;LED_Motor.c,32 :: 		checkButton();
	CALL       _checkButton+0
;LED_Motor.c,33 :: 		}
	GOTO       L_main0
;LED_Motor.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_initialValues:

;LED_Motor.c,37 :: 		void initialValues(void)
;LED_Motor.c,39 :: 		offLed1(void) ;
	CALL       _offLed1+0
;LED_Motor.c,40 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_ioConfi:

;LED_Motor.c,42 :: 		void ioConfi(void)
;LED_Motor.c,44 :: 		but1_dir = in;
	BSF        TRISB+0, 7
;LED_Motor.c,45 :: 		led1_dir = out;
	BCF        TRISB+0, 0
;LED_Motor.c,46 :: 		}
L_end_ioConfi:
	RETURN
; end of _ioConfi

_offLed1:

;LED_Motor.c,48 :: 		void offLed1(void)
;LED_Motor.c,50 :: 		led1 = off;
	BCF        PORTB+0, 0
;LED_Motor.c,51 :: 		}
L_end_offLed1:
	RETURN
; end of _offLed1

_onLed1:

;LED_Motor.c,53 :: 		void onLed1(void)
;LED_Motor.c,55 :: 		led1 = on;
	BSF        PORTB+0, 0
;LED_Motor.c,56 :: 		}
L_end_onLed1:
	RETURN
; end of _onLed1

_checkButton:

;LED_Motor.c,58 :: 		void checkButton(void)
;LED_Motor.c,60 :: 		while(1)
L_checkButton2:
;LED_Motor.c,62 :: 		if (but1 == pushed && n==0)
	BTFSS      PORTB+0, 7
	GOTO       L_checkButton6
	MOVF       _n+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_checkButton6
L__checkButton12:
;LED_Motor.c,64 :: 		n++;
	INCF       _n+0, 1
;LED_Motor.c,65 :: 		onLed1() ;
	CALL       _onLed1+0
;LED_Motor.c,67 :: 		}
	GOTO       L_checkButton7
L_checkButton6:
;LED_Motor.c,68 :: 		else if(but1 == pushed && n==1)
	BTFSS      PORTB+0, 7
	GOTO       L_checkButton10
	MOVF       _n+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_checkButton10
L__checkButton11:
;LED_Motor.c,70 :: 		n--;
	DECF       _n+0, 1
;LED_Motor.c,71 :: 		offLed1() ;
	CALL       _offLed1+0
;LED_Motor.c,72 :: 		}
L_checkButton10:
L_checkButton7:
;LED_Motor.c,73 :: 		}
	GOTO       L_checkButton2
;LED_Motor.c,74 :: 		}
L_end_checkButton:
	RETURN
; end of _checkButton
