#include "CISTERNA_objects.h"
#include "CISTERNA_resources.h"
#include "built_in.h"


// Glcd module connections
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
// End Glcd module connections

// Touch Panel module connections
sbit DriveA at LATC0_bit;
sbit DriveB at LATC1_bit;
sbit DriveA_Direction at TRISC0_bit;
sbit DriveB_Direction at TRISC1_bit;
// End Touch Panel module connections

// Global variables
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
  Glcd_Init();                                             // Initialize GLCD
  Glcd_Fill(0);                                            // Clear GLCD

}


/////////////////////////
  TScreen*  CurrentScreen;

  TScreen                Screen1;
  TImage               Image1;
  TLabel                 Label1;
char Label1_Caption[6] = "CIST2";

  TImage               Image2;
  TLabel                 Label2;
char Label2_Caption[6] = "CIST1";

  TLabel                 Label3;
char Label3_Caption[17] = "VOLUME CISTERNAS";

  TImage               Image3;
  TLabel                 Label4;
char Label4_Caption[7] = "CIST_R";

  TLabel                 * const code Screen1_Labels[4]=
         {
         &Label1,              
         &Label2,              
         &Label3,              
         &Label4               
         };
  TImage                 * const code Screen1_Images[3]=
         {
         &Image1,              
         &Image2,              
         &Image3               
         };


  TScreen                Tela_Inicial;
  TLabel                 Label6;
char Label6_Caption[20] = "Nv. Cist A        :";

  TLabel                 Label7;
char Label7_Caption[20] = "Nv. Cist B        :";

  TLabel                 Label8;
char Label8_Caption[18] = "Nv. Cx Rua      :";

  TLabel                 NvCistP;
char NvCistP_Caption[6] = "Vazia";

  TLabel                 NvCist1;
char NvCist1_Caption[6] = "Vazia";

  TLabel                 NvCist2;
char NvCist2_Caption[6] = "Vazia";

  TLabel                 NvCistR;
char NvCistR_Caption[6] = "Vazia";

  TLabel                 Label5;
char Label5_Caption[17] = "Nv. Cist Princ :";

  TLabel                 Label9;
char Label9_Caption[20] = "Nivel Caixas D\'agua";

  TLine                  Line3;
  TLine                  Line4;
  TLabel                 * const code Screen2_Labels[9]=
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
  TLine                  * const code Screen2_Lines[2]=
         {
         &Line3,               
         &Line4                
         };


  TScreen                Screen2;
  TLabel                 Label10;
char Label10_Caption[17] = "Rele Termico BC:";

  TLabel                 Label11;
char Label11_Caption[16] = "Modo Man-Aut  :";

  TLabel                 Label12;
char Label12_Caption[22] = "Status V2V          :";

  TLabel                 RT_BP;
char RT_BP_Caption[7] = "Normal";

  TLabel                 Label14;
char Label14_Caption[7] = "Normal";

  TLabel                 Label15;
char Label15_Caption[4] = "Man";

  TLabel                 Label16;
char Label16_Caption[4] = "Off";

  TLabel                 Label17;
char Label17_Caption[17] = "Rele Termico BP:";

  TLabel                 Label18;
char Label18_Caption[14] = "Miscellaneous";

  TLine                  Line1;
  TLine                  Line2;
  TImage               Image4;
  TLabel                 * const code Screen3_Labels[9]=
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
  TImage                 * const code Screen3_Images[1]=
         {
         &Image4               
         };
  TLine                  * const code Screen3_Lines[2]=
         {
         &Line1,               
         &Line2                
         };




