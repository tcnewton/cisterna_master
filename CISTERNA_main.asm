
_UART_RCV:

;CISTERNA_main.c,99 :: 		void UART_RCV() iv 0x0008 ics ICS_AUTO
;CISTERNA_main.c,102 :: 		if(TMR0IF_bit == 1 && TMR0IE_bit == 1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_UART_RCV2
	BTFSS       TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
	GOTO        L_UART_RCV2
L__UART_RCV144:
;CISTERNA_main.c,104 :: 		++ticks;
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
;CISTERNA_main.c,105 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;CISTERNA_main.c,106 :: 		TMR0L         = 0xC0; //20 ms
	MOVLW       192
	MOVWF       TMR0L+0 
;CISTERNA_main.c,107 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;CISTERNA_main.c,108 :: 		}
	GOTO        L_UART_RCV3
L_UART_RCV2:
;CISTERNA_main.c,110 :: 		if(PIR1.RC1IF == 1 && PIE1.RC1IE == 1)
	BTFSS       PIR1+0, 5 
	GOTO        L_UART_RCV6
	BTFSS       PIE1+0, 5 
	GOTO        L_UART_RCV6
L__UART_RCV143:
;CISTERNA_main.c,112 :: 		sdata = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       UART_RCV_sdata_L0+0 
;CISTERNA_main.c,113 :: 		if(sdata == '[')     //Ex: [V2V01] - [AUT]
	MOVF        R0, 0 
	XORLW       91
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV7
;CISTERNA_main.c,115 :: 		Pot = Dta;       //Salva o endereço da matriz no ponteiro
	MOVLW       _Dta+0
	MOVWF       _Pot+0 
	MOVLW       hi_addr(_Dta+0)
	MOVWF       _Pot+1 
;CISTERNA_main.c,116 :: 		_Aux = 1;        //Flag que informa o início do protocolo
	MOVLW       1
	MOVWF       __Aux+0 
;CISTERNA_main.c,117 :: 		}
	GOTO        L_UART_RCV8
L_UART_RCV7:
;CISTERNA_main.c,119 :: 		if(sdata == ']' && _Aux == 1)
	MOVF        UART_RCV_sdata_L0+0, 0 
	XORLW       93
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV11
	MOVF        __Aux+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV11
L__UART_RCV142:
;CISTERNA_main.c,121 :: 		_Aux = 0;
	CLRF        __Aux+0 
;CISTERNA_main.c,124 :: 		DecodificaProtocolo();
	CALL        _DecodificaProtocolo+0, 0
;CISTERNA_main.c,125 :: 		}
	GOTO        L_UART_RCV12
L_UART_RCV11:
;CISTERNA_main.c,127 :: 		if (_Aux == 1)
	MOVF        __Aux+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV13
;CISTERNA_main.c,129 :: 		*Pot = sdata;
	MOVFF       _Pot+0, FSR1L+0
	MOVFF       _Pot+1, FSR1H+0
	MOVF        UART_RCV_sdata_L0+0, 0 
	MOVWF       POSTINC1+0 
;CISTERNA_main.c,130 :: 		++Pot;
	INFSNZ      _Pot+0, 1 
	INCF        _Pot+1, 1 
;CISTERNA_main.c,132 :: 		}
L_UART_RCV13:
L_UART_RCV12:
L_UART_RCV8:
;CISTERNA_main.c,133 :: 		PIR1.RC1IF = 0;
	BCF         PIR1+0, 5 
;CISTERNA_main.c,134 :: 		}
L_UART_RCV6:
L_UART_RCV3:
;CISTERNA_main.c,135 :: 		}
L_end_UART_RCV:
L__UART_RCV162:
	RETFIE      1
; end of _UART_RCV

_main:

