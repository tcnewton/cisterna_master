
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

;CISTERNA_driver.c,171 :: 		static void InitializeObjects() {
;CISTERNA_driver.c,172 :: 		Tela_Inicial.LabelsCount               = 10;
	MOVLW       10
	MOVWF       _Tela_Inicial+1 
	MOVLW       0
	MOVWF       _Tela_Inicial+2 
;CISTERNA_driver.c,173 :: 		Tela_Inicial.Labels                    = Screen1_Labels;
	MOVLW       _Screen1_Labels+0
	MOVWF       _Tela_Inicial+3 
	MOVLW       hi_addr(_Screen1_Labels+0)
	MOVWF       _Tela_Inicial+4 
	MOVLW       higher_addr(_Screen1_Labels+0)
	MOVWF       _Tela_Inicial+5 
;CISTERNA_driver.c,174 :: 		Tela_Inicial.ImagesCount               = 0;
	CLRF        _Tela_Inicial+6 
	CLRF        _Tela_Inicial+7 
;CISTERNA_driver.c,175 :: 		Tela_Inicial.LinesCount                = 2;
	MOVLW       2
	MOVWF       _Tela_Inicial+11 
	MOVLW       0
	MOVWF       _Tela_Inicial+12 
;CISTERNA_driver.c,176 :: 		Tela_Inicial.Lines                     = Screen1_Lines;
	MOVLW       _Screen1_Lines+0
	MOVWF       _Tela_Inicial+13 
	MOVLW       hi_addr(_Screen1_Lines+0)
	MOVWF       _Tela_Inicial+14 
	MOVLW       higher_addr(_Screen1_Lines+0)
	MOVWF       _Tela_Inicial+15 
;CISTERNA_driver.c,177 :: 		Tela_Inicial.ObjectsCount              = 12;
	MOVLW       12
	MOVWF       _Tela_Inicial+0 
;CISTERNA_driver.c,179 :: 		Misc1.LabelsCount               = 10;
	MOVLW       10
	MOVWF       _Misc1+1 
	MOVLW       0
	MOVWF       _Misc1+2 
;CISTERNA_driver.c,180 :: 		Misc1.Labels                    = Screen2_Labels;
	MOVLW       _Screen2_Labels+0
	MOVWF       _Misc1+3 
	MOVLW       hi_addr(_Screen2_Labels+0)
	MOVWF       _Misc1+4 
	MOVLW       higher_addr(_Screen2_Labels+0)
	MOVWF       _Misc1+5 
;CISTERNA_driver.c,181 :: 		Misc1.ImagesCount               = 1;
	MOVLW       1
	MOVWF       _Misc1+6 
	MOVLW       0
	MOVWF       _Misc1+7 
;CISTERNA_driver.c,182 :: 		Misc1.Images                    = Screen2_Images;
	MOVLW       _Screen2_Images+0
	MOVWF       _Misc1+8 
	MOVLW       hi_addr(_Screen2_Images+0)
	MOVWF       _Misc1+9 
	MOVLW       higher_addr(_Screen2_Images+0)
	MOVWF       _Misc1+10 
;CISTERNA_driver.c,183 :: 		Misc1.LinesCount                = 2;
	MOVLW       2
	MOVWF       _Misc1+11 
	MOVLW       0
	MOVWF       _Misc1+12 
;CISTERNA_driver.c,184 :: 		Misc1.Lines                     = Screen2_Lines;
	MOVLW       _Screen2_Lines+0
	MOVWF       _Misc1+13 
	MOVLW       hi_addr(_Screen2_Lines+0)
	MOVWF       _Misc1+14 
	MOVLW       higher_addr(_Screen2_Lines+0)
	MOVWF       _Misc1+15 
;CISTERNA_driver.c,185 :: 		Misc1.ObjectsCount              = 13;
	MOVLW       13
	MOVWF       _Misc1+0 
;CISTERNA_driver.c,188 :: 		Label6.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Label6+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Label6+1 
;CISTERNA_driver.c,189 :: 		Label6.Order           = 0;
	CLRF        _Label6+2 
;CISTERNA_driver.c,190 :: 		Label6.Left            = 6;
	MOVLW       6
	MOVWF       _Label6+3 
;CISTERNA_driver.c,191 :: 		Label6.Top             = 26;
	MOVLW       26
	MOVWF       _Label6+4 
;CISTERNA_driver.c,192 :: 		Label6.Width           = 61;
	MOVLW       61
	MOVWF       _Label6+5 
;CISTERNA_driver.c,193 :: 		Label6.Height          = 12;
	MOVLW       12
	MOVWF       _Label6+6 
;CISTERNA_driver.c,194 :: 		Label6.Visible         = 1;
	MOVLW       1
	MOVWF       _Label6+13 
;CISTERNA_driver.c,195 :: 		Label6.Active          = 1;
	MOVLW       1
	MOVWF       _Label6+14 
;CISTERNA_driver.c,196 :: 		Label6.Caption         = Label6_Caption;
	MOVLW       _Label6_Caption+0
	MOVWF       _Label6+7 
	MOVLW       hi_addr(_Label6_Caption+0)
	MOVWF       _Label6+8 
;CISTERNA_driver.c,197 :: 		Label6.FontName        = Constantia9x11_Regular;
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
;CISTERNA_driver.c,198 :: 		Label6.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label6+12 
;CISTERNA_driver.c,199 :: 		Label6.OnUpPtr         = 0;
	CLRF        _Label6+15 
	CLRF        _Label6+16 
	CLRF        _Label6+17 
	CLRF        _Label6+18 
;CISTERNA_driver.c,200 :: 		Label6.OnDownPtr       = 0;
	CLRF        _Label6+19 
	CLRF        _Label6+20 
	CLRF        _Label6+21 
	CLRF        _Label6+22 
;CISTERNA_driver.c,201 :: 		Label6.OnClickPtr      = 0;
	CLRF        _Label6+23 
	CLRF        _Label6+24 
	CLRF        _Label6+25 
	CLRF        _Label6+26 
;CISTERNA_driver.c,202 :: 		Label6.OnPressPtr      = 0;
	CLRF        _Label6+27 
	CLRF        _Label6+28 
	CLRF        _Label6+29 
	CLRF        _Label6+30 
;CISTERNA_driver.c,204 :: 		Label7.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Label7+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Label7+1 
;CISTERNA_driver.c,205 :: 		Label7.Order           = 1;
	MOVLW       1
	MOVWF       _Label7+2 
;CISTERNA_driver.c,206 :: 		Label7.Left            = 6;
	MOVLW       6
	MOVWF       _Label7+3 
;CISTERNA_driver.c,207 :: 		Label7.Top             = 38;
	MOVLW       38
	MOVWF       _Label7+4 
;CISTERNA_driver.c,208 :: 		Label7.Width           = 61;
	MOVLW       61
	MOVWF       _Label7+5 
;CISTERNA_driver.c,209 :: 		Label7.Height          = 12;
	MOVLW       12
	MOVWF       _Label7+6 
;CISTERNA_driver.c,210 :: 		Label7.Visible         = 1;
	MOVLW       1
	MOVWF       _Label7+13 
;CISTERNA_driver.c,211 :: 		Label7.Active          = 1;
	MOVLW       1
	MOVWF       _Label7+14 
;CISTERNA_driver.c,212 :: 		Label7.Caption         = Label7_Caption;
	MOVLW       _Label7_Caption+0
	MOVWF       _Label7+7 
	MOVLW       hi_addr(_Label7_Caption+0)
	MOVWF       _Label7+8 
;CISTERNA_driver.c,213 :: 		Label7.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label7+9 
	MOVF        R4, 0 
	MOVWF       _Label7+10 
	MOVF        R5, 0 
	MOVWF       _Label7+11 
;CISTERNA_driver.c,214 :: 		Label7.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label7+12 
;CISTERNA_driver.c,215 :: 		Label7.OnUpPtr         = 0;
	CLRF        _Label7+15 
	CLRF        _Label7+16 
	CLRF        _Label7+17 
	CLRF        _Label7+18 
;CISTERNA_driver.c,216 :: 		Label7.OnDownPtr       = 0;
	CLRF        _Label7+19 
	CLRF        _Label7+20 
	CLRF        _Label7+21 
	CLRF        _Label7+22 
;CISTERNA_driver.c,217 :: 		Label7.OnClickPtr      = 0;
	CLRF        _Label7+23 
	CLRF        _Label7+24 
	CLRF        _Label7+25 
	CLRF        _Label7+26 
;CISTERNA_driver.c,218 :: 		Label7.OnPressPtr      = 0;
	CLRF        _Label7+27 
	CLRF        _Label7+28 
	CLRF        _Label7+29 
	CLRF        _Label7+30 
;CISTERNA_driver.c,220 :: 		Label8.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Label8+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Label8+1 
;CISTERNA_driver.c,221 :: 		Label8.Order           = 2;
	MOVLW       2
	MOVWF       _Label8+2 
;CISTERNA_driver.c,222 :: 		Label8.Left            = 6;
	MOVLW       6
	MOVWF       _Label8+3 
;CISTERNA_driver.c,223 :: 		Label8.Top             = 14;
	MOVLW       14
	MOVWF       _Label8+4 
;CISTERNA_driver.c,224 :: 		Label8.Width           = 61;
	MOVLW       61
	MOVWF       _Label8+5 
;CISTERNA_driver.c,225 :: 		Label8.Height          = 12;
	MOVLW       12
	MOVWF       _Label8+6 
;CISTERNA_driver.c,226 :: 		Label8.Visible         = 1;
	MOVLW       1
	MOVWF       _Label8+13 
;CISTERNA_driver.c,227 :: 		Label8.Active          = 1;
	MOVLW       1
	MOVWF       _Label8+14 
;CISTERNA_driver.c,228 :: 		Label8.Caption         = Label8_Caption;
	MOVLW       _Label8_Caption+0
	MOVWF       _Label8+7 
	MOVLW       hi_addr(_Label8_Caption+0)
	MOVWF       _Label8+8 
;CISTERNA_driver.c,229 :: 		Label8.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label8+9 
	MOVF        R4, 0 
	MOVWF       _Label8+10 
	MOVF        R5, 0 
	MOVWF       _Label8+11 
;CISTERNA_driver.c,230 :: 		Label8.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label8+12 
;CISTERNA_driver.c,231 :: 		Label8.OnUpPtr         = 0;
	CLRF        _Label8+15 
	CLRF        _Label8+16 
	CLRF        _Label8+17 
	CLRF        _Label8+18 
;CISTERNA_driver.c,232 :: 		Label8.OnDownPtr       = 0;
	CLRF        _Label8+19 
	CLRF        _Label8+20 
	CLRF        _Label8+21 
	CLRF        _Label8+22 
;CISTERNA_driver.c,233 :: 		Label8.OnClickPtr      = 0;
	CLRF        _Label8+23 
	CLRF        _Label8+24 
	CLRF        _Label8+25 
	CLRF        _Label8+26 
;CISTERNA_driver.c,234 :: 		Label8.OnPressPtr      = 0;
	CLRF        _Label8+27 
	CLRF        _Label8+28 
	CLRF        _Label8+29 
	CLRF        _Label8+30 
;CISTERNA_driver.c,236 :: 		NvCistP.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _NvCistP+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _NvCistP+1 
;CISTERNA_driver.c,237 :: 		NvCistP.Order           = 3;
	MOVLW       3
	MOVWF       _NvCistP+2 
;CISTERNA_driver.c,238 :: 		NvCistP.Left            = 97;
	MOVLW       97
	MOVWF       _NvCistP+3 
;CISTERNA_driver.c,239 :: 		NvCistP.Top             = 49;
	MOVLW       49
	MOVWF       _NvCistP+4 
;CISTERNA_driver.c,240 :: 		NvCistP.Width           = 22;
	MOVLW       22
	MOVWF       _NvCistP+5 
;CISTERNA_driver.c,241 :: 		NvCistP.Height          = 12;
	MOVLW       12
	MOVWF       _NvCistP+6 
;CISTERNA_driver.c,242 :: 		NvCistP.Visible         = 1;
	MOVLW       1
	MOVWF       _NvCistP+13 
;CISTERNA_driver.c,243 :: 		NvCistP.Active          = 1;
	MOVLW       1
	MOVWF       _NvCistP+14 
;CISTERNA_driver.c,244 :: 		NvCistP.Caption         = NvCistP_Caption;
	MOVLW       _NvCistP_Caption+0
	MOVWF       _NvCistP+7 
	MOVLW       hi_addr(_NvCistP_Caption+0)
	MOVWF       _NvCistP+8 
;CISTERNA_driver.c,245 :: 		NvCistP.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _NvCistP+9 
	MOVF        R4, 0 
	MOVWF       _NvCistP+10 
	MOVF        R5, 0 
	MOVWF       _NvCistP+11 
;CISTERNA_driver.c,246 :: 		NvCistP.Font_Color      = 1;
	MOVLW       1
	MOVWF       _NvCistP+12 
;CISTERNA_driver.c,247 :: 		NvCistP.OnUpPtr         = 0;
	CLRF        _NvCistP+15 
	CLRF        _NvCistP+16 
	CLRF        _NvCistP+17 
	CLRF        _NvCistP+18 
;CISTERNA_driver.c,248 :: 		NvCistP.OnDownPtr       = 0;
	CLRF        _NvCistP+19 
	CLRF        _NvCistP+20 
	CLRF        _NvCistP+21 
	CLRF        _NvCistP+22 
;CISTERNA_driver.c,249 :: 		NvCistP.OnClickPtr      = 0;
	CLRF        _NvCistP+23 
	CLRF        _NvCistP+24 
	CLRF        _NvCistP+25 
	CLRF        _NvCistP+26 
;CISTERNA_driver.c,250 :: 		NvCistP.OnPressPtr      = 0;
	CLRF        _NvCistP+27 
	CLRF        _NvCistP+28 
	CLRF        _NvCistP+29 
	CLRF        _NvCistP+30 
;CISTERNA_driver.c,252 :: 		NvCist1.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _NvCist1+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _NvCist1+1 
;CISTERNA_driver.c,253 :: 		NvCist1.Order           = 4;
	MOVLW       4
	MOVWF       _NvCist1+2 
;CISTERNA_driver.c,254 :: 		NvCist1.Left            = 97;
	MOVLW       97
	MOVWF       _NvCist1+3 
;CISTERNA_driver.c,255 :: 		NvCist1.Top             = 26;
	MOVLW       26
	MOVWF       _NvCist1+4 
;CISTERNA_driver.c,256 :: 		NvCist1.Width           = 22;
	MOVLW       22
	MOVWF       _NvCist1+5 
;CISTERNA_driver.c,257 :: 		NvCist1.Height          = 12;
	MOVLW       12
	MOVWF       _NvCist1+6 
;CISTERNA_driver.c,258 :: 		NvCist1.Visible         = 1;
	MOVLW       1
	MOVWF       _NvCist1+13 
;CISTERNA_driver.c,259 :: 		NvCist1.Active          = 1;
	MOVLW       1
	MOVWF       _NvCist1+14 
;CISTERNA_driver.c,260 :: 		NvCist1.Caption         = NvCist1_Caption;
	MOVLW       _NvCist1_Caption+0
	MOVWF       _NvCist1+7 
	MOVLW       hi_addr(_NvCist1_Caption+0)
	MOVWF       _NvCist1+8 
;CISTERNA_driver.c,261 :: 		NvCist1.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _NvCist1+9 
	MOVF        R4, 0 
	MOVWF       _NvCist1+10 
	MOVF        R5, 0 
	MOVWF       _NvCist1+11 
;CISTERNA_driver.c,262 :: 		NvCist1.Font_Color      = 1;
	MOVLW       1
	MOVWF       _NvCist1+12 
;CISTERNA_driver.c,263 :: 		NvCist1.OnUpPtr         = 0;
	CLRF        _NvCist1+15 
	CLRF        _NvCist1+16 
	CLRF        _NvCist1+17 
	CLRF        _NvCist1+18 
;CISTERNA_driver.c,264 :: 		NvCist1.OnDownPtr       = 0;
	CLRF        _NvCist1+19 
	CLRF        _NvCist1+20 
	CLRF        _NvCist1+21 
	CLRF        _NvCist1+22 
;CISTERNA_driver.c,265 :: 		NvCist1.OnClickPtr      = 0;
	CLRF        _NvCist1+23 
	CLRF        _NvCist1+24 
	CLRF        _NvCist1+25 
	CLRF        _NvCist1+26 
;CISTERNA_driver.c,266 :: 		NvCist1.OnPressPtr      = 0;
	CLRF        _NvCist1+27 
	CLRF        _NvCist1+28 
	CLRF        _NvCist1+29 
	CLRF        _NvCist1+30 
;CISTERNA_driver.c,268 :: 		NvCist2.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _NvCist2+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _NvCist2+1 
;CISTERNA_driver.c,269 :: 		NvCist2.Order           = 5;
	MOVLW       5
	MOVWF       _NvCist2+2 
;CISTERNA_driver.c,270 :: 		NvCist2.Left            = 97;
	MOVLW       97
	MOVWF       _NvCist2+3 
;CISTERNA_driver.c,271 :: 		NvCist2.Top             = 38;
	MOVLW       38
	MOVWF       _NvCist2+4 
;CISTERNA_driver.c,272 :: 		NvCist2.Width           = 22;
	MOVLW       22
	MOVWF       _NvCist2+5 
;CISTERNA_driver.c,273 :: 		NvCist2.Height          = 12;
	MOVLW       12
	MOVWF       _NvCist2+6 
;CISTERNA_driver.c,274 :: 		NvCist2.Visible         = 1;
	MOVLW       1
	MOVWF       _NvCist2+13 
;CISTERNA_driver.c,275 :: 		NvCist2.Active          = 1;
	MOVLW       1
	MOVWF       _NvCist2+14 
;CISTERNA_driver.c,276 :: 		NvCist2.Caption         = NvCist2_Caption;
	MOVLW       _NvCist2_Caption+0
	MOVWF       _NvCist2+7 
	MOVLW       hi_addr(_NvCist2_Caption+0)
	MOVWF       _NvCist2+8 
;CISTERNA_driver.c,277 :: 		NvCist2.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _NvCist2+9 
	MOVF        R4, 0 
	MOVWF       _NvCist2+10 
	MOVF        R5, 0 
	MOVWF       _NvCist2+11 
;CISTERNA_driver.c,278 :: 		NvCist2.Font_Color      = 1;
	MOVLW       1
	MOVWF       _NvCist2+12 
;CISTERNA_driver.c,279 :: 		NvCist2.OnUpPtr         = 0;
	CLRF        _NvCist2+15 
	CLRF        _NvCist2+16 
	CLRF        _NvCist2+17 
	CLRF        _NvCist2+18 
;CISTERNA_driver.c,280 :: 		NvCist2.OnDownPtr       = 0;
	CLRF        _NvCist2+19 
	CLRF        _NvCist2+20 
	CLRF        _NvCist2+21 
	CLRF        _NvCist2+22 
;CISTERNA_driver.c,281 :: 		NvCist2.OnClickPtr      = 0;
	CLRF        _NvCist2+23 
	CLRF        _NvCist2+24 
	CLRF        _NvCist2+25 
	CLRF        _NvCist2+26 
;CISTERNA_driver.c,282 :: 		NvCist2.OnPressPtr      = 0;
	CLRF        _NvCist2+27 
	CLRF        _NvCist2+28 
	CLRF        _NvCist2+29 
	CLRF        _NvCist2+30 
;CISTERNA_driver.c,284 :: 		NvCistR.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _NvCistR+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _NvCistR+1 
;CISTERNA_driver.c,285 :: 		NvCistR.Order           = 6;
	MOVLW       6
	MOVWF       _NvCistR+2 
;CISTERNA_driver.c,286 :: 		NvCistR.Left            = 97;
	MOVLW       97
	MOVWF       _NvCistR+3 
;CISTERNA_driver.c,287 :: 		NvCistR.Top             = 14;
	MOVLW       14
	MOVWF       _NvCistR+4 
;CISTERNA_driver.c,288 :: 		NvCistR.Width           = 22;
	MOVLW       22
	MOVWF       _NvCistR+5 
;CISTERNA_driver.c,289 :: 		NvCistR.Height          = 12;
	MOVLW       12
	MOVWF       _NvCistR+6 
;CISTERNA_driver.c,290 :: 		NvCistR.Visible         = 1;
	MOVLW       1
	MOVWF       _NvCistR+13 
;CISTERNA_driver.c,291 :: 		NvCistR.Active          = 1;
	MOVLW       1
	MOVWF       _NvCistR+14 
;CISTERNA_driver.c,292 :: 		NvCistR.Caption         = NvCistR_Caption;
	MOVLW       _NvCistR_Caption+0
	MOVWF       _NvCistR+7 
	MOVLW       hi_addr(_NvCistR_Caption+0)
	MOVWF       _NvCistR+8 
;CISTERNA_driver.c,293 :: 		NvCistR.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _NvCistR+9 
	MOVF        R4, 0 
	MOVWF       _NvCistR+10 
	MOVF        R5, 0 
	MOVWF       _NvCistR+11 
;CISTERNA_driver.c,294 :: 		NvCistR.Font_Color      = 1;
	MOVLW       1
	MOVWF       _NvCistR+12 
;CISTERNA_driver.c,295 :: 		NvCistR.OnUpPtr         = 0;
	CLRF        _NvCistR+15 
	CLRF        _NvCistR+16 
	CLRF        _NvCistR+17 
	CLRF        _NvCistR+18 
;CISTERNA_driver.c,296 :: 		NvCistR.OnDownPtr       = 0;
	CLRF        _NvCistR+19 
	CLRF        _NvCistR+20 
	CLRF        _NvCistR+21 
	CLRF        _NvCistR+22 
;CISTERNA_driver.c,297 :: 		NvCistR.OnClickPtr      = 0;
	CLRF        _NvCistR+23 
	CLRF        _NvCistR+24 
	CLRF        _NvCistR+25 
	CLRF        _NvCistR+26 
;CISTERNA_driver.c,298 :: 		NvCistR.OnPressPtr      = 0;
	CLRF        _NvCistR+27 
	CLRF        _NvCistR+28 
	CLRF        _NvCistR+29 
	CLRF        _NvCistR+30 
;CISTERNA_driver.c,300 :: 		Label5.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Label5+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Label5+1 
;CISTERNA_driver.c,301 :: 		Label5.Order           = 7;
	MOVLW       7
	MOVWF       _Label5+2 
;CISTERNA_driver.c,302 :: 		Label5.Left            = 6;
	MOVLW       6
	MOVWF       _Label5+3 
;CISTERNA_driver.c,303 :: 		Label5.Top             = 49;
	MOVLW       49
	MOVWF       _Label5+4 
;CISTERNA_driver.c,304 :: 		Label5.Width           = 62;
	MOVLW       62
	MOVWF       _Label5+5 
;CISTERNA_driver.c,305 :: 		Label5.Height          = 12;
	MOVLW       12
	MOVWF       _Label5+6 
;CISTERNA_driver.c,306 :: 		Label5.Visible         = 1;
	MOVLW       1
	MOVWF       _Label5+13 
;CISTERNA_driver.c,307 :: 		Label5.Active          = 1;
	MOVLW       1
	MOVWF       _Label5+14 
;CISTERNA_driver.c,308 :: 		Label5.Caption         = Label5_Caption;
	MOVLW       _Label5_Caption+0
	MOVWF       _Label5+7 
	MOVLW       hi_addr(_Label5_Caption+0)
	MOVWF       _Label5+8 
;CISTERNA_driver.c,309 :: 		Label5.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label5+9 
	MOVF        R4, 0 
	MOVWF       _Label5+10 
	MOVF        R5, 0 
	MOVWF       _Label5+11 
;CISTERNA_driver.c,310 :: 		Label5.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label5+12 
;CISTERNA_driver.c,311 :: 		Label5.OnUpPtr         = 0;
	CLRF        _Label5+15 
	CLRF        _Label5+16 
	CLRF        _Label5+17 
	CLRF        _Label5+18 
;CISTERNA_driver.c,312 :: 		Label5.OnDownPtr       = 0;
	CLRF        _Label5+19 
	CLRF        _Label5+20 
	CLRF        _Label5+21 
	CLRF        _Label5+22 
;CISTERNA_driver.c,313 :: 		Label5.OnClickPtr      = 0;
	CLRF        _Label5+23 
	CLRF        _Label5+24 
	CLRF        _Label5+25 
	CLRF        _Label5+26 
;CISTERNA_driver.c,314 :: 		Label5.OnPressPtr      = 0;
	CLRF        _Label5+27 
	CLRF        _Label5+28 
	CLRF        _Label5+29 
	CLRF        _Label5+30 
;CISTERNA_driver.c,316 :: 		Line3.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Line3+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Line3+1 
;CISTERNA_driver.c,317 :: 		Line3.Order           = 8;
	MOVLW       8
	MOVWF       _Line3+2 
;CISTERNA_driver.c,318 :: 		Line3.First_Point_X   = 3;
	MOVLW       3
	MOVWF       _Line3+3 
;CISTERNA_driver.c,319 :: 		Line3.First_Point_Y   = 61;
	MOVLW       61
	MOVWF       _Line3+4 
;CISTERNA_driver.c,320 :: 		Line3.Second_Point_X  = 119;
	MOVLW       119
	MOVWF       _Line3+5 
;CISTERNA_driver.c,321 :: 		Line3.Second_Point_Y  = 61;
	MOVLW       61
	MOVWF       _Line3+6 
;CISTERNA_driver.c,322 :: 		Line3.Visible         = 1;
	MOVLW       1
	MOVWF       _Line3+7 
;CISTERNA_driver.c,324 :: 		Line4.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Line4+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Line4+1 
;CISTERNA_driver.c,325 :: 		Line4.Order           = 9;
	MOVLW       9
	MOVWF       _Line4+2 
;CISTERNA_driver.c,326 :: 		Line4.First_Point_X   = 3;
	MOVLW       3
	MOVWF       _Line4+3 
;CISTERNA_driver.c,327 :: 		Line4.First_Point_Y   = 2;
	MOVLW       2
	MOVWF       _Line4+4 
;CISTERNA_driver.c,328 :: 		Line4.Second_Point_X  = 119;
	MOVLW       119
	MOVWF       _Line4+5 
;CISTERNA_driver.c,329 :: 		Line4.Second_Point_Y  = 2;
	MOVLW       2
	MOVWF       _Line4+6 
;CISTERNA_driver.c,330 :: 		Line4.Visible         = 1;
	MOVLW       1
	MOVWF       _Line4+7 
;CISTERNA_driver.c,332 :: 		NvCxRua02.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _NvCxRua02+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _NvCxRua02+1 
;CISTERNA_driver.c,333 :: 		NvCxRua02.Order           = 10;
	MOVLW       10
	MOVWF       _NvCxRua02+2 
;CISTERNA_driver.c,334 :: 		NvCxRua02.Left            = 97;
	MOVLW       97
	MOVWF       _NvCxRua02+3 
;CISTERNA_driver.c,335 :: 		NvCxRua02.Top             = 3;
	MOVLW       3
	MOVWF       _NvCxRua02+4 
;CISTERNA_driver.c,336 :: 		NvCxRua02.Width           = 22;
	MOVLW       22
	MOVWF       _NvCxRua02+5 
;CISTERNA_driver.c,337 :: 		NvCxRua02.Height          = 12;
	MOVLW       12
	MOVWF       _NvCxRua02+6 
;CISTERNA_driver.c,338 :: 		NvCxRua02.Visible         = 1;
	MOVLW       1
	MOVWF       _NvCxRua02+13 
;CISTERNA_driver.c,339 :: 		NvCxRua02.Active          = 1;
	MOVLW       1
	MOVWF       _NvCxRua02+14 
;CISTERNA_driver.c,340 :: 		NvCxRua02.Caption         = NvCxRua02_Caption;
	MOVLW       _NvCxRua02_Caption+0
	MOVWF       _NvCxRua02+7 
	MOVLW       hi_addr(_NvCxRua02_Caption+0)
	MOVWF       _NvCxRua02+8 
;CISTERNA_driver.c,341 :: 		NvCxRua02.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _NvCxRua02+9 
	MOVF        R4, 0 
	MOVWF       _NvCxRua02+10 
	MOVF        R5, 0 
	MOVWF       _NvCxRua02+11 
;CISTERNA_driver.c,342 :: 		NvCxRua02.Font_Color      = 1;
	MOVLW       1
	MOVWF       _NvCxRua02+12 
;CISTERNA_driver.c,343 :: 		NvCxRua02.OnUpPtr         = 0;
	CLRF        _NvCxRua02+15 
	CLRF        _NvCxRua02+16 
	CLRF        _NvCxRua02+17 
	CLRF        _NvCxRua02+18 
;CISTERNA_driver.c,344 :: 		NvCxRua02.OnDownPtr       = 0;
	CLRF        _NvCxRua02+19 
	CLRF        _NvCxRua02+20 
	CLRF        _NvCxRua02+21 
	CLRF        _NvCxRua02+22 
;CISTERNA_driver.c,345 :: 		NvCxRua02.OnClickPtr      = 0;
	CLRF        _NvCxRua02+23 
	CLRF        _NvCxRua02+24 
	CLRF        _NvCxRua02+25 
	CLRF        _NvCxRua02+26 
;CISTERNA_driver.c,346 :: 		NvCxRua02.OnPressPtr      = 0;
	CLRF        _NvCxRua02+27 
	CLRF        _NvCxRua02+28 
	CLRF        _NvCxRua02+29 
	CLRF        _NvCxRua02+30 
;CISTERNA_driver.c,348 :: 		Label25.OwnerScreen     = &Tela_Inicial;
	MOVLW       _Tela_Inicial+0
	MOVWF       _Label25+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       _Label25+1 
;CISTERNA_driver.c,349 :: 		Label25.Order           = 11;
	MOVLW       11
	MOVWF       _Label25+2 
;CISTERNA_driver.c,350 :: 		Label25.Left            = 6;
	MOVLW       6
	MOVWF       _Label25+3 
;CISTERNA_driver.c,351 :: 		Label25.Top             = 3;
	MOVLW       3
	MOVWF       _Label25+4 
;CISTERNA_driver.c,352 :: 		Label25.Width           = 63;
	MOVLW       63
	MOVWF       _Label25+5 
;CISTERNA_driver.c,353 :: 		Label25.Height          = 12;
	MOVLW       12
	MOVWF       _Label25+6 
;CISTERNA_driver.c,354 :: 		Label25.Visible         = 1;
	MOVLW       1
	MOVWF       _Label25+13 
;CISTERNA_driver.c,355 :: 		Label25.Active          = 1;
	MOVLW       1
	MOVWF       _Label25+14 
;CISTERNA_driver.c,356 :: 		Label25.Caption         = Label25_Caption;
	MOVLW       _Label25_Caption+0
	MOVWF       _Label25+7 
	MOVLW       hi_addr(_Label25_Caption+0)
	MOVWF       _Label25+8 
;CISTERNA_driver.c,357 :: 		Label25.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label25+9 
	MOVF        R4, 0 
	MOVWF       _Label25+10 
	MOVF        R5, 0 
	MOVWF       _Label25+11 
;CISTERNA_driver.c,358 :: 		Label25.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label25+12 
;CISTERNA_driver.c,359 :: 		Label25.OnUpPtr         = 0;
	CLRF        _Label25+15 
	CLRF        _Label25+16 
	CLRF        _Label25+17 
	CLRF        _Label25+18 
;CISTERNA_driver.c,360 :: 		Label25.OnDownPtr       = 0;
	CLRF        _Label25+19 
	CLRF        _Label25+20 
	CLRF        _Label25+21 
	CLRF        _Label25+22 
;CISTERNA_driver.c,361 :: 		Label25.OnClickPtr      = 0;
	CLRF        _Label25+23 
	CLRF        _Label25+24 
	CLRF        _Label25+25 
	CLRF        _Label25+26 
;CISTERNA_driver.c,362 :: 		Label25.OnPressPtr      = 0;
	CLRF        _Label25+27 
	CLRF        _Label25+28 
	CLRF        _Label25+29 
	CLRF        _Label25+30 
;CISTERNA_driver.c,364 :: 		Label10.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _Label10+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _Label10+1 
;CISTERNA_driver.c,365 :: 		Label10.Order           = 0;
	CLRF        _Label10+2 
;CISTERNA_driver.c,366 :: 		Label10.Left            = 6;
	MOVLW       6
	MOVWF       _Label10+3 
;CISTERNA_driver.c,367 :: 		Label10.Top             = 27;
	MOVLW       27
	MOVWF       _Label10+4 
;CISTERNA_driver.c,368 :: 		Label10.Width           = 70;
	MOVLW       70
	MOVWF       _Label10+5 
;CISTERNA_driver.c,369 :: 		Label10.Height          = 12;
	MOVLW       12
	MOVWF       _Label10+6 
;CISTERNA_driver.c,370 :: 		Label10.Visible         = 1;
	MOVLW       1
	MOVWF       _Label10+13 
;CISTERNA_driver.c,371 :: 		Label10.Active          = 1;
	MOVLW       1
	MOVWF       _Label10+14 
;CISTERNA_driver.c,372 :: 		Label10.Caption         = Label10_Caption;
	MOVLW       _Label10_Caption+0
	MOVWF       _Label10+7 
	MOVLW       hi_addr(_Label10_Caption+0)
	MOVWF       _Label10+8 
;CISTERNA_driver.c,373 :: 		Label10.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label10+9 
	MOVF        R4, 0 
	MOVWF       _Label10+10 
	MOVF        R5, 0 
	MOVWF       _Label10+11 
;CISTERNA_driver.c,374 :: 		Label10.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label10+12 
;CISTERNA_driver.c,375 :: 		Label10.OnUpPtr         = 0;
	CLRF        _Label10+15 
	CLRF        _Label10+16 
	CLRF        _Label10+17 
	CLRF        _Label10+18 
;CISTERNA_driver.c,376 :: 		Label10.OnDownPtr       = 0;
	CLRF        _Label10+19 
	CLRF        _Label10+20 
	CLRF        _Label10+21 
	CLRF        _Label10+22 
;CISTERNA_driver.c,377 :: 		Label10.OnClickPtr      = 0;
	CLRF        _Label10+23 
	CLRF        _Label10+24 
	CLRF        _Label10+25 
	CLRF        _Label10+26 
;CISTERNA_driver.c,378 :: 		Label10.OnPressPtr      = 0;
	CLRF        _Label10+27 
	CLRF        _Label10+28 
	CLRF        _Label10+29 
	CLRF        _Label10+30 
;CISTERNA_driver.c,380 :: 		Label11.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _Label11+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _Label11+1 
;CISTERNA_driver.c,381 :: 		Label11.Order           = 1;
	MOVLW       1
	MOVWF       _Label11+2 
;CISTERNA_driver.c,382 :: 		Label11.Left            = 6;
	MOVLW       6
	MOVWF       _Label11+3 
;CISTERNA_driver.c,383 :: 		Label11.Top             = 38;
	MOVLW       38
	MOVWF       _Label11+4 
;CISTERNA_driver.c,384 :: 		Label11.Width           = 69;
	MOVLW       69
	MOVWF       _Label11+5 
;CISTERNA_driver.c,385 :: 		Label11.Height          = 12;
	MOVLW       12
	MOVWF       _Label11+6 
;CISTERNA_driver.c,386 :: 		Label11.Visible         = 1;
	MOVLW       1
	MOVWF       _Label11+13 
;CISTERNA_driver.c,387 :: 		Label11.Active          = 1;
	MOVLW       1
	MOVWF       _Label11+14 
;CISTERNA_driver.c,388 :: 		Label11.Caption         = Label11_Caption;
	MOVLW       _Label11_Caption+0
	MOVWF       _Label11+7 
	MOVLW       hi_addr(_Label11_Caption+0)
	MOVWF       _Label11+8 
;CISTERNA_driver.c,389 :: 		Label11.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label11+9 
	MOVF        R4, 0 
	MOVWF       _Label11+10 
	MOVF        R5, 0 
	MOVWF       _Label11+11 
;CISTERNA_driver.c,390 :: 		Label11.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label11+12 
;CISTERNA_driver.c,391 :: 		Label11.OnUpPtr         = 0;
	CLRF        _Label11+15 
	CLRF        _Label11+16 
	CLRF        _Label11+17 
	CLRF        _Label11+18 
;CISTERNA_driver.c,392 :: 		Label11.OnDownPtr       = 0;
	CLRF        _Label11+19 
	CLRF        _Label11+20 
	CLRF        _Label11+21 
	CLRF        _Label11+22 
;CISTERNA_driver.c,393 :: 		Label11.OnClickPtr      = 0;
	CLRF        _Label11+23 
	CLRF        _Label11+24 
	CLRF        _Label11+25 
	CLRF        _Label11+26 
;CISTERNA_driver.c,394 :: 		Label11.OnPressPtr      = 0;
	CLRF        _Label11+27 
	CLRF        _Label11+28 
	CLRF        _Label11+29 
	CLRF        _Label11+30 
;CISTERNA_driver.c,396 :: 		Label12.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _Label12+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _Label12+1 
;CISTERNA_driver.c,397 :: 		Label12.Order           = 2;
	MOVLW       2
	MOVWF       _Label12+2 
;CISTERNA_driver.c,398 :: 		Label12.Left            = 6;
	MOVLW       6
	MOVWF       _Label12+3 
;CISTERNA_driver.c,399 :: 		Label12.Top             = 50;
	MOVLW       50
	MOVWF       _Label12+4 
;CISTERNA_driver.c,400 :: 		Label12.Width           = 69;
	MOVLW       69
	MOVWF       _Label12+5 
;CISTERNA_driver.c,401 :: 		Label12.Height          = 12;
	MOVLW       12
	MOVWF       _Label12+6 
;CISTERNA_driver.c,402 :: 		Label12.Visible         = 1;
	MOVLW       1
	MOVWF       _Label12+13 
;CISTERNA_driver.c,403 :: 		Label12.Active          = 1;
	MOVLW       1
	MOVWF       _Label12+14 
;CISTERNA_driver.c,404 :: 		Label12.Caption         = Label12_Caption;
	MOVLW       _Label12_Caption+0
	MOVWF       _Label12+7 
	MOVLW       hi_addr(_Label12_Caption+0)
	MOVWF       _Label12+8 
;CISTERNA_driver.c,405 :: 		Label12.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label12+9 
	MOVF        R4, 0 
	MOVWF       _Label12+10 
	MOVF        R5, 0 
	MOVWF       _Label12+11 
;CISTERNA_driver.c,406 :: 		Label12.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label12+12 
;CISTERNA_driver.c,407 :: 		Label12.OnUpPtr         = 0;
	CLRF        _Label12+15 
	CLRF        _Label12+16 
	CLRF        _Label12+17 
	CLRF        _Label12+18 
;CISTERNA_driver.c,408 :: 		Label12.OnDownPtr       = 0;
	CLRF        _Label12+19 
	CLRF        _Label12+20 
	CLRF        _Label12+21 
	CLRF        _Label12+22 
;CISTERNA_driver.c,409 :: 		Label12.OnClickPtr      = 0;
	CLRF        _Label12+23 
	CLRF        _Label12+24 
	CLRF        _Label12+25 
	CLRF        _Label12+26 
;CISTERNA_driver.c,410 :: 		Label12.OnPressPtr      = 0;
	CLRF        _Label12+27 
	CLRF        _Label12+28 
	CLRF        _Label12+29 
	CLRF        _Label12+30 
;CISTERNA_driver.c,412 :: 		RT_BP.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _RT_BP+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _RT_BP+1 
;CISTERNA_driver.c,413 :: 		RT_BP.Order           = 3;
	MOVLW       3
	MOVWF       _RT_BP+2 
;CISTERNA_driver.c,414 :: 		RT_BP.Left            = 93;
	MOVLW       93
	MOVWF       _RT_BP+3 
;CISTERNA_driver.c,415 :: 		RT_BP.Top             = 16;
	MOVLW       16
	MOVWF       _RT_BP+4 
;CISTERNA_driver.c,416 :: 		RT_BP.Width           = 31;
	MOVLW       31
	MOVWF       _RT_BP+5 
;CISTERNA_driver.c,417 :: 		RT_BP.Height          = 12;
	MOVLW       12
	MOVWF       _RT_BP+6 
;CISTERNA_driver.c,418 :: 		RT_BP.Visible         = 1;
	MOVLW       1
	MOVWF       _RT_BP+13 
;CISTERNA_driver.c,419 :: 		RT_BP.Active          = 1;
	MOVLW       1
	MOVWF       _RT_BP+14 
;CISTERNA_driver.c,420 :: 		RT_BP.Caption         = RT_BP_Caption;
	MOVLW       _RT_BP_Caption+0
	MOVWF       _RT_BP+7 
	MOVLW       hi_addr(_RT_BP_Caption+0)
	MOVWF       _RT_BP+8 
;CISTERNA_driver.c,421 :: 		RT_BP.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _RT_BP+9 
	MOVF        R4, 0 
	MOVWF       _RT_BP+10 
	MOVF        R5, 0 
	MOVWF       _RT_BP+11 
;CISTERNA_driver.c,422 :: 		RT_BP.Font_Color      = 1;
	MOVLW       1
	MOVWF       _RT_BP+12 
;CISTERNA_driver.c,423 :: 		RT_BP.OnUpPtr         = 0;
	CLRF        _RT_BP+15 
	CLRF        _RT_BP+16 
	CLRF        _RT_BP+17 
	CLRF        _RT_BP+18 
;CISTERNA_driver.c,424 :: 		RT_BP.OnDownPtr       = 0;
	CLRF        _RT_BP+19 
	CLRF        _RT_BP+20 
	CLRF        _RT_BP+21 
	CLRF        _RT_BP+22 
;CISTERNA_driver.c,425 :: 		RT_BP.OnClickPtr      = 0;
	CLRF        _RT_BP+23 
	CLRF        _RT_BP+24 
	CLRF        _RT_BP+25 
	CLRF        _RT_BP+26 
;CISTERNA_driver.c,426 :: 		RT_BP.OnPressPtr      = 0;
	CLRF        _RT_BP+27 
	CLRF        _RT_BP+28 
	CLRF        _RT_BP+29 
	CLRF        _RT_BP+30 
;CISTERNA_driver.c,428 :: 		Rt_BCist.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _Rt_BCist+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _Rt_BCist+1 
;CISTERNA_driver.c,429 :: 		Rt_BCist.Order           = 4;
	MOVLW       4
	MOVWF       _Rt_BCist+2 
;CISTERNA_driver.c,430 :: 		Rt_BCist.Left            = 93;
	MOVLW       93
	MOVWF       _Rt_BCist+3 
;CISTERNA_driver.c,431 :: 		Rt_BCist.Top             = 27;
	MOVLW       27
	MOVWF       _Rt_BCist+4 
;CISTERNA_driver.c,432 :: 		Rt_BCist.Width           = 31;
	MOVLW       31
	MOVWF       _Rt_BCist+5 
;CISTERNA_driver.c,433 :: 		Rt_BCist.Height          = 12;
	MOVLW       12
	MOVWF       _Rt_BCist+6 
;CISTERNA_driver.c,434 :: 		Rt_BCist.Visible         = 1;
	MOVLW       1
	MOVWF       _Rt_BCist+13 
;CISTERNA_driver.c,435 :: 		Rt_BCist.Active          = 1;
	MOVLW       1
	MOVWF       _Rt_BCist+14 
;CISTERNA_driver.c,436 :: 		Rt_BCist.Caption         = Rt_BCist_Caption;
	MOVLW       _Rt_BCist_Caption+0
	MOVWF       _Rt_BCist+7 
	MOVLW       hi_addr(_Rt_BCist_Caption+0)
	MOVWF       _Rt_BCist+8 
;CISTERNA_driver.c,437 :: 		Rt_BCist.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Rt_BCist+9 
	MOVF        R4, 0 
	MOVWF       _Rt_BCist+10 
	MOVF        R5, 0 
	MOVWF       _Rt_BCist+11 
;CISTERNA_driver.c,438 :: 		Rt_BCist.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Rt_BCist+12 
;CISTERNA_driver.c,439 :: 		Rt_BCist.OnUpPtr         = 0;
	CLRF        _Rt_BCist+15 
	CLRF        _Rt_BCist+16 
	CLRF        _Rt_BCist+17 
	CLRF        _Rt_BCist+18 
;CISTERNA_driver.c,440 :: 		Rt_BCist.OnDownPtr       = 0;
	CLRF        _Rt_BCist+19 
	CLRF        _Rt_BCist+20 
	CLRF        _Rt_BCist+21 
	CLRF        _Rt_BCist+22 
;CISTERNA_driver.c,441 :: 		Rt_BCist.OnClickPtr      = 0;
	CLRF        _Rt_BCist+23 
	CLRF        _Rt_BCist+24 
	CLRF        _Rt_BCist+25 
	CLRF        _Rt_BCist+26 
;CISTERNA_driver.c,442 :: 		Rt_BCist.OnPressPtr      = 0;
	CLRF        _Rt_BCist+27 
	CLRF        _Rt_BCist+28 
	CLRF        _Rt_BCist+29 
	CLRF        _Rt_BCist+30 
;CISTERNA_driver.c,444 :: 		ManText.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _ManText+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _ManText+1 
;CISTERNA_driver.c,445 :: 		ManText.Order           = 5;
	MOVLW       5
	MOVWF       _ManText+2 
;CISTERNA_driver.c,446 :: 		ManText.Left            = 93;
	MOVLW       93
	MOVWF       _ManText+3 
;CISTERNA_driver.c,447 :: 		ManText.Top             = 38;
	MOVLW       38
	MOVWF       _ManText+4 
;CISTERNA_driver.c,448 :: 		ManText.Width           = 18;
	MOVLW       18
	MOVWF       _ManText+5 
;CISTERNA_driver.c,449 :: 		ManText.Height          = 12;
	MOVLW       12
	MOVWF       _ManText+6 
;CISTERNA_driver.c,450 :: 		ManText.Visible         = 1;
	MOVLW       1
	MOVWF       _ManText+13 
;CISTERNA_driver.c,451 :: 		ManText.Active          = 1;
	MOVLW       1
	MOVWF       _ManText+14 
;CISTERNA_driver.c,452 :: 		ManText.Caption         = ManText_Caption;
	MOVLW       _ManText_Caption+0
	MOVWF       _ManText+7 
	MOVLW       hi_addr(_ManText_Caption+0)
	MOVWF       _ManText+8 
;CISTERNA_driver.c,453 :: 		ManText.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _ManText+9 
	MOVF        R4, 0 
	MOVWF       _ManText+10 
	MOVF        R5, 0 
	MOVWF       _ManText+11 
;CISTERNA_driver.c,454 :: 		ManText.Font_Color      = 1;
	MOVLW       1
	MOVWF       _ManText+12 
;CISTERNA_driver.c,455 :: 		ManText.OnUpPtr         = 0;
	CLRF        _ManText+15 
	CLRF        _ManText+16 
	CLRF        _ManText+17 
	CLRF        _ManText+18 
;CISTERNA_driver.c,456 :: 		ManText.OnDownPtr       = 0;
	CLRF        _ManText+19 
	CLRF        _ManText+20 
	CLRF        _ManText+21 
	CLRF        _ManText+22 
;CISTERNA_driver.c,457 :: 		ManText.OnClickPtr      = 0;
	CLRF        _ManText+23 
	CLRF        _ManText+24 
	CLRF        _ManText+25 
	CLRF        _ManText+26 
;CISTERNA_driver.c,458 :: 		ManText.OnPressPtr      = 0;
	CLRF        _ManText+27 
	CLRF        _ManText+28 
	CLRF        _ManText+29 
	CLRF        _ManText+30 
;CISTERNA_driver.c,460 :: 		V2VTxt.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _V2VTxt+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _V2VTxt+1 
;CISTERNA_driver.c,461 :: 		V2VTxt.Order           = 6;
	MOVLW       6
	MOVWF       _V2VTxt+2 
;CISTERNA_driver.c,462 :: 		V2VTxt.Left            = 93;
	MOVLW       93
	MOVWF       _V2VTxt+3 
;CISTERNA_driver.c,463 :: 		V2VTxt.Top             = 50;
	MOVLW       50
	MOVWF       _V2VTxt+4 
;CISTERNA_driver.c,464 :: 		V2VTxt.Width           = 13;
	MOVLW       13
	MOVWF       _V2VTxt+5 
;CISTERNA_driver.c,465 :: 		V2VTxt.Height          = 12;
	MOVLW       12
	MOVWF       _V2VTxt+6 
;CISTERNA_driver.c,466 :: 		V2VTxt.Visible         = 1;
	MOVLW       1
	MOVWF       _V2VTxt+13 
;CISTERNA_driver.c,467 :: 		V2VTxt.Active          = 1;
	MOVLW       1
	MOVWF       _V2VTxt+14 
;CISTERNA_driver.c,468 :: 		V2VTxt.Caption         = V2VTxt_Caption;
	MOVLW       _V2VTxt_Caption+0
	MOVWF       _V2VTxt+7 
	MOVLW       hi_addr(_V2VTxt_Caption+0)
	MOVWF       _V2VTxt+8 
;CISTERNA_driver.c,469 :: 		V2VTxt.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _V2VTxt+9 
	MOVF        R4, 0 
	MOVWF       _V2VTxt+10 
	MOVF        R5, 0 
	MOVWF       _V2VTxt+11 
;CISTERNA_driver.c,470 :: 		V2VTxt.Font_Color      = 1;
	MOVLW       1
	MOVWF       _V2VTxt+12 
;CISTERNA_driver.c,471 :: 		V2VTxt.OnUpPtr         = 0;
	CLRF        _V2VTxt+15 
	CLRF        _V2VTxt+16 
	CLRF        _V2VTxt+17 
	CLRF        _V2VTxt+18 
;CISTERNA_driver.c,472 :: 		V2VTxt.OnDownPtr       = 0;
	CLRF        _V2VTxt+19 
	CLRF        _V2VTxt+20 
	CLRF        _V2VTxt+21 
	CLRF        _V2VTxt+22 
;CISTERNA_driver.c,473 :: 		V2VTxt.OnClickPtr      = 0;
	CLRF        _V2VTxt+23 
	CLRF        _V2VTxt+24 
	CLRF        _V2VTxt+25 
	CLRF        _V2VTxt+26 
;CISTERNA_driver.c,474 :: 		V2VTxt.OnPressPtr      = 0;
	CLRF        _V2VTxt+27 
	CLRF        _V2VTxt+28 
	CLRF        _V2VTxt+29 
	CLRF        _V2VTxt+30 
;CISTERNA_driver.c,476 :: 		Label17.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _Label17+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _Label17+1 
;CISTERNA_driver.c,477 :: 		Label17.Order           = 7;
	MOVLW       7
	MOVWF       _Label17+2 
;CISTERNA_driver.c,478 :: 		Label17.Left            = 6;
	MOVLW       6
	MOVWF       _Label17+3 
;CISTERNA_driver.c,479 :: 		Label17.Top             = 16;
	MOVLW       16
	MOVWF       _Label17+4 
;CISTERNA_driver.c,480 :: 		Label17.Width           = 69;
	MOVLW       69
	MOVWF       _Label17+5 
;CISTERNA_driver.c,481 :: 		Label17.Height          = 12;
	MOVLW       12
	MOVWF       _Label17+6 
;CISTERNA_driver.c,482 :: 		Label17.Visible         = 1;
	MOVLW       1
	MOVWF       _Label17+13 
;CISTERNA_driver.c,483 :: 		Label17.Active          = 1;
	MOVLW       1
	MOVWF       _Label17+14 
;CISTERNA_driver.c,484 :: 		Label17.Caption         = Label17_Caption;
	MOVLW       _Label17_Caption+0
	MOVWF       _Label17+7 
	MOVLW       hi_addr(_Label17_Caption+0)
	MOVWF       _Label17+8 
;CISTERNA_driver.c,485 :: 		Label17.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label17+9 
	MOVF        R4, 0 
	MOVWF       _Label17+10 
	MOVF        R5, 0 
	MOVWF       _Label17+11 
;CISTERNA_driver.c,486 :: 		Label17.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label17+12 
;CISTERNA_driver.c,487 :: 		Label17.OnUpPtr         = 0;
	CLRF        _Label17+15 
	CLRF        _Label17+16 
	CLRF        _Label17+17 
	CLRF        _Label17+18 
;CISTERNA_driver.c,488 :: 		Label17.OnDownPtr       = 0;
	CLRF        _Label17+19 
	CLRF        _Label17+20 
	CLRF        _Label17+21 
	CLRF        _Label17+22 
;CISTERNA_driver.c,489 :: 		Label17.OnClickPtr      = 0;
	CLRF        _Label17+23 
	CLRF        _Label17+24 
	CLRF        _Label17+25 
	CLRF        _Label17+26 
;CISTERNA_driver.c,490 :: 		Label17.OnPressPtr      = 0;
	CLRF        _Label17+27 
	CLRF        _Label17+28 
	CLRF        _Label17+29 
	CLRF        _Label17+30 
;CISTERNA_driver.c,492 :: 		Line1.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _Line1+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _Line1+1 
;CISTERNA_driver.c,493 :: 		Line1.Order           = 8;
	MOVLW       8
	MOVWF       _Line1+2 
;CISTERNA_driver.c,494 :: 		Line1.First_Point_X   = 3;
	MOVLW       3
	MOVWF       _Line1+3 
;CISTERNA_driver.c,495 :: 		Line1.First_Point_Y   = 61;
	MOVLW       61
	MOVWF       _Line1+4 
;CISTERNA_driver.c,496 :: 		Line1.Second_Point_X  = 119;
	MOVLW       119
	MOVWF       _Line1+5 
;CISTERNA_driver.c,497 :: 		Line1.Second_Point_Y  = 61;
	MOVLW       61
	MOVWF       _Line1+6 
;CISTERNA_driver.c,498 :: 		Line1.Visible         = 1;
	MOVLW       1
	MOVWF       _Line1+7 
;CISTERNA_driver.c,500 :: 		Line2.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _Line2+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _Line2+1 
;CISTERNA_driver.c,501 :: 		Line2.Order           = 9;
	MOVLW       9
	MOVWF       _Line2+2 
;CISTERNA_driver.c,502 :: 		Line2.First_Point_X   = 3;
	MOVLW       3
	MOVWF       _Line2+3 
;CISTERNA_driver.c,503 :: 		Line2.First_Point_Y   = 2;
	MOVLW       2
	MOVWF       _Line2+4 
;CISTERNA_driver.c,504 :: 		Line2.Second_Point_X  = 120;
	MOVLW       120
	MOVWF       _Line2+5 
;CISTERNA_driver.c,505 :: 		Line2.Second_Point_Y  = 2;
	MOVLW       2
	MOVWF       _Line2+6 
;CISTERNA_driver.c,506 :: 		Line2.Visible         = 1;
	MOVLW       1
	MOVWF       _Line2+7 
;CISTERNA_driver.c,508 :: 		Image4.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _Image4+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _Image4+1 
;CISTERNA_driver.c,509 :: 		Image4.Order           = 10;
	MOVLW       10
	MOVWF       _Image4+2 
;CISTERNA_driver.c,510 :: 		Image4.Left            = 117;
	MOVLW       117
	MOVWF       _Image4+3 
;CISTERNA_driver.c,511 :: 		Image4.Top             = 41;
	MOVLW       41
	MOVWF       _Image4+4 
;CISTERNA_driver.c,512 :: 		Image4.Width           = 6;
	MOVLW       6
	MOVWF       _Image4+5 
;CISTERNA_driver.c,513 :: 		Image4.Height          = 6;
	MOVLW       6
	MOVWF       _Image4+6 
;CISTERNA_driver.c,514 :: 		Image4.PictureWidth    = 6;
	MOVLW       6
	MOVWF       _Image4+7 
;CISTERNA_driver.c,515 :: 		Image4.PictureHeight   = 6;
	MOVLW       6
	MOVWF       _Image4+8 
;CISTERNA_driver.c,516 :: 		Image4.Picture_Name    = seta_bmp;
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
;CISTERNA_driver.c,517 :: 		Image4.Visible         = 0;
	CLRF        _Image4+12 
;CISTERNA_driver.c,518 :: 		Image4.Active          = 1;
	MOVLW       1
	MOVWF       _Image4+13 
;CISTERNA_driver.c,519 :: 		Image4.OnUpPtr         = 0;
	CLRF        _Image4+14 
	CLRF        _Image4+15 
	CLRF        _Image4+16 
	CLRF        _Image4+17 
;CISTERNA_driver.c,520 :: 		Image4.OnDownPtr       = 0;
	CLRF        _Image4+18 
	CLRF        _Image4+19 
	CLRF        _Image4+20 
	CLRF        _Image4+21 
;CISTERNA_driver.c,521 :: 		Image4.OnClickPtr      = 0;
	CLRF        _Image4+22 
	CLRF        _Image4+23 
	CLRF        _Image4+24 
	CLRF        _Image4+25 
;CISTERNA_driver.c,522 :: 		Image4.OnPressPtr      = 0;
	CLRF        _Image4+26 
	CLRF        _Image4+27 
	CLRF        _Image4+28 
	CLRF        _Image4+29 
;CISTERNA_driver.c,524 :: 		Label1.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _Label1+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _Label1+1 
;CISTERNA_driver.c,525 :: 		Label1.Order           = 11;
	MOVLW       11
	MOVWF       _Label1+2 
;CISTERNA_driver.c,526 :: 		Label1.Left            = 6;
	MOVLW       6
	MOVWF       _Label1+3 
;CISTERNA_driver.c,527 :: 		Label1.Top             = 4;
	MOVLW       4
	MOVWF       _Label1+4 
;CISTERNA_driver.c,528 :: 		Label1.Width           = 60;
	MOVLW       60
	MOVWF       _Label1+5 
;CISTERNA_driver.c,529 :: 		Label1.Height          = 12;
	MOVLW       12
	MOVWF       _Label1+6 
;CISTERNA_driver.c,530 :: 		Label1.Visible         = 1;
	MOVLW       1
	MOVWF       _Label1+13 
;CISTERNA_driver.c,531 :: 		Label1.Active          = 1;
	MOVLW       1
	MOVWF       _Label1+14 
;CISTERNA_driver.c,532 :: 		Label1.Caption         = Label1_Caption;
	MOVLW       _Label1_Caption+0
	MOVWF       _Label1+7 
	MOVLW       hi_addr(_Label1_Caption+0)
	MOVWF       _Label1+8 
;CISTERNA_driver.c,533 :: 		Label1.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _Label1+9 
	MOVF        R4, 0 
	MOVWF       _Label1+10 
	MOVF        R5, 0 
	MOVWF       _Label1+11 
;CISTERNA_driver.c,534 :: 		Label1.Font_Color      = 1;
	MOVLW       1
	MOVWF       _Label1+12 
;CISTERNA_driver.c,535 :: 		Label1.OnUpPtr         = 0;
	CLRF        _Label1+15 
	CLRF        _Label1+16 
	CLRF        _Label1+17 
	CLRF        _Label1+18 
;CISTERNA_driver.c,536 :: 		Label1.OnDownPtr       = 0;
	CLRF        _Label1+19 
	CLRF        _Label1+20 
	CLRF        _Label1+21 
	CLRF        _Label1+22 
;CISTERNA_driver.c,537 :: 		Label1.OnClickPtr      = 0;
	CLRF        _Label1+23 
	CLRF        _Label1+24 
	CLRF        _Label1+25 
	CLRF        _Label1+26 
;CISTERNA_driver.c,538 :: 		Label1.OnPressPtr      = 0;
	CLRF        _Label1+27 
	CLRF        _Label1+28 
	CLRF        _Label1+29 
	CLRF        _Label1+30 
;CISTERNA_driver.c,540 :: 		StatV2V.OwnerScreen     = &Misc1;
	MOVLW       _Misc1+0
	MOVWF       _StatV2V+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       _StatV2V+1 
;CISTERNA_driver.c,541 :: 		StatV2V.Order           = 12;
	MOVLW       12
	MOVWF       _StatV2V+2 
;CISTERNA_driver.c,542 :: 		StatV2V.Left            = 94;
	MOVLW       94
	MOVWF       _StatV2V+3 
;CISTERNA_driver.c,543 :: 		StatV2V.Top             = 4;
	MOVLW       4
	MOVWF       _StatV2V+4 
;CISTERNA_driver.c,544 :: 		StatV2V.Width           = 13;
	MOVLW       13
	MOVWF       _StatV2V+5 
;CISTERNA_driver.c,545 :: 		StatV2V.Height          = 12;
	MOVLW       12
	MOVWF       _StatV2V+6 
;CISTERNA_driver.c,546 :: 		StatV2V.Visible         = 1;
	MOVLW       1
	MOVWF       _StatV2V+13 
;CISTERNA_driver.c,547 :: 		StatV2V.Active          = 1;
	MOVLW       1
	MOVWF       _StatV2V+14 
;CISTERNA_driver.c,548 :: 		StatV2V.Caption         = StatV2V_Caption;
	MOVLW       _StatV2V_Caption+0
	MOVWF       _StatV2V+7 
	MOVLW       hi_addr(_StatV2V_Caption+0)
	MOVWF       _StatV2V+8 
;CISTERNA_driver.c,549 :: 		StatV2V.FontName        = Constantia9x11_Regular;
	MOVF        R3, 0 
	MOVWF       _StatV2V+9 
	MOVF        R4, 0 
	MOVWF       _StatV2V+10 
	MOVF        R5, 0 
	MOVWF       _StatV2V+11 
;CISTERNA_driver.c,550 :: 		StatV2V.Font_Color      = 1;
	MOVLW       1
	MOVWF       _StatV2V+12 
;CISTERNA_driver.c,551 :: 		StatV2V.OnUpPtr         = 0;
	CLRF        _StatV2V+15 
	CLRF        _StatV2V+16 
	CLRF        _StatV2V+17 
	CLRF        _StatV2V+18 
;CISTERNA_driver.c,552 :: 		StatV2V.OnDownPtr       = 0;
	CLRF        _StatV2V+19 
	CLRF        _StatV2V+20 
	CLRF        _StatV2V+21 
	CLRF        _StatV2V+22 
;CISTERNA_driver.c,553 :: 		StatV2V.OnClickPtr      = 0;
	CLRF        _StatV2V+23 
	CLRF        _StatV2V+24 
	CLRF        _StatV2V+25 
	CLRF        _StatV2V+26 
;CISTERNA_driver.c,554 :: 		StatV2V.OnPressPtr      = 0;
	CLRF        _StatV2V+27 
	CLRF        _StatV2V+28 
	CLRF        _StatV2V+29 
	CLRF        _StatV2V+30 
;CISTERNA_driver.c,555 :: 		}
L_end_InitializeObjects:
	RETURN      0
