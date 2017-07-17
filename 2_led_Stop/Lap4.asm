
_main:

;Lap4.c,36 :: 		void main()
;Lap4.c,38 :: 		ioConfi();
	CALL       _ioConfi+0
;Lap4.c,39 :: 		initialValues();
	CALL       _initialValues+0
;Lap4.c,40 :: 		while(1)
L_main0:
;Lap4.c,42 :: 		checkButton();
	CALL       _checkButton+0
;Lap4.c,43 :: 		stopButton();
	CALL       _stopButton+0
;Lap4.c,44 :: 		}
	GOTO       L_main0
;Lap4.c,46 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_initialValues:

;Lap4.c,48 :: 		void initialValues(void)
;Lap4.c,50 :: 		offLed1(void) ;
	CALL       _offLed1+0
;Lap4.c,51 :: 		offLed2(void) ;
	CALL       _offLed2+0
;Lap4.c,52 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_ioConfi:

;Lap4.c,54 :: 		void ioConfi(void)
;Lap4.c,56 :: 		but1_dir = in;
	BSF        TRISB+0, 7
;Lap4.c,57 :: 		but2_dir = in;
	BSF        TRISB+0, 6
;Lap4.c,58 :: 		but3_dir = in;
	BSF        TRISB+0, 5
;Lap4.c,59 :: 		led1_dir = out;
	BCF        TRISB+0, 0
;Lap4.c,60 :: 		led2_dir = out;
	BCF        TRISB+0, 1
;Lap4.c,61 :: 		}
L_end_ioConfi:
	RETURN
; end of _ioConfi

_offLed1:

;Lap4.c,63 :: 		void offLed1(void)
;Lap4.c,65 :: 		led1 = off;
	BCF        PORTB+0, 0
;Lap4.c,66 :: 		}
L_end_offLed1:
	RETURN
; end of _offLed1

_onLed1:

;Lap4.c,68 :: 		void onLed1(void)
;Lap4.c,70 :: 		led1 = on;
	BSF        PORTB+0, 0
;Lap4.c,71 :: 		}
L_end_onLed1:
	RETURN
; end of _onLed1

_offLed2:

;Lap4.c,72 :: 		void offLed2(void)
;Lap4.c,74 :: 		led2 = off;
	BCF        PORTB+0, 1
;Lap4.c,75 :: 		}
L_end_offLed2:
	RETURN
; end of _offLed2

_onLed2:

;Lap4.c,77 :: 		void onLed2(void)
;Lap4.c,79 :: 		led2 = on;
	BSF        PORTB+0, 1
;Lap4.c,80 :: 		}
L_end_onLed2:
	RETURN
; end of _onLed2

_checkButton:

;Lap4.c,82 :: 		void checkButton(void)
;Lap4.c,84 :: 		if (but1 == pushed )//&& n==0)
	BTFSS      PORTB+0, 7
	GOTO       L_checkButton2
;Lap4.c,87 :: 		offLed2() ;
	CALL       _offLed2+0
;Lap4.c,88 :: 		onLed1() ;
	CALL       _onLed1+0
;Lap4.c,89 :: 		while (but1 == pushed) ;
L_checkButton3:
	BTFSS      PORTB+0, 7
	GOTO       L_checkButton4
	GOTO       L_checkButton3
L_checkButton4:
;Lap4.c,90 :: 		}
	GOTO       L_checkButton5
L_checkButton2:
;Lap4.c,91 :: 		else if(but2 == pushed )//&& n==1)
	BTFSS      PORTB+0, 6
	GOTO       L_checkButton6
;Lap4.c,94 :: 		offLed1() ;
	CALL       _offLed1+0
;Lap4.c,95 :: 		onLed2() ;
	CALL       _onLed2+0
;Lap4.c,96 :: 		while (but2 == pushed) ;
L_checkButton7:
	BTFSS      PORTB+0, 6
	GOTO       L_checkButton8
	GOTO       L_checkButton7
L_checkButton8:
;Lap4.c,97 :: 		}
L_checkButton6:
L_checkButton5:
;Lap4.c,98 :: 		}
L_end_checkButton:
	RETURN
; end of _checkButton

_stopButton:

;Lap4.c,100 :: 		void stopButton(void)
;Lap4.c,102 :: 		if (but3 ==pushed)
	BTFSS      PORTB+0, 5
	GOTO       L_stopButton9
;Lap4.c,104 :: 		offLed1();
	CALL       _offLed1+0
;Lap4.c,105 :: 		offLed2();
	CALL       _offLed2+0
;Lap4.c,106 :: 		while (but3 == pushed) ;
L_stopButton10:
	BTFSS      PORTB+0, 5
	GOTO       L_stopButton11
	GOTO       L_stopButton10
L_stopButton11:
;Lap4.c,107 :: 		}
L_stopButton9:
;Lap4.c,108 :: 		}
L_end_stopButton:
	RETURN
; end of _stopButton