;CISTERNA_main.c,139 :: 		void main() {
;CISTERNA_main.c,140 :: 		Start_TP();
	CALL        _Start_TP+0, 0
;CISTERNA_main.c,141 :: 		Init_cfgMCU();
	CALL        _Init_cfgMCU+0, 0
;CISTERNA_main.c,142 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       3
	MOVWF       SPBRGH+0 
	MOVLW       64
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;CISTERNA_main.c,143 :: 		Delay_ms(100);
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
;CISTERNA_main.c,144 :: 		PWM1_Init(3000);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       166
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;CISTERNA_main.c,145 :: 		PWM1_Set_Duty(255*80/100);
	MOVLW       204
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;CISTERNA_main.c,147 :: 		INTCON.GIEH = 1;
	BSF         INTCON+0, 7 
;CISTERNA_main.c,148 :: 		INTCON.GIEL = 1;
	BSF         INTCON+0, 6 
;CISTERNA_main.c,149 :: 		RCON.IPEN = 1;
	BSF         RCON+0, 7 
;CISTERNA_main.c,152 :: 		PIR1.RC1IF = 0;
	BCF         PIR1+0, 5 
;CISTERNA_main.c,153 :: 		IPR1.RC1IP = 1;
	BSF         IPR1+0, 5 
;CISTERNA_main.c,154 :: 		PIE1.RC1IE = 1;
	BSF         PIE1+0, 5 
;CISTERNA_main.c,157 :: 		Delay_ms(500);
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
;CISTERNA_main.c,158 :: 		Timers_Init();
	CALL        _Timers_Init+0, 0
;CISTERNA_main.c,159 :: 		tempoLed = start_timer(2);
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
;CISTERNA_main.c,160 :: 		tempoSmsg = start_timer(20);
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
;CISTERNA_main.c,161 :: 		tempoBuzzer = start_timer(100);
	MOVLW       100
	ADDWF       _ticks+0, 0 
	MOVWF       _tempoBuzzer+0 
	MOVLW       0
	ADDWFC      _ticks+1, 0 
	MOVWF       _tempoBuzzer+1 
	MOVLW       0
	ADDWFC      _ticks+2, 0 
	MOVWF       _tempoBuzzer+2 
	MOVLW       0
	ADDWFC      _ticks+3, 0 
	MOVWF       _tempoBuzzer+3 
;CISTERNA_main.c,163 :: 		tmpBtn0 = 1;
	MOVLW       1
	MOVWF       _tmpBtn0+0 
;CISTERNA_main.c,164 :: 		tmpAut = 1;//modo automatico
	MOVLW       1
	MOVWF       _tmpAut+0 
;CISTERNA_main.c,165 :: 		tmpBtn1 = 0;
	CLRF        _tmpBtn1+0 
;CISTERNA_main.c,166 :: 		tmpV2V = 0;//condição inicial fechada
	CLRF        _tmpV2V+0 
;CISTERNA_main.c,167 :: 		flagAlarm=1;
	BSF         _flagAlarm+0, BitPos(_flagAlarm+0) 
;CISTERNA_main.c,168 :: 		flagBuzzer=1;
	BSF         _flagBuzzer+0, BitPos(_flagBuzzer+0) 
;CISTERNA_main.c,172 :: 		while(TRUE)
L_main16:
;CISTERNA_main.c,174 :: 		Delay_ms(10);
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
;CISTERNA_main.c,175 :: 		if(RT_pump_cist||RT_pump_rua||!lv_cist1||!lv_cist2)set_alarm();//alarm condition
	MOVF        _RT_pump_cist+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main148
	MOVF        _RT_pump_rua+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main148
	MOVF        _lv_cist1+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__main148
	MOVF        _lv_cist2+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__main148
	GOTO        L_main21
L__main148:
	CALL        _set_alarm+0, 0
	GOTO        L_main22
L_main21:
;CISTERNA_main.c,178 :: 		reset_alarm();
	CALL        _reset_alarm+0, 0
;CISTERNA_main.c,179 :: 		mute_alarm_off();
	CALL        _mute_alarm_off+0, 0
;CISTERNA_main.c,180 :: 		}
L_main22:
;CISTERNA_main.c,182 :: 		if(tmp_glcd.tmp_lv_cist1!=lv_cist1 || tmp_glcd.tmp_lv_cist2!=lv_cist2 || tmp_glcd.tmp_lv_cistRua != lv_cistRua ||
	MOVF        _tmp_glcd+0, 0 
	XORWF       _lv_cist1+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
	MOVF        _tmp_glcd+1, 0 
	XORWF       _lv_cist2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
	MOVF        _tmp_glcd+2, 0 
	XORWF       _lv_cistRua+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
;CISTERNA_main.c,183 :: 		tmp_glcd.tmp_RT_pump_rua != RT_pump_rua || tmp_glcd.tmp_RT_pump_cist != RT_pump_cist || tmp_glcd.tmp_lv_Rua != lv_cxRua ||
	MOVF        _tmp_glcd+4, 0 
	XORWF       _RT_pump_rua+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
	MOVF        _tmp_glcd+3, 0 
	XORWF       _RT_pump_cist+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
	MOVF        _tmp_glcd+5, 0 
	XORWF       _lv_cxRua+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
;CISTERNA_main.c,184 :: 		tmp_glcd.tmp_status_v2v != statusV2V || tmp_glcd.tmp_lv_Rua2 != lv_cxRua2)
	MOVF        _tmp_glcd+7, 0 
	XORWF       _statusV2V+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
	MOVF        _tmp_glcd+6, 0 
	XORWF       _lv_cxRua2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
	GOTO        L_main25
L__main147:
;CISTERNA_main.c,186 :: 		PrintScreen(curr_screen);
	MOVF        _curr_screen+0, 0 
	MOVWF       FARG_PrintScreen_current+0 
	CALL        _PrintScreen+0, 0
;CISTERNA_main.c,188 :: 		tmp_glcd.tmp_lv_cist1=lv_cist1;
	MOVF        _lv_cist1+0, 0 
	MOVWF       _tmp_glcd+0 
;CISTERNA_main.c,189 :: 		tmp_glcd.tmp_lv_cist2=lv_cist2;
	MOVF        _lv_cist2+0, 0 
	MOVWF       _tmp_glcd+1 
;CISTERNA_main.c,190 :: 		tmp_glcd.tmp_lv_cistRua = lv_cistRua;
	MOVF        _lv_cistRua+0, 0 
	MOVWF       _tmp_glcd+2 
;CISTERNA_main.c,191 :: 		tmp_glcd.tmp_RT_pump_rua = RT_pump_rua;
	MOVF        _RT_pump_rua+0, 0 
	MOVWF       _tmp_glcd+4 
;CISTERNA_main.c,192 :: 		tmp_glcd.tmp_RT_pump_cist = RT_pump_cist;
	MOVF        _RT_pump_cist+0, 0 
	MOVWF       _tmp_glcd+3 
;CISTERNA_main.c,193 :: 		tmp_glcd.tmp_lv_Rua = lv_cxRua;
	MOVF        _lv_cxRua+0, 0 
	MOVWF       _tmp_glcd+5 
