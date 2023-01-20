
_UART_RCV:

;CISTERNA_main.c,93 :: 		void UART_RCV() iv 0x0008 ics ICS_AUTO
;CISTERNA_main.c,96 :: 		if(TMR0IF_bit == 1 && TMR0IE_bit == 1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_UART_RCV2
	BTFSS       TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
	GOTO        L_UART_RCV2
L__UART_RCV127:
;CISTERNA_main.c,98 :: 		++ticks;
	MOVLW       1
	ADDWF       _ticks+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _ticks+1, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _ticks+2, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _ticks+3, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       _ticks+0 
	MOVF        R1, 0 
	MOVWF       _ticks+1 
	MOVF        R2, 0 
	MOVWF       _ticks+2 
	MOVF        R3, 0 
	MOVWF       _ticks+3 
;CISTERNA_main.c,99 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;CISTERNA_main.c,100 :: 		TMR0L         = 0xC0; //20 ms
	MOVLW       192
	MOVWF       TMR0L+0 
;CISTERNA_main.c,101 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;CISTERNA_main.c,102 :: 		}
	GOTO        L_UART_RCV3
L_UART_RCV2:
;CISTERNA_main.c,104 :: 		if(PIR1.RC1IF == 1 && PIE1.RC1IE == 1)
	BTFSS       PIR1+0, 5 
	GOTO        L_UART_RCV6
	BTFSS       PIE1+0, 5 
	GOTO        L_UART_RCV6
L__UART_RCV126:
;CISTERNA_main.c,106 :: 		sdata = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       UART_RCV_sdata_L0+0 
;CISTERNA_main.c,107 :: 		if(sdata == '[')     //Ex: [V2V01] - [AUT]
	MOVF        R0, 0 
	XORLW       91
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV7
;CISTERNA_main.c,109 :: 		Pot = Dta;       //Salva o endereço da matriz no ponteiro
	MOVLW       _Dta+0
	MOVWF       _Pot+0 
	MOVLW       hi_addr(_Dta+0)
	MOVWF       _Pot+1 
;CISTERNA_main.c,110 :: 		_Aux = 1;        //Flag que informa o início do protocolo
	MOVLW       1
	MOVWF       __Aux+0 
;CISTERNA_main.c,111 :: 		}
	GOTO        L_UART_RCV8
L_UART_RCV7:
;CISTERNA_main.c,113 :: 		if(sdata == ']' && _Aux == 1)
	MOVF        UART_RCV_sdata_L0+0, 0 
	XORLW       93
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV11
	MOVF        __Aux+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV11
L__UART_RCV125:
;CISTERNA_main.c,115 :: 		_Aux = 0;
	CLRF        __Aux+0 
;CISTERNA_main.c,118 :: 		DecodificaProtocolo();
	CALL        _DecodificaProtocolo+0, 0
;CISTERNA_main.c,119 :: 		}
	GOTO        L_UART_RCV12
L_UART_RCV11:
;CISTERNA_main.c,121 :: 		if (_Aux == 1)
	MOVF        __Aux+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV13
;CISTERNA_main.c,123 :: 		*Pot = sdata;
	MOVFF       _Pot+0, FSR1L+0
	MOVFF       _Pot+1, FSR1H+0
	MOVF        UART_RCV_sdata_L0+0, 0 
	MOVWF       POSTINC1+0 
;CISTERNA_main.c,124 :: 		++Pot;
	INFSNZ      _Pot+0, 1 
	INCF        _Pot+1, 1 
;CISTERNA_main.c,126 :: 		}
L_UART_RCV13:
L_UART_RCV12:
L_UART_RCV8:
;CISTERNA_main.c,127 :: 		PIR1.RC1IF = 0;
	BCF         PIR1+0, 5 
;CISTERNA_main.c,128 :: 		}
L_UART_RCV6:
L_UART_RCV3:
;CISTERNA_main.c,129 :: 		}
L_end_UART_RCV:
L__UART_RCV142:
	RETFIE      1
; end of _UART_RCV

_main:

