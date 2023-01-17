
CISTERNA_driver_InitializeTouchPanel:

;CISTERNA_driver.c,48 :: 		static void InitializeTouchPanel() {
;CISTERNA_driver.c,49 :: 		Glcd_Init();                                             // Initialize GLCD
	CALL        _Glcd_Init+0, 0
;CISTERNA_driver.c,50 :: 		Glcd_Fill(0);                                            // Clear GLCD
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;CISTERNA_driver.c,52 :: 		}
L_end_InitializeTouchPanel:
	RETURN      0
; end of CISTERNA_driver_InitializeTouchPanel

CISTERNA_driver_InitializeObjects:

;CISTERNA_driver.c,194 :: 		static void InitializeObjects() {
;CISTERNA_driver.c,195 :: 		Screen1.LabelsCount               = 4;
	MOVLW       4
	MOVWF       _Screen1+1 
	MOVLW       0
	MOVWF       _Screen1+2 
;CISTERNA_driver.c,196 :: 		Screen1.Labels                    = Screen1_Labels;
	MOVLW       _Screen1_Labels+0
	MOVWF       _Screen1+3 
	MOVLW       hi_addr(_Screen1_Labels+0)
	MOVWF       _Screen1+4 
	MOVLW       higher_addr(_Screen1_Labels+0)
	MOVWF       _Screen1+5 
;CISTERNA_driver.c,197 :: 		Screen1.ImagesCount               = 3;
	MOVLW       3
	MOVWF       _Screen1+6 
	MOVLW       0
	MOVWF       _Screen1+7 
;CISTERNA_driver.c,198 :: 		Screen1.Images                    = Screen1_Images;
	MOVLW       _Screen1_Images+0
	MOVWF       _Screen1+8 
	MOVLW       hi_addr(_Screen1_Images+0)
	MOVWF       _Screen1+9 
	MOVLW       higher_addr(_Screen1_Images+0)
	MOVWF       _Screen1+10 
;CISTERNA_driver.c,199 :: 		Screen1.LinesCount                = 0;
	CLRF        _Screen1+11 
	CLRF        _Screen1+12 
;CISTERNA_driver.c,200 :: 		Screen1.ObjectsCount              = 7;
	MOVLW       7
	MOVWF       _Screen1+0 
;CISTERNA_driver.c,202 :: 		Tela_Inicial.LabelsCount               = 9;
	MOVLW       9
	MOVWF       _Tela_Inicial+1 
	MOVLW       0
	MOVWF       _Tela_Inicial+2 
;CISTERNA_driver.c,203 :: 		Tela_Inicial.Labels                    = Screen2_Labels;
	MOVLW       _Screen2_Labels+0
	MOVWF       _Tela_Inicial+3 
	MOVLW       hi_addr(_Screen2_Labels+0)
	MOVWF       _Tela_Inicial+4 
	MOVLW       higher_addr(_Screen2_Labels+0)
	MOVWF       _Tela_Inicial+5 
;CISTERNA_driver.c,204 :: 		Tela_Inicial.ImagesCount               = 0;
	CLRF        _Tela_Inicial+6 
	CLRF        _Tela_Inicial+7 
;CISTERNA_driver.c,205 :: 		Tela_Inicial.LinesCount                = 2;
	MOVLW       2
	MOVWF       _Tela_Inicial+11 
	MOVLW       0
	MOVWF       _Tela_Inicial+12 
;CISTERNA_driver.c,206 :: 		Tela_Inicial.Lines                     = Screen2_Lines;
	MOVLW       _Screen2_Lines+0
	MOVWF       _Tela_Inicial+13 
	MOVLW       hi_addr(_Screen2_Lines+0)
	MOVWF       _Tela_Inicial+14 
	MOVLW       higher_addr(_Screen2_Lines+0)
	MOVWF       _Tela_Inicial+15 
;CISTERNA_driver.c,207 :: 		Tela_Inicial.ObjectsCount              = 11;
	MOVLW       11
	MOVWF       _Tela_Inicial+0 
;CISTERNA_driver.c,209 :: 		Screen2.LabelsCount               = 9;
	MOVLW       9
	MOVWF       _Screen2+1 
	MOVLW       0
	MOVWF       _Screen2+2 
;CISTERNA_driver.c,210 :: 		Screen2.Labels                    = Screen3_Labels;
	MOVLW       _Screen3_Labels+0
	MOVWF       _Screen2+3 
	MOVLW       hi_addr(_Screen3_Labels+0)
	MOVWF       _Screen2+4 
	MOVLW       higher_addr(_Screen3_Labels+0)
	MOVWF       _Screen2+5 
;CISTERNA_driver.c,211 :: 		Screen2.ImagesCount               = 1;
	MOVLW       1
	MOVWF       _Screen2+6 
	MOVLW       0
	MOVWF       _Screen2+7 
;CISTERNA_driver.c,212 :: 		Screen2.Images                    = Screen3_Images;
	MOVLW       _Screen3_Images+0
	MOVWF       _Screen2+8 
	MOVLW       hi_addr(_Screen3_Images+0)
	MOVWF       _Screen2+9 
	MOVLW       higher_addr(_Screen3_Images+0)
	MOVWF       _Screen2+10 
;CISTERNA_driver.c,213 :: 		Screen2.LinesCount                = 2;
	MOVLW       2
	MOVWF       _Screen2+11 
	MOVLW       0
	MOVWF       _Screen2+12 
;CISTERNA_driver.c,214 :: 		Screen2.Lines                     = Screen3_Lines;
	MOVLW       _Screen3_Lines+0
	MOVWF       _Screen2+13 
	MOVLW       hi_addr(_Screen3_Lines+0)
	MOVWF       _Screen2+14 
	MOVLW       higher_addr(_Screen3_Lines+0)
	MOVWF       _Screen2+15 
;CISTERNA_driver.c,215 :: 		Screen2.ObjectsCount              = 12;
	MOVLW       12
	MOVWF       _Screen2+0 
;CISTERNA_driver.c,218 :: 		Image1.OwnerScreen     = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _Image1+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _Image1+1 
;CISTERNA_driver.c,219 :: 		Image1.Order           = 0;
	CLRF        _Image1+2 
;CISTERNA_driver.c,220 :: 		Image1.Left            = 90;
	MOVLW       90
	MOVWF       _Image1+3 
;CISTERNA_driver.c,221 :: 		Image1.Top             = 14;
	MOVLW       14
	MOVWF       _Image1+4 
;CISTERNA_driver.c,222 :: 		Image1.Width           = 30;
	MOVLW       30
	MOVWF       _Image1+5 
;CISTERNA_driver.c,223 :: 		Image1.Height          = 30;
	MOVLW       30
	MOVWF       _Image1+6 
;CISTERNA_driver.c,224 :: 		Image1.PictureWidth    = 30;
	MOVLW       30
	MOVWF       _Image1+7 
;CISTERNA_driver.c,225 :: 		Image1.PictureHeight   = 30;
	MOVLW       30
	MOVWF       _Image1+8 
;CISTERNA_driver.c,226 :: 		Image1.Picture_Name    = CX_bmp;
	MOVLW       _CX_bmp+0
	MOVWF       R6 
	MOVLW       hi_addr(_CX_bmp+0)
	MOVWF       R7 
	MOVLW       higher_addr(_CX_bmp+0)
	MOVWF       R8 
	MOVF        R6, 0 
	MOVWF       _Image1+9 
	MOVF        R7, 0 
	MOVWF       _Image1+10 
	MOVF        R8, 0 
	MOVWF       _Image1+11 
;CISTERNA_driver.c,227 :: 		Image1.Visible         = 1;
	MOVLW       1
	MOVWF       _Image1+12 
;CISTERNA_driver.c,228 :: 		Image1.Active          = 1;
	MOVLW       1
	MOVWF       _Image1+13 
;CISTERNA_driver.c,229 :: 		Image1.OnUpPtr         = 0;
	CLRF        _Image1+14 
	CLRF        _Image1+15 
	CLRF        _Image1+16 
	CLRF        _Image1+17 
;CISTERNA_driver.c,230 :: 		Image1.OnDownPtr       = 0;
	CLRF        _Image1+18 
	CLRF        _Image1+19 
	CLRF        _Image1+20 
	CLRF        _Image1+21 
;CISTERNA_driver.c,231 :: 		Image1.OnClickPtr      = 0;
	CLRF        _Image1+22 
	CLRF        _Image1+23 
	CLRF        _Image1+24 
	CLRF        _Image1+25 
;CISTERNA_driver.c,232 :: 		Image1.OnPressPtr      = 0;
	CLRF        _Image1+26 
	CLRF        _Image1+27 
	CLRF        _Image1+28 
	CLRF        _Image1+29 
;CISTERNA_driver.c,234 :: 		Label1.OwnerScreen     = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _Label1+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _Label1+1 
;CISTERNA_driver.c,235 :: 		Label1.Order           = 1;
	MOVLW       1
	MOVWF       _Label1+2 
;CISTERNA_driver.c,236 :: 		Label1.Left            = 95;
	MOVLW       95
	MOVWF       _Label1+3 
;CISTERNA_driver.c,237 :: 		Label1.Top             = 49;
	MOVLW       49
	MOVWF       _Label1+4 
;CISTERNA_driver.c,238 :: 		Label1.Width           = 21;
	MOVLW       21
	MOVWF       _Label1+5 
;CISTERNA_driver.c,239 :: 		Label1.Height          = 12;
	MOVLW       12
	MOVWF       _Label1+6 
;CISTERNA_driver.c,240 :: 		Label1.Visible         = 1;
	MOVLW       1
	MOVWF       _Label1+13 
;CISTERNA_driver.c,241 :: 		Label1.Active          = 1;
	MOVLW       1
	MOVWF       _Label1+14 
;CISTERNA_driver.c,242 :: 		Label1.Caption         = Label1_Caption;
	MOVLW       _Label1_Caption+0
	MOVWF       _Label1+7 
	MOVLW       hi_addr(_Label1_Caption+0)
	MOVWF       _Label1+8 
;CISTERNA_driver.c,243 :: 		Label1.FontName        = Calibri8x11_Bold;
	MOVLW       _Calibri8x11_Bold+0
	MOVWF       R3 
	MOVLW       hi_addr(_Calibri8x11_Bold+0)
	MOVWF       R4 
	MOVLW       higher_addr(_Calibri8x11_Bold+0)
	MOVWF       R5 
	MOVF        R3, 0 
	MOVWF       _Label1+9 
	MOVF        R4, 0 
	MOVWF       _Label1+10 
	MOVF        R5, 0 
	MOVWF       _Label1+11 
;CISTERNA_driver.c,244 :: 		Label1.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label1+12 
;CISTERNA_driver.c,245 :: 		Label1.OnUpPtr         = 0;
	CLRF        _Label1+15 
	CLRF        _Label1+16 
	CLRF        _Label1+17 
	CLRF        _Label1+18 
;CISTERNA_driver.c,246 :: 		Label1.OnDownPtr       = 0;
	CLRF        _Label1+19 
	CLRF        _Label1+20 
	CLRF        _Label1+21 
	CLRF        _Label1+22 
;CISTERNA_driver.c,247 :: 		Label1.OnClickPtr      = 0;
	CLRF        _Label1+23 
	CLRF        _Label1+24 
	CLRF        _Label1+25 
	CLRF        _Label1+26 
;CISTERNA_driver.c,248 :: 		Label1.OnPressPtr      = 0;
	CLRF        _Label1+27 
	CLRF        _Label1+28 
	CLRF        _Label1+29 
	CLRF        _Label1+30 
;CISTERNA_driver.c,250 :: 		Image2.OwnerScreen     = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _Image2+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _Image2+1 
;CISTERNA_driver.c,251 :: 		Image2.Order           = 2;
	MOVLW       2
	MOVWF       _Image2+2 
;CISTERNA_driver.c,252 :: 		Image2.Left            = 48;
	MOVLW       48
	MOVWF       _Image2+3 
;CISTERNA_driver.c,253 :: 		Image2.Top             = 14;
	MOVLW       14
	MOVWF       _Image2+4 
;CISTERNA_driver.c,254 :: 		Image2.Width           = 30;
	MOVLW       30
	MOVWF       _Image2+5 
;CISTERNA_driver.c,255 :: 		Image2.Height          = 30;
	MOVLW       30
	MOVWF       _Image2+6 
;CISTERNA_driver.c,256 :: 		Image2.PictureWidth    = 30;
	MOVLW       30
	MOVWF       _Image2+7 
;CISTERNA_driver.c,257 :: 		Image2.PictureHeight   = 30;
	MOVLW       30
	MOVWF       _Image2+8 
;CISTERNA_driver.c,258 :: 		Image2.Picture_Name    = CX_bmp;
	MOVF        R6, 0 
	MOVWF       _Image2+9 
	MOVF        R7, 0 
	MOVWF       _Image2+10 
	MOVF        R8, 0 
	MOVWF       _Image2+11 
;CISTERNA_driver.c,259 :: 		Image2.Visible         = 1;
	MOVLW       1
	MOVWF       _Image2+12 
;CISTERNA_driver.c,260 :: 		Image2.Active          = 1;
	MOVLW       1
	MOVWF       _Image2+13 
;CISTERNA_driver.c,261 :: 		Image2.OnUpPtr         = 0;
	CLRF        _Image2+14 
	CLRF        _Image2+15 
	CLRF        _Image2+16 
	CLRF        _Image2+17 
;CISTERNA_driver.c,262 :: 		Image2.OnDownPtr       = 0;
	CLRF        _Image2+18 
	CLRF        _Image2+19 
	CLRF        _Image2+20 
	CLRF        _Image2+21 
;CISTERNA_driver.c,263 :: 		Image2.OnClickPtr      = 0;
	CLRF        _Image2+22 
	CLRF        _Image2+23 
	CLRF        _Image2+24 
	CLRF        _Image2+25 
;CISTERNA_driver.c,264 :: 		Image2.OnPressPtr      = 0;
	CLRF        _Image2+26 
	CLRF        _Image2+27 
	CLRF        _Image2+28 
	CLRF        _Image2+29 
;CISTERNA_driver.c,266 :: 		Label2.OwnerScreen     = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _Label2+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _Label2+1 
;CISTERNA_driver.c,267 :: 		Label2.Order           = 3;
	MOVLW       3
	MOVWF       _Label2+2 
;CISTERNA_driver.c,268 :: 		Label2.Left            = 53;
	MOVLW       53
	MOVWF       _Label2+3 
;CISTERNA_driver.c,269 :: 		Label2.Top             = 49;
	MOVLW       49
	MOVWF       _Label2+4 
;CISTERNA_driver.c,270 :: 		Label2.Width           = 21;
	MOVLW       21
	MOVWF       _Label2+5 
;CISTERNA_driver.c,271 :: 		Label2.Height          = 12;
	MOVLW       12
	MOVWF       _Label2+6 
;CISTERNA_driver.c,272 :: 		Label2.Visible         = 1;
	MOVLW       1
	MOVWF       _Label2+13 
;CISTERNA_driver.c,273 :: 		Label2.Active          = 1;
	MOVLW       1
	MOVWF       _Label2+14 
;CISTERNA_driver.c,274 :: 		Label2.Caption         = Label2_Caption;
	MOVLW       _Label2_Caption+0
	MOVWF       _Label2+7 
	MOVLW       hi_addr(_Label2_Caption+0)
	MOVWF       _Label2+8 
;CISTERNA_driver.c,275 :: 		Label2.FontName        = Calibri8x11_Bold;
	MOVF        R3, 0 
	MOVWF       _Label2+9 
	MOVF        R4, 0 
	MOVWF       _Label2+10 
	MOVF        R5, 0 
	MOVWF       _Label2+11 
;CISTERNA_driver.c,276 :: 		Label2.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label2+12 
;CISTERNA_driver.c,277 :: 		Label2.OnUpPtr         = 0;
	CLRF        _Label2+15 
	CLRF        _Label2+16 
	CLRF        _Label2+17 
	CLRF        _Label2+18 
;CISTERNA_driver.c,278 :: 		Label2.OnDownPtr       = 0;
	CLRF        _Label2+19 
	CLRF        _Label2+20 
	CLRF        _Label2+21 
	CLRF        _Label2+22 
;CISTERNA_driver.c,279 :: 		Label2.OnClickPtr      = 0;
	CLRF        _Label2+23 
	CLRF        _Label2+24 
	CLRF        _Label2+25 
	CLRF        _Label2+26 
;CISTERNA_driver.c,280 :: 		Label2.OnPressPtr      = 0;
	CLRF        _Label2+27 
	CLRF        _Label2+28 
	CLRF        _Label2+29 
	CLRF        _Label2+30 
;CISTERNA_driver.c,282 :: 		Label3.OwnerScreen     = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _Label3+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _Label3+1 
;CISTERNA_driver.c,283 :: 		Label3.Order           = 4;
	MOVLW       4
	MOVWF       _Label3+2 
;CISTERNA_driver.c,284 :: 		Label3.Left            = 23;
	MOVLW       23
	MOVWF       _Label3+3 
;CISTERNA_driver.c,285 :: 		Label3.Top             = 1;
	MOVLW       1
	MOVWF       _Label3+4 
;CISTERNA_driver.c,286 :: 		Label3.Width           = 84;
	MOVLW       84
	MOVWF       _Label3+5 
;CISTERNA_driver.c,287 :: 		Label3.Height          = 11;
	MOVLW       11
	MOVWF       _Label3+6 
;CISTERNA_driver.c,288 :: 		Label3.Visible         = 1;
	MOVLW       1
	MOVWF       _Label3+13 
;CISTERNA_driver.c,289 :: 		Label3.Active          = 1;
	MOVLW       1
	MOVWF       _Label3+14 
;CISTERNA_driver.c,290 :: 		Label3.Caption         = Label3_Caption;
	MOVLW       _Label3_Caption+0
	MOVWF       _Label3+7 
	MOVLW       hi_addr(_Label3_Caption+0)
	MOVWF       _Label3+8 
;CISTERNA_driver.c,291 :: 		Label3.FontName        = Franklin_Gothic_Demi9x12_Regular;
	MOVLW       _Franklin_Gothic_Demi9x12_Regular+0
	MOVWF       R0 
	MOVLW       hi_addr(_Franklin_Gothic_Demi9x12_Regular+0)
	MOVWF       R1 
	MOVLW       higher_addr(_Franklin_Gothic_Demi9x12_Regular+0)
	MOVWF       R2 
	MOVF        R0, 0 
	MOVWF       _Label3+9 
	MOVF        R1, 0 
	MOVWF       _Label3+10 
	MOVF        R2, 0 
	MOVWF       _Label3+11 
;CISTERNA_driver.c,292 :: 		Label3.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label3+12 
;CISTERNA_driver.c,293 :: 		Label3.OnUpPtr         = 0;
	CLRF        _Label3+15 
	CLRF        _Label3+16 
	CLRF        _Label3+17 
	CLRF        _Label3+18 
;CISTERNA_driver.c,294 :: 		Label3.OnDownPtr       = 0;
	CLRF        _Label3+19 
	CLRF        _Label3+20 
	CLRF        _Label3+21 
	CLRF        _Label3+22 
;CISTERNA_driver.c,295 :: 		Label3.OnClickPtr      = 0;
	CLRF        _Label3+23 
	CLRF        _Label3+24 
	CLRF        _Label3+25 
	CLRF        _Label3+26 
;CISTERNA_driver.c,296 :: 		Label3.OnPressPtr      = 0;
	CLRF        _Label3+27 
	CLRF        _Label3+28 
	CLRF        _Label3+29 
	CLRF        _Label3+30 
;CISTERNA_driver.c,298 :: 		Image3.OwnerScreen     = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _Image3+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _Image3+1 
;CISTERNA_driver.c,299 :: 		Image3.Order           = 5;
	MOVLW       5
	MOVWF       _Image3+2 
;CISTERNA_driver.c,300 :: 		Image3.Left            = 7;
	MOVLW       7
	MOVWF       _Image3+3 
;CISTERNA_driver.c,301 :: 		Image3.Top             = 14;
	MOVLW       14
	MOVWF       _Image3+4 
;CISTERNA_driver.c,302 :: 		Image3.Width           = 30;
	MOVLW       30
	MOVWF       _Image3+5 
;CISTERNA_driver.c,303 :: 		Image3.Height          = 30;
	MOVLW       30
	MOVWF       _Image3+6 
;CISTERNA_driver.c,304 :: 		Image3.PictureWidth    = 30;
	MOVLW       30
	MOVWF       _Image3+7 
;CISTERNA_driver.c,305 :: 		Image3.PictureHeight   = 30;
	MOVLW       30
	MOVWF       _Image3+8 
;CISTERNA_driver.c,306 :: 		Image3.Picture_Name    = CX_bmp;
	MOVF        R6, 0 
	MOVWF       _Image3+9 
	MOVF        R7, 0 
	MOVWF       _Image3+10 
	MOVF        R8, 0 
	MOVWF       _Image3+11 
;CISTERNA_driver.c,307 :: 		Image3.Visible         = 1;
	MOVLW       1
	MOVWF       _Image3+12 
;CISTERNA_driver.c,308 :: 		Image3.Active          = 1;
	MOVLW       1
	MOVWF       _Image3+13 
;CISTERNA_driver.c,309 :: 		Image3.OnUpPtr         = 0;
	CLRF        _Image3+14 
	CLRF        _Image3+15 
	CLRF        _Image3+16 
	CLRF        _Image3+17 
;CISTERNA_driver.c,310 :: 		Image3.OnDownPtr       = 0;
	CLRF        _Image3+18 
	CLRF        _Image3+19 
	CLRF        _Image3+20 
	CLRF        _Image3+21 
;CISTERNA_driver.c,311 :: 		Image3.OnClickPtr      = 0;
	CLRF        _Image3+22 
	CLRF        _Image3+23 
	CLRF        _Image3+24 
	CLRF        _Image3+25 
;CISTERNA_driver.c,312 :: 		Image3.OnPressPtr      = 0;
	CLRF        _Image3+26 
	CLRF        _Image3+27 
	CLRF        _Image3+28 
	CLRF        _Image3+29 
;CISTERNA_driver.c,314 :: 		Label4.OwnerScreen     = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _Label4+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _Label4+1 
;CISTERNA_driver.c,315 :: 		Label4.Order           = 6;
	MOVLW       6
	MOVWF       _Label4+2 
;CISTERNA_driver.c,316 :: 		Label4.Left            = 9;
	MOVLW       9
	MOVWF       _Label4+3 
;CISTERNA_driver.c,317 :: 		Label4.Top             = 49;
	MOVLW       49
	MOVWF       _Label4+4 
;CISTERNA_driver.c,318 :: 		Label4.Width           = 26;
	MOVLW       26
	MOVWF       _Label4+5 
;CISTERNA_driver.c,319 :: 		Label4.Height          = 12;
	MOVLW       12
	MOVWF       _Label4+6 
;CISTERNA_driver.c,320 :: 		Label4.Visible         = 1;
	MOVLW       1
	MOVWF       _Label4+13 
;CISTERNA_driver.c,321 :: 		Label4.Active          = 1;
	MOVLW       1
	MOVWF       _Label4+14 
;CISTERNA_driver.c,322 :: 		Label4.Caption         = Label4_Caption;
	MOVLW       _Label4_Caption+0
	MOVWF       _Label4+7 
	MOVLW       hi_addr(_Label4_Caption+0)
	MOVWF       _Label4+8 
;CISTERNA_driver.c,323 :: 		Label4.FontName        = Calibri8x11_Bold;
	MOVF        R3, 0 
	MOVWF       _Label4+9 
	MOVF        R4, 0 
	MOVWF       _Label4+10 
	MOVF        R5, 0 
	MOVWF       _Label4+11 
;CISTERNA_driver.c,324 :: 		Label4.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label4+12 
;CISTERNA_driver.c,325 :: 		Label4.OnUpPtr         = 0;
	CLRF        _Label4+15 
	CLRF        _Label4+16 
	CLRF        _Label4+17 
	CLRF        _Label4+18 
;CISTERNA_driver.c,326 :: 		Label4.OnDownPtr       = 0;
	CLRF        _Label4+19 
	CLRF        _Label4+20 
	CLRF        _Label4+21 
	CLRF        _Label4+22 
;CISTERNA_driver.c,327 :: 		Label4.OnClickPtr      = 0;
	CLRF        _Label4+23 
	CLRF        _Label4+24 
	CLRF        _Label4+25 
	CLRF        _Label4+26 
;CISTERNA_driver.c,328 :: 		Label4.OnPressPtr      = 0;
	CLRF        _Label4+27 
	CLRF        _Label4+28 
	CLRF        _Label4+29 
	CLRF        _Label4+30 
;CISTERNA_driver.c,330 :: 		Label6.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Label6+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Label6+1 
;CISTERNA_driver.c,331 :: 		Label6.Order           = 0;
	CLRF        _Label6+2 
;CISTERNA_driver.c,332 :: 		Label6.Left            = 6;
	MOVLW       6
	MOVWF       _Label6+3 
;CISTERNA_driver.c,333 :: 		Label6.Top             = 25;
	MOVLW       25
	MOVWF       _Label6+4 
;CISTERNA_driver.c,334 :: 		Label6.Width           = 61;
	MOVLW       61
	MOVWF       _Label6+5 
;CISTERNA_driver.c,335 :: 		Label6.Height          = 12;
	MOVLW       12
	MOVWF       _Label6+6 
;CISTERNA_driver.c,336 :: 		Label6.Visible         = 1;
	MOVLW       1
	MOVWF       _Label6+13 
;CISTERNA_driver.c,337 :: 		Label6.Active          = 1;
	MOVLW       1
	MOVWF       _Label6+14 
;CISTERNA_driver.c,338 :: 		Label6.Caption         = Label6_Caption;
	MOVLW       _Label6_Caption+0
	MOVWF       _Label6+7 
	MOVLW       hi_addr(_Label6_Caption+0)
	MOVWF       _Label6+8 
;CISTERNA_driver.c,339 :: 		Label6.FontName        = Constantia9x11_Regular;
	MOVLW       _Constantia9x11_Regular+0
	MOVWF       R3 
	MOVLW       hi_addr(_Constantia9x11_Regular+0)
	MOVWF       R4 
	MOVLW       higher_addr(_Constantia9x11_Regular+0)
	MOVWF       R5 
	MOVF        R3, 0 
	MOVWF       _Label6+9 
	MOVF        R4, 0 
	MOVWF       _Label6+10 
	MOVF        R5, 0 
	MOVWF       _Label6+11 
;CISTERNA_driver.c,340 :: 		Label6.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label6+12 
;CISTERNA_driver.c,341 :: 		Label6.OnUpPtr         = 0;
	CLRF        _Label6+15 
	CLRF        _Label6+16 
	CLRF        _Label6+17 
	CLRF        _Label6+18 
;CISTERNA_driver.c,342 :: 		Label6.OnDownPtr       = 0;
	CLRF        _Label6+19 
	CLRF        _Label6+20 
	CLRF        _Label6+21 
	CLRF        _Label6+22 
;CISTERNA_driver.c,343 :: 		Label6.OnClickPtr      = 0;
	CLRF        _Label6+23 
	CLRF        _Label6+24 
	CLRF        _Label6+25 
	CLRF        _Label6+26 
;CISTERNA_driver.c,344 :: 		Label6.OnPressPtr      = 0;
	CLRF        _Label6+27 
	CLRF        _Label6+28 
	CLRF        _Label6+29 
	CLRF        _Label6+30 
;CISTERNA_driver.c,346 :: 		Label7.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Label7+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Label7+1 
;CISTERNA_driver.c,347 :: 		Label7.Order           = 1;
	MOVLW       1
	MOVWF       _Label7+2 
;CISTERNA_driver.c,348 :: 		Label7.Left            = 6;
	MOVLW       6
	MOVWF       _Label7+3 
;CISTERNA_driver.c,349 :: 		Label7.Top             = 38;
	MOVLW       38
	MOVWF       _Label7+4 
;CISTERNA_driver.c,350 :: 		Label7.Width           = 61;
	MOVLW       61
	MOVWF       _Label7+5 
;CISTERNA_driver.c,351 :: 		Label7.Height          = 12;
	MOVLW       12
	MOVWF       _Label7+6 
;CISTERNA_driver.c,352 :: 		Label7.Visible         = 1;
	MOVLW       1
	MOVWF       _Label7+13 
;CISTERNA_driver.c,353 :: 		Label7.Active          = 1;
	MOVLW       1
	MOVWF       _Label7+14 
;CISTERNA_driver.c,354 :: 		Label7.Caption         = Label7_Caption;
	MOVLW       _Label7_Caption+0
	MOVWF       _Label7+7 
	MOVLW       hi_addr(_Label7_Caption+0)
	MOVWF       _Label7+8 
;CISTERNA_driver.c,355 :: 		Label7.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label7+9 
	MOVF        R4, 0 
	MOVWF       _Label7+10 
	MOVF        R5, 0 
	MOVWF       _Label7+11 
;CISTERNA_driver.c,356 :: 		Label7.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label7+12 
;CISTERNA_driver.c,357 :: 		Label7.OnUpPtr         = 0;
	CLRF        _Label7+15 
	CLRF        _Label7+16 
	CLRF        _Label7+17 
	CLRF        _Label7+18 
;CISTERNA_driver.c,358 :: 		Label7.OnDownPtr       = 0;
	CLRF        _Label7+19 
	CLRF        _Label7+20 
	CLRF        _Label7+21 
	CLRF        _Label7+22 
;CISTERNA_driver.c,359 :: 		Label7.OnClickPtr      = 0;
	CLRF        _Label7+23 
	CLRF        _Label7+24 
	CLRF        _Label7+25 
	CLRF        _Label7+26 
;CISTERNA_driver.c,360 :: 		Label7.OnPressPtr      = 0;
	CLRF        _Label7+27 
	CLRF        _Label7+28 
	CLRF        _Label7+29 
	CLRF        _Label7+30 
;CISTERNA_driver.c,362 :: 		Label8.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Label8+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Label8+1 
;CISTERNA_driver.c,363 :: 		Label8.Order           = 2;
	MOVLW       2
	MOVWF       _Label8+2 
;CISTERNA_driver.c,364 :: 		Label8.Left            = 6;
	MOVLW       6
	MOVWF       _Label8+3 
;CISTERNA_driver.c,365 :: 		Label8.Top             = 50;
	MOVLW       50
	MOVWF       _Label8+4 
;CISTERNA_driver.c,366 :: 		Label8.Width           = 61;
	MOVLW       61
	MOVWF       _Label8+5 
;CISTERNA_driver.c,367 :: 		Label8.Height          = 12;
	MOVLW       12
	MOVWF       _Label8+6 
;CISTERNA_driver.c,368 :: 		Label8.Visible         = 1;
	MOVLW       1
	MOVWF       _Label8+13 
;CISTERNA_driver.c,369 :: 		Label8.Active          = 1;
	MOVLW       1
	MOVWF       _Label8+14 
;CISTERNA_driver.c,370 :: 		Label8.Caption         = Label8_Caption;
	MOVLW       _Label8_Caption+0
	MOVWF       _Label8+7 
	MOVLW       hi_addr(_Label8_Caption+0)
	MOVWF       _Label8+8 
;CISTERNA_driver.c,371 :: 		Label8.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label8+9 
	MOVF        R4, 0 
	MOVWF       _Label8+10 
	MOVF        R5, 0 
	MOVWF       _Label8+11 
;CISTERNA_driver.c,372 :: 		Label8.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label8+12 
;CISTERNA_driver.c,373 :: 		Label8.OnUpPtr         = 0;
	CLRF        _Label8+15 
	CLRF        _Label8+16 
	CLRF        _Label8+17 
	CLRF        _Label8+18 
;CISTERNA_driver.c,374 :: 		Label8.OnDownPtr       = 0;
	CLRF        _Label8+19 
	CLRF        _Label8+20 
	CLRF        _Label8+21 
	CLRF        _Label8+22 
;CISTERNA_driver.c,375 :: 		Label8.OnClickPtr      = 0;
	CLRF        _Label8+23 
	CLRF        _Label8+24 
	CLRF        _Label8+25 
	CLRF        _Label8+26 
;CISTERNA_driver.c,376 :: 		Label8.OnPressPtr      = 0;
	CLRF        _Label8+27 
	CLRF        _Label8+28 
	CLRF        _Label8+29 
	CLRF        _Label8+30 
;CISTERNA_driver.c,378 :: 		NvCistP.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _NvCistP+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _NvCistP+1 
;CISTERNA_driver.c,379 :: 		NvCistP.Order           = 3;
	MOVLW       3
	MOVWF       _NvCistP+2 
;CISTERNA_driver.c,380 :: 		NvCistP.Left            = 93;
	MOVLW       93
	MOVWF       _NvCistP+3 
;CISTERNA_driver.c,381 :: 		NvCistP.Top             = 13;
	MOVLW       13
	MOVWF       _NvCistP+4 
;CISTERNA_driver.c,382 :: 		NvCistP.Width           = 22;
	MOVLW       22
	MOVWF       _NvCistP+5 
;CISTERNA_driver.c,383 :: 		NvCistP.Height          = 12;
	MOVLW       12
	MOVWF       _NvCistP+6 
;CISTERNA_driver.c,384 :: 		NvCistP.Visible         = 1;
	MOVLW       1
	MOVWF       _NvCistP+13 
;CISTERNA_driver.c,385 :: 		NvCistP.Active          = 1;
	MOVLW       1
	MOVWF       _NvCistP+14 
;CISTERNA_driver.c,386 :: 		NvCistP.Caption         = NvCistP_Caption;
	MOVLW       _NvCistP_Caption+0
	MOVWF       _NvCistP+7 
	MOVLW       hi_addr(_NvCistP_Caption+0)
	MOVWF       _NvCistP+8 
;CISTERNA_driver.c,387 :: 		NvCistP.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _NvCistP+9 
	MOVF        R4, 0 
	MOVWF       _NvCistP+10 
	MOVF        R5, 0 
	MOVWF       _NvCistP+11 
;CISTERNA_driver.c,388 :: 		NvCistP.Font_Color      = 1;
	MOVLW       1
	MOVWF       _NvCistP+12 
;CISTERNA_driver.c,389 :: 		NvCistP.OnUpPtr         = 0;
	CLRF        _NvCistP+15 
	CLRF        _NvCistP+16 
	CLRF        _NvCistP+17 
	CLRF        _NvCistP+18 
;CISTERNA_driver.c,390 :: 		NvCistP.OnDownPtr       = 0;
	CLRF        _NvCistP+19 
	CLRF        _NvCistP+20 
	CLRF        _NvCistP+21 
	CLRF        _NvCistP+22 
;CISTERNA_driver.c,391 :: 		NvCistP.OnClickPtr      = 0;
	CLRF        _NvCistP+23 
	CLRF        _NvCistP+24 
	CLRF        _NvCistP+25 
	CLRF        _NvCistP+26 
;CISTERNA_driver.c,392 :: 		NvCistP.OnPressPtr      = 0;
	CLRF        _NvCistP+27 
	CLRF        _NvCistP+28 
	CLRF        _NvCistP+29 
	CLRF        _NvCistP+30 
;CISTERNA_driver.c,394 :: 		NvCist1.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _NvCist1+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _NvCist1+1 
;CISTERNA_driver.c,395 :: 		NvCist1.Order           = 4;
	MOVLW       4
	MOVWF       _NvCist1+2 
;CISTERNA_driver.c,396 :: 		NvCist1.Left            = 93;
	MOVLW       93
	MOVWF       _NvCist1+3 
;CISTERNA_driver.c,397 :: 		NvCist1.Top             = 25;
	MOVLW       25
	MOVWF       _NvCist1+4 
;CISTERNA_driver.c,398 :: 		NvCist1.Width           = 22;
	MOVLW       22
	MOVWF       _NvCist1+5 
;CISTERNA_driver.c,399 :: 		NvCist1.Height          = 12;
	MOVLW       12
	MOVWF       _NvCist1+6 
;CISTERNA_driver.c,400 :: 		NvCist1.Visible         = 1;
	MOVLW       1
	MOVWF       _NvCist1+13 
;CISTERNA_driver.c,401 :: 		NvCist1.Active          = 1;
	MOVLW       1
	MOVWF       _NvCist1+14 
;CISTERNA_driver.c,402 :: 		NvCist1.Caption         = NvCist1_Caption;
	MOVLW       _NvCist1_Caption+0
	MOVWF       _NvCist1+7 
	MOVLW       hi_addr(_NvCist1_Caption+0)
	MOVWF       _NvCist1+8 
;CISTERNA_driver.c,403 :: 		NvCist1.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _NvCist1+9 
	MOVF        R4, 0 
	MOVWF       _NvCist1+10 
	MOVF        R5, 0 
	MOVWF       _NvCist1+11 
;CISTERNA_driver.c,404 :: 		NvCist1.Font_Color      = 1;
	MOVLW       1
	MOVWF       _NvCist1+12 
;CISTERNA_driver.c,405 :: 		NvCist1.OnUpPtr         = 0;
	CLRF        _NvCist1+15 
	CLRF        _NvCist1+16 
	CLRF        _NvCist1+17 
	CLRF        _NvCist1+18 
;CISTERNA_driver.c,406 :: 		NvCist1.OnDownPtr       = 0;
	CLRF        _NvCist1+19 
	CLRF        _NvCist1+20 
	CLRF        _NvCist1+21 
	CLRF        _NvCist1+22 
;CISTERNA_driver.c,407 :: 		NvCist1.OnClickPtr      = 0;
	CLRF        _NvCist1+23 
	CLRF        _NvCist1+24 
	CLRF        _NvCist1+25 
	CLRF        _NvCist1+26 
;CISTERNA_driver.c,408 :: 		NvCist1.OnPressPtr      = 0;
	CLRF        _NvCist1+27 
	CLRF        _NvCist1+28 
	CLRF        _NvCist1+29 
	CLRF        _NvCist1+30 
;CISTERNA_driver.c,410 :: 		NvCist2.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _NvCist2+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _NvCist2+1 
;CISTERNA_driver.c,411 :: 		NvCist2.Order           = 5;
	MOVLW       5
	MOVWF       _NvCist2+2 
;CISTERNA_driver.c,412 :: 		NvCist2.Left            = 93;
	MOVLW       93
	MOVWF       _NvCist2+3 
;CISTERNA_driver.c,413 :: 		NvCist2.Top             = 38;
	MOVLW       38
	MOVWF       _NvCist2+4 
;CISTERNA_driver.c,414 :: 		NvCist2.Width           = 22;
	MOVLW       22
	MOVWF       _NvCist2+5 
;CISTERNA_driver.c,415 :: 		NvCist2.Height          = 12;
	MOVLW       12
	MOVWF       _NvCist2+6 
;CISTERNA_driver.c,416 :: 		NvCist2.Visible         = 1;
	MOVLW       1
	MOVWF       _NvCist2+13 
;CISTERNA_driver.c,417 :: 		NvCist2.Active          = 1;
	MOVLW       1
	MOVWF       _NvCist2+14 
;CISTERNA_driver.c,418 :: 		NvCist2.Caption         = NvCist2_Caption;
	MOVLW       _NvCist2_Caption+0
	MOVWF       _NvCist2+7 
	MOVLW       hi_addr(_NvCist2_Caption+0)
	MOVWF       _NvCist2+8 
;CISTERNA_driver.c,419 :: 		NvCist2.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _NvCist2+9 
	MOVF        R4, 0 
	MOVWF       _NvCist2+10 
	MOVF        R5, 0 
	MOVWF       _NvCist2+11 
;CISTERNA_driver.c,420 :: 		NvCist2.Font_Color      = 1;
	MOVLW       1
	MOVWF       _NvCist2+12 
;CISTERNA_driver.c,421 :: 		NvCist2.OnUpPtr         = 0;
	CLRF        _NvCist2+15 
	CLRF        _NvCist2+16 
	CLRF        _NvCist2+17 
	CLRF        _NvCist2+18 
;CISTERNA_driver.c,422 :: 		NvCist2.OnDownPtr       = 0;
	CLRF        _NvCist2+19 
	CLRF        _NvCist2+20 
	CLRF        _NvCist2+21 
	CLRF        _NvCist2+22 
;CISTERNA_driver.c,423 :: 		NvCist2.OnClickPtr      = 0;
	CLRF        _NvCist2+23 
	CLRF        _NvCist2+24 
	CLRF        _NvCist2+25 
	CLRF        _NvCist2+26 
;CISTERNA_driver.c,424 :: 		NvCist2.OnPressPtr      = 0;
	CLRF        _NvCist2+27 
	CLRF        _NvCist2+28 
	CLRF        _NvCist2+29 
	CLRF        _NvCist2+30 
;CISTERNA_driver.c,426 :: 		NvCistR.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _NvCistR+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _NvCistR+1 
;CISTERNA_driver.c,427 :: 		NvCistR.Order           = 6;
	MOVLW       6
	MOVWF       _NvCistR+2 
;CISTERNA_driver.c,428 :: 		NvCistR.Left            = 93;
	MOVLW       93
	MOVWF       _NvCistR+3 
;CISTERNA_driver.c,429 :: 		NvCistR.Top             = 50;
	MOVLW       50
	MOVWF       _NvCistR+4 
;CISTERNA_driver.c,430 :: 		NvCistR.Width           = 22;
	MOVLW       22
	MOVWF       _NvCistR+5 
;CISTERNA_driver.c,431 :: 		NvCistR.Height          = 12;
	MOVLW       12
	MOVWF       _NvCistR+6 
;CISTERNA_driver.c,432 :: 		NvCistR.Visible         = 1;
	MOVLW       1
	MOVWF       _NvCistR+13 
;CISTERNA_driver.c,433 :: 		NvCistR.Active          = 1;
	MOVLW       1
	MOVWF       _NvCistR+14 
;CISTERNA_driver.c,434 :: 		NvCistR.Caption         = NvCistR_Caption;
	MOVLW       _NvCistR_Caption+0
	MOVWF       _NvCistR+7 
	MOVLW       hi_addr(_NvCistR_Caption+0)
	MOVWF       _NvCistR+8 
;CISTERNA_driver.c,435 :: 		NvCistR.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _NvCistR+9 
	MOVF        R4, 0 
	MOVWF       _NvCistR+10 
	MOVF        R5, 0 
	MOVWF       _NvCistR+11 
;CISTERNA_driver.c,436 :: 		NvCistR.Font_Color      = 1;
	MOVLW       1
	MOVWF       _NvCistR+12 
;CISTERNA_driver.c,437 :: 		NvCistR.OnUpPtr         = 0;
	CLRF        _NvCistR+15 
	CLRF        _NvCistR+16 
	CLRF        _NvCistR+17 
	CLRF        _NvCistR+18 
;CISTERNA_driver.c,438 :: 		NvCistR.OnDownPtr       = 0;
	CLRF        _NvCistR+19 
	CLRF        _NvCistR+20 
	CLRF        _NvCistR+21 
	CLRF        _NvCistR+22 
;CISTERNA_driver.c,439 :: 		NvCistR.OnClickPtr      = 0;
	CLRF        _NvCistR+23 
	CLRF        _NvCistR+24 
	CLRF        _NvCistR+25 
	CLRF        _NvCistR+26 
;CISTERNA_driver.c,440 :: 		NvCistR.OnPressPtr      = 0;
	CLRF        _NvCistR+27 
	CLRF        _NvCistR+28 
	CLRF        _NvCistR+29 
	CLRF        _NvCistR+30 
;CISTERNA_driver.c,442 :: 		Label5.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Label5+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Label5+1 
;CISTERNA_driver.c,443 :: 		Label5.Order           = 7;
	MOVLW       7
	MOVWF       _Label5+2 
;CISTERNA_driver.c,444 :: 		Label5.Left            = 6;
	MOVLW       6
	MOVWF       _Label5+3 
;CISTERNA_driver.c,445 :: 		Label5.Top             = 13;
	MOVLW       13
	MOVWF       _Label5+4 
;CISTERNA_driver.c,446 :: 		Label5.Width           = 60;
	MOVLW       60
	MOVWF       _Label5+5 
;CISTERNA_driver.c,447 :: 		Label5.Height          = 12;
	MOVLW       12
	MOVWF       _Label5+6 
;CISTERNA_driver.c,448 :: 		Label5.Visible         = 1;
	MOVLW       1
	MOVWF       _Label5+13 
;CISTERNA_driver.c,449 :: 		Label5.Active          = 1;
	MOVLW       1
	MOVWF       _Label5+14 
;CISTERNA_driver.c,450 :: 		Label5.Caption         = Label5_Caption;
	MOVLW       _Label5_Caption+0
	MOVWF       _Label5+7 
	MOVLW       hi_addr(_Label5_Caption+0)
	MOVWF       _Label5+8 
;CISTERNA_driver.c,451 :: 		Label5.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label5+9 
	MOVF        R4, 0 
	MOVWF       _Label5+10 
	MOVF        R5, 0 
	MOVWF       _Label5+11 
;CISTERNA_driver.c,452 :: 		Label5.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label5+12 
;CISTERNA_driver.c,453 :: 		Label5.OnUpPtr         = 0;
	CLRF        _Label5+15 
	CLRF        _Label5+16 
	CLRF        _Label5+17 
	CLRF        _Label5+18 
;CISTERNA_driver.c,454 :: 		Label5.OnDownPtr       = 0;
	CLRF        _Label5+19 
	CLRF        _Label5+20 
	CLRF        _Label5+21 
	CLRF        _Label5+22 
;CISTERNA_driver.c,455 :: 		Label5.OnClickPtr      = 0;
	CLRF        _Label5+23 
	CLRF        _Label5+24 
	CLRF        _Label5+25 
	CLRF        _Label5+26 
;CISTERNA_driver.c,456 :: 		Label5.OnPressPtr      = 0;
	CLRF        _Label5+27 
	CLRF        _Label5+28 
	CLRF        _Label5+29 
	CLRF        _Label5+30 
;CISTERNA_driver.c,458 :: 		Label9.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Label9+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Label9+1 
;CISTERNA_driver.c,459 :: 		Label9.Order           = 8;
	MOVLW       8
	MOVWF       _Label9+2 
;CISTERNA_driver.c,460 :: 		Label9.Left            = 6;
	MOVLW       6
	MOVWF       _Label9+3 
;CISTERNA_driver.c,461 :: 		Label9.Top             = 1;
	MOVLW       1
	MOVWF       _Label9+4 
;CISTERNA_driver.c,462 :: 		Label9.Width           = 81;
	MOVLW       81
	MOVWF       _Label9+5 
;CISTERNA_driver.c,463 :: 		Label9.Height          = 10;
	MOVLW       10
	MOVWF       _Label9+6 
;CISTERNA_driver.c,464 :: 		Label9.Visible         = 1;
	MOVLW       1
	MOVWF       _Label9+13 
;CISTERNA_driver.c,465 :: 		Label9.Active          = 1;
	MOVLW       1
	MOVWF       _Label9+14 
;CISTERNA_driver.c,466 :: 		Label9.Caption         = Label9_Caption;
	MOVLW       _Label9_Caption+0
	MOVWF       _Label9+7 
	MOVLW       hi_addr(_Label9_Caption+0)
	MOVWF       _Label9+8 
;CISTERNA_driver.c,467 :: 		Label9.FontName        = Bahnschrift_SemiBold8x11_Regular;
	MOVLW       _Bahnschrift_SemiBold8x11_Regular+0
	MOVWF       R0 
	MOVLW       hi_addr(_Bahnschrift_SemiBold8x11_Regular+0)
	MOVWF       R1 
	MOVLW       higher_addr(_Bahnschrift_SemiBold8x11_Regular+0)
	MOVWF       R2 
	MOVF        R0, 0 
	MOVWF       _Label9+9 
	MOVF        R1, 0 
	MOVWF       _Label9+10 
	MOVF        R2, 0 
	MOVWF       _Label9+11 
;CISTERNA_driver.c,468 :: 		Label9.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label9+12 
;CISTERNA_driver.c,469 :: 		Label9.OnUpPtr         = 0;
	CLRF        _Label9+15 
	CLRF        _Label9+16 
	CLRF        _Label9+17 
	CLRF        _Label9+18 
;CISTERNA_driver.c,470 :: 		Label9.OnDownPtr       = 0;
	CLRF        _Label9+19 
	CLRF        _Label9+20 
	CLRF        _Label9+21 
	CLRF        _Label9+22 
;CISTERNA_driver.c,471 :: 		Label9.OnClickPtr      = 0;
	CLRF        _Label9+23 
	CLRF        _Label9+24 
	CLRF        _Label9+25 
	CLRF        _Label9+26 
;CISTERNA_driver.c,472 :: 		Label9.OnPressPtr      = 0;
	CLRF        _Label9+27 
	CLRF        _Label9+28 
	CLRF        _Label9+29 
	CLRF        _Label9+30 
;CISTERNA_driver.c,474 :: 		Line3.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Line3+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Line3+1 
;CISTERNA_driver.c,475 :: 		Line3.Order           = 9;
	MOVLW       9
	MOVWF       _Line3+2 
;CISTERNA_driver.c,476 :: 		Line3.First_Point_X   = 3;
	MOVLW       3
	MOVWF       _Line3+3 
;CISTERNA_driver.c,477 :: 		Line3.First_Point_Y   = 61;
	MOVLW       61
	MOVWF       _Line3+4 
;CISTERNA_driver.c,478 :: 		Line3.Second_Point_X  = 119;
	MOVLW       119
	MOVWF       _Line3+5 
;CISTERNA_driver.c,479 :: 		Line3.Second_Point_Y  = 61;
	MOVLW       61
	MOVWF       _Line3+6 
;CISTERNA_driver.c,480 :: 		Line3.Visible         = 1;
	MOVLW       1
	MOVWF       _Line3+7 
;CISTERNA_driver.c,482 :: 		Line4.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Line4+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Line4+1 
;CISTERNA_driver.c,483 :: 		Line4.Order           = 10;
	MOVLW       10
	MOVWF       _Line4+2 
;CISTERNA_driver.c,484 :: 		Line4.First_Point_X   = 3;
	MOVLW       3
	MOVWF       _Line4+3 
;CISTERNA_driver.c,485 :: 		Line4.First_Point_Y   = 12;
	MOVLW       12
	MOVWF       _Line4+4 
;CISTERNA_driver.c,486 :: 		Line4.Second_Point_X  = 119;
	MOVLW       119
	MOVWF       _Line4+5 
;CISTERNA_driver.c,487 :: 		Line4.Second_Point_Y  = 12;
	MOVLW       12
	MOVWF       _Line4+6 
;CISTERNA_driver.c,488 :: 		Line4.Visible         = 1;
	MOVLW       1
	MOVWF       _Line4+7 
;CISTERNA_driver.c,490 :: 		Label10.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label10+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label10+1 
;CISTERNA_driver.c,491 :: 		Label10.Order           = 0;
	CLRF        _Label10+2 
;CISTERNA_driver.c,492 :: 		Label10.Left            = 6;
	MOVLW       6
	MOVWF       _Label10+3 
;CISTERNA_driver.c,493 :: 		Label10.Top             = 25;
	MOVLW       25
	MOVWF       _Label10+4 
;CISTERNA_driver.c,494 :: 		Label10.Width           = 70;
	MOVLW       70
	MOVWF       _Label10+5 
;CISTERNA_driver.c,495 :: 		Label10.Height          = 12;
	MOVLW       12
	MOVWF       _Label10+6 
;CISTERNA_driver.c,496 :: 		Label10.Visible         = 1;
	MOVLW       1
	MOVWF       _Label10+13 
;CISTERNA_driver.c,497 :: 		Label10.Active          = 1;
	MOVLW       1
	MOVWF       _Label10+14 
;CISTERNA_driver.c,498 :: 		Label10.Caption         = Label10_Caption;
	MOVLW       _Label10_Caption+0
	MOVWF       _Label10+7 
	MOVLW       hi_addr(_Label10_Caption+0)
	MOVWF       _Label10+8 
;CISTERNA_driver.c,499 :: 		Label10.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label10+9 
	MOVF        R4, 0 
	MOVWF       _Label10+10 
	MOVF        R5, 0 
	MOVWF       _Label10+11 
;CISTERNA_driver.c,500 :: 		Label10.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label10+12 
;CISTERNA_driver.c,501 :: 		Label10.OnUpPtr         = 0;
	CLRF        _Label10+15 
	CLRF        _Label10+16 
	CLRF        _Label10+17 
	CLRF        _Label10+18 
;CISTERNA_driver.c,502 :: 		Label10.OnDownPtr       = 0;
	CLRF        _Label10+19 
	CLRF        _Label10+20 
	CLRF        _Label10+21 
	CLRF        _Label10+22 
;CISTERNA_driver.c,503 :: 		Label10.OnClickPtr      = 0;
	CLRF        _Label10+23 
	CLRF        _Label10+24 
	CLRF        _Label10+25 
	CLRF        _Label10+26 
;CISTERNA_driver.c,504 :: 		Label10.OnPressPtr      = 0;
	CLRF        _Label10+27 
	CLRF        _Label10+28 
	CLRF        _Label10+29 
	CLRF        _Label10+30 
;CISTERNA_driver.c,506 :: 		Label11.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label11+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label11+1 
;CISTERNA_driver.c,507 :: 		Label11.Order           = 1;
	MOVLW       1
	MOVWF       _Label11+2 
;CISTERNA_driver.c,508 :: 		Label11.Left            = 6;
	MOVLW       6
	MOVWF       _Label11+3 
;CISTERNA_driver.c,509 :: 		Label11.Top             = 38;
	MOVLW       38
	MOVWF       _Label11+4 
;CISTERNA_driver.c,510 :: 		Label11.Width           = 69;
	MOVLW       69
	MOVWF       _Label11+5 
;CISTERNA_driver.c,511 :: 		Label11.Height          = 12;
	MOVLW       12
	MOVWF       _Label11+6 
;CISTERNA_driver.c,512 :: 		Label11.Visible         = 1;
	MOVLW       1
	MOVWF       _Label11+13 
;CISTERNA_driver.c,513 :: 		Label11.Active          = 1;
	MOVLW       1
	MOVWF       _Label11+14 
;CISTERNA_driver.c,514 :: 		Label11.Caption         = Label11_Caption;
	MOVLW       _Label11_Caption+0
	MOVWF       _Label11+7 
	MOVLW       hi_addr(_Label11_Caption+0)
	MOVWF       _Label11+8 
;CISTERNA_driver.c,515 :: 		Label11.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label11+9 
	MOVF        R4, 0 
	MOVWF       _Label11+10 
	MOVF        R5, 0 
	MOVWF       _Label11+11 
;CISTERNA_driver.c,516 :: 		Label11.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label11+12 
;CISTERNA_driver.c,517 :: 		Label11.OnUpPtr         = 0;
	CLRF        _Label11+15 
	CLRF        _Label11+16 
	CLRF        _Label11+17 
	CLRF        _Label11+18 
;CISTERNA_driver.c,518 :: 		Label11.OnDownPtr       = 0;
	CLRF        _Label11+19 
	CLRF        _Label11+20 
	CLRF        _Label11+21 
	CLRF        _Label11+22 
;CISTERNA_driver.c,519 :: 		Label11.OnClickPtr      = 0;
	CLRF        _Label11+23 
	CLRF        _Label11+24 
	CLRF        _Label11+25 
	CLRF        _Label11+26 
;CISTERNA_driver.c,520 :: 		Label11.OnPressPtr      = 0;
	CLRF        _Label11+27 
	CLRF        _Label11+28 
	CLRF        _Label11+29 
	CLRF        _Label11+30 
;CISTERNA_driver.c,522 :: 		Label12.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label12+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label12+1 
;CISTERNA_driver.c,523 :: 		Label12.Order           = 2;
	MOVLW       2
	MOVWF       _Label12+2 
;CISTERNA_driver.c,524 :: 		Label12.Left            = 6;
	MOVLW       6
	MOVWF       _Label12+3 
;CISTERNA_driver.c,525 :: 		Label12.Top             = 50;
	MOVLW       50
	MOVWF       _Label12+4 
;CISTERNA_driver.c,526 :: 		Label12.Width           = 70;
	MOVLW       70
	MOVWF       _Label12+5 
;CISTERNA_driver.c,527 :: 		Label12.Height          = 12;
	MOVLW       12
	MOVWF       _Label12+6 
;CISTERNA_driver.c,528 :: 		Label12.Visible         = 1;
	MOVLW       1
	MOVWF       _Label12+13 
;CISTERNA_driver.c,529 :: 		Label12.Active          = 1;
	MOVLW       1
	MOVWF       _Label12+14 
;CISTERNA_driver.c,530 :: 		Label12.Caption         = Label12_Caption;
	MOVLW       _Label12_Caption+0
	MOVWF       _Label12+7 
	MOVLW       hi_addr(_Label12_Caption+0)
	MOVWF       _Label12+8 
;CISTERNA_driver.c,531 :: 		Label12.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label12+9 
	MOVF        R4, 0 
	MOVWF       _Label12+10 
	MOVF        R5, 0 
	MOVWF       _Label12+11 
;CISTERNA_driver.c,532 :: 		Label12.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label12+12 
;CISTERNA_driver.c,533 :: 		Label12.OnUpPtr         = 0;
	CLRF        _Label12+15 
	CLRF        _Label12+16 
	CLRF        _Label12+17 
	CLRF        _Label12+18 
;CISTERNA_driver.c,534 :: 		Label12.OnDownPtr       = 0;
	CLRF        _Label12+19 
	CLRF        _Label12+20 
	CLRF        _Label12+21 
	CLRF        _Label12+22 
;CISTERNA_driver.c,535 :: 		Label12.OnClickPtr      = 0;
	CLRF        _Label12+23 
	CLRF        _Label12+24 
	CLRF        _Label12+25 
	CLRF        _Label12+26 
;CISTERNA_driver.c,536 :: 		Label12.OnPressPtr      = 0;
	CLRF        _Label12+27 
	CLRF        _Label12+28 
	CLRF        _Label12+29 
	CLRF        _Label12+30 
;CISTERNA_driver.c,538 :: 		RT_BP.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _RT_BP+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _RT_BP+1 
;CISTERNA_driver.c,539 :: 		RT_BP.Order           = 3;
	MOVLW       3
	MOVWF       _RT_BP+2 
;CISTERNA_driver.c,540 :: 		RT_BP.Left            = 93;
	MOVLW       93
	MOVWF       _RT_BP+3 
;CISTERNA_driver.c,541 :: 		RT_BP.Top             = 13;
	MOVLW       13
	MOVWF       _RT_BP+4 
;CISTERNA_driver.c,542 :: 		RT_BP.Width           = 31;
	MOVLW       31
	MOVWF       _RT_BP+5 
;CISTERNA_driver.c,543 :: 		RT_BP.Height          = 12;
	MOVLW       12
	MOVWF       _RT_BP+6 
;CISTERNA_driver.c,544 :: 		RT_BP.Visible         = 1;
	MOVLW       1
	MOVWF       _RT_BP+13 
;CISTERNA_driver.c,545 :: 		RT_BP.Active          = 1;
	MOVLW       1
	MOVWF       _RT_BP+14 
;CISTERNA_driver.c,546 :: 		RT_BP.Caption         = RT_BP_Caption;
	MOVLW       _RT_BP_Caption+0
	MOVWF       _RT_BP+7 
	MOVLW       hi_addr(_RT_BP_Caption+0)
	MOVWF       _RT_BP+8 
;CISTERNA_driver.c,547 :: 		RT_BP.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _RT_BP+9 
	MOVF        R4, 0 
	MOVWF       _RT_BP+10 
	MOVF        R5, 0 
	MOVWF       _RT_BP+11 
;CISTERNA_driver.c,548 :: 		RT_BP.Font_Color      = 1;
	MOVLW       1
	MOVWF       _RT_BP+12 
;CISTERNA_driver.c,549 :: 		RT_BP.OnUpPtr         = 0;
	CLRF        _RT_BP+15 
	CLRF        _RT_BP+16 
	CLRF        _RT_BP+17 
	CLRF        _RT_BP+18 
;CISTERNA_driver.c,550 :: 		RT_BP.OnDownPtr       = 0;
	CLRF        _RT_BP+19 
	CLRF        _RT_BP+20 
	CLRF        _RT_BP+21 
	CLRF        _RT_BP+22 
;CISTERNA_driver.c,551 :: 		RT_BP.OnClickPtr      = 0;
	CLRF        _RT_BP+23 
	CLRF        _RT_BP+24 
	CLRF        _RT_BP+25 
	CLRF        _RT_BP+26 
;CISTERNA_driver.c,552 :: 		RT_BP.OnPressPtr      = 0;
	CLRF        _RT_BP+27 
	CLRF        _RT_BP+28 
	CLRF        _RT_BP+29 
	CLRF        _RT_BP+30 
;CISTERNA_driver.c,554 :: 		Label14.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label14+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label14+1 
;CISTERNA_driver.c,555 :: 		Label14.Order           = 4;
	MOVLW       4
	MOVWF       _Label14+2 
;CISTERNA_driver.c,556 :: 		Label14.Left            = 93;
	MOVLW       93
	MOVWF       _Label14+3 
;CISTERNA_driver.c,557 :: 		Label14.Top             = 25;
	MOVLW       25
	MOVWF       _Label14+4 
;CISTERNA_driver.c,558 :: 		Label14.Width           = 31;
	MOVLW       31
	MOVWF       _Label14+5 
;CISTERNA_driver.c,559 :: 		Label14.Height          = 12;
	MOVLW       12
	MOVWF       _Label14+6 
;CISTERNA_driver.c,560 :: 		Label14.Visible         = 1;
	MOVLW       1
	MOVWF       _Label14+13 
;CISTERNA_driver.c,561 :: 		Label14.Active          = 1;
	MOVLW       1
	MOVWF       _Label14+14 
;CISTERNA_driver.c,562 :: 		Label14.Caption         = Label14_Caption;
	MOVLW       _Label14_Caption+0
	MOVWF       _Label14+7 
	MOVLW       hi_addr(_Label14_Caption+0)
	MOVWF       _Label14+8 
;CISTERNA_driver.c,563 :: 		Label14.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label14+9 
	MOVF        R4, 0 
	MOVWF       _Label14+10 
	MOVF        R5, 0 
	MOVWF       _Label14+11 
;CISTERNA_driver.c,564 :: 		Label14.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label14+12 
;CISTERNA_driver.c,565 :: 		Label14.OnUpPtr         = 0;
	CLRF        _Label14+15 
	CLRF        _Label14+16 
	CLRF        _Label14+17 
	CLRF        _Label14+18 
;CISTERNA_driver.c,566 :: 		Label14.OnDownPtr       = 0;
	CLRF        _Label14+19 
	CLRF        _Label14+20 
	CLRF        _Label14+21 
	CLRF        _Label14+22 
;CISTERNA_driver.c,567 :: 		Label14.OnClickPtr      = 0;
	CLRF        _Label14+23 
	CLRF        _Label14+24 
	CLRF        _Label14+25 
	CLRF        _Label14+26 
;CISTERNA_driver.c,568 :: 		Label14.OnPressPtr      = 0;
	CLRF        _Label14+27 
	CLRF        _Label14+28 
	CLRF        _Label14+29 
	CLRF        _Label14+30 
;CISTERNA_driver.c,570 :: 		Label15.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label15+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label15+1 
;CISTERNA_driver.c,571 :: 		Label15.Order           = 5;
	MOVLW       5
	MOVWF       _Label15+2 
;CISTERNA_driver.c,572 :: 		Label15.Left            = 93;
	MOVLW       93
	MOVWF       _Label15+3 
;CISTERNA_driver.c,573 :: 		Label15.Top             = 38;
	MOVLW       38
	MOVWF       _Label15+4 
;CISTERNA_driver.c,574 :: 		Label15.Width           = 18;
	MOVLW       18
	MOVWF       _Label15+5 
;CISTERNA_driver.c,575 :: 		Label15.Height          = 12;
	MOVLW       12
	MOVWF       _Label15+6 
;CISTERNA_driver.c,576 :: 		Label15.Visible         = 1;
	MOVLW       1
	MOVWF       _Label15+13 
;CISTERNA_driver.c,577 :: 		Label15.Active          = 1;
	MOVLW       1
	MOVWF       _Label15+14 
;CISTERNA_driver.c,578 :: 		Label15.Caption         = Label15_Caption;
	MOVLW       _Label15_Caption+0
	MOVWF       _Label15+7 
	MOVLW       hi_addr(_Label15_Caption+0)
	MOVWF       _Label15+8 
;CISTERNA_driver.c,579 :: 		Label15.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label15+9 
	MOVF        R4, 0 
	MOVWF       _Label15+10 
	MOVF        R5, 0 
	MOVWF       _Label15+11 
;CISTERNA_driver.c,580 :: 		Label15.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label15+12 
;CISTERNA_driver.c,581 :: 		Label15.OnUpPtr         = 0;
	CLRF        _Label15+15 
	CLRF        _Label15+16 
	CLRF        _Label15+17 
	CLRF        _Label15+18 
;CISTERNA_driver.c,582 :: 		Label15.OnDownPtr       = 0;
	CLRF        _Label15+19 
	CLRF        _Label15+20 
	CLRF        _Label15+21 
	CLRF        _Label15+22 
;CISTERNA_driver.c,583 :: 		Label15.OnClickPtr      = 0;
	CLRF        _Label15+23 
	CLRF        _Label15+24 
	CLRF        _Label15+25 
	CLRF        _Label15+26 
;CISTERNA_driver.c,584 :: 		Label15.OnPressPtr      = 0;
	CLRF        _Label15+27 
	CLRF        _Label15+28 
	CLRF        _Label15+29 
	CLRF        _Label15+30 
;CISTERNA_driver.c,586 :: 		Label16.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label16+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label16+1 
;CISTERNA_driver.c,587 :: 		Label16.Order           = 6;
	MOVLW       6
	MOVWF       _Label16+2 
;CISTERNA_driver.c,588 :: 		Label16.Left            = 93;
	MOVLW       93
	MOVWF       _Label16+3 
;CISTERNA_driver.c,589 :: 		Label16.Top             = 50;
	MOVLW       50
	MOVWF       _Label16+4 
;CISTERNA_driver.c,590 :: 		Label16.Width           = 13;
	MOVLW       13
	MOVWF       _Label16+5 
;CISTERNA_driver.c,591 :: 		Label16.Height          = 12;
	MOVLW       12
	MOVWF       _Label16+6 
;CISTERNA_driver.c,592 :: 		Label16.Visible         = 1;
	MOVLW       1
	MOVWF       _Label16+13 
;CISTERNA_driver.c,593 :: 		Label16.Active          = 1;
	MOVLW       1
	MOVWF       _Label16+14 
;CISTERNA_driver.c,594 :: 		Label16.Caption         = Label16_Caption;
	MOVLW       _Label16_Caption+0
	MOVWF       _Label16+7 
	MOVLW       hi_addr(_Label16_Caption+0)
	MOVWF       _Label16+8 
;CISTERNA_driver.c,595 :: 		Label16.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label16+9 
	MOVF        R4, 0 
	MOVWF       _Label16+10 
	MOVF        R5, 0 
	MOVWF       _Label16+11 
;CISTERNA_driver.c,596 :: 		Label16.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label16+12 
;CISTERNA_driver.c,597 :: 		Label16.OnUpPtr         = 0;
	CLRF        _Label16+15 
	CLRF        _Label16+16 
	CLRF        _Label16+17 
	CLRF        _Label16+18 
;CISTERNA_driver.c,598 :: 		Label16.OnDownPtr       = 0;
	CLRF        _Label16+19 
	CLRF        _Label16+20 
	CLRF        _Label16+21 
	CLRF        _Label16+22 
;CISTERNA_driver.c,599 :: 		Label16.OnClickPtr      = 0;
	CLRF        _Label16+23 
	CLRF        _Label16+24 
	CLRF        _Label16+25 
	CLRF        _Label16+26 
;CISTERNA_driver.c,600 :: 		Label16.OnPressPtr      = 0;
	CLRF        _Label16+27 
	CLRF        _Label16+28 
	CLRF        _Label16+29 
	CLRF        _Label16+30 
;CISTERNA_driver.c,602 :: 		Label17.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label17+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label17+1 
;CISTERNA_driver.c,603 :: 		Label17.Order           = 7;
	MOVLW       7
	MOVWF       _Label17+2 
;CISTERNA_driver.c,604 :: 		Label17.Left            = 6;
	MOVLW       6
	MOVWF       _Label17+3 
;CISTERNA_driver.c,605 :: 		Label17.Top             = 13;
	MOVLW       13
	MOVWF       _Label17+4 
;CISTERNA_driver.c,606 :: 		Label17.Width           = 69;
	MOVLW       69
	MOVWF       _Label17+5 
;CISTERNA_driver.c,607 :: 		Label17.Height          = 12;
	MOVLW       12
	MOVWF       _Label17+6 
;CISTERNA_driver.c,608 :: 		Label17.Visible         = 1;
	MOVLW       1
	MOVWF       _Label17+13 
;CISTERNA_driver.c,609 :: 		Label17.Active          = 1;
	MOVLW       1
	MOVWF       _Label17+14 
;CISTERNA_driver.c,610 :: 		Label17.Caption         = Label17_Caption;
	MOVLW       _Label17_Caption+0
	MOVWF       _Label17+7 
	MOVLW       hi_addr(_Label17_Caption+0)
	MOVWF       _Label17+8 
;CISTERNA_driver.c,611 :: 		Label17.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label17+9 
	MOVF        R4, 0 
	MOVWF       _Label17+10 
	MOVF        R5, 0 
	MOVWF       _Label17+11 
;CISTERNA_driver.c,612 :: 		Label17.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label17+12 
;CISTERNA_driver.c,613 :: 		Label17.OnUpPtr         = 0;
	CLRF        _Label17+15 
	CLRF        _Label17+16 
	CLRF        _Label17+17 
	CLRF        _Label17+18 
;CISTERNA_driver.c,614 :: 		Label17.OnDownPtr       = 0;
	CLRF        _Label17+19 
	CLRF        _Label17+20 
	CLRF        _Label17+21 
	CLRF        _Label17+22 
;CISTERNA_driver.c,615 :: 		Label17.OnClickPtr      = 0;
	CLRF        _Label17+23 
	CLRF        _Label17+24 
	CLRF        _Label17+25 
	CLRF        _Label17+26 
;CISTERNA_driver.c,616 :: 		Label17.OnPressPtr      = 0;
	CLRF        _Label17+27 
	CLRF        _Label17+28 
	CLRF        _Label17+29 
	CLRF        _Label17+30 
;CISTERNA_driver.c,618 :: 		Label18.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label18+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label18+1 
;CISTERNA_driver.c,619 :: 		Label18.Order           = 8;
	MOVLW       8
	MOVWF       _Label18+2 
;CISTERNA_driver.c,620 :: 		Label18.Left            = 32;
	MOVLW       32
	MOVWF       _Label18+3 
;CISTERNA_driver.c,621 :: 		Label18.Top             = 1;
	MOVLW       1
	MOVWF       _Label18+4 
;CISTERNA_driver.c,622 :: 		Label18.Width           = 59;
	MOVLW       59
	MOVWF       _Label18+5 
;CISTERNA_driver.c,623 :: 		Label18.Height          = 10;
	MOVLW       10
	MOVWF       _Label18+6 
;CISTERNA_driver.c,624 :: 		Label18.Visible         = 1;
	MOVLW       1
	MOVWF       _Label18+13 
;CISTERNA_driver.c,625 :: 		Label18.Active          = 1;
	MOVLW       1
	MOVWF       _Label18+14 
;CISTERNA_driver.c,626 :: 		Label18.Caption         = Label18_Caption;
	MOVLW       _Label18_Caption+0
	MOVWF       _Label18+7 
	MOVLW       hi_addr(_Label18_Caption+0)
	MOVWF       _Label18+8 
;CISTERNA_driver.c,627 :: 		Label18.FontName        = Bahnschrift_SemiBold8x11_Regular;
	MOVF        R0, 0 
	MOVWF       _Label18+9 
	MOVF        R1, 0 
	MOVWF       _Label18+10 
	MOVF        R2, 0 
	MOVWF       _Label18+11 
;CISTERNA_driver.c,628 :: 		Label18.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label18+12 
;CISTERNA_driver.c,629 :: 		Label18.OnUpPtr         = 0;
	CLRF        _Label18+15 
	CLRF        _Label18+16 
	CLRF        _Label18+17 
	CLRF        _Label18+18 
;CISTERNA_driver.c,630 :: 		Label18.OnDownPtr       = 0;
	CLRF        _Label18+19 
	CLRF        _Label18+20 
	CLRF        _Label18+21 
	CLRF        _Label18+22 
;CISTERNA_driver.c,631 :: 		Label18.OnClickPtr      = 0;
	CLRF        _Label18+23 
	CLRF        _Label18+24 
	CLRF        _Label18+25 
	CLRF        _Label18+26 
;CISTERNA_driver.c,632 :: 		Label18.OnPressPtr      = 0;
	CLRF        _Label18+27 
	CLRF        _Label18+28 
	CLRF        _Label18+29 
	CLRF        _Label18+30 
;CISTERNA_driver.c,634 :: 		Line1.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Line1+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Line1+1 
;CISTERNA_driver.c,635 :: 		Line1.Order           = 9;
	MOVLW       9
	MOVWF       _Line1+2 
;CISTERNA_driver.c,636 :: 		Line1.First_Point_X   = 3;
	MOVLW       3
	MOVWF       _Line1+3 
;CISTERNA_driver.c,637 :: 		Line1.First_Point_Y   = 61;
	MOVLW       61
	MOVWF       _Line1+4 
;CISTERNA_driver.c,638 :: 		Line1.Second_Point_X  = 119;
	MOVLW       119
	MOVWF       _Line1+5 
;CISTERNA_driver.c,639 :: 		Line1.Second_Point_Y  = 61;
	MOVLW       61
	MOVWF       _Line1+6 
;CISTERNA_driver.c,640 :: 		Line1.Visible         = 1;
	MOVLW       1
	MOVWF       _Line1+7 
;CISTERNA_driver.c,642 :: 		Line2.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Line2+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Line2+1 
;CISTERNA_driver.c,643 :: 		Line2.Order           = 10;
	MOVLW       10
	MOVWF       _Line2+2 
;CISTERNA_driver.c,644 :: 		Line2.First_Point_X   = 3;
	MOVLW       3
	MOVWF       _Line2+3 
;CISTERNA_driver.c,645 :: 		Line2.First_Point_Y   = 12;
	MOVLW       12
	MOVWF       _Line2+4 
;CISTERNA_driver.c,646 :: 		Line2.Second_Point_X  = 119;
	MOVLW       119
	MOVWF       _Line2+5 
;CISTERNA_driver.c,647 :: 		Line2.Second_Point_Y  = 12;
	MOVLW       12
	MOVWF       _Line2+6 
;CISTERNA_driver.c,648 :: 		Line2.Visible         = 1;
	MOVLW       1
	MOVWF       _Line2+7 
;CISTERNA_driver.c,650 :: 		Image4.OwnerScreen     = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Image4+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Image4+1 
;CISTERNA_driver.c,651 :: 		Image4.Order           = 11;
	MOVLW       11
	MOVWF       _Image4+2 
;CISTERNA_driver.c,652 :: 		Image4.Left            = 117;
	MOVLW       117
	MOVWF       _Image4+3 
;CISTERNA_driver.c,653 :: 		Image4.Top             = 41;
	MOVLW       41
	MOVWF       _Image4+4 
;CISTERNA_driver.c,654 :: 		Image4.Width           = 6;
	MOVLW       6
	MOVWF       _Image4+5 
;CISTERNA_driver.c,655 :: 		Image4.Height          = 6;
	MOVLW       6
	MOVWF       _Image4+6 
;CISTERNA_driver.c,656 :: 		Image4.PictureWidth    = 6;
	MOVLW       6
	MOVWF       _Image4+7 
;CISTERNA_driver.c,657 :: 		Image4.PictureHeight   = 6;
	MOVLW       6
	MOVWF       _Image4+8 
;CISTERNA_driver.c,658 :: 		Image4.Picture_Name    = seta_bmp;
	MOVLW       _seta_bmp+0
	MOVWF       R0 
	MOVLW       hi_addr(_seta_bmp+0)
	MOVWF       R1 
	MOVLW       higher_addr(_seta_bmp+0)
	MOVWF       R2 
	MOVF        R0, 0 
	MOVWF       _Image4+9 
	MOVF        R1, 0 
	MOVWF       _Image4+10 
	MOVF        R2, 0 
	MOVWF       _Image4+11 
;CISTERNA_driver.c,659 :: 		Image4.Visible         = 1;
	MOVLW       1
	MOVWF       _Image4+12 
;CISTERNA_driver.c,660 :: 		Image4.Active          = 1;
	MOVLW       1
	MOVWF       _Image4+13 
;CISTERNA_driver.c,661 :: 		Image4.OnUpPtr         = 0;
	CLRF        _Image4+14 
	CLRF        _Image4+15 
	CLRF        _Image4+16 
	CLRF        _Image4+17 
;CISTERNA_driver.c,662 :: 		Image4.OnDownPtr       = 0;
	CLRF        _Image4+18 
	CLRF        _Image4+19 
	CLRF        _Image4+20 
	CLRF        _Image4+21 
;CISTERNA_driver.c,663 :: 		Image4.OnClickPtr      = 0;
	CLRF        _Image4+22 
	CLRF        _Image4+23 
	CLRF        _Image4+24 
	CLRF        _Image4+25 
;CISTERNA_driver.c,664 :: 		Image4.OnPressPtr      = 0;
	CLRF        _Image4+26 
	CLRF        _Image4+27 
	CLRF        _Image4+28 
	CLRF        _Image4+29 
;CISTERNA_driver.c,665 :: 		}
L_end_InitializeObjects:
	RETURN      0
