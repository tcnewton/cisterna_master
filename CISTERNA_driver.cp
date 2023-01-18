#line 1 "C:/Users/Talles/Documents/Talles/01_W3E/07-PROJETOS_IOT/ALTAVIS/GLCD/MASTER_GLCD/CISTERNA_Code/mikroC PRO for PIC/CISTERNA_driver.c"
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
extern TLabel Label9;
extern TLine Line3;
extern TLine Line4;
extern TLabel * const code Screen1_Labels[9];
extern TLine * const code Screen1_Lines[2];


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
extern TLabel * const code Screen2_Labels[9];
extern TImage * const code Screen2_Images[1];
extern TLine * const code Screen2_Lines[2];


extern TScreen Screen_cxRua;
extern TLabel NvCxRua02;
extern TLabel Label25;
extern TLabel Label26;
extern TLine Line5;
extern TLine Line6;
extern TLabel * const code Screen3_Labels[3];
extern TLine * const code Screen3_Lines[2];









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
extern char NvCxRua02_Caption[];
extern char Label25_Caption[];
extern char Label26_Caption[];
extern char Line5_Caption[];
extern char Line6_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawLine(TLine *Aline);
void Check_TP();
void Start_TP();
#line 1 "c:/users/talles/documents/talles/01_w3e/07-projetos_iot/altavis/glcd/master_glcd/cisterna_code/mikroc pro for pic/cisterna_resources.h"
const code char Bahnschrift_SemiBold8x11_Regular[];
const code char Constantia9x11_Regular[];
const code char seta_bmp[6];
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 7 "C:/Users/Talles/Documents/Talles/01_W3E/07-PROJETOS_IOT/ALTAVIS/GLCD/MASTER_GLCD/CISTERNA_Code/mikroC PRO for PIC/CISTERNA_driver.c"
char GLCD_DataPort at PORTD;
sbit GLCD_CS1 at LATB0_bit;
sbit GLCD_CS2 at LATB1_bit;
sbit GLCD_RS at LATB2_bit;
sbit GLCD_RW at LATB3_bit;
sbit GLCD_EN at LATB4_bit;
sbit GLCD_RST at LATB5_bit;
sbit GLCD_CS1_Direction at TRISB0_bit;
sbit GLCD_CS2_Direction at TRISB1_bit;
sbit GLCD_RS_Direction at TRISB2_bit;
sbit GLCD_RW_Direction at TRISB3_bit;
sbit GLCD_EN_Direction at TRISB4_bit;
sbit GLCD_RST_Direction at TRISB5_bit;



sbit DriveA at LATC0_bit;
sbit DriveB at LATC1_bit;
sbit DriveA_Direction at TRISC0_bit;
sbit DriveB_Direction at TRISC1_bit;



unsigned int Xcoord, Ycoord;
const ADC_THRESHOLD = 900;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int Glcd_caption_length, Glcd_caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TImage *local_image;
TImage *exec_image;
int image_order;


static void InitializeTouchPanel() {
 Glcd_Init();
 Glcd_Fill(0);

}



 TScreen* CurrentScreen;

 TScreen Tela_Inicial;
 TLabel Label6;
char Label6_Caption[20] = "Nv. Cist A        :";

 TLabel Label7;
char Label7_Caption[20] = "Nv. Cist B        :";

 TLabel Label8;
char Label8_Caption[18] = "Nv. Cx Rua      :";

 TLabel NvCistP;
char NvCistP_Caption[6] = "Vazia";

 TLabel NvCist1;
char NvCist1_Caption[6] = "Vazia";

 TLabel NvCist2;
char NvCist2_Caption[6] = "Vazia";

 TLabel NvCistR;
char NvCistR_Caption[6] = "Vazia";

 TLabel Label5;
char Label5_Caption[17] = "Nv. Cist Princ :";

 TLabel Label9;
char Label9_Caption[20] = "Nivel Caixas D\'agua";

 TLine Line3;
 TLine Line4;
 TLabel * const code Screen1_Labels[9]=
 {
 &Label6,
 &Label7,
 &Label8,
 &NvCistP,
 &NvCist1,
 &NvCist2,
 &NvCistR,
 &Label5,
 &Label9
 };
 TLine * const code Screen1_Lines[2]=
 {
 &Line3,
 &Line4
 };


 TScreen Screen2;
 TLabel Label10;