;CISTERNA_main.c,133 :: 		void main() {
;CISTERNA_main.c,134 :: 		Start_TP();
	CALL        _Start_TP+0, 0
;CISTERNA_main.c,135 :: 		Init_cfgMCU();
	CALL        _Init_cfgMCU+0, 0
;CISTERNA_main.c,136 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       3
	MOVWF       SPBRGH+0 
	MOVLW       64
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;CISTERNA_main.c,137 :: 		Delay_ms(100);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
;CISTERNA_main.c,139 :: 		INTCON.GIEH = 1;
	BSF         INTCON+0, 7 
;CISTERNA_main.c,140 :: 		INTCON.GIEL = 1;
	BSF         INTCON+0, 6 
;CISTERNA_main.c,141 :: 		RCON.IPEN = 1;
	BSF         RCON+0, 7 
;CISTERNA_main.c,144 :: 		PIR1.RC1IF = 0;
	BCF         PIR1+0, 5 
;CISTERNA_main.c,145 :: 		IPR1.RC1IP = 1;
	BSF         IPR1+0, 5 
;CISTERNA_main.c,146 :: 		PIE1.RC1IE = 1;
	BSF         PIE1+0, 5 
;CISTERNA_main.c,149 :: 		Delay_ms(500);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
	NOP
;CISTERNA_main.c,150 :: 		Timers_Init();
	CALL        _Timers_Init+0, 0
;CISTERNA_main.c,151 :: 		tempoLed = start_timer(2);
	MOVLW       2
	ADDWF       _ticks+0, 0 
	MOVWF       _tempoLed+0 
	MOVLW       0
	ADDWFC      _ticks+1, 0 
	MOVWF       _tempoLed+1 
	MOVLW       0
	ADDWFC      _ticks+2, 0 
	MOVWF       _tempoLed+2 
	MOVLW       0
	ADDWFC      _ticks+3, 0 
	MOVWF       _tempoLed+3 
;CISTERNA_main.c,152 :: 		tempoSmsg = start_timer(20);
	MOVLW       20
	ADDWF       _ticks+0, 0 
	MOVWF       _tempoSmsg+0 
	MOVLW       0
	ADDWFC      _ticks+1, 0 
	MOVWF       _tempoSmsg+1 
	MOVLW       0
	ADDWFC      _ticks+2, 0 
	MOVWF       _tempoSmsg+2 
	MOVLW       0
	ADDWFC      _ticks+3, 0 
	MOVWF       _tempoSmsg+3 
;CISTERNA_main.c,154 :: 		tmpBtn0 = 1;
	MOVLW       1
	MOVWF       _tmpBtn0+0 
;CISTERNA_main.c,155 :: 		tmpAut = 1;//modo automatico
	MOVLW       1
	MOVWF       _tmpAut+0 
;CISTERNA_main.c,156 :: 		tmpBtn1 = 0;
	CLRF        _tmpBtn1+0 
;CISTERNA_main.c,157 :: 		tmpV2V = 0;//condição inicial fechada
	CLRF        _tmpV2V+0 
;CISTERNA_main.c,161 :: 		while(TRUE)
L_main16:
;CISTERNA_main.c,163 :: 		Delay_ms(10);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	NOP
;CISTERNA_main.c,166 :: 		if(tmp_glcd.tmp_lv_cist1!=lv_cist1 || tmp_glcd.tmp_lv_cist2!=lv_cist2 || tmp_glcd.tmp_lv_cistRua != lv_cistRua ||
	MOVF        _tmp_glcd+0, 0 
	XORWF       _lv_cist1+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	MOVF        _tmp_glcd+1, 0 
	XORWF       _lv_cist2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	MOVF        _tmp_glcd+2, 0 
	XORWF       _lv_cistRua+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
;CISTERNA_main.c,167 :: 		tmp_glcd.tmp_RT_pump_rua != RT_pump_rua || tmp_glcd.tmp_RT_pump_cist != RT_pump_cist || tmp_glcd.tmp_lv_Rua != lv_cxRua || tmp_glcd.tmp_status_v2v != statusV2V)
	MOVF        _tmp_glcd+4, 0 
	XORWF       _RT_pump_rua+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	MOVF        _tmp_glcd+3, 0 
	XORWF       _RT_pump_cist+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	MOVF        _tmp_glcd+5, 0 
	XORWF       _lv_cxRua+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	MOVF        _tmp_glcd+7, 0 
	XORWF       _statusV2V+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	GOTO        L_main21
L__main129:
;CISTERNA_main.c,169 :: 		PrintScreen(curr_screen);
	MOVF        _curr_screen+0, 0 
	MOVWF       FARG_PrintScreen_current+0 
	CALL        _PrintScreen+0, 0
;CISTERNA_main.c,171 :: 		tmp_glcd.tmp_lv_cist1=lv_cist1;
	MOVF        _lv_cist1+0, 0 
	MOVWF       _tmp_glcd+0 
;CISTERNA_main.c,172 :: 		tmp_glcd.tmp_lv_cist2=lv_cist2;
	MOVF        _lv_cist2+0, 0 
	MOVWF       _tmp_glcd+1 
;CISTERNA_main.c,173 :: 		tmp_glcd.tmp_lv_cistRua = lv_cistRua;
	MOVF        _lv_cistRua+0, 0 
	MOVWF       _tmp_glcd+2 
;CISTERNA_main.c,174 :: 		tmp_glcd.tmp_RT_pump_rua = RT_pump_rua;
	MOVF        _RT_pump_rua+0, 0 
	MOVWF       _tmp_glcd+4 
;CISTERNA_main.c,175 :: 		tmp_glcd.tmp_RT_pump_cist = RT_pump_cist;
	MOVF        _RT_pump_cist+0, 0 
	MOVWF       _tmp_glcd+3 
;CISTERNA_main.c,176 :: 		tmp_glcd.tmp_lv_Rua = lv_cxRua;
	MOVF        _lv_cxRua+0, 0 
	MOVWF       _tmp_glcd+5 
;CISTERNA_main.c,177 :: 		tmp_glcd.tmp_status_v2v = statusV2V;
	MOVF        _statusV2V+0, 0 
	MOVWF       _tmp_glcd+7 
;CISTERNA_main.c,178 :: 		}
L_main21:
;CISTERNA_main.c,179 :: 		if(BTN_INCR)
	MOVLW       PORTA+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       4
	MOVWF       FARG_Button_pin+0 
	MOVLW       50
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main22
;CISTERNA_main.c,181 :: 		if(setupMode==0)
	MOVF        _setupMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;CISTERNA_main.c,183 :: 		++curr_screen;
	INCF        _curr_screen+0, 1 
