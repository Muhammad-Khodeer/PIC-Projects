
_main:

;Lap5_8led.c,14 :: 		void main()
;Lap5_8led.c,16 :: 		int i =0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
;Lap5_8led.c,19 :: 		ioConfi(void) ;
	CALL       _ioConfi+0
;Lap5_8led.c,20 :: 		initialValues(void);
	CALL       _initialValues+0
;Lap5_8led.c,22 :: 		while (1)
L_main0:
;Lap5_8led.c,24 :: 		for (i=0; i<2 ; i++)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      2
	SUBWF      main_i_L0+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;Lap5_8led.c,28 :: 		}
	GOTO       L_main2
L_main3:
;Lap5_8led.c,29 :: 		leds = 0 ;
	CLRF       PORTB+0
;Lap5_8led.c,31 :: 		for (j=0; j<2 ; j++)
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
L_main5:
	MOVLW      128
	XORWF      main_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      2
	SUBWF      main_j_L0+0, 0
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Lap5_8led.c,33 :: 		stepB();
	CALL       _stepB+0
;Lap5_8led.c,34 :: 		stepC();
	CALL       _stepC+0
;Lap5_8led.c,35 :: 		x = 0 ;
	CLRF       _x+0
	CLRF       _x+1
;Lap5_8led.c,31 :: 		for (j=0; j<2 ; j++)
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;Lap5_8led.c,36 :: 		}
	GOTO       L_main5
L_main6:
;Lap5_8led.c,37 :: 		}
	GOTO       L_main0
;Lap5_8led.c,38 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ioConfi:

;Lap5_8led.c,40 :: 		void ioConfi(void)
;Lap5_8led.c,42 :: 		leds_dir = out ;
	CLRF       TRISB+0
;Lap5_8led.c,43 :: 		}
L_end_ioConfi:
	RETURN
; end of _ioConfi

_initialValues:

;Lap5_8led.c,45 :: 		void initialValues(void)
;Lap5_8led.c,47 :: 		leds =0 ;
	CLRF       PORTB+0
;Lap5_8led.c,48 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_stepA:

;Lap5_8led.c,50 :: 		void stepA(void)
;Lap5_8led.c,52 :: 		leds = 0b00001111 ;
	MOVLW      15
	MOVWF      PORTB+0
;Lap5_8led.c,53 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_stepA8:
	DECFSZ     R13+0, 1
	GOTO       L_stepA8
	DECFSZ     R12+0, 1
	GOTO       L_stepA8
	DECFSZ     R11+0, 1
	GOTO       L_stepA8
	NOP
;Lap5_8led.c,54 :: 		leds = 0b11110000 ;
	MOVLW      240
	MOVWF      PORTB+0
;Lap5_8led.c,55 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_stepA9:
	DECFSZ     R13+0, 1
	GOTO       L_stepA9
	DECFSZ     R12+0, 1
	GOTO       L_stepA9
	DECFSZ     R11+0, 1
	GOTO       L_stepA9
	NOP
;Lap5_8led.c,56 :: 		}
L_end_stepA:
	RETURN
; end of _stepA

_stepB:

;Lap5_8led.c,58 :: 		void stepB (void)
;Lap5_8led.c,60 :: 		int i =0;
	CLRF       stepB_i_L0+0
	CLRF       stepB_i_L0+1
;Lap5_8led.c,61 :: 		for (i=0 ; i<8 ; i++)
	CLRF       stepB_i_L0+0
	CLRF       stepB_i_L0+1
L_stepB10:
	MOVLW      128
	XORWF      stepB_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__stepB25
	MOVLW      8
	SUBWF      stepB_i_L0+0, 0
L__stepB25:
	BTFSC      STATUS+0, 0
	GOTO       L_stepB11
;Lap5_8led.c,63 :: 		x = (x)+ (2^i);
	MOVLW      2
	XORWF      stepB_i_L0+0, 0
	MOVWF      R0+0
	MOVF       stepB_i_L0+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 1
	MOVF       _x+0, 0
	ADDWF      R0+0, 1
	MOVF       _x+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVF       R0+1, 0
	MOVWF      _x+1
;Lap5_8led.c,64 :: 		leds = x ;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Lap5_8led.c,65 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_stepB13:
	DECFSZ     R13+0, 1
	GOTO       L_stepB13
	DECFSZ     R12+0, 1
	GOTO       L_stepB13
	DECFSZ     R11+0, 1
	GOTO       L_stepB13
	NOP
;Lap5_8led.c,61 :: 		for (i=0 ; i<8 ; i++)
	INCF       stepB_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       stepB_i_L0+1, 1
;Lap5_8led.c,66 :: 		}
	GOTO       L_stepB10
L_stepB11:
;Lap5_8led.c,67 :: 		}
L_end_stepB:
	RETURN
; end of _stepB

_stepC:

;Lap5_8led.c,69 :: 		void stepC (void)
;Lap5_8led.c,71 :: 		int i =0;
	CLRF       stepC_i_L0+0
	CLRF       stepC_i_L0+1
;Lap5_8led.c,72 :: 		for (i=0; i<8 ;i++)
	CLRF       stepC_i_L0+0
	CLRF       stepC_i_L0+1
L_stepC14:
	MOVLW      128
	XORWF      stepC_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__stepC27
	MOVLW      8
	SUBWF      stepC_i_L0+0, 0
L__stepC27:
	BTFSC      STATUS+0, 0
	GOTO       L_stepC15
;Lap5_8led.c,74 :: 		x = (x)-(2^i);
	MOVLW      2
	XORWF      stepC_i_L0+0, 0
	MOVWF      R0+0
	MOVF       stepC_i_L0+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 1
	MOVF       R0+0, 0
	SUBWF      _x+0, 0
	MOVWF      R0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _x+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVF       R0+1, 0
	MOVWF      _x+1
;Lap5_8led.c,75 :: 		leds = x;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Lap5_8led.c,76 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_stepC17:
	DECFSZ     R13+0, 1
	GOTO       L_stepC17
	DECFSZ     R12+0, 1
	GOTO       L_stepC17
	DECFSZ     R11+0, 1
	GOTO       L_stepC17
	NOP
;Lap5_8led.c,72 :: 		for (i=0; i<8 ;i++)
	INCF       stepC_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       stepC_i_L0+1, 1
;Lap5_8led.c,77 :: 		}
	GOTO       L_stepC14
L_stepC15:
;Lap5_8led.c,78 :: 		}
L_end_stepC:
	RETURN
; end of _stepC