; end of CISTERNA_driver_InitializeObjects

CISTERNA_driver_IsInsideObject:

;CISTERNA_driver.c,667 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
;CISTERNA_driver.c,668 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
	MOVF        FARG_CISTERNA_driver_IsInsideObject_Left+1, 0 
	SUBWF       FARG_CISTERNA_driver_IsInsideObject_X+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CISTERNA_driver_IsInsideObject19
	MOVF        FARG_CISTERNA_driver_IsInsideObject_Left+0, 0 
	SUBWF       FARG_CISTERNA_driver_IsInsideObject_X+0, 0 
L_CISTERNA_driver_IsInsideObject19:
	BTFSS       STATUS+0, 0 
	GOTO        L_CISTERNA_driver_IsInsideObject2
	MOVF        FARG_CISTERNA_driver_IsInsideObject_Width+0, 0 
	ADDWF       FARG_CISTERNA_driver_IsInsideObject_Left+0, 0 
	MOVWF       R0 
	MOVF        FARG_CISTERNA_driver_IsInsideObject_Width+1, 0 
	ADDWFC      FARG_CISTERNA_driver_IsInsideObject_Left+1, 0 
	MOVWF       R1 
	MOVLW       1
	SUBWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	SUBWFB      R1, 0 
	MOVWF       R3 
	MOVF        FARG_CISTERNA_driver_IsInsideObject_X+1, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CISTERNA_driver_IsInsideObject20
	MOVF        FARG_CISTERNA_driver_IsInsideObject_X+0, 0 
	SUBWF       R2, 0 