;CISTERNA_main.c,184 :: 		if(curr_screen>2)curr_screen=0;
	MOVF        _curr_screen+0, 0 
	SUBLW       2
	BTFSC       STATUS+0, 0 
	GOTO        L_main24
	CLRF        _curr_screen+0 
L_main24:
;CISTERNA_main.c,185 :: 		}
	GOTO        L_main25
L_main23:
;CISTERNA_main.c,188 :: 		SetModeChgVar(setupPos);
	MOVF        _setupPos+0, 0 
	MOVWF       FARG_SetModeChgVar_position+0 
	CALL        _SetModeChgVar+0, 0
;CISTERNA_main.c,189 :: 		}
L_main25:
;CISTERNA_main.c,190 :: 		PrintScreen(curr_screen);
	MOVF        _curr_screen+0, 0 
	MOVWF       FARG_PrintScreen_current+0 
	CALL        _PrintScreen+0, 0
;CISTERNA_main.c,191 :: 		}
L_main22:
;CISTERNA_main.c,192 :: 		if(BTN_ENTER && curr_screen == 2)
	MOVLW       PORTA+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       3
	MOVWF       FARG_Button_pin+0 
	MOVLW       50
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main28
	MOVF        _curr_screen+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main28
L__main128:
;CISTERNA_main.c,194 :: 		setupMode=1;
	MOVLW       1
	MOVWF       _setupMode+0 
;CISTERNA_main.c,195 :: 		++setupPos;
	INCF        _setupPos+0, 1 
;CISTERNA_main.c,196 :: 		Image4.Visible=1;
	MOVLW       1
	MOVWF       _Image4+12 
;CISTERNA_main.c,197 :: 		if(setupPos==1)Image4.Top = 41;
	MOVF        _setupPos+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main29
	MOVLW       41
	MOVWF       _Image4+4 
L_main29:
;CISTERNA_main.c,198 :: 		if(setupPos==2)Image4.Top = 53;
	MOVF        _setupPos+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main30
	MOVLW       53
	MOVWF       _Image4+4 
L_main30:
;CISTERNA_main.c,199 :: 		if(setupPos==3)
	MOVF        _setupPos+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main31
;CISTERNA_main.c,201 :: 		setupMode=0;
	CLRF        _setupMode+0 
;CISTERNA_main.c,202 :: 		setupPos = 0;
	CLRF        _setupPos+0 
;CISTERNA_main.c,203 :: 		Image4.Visible=0;
	CLRF        _Image4+12 
;CISTERNA_main.c,204 :: 		}
L_main31:
;CISTERNA_main.c,205 :: 		PrintScreen(curr_screen);
	MOVF        _curr_screen+0, 0 
	MOVWF       FARG_PrintScreen_current+0 
	CALL        _PrintScreen+0, 0
;CISTERNA_main.c,206 :: 		}
L_main28:
;CISTERNA_main.c,207 :: 		}
	GOTO        L_main16
;CISTERNA_main.c,208 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Init_cfgMCU:

;CISTERNA_main.c,210 :: 		void Init_cfgMCU()
;CISTERNA_main.c,212 :: 		ANSELD = 0;      //PORTD como I/O digital
	CLRF        ANSELD+0 
;CISTERNA_main.c,213 :: 		TRISA.TRISA2 = 0; //output
	BCF         TRISA+0, 2 
;CISTERNA_main.c,214 :: 		TRISA.TRISA3 = 1; //enter button
	BSF         TRISA+0, 3 
;CISTERNA_main.c,215 :: 		TRISA.TRISA4 = 1; //increase button
	BSF         TRISA+0, 4 
;CISTERNA_main.c,216 :: 		TRISA.TRISA5 = 1; //botao manual automatico (input)
	BSF         TRISA+0, 5 
;CISTERNA_main.c,217 :: 		TRISA.TRISA6 = 1; //botao liga valvula (input)
	BSF         TRISA+0, 6 
;CISTERNA_main.c,220 :: 		PORTA.RA2 = 0;
	BCF         PORTA+0, 2 
;CISTERNA_main.c,221 :: 		TRISC.TRISC0 = 1;
	BSF         TRISC+0, 0 
;CISTERNA_main.c,222 :: 		}
L_end_Init_cfgMCU:
	RETURN      0
; end of _Init_cfgMCU

_DecodificaProtocolo:

;CISTERNA_main.c,224 :: 		void DecodificaProtocolo()
;CISTERNA_main.c,227 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '0')lv_cist1=(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo34
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo34
	MOVF        _Dta+2, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo34
L__DecodificaProtocolo138:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cist1+0 
	GOTO        L_DecodificaProtocolo35
L_DecodificaProtocolo34:
;CISTERNA_main.c,229 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '1')lv_cist2=(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo38
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo38
	MOVF        _Dta+2, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo38
L__DecodificaProtocolo137:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cist2+0 
	GOTO        L_DecodificaProtocolo39
L_DecodificaProtocolo38:
;CISTERNA_main.c,231 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '2')lv_cistRua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo42
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo42
	MOVF        _Dta+2, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo42