;CISTERNA_main.c,194 :: 		tmp_glcd.tmp_status_v2v = statusV2V;
	MOVF        _statusV2V+0, 0 
	MOVWF       _tmp_glcd+7 
;CISTERNA_main.c,195 :: 		tmp_glcd.tmp_lv_Rua2 = lv_cxRua2;
	MOVF        _lv_cxRua2+0, 0 
	MOVWF       _tmp_glcd+6 
;CISTERNA_main.c,196 :: 		}
L_main25:
;CISTERNA_main.c,197 :: 		if(BTN_INCR)
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
	GOTO        L_main26
;CISTERNA_main.c,199 :: 		if(SetupMode==0)
	BTFSC       _SetupMode+0, BitPos(_SetupMode+0) 
	GOTO        L_main27
;CISTERNA_main.c,201 :: 		++curr_screen;
	INCF        _curr_screen+0, 1 
;CISTERNA_main.c,202 :: 		if(curr_screen>1)curr_screen=0;
	MOVF        _curr_screen+0, 0 
	SUBLW       1
	BTFSC       STATUS+0, 0 
	GOTO        L_main28
	CLRF        _curr_screen+0 
L_main28:
;CISTERNA_main.c,203 :: 		}
	GOTO        L_main29
L_main27:
;CISTERNA_main.c,206 :: 		SetModeChgVar(setupPos);
	MOVF        _setupPos+0, 0 
	MOVWF       FARG_SetModeChgVar_position+0 
	CALL        _SetModeChgVar+0, 0
;CISTERNA_main.c,207 :: 		}
L_main29:
;CISTERNA_main.c,208 :: 		PrintScreen(curr_screen);
	MOVF        _curr_screen+0, 0 
	MOVWF       FARG_PrintScreen_current+0 
	CALL        _PrintScreen+0, 0
;CISTERNA_main.c,209 :: 		}
L_main26:
;CISTERNA_main.c,210 :: 		if(BTN_ENTER && curr_screen == 1)
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
	GOTO        L_main32
	MOVF        _curr_screen+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main32
L__main146:
;CISTERNA_main.c,212 :: 		SetupMode=1;
	BSF         _SetupMode+0, BitPos(_SetupMode+0) 
;CISTERNA_main.c,213 :: 		++setupPos;
	INCF        _setupPos+0, 1 
;CISTERNA_main.c,214 :: 		Image4.Visible=1;
	MOVLW       1
	MOVWF       _Image4+12 
;CISTERNA_main.c,215 :: 		if(setupPos==1)Image4.Top = 41;
	MOVF        _setupPos+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main33
	MOVLW       41
	MOVWF       _Image4+4 
L_main33:
;CISTERNA_main.c,216 :: 		if(setupPos==2)Image4.Top = 53;
	MOVF        _setupPos+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
	MOVLW       53
	MOVWF       _Image4+4 
L_main34:
;CISTERNA_main.c,217 :: 		if(setupPos==3)
	MOVF        _setupPos+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main35
;CISTERNA_main.c,219 :: 		SetupMode=0;
	BCF         _SetupMode+0, BitPos(_SetupMode+0) 
;CISTERNA_main.c,220 :: 		setupPos = 0;
	CLRF        _setupPos+0 
;CISTERNA_main.c,221 :: 		Image4.Visible=0;
	CLRF        _Image4+12 
;CISTERNA_main.c,222 :: 		}
L_main35:
;CISTERNA_main.c,223 :: 		PrintScreen(curr_screen);
	MOVF        _curr_screen+0, 0 
	MOVWF       FARG_PrintScreen_current+0 
	CALL        _PrintScreen+0, 0
;CISTERNA_main.c,224 :: 		}
L_main32:
;CISTERNA_main.c,225 :: 		if(BTN_ENTER && curr_screen == 0)
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
	GOTO        L_main38
	MOVF        _curr_screen+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
L__main145:
;CISTERNA_main.c,227 :: 		flagAlarm^=1; //toggle flag alarm
	BTG         _flagAlarm+0, BitPos(_flagAlarm+0) 
;CISTERNA_main.c,228 :: 		}
L_main38:
;CISTERNA_main.c,229 :: 		}
	GOTO        L_main16
;CISTERNA_main.c,230 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Init_cfgMCU:

;CISTERNA_main.c,232 :: 		void Init_cfgMCU()
;CISTERNA_main.c,234 :: 		ANSELD = 0;      //PORTD como I/O digital
	CLRF        ANSELD+0 
;CISTERNA_main.c,235 :: 		TRISA.TRISA2 = 0; //output
	BCF         TRISA+0, 2 
;CISTERNA_main.c,236 :: 		TRISA.TRISA3 = 1; //enter button
	BSF         TRISA+0, 3 
;CISTERNA_main.c,237 :: 		TRISA.TRISA4 = 1; //increase button
	BSF         TRISA+0, 4 
;CISTERNA_main.c,238 :: 		TRISA.TRISA5 = 1; //botao manual automatico (input)
	BSF         TRISA+0, 5 
;CISTERNA_main.c,239 :: 		TRISA.TRISA6 = 1; //botao liga valvula (input)
	BSF         TRISA+0, 6 
;CISTERNA_main.c,242 :: 		PORTA.RA2 = 0;
	BCF         PORTA+0, 2 
;CISTERNA_main.c,243 :: 		TRISC.TRISC0 = 1;
	BSF         TRISC+0, 0 
;CISTERNA_main.c,244 :: 		TRISC.TRISC2=0;
	BCF         TRISC+0, 2 