L_CISTERNA_driver_IsInsideObject20:
	BTFSS       STATUS+0, 0 
	GOTO        L_CISTERNA_driver_IsInsideObject2
;CISTERNA_driver.c,669 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
	MOVF        FARG_CISTERNA_driver_IsInsideObject_Top+1, 0 
	SUBWF       FARG_CISTERNA_driver_IsInsideObject_Y+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CISTERNA_driver_IsInsideObject21
	MOVF        FARG_CISTERNA_driver_IsInsideObject_Top+0, 0 
	SUBWF       FARG_CISTERNA_driver_IsInsideObject_Y+0, 0 
L_CISTERNA_driver_IsInsideObject21:
	BTFSS       STATUS+0, 0 
	GOTO        L_CISTERNA_driver_IsInsideObject2
	MOVF        FARG_CISTERNA_driver_IsInsideObject_Height+0, 0 
	ADDWF       FARG_CISTERNA_driver_IsInsideObject_Top+0, 0 
	MOVWF       R0 
	MOVF        FARG_CISTERNA_driver_IsInsideObject_Height+1, 0 
	ADDWFC      FARG_CISTERNA_driver_IsInsideObject_Top+1, 0 
	MOVWF       R1 
	MOVLW       1
	SUBWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	SUBWFB      R1, 0 
	MOVWF       R3 
	MOVF        FARG_CISTERNA_driver_IsInsideObject_Y+1, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CISTERNA_driver_IsInsideObject22
	MOVF        FARG_CISTERNA_driver_IsInsideObject_Y+0, 0 
	SUBWF       R2, 0 
