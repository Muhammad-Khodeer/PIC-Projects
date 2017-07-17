
_main:

;exam03.c,85 :: 		void main()
;exam03.c,87 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;exam03.c,88 :: 		ADC_Init();
	CALL       _ADC_Init+0
;exam03.c,89 :: 		ioConfiguration();
	CALL       _ioConfiguration+0
;exam03.c,90 :: 		initialValues();
	CALL       _initialValues+0
;exam03.c,91 :: 		mainCode();
	CALL       _mainCode+0
;exam03.c,92 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ioConfiguration:

;exam03.c,95 :: 		void ioConfiguration(void)
;exam03.c,97 :: 		B_up_dir = in ;
	BSF        TRISB+0, 7
;exam03.c,98 :: 		B_down_dir = in ;
	BSF        TRISB+0, 6
;exam03.c,99 :: 		B_ok1_dir = in ;
	BSF        TRISB+0, 5
;exam03.c,100 :: 		B_ok2_dir = in ;
	BSF        TRISB+0, 4
;exam03.c,101 :: 		B_back_dir = in ;
	BSF        TRISB+0, 3
;exam03.c,103 :: 		MoveL_dir = out;
	BCF        TRISB+0, 0
;exam03.c,104 :: 		MoveR_dir = out;
	BCF        TRISB+0, 1
;exam03.c,106 :: 		ad = 0xff;
	MOVLW      255
	MOVWF      TRISA+0
;exam03.c,107 :: 		}
L_end_ioConfiguration:
	RETURN
; end of _ioConfiguration

_initialValues:

;exam03.c,109 :: 		void initialValues(void)
;exam03.c,111 :: 		stopMotor (void) ;
	CALL       _stopMotor+0
;exam03.c,112 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,113 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,114 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;exam03.c,115 :: 		displayLCD_12 (void);
	CALL       _displayLCD_12+0
;exam03.c,116 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_mainCode:

;exam03.c,118 :: 		void mainCode (void)                // ÇáßæÏ ÇáÑÆíÓí
;exam03.c,120 :: 		while (1)
L_mainCode0:
;exam03.c,122 :: 		getUpdown(void);
	CALL       _getUpdown+0
;exam03.c,123 :: 		checkOk_buttons (void);
	CALL       _checkOk_buttons+0
;exam03.c,124 :: 		goBack (void);
	CALL       _goBack+0
;exam03.c,125 :: 		closeError (void);
	CALL       _closeError+0
;exam03.c,126 :: 		}
	GOTO       L_mainCode0
;exam03.c,127 :: 		}
L_end_mainCode:
	RETURN
; end of _mainCode

_getUpdown:

;exam03.c,129 :: 		void getUpdown(void)                  //  up down ÏÇáå ÊÊÛíÑ ÞíãÉ   ÊÊÛíÑ ÞíãÉ ÇáãÊÛíÑ ÈÇáÖÛØ Úáì
;exam03.c,131 :: 		if (B_up == pushed && (i != 0))
	BTFSS      PORTB+0, 7
	GOTO       L_getUpdown4
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getUpdown63
	MOVLW      0
	XORWF      _i+0, 0
L__getUpdown63:
	BTFSC      STATUS+0, 2
	GOTO       L_getUpdown4
L__getUpdown51:
;exam03.c,133 :: 		i-- ;
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;exam03.c,134 :: 		changeMenu(void);
	CALL       _changeMenu+0
;exam03.c,135 :: 		while (B_up == pushed) ;
L_getUpdown5:
	BTFSS      PORTB+0, 7
	GOTO       L_getUpdown6
	GOTO       L_getUpdown5
L_getUpdown6:
;exam03.c,136 :: 		}
	GOTO       L_getUpdown7
L_getUpdown4:
;exam03.c,137 :: 		else if(B_down == pushed && (i != 2) )
	BTFSS      PORTB+0, 6
	GOTO       L_getUpdown10
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getUpdown64
	MOVLW      2
	XORWF      _i+0, 0
L__getUpdown64:
	BTFSC      STATUS+0, 2
	GOTO       L_getUpdown10
L__getUpdown50:
;exam03.c,139 :: 		i++ ;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;exam03.c,140 :: 		changeMenu(void);
	CALL       _changeMenu+0
