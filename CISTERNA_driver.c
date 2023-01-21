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
char Label5_Caption[18] = "Nv. Cist Princ  :";

  TLine                  Line3;
  TLine                  Line4;
  TLabel                 NvCxRua02;
char NvCxRua02_Caption[6] = "Vazia";

  TLabel                 Label25;
char Label25_Caption[17] = "Nv. Cx Rua 02  :";

  TLabel                 * const code Screen1_Labels[10]=
         {
         &Label6,              
         &Label7,              
         &Label8,              
         &NvCistP,             
         &NvCist1,             
         &NvCist2,             
         &NvCistR,             
         &Label5,              
         &NvCxRua02,           
         &Label25              
         };
  TLine                  * const code Screen1_Lines[2]=
         {
         &Line3,               
         &Line4                
         };


  TScreen                Misc1;
  TLabel                 Label10;
char Label10_Caption[17] = "Rele Termico BC:";

  TLabel                 Label11;
char Label11_Caption[16] = "Modo Man-Aut  :";

  TLabel                 Label12;
char Label12_Caption[20] = "CMD    V2V        :";

  TLabel                 RT_BP;
char RT_BP_Caption[7] = "Normal";

  TLabel                 Rt_BCist;
char Rt_BCist_Caption[7] = "Normal";

  TLabel                 ManText;
char ManText_Caption[4] = "Man";

  TLabel                 V2VTxt;
char V2VTxt_Caption[4] = "Off";

  TLabel                 Label17;
char Label17_Caption[17] = "Rele Termico BP:";

  TLine                  Line1;
  TLine                  Line2;
  TImage               Image4;
  TLabel                 Label1;
char Label1_Caption[18] = "Status V2V      :";

  TLabel                 StatV2V;
char StatV2V_Caption[4] = "Off";

  TLabel                 * const code Screen2_Labels[10]=
         {
         &Label10,             
         &Label11,             
         &Label12,             
         &RT_BP,               
         &Rt_BCist,            
         &ManText,             
         &V2VTxt,              
         &Label17,             
         &Label1,              
         &StatV2V              
         };
  TImage                 * const code Screen2_Images[1]=
         {
         &Image4               
         };
  TLine                  * const code Screen2_Lines[2]=
         {
         &Line1,               
         &Line2                
         };