;CISTERNA_main.c,245 :: 		ANSELE = 0;
	CLRF        ANSELE+0 
;CISTERNA_main.c,246 :: 		TRISE.TRISE1=0;//output for buzzer
	BCF         TRISE+0, 1 
;CISTERNA_main.c,247 :: 		PORTE.RE1 = 0;
	BCF         PORTE+0, 1 
;CISTERNA_main.c,248 :: 		}
L_end_Init_cfgMCU:
	RETURN      0
; end of _Init_cfgMCU

_DecodificaProtocolo:

;CISTERNA_main.c,250 :: 		void DecodificaProtocolo()
;CISTERNA_main.c,253 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '0')lv_cist1=(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo41
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo41
	MOVF        _Dta+2, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo41
L__DecodificaProtocolo158:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cist1+0 
	GOTO        L_DecodificaProtocolo42
L_DecodificaProtocolo41:
;CISTERNA_main.c,255 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '1')lv_cist2=(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo45
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo45
	MOVF        _Dta+2, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo45
L__DecodificaProtocolo157:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cist2+0 
	GOTO        L_DecodificaProtocolo46
L_DecodificaProtocolo45:
;CISTERNA_main.c,257 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '2')lv_cistRua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo49
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo49
	MOVF        _Dta+2, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo49
L__DecodificaProtocolo156:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cistRua+0 
	GOTO        L_DecodificaProtocolo50
L_DecodificaProtocolo49:
;CISTERNA_main.c,259 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '3')lv_cxRua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo53
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo53
	MOVF        _Dta+2, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo53
L__DecodificaProtocolo155:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cxRua+0 
	GOTO        L_DecodificaProtocolo54
L_DecodificaProtocolo53:
;CISTERNA_main.c,261 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '4')RT_pump_cist =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo57
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo57
	MOVF        _Dta+2, 0 
	XORLW       52
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo57
L__DecodificaProtocolo154:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _RT_pump_cist+0 
	GOTO        L_DecodificaProtocolo58
L_DecodificaProtocolo57:
;CISTERNA_main.c,263 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '5')RT_pump_rua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo61
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo61
	MOVF        _Dta+2, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo61
L__DecodificaProtocolo153:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _RT_pump_rua+0 
	GOTO        L_DecodificaProtocolo62
L_DecodificaProtocolo61:
;CISTERNA_main.c,265 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '6')lv_cxRua2 =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo65
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo65
	MOVF        _Dta+2, 0 
	XORLW       54
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo65
L__DecodificaProtocolo152:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cxRua2+0 
	GOTO        L_DecodificaProtocolo66
L_DecodificaProtocolo65:
;CISTERNA_main.c,267 :: 		if(Dta[0] == 'S' && Dta[1] == 'T' && Dta[2] == 'A')statusV2V =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo69
	MOVF        _Dta+1, 0 
	XORLW       84
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo69
	MOVF        _Dta+2, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo69
L__DecodificaProtocolo151:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _statusV2V+0 
	GOTO        L_DecodificaProtocolo70
L_DecodificaProtocolo69:
;CISTERNA_main.c,269 :: 		if(Dta[0] == 'C' && Dta[1] == '1' && Dta[2] == 'O' && Dta[3] == 'K')flagCMD2=1;
	MOVF        _Dta+0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo73
	MOVF        _Dta+1, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo73
	MOVF        _Dta+2, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo73
	MOVF        _Dta+3, 0 
	XORLW       75
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo73
L__DecodificaProtocolo150:
	MOVLW       1
	MOVWF       _flagCMD2+0 
	GOTO        L_DecodificaProtocolo74
L_DecodificaProtocolo73:
;CISTERNA_main.c,271 :: 		if(Dta[0] == 'C' && Dta[1] == '2' && Dta[2] == 'O' && Dta[3] == 'K')flagCMD1=1;//Todo valor (0 a 9) ASCII pode ser convertido para número subtraindo por '0'
	MOVF        _Dta+0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo77
	MOVF        _Dta+1, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo77
	MOVF        _Dta+2, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo77
	MOVF        _Dta+3, 0 
	XORLW       75
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo77
L__DecodificaProtocolo149:
	MOVLW       1
	MOVWF       _flagCMD1+0 
L_DecodificaProtocolo77:
L_DecodificaProtocolo74:
L_DecodificaProtocolo70:
L_DecodificaProtocolo66:
L_DecodificaProtocolo62:
L_DecodificaProtocolo58:
L_DecodificaProtocolo54:
L_DecodificaProtocolo50:
L_DecodificaProtocolo46:
L_DecodificaProtocolo42:
;CISTERNA_main.c,272 :: 		}
L_end_DecodificaProtocolo:
	RETURN      0
; end of _DecodificaProtocolo

_SendComand:

;CISTERNA_main.c,274 :: 		bool_t SendComand(char* Comand,unsigned char* TxtReturn, uint16_t TimeOut)
;CISTERNA_main.c,276 :: 		while(*Comand != 0)
L_SendComand78:
	MOVFF       FARG_SendComand_Comand+0, FSR0L+0
	MOVFF       FARG_SendComand_Comand+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_SendComand79
;CISTERNA_main.c,278 :: 		UART1_Write(*Comand); //Envia Comando RS485
	MOVFF       FARG_SendComand_Comand+0, FSR0L+0
	MOVFF       FARG_SendComand_Comand+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,279 :: 		Comand++;
	INFSNZ      FARG_SendComand_Comand+0, 1 
	INCF        FARG_SendComand_Comand+1, 1 
