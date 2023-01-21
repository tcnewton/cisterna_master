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

extern TScreen Tela_Inicial;
extern TLabel Label6;
extern TLabel Label7;
extern TLabel Label8;
extern TLabel NvCistP;
extern TLabel NvCist1;
extern TLabel NvCist2;
extern TLabel NvCistR;
extern TLabel Label5;
extern TLine Line3;
extern TLine Line4;
extern TLabel NvCxRua02;
extern TLabel Label25;
extern TLabel * const code Screen1_Labels[10];
extern TLine * const code Screen1_Lines[2];


extern TScreen Misc1;
extern TLabel Label10;
extern TLabel Label11;
extern TLabel Label12;
extern TLabel RT_BP;
extern TLabel Rt_BCist;
extern TLabel ManText;
extern TLabel V2VTxt;
extern TLabel Label17;
extern TLine Line1;
extern TLine Line2;
extern TImage Image4;
extern TLabel Label1;
extern TLabel StatV2V;
extern TLabel * const code Screen2_Labels[10];
extern TImage * const code Screen2_Images[1];
extern TLine * const code Screen2_Lines[2];









extern char Label6_Caption[];
extern char Label7_Caption[];
extern char Label8_Caption[];
extern char NvCistP_Caption[];
extern char NvCist1_Caption[];
extern char NvCist2_Caption[];
extern char NvCistR_Caption[];
extern char Label5_Caption[];
extern char Line3_Caption[];
extern char Line4_Caption[];
extern char NvCxRua02_Caption[];
extern char Label25_Caption[];
extern char Label10_Caption[];
extern char Label11_Caption[];
extern char Label12_Caption[];
extern char RT_BP_Caption[];
extern char Rt_BCist_Caption[];
extern char ManText_Caption[];
extern char V2VTxt_Caption[];
extern char Label17_Caption[];
extern char Line1_Caption[];
extern char Line2_Caption[];
extern char Image4_Caption[];
extern char Label1_Caption[];
extern char StatV2V_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawLine(TLine *Aline);
void Check_TP();
void Start_TP();
#line 1 "c:/users/talles/documents/talles/01_w3e/07-projetos_iot/altavis/glcd/master_glcd/cisterna_code/mikroc pro for pic/defs.h"
#line 33 "C:/Users/Talles/Documents/Talles/01_W3E/07-PROJETOS_IOT/ALTAVIS/GLCD/MASTER_GLCD/CISTERNA_Code/mikroC PRO for PIC/CISTERNA_main.c"
unsigned char lv_cist1 =0;
unsigned char lv_cist2 = 0;
unsigned char lv_cistRua = 0;
unsigned char lv_cxRua = 0;
unsigned char lv_cxRua2 = 0;
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


struct glcd_tmp {
 unsigned char tmp_lv_cist1;
 unsigned char tmp_lv_cist2;
 unsigned char tmp_lv_cistRua;
 unsigned char tmp_RT_pump_cist;
 unsigned char tmp_RT_pump_rua;
 unsigned char tmp_lv_Rua;
 unsigned char tmp_lv_Rua2;
 unsigned char tmp_status_v2v;
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
unsigned long tempoBuzzer;
unsigned char statusV2V=0;

bit SetupMode;
bit flagAlarm;
bit flagBuzzer;
unsigned char setupPos = 0;




void Init_cfgMCU();
 unsigned char  RS484_Init(unsigned char tmp);
 unsigned char  RS485_WaitReturn (char * TxtReturn,  unsigned int  TimeOut);
 unsigned char  SendComand(char* Comand, unsigned char* TxtReturn,  unsigned int  TimeOut);
void DecodificaProtocolo();
void REEnviarDados(unsigned char *retData);
void Timers_Init();
void PrintScreen(unsigned char current);
void SetModeChgVar(unsigned char position);
void set_alarm();
void reset_alarm();
void mute_alarm_off();

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
 PWM1_Init(3000);
 PWM1_Set_Duty(255*80/100);

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
 tempoBuzzer =  (100+ticks) ;

 tmpBtn0 = 1;
 tmpAut = 1;
 tmpBtn1 = 0;
 tmpV2V = 0;
 flagAlarm=1;
 flagBuzzer=1;