static void InitializeObjects() {
  Screen1.LabelsCount               = 4;
  Screen1.Labels                    = Screen1_Labels;
  Screen1.ImagesCount               = 3;
  Screen1.Images                    = Screen1_Images;
  Screen1.LinesCount                = 0;
  Screen1.ObjectsCount              = 7;

  Tela_Inicial.LabelsCount               = 9;
  Tela_Inicial.Labels                    = Screen2_Labels;
  Tela_Inicial.ImagesCount               = 0;
  Tela_Inicial.LinesCount                = 2;
  Tela_Inicial.Lines                     = Screen2_Lines;
  Tela_Inicial.ObjectsCount              = 11;

  Screen2.LabelsCount               = 9;
  Screen2.Labels                    = Screen3_Labels;
  Screen2.ImagesCount               = 1;
  Screen2.Images                    = Screen3_Images;
  Screen2.LinesCount                = 2;
  Screen2.Lines                     = Screen3_Lines;
  Screen2.ObjectsCount              = 12;


  Image1.OwnerScreen     = &Screen1;
  Image1.Order           = 0;
  Image1.Left            = 90;
  Image1.Top             = 14;
  Image1.Width           = 30;
  Image1.Height          = 30;
  Image1.PictureWidth    = 30;
  Image1.PictureHeight   = 30;
  Image1.Picture_Name    = CX_bmp;
  Image1.Visible         = 1;
  Image1.Active          = 1;
  Image1.OnUpPtr         = 0;
  Image1.OnDownPtr       = 0;
  Image1.OnClickPtr      = 0;
  Image1.OnPressPtr      = 0;

  Label1.OwnerScreen     = &Screen1;
  Label1.Order           = 1;
  Label1.Left            = 95;
  Label1.Top             = 49;
  Label1.Width           = 21;
  Label1.Height          = 12;
  Label1.Visible         = 1;
  Label1.Active          = 1;
  Label1.Caption         = Label1_Caption;
  Label1.FontName        = Calibri8x11_Bold;
  Label1.Font_Color      = 1;
  Label1.OnUpPtr         = 0;
  Label1.OnDownPtr       = 0;
  Label1.OnClickPtr      = 0;
  Label1.OnPressPtr      = 0;

  Image2.OwnerScreen     = &Screen1;
  Image2.Order           = 2;
  Image2.Left            = 48;
  Image2.Top             = 14;
  Image2.Width           = 30;
  Image2.Height          = 30;
  Image2.PictureWidth    = 30;
  Image2.PictureHeight   = 30;
  Image2.Picture_Name    = CX_bmp;
  Image2.Visible         = 1;
  Image2.Active          = 1;
  Image2.OnUpPtr         = 0;
  Image2.OnDownPtr       = 0;
  Image2.OnClickPtr      = 0;
  Image2.OnPressPtr      = 0;

  Label2.OwnerScreen     = &Screen1;
  Label2.Order           = 3;
  Label2.Left            = 53;
  Label2.Top             = 49;
  Label2.Width           = 21;
  Label2.Height          = 12;
  Label2.Visible         = 1;
  Label2.Active          = 1;
  Label2.Caption         = Label2_Caption;
  Label2.FontName        = Calibri8x11_Bold;
  Label2.Font_Color      = 1;
  Label2.OnUpPtr         = 0;
  Label2.OnDownPtr       = 0;
  Label2.OnClickPtr      = 0;
  Label2.OnPressPtr      = 0;

  Label3.OwnerScreen     = &Screen1;
  Label3.Order           = 4;
  Label3.Left            = 23;
  Label3.Top             = 1;
  Label3.Width           = 84;
  Label3.Height          = 11;
  Label3.Visible         = 1;
  Label3.Active          = 1;
  Label3.Caption         = Label3_Caption;
  Label3.FontName        = Franklin_Gothic_Demi9x12_Regular;
  Label3.Font_Color      = 1;
  Label3.OnUpPtr         = 0;
  Label3.OnDownPtr       = 0;
  Label3.OnClickPtr      = 0;
  Label3.OnPressPtr      = 0;

  Image3.OwnerScreen     = &Screen1;
  Image3.Order           = 5;
  Image3.Left            = 7;
  Image3.Top             = 14;
  Image3.Width           = 30;
  Image3.Height          = 30;
  Image3.PictureWidth    = 30;
  Image3.PictureHeight   = 30;
  Image3.Picture_Name    = CX_bmp;
  Image3.Visible         = 1;
  Image3.Active          = 1;
  Image3.OnUpPtr         = 0;
  Image3.OnDownPtr       = 0;
  Image3.OnClickPtr      = 0;
  Image3.OnPressPtr      = 0;

  Label4.OwnerScreen     = &Screen1;
  Label4.Order           = 6;
  Label4.Left            = 9;
  Label4.Top             = 49;
  Label4.Width           = 26;
  Label4.Height          = 12;
  Label4.Visible         = 1;
  Label4.Active          = 1;
  Label4.Caption         = Label4_Caption;
  Label4.FontName        = Calibri8x11_Bold;
  Label4.Font_Color      = 1;
  Label4.OnUpPtr         = 0;
  Label4.OnDownPtr       = 0;
  Label4.OnClickPtr      = 0;
  Label4.OnPressPtr      = 0;

  Label6.OwnerScreen     = &Tela_Inicial;
  Label6.Order           = 0;
  Label6.Left            = 6;
  Label6.Top             = 25;
  Label6.Width           = 61;
  Label6.Height          = 12;
  Label6.Visible         = 1;
  Label6.Active          = 1;
  Label6.Caption         = Label6_Caption;
  Label6.FontName        = Constantia9x11_Regular;
  Label6.Font_Color      = 1;
  Label6.OnUpPtr         = 0;
  Label6.OnDownPtr       = 0;
  Label6.OnClickPtr      = 0;
  Label6.OnPressPtr      = 0;

  Label7.OwnerScreen     = &Tela_Inicial;
  Label7.Order           = 1;
  Label7.Left            = 6;
  Label7.Top             = 38;
  Label7.Width           = 61;
  Label7.Height          = 12;
  Label7.Visible         = 1;
  Label7.Active          = 1;
  Label7.Caption         = Label7_Caption;
  Label7.FontName        = Constantia9x11_Regular;
  Label7.Font_Color      = 1;
  Label7.OnUpPtr         = 0;
  Label7.OnDownPtr       = 0;
  Label7.OnClickPtr      = 0;
  Label7.OnPressPtr      = 0;

  Label8.OwnerScreen     = &Tela_Inicial;
  Label8.Order           = 2;
  Label8.Left            = 6;
  Label8.Top             = 50;
  Label8.Width           = 61;
  Label8.Height          = 12;
  Label8.Visible         = 1;
  Label8.Active          = 1;
  Label8.Caption         = Label8_Caption;
  Label8.FontName        = Constantia9x11_Regular;
  Label8.Font_Color      = 1;
  Label8.OnUpPtr         = 0;
  Label8.OnDownPtr       = 0;
  Label8.OnClickPtr      = 0;
  Label8.OnPressPtr      = 0;

  NvCistP.OwnerScreen     = &Tela_Inicial;
  NvCistP.Order           = 3;
  NvCistP.Left            = 93;
  NvCistP.Top             = 13;
  NvCistP.Width           = 22;
  NvCistP.Height          = 12;
  NvCistP.Visible         = 1;
  NvCistP.Active          = 1;
  NvCistP.Caption         = NvCistP_Caption;
  NvCistP.FontName        = Constantia9x11_Regular;
  NvCistP.Font_Color      = 1;
  NvCistP.OnUpPtr         = 0;
  NvCistP.OnDownPtr       = 0;
  NvCistP.OnClickPtr      = 0;
  NvCistP.OnPressPtr      = 0;

  NvCist1.OwnerScreen     = &Tela_Inicial;
  NvCist1.Order           = 4;
  NvCist1.Left            = 93;
  NvCist1.Top             = 25;
  NvCist1.Width           = 22;
  NvCist1.Height          = 12;
  NvCist1.Visible         = 1;
  NvCist1.Active          = 1;
  NvCist1.Caption         = NvCist1_Caption;
  NvCist1.FontName        = Constantia9x11_Regular;
  NvCist1.Font_Color      = 1;
  NvCist1.OnUpPtr         = 0;
  NvCist1.OnDownPtr       = 0;
  NvCist1.OnClickPtr      = 0;
  NvCist1.OnPressPtr      = 0;

  NvCist2.OwnerScreen     = &Tela_Inicial;
  NvCist2.Order           = 5;
  NvCist2.Left            = 93;
  NvCist2.Top             = 38;
  NvCist2.Width           = 22;
  NvCist2.Height          = 12;
  NvCist2.Visible         = 1;
  NvCist2.Active          = 1;
  NvCist2.Caption         = NvCist2_Caption;
  NvCist2.FontName        = Constantia9x11_Regular;
  NvCist2.Font_Color      = 1;
  NvCist2.OnUpPtr         = 0;
  NvCist2.OnDownPtr       = 0;
  NvCist2.OnClickPtr      = 0;
  NvCist2.OnPressPtr      = 0;

  NvCistR.OwnerScreen     = &Tela_Inicial;
  NvCistR.Order           = 6;
  NvCistR.Left            = 93;
  NvCistR.Top             = 50;
  NvCistR.Width           = 22;
  NvCistR.Height          = 12;
  NvCistR.Visible         = 1;
  NvCistR.Active          = 1;
  NvCistR.Caption         = NvCistR_Caption;
  NvCistR.FontName        = Constantia9x11_Regular;
  NvCistR.Font_Color      = 1;
  NvCistR.OnUpPtr         = 0;
  NvCistR.OnDownPtr       = 0;
  NvCistR.OnClickPtr      = 0;
  NvCistR.OnPressPtr      = 0;

  Label5.OwnerScreen     = &Tela_Inicial;
  Label5.Order           = 7;
  Label5.Left            = 6;
  Label5.Top             = 13;
  Label5.Width           = 60;
  Label5.Height          = 12;
  Label5.Visible         = 1;
  Label5.Active          = 1;
  Label5.Caption         = Label5_Caption;
  Label5.FontName        = Constantia9x11_Regular;
  Label5.Font_Color      = 1;
  Label5.OnUpPtr         = 0;
  Label5.OnDownPtr       = 0;
  Label5.OnClickPtr      = 0;
  Label5.OnPressPtr      = 0;

  Label9.OwnerScreen     = &Tela_Inicial;
  Label9.Order           = 8;
  Label9.Left            = 6;
  Label9.Top             = 1;
  Label9.Width           = 81;
  Label9.Height          = 10;
  Label9.Visible         = 1;
  Label9.Active          = 1;
  Label9.Caption         = Label9_Caption;
  Label9.FontName        = Bahnschrift_SemiBold8x11_Regular;
  Label9.Font_Color      = 1;
  Label9.OnUpPtr         = 0;
  Label9.OnDownPtr       = 0;
  Label9.OnClickPtr      = 0;
  Label9.OnPressPtr      = 0;

  Line3.OwnerScreen     = &Tela_Inicial;
  Line3.Order           = 9;
  Line3.First_Point_X   = 3;
  Line3.First_Point_Y   = 61;
  Line3.Second_Point_X  = 119;
  Line3.Second_Point_Y  = 61;
  Line3.Visible         = 1;

  Line4.OwnerScreen     = &Tela_Inicial;
  Line4.Order           = 10;
  Line4.First_Point_X   = 3;
  Line4.First_Point_Y   = 12;
  Line4.Second_Point_X  = 119;
  Line4.Second_Point_Y  = 12;
  Line4.Visible         = 1;

  Label10.OwnerScreen     = &Screen2;
  Label10.Order           = 0;
  Label10.Left            = 6;
  Label10.Top             = 25;
  Label10.Width           = 70;
  Label10.Height          = 12;
  Label10.Visible         = 1;
  Label10.Active          = 1;
  Label10.Caption         = Label10_Caption;
  Label10.FontName        = Constantia9x11_Regular;
  Label10.Font_Color      = 1;
  Label10.OnUpPtr         = 0;
  Label10.OnDownPtr       = 0;
  Label10.OnClickPtr      = 0;
  Label10.OnPressPtr      = 0;

  Label11.OwnerScreen     = &Screen2;
  Label11.Order           = 1;
  Label11.Left            = 6;
  Label11.Top             = 38;
  Label11.Width           = 69;
  Label11.Height          = 12;
  Label11.Visible         = 1;
  Label11.Active          = 1;
  Label11.Caption         = Label11_Caption;
  Label11.FontName        = Constantia9x11_Regular;
  Label11.Font_Color      = 1;
  Label11.OnUpPtr         = 0;
  Label11.OnDownPtr       = 0;
  Label11.OnClickPtr      = 0;
  Label11.OnPressPtr      = 0;

  Label12.OwnerScreen     = &Screen2;
  Label12.Order           = 2;
  Label12.Left            = 6;
  Label12.Top             = 50;
  Label12.Width           = 70;
  Label12.Height          = 12;
  Label12.Visible         = 1;
  Label12.Active          = 1;
  Label12.Caption         = Label12_Caption;
  Label12.FontName        = Constantia9x11_Regular;
  Label12.Font_Color      = 1;
  Label12.OnUpPtr         = 0;
  Label12.OnDownPtr       = 0;
  Label12.OnClickPtr      = 0;
  Label12.OnPressPtr      = 0;

  RT_BP.OwnerScreen     = &Screen2;
  RT_BP.Order           = 3;
  RT_BP.Left            = 93;
  RT_BP.Top             = 13;
  RT_BP.Width           = 31;
  RT_BP.Height          = 12;
  RT_BP.Visible         = 1;
  RT_BP.Active          = 1;
  RT_BP.Caption         = RT_BP_Caption;
  RT_BP.FontName        = Constantia9x11_Regular;
  RT_BP.Font_Color      = 1;
  RT_BP.OnUpPtr         = 0;
  RT_BP.OnDownPtr       = 0;
  RT_BP.OnClickPtr      = 0;
  RT_BP.OnPressPtr      = 0;

  Label14.OwnerScreen     = &Screen2;
  Label14.Order           = 4;
  Label14.Left            = 93;
  Label14.Top             = 25;
  Label14.Width           = 31;
  Label14.Height          = 12;
  Label14.Visible         = 1;
  Label14.Active          = 1;
  Label14.Caption         = Label14_Caption;
  Label14.FontName        = Constantia9x11_Regular;
  Label14.Font_Color      = 1;
  Label14.OnUpPtr         = 0;
  Label14.OnDownPtr       = 0;
  Label14.OnClickPtr      = 0;
  Label14.OnPressPtr      = 0;

  Label15.OwnerScreen     = &Screen2;
  Label15.Order           = 5;
  Label15.Left            = 93;
  Label15.Top             = 38;
  Label15.Width           = 18;
  Label15.Height          = 12;
  Label15.Visible         = 1;
  Label15.Active          = 1;
  Label15.Caption         = Label15_Caption;
  Label15.FontName        = Constantia9x11_Regular;
  Label15.Font_Color      = 1;
  Label15.OnUpPtr         = 0;
  Label15.OnDownPtr       = 0;
  Label15.OnClickPtr      = 0;
  Label15.OnPressPtr      = 0;

  Label16.OwnerScreen     = &Screen2;
  Label16.Order           = 6;
  Label16.Left            = 93;
  Label16.Top             = 50;
  Label16.Width           = 13;
  Label16.Height          = 12;
  Label16.Visible         = 1;
  Label16.Active          = 1;
  Label16.Caption         = Label16_Caption;
  Label16.FontName        = Constantia9x11_Regular;
  Label16.Font_Color      = 1;
  Label16.OnUpPtr         = 0;
  Label16.OnDownPtr       = 0;
  Label16.OnClickPtr      = 0;
  Label16.OnPressPtr      = 0;

  Label17.OwnerScreen     = &Screen2;
  Label17.Order           = 7;
  Label17.Left            = 6;
  Label17.Top             = 13;
  Label17.Width           = 69;
  Label17.Height          = 12;
  Label17.Visible         = 1;
  Label17.Active          = 1;
  Label17.Caption         = Label17_Caption;
  Label17.FontName        = Constantia9x11_Regular;
  Label17.Font_Color      = 1;
  Label17.OnUpPtr         = 0;
  Label17.OnDownPtr       = 0;
  Label17.OnClickPtr      = 0;
  Label17.OnPressPtr      = 0;

  Label18.OwnerScreen     = &Screen2;
  Label18.Order           = 8;
  Label18.Left            = 32;
  Label18.Top             = 1;
  Label18.Width           = 59;
  Label18.Height          = 10;
  Label18.Visible         = 1;
  Label18.Active          = 1;
  Label18.Caption         = Label18_Caption;
  Label18.FontName        = Bahnschrift_SemiBold8x11_Regular;
  Label18.Font_Color      = 1;
  Label18.OnUpPtr         = 0;
  Label18.OnDownPtr       = 0;
  Label18.OnClickPtr      = 0;
  Label18.OnPressPtr      = 0;

  Line1.OwnerScreen     = &Screen2;
  Line1.Order           = 9;
  Line1.First_Point_X   = 3;
  Line1.First_Point_Y   = 61;
  Line1.Second_Point_X  = 119;
  Line1.Second_Point_Y  = 61;
  Line1.Visible         = 1;

  Line2.OwnerScreen     = &Screen2;
  Line2.Order           = 10;
  Line2.First_Point_X   = 3;
  Line2.First_Point_Y   = 12;
  Line2.Second_Point_X  = 119;
  Line2.Second_Point_Y  = 12;
  Line2.Visible         = 1;

  Image4.OwnerScreen     = &Screen2;
  Image4.Order           = 11;
  Image4.Left            = 117;
  Image4.Top             = 41;
  Image4.Width           = 6;
  Image4.Height          = 6;
  Image4.PictureWidth    = 6;
  Image4.PictureHeight   = 6;
  Image4.Picture_Name    = seta_bmp;
  Image4.Visible         = 1;
  Image4.Active          = 1;
  Image4.OnUpPtr         = 0;
  Image4.OnDownPtr       = 0;
  Image4.OnClickPtr      = 0;
  Image4.OnPressPtr      = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
  if ( (Left<= X) && (Left+ Width - 1 >= X) &&
       (Top <= Y)  && (Top + Height - 1 >= Y) )
    return 1;
  else
    return 0;
}


