
_UART_RCV:

;CISTERNA_main.c,86 :: 		void UART_RCV() iv 0x0008 ics ICS_AUTO
;CISTERNA_main.c,89 :: 		if(TMR0IF_bit == 1 && TMR0IE_bit == 1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_UART_RCV2
	BTFSS       TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
	GOTO        L_UART_RCV2
L__UART_RCV109:
;CISTERNA_main.c,91 :: 		++ticks;
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
;CISTERNA_main.c,92 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;CISTERNA_main.c,93 :: 		TMR0L         = 0xC0; //20 ms
	MOVLW       192
	MOVWF       TMR0L+0 
;CISTERNA_main.c,94 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;CISTERNA_main.c,95 :: 		}
	GOTO        L_UART_RCV3
L_UART_RCV2:
;CISTERNA_main.c,97 :: 		if(PIR1.RC1IF == 1 && PIE1.RC1IE == 1)
	BTFSS       PIR1+0, 5 
	GOTO        L_UART_RCV6
	BTFSS       PIE1+0, 5 
	GOTO        L_UART_RCV6
L__UART_RCV108:
;CISTERNA_main.c,99 :: 		sdata = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       UART_RCV_sdata_L0+0 
;CISTERNA_main.c,100 :: 		if(sdata == '[')     //Ex: [V2V01] - [AUT]
	MOVF        R0, 0 
	XORLW       91
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV7
;CISTERNA_main.c,102 :: 		Pot = Dta;       //Salva o endereço da matriz no ponteiro
	MOVLW       _Dta+0
	MOVWF       _Pot+0 
	MOVLW       hi_addr(_Dta+0)
	MOVWF       _Pot+1 
;CISTERNA_main.c,103 :: 		_Aux = 1;        //Flag que informa o início do protocolo
	MOVLW       1
	MOVWF       __Aux+0 
;CISTERNA_main.c,104 :: 		}
	GOTO        L_UART_RCV8
L_UART_RCV7:
;CISTERNA_main.c,106 :: 		if(sdata == ']' && _Aux == 1)
	MOVF        UART_RCV_sdata_L0+0, 0 
	XORLW       93
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV11
	MOVF        __Aux+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV11
L__UART_RCV107:
;CISTERNA_main.c,108 :: 		_Aux = 0;
	CLRF        __Aux+0 
;CISTERNA_main.c,111 :: 		DecodificaProtocolo();
	CALL        _DecodificaProtocolo+0, 0
;CISTERNA_main.c,112 :: 		}
	GOTO        L_UART_RCV12
L_UART_RCV11:
;CISTERNA_main.c,114 :: 		if (_Aux == 1)
	MOVF        __Aux+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV13
;CISTERNA_main.c,116 :: 		*Pot = sdata;
	MOVFF       _Pot+0, FSR1L+0
	MOVFF       _Pot+1, FSR1H+0
	MOVF        UART_RCV_sdata_L0+0, 0 
	MOVWF       POSTINC1+0 
;CISTERNA_main.c,117 :: 		++Pot;
	INFSNZ      _Pot+0, 1 
	INCF        _Pot+1, 1 
;CISTERNA_main.c,119 :: 		}
L_UART_RCV13:
L_UART_RCV12:
L_UART_RCV8:
;CISTERNA_main.c,120 :: 		PIR1.RC1IF = 0;
	BCF         PIR1+0, 5 
;CISTERNA_main.c,121 :: 		}
L_UART_RCV6:
L_UART_RCV3:
;CISTERNA_main.c,122 :: 		}
L_end_UART_RCV:
L__UART_RCV124:
	RETFIE      1
; end of _UART_RCV

_main:

;CISTERNA_main.c,126 :: 		void main() {
;CISTERNA_main.c,127 :: 		Start_TP();
	CALL        _Start_TP+0, 0
;CISTERNA_main.c,128 :: 		Init_cfgMCU();
	CALL        _Init_cfgMCU+0, 0
;CISTERNA_main.c,129 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       3
	MOVWF       SPBRGH+0 
	MOVLW       64
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;CISTERNA_main.c,130 :: 		Delay_ms(100);
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
;CISTERNA_main.c,132 :: 		INTCON.GIEH = 1;
	BSF         INTCON+0, 7 
;CISTERNA_main.c,133 :: 		INTCON.GIEL = 1;
	BSF         INTCON+0, 6 
;CISTERNA_main.c,134 :: 		RCON.IPEN = 1;
	BSF         RCON+0, 7 
;CISTERNA_main.c,137 :: 		PIR1.RC1IF = 0;
	BCF         PIR1+0, 5 
;CISTERNA_main.c,138 :: 		IPR1.RC1IP = 1;
	BSF         IPR1+0, 5 
;CISTERNA_main.c,139 :: 		PIE1.RC1IE = 1;
	BSF         PIE1+0, 5 
;CISTERNA_main.c,142 :: 		Delay_ms(500);
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
;CISTERNA_main.c,143 :: 		Timers_Init();
	CALL        _Timers_Init+0, 0
;CISTERNA_main.c,144 :: 		tempoLed = start_timer(2);
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
;CISTERNA_main.c,145 :: 		tempoSmsg = start_timer(20);
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
;CISTERNA_main.c,147 :: 		tmpBtn0 = 1;
	MOVLW       1
	MOVWF       _tmpBtn0+0 
;CISTERNA_main.c,148 :: 		tmpAut = 1;//modo automatico
	MOVLW       1
	MOVWF       _tmpAut+0 
;CISTERNA_main.c,149 :: 		tmpBtn1 = 0;
	CLRF        _tmpBtn1+0 
;CISTERNA_main.c,150 :: 		tmpV2V = 0;//condição inicial fechada
	CLRF        _tmpV2V+0 
;CISTERNA_main.c,154 :: 		while(TRUE)
L_main16:
;CISTERNA_main.c,156 :: 		Delay_ms(10);
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
;CISTERNA_main.c,158 :: 		if(BTN_MANAUT)//RA5
	MOVLW       PORTA+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       50
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main19
;CISTERNA_main.c,160 :: 		tmpAut ^= 1; //toggle tmpAut
	MOVLW       1
	XORWF       _tmpAut+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       _tmpAut+0 
;CISTERNA_main.c,161 :: 		ctrl_msg = (tmpAut==0)?0:1;
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
	CLRF        ?FLOC___mainT35+0 
	GOTO        L_main21
L_main20:
	MOVLW       1
	MOVWF       ?FLOC___mainT35+0 
L_main21:
	MOVF        ?FLOC___mainT35+0, 0 
	MOVWF       _ctrl_msg+0 
;CISTERNA_main.c,162 :: 		}
L_main19:
;CISTERNA_main.c,163 :: 		if(BTN_V2V) //RA6
	MOVLW       PORTC+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       50
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main22
;CISTERNA_main.c,165 :: 		tmpV2V ^= 1; //toggle tmpAut
	MOVLW       1
	XORWF       _tmpV2V+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       _tmpV2V+0 
;CISTERNA_main.c,167 :: 		ctrl_msg = (tmpV2V==0)?2:3;
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
	MOVLW       2
	MOVWF       ?FLOC___mainT39+0 
	GOTO        L_main24
L_main23:
	MOVLW       3
	MOVWF       ?FLOC___mainT39+0 
L_main24:
	MOVF        ?FLOC___mainT39+0, 0 
	MOVWF       _ctrl_msg+0 
;CISTERNA_main.c,168 :: 		}
L_main22:
;CISTERNA_main.c,169 :: 		if(tmpAut!=tmpBtn0 || tmpV2V!=tmpBtn1) //comparativo para enviar msg
	MOVF        _tmpAut+0, 0 
	XORWF       _tmpBtn0+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main111
	MOVF        _tmpV2V+0, 0 
	XORWF       _tmpBtn1+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main111
	GOTO        L_main27
L__main111:
;CISTERNA_main.c,171 :: 		while(!RS484_Init(ctrl_msg))
L_main28:
	MOVF        _ctrl_msg+0, 0 
	MOVWF       FARG_RS484_Init_tmp+0 
	CALL        _RS484_Init+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main29
;CISTERNA_main.c,173 :: 		PORTA.RA2 ^= 1;        //Enquanto o módulo não receber cofirmação de recebimento de cmd
	BTG         PORTA+0, 2 