; end of CISTERNA_driver_InitializeObjects

CISTERNA_driver_IsInsideObject:

;CISTERNA_driver.c,557 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
;CISTERNA_driver.c,558 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
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
;CISTERNA_driver.c,559 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
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
;CISTERNA_driver.c,560 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_IsInsideObject
L_CISTERNA_driver_IsInsideObject2:
;CISTERNA_driver.c,562 :: 		return 0;
	CLRF        R0 
;CISTERNA_driver.c,563 :: 		}
L_end_IsInsideObject:
	RETURN      0
; end of CISTERNA_driver_IsInsideObject

_DrawLabel:

;CISTERNA_driver.c,571 :: 		void DrawLabel(TLabel *ALabel) {
;CISTERNA_driver.c,572 :: 		if (ALabel->Visible == 1) {
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
;CISTERNA_driver.c,573 :: 		Glcd_Set_Font_Adv(ALabel->FontName, ALabel->Font_Color, _GLCD_HORIZONTAL);
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
;CISTERNA_driver.c,574 :: 		Glcd_Write_Text_Adv(ALabel->Caption, ALabel->Left, ALabel->Top);
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
;CISTERNA_driver.c,575 :: 		}
L_DrawLabel4:
;CISTERNA_driver.c,576 :: 		}
L_end_DrawLabel:
	RETURN      0
