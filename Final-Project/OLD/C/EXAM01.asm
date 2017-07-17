
_main:

;EXAM01.c,84 :: 		void main()
;EXAM01.c,86 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;EXAM01.c,87 :: 		ADC_Init();
	CALL       _ADC_Init+0
;EXAM01.c,88 :: 		ioConfiguration();
	CALL       _ioConfiguration+0
;EXAM01.c,89 :: 		initialValues();
	CALL       _initialValues+0
;EXAM01.c,90 :: 		mainCode();
	CALL       _mainCode+0
;EXAM01.c,91 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ioConfiguration:

;EXAM01.c,95 :: 		void ioConfiguration(void)
;EXAM01.c,97 :: 		B_up_dir = in;
	BSF        TRISB+0, 7
;EXAM01.c,98 :: 		B_DOWN_dir = in;
	BSF        TRISB+0, 6
;EXAM01.c,99 :: 		B_OK1_dir = in;
	BSF        TRISB+0, 5
;EXAM01.c,100 :: 		B_OK2_dir = in;
	BSF        TRISB+0, 4
;EXAM01.c,101 :: 		B_BACK_dir = in;
	BSF        TRISB+0, 3
;EXAM01.c,102 :: 		MoveL_dir = out ;
	BCF        TRISB+0, 0
;EXAM01.c,103 :: 		MoveR_dir = out ;
	BCF        TRISB+0, 1
;EXAM01.c,104 :: 		adc_in = 0xff ;
	MOVLW      255
	MOVWF      TRISA+0
;EXAM01.c,105 :: 		}
L_end_ioConfiguration:
	RETURN
; end of _ioConfiguration

_initialValues:

;EXAM01.c,107 :: 		void initialValues(void)
;EXAM01.c,109 :: 		stopMotor (void) ;
	CALL       _stopMotor+0
;EXAM01.c,110 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXAM01.c,111 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXAM01.c,112 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;EXAM01.c,113 :: 		displayLCD_12 (void);
	CALL       _displayLCD_12+0
;EXAM01.c,114 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_goBack:

;EXAM01.c,116 :: 		void goBack (void)
;EXAM01.c,118 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXAM01.c,119 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;EXAM01.c,120 :: 		displayLCD_12 (void);
	CALL       _displayLCD_12+0
;EXAM01.c,121 :: 		}
L_end_goBack:
	RETURN
; end of _goBack

_mainCode:

;EXAM01.c,125 :: 		void mainCode (void)
;EXAM01.c,127 :: 		while (1)
L_mainCode0:
;EXAM01.c,129 :: 		if (B_up == pushed && (i != 0))
	BTFSS      PORTB+0, 7
	GOTO       L_mainCode4
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode45
	MOVLW      0
	XORWF      _i+0, 0
L__mainCode45:
	BTFSC      STATUS+0, 2
	GOTO       L_mainCode4
L__mainCode39:
;EXAM01.c,131 :: 		i-- ;
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;EXAM01.c,132 :: 		check_OK_Buttons(void);
	CALL       _check_OK_Buttons+0
;EXAM01.c,133 :: 		while (B_up == pushed) ;
L_mainCode5:
	BTFSS      PORTB+0, 7
	GOTO       L_mainCode6
	GOTO       L_mainCode5
L_mainCode6:
;EXAM01.c,134 :: 		}
	GOTO       L_mainCode7
L_mainCode4:
;EXAM01.c,135 :: 		else if(B_down == pushed && (i != 2) )
	BTFSS      PORTB+0, 6
	GOTO       L_mainCode10
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode46
	MOVLW      2
	XORWF      _i+0, 0
L__mainCode46:
	BTFSC      STATUS+0, 2
	GOTO       L_mainCode10
L__mainCode38:
;EXAM01.c,137 :: 		i++ ;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;EXAM01.c,138 :: 		check_OK_Buttons(void);
	CALL       _check_OK_Buttons+0
;EXAM01.c,139 :: 		while (B_down == pushed) ;
L_mainCode11:
	BTFSS      PORTB+0, 6
	GOTO       L_mainCode12
	GOTO       L_mainCode11
L_mainCode12:
;EXAM01.c,140 :: 		}
L_mainCode10:
L_mainCode7:
;EXAM01.c,141 :: 		}
	GOTO       L_mainCode0
;EXAM01.c,143 :: 		}
L_end_mainCode:
	RETURN