;CISTERNA_main.c,280 :: 		}
	GOTO        L_SendComand78
L_SendComand79:
;CISTERNA_main.c,286 :: 		return RS485_WaitReturn(TxtReturn, TimeOut);  //Chama função que trata os retornos
	MOVF        FARG_SendComand_TxtReturn+0, 0 
	MOVWF       FARG_RS485_WaitReturn_TxtReturn+0 
	MOVF        FARG_SendComand_TxtReturn+1, 0 
	MOVWF       FARG_RS485_WaitReturn_TxtReturn+1 
	MOVF        FARG_SendComand_TimeOut+0, 0 
	MOVWF       FARG_RS485_WaitReturn_TimeOut+0 
	MOVF        FARG_SendComand_TimeOut+1, 0 
	MOVWF       FARG_RS485_WaitReturn_TimeOut+1 
	CALL        _RS485_WaitReturn+0, 0
;CISTERNA_main.c,287 :: 		}
L_end_SendComand:
	RETURN      0
; end of _SendComand

_RS485_WaitReturn:

;CISTERNA_main.c,289 :: 		bool_t RS485_WaitReturn (unsigned char* TxtReturn, uint16_t TimeOut)
;CISTERNA_main.c,292 :: 		tempo = start_timer(TimeOut);
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
;CISTERNA_main.c,293 :: 		while((_tout == 0) || (!timeout(tempo)))
L_RS485_WaitReturn80:
	MOVLW       0
	XORWF       CISTERNA_main__tout+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn168
	MOVLW       0
	XORWF       CISTERNA_main__tout+0, 0 
L__RS485_WaitReturn168:
	BTFSC       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn159
	MOVF        _ticks+3, 0 
	SUBWF       R5, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn169
	MOVF        _ticks+2, 0 
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn169
	MOVF        _ticks+1, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn169
	MOVF        _ticks+0, 0 
	SUBWF       R2, 0 
L__RS485_WaitReturn169:
	BTFSC       STATUS+0, 0 
	GOTO        L_RS485_WaitReturn82
	MOVLW       1
	MOVWF       R1 
	GOTO        L_RS485_WaitReturn83
L_RS485_WaitReturn82:
	CLRF        R1 
L_RS485_WaitReturn83:
	MOVF        R1, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn159
	GOTO        L_RS485_WaitReturn81
L__RS485_WaitReturn159:
;CISTERNA_main.c,295 :: 		if(*TxtReturn==1) //received return
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+0, FSR0L+0
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_RS485_WaitReturn86
;CISTERNA_main.c,297 :: 		*TxtReturn = 0;
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+0, FSR1L+0
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+1, FSR1H+0
	CLRF        POSTINC1+0 
;CISTERNA_main.c,298 :: 		return TRUE;    // toda a sequência foi varrida: fim.
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_RS485_WaitReturn
;CISTERNA_main.c,299 :: 		}
L_RS485_WaitReturn86:
;CISTERNA_main.c,300 :: 		}
	GOTO        L_RS485_WaitReturn80
L_RS485_WaitReturn81:
;CISTERNA_main.c,301 :: 		return FALSE;
	CLRF        R0 
;CISTERNA_main.c,302 :: 		}
L_end_RS485_WaitReturn:
	RETURN      0
; end of _RS485_WaitReturn

_RS484_Init:

;CISTERNA_main.c,304 :: 		bool_t RS484_Init(unsigned char tmp)
;CISTERNA_main.c,306 :: 		bool_t result = TRUE;
	MOVLW       1
	MOVWF       RS484_Init_result_L0+0 
;CISTERNA_main.c,307 :: 		switch(tmp)
	GOTO        L_RS484_Init87
;CISTERNA_main.c,309 :: 		case 0:
L_RS484_Init89:
;CISTERNA_main.c,310 :: 		result = result & SendComand("[AUT0]",&flagCMD1,20);
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
;CISTERNA_main.c,311 :: 		break;
	GOTO        L_RS484_Init88
;CISTERNA_main.c,312 :: 		case 1:
L_RS484_Init90:
;CISTERNA_main.c,313 :: 		result = result & SendComand("[AUT1]",&flagCMD1,20);
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
;CISTERNA_main.c,314 :: 		break;
	GOTO        L_RS484_Init88
;CISTERNA_main.c,315 :: 		case 2:
L_RS484_Init91:
;CISTERNA_main.c,316 :: 		result = result & SendComand("[V2V0]",&flagCMD2,20);
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
;CISTERNA_main.c,317 :: 		break;
	GOTO        L_RS484_Init88
;CISTERNA_main.c,318 :: 		case 3:
L_RS484_Init92:
;CISTERNA_main.c,319 :: 		result = result & SendComand("[V2V1]",&flagCMD2,20);
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
;CISTERNA_main.c,320 :: 		break;
	GOTO        L_RS484_Init88
;CISTERNA_main.c,321 :: 		}
L_RS484_Init87:
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init89
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init90
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init91
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init92
L_RS484_Init88:
;CISTERNA_main.c,322 :: 		return result;
	MOVF        RS484_Init_result_L0+0, 0 
	MOVWF       R0 
;CISTERNA_main.c,323 :: 		}
L_end_RS484_Init:
	RETURN      0
; end of _RS484_Init

_REEnviarDados:

