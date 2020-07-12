/* 
 * File:   main.c
 * Author: grimj
 *
 * Created on July 11, 2020, 9:03 PM
 */
#define NO_BIT_DEFINES

#include <pic14regs.h>
#include <stdint.h>
//#include <stdio.h>
//#include <stdlib.h>

// PIC16F1454 Configuration Bit Settings
// 'C' source line config statements
static __code char __at _CONFIG1 CONFIG1 = _FOSC_INTOSC & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _BOREN_ON & _CLKOUTEN_OFF & _IESO_ON & _FCMEN_ON;
static __code char __at _CONFIG2 CONFIG2 = _WRT_OFF & _CPUDIV_CLKDIV6 & _USBLSCLK_48MHz & _PLLMULT_3x & _PLLEN_ENABLED & _STVREN_ON & _BORV_LO & _LPBOR_OFF & _LVP_ON;

/*define pines for code legibility*/
#define LED_PORT PORTCbits.RC0
#define LED_TRIS TRISCbits.TRISC0

///* Adjust to your clock frequency (in Hz). */
//#define CLOCKFREQ   (16U*1000U*1000U)
///* Instructions per millisecond. */
//#define INSNS_PER_MS    (CLOCKFREQ / 4000U)
///* Delay loop is about 10 cycles per iteration. */
//#define LOOPS_PER_MS    (100U)
//void delay_ms(uint16_t ms) {
//    uint16_t u;
//    while (ms--) {
//        /* Inner loop takes about 10 cycles per iteration + 4 cycles setup. */
//        for (u = 0; u < LOOPS_PER_MS; u++) {
//            /* Prevent this loop from being optimized away. */
//            __asm nop __endasm;
//        }
//    }
//}

#define F_CPU (36UL * 1000UL)
#define T_COUNT(x) (( F_CPU * x / 1000000UL )-5)/5)

static inline void _delay_cycl( unsigned short __ticks )
{
    __asm__("nop\n nop\n"); 
    do {    
      __ticks--;
    } while ( __ticks );
    __asm__("nop\n");
}

static inline void _delay_us( unsigned short __us )
{
    _delay_cycl( (unsigned short)( T_COUNT(__us) );
}

static inline void _delay_ms( unsigned short __ms )
{
    while ( __ms-- )
    {
        _delay_us( 1000 );
    }
}

/*
 Main loop.
 */
void main(void)
{
	LED_TRIS = 0; // Pin as output
	LED_PORT = 0; // LED off
	
	while (1) {
		LED_PORT = 1; // LED On
		_delay_ms(1000); 
		LED_PORT = 0; // LED Off
		_delay_ms(1000);
	}
}

