
_main:

;7Segment.c,14 :: 		void main()
;7Segment.c,16 :: 		initialValues(void);
	CALL       _initialValues+0
;7Segment.c,17 :: 		ioConfiguration(void);
	CALL       _ioConfiguration+0
;7Segment.c,18 :: 		while (1)
L_main0:
;7Segment.c,20 :: 		inCrement(void);
	CALL       _inCrement+0
;7Segment.c,21 :: 		deCrement(void);
	CALL       _deCrement+0
;7Segment.c,22 :: 		}
	GOTO       L_main0
;7Segment.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_initialValues:

;7Segment.c,27 :: 		void initialValues(void)
;7Segment.c,29 :: 		sev_seg = 0 ;
	CLRF       PORTC+0
;7Segment.c,30 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_ioConfiguration:

;7Segment.c,31 :: 		void ioConfiguration(void)
;7Segment.c,33 :: 		sev_seg_dir = out ;
	CLRF       TRISC+0
;7Segment.c,34 :: 		}
L_end_ioConfiguration:
	RETURN
; end of _ioConfiguration

_inCrement:

;7Segment.c,35 :: 		void inCrement(void)
;7Segment.c,37 :: 		for (i=0; i<=9; i++)
	CLRF       _i+0
	CLRF       _i+1
L_inCrement2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__inCrement14
	MOVF       _i+0, 0
	SUBLW      9
L__inCrement14:
	BTFSS      STATUS+0, 0
	GOTO       L_inCrement3
;7Segment.c,39 :: 		sev_seg = seg_mat[i];
	MOVF       _i+0, 0
	ADDLW      _seg_mat+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;7Segment.c,40 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_inCrement5:
	DECFSZ     R13+0, 1
	GOTO       L_inCrement5
	DECFSZ     R12+0, 1
	GOTO       L_inCrement5
	DECFSZ     R11+0, 1
	GOTO       L_inCrement5
;7Segment.c,37 :: 		for (i=0; i<=9; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;7Segment.c,41 :: 		}
	GOTO       L_inCrement2
L_inCrement3:
;7Segment.c,42 :: 		}
L_end_inCrement:
	RETURN
; end of _inCrement

_deCrement:

;7Segment.c,43 :: 		void deCrement(void)
;7Segment.c,45 :: 		for (i=9; i>=0; i--)
	MOVLW      9
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_deCrement6:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__deCrement16
	MOVLW      0
	SUBWF      _i+0, 0
L__deCrement16:
	BTFSS      STATUS+0, 0
	GOTO       L_deCrement7
;7Segment.c,47 :: 		sev_seg = seg_mat[i];
	MOVF       _i+0, 0
	ADDLW      _seg_mat+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;7Segment.c,48 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_deCrement9:
	DECFSZ     R13+0, 1
	GOTO       L_deCrement9
	DECFSZ     R12+0, 1
	GOTO       L_deCrement9
	DECFSZ     R11+0, 1
	GOTO       L_deCrement9
;7Segment.c,45 :: 		for (i=9; i>=0; i--)
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;7Segment.c,49 :: 		}
	GOTO       L_deCrement6
L_deCrement7:
;7Segment.c,50 :: 		}
L_end_deCrement:
	RETURN
; end of _deCrement