;CISTERNA_main.c,325 :: 		void REEnviarDados(unsigned char *retData)
;CISTERNA_main.c,327 :: 		UART1_Write('[');       //inicio do protocolo
	MOVLW       91
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,329 :: 		while(*retData != 0)
L_REEnviarDados93:
	MOVFF       FARG_REEnviarDados_retData+0, FSR0L+0
	MOVFF       FARG_REEnviarDados_retData+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_REEnviarDados94
;CISTERNA_main.c,331 :: 		UART1_Write(*retData);   //Conteúdo do protocolo
	MOVFF       FARG_REEnviarDados_retData+0, FSR0L+0
	MOVFF       FARG_REEnviarDados_retData+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,332 :: 		++retData;
	INFSNZ      FARG_REEnviarDados_retData+0, 1 
	INCF        FARG_REEnviarDados_retData+1, 1 
;CISTERNA_main.c,333 :: 		}
	GOTO        L_REEnviarDados93
L_REEnviarDados94:
;CISTERNA_main.c,335 :: 		UART1_Write(']');    //fim do protocolo
	MOVLW       93
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,336 :: 		}
L_end_REEnviarDados:
	RETURN      0
; end of _REEnviarDados

_Timers_Init:

;CISTERNA_main.c,338 :: 		void Timers_Init()
;CISTERNA_main.c,340 :: 		T0CON         = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;CISTERNA_main.c,341 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;CISTERNA_main.c,342 :: 		INTCON2.TMR0IP = 1;
	BSF         INTCON2+0, 2 
;CISTERNA_main.c,343 :: 		TMR0IE_bit         = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;CISTERNA_main.c,344 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;CISTERNA_main.c,345 :: 		TMR0L         = 0xC0; //20 ms
	MOVLW       192
	MOVWF       TMR0L+0 
;CISTERNA_main.c,346 :: 		TMR0ON_bit = 1;
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;CISTERNA_main.c,347 :: 		}
L_end_Timers_Init:
	RETURN      0
; end of _Timers_Init

_PrintScreen:

;CISTERNA_main.c,349 :: 		void PrintScreen(unsigned char current)
;CISTERNA_main.c,351 :: 		switch (current)
	GOTO        L_PrintScreen95
;CISTERNA_main.c,353 :: 		case 0:
L_PrintScreen97:
;CISTERNA_main.c,354 :: 		if(lv_cistRua==0)strcpy(NvCistP.Caption, "Vazia");
	MOVF        _lv_cistRua+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen98
	MOVF        _NvCistP+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistP+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr5_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr5_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen99
L_PrintScreen98:
;CISTERNA_main.c,355 :: 		else strcpy(NvCistP.Caption, "Cheia");
	MOVF        _NvCistP+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistP+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr6_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr6_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen99:
;CISTERNA_main.c,356 :: 		if(lv_cist1==0)strcpy(NvCist1.Caption, "Vazia");
	MOVF        _lv_cist1+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen100
	MOVF        _NvCist1+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist1+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr7_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr7_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen101
L_PrintScreen100:
;CISTERNA_main.c,357 :: 		else strcpy(NvCist1.Caption, "Cheia");
	MOVF        _NvCist1+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist1+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr8_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr8_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen101:
;CISTERNA_main.c,358 :: 		if(lv_cist2==0)strcpy(NvCist2.Caption, "Vazia");
	MOVF        _lv_cist2+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen102
	MOVF        _NvCist2+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist2+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr9_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr9_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen103
L_PrintScreen102:
;CISTERNA_main.c,359 :: 		else strcpy(NvCist2.Caption, "Cheia");
	MOVF        _NvCist2+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist2+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr10_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr10_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen103:
;CISTERNA_main.c,360 :: 		if(lv_cxRua==0)strcpy(NvCistR.Caption, "Vazia");
	MOVF        _lv_cxRua+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen104
	MOVF        _NvCistR+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistR+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr11_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr11_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen105
L_PrintScreen104:
;CISTERNA_main.c,361 :: 		else strcpy(NvCistR.Caption, "Cheia");
	MOVF        _NvCistR+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistR+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr12_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr12_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen105:
;CISTERNA_main.c,362 :: 		if(lv_cxRua2==0)strcpy(NvCxRua02.Caption, "Vazia");
	MOVF        _lv_cxRua2+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen106
	MOVF        _NvCxRua02+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCxRua02+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr13_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr13_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen107
L_PrintScreen106:
;CISTERNA_main.c,363 :: 		else strcpy(NvCxRua02.Caption, "Cheia");
	MOVF        _NvCxRua02+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCxRua02+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr14_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr14_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen107:
;CISTERNA_main.c,364 :: 		DrawScreen(&Tela_Inicial);
	MOVLW       _Tela_Inicial+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_main.c,365 :: 		break;
	GOTO        L_PrintScreen96
;CISTERNA_main.c,366 :: 		case 1:
L_PrintScreen108:
;CISTERNA_main.c,367 :: 		if(RT_pump_rua==0)strcpy(RT_BP.Caption, "Normal");
	MOVF        _RT_pump_rua+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen109
	MOVF        _RT_BP+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _RT_BP+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr15_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr15_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen110
L_PrintScreen109:
;CISTERNA_main.c,368 :: 		else strcpy(RT_BP.Caption, "Alarm");
	MOVF        _RT_BP+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _RT_BP+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr16_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr16_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen110:
;CISTERNA_main.c,369 :: 		if(RT_pump_cist==0)strcpy(Rt_BCist.Caption, "Normal");
	MOVF        _RT_pump_cist+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen111
	MOVF        _Rt_BCist+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _Rt_BCist+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr17_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr17_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen112
