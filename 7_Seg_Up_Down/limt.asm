
_main:

;limt.c,28 :: 		void main()
;limt.c,30 :: 		initialValues(void);
	CALL       _initialValues+0
;limt.c,31 :: 		ioConfiguration(void);
	CALL       _ioConfiguration+0
;limt.c,32 :: 		mainCode (void);
	CALL       _mainCode+0
;limt.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_initialValues:

;limt.c,35 :: 		void initialValues(void)
;limt.c,37 :: 		sev_seg = seg_mat[0];
	MOVF       _seg_mat+0, 0
	MOVWF      PORTC+0
;limt.c,38 :: 		i = 0 ;
	CLRF       _i+0
	CLRF       _i+1
;limt.c,39 :: 		delay_ms (400) ;
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_initialValues0:
	DECFSZ     R13+0, 1
	GOTO       L_initialValues0
	DECFSZ     R12+0, 1
	GOTO       L_initialValues0
	DECFSZ     R11+0, 1
	GOTO       L_initialValues0
;limt.c,41 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_ioConfiguration:

;limt.c,43 :: 		void ioConfiguration(void)
;limt.c,45 :: 		sev_seg_dir = out ;
	CLRF       TRISC+0
;limt.c,46 :: 		}
L_end_ioConfiguration:
	RETURN
; end of _ioConfiguration

_inCrement:

;limt.c,48 :: 		void inCrement(void)
;limt.c,50 :: 		sev_seg = seg_mat[i];
	MOVF       _i+0, 0
	ADDLW      _seg_mat+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;limt.c,51 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_inCrement1:
	DECFSZ     R13+0, 1
	GOTO       L_inCrement1
	DECFSZ     R12+0, 1
	GOTO       L_inCrement1
	DECFSZ     R11+0, 1
	GOTO       L_inCrement1
;limt.c,52 :: 		}
L_end_inCrement:
	RETURN
; end of _inCrement

_deCrement:

;limt.c,54 :: 		void deCrement(void)
;limt.c,56 :: 		sev_seg = seg_mat[i];
	MOVF       _i+0, 0
	ADDLW      _seg_mat+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;limt.c,57 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_deCrement2:
	DECFSZ     R13+0, 1
	GOTO       L_deCrement2
	DECFSZ     R12+0, 1
	GOTO       L_deCrement2
	DECFSZ     R11+0, 1
	GOTO       L_deCrement2
;limt.c,58 :: 		}
L_end_deCrement:
	RETURN
; end of _deCrement

_mainCode:

;limt.c,60 :: 		void mainCode (void)
;limt.c,62 :: 		while (1)
L_mainCode3:
;limt.c,64 :: 		if (ButtonUP == pushed && (i != 9) )
	BTFSS      PORTB+0, 7
	GOTO       L_mainCode7
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode29
	MOVLW      9
	XORWF      _i+0, 0
L__mainCode29:
	BTFSC      STATUS+0, 2
	GOTO       L_mainCode7
L__mainCode22:
;limt.c,66 :: 		i++ ;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;limt.c,67 :: 		inCrement(void) ;
	CALL       _inCrement+0
;limt.c,68 :: 		while (ButtonUP == pushed) ;
L_mainCode8:
	BTFSS      PORTB+0, 7
	GOTO       L_mainCode9
	GOTO       L_mainCode8
L_mainCode9:
;limt.c,69 :: 		}
	GOTO       L_mainCode10
L_mainCode7:
;limt.c,71 :: 		else if(ButtonDOWN == pushed && (i != 0) )
	BTFSS      PORTB+0, 6
	GOTO       L_mainCode13
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode30
	MOVLW      0
	XORWF      _i+0, 0
L__mainCode30:
	BTFSC      STATUS+0, 2
	GOTO       L_mainCode13
L__mainCode21:
;limt.c,73 :: 		if (i == 0)
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode31
	MOVLW      0
	XORWF      _i+0, 0
L__mainCode31:
	BTFSS      STATUS+0, 2
	GOTO       L_mainCode14
;limt.c,75 :: 		i = 10;
	MOVLW      10
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
;limt.c,76 :: 		}
L_mainCode14:
;limt.c,77 :: 		i-- ;
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;limt.c,78 :: 		deCrement(void) ;
	CALL       _deCrement+0
;limt.c,79 :: 		while (ButtonDOWN == pushed) ;
L_mainCode15:
	BTFSS      PORTB+0, 6
	GOTO       L_mainCode16
	GOTO       L_mainCode15
L_mainCode16:
;limt.c,80 :: 		}
	GOTO       L_mainCode17
L_mainCode13:
;limt.c,81 :: 		else if(ButtonCLEAR == pushed )
	BTFSS      PORTB+0, 5
	GOTO       L_mainCode18
;limt.c,83 :: 		initialValues(void)  ;
	CALL       _initialValues+0
;limt.c,84 :: 		while (ButtonDOWN == pushed) ;
L_mainCode19:
	BTFSS      PORTB+0, 6
	GOTO       L_mainCode20
	GOTO       L_mainCode19
L_mainCode20:
;limt.c,85 :: 		}
L_mainCode18:
L_mainCode17:
L_mainCode10:
;limt.c,86 :: 		}
	GOTO       L_mainCode3
;limt.c,87 :: 		}
L_end_mainCode:
	RETURN
; end of _mainCode