; end of _mainCode

_check_OK_Buttons:

;EXAM01.c,151 :: 		void check_OK_Buttons(void)
;EXAM01.c,153 :: 		if (i == 0)
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_OK_Buttons48
	MOVLW      0
	XORWF      _i+0, 0
L__check_OK_Buttons48:
	BTFSS      STATUS+0, 2
	GOTO       L_check_OK_Buttons13
;EXAM01.c,155 :: 		displayLCD_12 (void);    // Â‘ŸÂ— ‘«‘… ﬂ–«
	CALL       _displayLCD_12+0
;EXAM01.c,156 :: 		caseiZero (void);       // ok1 or ok2 2ÂŒ »— «·
	CALL       _caseiZero+0
;EXAM01.c,157 :: 		}
L_check_OK_Buttons13:
;EXAM01.c,158 :: 		if (i == 1)
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_OK_Buttons49
	MOVLW      1
	XORWF      _i+0, 0
L__check_OK_Buttons49:
	BTFSS      STATUS+0, 2
	GOTO       L_check_OK_Buttons14
;EXAM01.c,160 :: 		displayLCD_23 (void);    // Â‘ŸÂ— ‘«‘… ﬂ–«
	CALL       _displayLCD_23+0
;EXAM01.c,161 :: 		caseiOne (void);          // ok1 or ok2 2ÂŒ »— «·
	CALL       _caseiOne+0
;EXAM01.c,162 :: 		}
L_check_OK_Buttons14:
;EXAM01.c,163 :: 		if (i == 2)
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_OK_Buttons50
	MOVLW      2
	XORWF      _i+0, 0
L__check_OK_Buttons50:
	BTFSS      STATUS+0, 2
	GOTO       L_check_OK_Buttons15
;EXAM01.c,165 :: 		displayLCD_34 (void); // Â‘ŸÂ— ‘«‘… ﬂ–«
	CALL       _displayLCD_34+0
;EXAM01.c,166 :: 		caseiTwo (void);       // ok1 or ok2 2ÂŒ »— «·
	CALL       _caseiTwo+0
;EXAM01.c,167 :: 		}
L_check_OK_Buttons15:
;EXAM01.c,168 :: 		}
L_end_check_OK_Buttons:
	RETURN
; end of _check_OK_Buttons

_caseiZero:

;EXAM01.c,170 :: 		void caseiZero (void)
;EXAM01.c,172 :: 		if(B_ok1 == pushed )
	BTFSS      PORTB+0, 5
	GOTO       L_caseiZero16
;EXAM01.c,174 :: 		moveMotorL (void); //«·„« Ê— Ì·› ‘„«·
	CALL       _moveMotorL+0
;EXAM01.c,175 :: 		displayLCD_ML(void) ;  // Ì⁄—÷ «·‘«‘Â
	CALL       _displayLCD_ML+0
;EXAM01.c,176 :: 		while (B_ok1 == pushed) ;
L_caseiZero17:
	BTFSS      PORTB+0, 5
	GOTO       L_caseiZero18
	GOTO       L_caseiZero17
L_caseiZero18:
;EXAM01.c,177 :: 		}
	GOTO       L_caseiZero19
L_caseiZero16:
;EXAM01.c,178 :: 		else if(B_ok2 == pushed )
	BTFSS      PORTB+0, 4
	GOTO       L_caseiZero20
;EXAM01.c,180 :: 		moveMotorR (void);  // «·„« Ê— Ì·› Ì„Ì‰
	CALL       _moveMotorR+0
;EXAM01.c,181 :: 		displayLCD_MR(void); // Ì⁄—÷ «·‘«‘Â
	CALL       _displayLCD_MR+0
;EXAM01.c,182 :: 		while (B_ok2 == pushed) ;
L_caseiZero21:
	BTFSS      PORTB+0, 4
	GOTO       L_caseiZero22
	GOTO       L_caseiZero21
L_caseiZero22:
;EXAM01.c,183 :: 		}
L_caseiZero20:
L_caseiZero19:
;EXAM01.c,184 :: 		}
L_end_caseiZero:
	RETURN
; end of _caseiZero

_caseiOne:

;EXAM01.c,186 :: 		void caseiOne (void)
;EXAM01.c,188 :: 		if(B_ok1 == pushed )
	BTFSS      PORTB+0, 5
	GOTO       L_caseiOne23
