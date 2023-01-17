/*
 * Project name:
     CISTERNA.vglcd
 * Generated by:
     Visual GLCD
 * Date of creation
     10/01/2023
 * Time of creation
     22:15:51
 * Test configuration:
     MCU:             P18F45K22
     Dev.Board:       EasyPIC_v7_Connectivity
                      http://www.mikroe.com/easypic/
     Oscillator:      32000000 Hz
     SW:              mikroC PRO for PIC
                      http://www.mikroe.com/eng/products/view/7/mikroc-pro-for-pic/
 */

#include "CISTERNA_objects.h"
#include "defs.h"


/*
 EASYPIC V7
 SW1.1 ->ON (RC7-RX USB-UART)
 SW2.1 ->ON (RC6-RX USB-UART)
 SW3.1 ->ON (LED ON PORTA/E)
 SW4.6 ->Lcd ON
 PULL-UP RA3..RA6
*/

unsigned char lv_cist1 =0;
unsigned char lv_cist2 = 0;
unsigned char lv_cistRua = 0;
unsigned char lv_cxRua = 0;
unsigned char RT_pump_cist=0;
unsigned char RT_pump_rua=0;
unsigned char V2V_On;
unsigned char MAN_AUT;
unsigned char tmpAut, tmpV2V, tmpBtn0, tmpBtn1;
bool_t flagSndMsg;
unsigned char flagCMD1 =0;
unsigned char flagCMD2 =0;//flag for C2OK
static uint16_t _tout = 400;
unsigned char ctrl_msg;
unsigned char curr_screen =0;
unsigned char setupMode = 0;

/* Structure defining struct glcd */
struct glcd_tmp {
  unsigned char tmp_lv_cist1;
  unsigned char tmp_lv_cist2;
  unsigned char tmp_lv_cistRua;
  unsigned char tmp_RT_pump_cist;
  unsigned char tmp_RT_pump_rua;
} tmp_glcd;



unsigned char FlagAutoReuso = 0;
unsigned char FlagLigaV2V = 0;
unsigned char FlagReenvmsg1 = 0;
unsigned char FlagReenvmsg2 = 0;
unsigned char _Aux=0;
unsigned char Dta[20];
unsigned char *Pot;
unsigned char ii;
volatile unsigned long int ticks = 0;  //Vari�vel respons�vel por armazenar o incremento do Tick Timer
unsigned long tempoLed;
unsigned long tempoSmsg;


void Init_cfgMCU();
bool_t RS484_Init(unsigned char tmp);
bool_t RS485_WaitReturn (char * TxtReturn, uint16_t TimeOut);
bool_t SendComand(char* Comand, unsigned char* TxtReturn, uint16_t TimeOut);
void DecodificaProtocolo();
void REEnviarDados(unsigned char *retData);
void Timers_Init();

void UART_RCV() iv 0x0008 ics ICS_AUTO
{
 unsigned char sdata;
   if(TMR0IF_bit == 1 && TMR0IE_bit == 1)
   {
    ++ticks;
    TMR0H         = 0x63;
    TMR0L         = 0xC0; //20 ms
    TMR0IF_bit = 0;
   }
   else
   if(PIR1.RC1IF == 1 && PIE1.RC1IE == 1)
   {
    sdata = UART1_Read();
      if(sdata == '[')     //Ex: [V2V01] - [AUT]
       {
         Pot = Dta;       //Salva o endere�o da matriz no ponteiro
         _Aux = 1;        //Flag que informa o in�cio do protocolo
       }
       else
          if(sdata == ']' && _Aux == 1)
           {
              _Aux = 0;
              //Buffer (Dta) est� cheio! -> LEDD01
              //Decodificar o Pacote
              DecodificaProtocolo();
           }
            else
              if (_Aux == 1)
               {
                 *Pot = sdata;
                  ++Pot;
                  //N�o podemos incrementar Pot al�m do comprimento de Dta
               }
    PIR1.RC1IF = 0;
   }
}



void main() {
  Start_TP();
  Init_cfgMCU();
  UART1_Init(9600);
  Delay_ms(100);
  //Configura��o Geral
   INTCON.GIEH = 1;
   INTCON.GIEL = 1;
   RCON.IPEN = 1;

   //Configura��o da interrup��o Serial
   PIR1.RC1IF = 0;
   IPR1.RC1IP = 1;
   PIE1.RC1IE = 1;

   //Configura��o interrup��o timer0
   Delay_ms(500);
   Timers_Init();
   tempoLed = start_timer(2);
   tempoSmsg = start_timer(20);
   // initial conditions
   tmpBtn0 = 0;
   tmpBtn1 = 0;
   tmpAut = 1;//modo automatico
   tmpV2V = 0;//condi��o inicial fechada

  while(TRUE)
    {
      Delay_ms(10);
      
      if(BTN_MANAUT)//RA5
      {
       tmpAut ^= 1; //toggle tmpAut
       ctrl_msg = (tmpAut==0)?0:1;
      }
      if(BTN_V2V) //RA6
      {
       tmpV2V ^= 1; //toggle tmpAut
       /*if(tmpAut==1)tmpBtn1 = tmpV2V;*/
       ctrl_msg = (tmpV2V==0)?2:3;
      }
      if(tmpAut!=tmpBtn0 || tmpV2V!=tmpBtn1) //comparativo para enviar msg
      {
       while(!RS484_Init(ctrl_msg))
       {
        PORTA.RA2 ^= 1;        //Enquanto o m�dulo n�o receber cofirma��o de recebimento de cmd
        Delay_ms(500);         //Retorna 1 se retorno ocorrer com sucesso.
                               //Retorna 0 se retorno falhar.
       }
       tmpBtn0=tmpAut;   //confirma comparativo
       tmpBtn1=tmpV2V;   //confirma comparativo
       PORTA.RA2= 0; //desliga led
      }
      //condi��es para atualizar tela GLCD
      if(tmp_glcd.tmp_lv_cist1!=lv_cist1 || tmp_glcd.tmp_lv_cist2!=lv_cist2 || tmp_glcd.tmp_lv_cistRua != lv_cistRua || tmp_glcd.tmp_RT_pump_rua)
      {
      
      
      }
      if(BTN_INCR)
      {
        ++curr_screen;
        if(curr_screen>2)curr_screen=0;
        switch (curr_screen)
        {
          case 0:
          DrawScreen(&Tela_Inicial);
          break;
          case 1:
          DrawScreen(&Screen2);
          break;
          case 2:
          DrawScreen(&Screen1);
          break;
        }
      }
    }
}