char Label10_Caption[17] = "Rele Termico BC:";

 TLabel Label11;
char Label11_Caption[16] = "Modo Man-Aut  :";

 TLabel Label12;
char Label12_Caption[22] = "Status V2V          :";

 TLabel RT_BP;
char RT_BP_Caption[7] = "Normal";

 TLabel Label14;
char Label14_Caption[7] = "Normal";

 TLabel Label15;
char Label15_Caption[4] = "Man";

 TLabel Label16;
char Label16_Caption[4] = "Off";

 TLabel Label17;
char Label17_Caption[17] = "Rele Termico BP:";

 TLabel Label18;
char Label18_Caption[14] = "Miscellaneous";

 TLine Line1;
 TLine Line2;
 TImage Image4;
 TLabel * const code Screen2_Labels[9]=
 {
 &Label10,
 &Label11,
 &Label12,
 &RT_BP,
 &Label14,
 &Label15,
 &Label16,
 &Label17,
 &Label18
 };
 TImage * const code Screen2_Images[1]=
 {
 &Image4
 };
 TLine * const code Screen2_Lines[2]=
 {
 &Line1,
 &Line2
 };


 TScreen Screen_cxRua;
 TLabel NvCxRua02;
char NvCxRua02_Caption[6] = "Vazia";

 TLabel Label25;
char Label25_Caption[16] = "Nv. Cx Rua 02 :";

 TLabel Label26;
char Label26_Caption[20] = "Nivel Caixas D\'agua";

 TLine Line5;
 TLine Line6;
 TLabel * const code Screen3_Labels[3]=
 {
 &NvCxRua02,
 &Label25,
 &Label26
 };
 TLine * const code Screen3_Lines[2]=
 {
 &Line5,
 &Line6
 };