;exam03.c,141 :: 		while (B_down == pushed) ;
L_getUpdown11:
	BTFSS      PORTB+0, 6
	GOTO       L_getUpdown12
	GOTO       L_getUpdown11
L_getUpdown12:
;exam03.c,142 :: 		}
L_getUpdown10:
L_getUpdown7:
;exam03.c,143 :: 		}
L_end_getUpdown:
	RETURN
; end of _getUpdown

_changeMenu:

;exam03.c,145 :: 		void changeMenu(void)       //ÍÓÈ ÞíãÉ ÇáãÊÛíÑ ÊÊÛíÑ ÇáÞÇÆãÉ
;exam03.c,147 :: 		if (i == 0)
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__changeMenu66
	MOVLW      0
	XORWF      _i+0, 0
L__changeMenu66:
	BTFSS      STATUS+0, 2
	GOTO       L_changeMenu13
;exam03.c,149 :: 		displayLCD_12 (void);    // åÔÙåÑ ÔÇÔÉ ßÐÇ
	CALL       _displayLCD_12+0
;exam03.c,150 :: 		}
L_changeMenu13:
;exam03.c,151 :: 		if (i == 1)
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__changeMenu67
	MOVLW      1
	XORWF      _i+0, 0
L__changeMenu67:
	BTFSS      STATUS+0, 2
	GOTO       L_changeMenu14
;exam03.c,153 :: 		displayLCD_23 (void);    // åÔÙåÑ ÔÇÔÉ ßÐÇ
	CALL       _displayLCD_23+0
;exam03.c,154 :: 		}
L_changeMenu14:
;exam03.c,155 :: 		if (i == 2)
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__changeMenu68
	MOVLW      2
	XORWF      _i+0, 0
L__changeMenu68:
	BTFSS      STATUS+0, 2
	GOTO       L_changeMenu15
;exam03.c,157 :: 		displayLCD_34 (void); // åÔÙåÑ ÔÇÔÉ ßÐÇ
	CALL       _displayLCD_34+0
;exam03.c,158 :: 		}
L_changeMenu15:
;exam03.c,159 :: 		}
L_end_changeMenu:
	RETURN
; end of _changeMenu

_checkOk_buttons:

;exam03.c,161 :: 		void checkOk_buttons (void)         //okíÚØí ÇæÇãÑ ÍÓÈ ÞíãÉ ÇáãÊÛíÑ æÞíãÉ ÒÑ
;exam03.c,163 :: 		if ((i==0) &&  (B_ok1 == pushed) )
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkOk_buttons70
	MOVLW      0
	XORWF      _i+0, 0
L__checkOk_buttons70:
	BTFSS      STATUS+0, 2
	GOTO       L_checkOk_buttons18
	BTFSS      PORTB+0, 5
	GOTO       L_checkOk_buttons18
L__checkOk_buttons57:
;exam03.c,165 :: 		moveMotorL (void);
	CALL       _moveMotorL+0
;exam03.c,166 :: 		displayLCD_ML(void);
	CALL       _displayLCD_ML+0
;exam03.c,167 :: 		while (B_ok1 == pushed);
L_checkOk_buttons19:
	BTFSS      PORTB+0, 5
	GOTO       L_checkOk_buttons20
	GOTO       L_checkOk_buttons19
L_checkOk_buttons20:
;exam03.c,168 :: 		i = 5;                        // ÚáÔÇä ãíäÝÐÔ ÇãÑ ÊÇäí ÛíÑ áãÇ ÇÖÛØ ÈÇß ÇáÇæá .
	MOVLW      5
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
;exam03.c,169 :: 		}
L_checkOk_buttons18:
;exam03.c,170 :: 		if ((i==0) &&  (B_ok2 == pushed) )
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkOk_buttons71
	MOVLW      0
	XORWF      _i+0, 0
L__checkOk_buttons71:
	BTFSS      STATUS+0, 2
	GOTO       L_checkOk_buttons23
	BTFSS      PORTB+0, 4
	GOTO       L_checkOk_buttons23
L__checkOk_buttons56:
;exam03.c,172 :: 		moveMotorR (void);
	CALL       _moveMotorR+0
;exam03.c,173 :: 		displayLCD_MR(void);
	CALL       _displayLCD_MR+0