;CISTERNA_main.c,174 :: 		Delay_ms(500);         //Retorna 1 se retorno ocorrer com sucesso.
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main30:
	DECFSZ      R13, 1, 1
	BRA         L_main30
	DECFSZ      R12, 1, 1
	BRA         L_main30
	DECFSZ      R11, 1, 1
	BRA         L_main30
	NOP
;CISTERNA_main.c,176 :: 		}
	GOTO        L_main28
L_main29:
;CISTERNA_main.c,177 :: 		}
L_main27:
;CISTERNA_main.c,178 :: 		tmpBtn0=tmpAut;   //confirma comparativo
	MOVF        _tmpAut+0, 0 
	MOVWF       _tmpBtn0+0 
;CISTERNA_main.c,179 :: 		tmpBtn1=tmpV2V;   //confirma comparativo
	MOVF        _tmpV2V+0, 0 
	MOVWF       _tmpBtn1+0 
;CISTERNA_main.c,180 :: 		PORTA.RA2= 0; //desliga led
	BCF         PORTA+0, 2 
;CISTERNA_main.c,183 :: 		if(tmp_glcd.tmp_lv_cist1!=lv_cist1 || tmp_glcd.tmp_lv_cist2!=lv_cist2 || tmp_glcd.tmp_lv_cistRua != lv_cistRua ||
	MOVF        _tmp_glcd+0, 0 
	XORWF       _lv_cist1+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main110
	MOVF        _tmp_glcd+1, 0 
	XORWF       _lv_cist2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main110
	MOVF        _tmp_glcd+2, 0 
	XORWF       _lv_cistRua+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main110
;CISTERNA_main.c,184 :: 		tmp_glcd.tmp_RT_pump_rua != RT_pump_rua || tmp_glcd.tmp_RT_pump_cist != RT_pump_cist || tmp_glcd.tmp_lv_Rua != lv_cxRua)
	MOVF        _tmp_glcd+4, 0 
	XORWF       _RT_pump_rua+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main110
	MOVF        _tmp_glcd+3, 0 
	XORWF       _RT_pump_cist+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main110
	MOVF        _tmp_glcd+5, 0 
	XORWF       _lv_cxRua+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main110
	GOTO        L_main33
L__main110:
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
;CISTERNA_main.c,194 :: 		}
L_main33:
;CISTERNA_main.c,195 :: 		if(BTN_INCR)
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
	GOTO        L_main34
;CISTERNA_main.c,197 :: 		++curr_screen;
	INCF        _curr_screen+0, 1 
;CISTERNA_main.c,198 :: 		if(curr_screen>2)curr_screen=0;
	MOVF        _curr_screen+0, 0 
	SUBLW       2
	BTFSC       STATUS+0, 0 
	GOTO        L_main35
	CLRF        _curr_screen+0 
L_main35:
;CISTERNA_main.c,199 :: 		PrintScreen(curr_screen);
	MOVF        _curr_screen+0, 0 
	MOVWF       FARG_PrintScreen_current+0 
	CALL        _PrintScreen+0, 0
;CISTERNA_main.c,200 :: 		}
L_main34:
;CISTERNA_main.c,201 :: 		}
	GOTO        L_main16
;CISTERNA_main.c,202 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Init_cfgMCU:

;CISTERNA_main.c,204 :: 		void Init_cfgMCU()
;CISTERNA_main.c,206 :: 		ANSELD = 0;      //PORTD como I/O digital
	CLRF        ANSELD+0 
;CISTERNA_main.c,207 :: 		TRISA.TRISA2 = 0; //output
	BCF         TRISA+0, 2 
;CISTERNA_main.c,208 :: 		TRISA.TRISA3 = 1; //enter button
	BSF         TRISA+0, 3 
;CISTERNA_main.c,209 :: 		TRISA.TRISA4 = 1; //increase button
	BSF         TRISA+0, 4 
;CISTERNA_main.c,210 :: 		TRISA.TRISA5 = 1; //botao manual automatico (input)
	BSF         TRISA+0, 5 
;CISTERNA_main.c,211 :: 		TRISA.TRISA6 = 1; //botao liga valvula (input)
	BSF         TRISA+0, 6 
;CISTERNA_main.c,214 :: 		PORTA.RA2 = 0;
	BCF         PORTA+0, 2 