; end of _DrawLabel

_DrawImage:

;CISTERNA_driver.c,578 :: 		void DrawImage(TImage *AImage) {
;CISTERNA_driver.c,579 :: 		if (AImage->Visible == 1) {
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
;CISTERNA_driver.c,580 :: 		Glcd_PartialImage(AImage->Left, AImage->Top, AImage->Width,
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
;CISTERNA_driver.c,581 :: 		AImage->Height, AImage->PictureWidth, AImage->PictureHeight,
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
;CISTERNA_driver.c,582 :: 		AImage->Picture_Name);
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
;CISTERNA_driver.c,583 :: 		}
L_DrawImage5:
;CISTERNA_driver.c,584 :: 		}
L_end_DrawImage:
	RETURN      0
; end of _DrawImage

_DrawLine:

;CISTERNA_driver.c,586 :: 		void DrawLine(TLine *Aline) {
;CISTERNA_driver.c,587 :: 		if (Aline->Visible == 1) {
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
;CISTERNA_driver.c,588 :: 		Glcd_Line(Aline->First_Point_X, Aline->First_Point_Y, Aline->Second_Point_X, Aline->Second_Point_Y, _clDraw);
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
;CISTERNA_driver.c,589 :: 		}
L_DrawLine6:
;CISTERNA_driver.c,590 :: 		}
L_end_DrawLine:
	RETURN      0
