#line 1 "C:/Users/Talles/Documents/Talles/01_W3E/07-PROJETOS_IOT/ALTAVIS/GLCD/MASTER_GLCD/CISTERNA_Code/mikroC PRO for PIC/CISTERNA_main.c"
#line 1 "c:/users/talles/documents/talles/01_w3e/07-projetos_iot/altavis/glcd/master_glcd/cisterna_code/mikroc pro for pic/cisterna_objects.h"
enum GlcdColor {_clClear, _clDraw, _clInvert};
typedef struct Screen TScreen;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 char Left;
 char Top;
 char Width;
 char Height;
 char *Caption;
 const char *FontName;
 unsigned char Font_Color;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 char Left;
 char Top;
 char Width;
 char Height;
 char PictureWidth;
 char PictureHeight;
 const char *Picture_Name;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef struct Line {
 TScreen* OwnerScreen;
 char Order;
 char First_Point_X;
 char First_Point_Y;
 char Second_Point_X;
 char Second_Point_Y;
 char Visible;
} TLine;

struct Screen {
 unsigned short ObjectsCount;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int LinesCount;
 TLine * const code *Lines;
};

extern TScreen Screen1;
extern TImage Image1;
extern TLabel Label1;
extern TImage Image2;
extern TLabel Label2;
extern TLabel Label3;
extern TImage Image3;
extern TLabel Label4;
extern TLabel * const code Screen1_Labels[4];
extern TImage * const code Screen1_Images[3];


extern TScreen Tela_Inicial;
extern TLabel Label6;
extern TLabel Label7;
extern TLabel Label8;
extern TLabel NvCistP;
extern TLabel NvCist1;
extern TLabel NvCist2;
extern TLabel NvCistR;
extern TLabel Label5;
extern TLabel Label9;
extern TLine Line3;
extern TLine Line4;
extern TLabel * const code Screen2_Labels[9];
extern TLine * const code Screen2_Lines[2];


extern TScreen Screen2;
extern TLabel Label10;
extern TLabel Label11;
extern TLabel Label12;
extern TLabel RT_BP;
extern TLabel Label14;
extern TLabel Label15;
extern TLabel Label16;
extern TLabel Label17;
extern TLabel Label18;
extern TLine Line1;
extern TLine Line2;
extern TImage Image4;
extern TLabel * const code Screen3_Labels[9];
extern TImage * const code Screen3_Images[1];
extern TLine * const code Screen3_Lines[2];









extern char Image1_Caption[];
extern char Label1_Caption[];
extern char Image2_Caption[];
extern char Label2_Caption[];
extern char Label3_Caption[];
extern char Image3_Caption[];
extern char Label4_Caption[];
extern char Label6_Caption[];
extern char Label7_Caption[];
extern char Label8_Caption[];
extern char NvCistP_Caption[];
extern char NvCist1_Caption[];
extern char NvCist2_Caption[];
extern char NvCistR_Caption[];
extern char Label5_Caption[];
extern char Label9_Caption[];
extern char Line3_Caption[];
extern char Line4_Caption[];
extern char Label10_Caption[];
extern char Label11_Caption[];
extern char Label12_Caption[];
extern char RT_BP_Caption[];
extern char Label14_Caption[];
extern char Label15_Caption[];
extern char Label16_Caption[];
extern char Label17_Caption[];
extern char Label18_Caption[];
extern char Line1_Caption[];
extern char Line2_Caption[];
extern char Image4_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawLine(TLine *Aline);
void Check_TP();
void Start_TP();
#line 1 "c:/users/talles/documents/talles/01_w3e/07-projetos_iot/altavis/glcd/master_glcd/cisterna_code/mikroc pro for pic/defs.h"
#line 32 "C:/Users/Talles/Documents/Talles/01_W3E/07-PROJETOS_IOT/ALTAVIS/GLCD/MASTER_GLCD/CISTERNA_Code/mikroC PRO for PIC/CISTERNA_main.c"
unsigned char lv_cist1 =0;
unsigned char lv_cist2 = 0;
unsigned char lv_cistRua = 0;
unsigned char lv_cxRua = 0;
unsigned char RT_pump_cist=0;
unsigned char RT_pump_rua=0;
unsigned char V2V_On;
unsigned char MAN_AUT;
unsigned char tmpAut, tmpV2V, tmpBtn0, tmpBtn1;
 unsigned char  flagSndMsg;
unsigned char flagCMD1 =0;
unsigned char flagCMD2 =0;
static  unsigned int  _tout = 400;
unsigned char ctrl_msg;
unsigned char curr_screen =0;
unsigned char setupMode = 0;


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
volatile unsigned long int ticks = 0;
unsigned long tempoLed;
unsigned long tempoSmsg;


void Init_cfgMCU();
 unsigned char  RS484_Init(unsigned char tmp);
 unsigned char  RS485_WaitReturn (char * TxtReturn,  unsigned int  TimeOut);
 unsigned char  SendComand(char* Comand, unsigned char* TxtReturn,  unsigned int  TimeOut);