;CISTERNA_main.c,215 :: 		TRISC.TRISC0 = 1;
	BSF         TRISC+0, 0 
;CISTERNA_main.c,216 :: 		}
L_end_Init_cfgMCU:
	RETURN      0
; end of _Init_cfgMCU

_DecodificaProtocolo:

;CISTERNA_main.c,218 :: 		void DecodificaProtocolo()
;CISTERNA_main.c,221 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '0')lv_cist1=(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo38
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo38
	MOVF        _Dta+2, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo38
L__DecodificaProtocolo121:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cist1+0 
	GOTO        L_DecodificaProtocolo39
L_DecodificaProtocolo38:
;CISTERNA_main.c,223 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '1')lv_cist2=(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo42
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo42
	MOVF        _Dta+2, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo42
L__DecodificaProtocolo120:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cist2+0 
	GOTO        L_DecodificaProtocolo43
L_DecodificaProtocolo42:
;CISTERNA_main.c,225 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '2')lv_cistRua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo46
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo46
	MOVF        _Dta+2, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo46
L__DecodificaProtocolo119:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cistRua+0 
	GOTO        L_DecodificaProtocolo47
L_DecodificaProtocolo46:
;CISTERNA_main.c,227 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '3')lv_cxRua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo50
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo50
	MOVF        _Dta+2, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo50
L__DecodificaProtocolo118:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cxRua+0 
	GOTO        L_DecodificaProtocolo51
L_DecodificaProtocolo50:
;CISTERNA_main.c,229 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '4')RT_pump_cist =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo54
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo54
	MOVF        _Dta+2, 0 
	XORLW       52
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo54
L__DecodificaProtocolo117:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _RT_pump_cist+0 
	GOTO        L_DecodificaProtocolo55
L_DecodificaProtocolo54:
;CISTERNA_main.c,231 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '5')RT_pump_rua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo58
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo58
	MOVF        _Dta+2, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo58
L__DecodificaProtocolo116:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _RT_pump_rua+0 
	GOTO        L_DecodificaProtocolo59
L_DecodificaProtocolo58:
;CISTERNA_main.c,233 :: 		if(Dta[0] == 'V' && Dta[1] == '2' && Dta[2] == 'V')V2V_On =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       86
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo62
	MOVF        _Dta+1, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo62
	MOVF        _Dta+2, 0 
	XORLW       86
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo62
L__DecodificaProtocolo115:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _V2V_On+0 
	GOTO        L_DecodificaProtocolo63
L_DecodificaProtocolo62:
;CISTERNA_main.c,235 :: 		if(Dta[0] == 'A' && Dta[1] == 'U' && Dta[2] == 'T')MAN_AUT =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo66
	MOVF        _Dta+1, 0 
	XORLW       85
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo66
	MOVF        _Dta+2, 0 
	XORLW       84
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo66
L__DecodificaProtocolo114:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _MAN_AUT+0 
	GOTO        L_DecodificaProtocolo67
L_DecodificaProtocolo66:
;CISTERNA_main.c,237 :: 		if(Dta[0] == 'C' && Dta[1] == '1' && Dta[2] == 'O' && Dta[3] == 'K')flagCMD2=1;
	MOVF        _Dta+0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo70
	MOVF        _Dta+1, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo70
	MOVF        _Dta+2, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo70
	MOVF        _Dta+3, 0 
	XORLW       75
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo70
L__DecodificaProtocolo113:
	MOVLW       1
	MOVWF       _flagCMD2+0 
	GOTO        L_DecodificaProtocolo71
L_DecodificaProtocolo70:
;CISTERNA_main.c,239 :: 		if(Dta[0] == 'C' && Dta[1] == '2' && Dta[2] == 'O' && Dta[3] == 'K')flagCMD1=1;//Todo valor (0 a 9) ASCII pode ser convertido para número subtraindo por '0'
	MOVF        _Dta+0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo74
	MOVF        _Dta+1, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo74
	MOVF        _Dta+2, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo74
	MOVF        _Dta+3, 0 
	XORLW       75
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo74
L__DecodificaProtocolo112:
	MOVLW       1
	MOVWF       _flagCMD1+0 