; end of _DrawLine

_DrawScreen:

;CISTERNA_driver.c,592 :: 		void DrawScreen(TScreen *aScreen) {
;CISTERNA_driver.c,601 :: 		object_pressed = 0;
	CLRF        _object_pressed+0 
;CISTERNA_driver.c,602 :: 		order = 0;
	CLRF        DrawScreen_order_L0+0 
	CLRF        DrawScreen_order_L0+1 
;CISTERNA_driver.c,603 :: 		label_idx = 0;
	CLRF        DrawScreen_label_idx_L0+0 
;CISTERNA_driver.c,604 :: 		image_idx = 0;
	CLRF        DrawScreen_image_idx_L0+0 
;CISTERNA_driver.c,605 :: 		line_idx = 0;
	CLRF        DrawScreen_line_idx_L0+0 
;CISTERNA_driver.c,606 :: 		CurrentScreen = aScreen;
	MOVF        FARG_DrawScreen_aScreen+0, 0 
	MOVWF       _CurrentScreen+0 
	MOVF        FARG_DrawScreen_aScreen+1, 0 
	MOVWF       _CurrentScreen+1 
;CISTERNA_driver.c,608 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;CISTERNA_driver.c,610 :: 		while (order < CurrentScreen->ObjectsCount) {
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
;CISTERNA_driver.c,611 :: 		if (label_idx < CurrentScreen->LabelsCount) {
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
;CISTERNA_driver.c,612 :: 		local_label = GetLabel(label_idx);
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
;CISTERNA_driver.c,613 :: 		if (order == local_label->Order) {
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
;CISTERNA_driver.c,614 :: 		label_idx++;
	INCF        DrawScreen_label_idx_L0+0, 1 
;CISTERNA_driver.c,615 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CISTERNA_driver.c,616 :: 		DrawLabel(local_label);
	MOVF        DrawScreen_local_label_L0+0, 0 
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVF        DrawScreen_local_label_L0+1, 0 
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CISTERNA_driver.c,617 :: 		}
L_DrawScreen10:
;CISTERNA_driver.c,618 :: 		}
L_DrawScreen9:
;CISTERNA_driver.c,620 :: 		if (line_idx  < CurrentScreen->LinesCount) {
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
;CISTERNA_driver.c,621 :: 		local_line = GetLine(line_idx);
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
;CISTERNA_driver.c,622 :: 		if (order == local_line->Order) {
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
;CISTERNA_driver.c,623 :: 		line_idx++;
	INCF        DrawScreen_line_idx_L0+0, 1 
;CISTERNA_driver.c,624 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CISTERNA_driver.c,625 :: 		DrawLine(local_line);
	MOVF        DrawScreen_local_line_L0+0, 0 
	MOVWF       FARG_DrawLine_Aline+0 
	MOVF        DrawScreen_local_line_L0+1, 0 
	MOVWF       FARG_DrawLine_Aline+1 
	CALL        _DrawLine+0, 0
;CISTERNA_driver.c,626 :: 		}
L_DrawScreen12:
;CISTERNA_driver.c,627 :: 		}
L_DrawScreen11:
;CISTERNA_driver.c,629 :: 		if (image_idx  < CurrentScreen->ImagesCount) {
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
;CISTERNA_driver.c,630 :: 		local_image = GetImage(image_idx);
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
;CISTERNA_driver.c,631 :: 		if (order == local_image->Order) {
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
;CISTERNA_driver.c,632 :: 		image_idx++;
	INCF        DrawScreen_image_idx_L0+0, 1 
;CISTERNA_driver.c,633 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CISTERNA_driver.c,634 :: 		DrawImage(local_image);
	MOVF        DrawScreen_local_image_L0+0, 0 
	MOVWF       FARG_DrawImage_AImage+0 
	MOVF        DrawScreen_local_image_L0+1, 0 
	MOVWF       FARG_DrawImage_AImage+1 
	CALL        _DrawImage+0, 0
;CISTERNA_driver.c,635 :: 		}
L_DrawScreen14:
;CISTERNA_driver.c,636 :: 		}
L_DrawScreen13:
;CISTERNA_driver.c,638 :: 		}
	GOTO        L_DrawScreen7
L_DrawScreen8:
;CISTERNA_driver.c,639 :: 		}
L_end_DrawScreen:
	RETURN      0