#define GetLabel(index)               CurrentScreen->Labels[index]
#define GetImage(index)               CurrentScreen->Images[index]
#define GetLine(index)                CurrentScreen->Lines[index]


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
      local_label = GetLabel(label_idx);
      if (order == local_label->Order) {
        label_idx++;
        order++;
        DrawLabel(local_label);
      }
    }

    if (line_idx  < CurrentScreen->LinesCount) {
      local_line = GetLine(line_idx);
      if (order == local_line->Order) {
        line_idx++;
        order++;
        DrawLine(local_line);
      }
    }

    if (image_idx  < CurrentScreen->ImagesCount) {
      local_image = GetImage(image_idx);
      if (order == local_image->Order) {
        image_idx++;
        order++;
        DrawImage(local_image);
      }
    }

  }
}

void Init_MCU() {
  ANSELA = 3; // Configure AN0 and AN1 pins as analog
  ANSELB = 0; // Configure PORTB pins as digital
  ANSELC = 0; // Configure PORTC pins as digital
  ANSELD = 0; // Configure PORTD pins as digital
  TRISA  = 3; // Configure AN0 and AN1 pins as input
}

void Start_TP() {
  Init_MCU();

  InitializeTouchPanel();

  InitializeObjects();
  DrawScreen(&Tela_Inicial);
}