L__DecodificaProtocolo136:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cistRua+0 
	GOTO        L_DecodificaProtocolo43
L_DecodificaProtocolo42:
;CISTERNA_main.c,233 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '3')lv_cxRua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo46
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo46
	MOVF        _Dta+2, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo46
L__DecodificaProtocolo135:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cxRua+0 
	GOTO        L_DecodificaProtocolo47
L_DecodificaProtocolo46:
;CISTERNA_main.c,235 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '4')RT_pump_cist =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo50
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo50
	MOVF        _Dta+2, 0 
	XORLW       52
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo50
L__DecodificaProtocolo134:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _RT_pump_cist+0 
	GOTO        L_DecodificaProtocolo51
L_DecodificaProtocolo50:
;CISTERNA_main.c,237 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '5')RT_pump_rua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo54
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo54
	MOVF        _Dta+2, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo54
L__DecodificaProtocolo133:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _RT_pump_rua+0 
	GOTO        L_DecodificaProtocolo55
L_DecodificaProtocolo54:
;CISTERNA_main.c,239 :: 		if(Dta[0] == 'S' && Dta[1] == 'T' && Dta[2] == 'A')statusV2V =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo58
	MOVF        _Dta+1, 0 
	XORLW       84
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo58
	MOVF        _Dta+2, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo58
L__DecodificaProtocolo132:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _statusV2V+0 
	GOTO        L_DecodificaProtocolo59
L_DecodificaProtocolo58:
;CISTERNA_main.c,241 :: 		if(Dta[0] == 'C' && Dta[1] == '1' && Dta[2] == 'O' && Dta[3] == 'K')flagCMD2=1;
	MOVF        _Dta+0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo62
	MOVF        _Dta+1, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo62
	MOVF        _Dta+2, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo62
	MOVF        _Dta+3, 0 
	XORLW       75
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo62
L__DecodificaProtocolo131:
	MOVLW       1
	MOVWF       _flagCMD2+0 
	GOTO        L_DecodificaProtocolo63
L_DecodificaProtocolo62:
;CISTERNA_main.c,243 :: 		if(Dta[0] == 'C' && Dta[1] == '2' && Dta[2] == 'O' && Dta[3] == 'K')flagCMD1=1;//Todo valor (0 a 9) ASCII pode ser convertido para número subtraindo por '0'
	MOVF        _Dta+0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo66
	MOVF        _Dta+1, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo66
	MOVF        _Dta+2, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo66
	MOVF        _Dta+3, 0 
	XORLW       75
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo66
L__DecodificaProtocolo130:
	MOVLW       1
	MOVWF       _flagCMD1+0 
L_DecodificaProtocolo66:
L_DecodificaProtocolo63:
L_DecodificaProtocolo59:
L_DecodificaProtocolo55:
L_DecodificaProtocolo51:
L_DecodificaProtocolo47:
L_DecodificaProtocolo43:
L_DecodificaProtocolo39:
L_DecodificaProtocolo35:
;CISTERNA_main.c,244 :: 		}
L_end_DecodificaProtocolo:
	RETURN      0
; end of _DecodificaProtocolo

_SendComand:

;CISTERNA_main.c,246 :: 		bool_t SendComand(char* Comand,unsigned char* TxtReturn, uint16_t TimeOut)
;CISTERNA_main.c,248 :: 		while(*Comand != 0)
L_SendComand67:
	MOVFF       FARG_SendComand_Comand+0, FSR0L+0
	MOVFF       FARG_SendComand_Comand+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_SendComand68
;CISTERNA_main.c,250 :: 		UART1_Write(*Comand); //Envia Comando RS485
	MOVFF       FARG_SendComand_Comand+0, FSR0L+0
	MOVFF       FARG_SendComand_Comand+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,251 :: 		Comand++;
	INFSNZ      FARG_SendComand_Comand+0, 1 
	INCF        FARG_SendComand_Comand+1, 1 
;CISTERNA_main.c,252 :: 		}
	GOTO        L_SendComand67
L_SendComand68:
;CISTERNA_main.c,258 :: 		return RS485_WaitReturn(TxtReturn, TimeOut);  //Chama função que trata os retornos
	MOVF        FARG_SendComand_TxtReturn+0, 0 
	MOVWF       FARG_RS485_WaitReturn_TxtReturn+0 
	MOVF        FARG_SendComand_TxtReturn+1, 0 
	MOVWF       FARG_RS485_WaitReturn_TxtReturn+1 
	MOVF        FARG_SendComand_TimeOut+0, 0 
	MOVWF       FARG_RS485_WaitReturn_TimeOut+0 
	MOVF        FARG_SendComand_TimeOut+1, 0 
	MOVWF       FARG_RS485_WaitReturn_TimeOut+1 
	CALL        _RS485_WaitReturn+0, 0
;CISTERNA_main.c,259 :: 		}
L_end_SendComand:
	RETURN      0
; end of _SendComand

_RS485_WaitReturn:

;CISTERNA_main.c,261 :: 		bool_t RS485_WaitReturn (unsigned char* TxtReturn, uint16_t TimeOut)
;CISTERNA_main.c,264 :: 		tempo = start_timer(TimeOut);
	MOVF        FARG_RS485_WaitReturn_TimeOut+0, 0 
	ADDWF       _ticks+0, 0 
	MOVWF       R2 
	MOVF        FARG_RS485_WaitReturn_TimeOut+1, 0 
	ADDWFC      _ticks+1, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      _ticks+2, 0 
	MOVWF       R4 
	MOVLW       0
	ADDWFC      _ticks+3, 0 
	MOVWF       R5 
;CISTERNA_main.c,265 :: 		while((_tout == 0) || (!timeout(tempo)))
L_RS485_WaitReturn69:
	MOVLW       0
	XORWF       CISTERNA_main__tout+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn148
	MOVLW       0
	XORWF       CISTERNA_main__tout+0, 0 
L__RS485_WaitReturn148:
	BTFSC       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn139
	MOVF        _ticks+3, 0 
	SUBWF       R5, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn149
	MOVF        _ticks+2, 0 
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn149
	MOVF        _ticks+1, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn149
	MOVF        _ticks+0, 0 
	SUBWF       R2, 0 
L__RS485_WaitReturn149:
	BTFSC       STATUS+0, 0 
	GOTO        L_RS485_WaitReturn71
	MOVLW       1
	MOVWF       R1 
	GOTO        L_RS485_WaitReturn72
L_RS485_WaitReturn71:
	CLRF        R1 
L_RS485_WaitReturn72:
	MOVF        R1, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn139
	GOTO        L_RS485_WaitReturn70
L__RS485_WaitReturn139:
;CISTERNA_main.c,267 :: 		if(*TxtReturn==1) //received return
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+0, FSR0L+0
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_RS485_WaitReturn75
;CISTERNA_main.c,269 :: 		*TxtReturn = 0;
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+0, FSR1L+0
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+1, FSR1H+0
	CLRF        POSTINC1+0 
;CISTERNA_main.c,270 :: 		return TRUE;    // toda a sequência foi varrida: fim.
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_RS485_WaitReturn
;CISTERNA_main.c,271 :: 		}
L_RS485_WaitReturn75:
;CISTERNA_main.c,272 :: 		}
	GOTO        L_RS485_WaitReturn69
L_RS485_WaitReturn70:
;CISTERNA_main.c,273 :: 		return FALSE;
	CLRF        R0 
;CISTERNA_main.c,274 :: 		}
L_end_RS485_WaitReturn:
	RETURN      0
; end of _RS485_WaitReturn

_RS484_Init:

;CISTERNA_main.c,276 :: 		bool_t RS484_Init(unsigned char tmp)
;CISTERNA_main.c,278 :: 		bool_t result = TRUE;
	MOVLW       1
	MOVWF       RS484_Init_result_L0+0 
;CISTERNA_main.c,279 :: 		switch(tmp)
	GOTO        L_RS484_Init76
;CISTERNA_main.c,281 :: 		case 0:
L_RS484_Init78:
;CISTERNA_main.c,282 :: 		result = result & SendComand("[AUT0]",&flagCMD1,20);
	MOVLW       ?lstr1_CISTERNA_main+0
	MOVWF       FARG_SendComand_Comand+0 
	MOVLW       hi_addr(?lstr1_CISTERNA_main+0)
	MOVWF       FARG_SendComand_Comand+1 
	MOVLW       _flagCMD1+0
	MOVWF       FARG_SendComand_TxtReturn+0 
	MOVLW       hi_addr(_flagCMD1+0)
	MOVWF       FARG_SendComand_TxtReturn+1 
	MOVLW       20
	MOVWF       FARG_SendComand_TimeOut+0 
	MOVLW       0
	MOVWF       FARG_SendComand_TimeOut+1 
	CALL        _SendComand+0, 0
	MOVF        R0, 0 
	ANDWF       RS484_Init_result_L0+0, 1 
;CISTERNA_main.c,283 :: 		break;
	GOTO        L_RS484_Init77
;CISTERNA_main.c,284 :: 		case 1:
L_RS484_Init79:
;CISTERNA_main.c,285 :: 		result = result & SendComand("[AUT1]",&flagCMD1,20);
	MOVLW       ?lstr2_CISTERNA_main+0
	MOVWF       FARG_SendComand_Comand+0 
	MOVLW       hi_addr(?lstr2_CISTERNA_main+0)
	MOVWF       FARG_SendComand_Comand+1 
	MOVLW       _flagCMD1+0
	MOVWF       FARG_SendComand_TxtReturn+0 
	MOVLW       hi_addr(_flagCMD1+0)
	MOVWF       FARG_SendComand_TxtReturn+1 
	MOVLW       20
	MOVWF       FARG_SendComand_TimeOut+0 
	MOVLW       0
	MOVWF       FARG_SendComand_TimeOut+1 
	CALL        _SendComand+0, 0
	MOVF        R0, 0 
	ANDWF       RS484_Init_result_L0+0, 1 
;CISTERNA_main.c,286 :: 		break;
	GOTO        L_RS484_Init77