L_CISTERNA_driver_IsInsideObject22:
	BTFSS       STATUS+0, 0 
	GOTO        L_CISTERNA_driver_IsInsideObject2
L_CISTERNA_driver_IsInsideObject15:
;CISTERNA_driver.c,670 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_IsInsideObject
L_CISTERNA_driver_IsInsideObject2:
;CISTERNA_driver.c,672 :: 		return 0;
	CLRF        R0 
;CISTERNA_driver.c,673 :: 		}
L_end_IsInsideObject:
	RETURN      0
; end of CISTERNA_driver_IsInsideObject

_DrawLabel:

;CISTERNA_driver.c,681 :: 		void DrawLabel(TLabel *ALabel) {
;CISTERNA_driver.c,682 :: 		if (ALabel->Visible == 1) {
	MOVLW       13
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawLabel4
;CISTERNA_driver.c,683 :: 		Glcd_Set_Font_Adv(ALabel->FontName, ALabel->Font_Color, _GLCD_HORIZONTAL);
	MOVLW       9
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+2 
	MOVLW       12
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Set_Font_Adv_font_color+0 
	CLRF        FARG_Glcd_Set_Font_Adv_font_orientation+0 
	CALL        _Glcd_Set_Font_Adv+0, 0
;CISTERNA_driver.c,684 :: 		Glcd_Write_Text_Adv(ALabel->Caption, ALabel->Left, ALabel->Top);
	MOVLW       7
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       3
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       4
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;CISTERNA_driver.c,685 :: 		}
L_DrawLabel4:
;CISTERNA_driver.c,686 :: 		}
L_end_DrawLabel:
	RETURN      0