; end of _DrawScreen

_Init_MCU:

;CISTERNA_driver.c,641 :: 		void Init_MCU() {
;CISTERNA_driver.c,642 :: 		ANSELA = 3; // Configure AN0 and AN1 pins as analog
	MOVLW       3
	MOVWF       ANSELA+0 
;CISTERNA_driver.c,643 :: 		ANSELB = 0; // Configure PORTB pins as digital
	CLRF        ANSELB+0 
;CISTERNA_driver.c,644 :: 		ANSELC = 0; // Configure PORTC pins as digital
	CLRF        ANSELC+0 
;CISTERNA_driver.c,645 :: 		ANSELD = 0; // Configure PORTD pins as digital
	CLRF        ANSELD+0 
;CISTERNA_driver.c,646 :: 		TRISA  = 3; // Configure AN0 and AN1 pins as input
	MOVLW       3
	MOVWF       TRISA+0 
;CISTERNA_driver.c,647 :: 		}
L_end_Init_MCU:
	RETURN      0
; end of _Init_MCU

_Start_TP:

;CISTERNA_driver.c,649 :: 		void Start_TP() {
;CISTERNA_driver.c,650 :: 		Init_MCU();
	CALL        _Init_MCU+0, 0
;CISTERNA_driver.c,652 :: 		InitializeTouchPanel();
	CALL        CISTERNA_driver_InitializeTouchPanel+0, 0
;CISTERNA_driver.c,654 :: 		InitializeObjects();
	CALL        CISTERNA_driver_InitializeObjects+0, 0
;CISTERNA_driver.c,655 :: 		DrawScreen(&Tela_Inicial);
	MOVLW       _Tela_Inicial+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_driver.c,656 :: 		}
L_end_Start_TP:
	RETURN      0
; end of _Start_TP

CISTERNA_driver____?ag:

L_end_CISTERNA_driver___?ag:
	RETURN      0
; end of CISTERNA_driver____?ag