void DecodificaProtocolo();
void REEnviarDados(unsigned char *retData);
void Timers_Init();

void UART_RCV() iv 0x0008 ics ICS_AUTO
{
 unsigned char sdata;
 if(TMR0IF_bit == 1 && TMR0IE_bit == 1)
 {
 ++ticks;
 TMR0H = 0x63;
 TMR0L = 0xC0;
 TMR0IF_bit = 0;
 }
 else
 if(PIR1.RC1IF == 1 && PIE1.RC1IE == 1)
 {
 sdata = UART1_Read();
 if(sdata == '[')
 {
 Pot = Dta;
 _Aux = 1;
 }
 else
 if(sdata == ']' && _Aux == 1)
 {
 _Aux = 0;


 DecodificaProtocolo();
 }
 else
 if (_Aux == 1)
 {
 *Pot = sdata;
 ++Pot;

 }
 PIR1.RC1IF = 0;
 }
}



void main() {
 Start_TP();
 Init_cfgMCU();
 UART1_Init(9600);
 Delay_ms(100);

 INTCON.GIEH = 1;
 INTCON.GIEL = 1;
 RCON.IPEN = 1;


 PIR1.RC1IF = 0;
 IPR1.RC1IP = 1;
 PIE1.RC1IE = 1;


 Delay_ms(500);
 Timers_Init();
 tempoLed =  (2+ticks) ;
 tempoSmsg =  (20+ticks) ;

 tmpBtn0 = 0;
 tmpBtn1 = 0;
 tmpAut = 1;
 tmpV2V = 0;

 while( 1 )
 {
 Delay_ms(10);

 if( (Button(&PORTA, 5, 50, 0)) )
 {
 tmpAut ^= 1;
 ctrl_msg = (tmpAut==0)?0:1;
 }
 if( (Button(&PORTA, 6, 50, 0)) )
 {
 tmpV2V ^= 1;

 ctrl_msg = (tmpV2V==0)?2:3;
 }
 if(tmpAut!=tmpBtn0 || tmpV2V!=tmpBtn1)
 {
 while(!RS484_Init(ctrl_msg))
 {
 PORTA.RA2 ^= 1;
 Delay_ms(500);

 }
 tmpBtn0=tmpAut;
 tmpBtn1=tmpV2V;
 PORTA.RA2= 0;
 }

 if(tmp_glcd.tmp_lv_cist1!=lv_cist1 || tmp_glcd.tmp_lv_cist2!=lv_cist2 || tmp_glcd.tmp_lv_cistRua != lv_cistRua || tmp_glcd.tmp_RT_pump_rua)
 {


 }
 if( (Button(&PORTA, 4, 50, 0)) )
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
 ANSELD = 0;
 TRISA.TRISA2 = 0;
 TRISA.TRISA3 = 1;
 TRISA.TRISA4 = 1;
 TRISA.TRISA5 = 1;
 TRISA.TRISA6 = 1;
#line 210 "C:/Users/Talles/Documents/Talles/01_W3E/07-PROJETOS_IOT/ALTAVIS/GLCD/MASTER_GLCD/CISTERNA_Code/mikroC PRO for PIC/CISTERNA_main.c"
 PORTA.RA2 = 0;
 PORTA.RA3=1;
 PORTA.RA4=1;
 PORTA.RA5=1;
 PORTA.RA6=1;
}

void DecodificaProtocolo()
 {

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
 if(Dta[0] == 'C' && Dta[1] == '2' && Dta[2] == 'O' && Dta[3] == 'K')flagCMD1=1;
 }

  unsigned char  SendComand(char* Comand,unsigned char* TxtReturn,  unsigned int  TimeOut)
{
 while(*Comand != 0)
 {
 UART1_Write(*Comand);
 Comand++;
 }
#line 253 "C:/Users/Talles/Documents/Talles/01_W3E/07-PROJETOS_IOT/ALTAVIS/GLCD/MASTER_GLCD/CISTERNA_Code/mikroC PRO for PIC/CISTERNA_main.c"
 return RS485_WaitReturn(TxtReturn, TimeOut);
}

 unsigned char  RS485_WaitReturn (unsigned char* TxtReturn,  unsigned int  TimeOut)
{
  unsigned long  tempo;
 tempo =  (TimeOut+ticks) ;
 while((_tout == 0) || (! (ticks>tempo?1:0) ))
 {
 if(*TxtReturn==1)
 {
 *TxtReturn = 0;
 return  1 ;
 }
 }
 return  0 ;
}

 unsigned char  RS484_Init(unsigned char tmp)
{
  unsigned char  result =  1 ;
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
 UART1_Write('[');

 while(*retData != 0)
 {
 UART1_Write(*retData);
 ++retData;
 }

 UART1_Write(']');
}

void Timers_Init()
{
 T0CON = 0x88;
 TMR0IF_bit = 0;
 INTCON2.TMR0IP = 1;
 TMR0IE_bit = 1;
 TMR0H = 0x63;
 TMR0L = 0xC0;
 TMR0ON_bit = 1;
}