; end of _DrawLabel

_DrawImage:

;CISTERNA_driver.c,688 :: 		void DrawImage(TImage *AImage) {
;CISTERNA_driver.c,689 :: 		if (AImage->Visible == 1) {
	MOVLW       12
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawImage5
;CISTERNA_driver.c,690 :: 		Glcd_PartialImage(AImage->Left, AImage->Top, AImage->Width,
	MOVLW       3
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_PartialImage_x_left+0 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_x_left+1 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_x_left+1 
	MOVLW       4
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_PartialImage_y_top+0 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_y_top+1 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_y_top+1 
	MOVLW       5
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_PartialImage_width+0 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_width+1 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_width+1 
;CISTERNA_driver.c,691 :: 		AImage->Height, AImage->PictureWidth, AImage->PictureHeight,
	MOVLW       6
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_PartialImage_height+0 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_height+1 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_height+1 
	MOVLW       7
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_PartialImage_picture_width+0 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_picture_width+1 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_picture_width+1 
	MOVLW       8
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_PartialImage_picture_height+0 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_picture_height+1 
	MOVLW       0
	MOVWF       FARG_Glcd_PartialImage_picture_height+1 
;CISTERNA_driver.c,692 :: 		AImage->Picture_Name);
	MOVLW       9
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_PartialImage_image+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_PartialImage_image+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_PartialImage_image+2 
	CALL        _Glcd_PartialImage+0, 0
;CISTERNA_driver.c,693 :: 		}
L_DrawImage5:
;CISTERNA_driver.c,694 :: 		}
L_end_DrawImage:
	RETURN      0