L_PrintScreen111:
;CISTERNA_main.c,370 :: 		else strcpy(Rt_BCist.Caption, "Alarm");
	MOVF        _Rt_BCist+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _Rt_BCist+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr18_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr18_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen112:
;CISTERNA_main.c,371 :: 		if(tmpAut==0)strcpy(ManText.Caption, "Man");
	MOVF        _tmpAut+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen113
	MOVF        _ManText+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _ManText+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr19_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr19_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen114
L_PrintScreen113:
;CISTERNA_main.c,372 :: 		else strcpy(ManText.Caption, "Aut");
	MOVF        _ManText+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _ManText+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr20_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr20_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen114:
;CISTERNA_main.c,373 :: 		if(tmpV2V==0)strcpy(V2VTxt.Caption, "Off");
	MOVF        _tmpV2V+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen115
	MOVF        _V2VTxt+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _V2VTxt+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr21_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr21_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen116
L_PrintScreen115:
;CISTERNA_main.c,374 :: 		else strcpy(V2VTxt.Caption, "On");
	MOVF        _V2VTxt+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _V2VTxt+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr22_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr22_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen116:
;CISTERNA_main.c,375 :: 		if(statusV2V==0)strcpy(StatV2V.Caption, "Off");
	MOVF        _statusV2V+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen117
	MOVF        _StatV2V+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _StatV2V+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr23_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr23_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen118
L_PrintScreen117:
;CISTERNA_main.c,376 :: 		else strcpy(StatV2V.Caption, "On");
	MOVF        _StatV2V+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _StatV2V+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr24_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr24_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen118:
;CISTERNA_main.c,377 :: 		DrawScreen(&Misc1);
	MOVLW       _Misc1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Misc1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_main.c,378 :: 		break;
	GOTO        L_PrintScreen96
;CISTERNA_main.c,379 :: 		}
L_PrintScreen95:
	MOVF        FARG_PrintScreen_current+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_PrintScreen97
	MOVF        FARG_PrintScreen_current+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_PrintScreen108
L_PrintScreen96:
;CISTERNA_main.c,380 :: 		}
L_end_PrintScreen:
	RETURN      0
; end of _PrintScreen

_SetModeChgVar:

;CISTERNA_main.c,382 :: 		void SetModeChgVar(unsigned char position)
;CISTERNA_main.c,384 :: 		if(position==1)//man aut mode
	MOVF        FARG_SetModeChgVar_position+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar119
;CISTERNA_main.c,386 :: 		tmpAut ^= 1; //toggle tmpAut
	MOVLW       1
	XORWF       _tmpAut+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       _tmpAut+0 
;CISTERNA_main.c,387 :: 		ctrl_msg = (tmpAut==0)?0:1;
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar120
	CLRF        ?FLOC___SetModeChgVarT241+0 
	GOTO        L_SetModeChgVar121
L_SetModeChgVar120:
	MOVLW       1
	MOVWF       ?FLOC___SetModeChgVarT241+0 
L_SetModeChgVar121:
	MOVF        ?FLOC___SetModeChgVarT241+0, 0 
	MOVWF       _ctrl_msg+0 
;CISTERNA_main.c,388 :: 		}
L_SetModeChgVar119:
;CISTERNA_main.c,389 :: 		if(position==2) //on v2v
	MOVF        FARG_SetModeChgVar_position+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar122
;CISTERNA_main.c,391 :: 		tmpV2V ^= 1; //toggle tmpAut
	MOVLW       1
	XORWF       _tmpV2V+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       _tmpV2V+0 
;CISTERNA_main.c,393 :: 		ctrl_msg = (tmpV2V==0)?2:3;
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar123
	MOVLW       2
	MOVWF       ?FLOC___SetModeChgVarT245+0 
	GOTO        L_SetModeChgVar124
L_SetModeChgVar123:
	MOVLW       3
	MOVWF       ?FLOC___SetModeChgVarT245+0 
L_SetModeChgVar124:
	MOVF        ?FLOC___SetModeChgVarT245+0, 0 
	MOVWF       _ctrl_msg+0 
;CISTERNA_main.c,394 :: 		}
L_SetModeChgVar122:
;CISTERNA_main.c,395 :: 		if(tmpAut!=tmpBtn0 || tmpV2V!=tmpBtn1) //comparativo para enviar msg
	MOVF        _tmpAut+0, 0 
	XORWF       _tmpBtn0+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SetModeChgVar160
	MOVF        _tmpV2V+0, 0 
	XORWF       _tmpBtn1+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SetModeChgVar160
	GOTO        L_SetModeChgVar127
L__SetModeChgVar160:
;CISTERNA_main.c,397 :: 		while(!RS484_Init(ctrl_msg))
L_SetModeChgVar128:
	MOVF        _ctrl_msg+0, 0 
	MOVWF       FARG_RS484_Init_tmp+0 
	CALL        _RS484_Init+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar129
;CISTERNA_main.c,399 :: 		PORTA.RA2 ^= 1;        //Enquanto o módulo não receber cofirmação de recebimento de cmd
	BTG         PORTA+0, 2 
;CISTERNA_main.c,400 :: 		Delay_ms(500);         //Retorna 1 se retorno ocorrer com sucesso.
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_SetModeChgVar130:
	DECFSZ      R13, 1, 1
	BRA         L_SetModeChgVar130
	DECFSZ      R12, 1, 1
	BRA         L_SetModeChgVar130
	DECFSZ      R11, 1, 1
	BRA         L_SetModeChgVar130
	NOP