L_DecodificaProtocolo74:
L_DecodificaProtocolo71:
L_DecodificaProtocolo67:
L_DecodificaProtocolo63:
L_DecodificaProtocolo59:
L_DecodificaProtocolo55:
L_DecodificaProtocolo51:
L_DecodificaProtocolo47:
L_DecodificaProtocolo43:
L_DecodificaProtocolo39:
;CISTERNA_main.c,240 :: 		}
L_end_DecodificaProtocolo:
	RETURN      0
; end of _DecodificaProtocolo

_SendComand:

;CISTERNA_main.c,242 :: 		bool_t SendComand(char* Comand,unsigned char* TxtReturn, uint16_t TimeOut)
;CISTERNA_main.c,244 :: 		while(*Comand != 0)
L_SendComand75:
	MOVFF       FARG_SendComand_Comand+0, FSR0L+0
	MOVFF       FARG_SendComand_Comand+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_SendComand76
;CISTERNA_main.c,246 :: 		UART1_Write(*Comand); //Envia Comando RS485
	MOVFF       FARG_SendComand_Comand+0, FSR0L+0
	MOVFF       FARG_SendComand_Comand+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,247 :: 		Comand++;
	INFSNZ      FARG_SendComand_Comand+0, 1 
	INCF        FARG_SendComand_Comand+1, 1 
;CISTERNA_main.c,248 :: 		}
	GOTO        L_SendComand75
L_SendComand76:
;CISTERNA_main.c,254 :: 		return RS485_WaitReturn(TxtReturn, TimeOut);  //Chama função que trata os retornos
	MOVF        FARG_SendComand_TxtReturn+0, 0 
	MOVWF       FARG_RS485_WaitReturn_TxtReturn+0 
	MOVF        FARG_SendComand_TxtReturn+1, 0 
	MOVWF       FARG_RS485_WaitReturn_TxtReturn+1 
	MOVF        FARG_SendComand_TimeOut+0, 0 
	MOVWF       FARG_RS485_WaitReturn_TimeOut+0 
	MOVF        FARG_SendComand_TimeOut+1, 0 
	MOVWF       FARG_RS485_WaitReturn_TimeOut+1 
	CALL        _RS485_WaitReturn+0, 0
;CISTERNA_main.c,255 :: 		}
L_end_SendComand:
	RETURN      0
; end of _SendComand

_RS485_WaitReturn:

;CISTERNA_main.c,257 :: 		bool_t RS485_WaitReturn (unsigned char* TxtReturn, uint16_t TimeOut)
;CISTERNA_main.c,260 :: 		tempo = start_timer(TimeOut);
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
;CISTERNA_main.c,261 :: 		while((_tout == 0) || (!timeout(tempo)))
L_RS485_WaitReturn77:
	MOVLW       0
	XORWF       CISTERNA_main__tout+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn130
	MOVLW       0
	XORWF       CISTERNA_main__tout+0, 0 
L__RS485_WaitReturn130:
	BTFSC       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn122
	MOVF        _ticks+3, 0 
	SUBWF       R5, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn131
	MOVF        _ticks+2, 0 
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn131
	MOVF        _ticks+1, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn131
	MOVF        _ticks+0, 0 
	SUBWF       R2, 0 
L__RS485_WaitReturn131:
	BTFSC       STATUS+0, 0 
	GOTO        L_RS485_WaitReturn79
	MOVLW       1
	MOVWF       R1 
	GOTO        L_RS485_WaitReturn80
L_RS485_WaitReturn79:
	CLRF        R1 
L_RS485_WaitReturn80:
	MOVF        R1, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn122
	GOTO        L_RS485_WaitReturn78
L__RS485_WaitReturn122:
;CISTERNA_main.c,263 :: 		if(*TxtReturn==1) //received return
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+0, FSR0L+0
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_RS485_WaitReturn83
;CISTERNA_main.c,265 :: 		*TxtReturn = 0;
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+0, FSR1L+0
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+1, FSR1H+0
	CLRF        POSTINC1+0 
;CISTERNA_main.c,266 :: 		return TRUE;    // toda a sequência foi varrida: fim.
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_RS485_WaitReturn
;CISTERNA_main.c,267 :: 		}
L_RS485_WaitReturn83:
;CISTERNA_main.c,268 :: 		}
	GOTO        L_RS485_WaitReturn77