; end of _DrawImage

_DrawLine:

;CISTERNA_driver.c,696 :: 		void DrawLine(TLine *Aline) {
;CISTERNA_driver.c,697 :: 		if (Aline->Visible == 1) {
	MOVLW       7
	ADDWF       FARG_DrawLine_Aline+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawLine_Aline+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawLine6
;CISTERNA_driver.c,698 :: 		Glcd_Line(Aline->First_Point_X, Aline->First_Point_Y, Aline->Second_Point_X, Aline->Second_Point_Y, _clDraw);
	MOVLW       3
	ADDWF       FARG_DrawLine_Aline+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawLine_Aline+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Line_x_start+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Line_x_start+1 
	MOVLW       0
	MOVWF       FARG_Glcd_Line_x_start+1 
	MOVLW       4
	ADDWF       FARG_DrawLine_Aline+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawLine_Aline+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Line_y_start+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Line_y_start+1 
	MOVLW       0
	MOVWF       FARG_Glcd_Line_y_start+1 
	MOVLW       5
	ADDWF       FARG_DrawLine_Aline+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawLine_Aline+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Line_x_end+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Line_x_end+1 
	MOVLW       0
	MOVWF       FARG_Glcd_Line_x_end+1 
	MOVLW       6
	ADDWF       FARG_DrawLine_Aline+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_DrawLine_Aline+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Line_y_end+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Line_y_end+1 
	MOVLW       0
	MOVWF       FARG_Glcd_Line_y_end+1 
	MOVLW       1
	MOVWF       FARG_Glcd_Line_color+0 
	CALL        _Glcd_Line+0, 0
;CISTERNA_driver.c,699 :: 		}
L_DrawLine6:
;CISTERNA_driver.c,700 :: 		}
L_end_DrawLine:
	RETURN      0
