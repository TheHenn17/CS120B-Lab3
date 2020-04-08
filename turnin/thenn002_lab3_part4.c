/*	Author: lab
 *  Partner(s) Name: 
 *	Lab Section:
 *	Assignment: Lab #  Exercise #
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    /* Insert DDR and PORT initializations */
	DDRA = 0x00; PORTA = 0xFF;
	DDRB = 0xFF; PORTB = 0x00;
        DDRC = 0xFF; PORTC = 0x00;
    /* Insert your solution below */
	unsigned char tempA;
	unsigned char tempB;
	unsigned char tempC;
	while (1) {
		tempA = PINA;
		tempB = PORTB;
		tempC = PORTC;
		PORTB = (tempB & 0xF0) | (tempA >> 4);
		PORTC = (tempC & 0x0F) | (tempA << 4);
	}
	return 1;
}