static void InitializeObjects() {
  Tela_Inicial.LabelsCount               = 10;
  Tela_Inicial.Labels                    = Screen1_Labels;
  Tela_Inicial.ImagesCount               = 0;
  Tela_Inicial.LinesCount                = 2;
  Tela_Inicial.Lines                     = Screen1_Lines;
  Tela_Inicial.ObjectsCount              = 12;

  Misc1.LabelsCount               = 10;
  Misc1.Labels                    = Screen2_Labels;
  Misc1.ImagesCount               = 1;
  Misc1.Images                    = Screen2_Images;
  Misc1.LinesCount                = 2;
  Misc1.Lines                     = Screen2_Lines;
  Misc1.ObjectsCount              = 13;


  Label6.OwnerScreen     = &Tela_Inicial;
  Label6.Order           = 0;
  Label6.Left            = 6;
  Label6.Top             = 26;
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
  Label8.Top             = 14;
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
  NvCistP.Left            = 97;
  NvCistP.Top             = 49;
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
  NvCist1.Left            = 97;
  NvCist1.Top             = 26;
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
  NvCist2.Left            = 97;
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
  NvCistR.Left            = 97;
  NvCistR.Top             = 14;
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
  Label5.Top             = 49;
  Label5.Width           = 62;
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

  Line3.OwnerScreen     = &Tela_Inicial;
  Line3.Order           = 8;
  Line3.First_Point_X   = 3;
  Line3.First_Point_Y   = 61;
  Line3.Second_Point_X  = 119;
  Line3.Second_Point_Y  = 61;
  Line3.Visible         = 1;

  Line4.OwnerScreen     = &Tela_Inicial;
  Line4.Order           = 9;
  Line4.First_Point_X   = 3;
  Line4.First_Point_Y   = 2;
  Line4.Second_Point_X  = 119;
  Line4.Second_Point_Y  = 2;
  Line4.Visible         = 1;

  NvCxRua02.OwnerScreen     = &Tela_Inicial;
  NvCxRua02.Order           = 10;
  NvCxRua02.Left            = 97;
  NvCxRua02.Top             = 3;
  NvCxRua02.Width           = 22;
  NvCxRua02.Height          = 12;
  NvCxRua02.Visible         = 1;
  NvCxRua02.Active          = 1;
  NvCxRua02.Caption         = NvCxRua02_Caption;
  NvCxRua02.FontName        = Constantia9x11_Regular;
  NvCxRua02.Font_Color      = 1;
  NvCxRua02.OnUpPtr         = 0;
  NvCxRua02.OnDownPtr       = 0;
  NvCxRua02.OnClickPtr      = 0;
  NvCxRua02.OnPressPtr      = 0;

  Label25.OwnerScreen     = &Tela_Inicial;
  Label25.Order           = 11;
  Label25.Left            = 6;
  Label25.Top             = 3;
  Label25.Width           = 63;
  Label25.Height          = 12;
  Label25.Visible         = 1;
  Label25.Active          = 1;
  Label25.Caption         = Label25_Caption;
  Label25.FontName        = Constantia9x11_Regular;
  Label25.Font_Color      = 1;
  Label25.OnUpPtr         = 0;
  Label25.OnDownPtr       = 0;
  Label25.OnClickPtr      = 0;
  Label25.OnPressPtr      = 0;

  Label10.OwnerScreen     = &Misc1;
  Label10.Order           = 0;
  Label10.Left            = 6;
  Label10.Top             = 27;
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

  Label11.OwnerScreen     = &Misc1;
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

  Label12.OwnerScreen     = &Misc1;
  Label12.Order           = 2;
  Label12.Left            = 6;
  Label12.Top             = 50;
  Label12.Width           = 69;
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

  RT_BP.OwnerScreen     = &Misc1;
  RT_BP.Order           = 3;
  RT_BP.Left            = 93;
  RT_BP.Top             = 16;
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

  Rt_BCist.OwnerScreen     = &Misc1;
  Rt_BCist.Order           = 4;
  Rt_BCist.Left            = 93;
  Rt_BCist.Top             = 27;
  Rt_BCist.Width           = 31;
  Rt_BCist.Height          = 12;
  Rt_BCist.Visible         = 1;
  Rt_BCist.Active          = 1;
  Rt_BCist.Caption         = Rt_BCist_Caption;
  Rt_BCist.FontName        = Constantia9x11_Regular;
  Rt_BCist.Font_Color      = 1;
  Rt_BCist.OnUpPtr         = 0;
  Rt_BCist.OnDownPtr       = 0;
  Rt_BCist.OnClickPtr      = 0;
  Rt_BCist.OnPressPtr      = 0;

  ManText.OwnerScreen     = &Misc1;
  ManText.Order           = 5;
  ManText.Left            = 93;
  ManText.Top             = 38;
  ManText.Width           = 18;
  ManText.Height          = 12;
  ManText.Visible         = 1;
  ManText.Active          = 1;
  ManText.Caption         = ManText_Caption;
  ManText.FontName        = Constantia9x11_Regular;
  ManText.Font_Color      = 1;
  ManText.OnUpPtr         = 0;
  ManText.OnDownPtr       = 0;
  ManText.OnClickPtr      = 0;
  ManText.OnPressPtr      = 0;

  V2VTxt.OwnerScreen     = &Misc1;
  V2VTxt.Order           = 6;
  V2VTxt.Left            = 93;
  V2VTxt.Top             = 50;
  V2VTxt.Width           = 13;
  V2VTxt.Height          = 12;
  V2VTxt.Visible         = 1;
  V2VTxt.Active          = 1;
  V2VTxt.Caption         = V2VTxt_Caption;
  V2VTxt.FontName        = Constantia9x11_Regular;
  V2VTxt.Font_Color      = 1;
  V2VTxt.OnUpPtr         = 0;
  V2VTxt.OnDownPtr       = 0;
  V2VTxt.OnClickPtr      = 0;
  V2VTxt.OnPressPtr      = 0;

  Label17.OwnerScreen     = &Misc1;
  Label17.Order           = 7;
  Label17.Left            = 6;
  Label17.Top             = 16;
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

  Line1.OwnerScreen     = &Misc1;
  Line1.Order           = 8;
  Line1.First_Point_X   = 3;
  Line1.First_Point_Y   = 61;
  Line1.Second_Point_X  = 119;
  Line1.Second_Point_Y  = 61;
  Line1.Visible         = 1;

  Line2.OwnerScreen     = &Misc1;
  Line2.Order           = 9;
  Line2.First_Point_X   = 3;
  Line2.First_Point_Y   = 2;
  Line2.Second_Point_X  = 120;
  Line2.Second_Point_Y  = 2;
  Line2.Visible         = 1;

  Image4.OwnerScreen     = &Misc1;
  Image4.Order           = 10;
  Image4.Left            = 117;
  Image4.Top             = 41;
  Image4.Width           = 6;
  Image4.Height          = 6;
  Image4.PictureWidth    = 6;
  Image4.PictureHeight   = 6;
  Image4.Picture_Name    = seta_bmp;
  Image4.Visible         = 0;
  Image4.Active          = 1;
  Image4.OnUpPtr         = 0;
  Image4.OnDownPtr       = 0;
  Image4.OnClickPtr      = 0;
  Image4.OnPressPtr      = 0;

  Label1.OwnerScreen     = &Misc1;
  Label1.Order           = 11;
  Label1.Left            = 6;
  Label1.Top             = 4;
  Label1.Width           = 60;
  Label1.Height          = 12;
  Label1.Visible         = 1;
  Label1.Active          = 1;
  Label1.Caption         = Label1_Caption;
  Label1.FontName        = Constantia9x11_Regular;
  Label1.Font_Color      = 1;
  Label1.OnUpPtr         = 0;
  Label1.OnDownPtr       = 0;
  Label1.OnClickPtr      = 0;
  Label1.OnPressPtr      = 0;

  StatV2V.OwnerScreen     = &Misc1;
  StatV2V.Order           = 12;
  StatV2V.Left            = 94;
  StatV2V.Top             = 4;
  StatV2V.Width           = 13;
  StatV2V.Height          = 12;
  StatV2V.Visible         = 1;
  StatV2V.Active          = 1;
  StatV2V.Caption         = StatV2V_Caption;
  StatV2V.FontName        = Constantia9x11_Regular;
  StatV2V.Font_Color      = 1;
  StatV2V.OnUpPtr         = 0;
  StatV2V.OnDownPtr       = 0;
  StatV2V.OnClickPtr      = 0;
  StatV2V.OnPressPtr      = 0;
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