;exam03.c,174 :: 		while (B_ok2 == pushed);
L_checkOk_buttons24:
	BTFSS      PORTB+0, 4
	GOTO       L_checkOk_buttons25
	GOTO       L_checkOk_buttons24
L_checkOk_buttons25:
;exam03.c,175 :: 		i = 5;
	MOVLW      5
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
;exam03.c,176 :: 		}
L_checkOk_buttons23:
;exam03.c,177 :: 		if ((i==1) &&  (B_ok1 == pushed) )
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkOk_buttons72
	MOVLW      1
	XORWF      _i+0, 0
L__checkOk_buttons72:
	BTFSS      STATUS+0, 2
	GOTO       L_checkOk_buttons28
	BTFSS      PORTB+0, 5
	GOTO       L_checkOk_buttons28
L__checkOk_buttons55:
;exam03.c,179 :: 		moveMotorR (void);
	CALL       _moveMotorR+0
;exam03.c,180 :: 		displayLCD_MR(void);
	CALL       _displayLCD_MR+0
;exam03.c,181 :: 		while (B_ok1 == pushed);
L_checkOk_buttons29:
	BTFSS      PORTB+0, 5
	GOTO       L_checkOk_buttons30
	GOTO       L_checkOk_buttons29
L_checkOk_buttons30:
;exam03.c,182 :: 		i = 5;
	MOVLW      5
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
;exam03.c,183 :: 		}
L_checkOk_buttons28:
;exam03.c,184 :: 		if ((i==1) &&  (B_ok2 == pushed) )
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkOk_buttons73
	MOVLW      1
	XORWF      _i+0, 0
L__checkOk_buttons73:
	BTFSS      STATUS+0, 2
	GOTO       L_checkOk_buttons33
	BTFSS      PORTB+0, 4
	GOTO       L_checkOk_buttons33
L__checkOk_buttons54:
;exam03.c,186 :: 		stopMotor (void);
	CALL       _stopMotor+0
;exam03.c,187 :: 		displayLCD_MS(void);
	CALL       _displayLCD_MS+0
;exam03.c,188 :: 		while (B_ok2 == pushed);
L_checkOk_buttons34:
	BTFSS      PORTB+0, 4
	GOTO       L_checkOk_buttons35
	GOTO       L_checkOk_buttons34
L_checkOk_buttons35:
;exam03.c,189 :: 		i = 5;
	MOVLW      5
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
;exam03.c,190 :: 		}
L_checkOk_buttons33:
;exam03.c,191 :: 		if ((i==2) &&  (B_ok1 == pushed) )
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkOk_buttons74
	MOVLW      2
	XORWF      _i+0, 0
L__checkOk_buttons74:
	BTFSS      STATUS+0, 2
	GOTO       L_checkOk_buttons38
	BTFSS      PORTB+0, 5
	GOTO       L_checkOk_buttons38
L__checkOk_buttons53:
;exam03.c,193 :: 		stopMotor (void);
	CALL       _stopMotor+0
;exam03.c,194 :: 		displayLCD_MS(void);
	CALL       _displayLCD_MS+0
;exam03.c,195 :: 		while (B_ok1 == pushed);
L_checkOk_buttons39:
	BTFSS      PORTB+0, 5
	GOTO       L_checkOk_buttons40
	GOTO       L_checkOk_buttons39
L_checkOk_buttons40:
;exam03.c,196 :: 		i = 5;
	MOVLW      5
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
;exam03.c,197 :: 		}
L_checkOk_buttons38:
;exam03.c,198 :: 		if ((i==2) &&  (B_ok2 == pushed) )
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkOk_buttons75
	MOVLW      2
	XORWF      _i+0, 0
L__checkOk_buttons75:
	BTFSS      STATUS+0, 2
	GOTO       L_checkOk_buttons43
	BTFSS      PORTB+0, 4
	GOTO       L_checkOk_buttons43
L__checkOk_buttons52:
;exam03.c,200 :: 		stopMotor (void);
	CALL       _stopMotor+0
;exam03.c,201 :: 		getTemperature (void);
	CALL       _getTemperature+0
;exam03.c,202 :: 		displayTemperature (void);
	CALL       _displayTemperature+0
;exam03.c,203 :: 		while (B_ok1 == pushed);
L_checkOk_buttons44:
	BTFSS      PORTB+0, 5
	GOTO       L_checkOk_buttons45
	GOTO       L_checkOk_buttons44