;CISTERNA_main.c,287 :: 		case 2:
L_RS484_Init80:
;CISTERNA_main.c,288 :: 		result = result & SendComand("[V2V0]",&flagCMD2,20);
	MOVLW       ?lstr3_CISTERNA_main+0
	MOVWF       FARG_SendComand_Comand+0 
	MOVLW       hi_addr(?lstr3_CISTERNA_main+0)
	MOVWF       FARG_SendComand_Comand+1 
	MOVLW       _flagCMD2+0
	MOVWF       FARG_SendComand_TxtReturn+0 
	MOVLW       hi_addr(_flagCMD2+0)
	MOVWF       FARG_SendComand_TxtReturn+1 
	MOVLW       20
	MOVWF       FARG_SendComand_TimeOut+0 
	MOVLW       0
	MOVWF       FARG_SendComand_TimeOut+1 
	CALL        _SendComand+0, 0
	MOVF        R0, 0 
	ANDWF       RS484_Init_result_L0+0, 1 
;CISTERNA_main.c,289 :: 		break;
	GOTO        L_RS484_Init77
;CISTERNA_main.c,290 :: 		case 3:
L_RS484_Init81:
;CISTERNA_main.c,291 :: 		result = result & SendComand("[V2V1]",&flagCMD2,20);
	MOVLW       ?lstr4_CISTERNA_main+0
	MOVWF       FARG_SendComand_Comand+0 
	MOVLW       hi_addr(?lstr4_CISTERNA_main+0)
	MOVWF       FARG_SendComand_Comand+1 
	MOVLW       _flagCMD2+0
	MOVWF       FARG_SendComand_TxtReturn+0 
	MOVLW       hi_addr(_flagCMD2+0)
	MOVWF       FARG_SendComand_TxtReturn+1 
	MOVLW       20
	MOVWF       FARG_SendComand_TimeOut+0 
	MOVLW       0
	MOVWF       FARG_SendComand_TimeOut+1 
	CALL        _SendComand+0, 0
	MOVF        R0, 0 
	ANDWF       RS484_Init_result_L0+0, 1 
;CISTERNA_main.c,292 :: 		break;
	GOTO        L_RS484_Init77
;CISTERNA_main.c,293 :: 		}
L_RS484_Init76:
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init78
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init79
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init80
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init81
L_RS484_Init77:
;CISTERNA_main.c,294 :: 		return result;
	MOVF        RS484_Init_result_L0+0, 0 
	MOVWF       R0 
;CISTERNA_main.c,295 :: 		}
L_end_RS484_Init:
	RETURN      0
; end of _RS484_Init

_REEnviarDados:

;CISTERNA_main.c,297 :: 		void REEnviarDados(unsigned char *retData)
;CISTERNA_main.c,299 :: 		UART1_Write('[');       //inicio do protocolo
	MOVLW       91
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,301 :: 		while(*retData != 0)
L_REEnviarDados82:
	MOVFF       FARG_REEnviarDados_retData+0, FSR0L+0
	MOVFF       FARG_REEnviarDados_retData+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_REEnviarDados83
;CISTERNA_main.c,303 :: 		UART1_Write(*retData);   //Conteúdo do protocolo
	MOVFF       FARG_REEnviarDados_retData+0, FSR0L+0
	MOVFF       FARG_REEnviarDados_retData+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,304 :: 		++retData;
	INFSNZ      FARG_REEnviarDados_retData+0, 1 
	INCF        FARG_REEnviarDados_retData+1, 1 
;CISTERNA_main.c,305 :: 		}
	GOTO        L_REEnviarDados82
L_REEnviarDados83:
;CISTERNA_main.c,307 :: 		UART1_Write(']');    //fim do protocolo
	MOVLW       93
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,308 :: 		}
L_end_REEnviarDados:
	RETURN      0
; end of _REEnviarDados

_Timers_Init:

;CISTERNA_main.c,310 :: 		void Timers_Init()
;CISTERNA_main.c,312 :: 		T0CON         = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;CISTERNA_main.c,313 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;CISTERNA_main.c,314 :: 		INTCON2.TMR0IP = 1;
	BSF         INTCON2+0, 2 
;CISTERNA_main.c,315 :: 		TMR0IE_bit         = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;CISTERNA_main.c,316 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;CISTERNA_main.c,317 :: 		TMR0L         = 0xC0; //20 ms
	MOVLW       192
	MOVWF       TMR0L+0 
;CISTERNA_main.c,318 :: 		TMR0ON_bit = 1;
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;CISTERNA_main.c,319 :: 		}
L_end_Timers_Init:
	RETURN      0
; end of _Timers_Init

_PrintScreen:

;CISTERNA_main.c,321 :: 		void PrintScreen(unsigned char current)
;CISTERNA_main.c,323 :: 		switch (current)
	GOTO        L_PrintScreen84
;CISTERNA_main.c,325 :: 		case 0:
L_PrintScreen86:
;CISTERNA_main.c,326 :: 		if(lv_cistRua==0)strcpy(NvCistP.Caption, "Vazia");
	MOVF        _lv_cistRua+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen87
	MOVF        _NvCistP+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistP+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr5_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr5_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen88
L_PrintScreen87:
;CISTERNA_main.c,327 :: 		else strcpy(NvCistP.Caption, "Cheia");
	MOVF        _NvCistP+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistP+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr6_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr6_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen88:
;CISTERNA_main.c,328 :: 		if(lv_cist1==0)strcpy(NvCist1.Caption, "Vazia");
	MOVF        _lv_cist1+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen89
	MOVF        _NvCist1+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist1+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr7_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr7_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen90
