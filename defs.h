#ifndef __DEFS_H__
#define __DEFS_H__

#define TRUE                       1
#define FALSE                      0
#define string_t        char *
#define bool_t          unsigned char
#define uint32_t unsigned long
#define timer_t uint32_t         //Armazenamento de um valor de tempo (em ticks).
#define uint16_t unsigned int

#define start_timer(X) (X+ticks) //Retorna um timer_t para o tempo especificado.
#define timeout(X) (ticks>X?1:0) //TRUE se o tempo especificado na cria��o do timer j� foi transcorrido.

#define BTN_ENTER  (Button(&PORTA, 3, 50, 0))
#define BTN_INCR   (Button(&PORTA, 4, 50, 0))
#define BTN_MANAUT (Button(&PORTA, 5, 50, 0))
#define BTN_V2V    (Button(&PORTC, 0, 50, 0))

#endif