;EXAM01.c,190 :: 		moveMotorR (void);       // «·„« Ê— Ì·› Ì„Ì‰
	CALL       _moveMotorR+0
;EXAM01.c,191 :: 		displayLCD_MR(void);      // Ì⁄—÷ «·‘«‘Â
	CALL       _displayLCD_MR+0
;EXAM01.c,192 :: 		while (B_ok1 == pushed) ;
L_caseiOne24:
	BTFSS      PORTB+0, 5
	GOTO       L_caseiOne25
	GOTO       L_caseiOne24
L_caseiOne25:
;EXAM01.c,193 :: 		}
	GOTO       L_caseiOne26
L_caseiOne23:
;EXAM01.c,194 :: 		else if(B_ok2 == pushed )
	BTFSS      PORTB+0, 4
	GOTO       L_caseiOne27
;EXAM01.c,196 :: 		stopMotor (void);   // «·„« Ê— Ìﬁ›
	CALL       _stopMotor+0
;EXAM01.c,197 :: 		displayLCD_MS(void) ; //Ì⁄—÷ «·‘«‘Â
	CALL       _displayLCD_MS+0
;EXAM01.c,198 :: 		while (B_ok2 == pushed) ;
L_caseiOne28:
	BTFSS      PORTB+0, 4
	GOTO       L_caseiOne29
	GOTO       L_caseiOne28
L_caseiOne29:
;EXAM01.c,199 :: 		}
L_caseiOne27:
L_caseiOne26:
;EXAM01.c,200 :: 		}
L_end_caseiOne:
	RETURN
; end of _caseiOne

_caseiTwo:

;EXAM01.c,202 :: 		void caseiTwo (void)
;EXAM01.c,204 :: 		if(B_ok1 == pushed )
	BTFSS      PORTB+0, 5
	GOTO       L_caseiTwo30
;EXAM01.c,206 :: 		stopMotor (void);  // «·„« Ê— Ìﬁ›
	CALL       _stopMotor+0
;EXAM01.c,207 :: 		displayLCD_MS(void) ;    //Ì⁄—÷ «·‘«‘Â
	CALL       _displayLCD_MS+0
;EXAM01.c,208 :: 		while (B_ok1 == pushed) ;
L_caseiTwo31:
	BTFSS      PORTB+0, 5
	GOTO       L_caseiTwo32
	GOTO       L_caseiTwo31
L_caseiTwo32:
;EXAM01.c,209 :: 		}
	GOTO       L_caseiTwo33
L_caseiTwo30:
;EXAM01.c,210 :: 		else if(B_ok2 == pushed )
	BTFSS      PORTB+0, 4
	GOTO       L_caseiTwo34
;EXAM01.c,212 :: 		displayLCD_MT(void);
	CALL       _displayLCD_MT+0
;EXAM01.c,213 :: 		readTemperature (void) ; //Ì⁄—÷ œ—Ã… «·Õ—«—…
	CALL       _readTemperature+0
;EXAM01.c,214 :: 		displayTemperature (void) ;
	CALL       _displayTemperature+0
;EXAM01.c,215 :: 		while (B_ok2 == pushed) ;
L_caseiTwo35:
	BTFSS      PORTB+0, 4
	GOTO       L_caseiTwo36
	GOTO       L_caseiTwo35
L_caseiTwo36:
;EXAM01.c,216 :: 		}
L_caseiTwo34:
L_caseiTwo33:
;EXAM01.c,217 :: 		}
L_end_caseiTwo:
	RETURN
; end of _caseiTwo

_moveMotorL:

;EXAM01.c,223 :: 		void moveMotorL (void)
;EXAM01.c,225 :: 		MoveR = off ;
	BCF        PORTB+0, 1
;EXAM01.c,226 :: 		MoveL = on ;
	BSF        PORTB+0, 0
;EXAM01.c,227 :: 		}
L_end_moveMotorL:
	RETURN
; end of _moveMotorL

_moveMotorR:

;EXAM01.c,229 :: 		void moveMotorR (void)
;EXAM01.c,231 :: 		MoveL = off ;
	BCF        PORTB+0, 0
;EXAM01.c,232 :: 		MoveR = on ;
	BSF        PORTB+0, 1
;EXAM01.c,233 :: 		}
L_end_moveMotorR:
	RETURN
; end of _moveMotorR

_stopMotor:

;EXAM01.c,235 :: 		void stopMotor (void)
;EXAM01.c,237 :: 		MoveL = off ;
	BCF        PORTB+0, 0