L_PrintScreen89:
;CISTERNA_main.c,329 :: 		else strcpy(NvCist1.Caption, "Cheia");
	MOVF        _NvCist1+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist1+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr8_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr8_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen90:
;CISTERNA_main.c,330 :: 		if(lv_cist2==0)strcpy(NvCist2.Caption, "Vazia");
	MOVF        _lv_cist2+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen91
	MOVF        _NvCist2+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist2+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr9_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr9_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen92
L_PrintScreen91:
;CISTERNA_main.c,331 :: 		else strcpy(NvCist2.Caption, "Cheia");
	MOVF        _NvCist2+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist2+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr10_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr10_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen92:
;CISTERNA_main.c,332 :: 		if(lv_cxRua==0)strcpy(NvCistR.Caption, "Vazia");
	MOVF        _lv_cxRua+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen93
	MOVF        _NvCistR+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistR+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr11_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr11_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen94
L_PrintScreen93:
;CISTERNA_main.c,333 :: 		else strcpy(NvCistR.Caption, "Cheia");
	MOVF        _NvCistR+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistR+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr12_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr12_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen94:
;CISTERNA_main.c,334 :: 		DrawScreen(&Tela_Inicial);
	MOVLW       _Tela_Inicial+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_main.c,335 :: 		break;
	GOTO        L_PrintScreen85
;CISTERNA_main.c,336 :: 		case 1:
L_PrintScreen95:
;CISTERNA_main.c,337 :: 		if(lv_cxRua2==0)strcpy(NvCxRua02.Caption, "Vazia");
	MOVF        _lv_cxRua2+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen96
	MOVF        _NvCxRua02+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCxRua02+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr13_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr13_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen97
L_PrintScreen96:
;CISTERNA_main.c,338 :: 		else strcpy(NvCxRua02.Caption, "Cheia");
	MOVF        _NvCxRua02+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCxRua02+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr14_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr14_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen97:
;CISTERNA_main.c,339 :: 		if(statusV2V==0)strcpy(StatV2V.Caption, "Off");
	MOVF        _statusV2V+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen98
	MOVF        _StatV2V+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _StatV2V+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr15_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr15_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen99
L_PrintScreen98:
;CISTERNA_main.c,340 :: 		else strcpy(StatV2V.Caption, "On");
	MOVF        _StatV2V+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _StatV2V+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr16_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr16_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen99:
;CISTERNA_main.c,341 :: 		DrawScreen(&Screen_cxRua);
	MOVLW       _Screen_cxRua+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen_cxRua+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_main.c,342 :: 		break;
	GOTO        L_PrintScreen85
;CISTERNA_main.c,343 :: 		case 2:
L_PrintScreen100:
;CISTERNA_main.c,344 :: 		if(RT_pump_rua==0)strcpy(RT_BP.Caption, "Normal");
	MOVF        _RT_pump_rua+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen101
	MOVF        _RT_BP+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _RT_BP+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr17_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr17_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen102
L_PrintScreen101:
;CISTERNA_main.c,345 :: 		else strcpy(RT_BP.Caption, "Alarm");
	MOVF        _RT_BP+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _RT_BP+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr18_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr18_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen102:
;CISTERNA_main.c,346 :: 		if(RT_pump_cist==0)strcpy(Rt_BCist.Caption, "Normal");
	MOVF        _RT_pump_cist+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen103
	MOVF        _Rt_BCist+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _Rt_BCist+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr19_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr19_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen104
L_PrintScreen103:
;CISTERNA_main.c,347 :: 		else strcpy(Rt_BCist.Caption, "Alarm");
	MOVF        _Rt_BCist+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _Rt_BCist+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr20_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr20_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen104:
;CISTERNA_main.c,348 :: 		if(tmpAut==0)strcpy(ManText.Caption, "Man");
	MOVF        _tmpAut+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen105
	MOVF        _ManText+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _ManText+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr21_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr21_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen106
L_PrintScreen105:
;CISTERNA_main.c,349 :: 		else strcpy(ManText.Caption, "Aut");
	MOVF        _ManText+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _ManText+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr22_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr22_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen106:
;CISTERNA_main.c,350 :: 		if(tmpV2V==0)strcpy(V2VTxt.Caption, "Off");
	MOVF        _tmpV2V+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen107
	MOVF        _V2VTxt+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _V2VTxt+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr23_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr23_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen108
L_PrintScreen107:
;CISTERNA_main.c,351 :: 		else strcpy(V2VTxt.Caption, "On");
	MOVF        _V2VTxt+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _V2VTxt+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr24_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr24_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen108:
;CISTERNA_main.c,352 :: 		DrawScreen(&Misc1);
	MOVLW       _Misc1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_main.c,353 :: 		break;
	GOTO        L_PrintScreen85
;CISTERNA_main.c,354 :: 		}
L_PrintScreen84:
	MOVF        FARG_PrintScreen_current+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_PrintScreen86
	MOVF        FARG_PrintScreen_current+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_PrintScreen95
	MOVF        FARG_PrintScreen_current+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_PrintScreen100
L_PrintScreen85:
;CISTERNA_main.c,355 :: 		}
L_end_PrintScreen:
	RETURN      0
; end of _PrintScreen

