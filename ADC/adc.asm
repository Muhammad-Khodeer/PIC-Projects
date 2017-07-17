
_main:

;adc.c,31 :: 		void main()
;adc.c,33 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;adc.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;adc.c,35 :: 		ADC_Init();
	CALL       _ADC_Init+0
;adc.c,36 :: 		ioconfigeration();
	CALL       _ioconfigeration+0
;adc.c,38 :: 		while(1)
L_main0:
;adc.c,40 :: 		calculatvolt();
	CALL       _calculatvolt+0
;adc.c,41 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;adc.c,42 :: 		}
	GOTO       L_main0
;adc.c,43 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ioconfigeration:

;adc.c,44 :: 		void ioconfigeration(void)
;adc.c,46 :: 		ad = 0xff;
	MOVLW      255
	MOVWF      TRISA+0
;adc.c,47 :: 		}
L_end_ioconfigeration:
	RETURN
; end of _ioconfigeration

_calculatvolt:

;adc.c,48 :: 		void calculatvolt(void)
;adc.c,50 :: 		level = ADC_Get_Sample(0);
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _level+0
	MOVF       R0+1, 0
	MOVWF      _level+1
;adc.c,51 :: 		volte = (level * 4.88)/10;
	CALL       _Word2Double+0
	MOVLW      246
	MOVWF      R4+0
	MOVLW      40
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
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
	MOVWF      _volte+0
	MOVF       R0+1, 0
	MOVWF      _volte+1
	MOVF       R0+2, 0
	MOVWF      _volte+2
	MOVF       R0+3, 0
	MOVWF      _volte+3
;adc.c,52 :: 		X = Ltrim(res);
	MOVLW      _res+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _x+0
;adc.c,53 :: 		y = volte;
	MOVF       _volte+0, 0
	MOVWF      R0+0
	MOVF       _volte+1, 0
	MOVWF      R0+1
	MOVF       _volte+2, 0
	MOVWF      R0+2
	MOVF       _volte+3, 0
	MOVWF      R0+3
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _y+0
	MOVF       R0+1, 0
	MOVWF      _y+1
;adc.c,54 :: 		X1 = Ltrim(y);
	MOVF       R0+0, 0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _x1+0
;adc.c,55 :: 		m = ((volte - y )*10);
	MOVF       _y+0, 0
	MOVWF      R0+0
	MOVF       _y+1, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       _volte+0, 0
	MOVWF      R0+0
	MOVF       _volte+1, 0
	MOVWF      R0+1
	MOVF       _volte+2, 0
	MOVWF      R0+2
	MOVF       _volte+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _m+0
	MOVF       R0+1, 0
	MOVWF      _m+1
;adc.c,56 :: 		X2 = Ltrim(m);
	MOVF       R0+0, 0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _x2+0
;adc.c,57 :: 		IntToStr(y, res);
	MOVF       _y+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _y+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _res+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;adc.c,58 :: 		X1 = Ltrim(res);
	MOVLW      _res+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _x1+0
;adc.c,59 :: 		IntToStr(m, X1);
	MOVF       _m+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _m+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;adc.c,60 :: 		Lcd_Out(1, 1, "T=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_adc+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;adc.c,61 :: 		Lcd_Out_CP( X1);
	MOVF       _x1+0, 0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;adc.c,62 :: 		Lcd_Out_CP( ".");
	MOVLW      ?lstr2_adc+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;adc.c,63 :: 		Lcd_Out_CP( re);
	MOVLW      _re+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;adc.c,64 :: 		Lcd_Out_CP( "c");
	MOVLW      ?lstr3_adc+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;adc.c,65 :: 		}
L_end_calculatvolt:
	RETURN
; end of _calculatvolt

_ADconfigeration:

;adc.c,66 :: 		void ADconfigeration(void)
;adc.c,68 :: 		ADCON0 = 0X10000001;
	MOVLW      1
	MOVWF      ADCON0+0
;adc.c,69 :: 		ADCON1 = 0X11000000;
	MOVLW      0
	MOVWF      ADCON1+0
;adc.c,70 :: 		}
L_end_ADconfigeration:
	RETURN
; end of _ADconfigeration