L_RS485_WaitReturn78:
;CISTERNA_main.c,269 :: 		return FALSE;
	CLRF        R0 
;CISTERNA_main.c,270 :: 		}
L_end_RS485_WaitReturn:
	RETURN      0
; end of _RS485_WaitReturn

_RS484_Init:

;CISTERNA_main.c,272 :: 		bool_t RS484_Init(unsigned char tmp)
;CISTERNA_main.c,274 :: 		bool_t result = TRUE;
	MOVLW       1
	MOVWF       RS484_Init_result_L0+0 
;CISTERNA_main.c,275 :: 		switch(tmp)
	GOTO        L_RS484_Init84
;CISTERNA_main.c,277 :: 		case 0:
L_RS484_Init86:
;CISTERNA_main.c,278 :: 		result = result & SendComand("[AUT0]",&flagCMD1,20);
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
;CISTERNA_main.c,279 :: 		break;
	GOTO        L_RS484_Init85
;CISTERNA_main.c,280 :: 		case 1:
L_RS484_Init87:
;CISTERNA_main.c,281 :: 		result = result & SendComand("[AUT1]",&flagCMD1,20);
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
;CISTERNA_main.c,282 :: 		break;
	GOTO        L_RS484_Init85
;CISTERNA_main.c,283 :: 		case 2:
L_RS484_Init88:
;CISTERNA_main.c,284 :: 		result = result & SendComand("[V2V0]",&flagCMD2,20);
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
;CISTERNA_main.c,285 :: 		break;
	GOTO        L_RS484_Init85
;CISTERNA_main.c,286 :: 		case 3:
L_RS484_Init89:
;CISTERNA_main.c,287 :: 		result = result & SendComand("[V2V1]",&flagCMD2,20);
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
;CISTERNA_main.c,288 :: 		break;
	GOTO        L_RS484_Init85
;CISTERNA_main.c,289 :: 		}
L_RS484_Init84:
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init86
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init87
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init88
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init89
L_RS484_Init85:
;CISTERNA_main.c,290 :: 		return result;
	MOVF        RS484_Init_result_L0+0, 0 
	MOVWF       R0 
;CISTERNA_main.c,291 :: 		}
L_end_RS484_Init:
	RETURN      0
; end of _RS484_Init

_REEnviarDados:

;CISTERNA_main.c,293 :: 		void REEnviarDados(unsigned char *retData)
;CISTERNA_main.c,295 :: 		UART1_Write('[');       //inicio do protocolo
	MOVLW       91
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,297 :: 		while(*retData != 0)
L_REEnviarDados90:
	MOVFF       FARG_REEnviarDados_retData+0, FSR0L+0
	MOVFF       FARG_REEnviarDados_retData+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_REEnviarDados91
;CISTERNA_main.c,299 :: 		UART1_Write(*retData);   //Conteúdo do protocolo
	MOVFF       FARG_REEnviarDados_retData+0, FSR0L+0
	MOVFF       FARG_REEnviarDados_retData+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,300 :: 		++retData;
	INFSNZ      FARG_REEnviarDados_retData+0, 1 
	INCF        FARG_REEnviarDados_retData+1, 1 
;CISTERNA_main.c,301 :: 		}
	GOTO        L_REEnviarDados90
L_REEnviarDados91:
;CISTERNA_main.c,303 :: 		UART1_Write(']');    //fim do protocolo
	MOVLW       93
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,304 :: 		}
L_end_REEnviarDados:
	RETURN      0
; end of _REEnviarDados

_Timers_Init:

;CISTERNA_main.c,306 :: 		void Timers_Init()
;CISTERNA_main.c,308 :: 		T0CON         = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;CISTERNA_main.c,309 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;CISTERNA_main.c,310 :: 		INTCON2.TMR0IP = 1;
	BSF         INTCON2+0, 2 
;CISTERNA_main.c,311 :: 		TMR0IE_bit         = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;CISTERNA_main.c,312 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;CISTERNA_main.c,313 :: 		TMR0L         = 0xC0; //20 ms
	MOVLW       192
	MOVWF       TMR0L+0 