_SetModeChgVar:

;CISTERNA_main.c,357 :: 		void SetModeChgVar(unsigned char position)
;CISTERNA_main.c,359 :: 		if(position==1)//man aut mode
	MOVF        FARG_SetModeChgVar_position+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar109
;CISTERNA_main.c,361 :: 		tmpAut ^= 1; //toggle tmpAut
	MOVLW       1
	XORWF       _tmpAut+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       _tmpAut+0 
;CISTERNA_main.c,362 :: 		ctrl_msg = (tmpAut==0)?0:1;
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar110
	CLRF        ?FLOC___SetModeChgVarT219+0 
	GOTO        L_SetModeChgVar111
L_SetModeChgVar110:
	MOVLW       1
	MOVWF       ?FLOC___SetModeChgVarT219+0 
L_SetModeChgVar111:
	MOVF        ?FLOC___SetModeChgVarT219+0, 0 
	MOVWF       _ctrl_msg+0 
;CISTERNA_main.c,363 :: 		}
L_SetModeChgVar109:
;CISTERNA_main.c,364 :: 		if(position==2) //on v2v
	MOVF        FARG_SetModeChgVar_position+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar112
;CISTERNA_main.c,366 :: 		tmpV2V ^= 1; //toggle tmpAut
	MOVLW       1
	XORWF       _tmpV2V+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       _tmpV2V+0 
;CISTERNA_main.c,368 :: 		ctrl_msg = (tmpV2V==0)?2:3;
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar113
	MOVLW       2
	MOVWF       ?FLOC___SetModeChgVarT223+0 
	GOTO        L_SetModeChgVar114
L_SetModeChgVar113:
	MOVLW       3
	MOVWF       ?FLOC___SetModeChgVarT223+0 
L_SetModeChgVar114:
	MOVF        ?FLOC___SetModeChgVarT223+0, 0 
	MOVWF       _ctrl_msg+0 
;CISTERNA_main.c,369 :: 		}
L_SetModeChgVar112:
;CISTERNA_main.c,370 :: 		if(tmpAut!=tmpBtn0 || tmpV2V!=tmpBtn1) //comparativo para enviar msg
	MOVF        _tmpAut+0, 0 
	XORWF       _tmpBtn0+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SetModeChgVar140
	MOVF        _tmpV2V+0, 0 
	XORWF       _tmpBtn1+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SetModeChgVar140
	GOTO        L_SetModeChgVar117
L__SetModeChgVar140:
;CISTERNA_main.c,372 :: 		while(!RS484_Init(ctrl_msg))
L_SetModeChgVar118:
	MOVF        _ctrl_msg+0, 0 
	MOVWF       FARG_RS484_Init_tmp+0 
	CALL        _RS484_Init+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar119
;CISTERNA_main.c,374 :: 		PORTA.RA2 ^= 1;        //Enquanto o módulo não receber cofirmação de recebimento de cmd
	BTG         PORTA+0, 2 
;CISTERNA_main.c,375 :: 		Delay_ms(500);         //Retorna 1 se retorno ocorrer com sucesso.
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_SetModeChgVar120:
	DECFSZ      R13, 1, 1
	BRA         L_SetModeChgVar120
	DECFSZ      R12, 1, 1
	BRA         L_SetModeChgVar120
	DECFSZ      R11, 1, 1
	BRA         L_SetModeChgVar120
	NOP
;CISTERNA_main.c,377 :: 		}
	GOTO        L_SetModeChgVar118
L_SetModeChgVar119:
;CISTERNA_main.c,379 :: 		if(tmpAut==0)strcpy(ManText.Caption, "Man");
	MOVF        _tmpAut+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar121
	MOVF        _ManText+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _ManText+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr25_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr25_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_SetModeChgVar122
L_SetModeChgVar121:
;CISTERNA_main.c,380 :: 		else strcpy(ManText.Caption, "Aut");
	MOVF        _ManText+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _ManText+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr26_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr26_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_SetModeChgVar122:
;CISTERNA_main.c,381 :: 		if(tmpV2V==0)strcpy(V2VTxt.Caption, "Off");
	MOVF        _tmpV2V+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar123
	MOVF        _V2VTxt+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _V2VTxt+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr27_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr27_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_SetModeChgVar124
L_SetModeChgVar123:
;CISTERNA_main.c,382 :: 		else strcpy(V2VTxt.Caption, "On");
	MOVF        _V2VTxt+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _V2VTxt+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr28_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr28_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_SetModeChgVar124:
;CISTERNA_main.c,383 :: 		}
L_SetModeChgVar117:
;CISTERNA_main.c,384 :: 		tmpBtn0=tmpAut;   //confirma comparativo
	MOVF        _tmpAut+0, 0 
	MOVWF       _tmpBtn0+0 
;CISTERNA_main.c,385 :: 		tmpBtn1=tmpV2V;   //confirma comparativo
	MOVF        _tmpV2V+0, 0 
	MOVWF       _tmpBtn1+0 
;CISTERNA_main.c,386 :: 		PORTA.RA2= 0; //desliga led
	BCF         PORTA+0, 2 
;CISTERNA_main.c,387 :: 		}
L_end_SetModeChgVar:
	RETURN      0
; end of _SetModeChgVar
