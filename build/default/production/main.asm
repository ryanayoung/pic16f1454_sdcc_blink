;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"main.c"
	list	p=16f1454
	radix dec
	include "p16f1454.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config _CONFIG1, 0x3fe4
	__config _CONFIG2, 0x3fff
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__divulong
	extern	__mullong
	extern	_TRISCbits
	extern	_PORTCbits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main

	global STK15
	global STK14
	global STK13
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
STK15	res 1
STK14	res 1
STK13	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x1013	res	1
r0x1012	res	1
r0x1014	res	1
r0x1015	res	1
r0x100D	res	1
r0x100C	res	1
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1011	res	1
r0x1007	res	1
r0x1006	res	1
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
r0x1000	res	1
r0x1001	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;6 compiler assigned registers:
;   r0x1000
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	70; "main.c"	LED_TRIS = 0; // Pin as output
	BANKSEL	_TRISCbits
	BCF	_TRISCbits,0
;	.line	71; "main.c"	LED_PORT = 0; // LED off
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,0
_00129_DS_:
;	.line	74; "main.c"	LED_PORT = 1; // LED On
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,0
;	.line	59; "main.c"	while ( __ms-- )
	MOVLW	0xe8
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVLW	0x03
	MOVWF	r0x1001
_00131_DS_:
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	MOVWF	r0x1002
	MOVF	r0x1001,W
	MOVWF	r0x1003
	MOVLW	0xff
	ADDWF	r0x1000,F
	BTFSS	STATUS,0
	DECF	r0x1001,F
	MOVF	r0x1003,W
	IORWF	r0x1002,W
	BTFSC	STATUS,2
	GOTO	_00139_DS_
;	.line	54; "main.c"	_delay_cycl( (unsigned short)( T_COUNT(__us) );
	MOVLW	0x06
	MOVWF	r0x1002
	CLRF	r0x1003
	nop
	nop
_00132_DS_:
;	.line	47; "main.c"	__ticks--;
	MOVLW	0xff
	BANKSEL	r0x1002
	ADDWF	r0x1002,W
	MOVWF	r0x1004
	MOVLW	0xff
	MOVWF	r0x1005
	MOVF	r0x1003,W
	BTFSC	STATUS,0
	INCFSZ	r0x1003,W
	ADDWF	r0x1005,F
	MOVF	r0x1004,W
	MOVWF	r0x1002
	MOVF	r0x1005,W
	MOVWF	r0x1003
;	.line	48; "main.c"	} while ( __ticks );
	MOVF	r0x1005,W
	IORWF	r0x1004,W
	BTFSS	STATUS,2
	GOTO	_00132_DS_
	nop
;	.line	61; "main.c"	_delay_us( 1000 );
	GOTO	_00131_DS_
_00139_DS_:
;	.line	76; "main.c"	LED_PORT = 0; // LED Off
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,0
;	.line	59; "main.c"	while ( __ms-- )
	MOVLW	0xe8
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVLW	0x03
	MOVWF	r0x1001
_00140_DS_:
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	MOVWF	r0x1002
	MOVF	r0x1001,W
	MOVWF	r0x1003
	MOVLW	0xff
	ADDWF	r0x1000,F
	BTFSS	STATUS,0
	DECF	r0x1001,F
	MOVF	r0x1003,W
	IORWF	r0x1002,W
	BTFSC	STATUS,2
	GOTO	_00129_DS_
;	.line	54; "main.c"	_delay_cycl( (unsigned short)( T_COUNT(__us) );
	MOVLW	0x06
	MOVWF	r0x1002
	CLRF	r0x1003
	nop
	nop
_00141_DS_:
;	.line	47; "main.c"	__ticks--;
	MOVLW	0xff
	BANKSEL	r0x1002
	ADDWF	r0x1002,W
	MOVWF	r0x1004
	MOVLW	0xff
	MOVWF	r0x1005
	MOVF	r0x1003,W
	BTFSC	STATUS,0
	INCFSZ	r0x1003,W
	ADDWF	r0x1005,F
	MOVF	r0x1004,W
	MOVWF	r0x1002
	MOVF	r0x1005,W
	MOVWF	r0x1003
;	.line	48; "main.c"	} while ( __ticks );
	MOVF	r0x1005,W
	IORWF	r0x1004,W
	BTFSS	STATUS,2
	GOTO	_00141_DS_
	nop
;	.line	61; "main.c"	_delay_us( 1000 );
	GOTO	_00140_DS_
;	.line	79; "main.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;7 compiler assigned registers:
;   r0x1006
;   STK00
;   r0x1007
;   r0x1008
;   r0x1009
;   r0x100A
;   r0x100B
;; Starting pCode block
S_main___delay_ms	code
__delay_ms:
; 2 exit points
;	.line	57; "main.c"	static inline void _delay_ms( unsigned short __ms )
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	STK00,W
	MOVWF	r0x1007
_00115_DS_:
;	.line	59; "main.c"	while ( __ms-- )
	BANKSEL	r0x1007
	MOVF	r0x1007,W
	MOVWF	r0x1008
	MOVF	r0x1006,W
	MOVWF	r0x1009
	MOVLW	0xff
	ADDWF	r0x1007,F
	BTFSS	STATUS,0
	DECF	r0x1006,F
	MOVF	r0x1009,W
	IORWF	r0x1008,W
	BTFSC	STATUS,2
	GOTO	_00123_DS_
