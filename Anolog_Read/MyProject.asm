
_main:

;MyProject.c,28 :: 		void main()
;MyProject.c,30 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,31 :: 		ADC_Init();
	CALL       _ADC_Init+0
;MyProject.c,32 :: 		mainCode();
	CALL       _mainCode+0
;MyProject.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_mainCode:

;MyProject.c,35 :: 		void mainCode()
;MyProject.c,37 :: 		adconf();
	CALL       _adconf+0
;MyProject.c,38 :: 		while(1)
L_mainCode0:
;MyProject.c,40 :: 		level = ADC_Get_Sample(0);
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _level+0
	MOVF       R0+1, 0
	MOVWF      _level+1
;MyProject.c,41 :: 		volt = level * level_volt ;
	CALL       _Word2Double+0
	MOVF       _level_volt+0, 0
	MOVWF      R4+0
	MOVF       _level_volt+1, 0
	MOVWF      R4+1
	MOVF       _level_volt+2, 0
	MOVWF      R4+2
	MOVF       _level_volt+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _volt+0
	MOVF       R0+1, 0
	MOVWF      _volt+1
	MOVF       R0+2, 0
	MOVWF      _volt+2
	MOVF       R0+3, 0
	MOVWF      _volt+3
;MyProject.c,42 :: 		volt = volt /10 ;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _volt+0
	MOVF       R0+1, 0
	MOVWF      _volt+1
	MOVF       R0+2, 0
	MOVWF      _volt+2
	MOVF       R0+3, 0
	MOVWF      _volt+3
;MyProject.c,43 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,44 :: 		lcdd_ou ();
	CALL       _lcdd_ou+0
;MyProject.c,45 :: 		}
	GOTO       L_mainCode0
;MyProject.c,47 :: 		}
L_end_mainCode:
	RETURN
; end of _mainCode

_adconf:

;MyProject.c,48 :: 		void adconf()
;MyProject.c,50 :: 		adc_in = 0xff ;
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,51 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,52 :: 		}
L_end_adconf:
	RETURN
; end of _adconf

_lcdd_ou:

;MyProject.c,53 :: 		void lcdd_ou ()
;MyProject.c,55 :: 		FloatToStr(volt, txt);
	MOVF       _volt+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       _volt+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       _volt+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       _volt+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _txt+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;MyProject.c,56 :: 		res = Ltrim(txt);
	MOVLW      _txt+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _res+0
;MyProject.c,57 :: 		Lcd_Out(1, 1 , res );
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,58 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_lcdd_ou2:
	DECFSZ     R13+0, 1
	GOTO       L_lcdd_ou2
	DECFSZ     R12+0, 1
	GOTO       L_lcdd_ou2
	DECFSZ     R11+0, 1
	GOTO       L_lcdd_ou2
;MyProject.c,59 :: 		}
L_end_lcdd_ou:
	RETURN
; end of _lcdd_ou