L_checkOk_buttons45:
;exam03.c,204 :: 		i = 5;
	MOVLW      5
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
;exam03.c,205 :: 		}
L_checkOk_buttons43:
;exam03.c,206 :: 		}
L_end_checkOk_buttons:
	RETURN
; end of _checkOk_buttons

_goBack:

;exam03.c,208 :: 		void goBack (void)                    // ÏÇáÉ ÒÑÇÑ ÇáÈÇß
;exam03.c,210 :: 		if (B_back == pushed )
	BTFSS      PORTB+0, 3
	GOTO       L_goBack46
;exam03.c,212 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,213 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;exam03.c,214 :: 		displayLCD_12 (void);
	CALL       _displayLCD_12+0
;exam03.c,215 :: 		while (B_back == pushed );
L_goBack47:
	BTFSS      PORTB+0, 3
	GOTO       L_goBack48
	GOTO       L_goBack47
L_goBack48:
;exam03.c,216 :: 		}
L_goBack46:
;exam03.c,217 :: 		}
L_end_goBack:
	RETURN
; end of _goBack

_moveMotorL:

;exam03.c,221 :: 		void moveMotorL (void)
;exam03.c,223 :: 		MoveR = off ;
	BCF        PORTB+0, 1
;exam03.c,224 :: 		MoveL = on ;
	BSF        PORTB+0, 0
;exam03.c,225 :: 		}
L_end_moveMotorL:
	RETURN
; end of _moveMotorL

_moveMotorR:

;exam03.c,227 :: 		void moveMotorR (void)
;exam03.c,229 :: 		MoveL = off ;
	BCF        PORTB+0, 0
;exam03.c,230 :: 		MoveR = on ;
	BSF        PORTB+0, 1
;exam03.c,231 :: 		}
L_end_moveMotorR:
	RETURN
; end of _moveMotorR

_stopMotor:

;exam03.c,233 :: 		void stopMotor (void)
;exam03.c,235 :: 		MoveL = off ;
	BCF        PORTB+0, 0
;exam03.c,236 :: 		MoveR = off ;
	BCF        PORTB+0, 1
;exam03.c,237 :: 		}
L_end_stopMotor:
	RETURN
; end of _stopMotor

_displayLCD_12:

;exam03.c,240 :: 		void displayLCD_12 (void)
;exam03.c,242 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,243 :: 		Lcd_Out(1, 1, "1- Motor left.");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,244 :: 		Lcd_Out(2, 1, "2- Motor right.");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,245 :: 		}
L_end_displayLCD_12:
	RETURN
; end of _displayLCD_12

_displayLCD_23:

;exam03.c,247 :: 		void displayLCD_23(void)
;exam03.c,249 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,250 :: 		Lcd_Out(1, 1, "2- Motor right.");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,251 :: 		Lcd_Out(2, 1, "3- Motor stop.");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,252 :: 		}
L_end_displayLCD_23:
	RETURN
; end of _displayLCD_23

_displayLCD_34:

;exam03.c,254 :: 		void displayLCD_34(void)
;exam03.c,256 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,257 :: 		Lcd_Out(1, 1, "3- Motor stop.");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,258 :: 		Lcd_Out(2, 1, "4- temperature");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,259 :: 		}
L_end_displayLCD_34:
	RETURN
; end of _displayLCD_34

_displayLCD_ML:

;exam03.c,261 :: 		void displayLCD_ML(void)
;exam03.c,263 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,264 :: 		Lcd_Out(1, 1, "Motor rotates Left");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,265 :: 		}
L_end_displayLCD_ML:
	RETURN
; end of _displayLCD_ML

_displayLCD_MR:

;exam03.c,267 :: 		void displayLCD_MR(void)
;exam03.c,269 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,270 :: 		Lcd_Out(1, 1, "Motor rotates Right");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,271 :: 		}
L_end_displayLCD_MR:
	RETURN
; end of _displayLCD_MR

_displayLCD_MS:

;exam03.c,273 :: 		void displayLCD_MS(void)
;exam03.c,275 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,276 :: 		Lcd_Out(1, 1, "Motor Stop");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,277 :: 		}
L_end_displayLCD_MS:
	RETURN
; end of _displayLCD_MS

_displayLCD_MT:

;exam03.c,279 :: 		void displayLCD_MT(void)
;exam03.c,281 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,282 :: 		Lcd_Out(1, 1, "Motor Tempe");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,283 :: 		}
L_end_displayLCD_MT:
	RETURN
; end of _displayLCD_MT

_getTemperature:

;exam03.c,286 :: 		void getTemperature (void)
;exam03.c,288 :: 		level = ADC_Get_Sample(0);
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _level+0
	MOVF       R0+1, 0
	MOVWF      _level+1
;exam03.c,289 :: 		volte = (level * 4.883)/10;
	CALL       _Word2Double+0
	MOVLW      137
	MOVWF      R4+0
	MOVLW      65
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
	MOVWF      FLOC__getTemperature+0
	MOVF       R0+1, 0
	MOVWF      FLOC__getTemperature+1
	MOVF       R0+2, 0
	MOVWF      FLOC__getTemperature+2
	MOVF       R0+3, 0
	MOVWF      FLOC__getTemperature+3
	MOVF       FLOC__getTemperature+0, 0
	MOVWF      _volte+0
	MOVF       FLOC__getTemperature+1, 0
	MOVWF      _volte+1
	MOVF       FLOC__getTemperature+2, 0
	MOVWF      _volte+2
	MOVF       FLOC__getTemperature+3, 0
	MOVWF      _volte+3
;exam03.c,290 :: 		y = volte;
	MOVF       FLOC__getTemperature+0, 0
	MOVWF      R0+0
	MOVF       FLOC__getTemperature+1, 0
	MOVWF      R0+1
	MOVF       FLOC__getTemperature+2, 0
	MOVWF      R0+2
	MOVF       FLOC__getTemperature+3, 0
	MOVWF      R0+3
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _y+0
	MOVF       R0+1, 0
	MOVWF      _y+1
;exam03.c,291 :: 		m = ((volte - y )*10);
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__getTemperature+0, 0
	MOVWF      R0+0
	MOVF       FLOC__getTemperature+1, 0
	MOVWF      R0+1
	MOVF       FLOC__getTemperature+2, 0
	MOVWF      R0+2
	MOVF       FLOC__getTemperature+3, 0
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
;exam03.c,292 :: 		IntToStr(y, x3);
	MOVF       _y+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _y+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x3+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;exam03.c,293 :: 		l = Ltrim(x3);
	MOVLW      _x3+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _l+0
;exam03.c,294 :: 		IntToStr(m, x4);
	MOVF       _m+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _m+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x4+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;exam03.c,295 :: 		k = Ltrim(x4);
	MOVLW      _x4+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _k+0
;exam03.c,296 :: 		}
L_end_getTemperature:
	RETURN
; end of _getTemperature

_displayTemperature:

;exam03.c,298 :: 		void displayTemperature (void)
;exam03.c,300 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,301 :: 		Lcd_Out(1, 1, "Motor Tempe");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,302 :: 		Lcd_Out(2, 1, "T=");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,303 :: 		Lcd_Out(2, 4, x3);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,304 :: 		Lcd_Out_CP( ".");
	MOVLW      ?lstr13_exam03+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;exam03.c,305 :: 		Lcd_Out_CP( x4);
	MOVLW      _x4+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;exam03.c,306 :: 		Lcd_Out_CP( "c");
	MOVLW      ?lstr14_exam03+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;exam03.c,307 :: 		}
L_end_displayTemperature:
	RETURN
; end of _displayTemperature

_closeError:

;exam03.c,309 :: 		void closeError (void)
;exam03.c,311 :: 		getTemperature (void);
	CALL       _getTemperature+0
;exam03.c,312 :: 		if (y > 30)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _y+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__closeError90
	MOVF       _y+0, 0
	SUBLW      30
L__closeError90:
	BTFSC      STATUS+0, 0
	GOTO       L_closeError49
;exam03.c,314 :: 		stopMotor (void);
	CALL       _stopMotor+0
;exam03.c,315 :: 		i =5 ;
	MOVLW      5
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
;exam03.c,316 :: 		trisB = out ;
	CLRF       TRISB+0
;exam03.c,317 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;exam03.c,319 :: 		Lcd_Out(1, 1, "ERROR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_exam03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;exam03.c,320 :: 		}
L_closeError49:
;exam03.c,322 :: 		}
L_end_closeError:
	RETURN
; end of _closeError