 while( 1 )
 {
 Delay_ms(10);
 if(RT_pump_cist||RT_pump_rua||!lv_cist1||!lv_cist2)set_alarm();
 else
 {
 reset_alarm();
 mute_alarm_off();
 }

 if(tmp_glcd.tmp_lv_cist1!=lv_cist1 || tmp_glcd.tmp_lv_cist2!=lv_cist2 || tmp_glcd.tmp_lv_cistRua != lv_cistRua ||
 tmp_glcd.tmp_RT_pump_rua != RT_pump_rua || tmp_glcd.tmp_RT_pump_cist != RT_pump_cist || tmp_glcd.tmp_lv_Rua != lv_cxRua ||
 tmp_glcd.tmp_status_v2v != statusV2V || tmp_glcd.tmp_lv_Rua2 != lv_cxRua2)
 {
 PrintScreen(curr_screen);

 tmp_glcd.tmp_lv_cist1=lv_cist1;
 tmp_glcd.tmp_lv_cist2=lv_cist2;
 tmp_glcd.tmp_lv_cistRua = lv_cistRua;
 tmp_glcd.tmp_RT_pump_rua = RT_pump_rua;
 tmp_glcd.tmp_RT_pump_cist = RT_pump_cist;
 tmp_glcd.tmp_lv_Rua = lv_cxRua;
 tmp_glcd.tmp_status_v2v = statusV2V;
 tmp_glcd.tmp_lv_Rua2 = lv_cxRua2;
 }
 if( (Button(&PORTA, 4, 50, 0)) )
 {
 if(SetupMode==0)
 {
 ++curr_screen;
 if(curr_screen>1)curr_screen=0;
 }
 else
 {
 SetModeChgVar(setupPos);
 }
 PrintScreen(curr_screen);
 }
 if( (Button(&PORTA, 3, 50, 0))  && curr_screen == 1)
 {
 SetupMode=1;
 ++setupPos;
 Image4.Visible=1;
 if(setupPos==1)Image4.Top = 41;
 if(setupPos==2)Image4.Top = 53;
 if(setupPos==3)
 {
 SetupMode=0;
 setupPos = 0;
 Image4.Visible=0;
 }
 PrintScreen(curr_screen);
 }
 if( (Button(&PORTA, 3, 50, 0))  && curr_screen == 0)
 {
 flagAlarm^=1;
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
#line 242 "C:/Users/Talles/Documents/Talles/01_W3E/07-PROJETOS_IOT/ALTAVIS/GLCD/MASTER_GLCD/CISTERNA_Code/mikroC PRO for PIC/CISTERNA_main.c"
 PORTA.RA2 = 0;
 TRISC.TRISC0 = 1;
 TRISC.TRISC2=0;
 ANSELE = 0;
 TRISE.TRISE1=0;
 PORTE.RE1 = 0;
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
 if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '6')lv_cxRua2 =(Dta[3]-'0');
 else
 if(Dta[0] == 'S' && Dta[1] == 'T' && Dta[2] == 'A')statusV2V =(Dta[3]-'0');
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
#line 286 "C:/Users/Talles/Documents/Talles/01_W3E/07-PROJETOS_IOT/ALTAVIS/GLCD/MASTER_GLCD/CISTERNA_Code/mikroC PRO for PIC/CISTERNA_main.c"
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

void PrintScreen(unsigned char current)
{
 switch (current)
 {
 case 0:
 if(lv_cistRua==0)strcpy(NvCistP.Caption, "Vazia");
 else strcpy(NvCistP.Caption, "Cheia");
 if(lv_cist1==0)strcpy(NvCist1.Caption, "Vazia");
 else strcpy(NvCist1.Caption, "Cheia");
 if(lv_cist2==0)strcpy(NvCist2.Caption, "Vazia");
 else strcpy(NvCist2.Caption, "Cheia");
 if(lv_cxRua==0)strcpy(NvCistR.Caption, "Vazia");
 else strcpy(NvCistR.Caption, "Cheia");
 if(lv_cxRua2==0)strcpy(NvCxRua02.Caption, "Vazia");
 else strcpy(NvCxRua02.Caption, "Cheia");
 DrawScreen(&Tela_Inicial);
 break;
 case 1:
 if(RT_pump_rua==0)strcpy(RT_BP.Caption, "Normal");
 else strcpy(RT_BP.Caption, "Alarm");
 if(RT_pump_cist==0)strcpy(Rt_BCist.Caption, "Normal");
 else strcpy(Rt_BCist.Caption, "Alarm");
 if(tmpAut==0)strcpy(ManText.Caption, "Man");
 else strcpy(ManText.Caption, "Aut");
 if(tmpV2V==0)strcpy(V2VTxt.Caption, "Off");
 else strcpy(V2VTxt.Caption, "On");
 if(statusV2V==0)strcpy(StatV2V.Caption, "Off");
 else strcpy(StatV2V.Caption, "On");
 DrawScreen(&Misc1);
 break;
 }
}

void SetModeChgVar(unsigned char position)
{
 if(position==1)
 {
 tmpAut ^= 1;
 ctrl_msg = (tmpAut==0)?0:1;
 }
 if(position==2)
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

 if(tmpAut==0)strcpy(ManText.Caption, "Man");
 else strcpy(ManText.Caption, "Aut");
 if(tmpV2V==0)strcpy(V2VTxt.Caption, "Off");
 else strcpy(V2VTxt.Caption, "On");
 }
 tmpBtn0=tmpAut;
 tmpBtn1=tmpV2V;
 PORTA.RA2= 0;
}

void set_alarm()
{
 if(flagAlarm)
 {
 if(! (ticks>tempoBuzzer?1:0) )return;
 if(flagBuzzer)
 PWM1_Start();
 else
 reset_alarm();
 flagBuzzer^=1;
 tempoBuzzer= (100+ticks) ;
 }
 else
 PWM1_Stop();
}

void reset_alarm()
{
 PWM1_Stop();
}

void mute_alarm_off()
{
 flagAlarm=1;
}
