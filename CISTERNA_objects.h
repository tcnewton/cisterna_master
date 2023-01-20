enum GlcdColor {_clClear, _clDraw, _clInvert};
typedef struct Screen TScreen;

typedef struct  Label {
  TScreen*  OwnerScreen;
  char          Order;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          *Caption;
  const char    *FontName;
  unsigned char Font_Color;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

typedef struct  Image {
  TScreen*  OwnerScreen;
  char          Order;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          PictureWidth;
  char          PictureHeight;
  const char    *Picture_Name;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TImage;

typedef struct  Line {
  TScreen*  OwnerScreen;
  char          Order;
  char          First_Point_X;
  char          First_Point_Y;
  char          Second_Point_X;
  char          Second_Point_Y;
  char          Visible;
} TLine;

struct Screen {
  unsigned short         ObjectsCount;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  unsigned int           ImagesCount;
  TImage                 * const code *Images;
  unsigned int           LinesCount;
  TLine                 * const code *Lines;
};

extern   TScreen                Tela_Inicial;
extern   TLabel                 Label6;
extern   TLabel                 Label7;
extern   TLabel                 Label8;
extern   TLabel                 NvCistP;
extern   TLabel                 NvCist1;
extern   TLabel                 NvCist2;
extern   TLabel                 NvCistR;
extern   TLabel                 Label5;
extern   TLabel                 Label9;
extern   TLine                  Line3;
extern   TLine                  Line4;
extern   TLabel                 * const code Screen1_Labels[9];
extern   TLine                  * const code Screen1_Lines[2];


extern   TScreen                Misc1;
extern   TLabel                 Label10;
extern   TLabel                 Label11;
extern   TLabel                 Label12;
extern   TLabel                 RT_BP;
extern   TLabel                 Rt_BCist;
extern   TLabel                 ManText;
extern   TLabel                 V2VTxt;
extern   TLabel                 Label17;
extern   TLabel                 Label18;
extern   TLine                  Line1;
extern   TLine                  Line2;
extern   TImage               Image4;
extern   TLabel                 * const code Screen2_Labels[9];
extern   TImage                 * const code Screen2_Images[1];
extern   TLine                  * const code Screen2_Lines[2];


extern   TScreen                Screen_cxRua;
extern   TLabel                 NvCxRua02;
extern   TLabel                 Label25;
extern   TLabel                 Label26;
extern   TLine                  Line5;
extern   TLine                  Line6;
extern   TLabel                 Label1;
extern   TLabel                 StatV2V;
extern   TLabel                 * const code Screen3_Labels[5];
extern   TLine                  * const code Screen3_Lines[2];



/////////////////////////
// Events Code Declarations
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
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
extern char Rt_BCist_Caption[];
extern char ManText_Caption[];
extern char V2VTxt_Caption[];
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
extern char Label1_Caption[];
extern char StatV2V_Caption[];
/////////////////////////////////

void DrawScreen(TScreen *aScreen);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawLine(TLine *Aline);
void Check_TP();
void Start_TP();