;CISTERNA_main.c,402 :: 		}
	GOTO        L_SetModeChgVar128
L_SetModeChgVar129:
;CISTERNA_main.c,404 :: 		if(tmpAut==0)strcpy(ManText.Caption, "Man");
	MOVF        _tmpAut+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar131
	MOVF        _ManText+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _ManText+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr25_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr25_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_SetModeChgVar132
L_SetModeChgVar131:
;CISTERNA_main.c,405 :: 		else strcpy(ManText.Caption, "Aut");
	MOVF        _ManText+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _ManText+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr26_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr26_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_SetModeChgVar132:
;CISTERNA_main.c,406 :: 		if(tmpV2V==0)strcpy(V2VTxt.Caption, "Off");
	MOVF        _tmpV2V+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SetModeChgVar133
	MOVF        _V2VTxt+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _V2VTxt+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr27_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr27_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_SetModeChgVar134
L_SetModeChgVar133:
;CISTERNA_main.c,407 :: 		else strcpy(V2VTxt.Caption, "On");
	MOVF        _V2VTxt+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _V2VTxt+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr28_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr28_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_SetModeChgVar134:
;CISTERNA_main.c,408 :: 		}
L_SetModeChgVar127:
;CISTERNA_main.c,409 :: 		tmpBtn0=tmpAut;   //confirma comparativo
	MOVF        _tmpAut+0, 0 
	MOVWF       _tmpBtn0+0 
;CISTERNA_main.c,410 :: 		tmpBtn1=tmpV2V;   //confirma comparativo
	MOVF        _tmpV2V+0, 0 
	MOVWF       _tmpBtn1+0 
;CISTERNA_main.c,411 :: 		PORTA.RA2= 0; //desliga led
	BCF         PORTA+0, 2 
;CISTERNA_main.c,412 :: 		}
L_end_SetModeChgVar:
	RETURN      0
; end of _SetModeChgVar

_set_alarm:

;CISTERNA_main.c,414 :: 		void set_alarm()
;CISTERNA_main.c,416 :: 		if(flagAlarm)
	BTFSS       _flagAlarm+0, BitPos(_flagAlarm+0) 
	GOTO        L_set_alarm135
;CISTERNA_main.c,418 :: 		if(!timeout(tempoBuzzer))return;
	MOVF        _ticks+3, 0 
	SUBWF       _tempoBuzzer+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__set_alarm176
	MOVF        _ticks+2, 0 
	SUBWF       _tempoBuzzer+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__set_alarm176
	MOVF        _ticks+1, 0 
	SUBWF       _tempoBuzzer+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__set_alarm176
	MOVF        _ticks+0, 0 
	SUBWF       _tempoBuzzer+0, 0 
L__set_alarm176:
	BTFSC       STATUS+0, 0 
	GOTO        L_set_alarm136
	MOVLW       1
	MOVWF       ?FLOC___set_alarmT263+0 
	GOTO        L_set_alarm137
L_set_alarm136:
	CLRF        ?FLOC___set_alarmT263+0 
L_set_alarm137:
	MOVF        ?FLOC___set_alarmT263+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_set_alarm138
	GOTO        L_end_set_alarm
L_set_alarm138:
;CISTERNA_main.c,419 :: 		if(flagBuzzer)
	BTFSS       _flagBuzzer+0, BitPos(_flagBuzzer+0) 
	GOTO        L_set_alarm139
;CISTERNA_main.c,420 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
	GOTO        L_set_alarm140
L_set_alarm139:
;CISTERNA_main.c,422 :: 		reset_alarm();
	CALL        _reset_alarm+0, 0
L_set_alarm140:
;CISTERNA_main.c,423 :: 		flagBuzzer^=1;
	BTG         _flagBuzzer+0, BitPos(_flagBuzzer+0) 
;CISTERNA_main.c,424 :: 		tempoBuzzer=start_timer(100);
	MOVLW       100
	ADDWF       _ticks+0, 0 
	MOVWF       _tempoBuzzer+0 
	MOVLW       0
	ADDWFC      _ticks+1, 0 
	MOVWF       _tempoBuzzer+1 
	MOVLW       0
	ADDWFC      _ticks+2, 0 
	MOVWF       _tempoBuzzer+2 
	MOVLW       0
	ADDWFC      _ticks+3, 0 
	MOVWF       _tempoBuzzer+3 
;CISTERNA_main.c,425 :: 		}
	GOTO        L_set_alarm141
L_set_alarm135:
;CISTERNA_main.c,427 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
L_set_alarm141:
;CISTERNA_main.c,428 :: 		}
L_end_set_alarm:
	RETURN      0
; end of _set_alarm

_reset_alarm:

;CISTERNA_main.c,430 :: 		void reset_alarm()
;CISTERNA_main.c,432 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;CISTERNA_main.c,433 :: 		}
L_end_reset_alarm:
	RETURN      0
; end of _reset_alarm

_mute_alarm_off:

;CISTERNA_main.c,435 :: 		void mute_alarm_off()
;CISTERNA_main.c,437 :: 		flagAlarm=1;
	BSF         _flagAlarm+0, BitPos(_flagAlarm+0) 
;CISTERNA_main.c,438 :: 		}
L_end_mute_alarm_off:
	RETURN      0
; end of _mute_alarm_off