void Init_cfgMCU()
{
   ANSELD = 0;      //PORTD como I/O digital
   TRISA.TRISA2 = 0; //output
   TRISA.TRISA3 = 1; //enter button
   TRISA.TRISA4 = 1; //increase button
   TRISA.TRISA5 = 1; //botao manual automatico (input)
   TRISA.TRISA6 = 1; //botao liga valvula (input)
   /*TRISA.TRISA1 = 1; //inputs
   TRISA.TRISA2 = 1;*/
   PORTA.RA2 = 0;
   PORTA.RA3=1;
   PORTA.RA4=1;
   PORTA.RA5=1;
   PORTA.RA6=1;
}

void DecodificaProtocolo()
 {
  //(Dta) -> [C1OK]  - return of comand
  if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '0')lv_cist1=(Dta[3]-'0');
  else
  if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '1')lv_cist2=(Dta[3]-'0');
  else
  if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '2')lv_cistRua =(Dta[3]-'0');
  else
  if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '3')lv_cxRua =(Dta[3]-'0');
  else
  if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '4')RT_pump_cist =(Dta[3]-'0');
  else
  if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '5')RT_pump_rua =(Dta[3]-'0');
  else
  if(Dta[0] == 'V' && Dta[1] == '2' && Dta[2] == 'V')V2V_On =(Dta[3]-'0');
  else
  if(Dta[0] == 'A' && Dta[1] == 'U' && Dta[2] == 'T')MAN_AUT =(Dta[3]-'0');
  else
  if(Dta[0] == 'C' && Dta[1] == '1' && Dta[2] == 'O' && Dta[3] == 'K')flagCMD2=1;
  else
  if(Dta[0] == 'C' && Dta[1] == '2' && Dta[2] == 'O' && Dta[3] == 'K')flagCMD1=1;//Todo valor (0 a 9) ASCII pode ser convertido para n�mero subtraindo por '0'
 }

 bool_t SendComand(char* Comand,unsigned char* TxtReturn, uint16_t TimeOut)
{
   while(*Comand != 0)
   {
     UART1_Write(*Comand); //Envia Comando RS485
     Comand++;
   }
   /*
    E depois...
    Trata o retorno do RS485 em outra fun��o, pois individualiza as fun��es para
    uso futuro.
   */
   return RS485_WaitReturn(TxtReturn, TimeOut);  //Chama fun��o que trata os retornos
}

bool_t RS485_WaitReturn (unsigned char* TxtReturn, uint16_t TimeOut)
{
   timer_t tempo;
   tempo = start_timer(TimeOut);
   while((_tout == 0) || (!timeout(tempo)))
   {   //Usa timeOut padr�o _tout
      if(*TxtReturn==1) //received return
      {
         *TxtReturn = 0;
         return TRUE;    // toda a sequ�ncia foi varrida: fim.
      }
   }
   return FALSE;
}

bool_t RS484_Init(unsigned char tmp)
{
  bool_t result = TRUE;
  switch(tmp)
  {
    case 0:
    result = result & SendComand("[AUT0]",&flagCMD1,20);
    break;
    case 1:
    result = result & SendComand("[AUT1]",&flagCMD1,20);
    break;
    case 2:
    result = result & SendComand("[V2V0]",&flagCMD2,20);
    break;
    case 3:
    result = result & SendComand("[V2V1]",&flagCMD2,20);
    break;
  }
  return result;
}

 void REEnviarDados(unsigned char *retData)
{
  UART1_Write('[');       //inicio do protocolo

    while(*retData != 0)
    {
      UART1_Write(*retData);   //Conte�do do protocolo
      ++retData;
    }

   UART1_Write(']');    //fim do protocolo
}

void Timers_Init()
{
 T0CON         = 0x88;
 TMR0IF_bit = 0;
 INTCON2.TMR0IP = 1;
 TMR0IE_bit         = 1;
 TMR0H         = 0x63;
 TMR0L         = 0xC0; //20 ms
 TMR0ON_bit = 1;
}