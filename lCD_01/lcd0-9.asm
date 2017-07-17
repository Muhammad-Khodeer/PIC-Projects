
_main:

;lcd0-9.c,45 :: 		void main()
;lcd0-9.c,49 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;lcd0-9.c,50 :: 		while(1)
L_main0:
;lcd0-9.c,52 :: 		for (i=0; i<=9; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       _i+0, 0
	SUBLW      9
L__main7:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;lcd0-9.c,55 :: 		IntToStr(i, txt);
	MOVF       _i+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _i+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;lcd0-9.c,56 :: 		res = Ltrim(txt);
	MOVLW      _txt+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _res+0
;lcd0-9.c,57 :: 		Lcd_Out(1, 1, res);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd0-9.c,59 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;lcd0-9.c,52 :: 		for (i=0; i<=9; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;lcd0-9.c,60 :: 		}
	GOTO       L_main2
L_main3:
;lcd0-9.c,61 :: 		}
	GOTO       L_main0
;lcd0-9.c,62 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