;	.line	54; "main.c"	_delay_cycl( (unsigned short)( T_COUNT(__us) );
	MOVLW	0x06
	MOVWF	r0x1008
	CLRF	r0x1009
	nop
	nop
_00118_DS_:
;	.line	47; "main.c"	__ticks--;
	MOVLW	0xff
	BANKSEL	r0x1008
	ADDWF	r0x1008,W
	MOVWF	r0x100A
	MOVLW	0xff
	MOVWF	r0x100B
	MOVF	r0x1009,W
	BTFSC	STATUS,0
	INCFSZ	r0x1009,W
	ADDWF	r0x100B,F
	MOVF	r0x100A,W
	MOVWF	r0x1008
	MOVF	r0x100B,W
	MOVWF	r0x1009
;	.line	48; "main.c"	} while ( __ticks );
	MOVF	r0x100B,W
	IORWF	r0x100A,W
	BTFSS	STATUS,2
	GOTO	_00118_DS_
	nop
;	.line	61; "main.c"	_delay_us( 1000 );
	GOTO	_00115_DS_
_00123_DS_:
;	.line	63; "main.c"	}
	RETURN	
; exit point of __delay_ms

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __mullong
;   __divulong
;   __divulong
;   __mullong
;   __divulong
;   __divulong
;13 compiler assigned registers:
;   r0x100C
;   STK00
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;   STK06
;   STK05
;   STK04
;   STK03
;   STK02
;   STK01
;; Starting pCode block
S_main___delay_us	code
__delay_us:
; 2 exit points
;	.line	52; "main.c"	static inline void _delay_us( unsigned short __us )
	BANKSEL	r0x100C
	MOVWF	r0x100C
	MOVF	STK00,W
;	.line	54; "main.c"	_delay_cycl( (unsigned short)( T_COUNT(__us) );
	MOVWF	r0x100D
	MOVWF	r0x100E
;;101	MOVF	r0x100C,W
	CLRF	r0x1010
	CLRF	r0x1011
	MOVF	r0x100E,W
	MOVWF	STK06
;;100	MOVF	r0x100F,W
	MOVF	r0x100C,W
	MOVWF	r0x100F
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0xa0
	MOVWF	STK02
	MOVLW	0x8c
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__mullong
	CALL	__mullong
	PAGESEL	$
	BANKSEL	r0x100F
	MOVWF	r0x100F
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100C
	MOVF	STK02,W
	MOVWF	r0x100D
	MOVLW	0x40
	MOVWF	STK06
	MOVLW	0x42
	MOVWF	STK05
	MOVLW	0x0f
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x100D,W
	MOVWF	STK02
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100E,W
	MOVWF	STK00
	MOVF	r0x100F,W
	PAGESEL	__divulong
	CALL	__divulong
	PAGESEL	$
	BANKSEL	r0x100F
	MOVWF	r0x100F
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100C
	MOVF	STK02,W
	MOVWF	r0x100D
	MOVLW	0xfb
	ADDWF	r0x100D,F
	MOVLW	0xff
	BTFSS	STATUS,0
	ADDWF	r0x100C,F
	MOVLW	0xff
	BTFSS	STATUS,0
	ADDWF	r0x100E,F
	MOVLW	0xff
	BTFSS	STATUS,0
	ADDWF	r0x100F,F
	MOVLW	0x05
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x100D,W
	MOVWF	STK02
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100E,W
	MOVWF	STK00
	MOVF	r0x100F,W
	PAGESEL	__divulong
	CALL	__divulong
	PAGESEL	$
	BANKSEL	r0x100F
	MOVWF	r0x100F
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x1011
	MOVWF	r0x100C
	MOVF	STK02,W
	MOVWF	r0x100D
	MOVWF	r0x1010
;;99	MOVF	r0x100C,W
	nop
	nop
_00110_DS_:
;	.line	47; "main.c"	__ticks--;
	MOVLW	0xff
	BANKSEL	r0x1010
	ADDWF	r0x1010,W
	MOVWF	r0x100D
	MOVLW	0xff
	MOVWF	r0x100C
	MOVF	r0x1011,W
	BTFSC	STATUS,0
	INCFSZ	r0x1011,W
	ADDWF	r0x100C,F
	MOVF	r0x100D,W
	MOVWF	r0x1010
	MOVF	r0x100C,W
	MOVWF	r0x1011
;	.line	48; "main.c"	} while ( __ticks );
	MOVF	r0x100C,W
	IORWF	r0x100D,W
	BTFSS	STATUS,2
	GOTO	_00110_DS_
	nop
;	.line	55; "main.c"	}
	RETURN	
; exit point of __delay_us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1012
;   STK00
;   r0x1013
;   r0x1014
;   r0x1015
;; Starting pCode block
S_main___delay_cycl	code
__delay_cycl:
; 2 exit points
;	.line	43; "main.c"	static inline void _delay_cycl( unsigned short __ticks )
	BANKSEL	r0x1012
	MOVWF	r0x1012
	MOVF	STK00,W
	MOVWF	r0x1013
	nop
	nop
_00105_DS_:
;	.line	47; "main.c"	__ticks--;
	MOVLW	0xff
	BANKSEL	r0x1013
	ADDWF	r0x1013,W
	MOVWF	r0x1014
	MOVLW	0xff
	MOVWF	r0x1015
	MOVF	r0x1012,W
	BTFSC	STATUS,0
	INCFSZ	r0x1012,W
	ADDWF	r0x1015,F
	MOVF	r0x1014,W
	MOVWF	r0x1013
	MOVF	r0x1015,W
	MOVWF	r0x1012
;	.line	48; "main.c"	} while ( __ticks );
	MOVF	r0x1015,W
	IORWF	r0x1014,W
	BTFSS	STATUS,2
	GOTO	_00105_DS_
	nop
;	.line	50; "main.c"	}
	RETURN	
; exit point of __delay_cycl


;	code size estimation:
;	  244+   26 =   270 instructions (  592 byte)

	end