;CISTERNA_main.c,314 :: 		TMR0ON_bit = 1;
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;CISTERNA_main.c,315 :: 		}
L_end_Timers_Init:
	RETURN      0
; end of _Timers_Init

_PrintScreen:

;CISTERNA_main.c,317 :: 		void PrintScreen(unsigned char current)
;CISTERNA_main.c,319 :: 		switch (current)
	GOTO        L_PrintScreen92
;CISTERNA_main.c,321 :: 		case 0:
L_PrintScreen94:
;CISTERNA_main.c,322 :: 		if(lv_cistRua==0)strcpy(NvCistP.Caption, "Vazia");
	MOVF        _lv_cistRua+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen95
	MOVF        _NvCistP+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistP+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr5_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr5_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen96
L_PrintScreen95:
;CISTERNA_main.c,323 :: 		else strcpy(NvCistP.Caption, "Cheia");
	MOVF        _NvCistP+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistP+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr6_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr6_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen96:
;CISTERNA_main.c,324 :: 		if(lv_cist1==0)strcpy(NvCist1.Caption, "Vazia");
	MOVF        _lv_cist1+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen97
	MOVF        _NvCist1+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist1+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr7_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr7_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen98
L_PrintScreen97:
;CISTERNA_main.c,325 :: 		else strcpy(NvCist1.Caption, "Cheia");
	MOVF        _NvCist1+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist1+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr8_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr8_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen98:
;CISTERNA_main.c,326 :: 		if(lv_cist2==0)strcpy(NvCist2.Caption, "Vazia");
	MOVF        _lv_cist2+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen99
	MOVF        _NvCist2+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist2+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr9_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr9_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen100
L_PrintScreen99:
;CISTERNA_main.c,327 :: 		else strcpy(NvCist2.Caption, "Cheia");
	MOVF        _NvCist2+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCist2+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr10_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr10_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen100:
;CISTERNA_main.c,328 :: 		if(lv_cxRua==0)strcpy(NvCistR.Caption, "Vazia");
	MOVF        _lv_cxRua+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen101
	MOVF        _NvCistR+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistR+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr11_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr11_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen102
L_PrintScreen101:
;CISTERNA_main.c,329 :: 		else strcpy(NvCistR.Caption, "Cheia");
	MOVF        _NvCistR+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCistR+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr12_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr12_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen102:
;CISTERNA_main.c,330 :: 		DrawScreen(&Tela_Inicial);
	MOVLW       _Tela_Inicial+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_main.c,331 :: 		break;
	GOTO        L_PrintScreen93
;CISTERNA_main.c,332 :: 		case 1:
L_PrintScreen103:
;CISTERNA_main.c,333 :: 		if(lv_cxRua2==0)strcpy(NvCxRua02.Caption, "Vazia");
	MOVF        _lv_cxRua2+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_PrintScreen104
	MOVF        _NvCxRua02+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCxRua02+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr13_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr13_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
	GOTO        L_PrintScreen105
L_PrintScreen104:
;CISTERNA_main.c,334 :: 		else strcpy(NvCxRua02.Caption, "Cheia");
	MOVF        _NvCxRua02+7, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        _NvCxRua02+8, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr14_CISTERNA_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr14_CISTERNA_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_PrintScreen105:
;CISTERNA_main.c,335 :: 		DrawScreen(&Screen_cxRua);
	MOVLW       _Screen_cxRua+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen_cxRua+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_main.c,336 :: 		break;
	GOTO        L_PrintScreen93
;CISTERNA_main.c,337 :: 		case 2:
L_PrintScreen106:
;CISTERNA_main.c,338 :: 		DrawScreen(&Screen2);
	MOVLW       _Screen2+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_main.c,339 :: 		break;
	GOTO        L_PrintScreen93
;CISTERNA_main.c,340 :: 		}
L_PrintScreen92:
	MOVF        FARG_PrintScreen_current+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_PrintScreen94
	MOVF        FARG_PrintScreen_current+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_PrintScreen103
	MOVF        FARG_PrintScreen_current+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_PrintScreen106
L_PrintScreen93:
;CISTERNA_main.c,341 :: 		}
L_end_PrintScreen:
	RETURN      0
; end of _PrintScreen