; end of _DrawLine

_DrawScreen:

;CISTERNA_driver.c,702 :: 		void DrawScreen(TScreen *aScreen) {
;CISTERNA_driver.c,711 :: 		object_pressed = 0;
	CLRF        _object_pressed+0 
;CISTERNA_driver.c,712 :: 		order = 0;
	CLRF        DrawScreen_order_L0+0 
	CLRF        DrawScreen_order_L0+1 
;CISTERNA_driver.c,713 :: 		label_idx = 0;
	CLRF        DrawScreen_label_idx_L0+0 
;CISTERNA_driver.c,714 :: 		image_idx = 0;
	CLRF        DrawScreen_image_idx_L0+0 
;CISTERNA_driver.c,715 :: 		line_idx = 0;
	CLRF        DrawScreen_line_idx_L0+0 
;CISTERNA_driver.c,716 :: 		CurrentScreen = aScreen;
	MOVF        FARG_DrawScreen_aScreen+0, 0 
	MOVWF       _CurrentScreen+0 
	MOVF        FARG_DrawScreen_aScreen+1, 0 
	MOVWF       _CurrentScreen+1 
;CISTERNA_driver.c,718 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;CISTERNA_driver.c,720 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen7:
	MOVFF       _CurrentScreen+0, FSR0L+0
	MOVFF       _CurrentScreen+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       128
	XORWF       DrawScreen_order_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen27
	MOVF        R1, 0 
	SUBWF       DrawScreen_order_L0+0, 0 
L__DrawScreen27:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen8
;CISTERNA_driver.c,721 :: 		if (label_idx < CurrentScreen->LabelsCount) {
	MOVLW       1
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2L+0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen28
	MOVF        R1, 0 
	SUBWF       DrawScreen_label_idx_L0+0, 0 
L__DrawScreen28:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen9
;CISTERNA_driver.c,722 :: 		local_label = GetLabel(label_idx);
	MOVLW       3
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0L+1 
	MOVF        DrawScreen_label_idx_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTR+0 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTR+1 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTR+2 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R0, 0 
	MOVWF       DrawScreen_local_label_L0+0 
	MOVF        R1, 0 
	MOVWF       DrawScreen_local_label_L0+1 
;CISTERNA_driver.c,723 :: 		if (order == local_label->Order) {
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR2L+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       DrawScreen_order_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen29
	MOVF        R1, 0 
	XORWF       DrawScreen_order_L0+0, 0 
L__DrawScreen29:
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawScreen10
;CISTERNA_driver.c,724 :: 		label_idx++;
	INCF        DrawScreen_label_idx_L0+0, 1 
;CISTERNA_driver.c,725 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CISTERNA_driver.c,726 :: 		DrawLabel(local_label);
	MOVF        DrawScreen_local_label_L0+0, 0 
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVF        DrawScreen_local_label_L0+1, 0 
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CISTERNA_driver.c,727 :: 		}
L_DrawScreen10:
;CISTERNA_driver.c,728 :: 		}
L_DrawScreen9:
;CISTERNA_driver.c,730 :: 		if (line_idx  < CurrentScreen->LinesCount) {
	MOVLW       11
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2L+0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen30
	MOVF        R1, 0 
	SUBWF       DrawScreen_line_idx_L0+0, 0 
L__DrawScreen30:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen11
;CISTERNA_driver.c,731 :: 		local_line = GetLine(line_idx);
	MOVLW       13
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0L+1 
	MOVF        DrawScreen_line_idx_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTR+0 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTR+1 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTR+2 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R0, 0 
	MOVWF       DrawScreen_local_line_L0+0 
	MOVF        R1, 0 
	MOVWF       DrawScreen_local_line_L0+1 
;CISTERNA_driver.c,732 :: 		if (order == local_line->Order) {
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR2L+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       DrawScreen_order_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen31
	MOVF        R1, 0 
	XORWF       DrawScreen_order_L0+0, 0 
L__DrawScreen31:
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawScreen12
;CISTERNA_driver.c,733 :: 		line_idx++;
	INCF        DrawScreen_line_idx_L0+0, 1 
;CISTERNA_driver.c,734 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CISTERNA_driver.c,735 :: 		DrawLine(local_line);
	MOVF        DrawScreen_local_line_L0+0, 0 
	MOVWF       FARG_DrawLine_Aline+0 
	MOVF        DrawScreen_local_line_L0+1, 0 
	MOVWF       FARG_DrawLine_Aline+1 
	CALL        _DrawLine+0, 0
;CISTERNA_driver.c,736 :: 		}
L_DrawScreen12:
;CISTERNA_driver.c,737 :: 		}
L_DrawScreen11:
;CISTERNA_driver.c,739 :: 		if (image_idx  < CurrentScreen->ImagesCount) {
	MOVLW       6
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2L+0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen32
	MOVF        R1, 0 
	SUBWF       DrawScreen_image_idx_L0+0, 0 
L__DrawScreen32:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen13
;CISTERNA_driver.c,740 :: 		local_image = GetImage(image_idx);
	MOVLW       8
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0L+1 
	MOVF        DrawScreen_image_idx_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTR+0 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTR+1 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTR+2 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R0, 0 
	MOVWF       DrawScreen_local_image_L0+0 
	MOVF        R1, 0 
	MOVWF       DrawScreen_local_image_L0+1 
;CISTERNA_driver.c,741 :: 		if (order == local_image->Order) {
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR2L+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       DrawScreen_order_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen33
	MOVF        R1, 0 
	XORWF       DrawScreen_order_L0+0, 0 
L__DrawScreen33:
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawScreen14
;CISTERNA_driver.c,742 :: 		image_idx++;
	INCF        DrawScreen_image_idx_L0+0, 1 
;CISTERNA_driver.c,743 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CISTERNA_driver.c,744 :: 		DrawImage(local_image);
	MOVF        DrawScreen_local_image_L0+0, 0 
	MOVWF       FARG_DrawImage_AImage+0 
	MOVF        DrawScreen_local_image_L0+1, 0 
	MOVWF       FARG_DrawImage_AImage+1 
	CALL        _DrawImage+0, 0
;CISTERNA_driver.c,745 :: 		}
L_DrawScreen14:
;CISTERNA_driver.c,746 :: 		}
L_DrawScreen13:
;CISTERNA_driver.c,748 :: 		}
	GOTO        L_DrawScreen7