static void InitializeObjects() {
 Tela_Inicial.LabelsCount = 9;
 Tela_Inicial.Labels = Screen1_Labels;
 Tela_Inicial.ImagesCount = 0;
 Tela_Inicial.LinesCount = 2;
 Tela_Inicial.Lines = Screen1_Lines;
 Tela_Inicial.ObjectsCount = 11;

 Screen2.LabelsCount = 9;
 Screen2.Labels = Screen2_Labels;
 Screen2.ImagesCount = 1;
 Screen2.Images = Screen2_Images;
 Screen2.LinesCount = 2;
 Screen2.Lines = Screen2_Lines;
 Screen2.ObjectsCount = 12;

 Screen_cxRua.LabelsCount = 3;
 Screen_cxRua.Labels = Screen3_Labels;
 Screen_cxRua.ImagesCount = 0;
 Screen_cxRua.LinesCount = 2;
 Screen_cxRua.Lines = Screen3_Lines;
 Screen_cxRua.ObjectsCount = 5;


 Label6.OwnerScreen = &Tela_Inicial;
 Label6.Order = 0;
 Label6.Left = 6;
 Label6.Top = 25;
 Label6.Width = 61;
 Label6.Height = 12;
 Label6.Visible = 1;
 Label6.Active = 1;
 Label6.Caption = Label6_Caption;
 Label6.FontName = Constantia9x11_Regular;
 Label6.Font_Color = 1;
 Label6.OnUpPtr = 0;
 Label6.OnDownPtr = 0;
 Label6.OnClickPtr = 0;
 Label6.OnPressPtr = 0;

 Label7.OwnerScreen = &Tela_Inicial;
 Label7.Order = 1;
 Label7.Left = 6;
 Label7.Top = 38;
 Label7.Width = 61;
 Label7.Height = 12;
 Label7.Visible = 1;
 Label7.Active = 1;
 Label7.Caption = Label7_Caption;
 Label7.FontName = Constantia9x11_Regular;
 Label7.Font_Color = 1;
 Label7.OnUpPtr = 0;
 Label7.OnDownPtr = 0;
 Label7.OnClickPtr = 0;
 Label7.OnPressPtr = 0;

 Label8.OwnerScreen = &Tela_Inicial;
 Label8.Order = 2;
 Label8.Left = 6;
 Label8.Top = 50;
 Label8.Width = 61;
 Label8.Height = 12;
 Label8.Visible = 1;
 Label8.Active = 1;
 Label8.Caption = Label8_Caption;
 Label8.FontName = Constantia9x11_Regular;
 Label8.Font_Color = 1;
 Label8.OnUpPtr = 0;
 Label8.OnDownPtr = 0;
 Label8.OnClickPtr = 0;
 Label8.OnPressPtr = 0;

 NvCistP.OwnerScreen = &Tela_Inicial;
 NvCistP.Order = 3;
 NvCistP.Left = 93;
 NvCistP.Top = 13;
 NvCistP.Width = 22;
 NvCistP.Height = 12;
 NvCistP.Visible = 1;
 NvCistP.Active = 1;
 NvCistP.Caption = NvCistP_Caption;
 NvCistP.FontName = Constantia9x11_Regular;
 NvCistP.Font_Color = 1;
 NvCistP.OnUpPtr = 0;
 NvCistP.OnDownPtr = 0;
 NvCistP.OnClickPtr = 0;
 NvCistP.OnPressPtr = 0;

 NvCist1.OwnerScreen = &Tela_Inicial;
 NvCist1.Order = 4;
 NvCist1.Left = 93;
 NvCist1.Top = 25;
 NvCist1.Width = 22;
 NvCist1.Height = 12;
 NvCist1.Visible = 1;
 NvCist1.Active = 1;
 NvCist1.Caption = NvCist1_Caption;
 NvCist1.FontName = Constantia9x11_Regular;
 NvCist1.Font_Color = 1;
 NvCist1.OnUpPtr = 0;
 NvCist1.OnDownPtr = 0;
 NvCist1.OnClickPtr = 0;
 NvCist1.OnPressPtr = 0;

 NvCist2.OwnerScreen = &Tela_Inicial;
 NvCist2.Order = 5;
 NvCist2.Left = 93;
 NvCist2.Top = 38;
 NvCist2.Width = 22;
 NvCist2.Height = 12;
 NvCist2.Visible = 1;
 NvCist2.Active = 1;
 NvCist2.Caption = NvCist2_Caption;
 NvCist2.FontName = Constantia9x11_Regular;
 NvCist2.Font_Color = 1;
 NvCist2.OnUpPtr = 0;
 NvCist2.OnDownPtr = 0;
 NvCist2.OnClickPtr = 0;
 NvCist2.OnPressPtr = 0;

 NvCistR.OwnerScreen = &Tela_Inicial;
 NvCistR.Order = 6;
 NvCistR.Left = 93;
 NvCistR.Top = 50;
 NvCistR.Width = 22;
 NvCistR.Height = 12;
 NvCistR.Visible = 1;
 NvCistR.Active = 1;
 NvCistR.Caption = NvCistR_Caption;
 NvCistR.FontName = Constantia9x11_Regular;
 NvCistR.Font_Color = 1;
 NvCistR.OnUpPtr = 0;
 NvCistR.OnDownPtr = 0;
 NvCistR.OnClickPtr = 0;
 NvCistR.OnPressPtr = 0;

 Label5.OwnerScreen = &Tela_Inicial;
 Label5.Order = 7;
 Label5.Left = 6;
 Label5.Top = 13;
 Label5.Width = 60;
 Label5.Height = 12;
 Label5.Visible = 1;
 Label5.Active = 1;
 Label5.Caption = Label5_Caption;
 Label5.FontName = Constantia9x11_Regular;
 Label5.Font_Color = 1;
 Label5.OnUpPtr = 0;
 Label5.OnDownPtr = 0;
 Label5.OnClickPtr = 0;
 Label5.OnPressPtr = 0;

 Label9.OwnerScreen = &Tela_Inicial;
 Label9.Order = 8;
 Label9.Left = 6;
 Label9.Top = 1;
 Label9.Width = 81;
 Label9.Height = 10;
 Label9.Visible = 1;
 Label9.Active = 1;
 Label9.Caption = Label9_Caption;
 Label9.FontName = Bahnschrift_SemiBold8x11_Regular;
 Label9.Font_Color = 1;
 Label9.OnUpPtr = 0;
 Label9.OnDownPtr = 0;
 Label9.OnClickPtr = 0;
 Label9.OnPressPtr = 0;

 Line3.OwnerScreen = &Tela_Inicial;
 Line3.Order = 9;
 Line3.First_Point_X = 3;
 Line3.First_Point_Y = 61;
 Line3.Second_Point_X = 119;
 Line3.Second_Point_Y = 61;
 Line3.Visible = 1;

 Line4.OwnerScreen = &Tela_Inicial;
 Line4.Order = 10;
 Line4.First_Point_X = 3;
 Line4.First_Point_Y = 12;
 Line4.Second_Point_X = 119;
 Line4.Second_Point_Y = 12;
 Line4.Visible = 1;

 Label10.OwnerScreen = &Screen2;
 Label10.Order = 0;
 Label10.Left = 6;
 Label10.Top = 25;
 Label10.Width = 70;
 Label10.Height = 12;
 Label10.Visible = 1;
 Label10.Active = 1;
 Label10.Caption = Label10_Caption;
 Label10.FontName = Constantia9x11_Regular;
 Label10.Font_Color = 1;
 Label10.OnUpPtr = 0;
 Label10.OnDownPtr = 0;
 Label10.OnClickPtr = 0;
 Label10.OnPressPtr = 0;

 Label11.OwnerScreen = &Screen2;
 Label11.Order = 1;
 Label11.Left = 6;
 Label11.Top = 38;
 Label11.Width = 69;
 Label11.Height = 12;
 Label11.Visible = 1;
 Label11.Active = 1;
 Label11.Caption = Label11_Caption;
 Label11.FontName = Constantia9x11_Regular;
 Label11.Font_Color = 1;
 Label11.OnUpPtr = 0;
 Label11.OnDownPtr = 0;
 Label11.OnClickPtr = 0;
 Label11.OnPressPtr = 0;

 Label12.OwnerScreen = &Screen2;
 Label12.Order = 2;
 Label12.Left = 6;
 Label12.Top = 50;
 Label12.Width = 70;
 Label12.Height = 12;
 Label12.Visible = 1;
 Label12.Active = 1;
 Label12.Caption = Label12_Caption;
 Label12.FontName = Constantia9x11_Regular;
 Label12.Font_Color = 1;
 Label12.OnUpPtr = 0;
 Label12.OnDownPtr = 0;
 Label12.OnClickPtr = 0;
 Label12.OnPressPtr = 0;

 RT_BP.OwnerScreen = &Screen2;
 RT_BP.Order = 3;
 RT_BP.Left = 93;
 RT_BP.Top = 13;
 RT_BP.Width = 31;
 RT_BP.Height = 12;
 RT_BP.Visible = 1;
 RT_BP.Active = 1;
 RT_BP.Caption = RT_BP_Caption;
 RT_BP.FontName = Constantia9x11_Regular;
 RT_BP.Font_Color = 1;
 RT_BP.OnUpPtr = 0;
 RT_BP.OnDownPtr = 0;
 RT_BP.OnClickPtr = 0;
 RT_BP.OnPressPtr = 0;

 Label14.OwnerScreen = &Screen2;
 Label14.Order = 4;
 Label14.Left = 93;
 Label14.Top = 25;
 Label14.Width = 31;
 Label14.Height = 12;
 Label14.Visible = 1;
 Label14.Active = 1;
 Label14.Caption = Label14_Caption;
 Label14.FontName = Constantia9x11_Regular;
 Label14.Font_Color = 1;
 Label14.OnUpPtr = 0;
 Label14.OnDownPtr = 0;
 Label14.OnClickPtr = 0;
 Label14.OnPressPtr = 0;

 Label15.OwnerScreen = &Screen2;
 Label15.Order = 5;
 Label15.Left = 93;
 Label15.Top = 38;
 Label15.Width = 18;
 Label15.Height = 12;
 Label15.Visible = 1;
 Label15.Active = 1;
 Label15.Caption = Label15_Caption;
 Label15.FontName = Constantia9x11_Regular;
 Label15.Font_Color = 1;
 Label15.OnUpPtr = 0;
 Label15.OnDownPtr = 0;
 Label15.OnClickPtr = 0;
 Label15.OnPressPtr = 0;

 Label16.OwnerScreen = &Screen2;
 Label16.Order = 6;
 Label16.Left = 93;
 Label16.Top = 50;
 Label16.Width = 13;
 Label16.Height = 12;
 Label16.Visible = 1;
 Label16.Active = 1;
 Label16.Caption = Label16_Caption;
 Label16.FontName = Constantia9x11_Regular;
 Label16.Font_Color = 1;
 Label16.OnUpPtr = 0;
 Label16.OnDownPtr = 0;
 Label16.OnClickPtr = 0;
 Label16.OnPressPtr = 0;

 Label17.OwnerScreen = &Screen2;
 Label17.Order = 7;
 Label17.Left = 6;
 Label17.Top = 13;
 Label17.Width = 69;
 Label17.Height = 12;
 Label17.Visible = 1;
 Label17.Active = 1;
 Label17.Caption = Label17_Caption;
 Label17.FontName = Constantia9x11_Regular;
 Label17.Font_Color = 1;
 Label17.OnUpPtr = 0;
 Label17.OnDownPtr = 0;
 Label17.OnClickPtr = 0;
 Label17.OnPressPtr = 0;

 Label18.OwnerScreen = &Screen2;
 Label18.Order = 8;
 Label18.Left = 32;
 Label18.Top = 1;
 Label18.Width = 59;
 Label18.Height = 10;
 Label18.Visible = 1;
 Label18.Active = 1;
 Label18.Caption = Label18_Caption;
 Label18.FontName = Bahnschrift_SemiBold8x11_Regular;
 Label18.Font_Color = 1;
 Label18.OnUpPtr = 0;
 Label18.OnDownPtr = 0;
 Label18.OnClickPtr = 0;
 Label18.OnPressPtr = 0;

 Line1.OwnerScreen = &Screen2;
 Line1.Order = 9;
 Line1.First_Point_X = 3;
 Line1.First_Point_Y = 61;
 Line1.Second_Point_X = 119;
 Line1.Second_Point_Y = 61;
 Line1.Visible = 1;

 Line2.OwnerScreen = &Screen2;
 Line2.Order = 10;
 Line2.First_Point_X = 3;
 Line2.First_Point_Y = 12;
 Line2.Second_Point_X = 119;
 Line2.Second_Point_Y = 12;
 Line2.Visible = 1;

 Image4.OwnerScreen = &Screen2;
 Image4.Order = 11;
 Image4.Left = 117;
 Image4.Top = 41;
 Image4.Width = 6;
 Image4.Height = 6;
 Image4.PictureWidth = 6;
 Image4.PictureHeight = 6;
 Image4.Picture_Name = seta_bmp;
 Image4.Visible = 1;
 Image4.Active = 1;
 Image4.OnUpPtr = 0;
 Image4.OnDownPtr = 0;
 Image4.OnClickPtr = 0;
 Image4.OnPressPtr = 0;

 NvCxRua02.OwnerScreen = &Screen_cxRua;
 NvCxRua02.Order = 0;
 NvCxRua02.Left = 93;
 NvCxRua02.Top = 13;
 NvCxRua02.Width = 22;
 NvCxRua02.Height = 12;
 NvCxRua02.Visible = 1;
 NvCxRua02.Active = 1;
 NvCxRua02.Caption = NvCxRua02_Caption;
 NvCxRua02.FontName = Constantia9x11_Regular;
 NvCxRua02.Font_Color = 1;
 NvCxRua02.OnUpPtr = 0;
 NvCxRua02.OnDownPtr = 0;
 NvCxRua02.OnClickPtr = 0;
 NvCxRua02.OnPressPtr = 0;

 Label25.OwnerScreen = &Screen_cxRua;
 Label25.Order = 1;
 Label25.Left = 6;
 Label25.Top = 13;
 Label25.Width = 61;
 Label25.Height = 12;
 Label25.Visible = 1;
 Label25.Active = 1;
 Label25.Caption = Label25_Caption;
 Label25.FontName = Constantia9x11_Regular;
 Label25.Font_Color = 1;
 Label25.OnUpPtr = 0;
 Label25.OnDownPtr = 0;
 Label25.OnClickPtr = 0;
 Label25.OnPressPtr = 0;

 Label26.OwnerScreen = &Screen_cxRua;
 Label26.Order = 2;
 Label26.Left = 6;
 Label26.Top = 1;
 Label26.Width = 81;
 Label26.Height = 10;
 Label26.Visible = 1;
 Label26.Active = 1;
 Label26.Caption = Label26_Caption;
 Label26.FontName = Bahnschrift_SemiBold8x11_Regular;
 Label26.Font_Color = 1;
 Label26.OnUpPtr = 0;
 Label26.OnDownPtr = 0;
 Label26.OnClickPtr = 0;
 Label26.OnPressPtr = 0;

 Line5.OwnerScreen = &Screen_cxRua;
 Line5.Order = 3;
 Line5.First_Point_X = 3;
 Line5.First_Point_Y = 61;
 Line5.Second_Point_X = 119;
 Line5.Second_Point_Y = 61;
 Line5.Visible = 1;

 Line6.OwnerScreen = &Screen_cxRua;
 Line6.Order = 4;
 Line6.First_Point_X = 3;
 Line6.First_Point_Y = 12;
 Line6.Second_Point_X = 119;
 Line6.Second_Point_Y = 12;
 Line6.Visible = 1;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}







