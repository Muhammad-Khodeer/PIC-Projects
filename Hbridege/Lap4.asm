
_main:

;Lap4.c,36 :: 		void main()
;Lap4.c,38 :: 		ioConfiguration();
	CALL       _ioConfiguration+0
;Lap4.c,39 :: 		initialValues();
	CALL       _initialValues+0
;Lap4.c,40 :: 		while(1)
L_main0:
;Lap4.c,42 :: 		checkButtons();
	CALL       _checkButtons+0
;Lap4.c,43 :: 		stopButton();
	CALL       _stopButton+0
;Lap4.c,44 :: 		}
	GOTO       L_main0
;Lap4.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_initialValues:

;Lap4.c,47 :: 		void initialValues(void)
;Lap4.c,49 :: 		offMoveL(void) ;
	CALL       _offMoveL+0
;Lap4.c,50 :: 		offMoveR(void) ;
	CALL       _offMoveR+0
;Lap4.c,51 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_ioConfiguration:

;Lap4.c,52 :: 		void ioConfiguration(void)
;Lap4.c,54 :: 		ButtonL_dir = in;
	BSF        TRISB+0, 7
;Lap4.c,55 :: 		ButtonR_dir = in;
	BSF        TRISB+0, 6
;Lap4.c,56 :: 		ButtonS_dir = in;
	BSF        TRISB+0, 5
;Lap4.c,57 :: 		MoveL_dir = out;
	BCF        TRISB+0, 0
;Lap4.c,58 :: 		MoveR_dir = out;
	BCF        TRISB+0, 1
;Lap4.c,59 :: 		}
L_end_ioConfiguration:
	RETURN
; end of _ioConfiguration

_offMoveL:

;Lap4.c,60 :: 		void offMoveL(void)
;Lap4.c,62 :: 		MoveL = off;
	BCF        PORTB+0, 0
;Lap4.c,63 :: 		}
L_end_offMoveL:
	RETURN
; end of _offMoveL

_onMoveL:

;Lap4.c,65 :: 		void onMoveL(void)
;Lap4.c,67 :: 		MoveL = on;
	BSF        PORTB+0, 0
;Lap4.c,68 :: 		}
L_end_onMoveL:
	RETURN
; end of _onMoveL

_offMoveR:

;Lap4.c,69 :: 		void offMoveR(void)
;Lap4.c,71 :: 		MoveR = off;
	BCF        PORTB+0, 1
;Lap4.c,72 :: 		}
L_end_offMoveR:
	RETURN
; end of _offMoveR

_onMoveR:

;Lap4.c,73 :: 		void onMoveR(void)
;Lap4.c,75 :: 		MoveR = on;
	BSF        PORTB+0, 1
;Lap4.c,76 :: 		}
L_end_onMoveR:
	RETURN
; end of _onMoveR

_checkButtons:

;Lap4.c,77 :: 		void checkButtons(void)
;Lap4.c,79 :: 		if (ButtonL == pushed )//&& n==0)
	BTFSS      PORTB+0, 7
	GOTO       L_checkButtons2
;Lap4.c,82 :: 		offMoveR() ;
	CALL       _offMoveR+0
;Lap4.c,83 :: 		onMoveL() ;
	CALL       _onMoveL+0
;Lap4.c,84 :: 		while (ButtonL == pushed) ;
L_checkButtons3:
	BTFSS      PORTB+0, 7
	GOTO       L_checkButtons4
	GOTO       L_checkButtons3
L_checkButtons4:
;Lap4.c,85 :: 		}
	GOTO       L_checkButtons5
L_checkButtons2:
;Lap4.c,86 :: 		else if(ButtonR == pushed )//&& n==1)
	BTFSS      PORTB+0, 6
	GOTO       L_checkButtons6
;Lap4.c,89 :: 		offMoveL() ;
	CALL       _offMoveL+0
;Lap4.c,90 :: 		onMoveR() ;
	CALL       _onMoveR+0
;Lap4.c,91 :: 		while (ButtonR == pushed) ;
L_checkButtons7:
	BTFSS      PORTB+0, 6
	GOTO       L_checkButtons8
	GOTO       L_checkButtons7
L_checkButtons8:
;Lap4.c,92 :: 		}
L_checkButtons6:
L_checkButtons5:
;Lap4.c,93 :: 		}
L_end_checkButtons:
	RETURN
; end of _checkButtons

_stopButton:

;Lap4.c,94 :: 		void stopButton(void)
;Lap4.c,96 :: 		if (ButtonS ==pushed)
	BTFSS      PORTB+0, 5
	GOTO       L_stopButton9
;Lap4.c,98 :: 		offMoveL();
	CALL       _offMoveL+0
;Lap4.c,99 :: 		offMoveR();
	CALL       _offMoveR+0
;Lap4.c,100 :: 		while (ButtonS == pushed) ;
L_stopButton10:
	BTFSS      PORTB+0, 5
	GOTO       L_stopButton11
	GOTO       L_stopButton10
L_stopButton11:
;Lap4.c,101 :: 		}
L_stopButton9:
;Lap4.c,102 :: 		}
L_end_stopButton:
	RETURN
; end of _stopButton