;EXAM01.c,238 :: 		MoveR = off ;
	BCF        PORTB+0, 1
;EXAM01.c,239 :: 		}
L_end_stopMotor:
	RETURN
; end of _stopMotor

_readTemperature:

;EXAM01.c,242 :: 		void readTemperature (void)
;EXAM01.c,244 :: 		level = ADC_Get_Sample(0);
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _level+0
	MOVF       R0+1, 0
	MOVWF      _level+1
;EXAM01.c,245 :: 		volt = level * level_volt ;
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
;EXAM01.c,246 :: 		volt = volt /1000 ;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      136
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
;EXAM01.c,247 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXAM01.c,248 :: 		}
L_end_readTemperature:
	RETURN
; end of _readTemperature

_displayTemperature:

;EXAM01.c,249 :: 		void displayTemperature (void)
;EXAM01.c,251 :: 		FloatToStr(volt, txt);
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
;EXAM01.c,252 :: 		res = Ltrim(txt);
	MOVLW      _txt+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _res+0
;EXAM01.c,253 :: 		Lcd_Out(2, 1 , res );
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXAM01.c,254 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_displayTemperature37:
	DECFSZ     R13+0, 1
	GOTO       L_displayTemperature37
	DECFSZ     R12+0, 1
	GOTO       L_displayTemperature37
	DECFSZ     R11+0, 1
	GOTO       L_displayTemperature37
;EXAM01.c,255 :: 		}
L_end_displayTemperature:
	RETURN
; end of _displayTemperature

_displayLCD_12:

;EXAM01.c,259 :: 		void displayLCD_12 (void)
;EXAM01.c,261 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXAM01.c,262 :: 		Lcd_Out(1, 1, "1- Motor left.");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_EXAM01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXAM01.c,263 :: 		Lcd_Out(2, 1, "2- Motor right.");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_EXAM01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXAM01.c,264 :: 		}
L_end_displayLCD_12:
	RETURN
; end of _displayLCD_12

_displayLCD_23:

;EXAM01.c,266 :: 		void displayLCD_23(void)
;EXAM01.c,268 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXAM01.c,269 :: 		Lcd_Out(1, 1, "2- Motor right.");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_EXAM01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXAM01.c,270 :: 		Lcd_Out(2, 1, "3- Motor stop.");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_EXAM01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXAM01.c,271 :: 		}
L_end_displayLCD_23:
	RETURN
; end of _displayLCD_23

_displayLCD_34:

;EXAM01.c,273 :: 		void displayLCD_34(void)
;EXAM01.c,275 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXAM01.c,276 :: 		Lcd_Out(1, 1, "3- Motor stop.");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_EXAM01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXAM01.c,277 :: 		Lcd_Out(2, 1, "4- Temperature");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_EXAM01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXAM01.c,278 :: 		}
L_end_displayLCD_34:
	RETURN
; end of _displayLCD_34

_displayLCD_ML:

;EXAM01.c,280 :: 		void displayLCD_ML(void)
;EXAM01.c,282 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXAM01.c,283 :: 		Lcd_Out(1, 1, "Motor rotates Left");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_EXAM01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXAM01.c,284 :: 		}
L_end_displayLCD_ML:
	RETURN
; end of _displayLCD_ML

_displayLCD_MR:

;EXAM01.c,286 :: 		void displayLCD_MR(void)
;EXAM01.c,288 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXAM01.c,289 :: 		Lcd_Out(1, 1, "Motor rotates Right");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_EXAM01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXAM01.c,290 :: 		}
L_end_displayLCD_MR:
	RETURN
; end of _displayLCD_MR

_displayLCD_MS:

;EXAM01.c,292 :: 		void displayLCD_MS(void)
;EXAM01.c,294 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXAM01.c,295 :: 		Lcd_Out(1, 1, "Motor Stop");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_EXAM01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXAM01.c,296 :: 		}
L_end_displayLCD_MS:
	RETURN
; end of _displayLCD_MS

_displayLCD_MT:

;EXAM01.c,298 :: 		void displayLCD_MT(void)
;EXAM01.c,300 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXAM01.c,301 :: 		Lcd_Out(1, 1, "Motor Temperature");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_EXAM01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXAM01.c,303 :: 		}
L_end_displayLCD_MT:
	RETURN
; end of _displayLCD_MT