void DrawLabel(TLabel *ALabel) {
 if (ALabel->Visible == 1) {
 Glcd_Set_Font_Adv(ALabel->FontName, ALabel->Font_Color, _GLCD_HORIZONTAL);
 Glcd_Write_Text_Adv(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawImage(TImage *AImage) {
 if (AImage->Visible == 1) {
 Glcd_PartialImage(AImage->Left, AImage->Top, AImage->Width,
 AImage->Height, AImage->PictureWidth, AImage->PictureHeight,
 AImage->Picture_Name);
 }
}

void DrawLine(TLine *Aline) {
 if (Aline->Visible == 1) {
 Glcd_Line(Aline->First_Point_X, Aline->First_Point_Y, Aline->Second_Point_X, Aline->Second_Point_Y, _clDraw);
 }
}

void DrawScreen(TScreen *aScreen) {
 int order;
 unsigned short label_idx;
 TLabel *local_label;
 unsigned short image_idx;
 TImage *local_image;
 unsigned short line_idx;
 TLine *local_line;

 object_pressed = 0;
 order = 0;
 label_idx = 0;
 image_idx = 0;
 line_idx = 0;
 CurrentScreen = aScreen;

 Glcd_Fill(0x00);

 while (order < CurrentScreen->ObjectsCount) {
 if (label_idx < CurrentScreen->LabelsCount) {
 local_label =  CurrentScreen->Labels[label_idx] ;
 if (order == local_label->Order) {
 label_idx++;
 order++;
 DrawLabel(local_label);
 }
 }

 if (line_idx < CurrentScreen->LinesCount) {
 local_line =  CurrentScreen->Lines[line_idx] ;
 if (order == local_line->Order) {
 line_idx++;
 order++;
 DrawLine(local_line);
 }
 }

 if (image_idx < CurrentScreen->ImagesCount) {
 local_image =  CurrentScreen->Images[image_idx] ;
 if (order == local_image->Order) {
 image_idx++;
 order++;
 DrawImage(local_image);
 }
 }

 }
}

void Init_MCU() {
 ANSELA = 3;
 ANSELB = 0;
 ANSELC = 0;
 ANSELD = 0;
 TRISA = 3;
}

void Start_TP() {
 Init_MCU();

 InitializeTouchPanel();

 InitializeObjects();
 DrawScreen(&Tela_Inicial);
}