L_DrawScreen8:
;CISTERNA_driver.c,749 :: 		}
L_end_DrawScreen:
	RETURN      0
; end of _DrawScreen

_Init_MCU:

;CISTERNA_driver.c,751 :: 		void Init_MCU() {
;CISTERNA_driver.c,752 :: 		ANSELA = 3; // Configure AN0 and AN1 pins as analog
	MOVLW       3
	MOVWF       ANSELA+0 
;CISTERNA_driver.c,753 :: 		ANSELB = 0; // Configure PORTB pins as digital
	CLRF        ANSELB+0 
;CISTERNA_driver.c,754 :: 		ANSELC = 0; // Configure PORTC pins as digital
	CLRF        ANSELC+0 
;CISTERNA_driver.c,755 :: 		ANSELD = 0; // Configure PORTD pins as digital
	CLRF        ANSELD+0 
;CISTERNA_driver.c,756 :: 		TRISA  = 3; // Configure AN0 and AN1 pins as input
	MOVLW       3
	MOVWF       TRISA+0 
;CISTERNA_driver.c,757 :: 		}
L_end_Init_MCU:
	RETURN      0
; end of _Init_MCU

_Start_TP:

;CISTERNA_driver.c,759 :: 		void Start_TP() {
;CISTERNA_driver.c,760 :: 		Init_MCU();
	CALL        _Init_MCU+0, 0
;CISTERNA_driver.c,762 :: 		InitializeTouchPanel();
	CALL        CISTERNA_driver_InitializeTouchPanel+0, 0
;CISTERNA_driver.c,764 :: 		InitializeObjects();
	CALL        CISTERNA_driver_InitializeObjects+0, 0
;CISTERNA_driver.c,765 :: 		DrawScreen(&Tela_Inicial);
	MOVLW       _Tela_Inicial+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_driver.c,766 :: 		}
L_end_Start_TP:
	RETURN      0
; end of _Start_TP

CISTERNA_driver____?ag:

L_end_CISTERNA_driver___?ag:
	RETURN      0
; end of CISTERNA_driver____?ag
