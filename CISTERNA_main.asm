
_UART_RCV:

;CISTERNA_main.c,81 :: 		void UART_RCV() iv 0x0008 ics ICS_AUTO
;CISTERNA_main.c,84 :: 		if(TMR0IF_bit == 1 && TMR0IE_bit == 1)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_UART_RCV2
	BTFSS       TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
	GOTO        L_UART_RCV2
L__UART_RCV99:
;CISTERNA_main.c,86 :: 		++ticks;
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
;CISTERNA_main.c,87 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;CISTERNA_main.c,88 :: 		TMR0L         = 0xC0; //20 ms
	MOVLW       192
	MOVWF       TMR0L+0 
;CISTERNA_main.c,89 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;CISTERNA_main.c,90 :: 		}
	GOTO        L_UART_RCV3
L_UART_RCV2:
;CISTERNA_main.c,92 :: 		if(PIR1.RC1IF == 1 && PIE1.RC1IE == 1)
	BTFSS       PIR1+0, 5 
	GOTO        L_UART_RCV6
	BTFSS       PIE1+0, 5 
	GOTO        L_UART_RCV6
L__UART_RCV98:
;CISTERNA_main.c,94 :: 		sdata = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       UART_RCV_sdata_L0+0 
;CISTERNA_main.c,95 :: 		if(sdata == '[')     //Ex: [V2V01] - [AUT]
	MOVF        R0, 0 
	XORLW       91
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV7
;CISTERNA_main.c,97 :: 		Pot = Dta;       //Salva o endereço da matriz no ponteiro
	MOVLW       _Dta+0
	MOVWF       _Pot+0 
	MOVLW       hi_addr(_Dta+0)
	MOVWF       _Pot+1 
;CISTERNA_main.c,98 :: 		_Aux = 1;        //Flag que informa o início do protocolo
	MOVLW       1
	MOVWF       __Aux+0 
;CISTERNA_main.c,99 :: 		}
	GOTO        L_UART_RCV8
L_UART_RCV7:
;CISTERNA_main.c,101 :: 		if(sdata == ']' && _Aux == 1)
	MOVF        UART_RCV_sdata_L0+0, 0 
	XORLW       93
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV11
	MOVF        __Aux+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV11
L__UART_RCV97:
;CISTERNA_main.c,103 :: 		_Aux = 0;
	CLRF        __Aux+0 
;CISTERNA_main.c,106 :: 		DecodificaProtocolo();
	CALL        _DecodificaProtocolo+0, 0
;CISTERNA_main.c,107 :: 		}
	GOTO        L_UART_RCV12
L_UART_RCV11:
;CISTERNA_main.c,109 :: 		if (_Aux == 1)
	MOVF        __Aux+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UART_RCV13
;CISTERNA_main.c,111 :: 		*Pot = sdata;
	MOVFF       _Pot+0, FSR1L+0
	MOVFF       _Pot+1, FSR1H+0
	MOVF        UART_RCV_sdata_L0+0, 0 
	MOVWF       POSTINC1+0 
;CISTERNA_main.c,112 :: 		++Pot;
	INFSNZ      _Pot+0, 1 
	INCF        _Pot+1, 1 
;CISTERNA_main.c,114 :: 		}
L_UART_RCV13:
L_UART_RCV12:
L_UART_RCV8:
;CISTERNA_main.c,115 :: 		PIR1.RC1IF = 0;
	BCF         PIR1+0, 5 
;CISTERNA_main.c,116 :: 		}
L_UART_RCV6:
L_UART_RCV3:
;CISTERNA_main.c,117 :: 		}
L_end_UART_RCV:
L__UART_RCV114:
	RETFIE      1
; end of _UART_RCV

_main:

;CISTERNA_main.c,121 :: 		void main() {
;CISTERNA_main.c,122 :: 		Start_TP();
	CALL        _Start_TP+0, 0
;CISTERNA_main.c,123 :: 		Init_cfgMCU();
	CALL        _Init_cfgMCU+0, 0
;CISTERNA_main.c,124 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       3
	MOVWF       SPBRGH+0 
	MOVLW       64
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;CISTERNA_main.c,125 :: 		Delay_ms(100);
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
;CISTERNA_main.c,127 :: 		INTCON.GIEH = 1;
	BSF         INTCON+0, 7 
;CISTERNA_main.c,128 :: 		INTCON.GIEL = 1;
	BSF         INTCON+0, 6 
;CISTERNA_main.c,129 :: 		RCON.IPEN = 1;
	BSF         RCON+0, 7 
;CISTERNA_main.c,132 :: 		PIR1.RC1IF = 0;
	BCF         PIR1+0, 5 
;CISTERNA_main.c,133 :: 		IPR1.RC1IP = 1;
	BSF         IPR1+0, 5 
;CISTERNA_main.c,134 :: 		PIE1.RC1IE = 1;
	BSF         PIE1+0, 5 
;CISTERNA_main.c,137 :: 		Delay_ms(500);
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
;CISTERNA_main.c,138 :: 		Timers_Init();
	CALL        _Timers_Init+0, 0
;CISTERNA_main.c,139 :: 		tempoLed = start_timer(2);
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
;CISTERNA_main.c,140 :: 		tempoSmsg = start_timer(20);
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
;CISTERNA_main.c,142 :: 		tmpBtn0 = 0;
	CLRF        _tmpBtn0+0 
;CISTERNA_main.c,143 :: 		tmpBtn1 = 0;
	CLRF        _tmpBtn1+0 
;CISTERNA_main.c,144 :: 		tmpAut = 1;//modo automatico
	MOVLW       1
	MOVWF       _tmpAut+0 
;CISTERNA_main.c,145 :: 		tmpV2V = 0;//condição inicial fechada
	CLRF        _tmpV2V+0 
;CISTERNA_main.c,147 :: 		while(TRUE)
L_main16:
;CISTERNA_main.c,149 :: 		Delay_ms(10);
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
;CISTERNA_main.c,151 :: 		if(BTN_MANAUT)//RA5
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
;CISTERNA_main.c,153 :: 		tmpAut ^= 1; //toggle tmpAut
	MOVLW       1
	XORWF       _tmpAut+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       _tmpAut+0 
;CISTERNA_main.c,154 :: 		ctrl_msg = (tmpAut==0)?0:1;
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
;CISTERNA_main.c,155 :: 		}
L_main19:
;CISTERNA_main.c,156 :: 		if(BTN_V2V) //RA6
	MOVLW       PORTA+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       6
	MOVWF       FARG_Button_pin+0 
	MOVLW       50
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main22
;CISTERNA_main.c,158 :: 		tmpV2V ^= 1; //toggle tmpAut
	MOVLW       1
	XORWF       _tmpV2V+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       _tmpV2V+0 
;CISTERNA_main.c,160 :: 		ctrl_msg = (tmpV2V==0)?2:3;
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
;CISTERNA_main.c,161 :: 		}
L_main22:
;CISTERNA_main.c,162 :: 		if(tmpAut!=tmpBtn0 || tmpV2V!=tmpBtn1)
	MOVF        _tmpAut+0, 0 
	XORWF       _tmpBtn0+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main101
	MOVF        _tmpV2V+0, 0 
	XORWF       _tmpBtn1+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main101
	GOTO        L_main27
L__main101:
;CISTERNA_main.c,164 :: 		while(!RS484_Init(ctrl_msg))
L_main28:
	MOVF        _ctrl_msg+0, 0 
	MOVWF       FARG_RS484_Init_tmp+0 
	CALL        _RS484_Init+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main29
;CISTERNA_main.c,166 :: 		PORTA.RA2 ^= 1;        //Enquanto o módulo não receber cofirmação de recebimento de cmd
	BTG         PORTA+0, 2 
;CISTERNA_main.c,167 :: 		Delay_ms(500);         //Retorna 1 se retorno ocorrer com sucesso.
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
;CISTERNA_main.c,169 :: 		}
	GOTO        L_main28
L_main29:
;CISTERNA_main.c,170 :: 		tmpBtn0=tmpAut;
	MOVF        _tmpAut+0, 0 
	MOVWF       _tmpBtn0+0 
;CISTERNA_main.c,171 :: 		tmpBtn1=tmpV2V;
	MOVF        _tmpV2V+0, 0 
	MOVWF       _tmpBtn1+0 
;CISTERNA_main.c,172 :: 		PORTA.RA2= 0;
	BCF         PORTA+0, 2 
;CISTERNA_main.c,173 :: 		}
L_main27:
;CISTERNA_main.c,175 :: 		if(tmp_glcd.tmp_lv_cist1!=lv_cist1 || tmp_glcd.tmp_lv_cist2!=lv_cist2 || tmp_glcd.tmp_lv_cistRua != lv_cistRua || tmp_glcd.tmp_RT_pump_rua)
	MOVF        _tmp_glcd+0, 0 
	XORWF       _lv_cist1+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main100
	MOVF        _tmp_glcd+1, 0 
	XORWF       _lv_cist2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main100
	MOVF        _tmp_glcd+2, 0 
	XORWF       _lv_cistRua+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main100
	MOVF        _tmp_glcd+4, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main100
	GOTO        L_main33
L__main100:
;CISTERNA_main.c,179 :: 		}
L_main33:
;CISTERNA_main.c,180 :: 		if(BTN_INCR)
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
;CISTERNA_main.c,182 :: 		++curr_screen;
	INCF        _curr_screen+0, 1 
;CISTERNA_main.c,183 :: 		if(curr_screen>2)curr_screen=0;
	MOVF        _curr_screen+0, 0 
	SUBLW       2
	BTFSC       STATUS+0, 0 
	GOTO        L_main35
	CLRF        _curr_screen+0 
L_main35:
;CISTERNA_main.c,184 :: 		switch (curr_screen)
	GOTO        L_main36
;CISTERNA_main.c,186 :: 		case 0:
L_main38:
;CISTERNA_main.c,187 :: 		DrawScreen(&Tela_Inicial);
	MOVLW       _Tela_Inicial+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Tela_Inicial+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_main.c,188 :: 		break;
	GOTO        L_main37
;CISTERNA_main.c,189 :: 		case 1:
L_main39:
;CISTERNA_main.c,190 :: 		DrawScreen(&Screen2);
	MOVLW       _Screen2+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_main.c,191 :: 		break;
	GOTO        L_main37
;CISTERNA_main.c,192 :: 		case 2:
L_main40:
;CISTERNA_main.c,193 :: 		DrawScreen(&Screen1);
	MOVLW       _Screen1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CISTERNA_main.c,194 :: 		break;
	GOTO        L_main37
;CISTERNA_main.c,195 :: 		}
L_main36:
	MOVF        _curr_screen+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main38
	MOVF        _curr_screen+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main39
	MOVF        _curr_screen+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main40
L_main37:
;CISTERNA_main.c,196 :: 		}
L_main34:
;CISTERNA_main.c,197 :: 		}
	GOTO        L_main16
;CISTERNA_main.c,198 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Init_cfgMCU:

;CISTERNA_main.c,200 :: 		void Init_cfgMCU()
;CISTERNA_main.c,202 :: 		ANSELD = 0;      //PORTD como I/O digital
	CLRF        ANSELD+0 
;CISTERNA_main.c,203 :: 		TRISA.TRISA2 = 0; //output
	BCF         TRISA+0, 2 
;CISTERNA_main.c,204 :: 		TRISA.TRISA3 = 1; //enter button
	BSF         TRISA+0, 3 
;CISTERNA_main.c,205 :: 		TRISA.TRISA4 = 1; //increase button
	BSF         TRISA+0, 4 
;CISTERNA_main.c,206 :: 		TRISA.TRISA5 = 1; //botao manual automatico (input)
	BSF         TRISA+0, 5 
;CISTERNA_main.c,207 :: 		TRISA.TRISA6 = 1; //botao liga valvula (input)
	BSF         TRISA+0, 6 
;CISTERNA_main.c,210 :: 		PORTA.RA2 = 0;
	BCF         PORTA+0, 2 
;CISTERNA_main.c,211 :: 		PORTA.RA3=1;
	BSF         PORTA+0, 3 
;CISTERNA_main.c,212 :: 		PORTA.RA4=1;
	BSF         PORTA+0, 4 
;CISTERNA_main.c,213 :: 		PORTA.RA5=1;
	BSF         PORTA+0, 5 
;CISTERNA_main.c,214 :: 		PORTA.RA6=1;
	BSF         PORTA+0, 6 
;CISTERNA_main.c,215 :: 		}
L_end_Init_cfgMCU:
	RETURN      0
; end of _Init_cfgMCU

_DecodificaProtocolo:

;CISTERNA_main.c,217 :: 		void DecodificaProtocolo()
;CISTERNA_main.c,220 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '0')lv_cist1=(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo43
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo43
	MOVF        _Dta+2, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo43
L__DecodificaProtocolo111:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cist1+0 
	GOTO        L_DecodificaProtocolo44
L_DecodificaProtocolo43:
;CISTERNA_main.c,222 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '1')lv_cist2=(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo47
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo47
	MOVF        _Dta+2, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo47
L__DecodificaProtocolo110:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cist2+0 
	GOTO        L_DecodificaProtocolo48
L_DecodificaProtocolo47:
;CISTERNA_main.c,224 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '2')lv_cistRua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo51
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo51
	MOVF        _Dta+2, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo51
L__DecodificaProtocolo109:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cistRua+0 
	GOTO        L_DecodificaProtocolo52
L_DecodificaProtocolo51:
;CISTERNA_main.c,226 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '3')lv_cxRua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo55
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo55
	MOVF        _Dta+2, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo55
L__DecodificaProtocolo108:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _lv_cxRua+0 
	GOTO        L_DecodificaProtocolo56
L_DecodificaProtocolo55:
;CISTERNA_main.c,228 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '4')RT_pump_cist =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo59
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo59
	MOVF        _Dta+2, 0 
	XORLW       52
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo59
L__DecodificaProtocolo107:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _RT_pump_cist+0 
	GOTO        L_DecodificaProtocolo60
L_DecodificaProtocolo59:
;CISTERNA_main.c,230 :: 		if(Dta[0] == 'E' && Dta[1] == 'D' && Dta[2] == '5')RT_pump_rua =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo63
	MOVF        _Dta+1, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo63
	MOVF        _Dta+2, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo63
L__DecodificaProtocolo106:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _RT_pump_rua+0 
	GOTO        L_DecodificaProtocolo64
L_DecodificaProtocolo63:
;CISTERNA_main.c,232 :: 		if(Dta[0] == 'V' && Dta[1] == '2' && Dta[2] == 'V')V2V_On =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       86
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo67
	MOVF        _Dta+1, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo67
	MOVF        _Dta+2, 0 
	XORLW       86
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo67
L__DecodificaProtocolo105:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _V2V_On+0 
	GOTO        L_DecodificaProtocolo68
L_DecodificaProtocolo67:
;CISTERNA_main.c,234 :: 		if(Dta[0] == 'A' && Dta[1] == 'U' && Dta[2] == 'T')MAN_AUT =(Dta[3]-'0');
	MOVF        _Dta+0, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo71
	MOVF        _Dta+1, 0 
	XORLW       85
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo71
	MOVF        _Dta+2, 0 
	XORLW       84
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo71
L__DecodificaProtocolo104:
	MOVLW       48
	SUBWF       _Dta+3, 0 
	MOVWF       _MAN_AUT+0 
	GOTO        L_DecodificaProtocolo72
L_DecodificaProtocolo71:
;CISTERNA_main.c,236 :: 		if(Dta[0] == 'C' && Dta[1] == '1' && Dta[2] == 'O' && Dta[3] == 'K')flagCMD2=1;
	MOVF        _Dta+0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo75
	MOVF        _Dta+1, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo75
	MOVF        _Dta+2, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo75
	MOVF        _Dta+3, 0 
	XORLW       75
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo75
L__DecodificaProtocolo103:
	MOVLW       1
	MOVWF       _flagCMD2+0 
	GOTO        L_DecodificaProtocolo76
L_DecodificaProtocolo75:
;CISTERNA_main.c,238 :: 		if(Dta[0] == 'C' && Dta[1] == '2' && Dta[2] == 'O' && Dta[3] == 'K')flagCMD1=1;//Todo valor (0 a 9) ASCII pode ser convertido para número subtraindo por '0'
	MOVF        _Dta+0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo79
	MOVF        _Dta+1, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo79
	MOVF        _Dta+2, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo79
	MOVF        _Dta+3, 0 
	XORLW       75
	BTFSS       STATUS+0, 2 
	GOTO        L_DecodificaProtocolo79
L__DecodificaProtocolo102:
	MOVLW       1
	MOVWF       _flagCMD1+0 
L_DecodificaProtocolo79:
L_DecodificaProtocolo76:
L_DecodificaProtocolo72:
L_DecodificaProtocolo68:
L_DecodificaProtocolo64:
L_DecodificaProtocolo60:
L_DecodificaProtocolo56:
L_DecodificaProtocolo52:
L_DecodificaProtocolo48:
L_DecodificaProtocolo44:
;CISTERNA_main.c,239 :: 		}
L_end_DecodificaProtocolo:
	RETURN      0
; end of _DecodificaProtocolo

_SendComand:

;CISTERNA_main.c,241 :: 		bool_t SendComand(char* Comand,unsigned char* TxtReturn, uint16_t TimeOut)
;CISTERNA_main.c,243 :: 		while(*Comand != 0)
L_SendComand80:
	MOVFF       FARG_SendComand_Comand+0, FSR0L+0
	MOVFF       FARG_SendComand_Comand+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_SendComand81
;CISTERNA_main.c,245 :: 		UART1_Write(*Comand); //Envia Comando RS485
	MOVFF       FARG_SendComand_Comand+0, FSR0L+0
	MOVFF       FARG_SendComand_Comand+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,246 :: 		Comand++;
	INFSNZ      FARG_SendComand_Comand+0, 1 
	INCF        FARG_SendComand_Comand+1, 1 
;CISTERNA_main.c,247 :: 		}
	GOTO        L_SendComand80
L_SendComand81:
;CISTERNA_main.c,253 :: 		return RS485_WaitReturn(TxtReturn, TimeOut);  //Chama função que trata os retornos
	MOVF        FARG_SendComand_TxtReturn+0, 0 
	MOVWF       FARG_RS485_WaitReturn_TxtReturn+0 
	MOVF        FARG_SendComand_TxtReturn+1, 0 
	MOVWF       FARG_RS485_WaitReturn_TxtReturn+1 
	MOVF        FARG_SendComand_TimeOut+0, 0 
	MOVWF       FARG_RS485_WaitReturn_TimeOut+0 
	MOVF        FARG_SendComand_TimeOut+1, 0 
	MOVWF       FARG_RS485_WaitReturn_TimeOut+1 
	CALL        _RS485_WaitReturn+0, 0
;CISTERNA_main.c,254 :: 		}
L_end_SendComand:
	RETURN      0
; end of _SendComand

_RS485_WaitReturn:

;CISTERNA_main.c,256 :: 		bool_t RS485_WaitReturn (unsigned char* TxtReturn, uint16_t TimeOut)
;CISTERNA_main.c,259 :: 		tempo = start_timer(TimeOut);
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
;CISTERNA_main.c,260 :: 		while((_tout == 0) || (!timeout(tempo)))
L_RS485_WaitReturn82:
	MOVLW       0
	XORWF       CISTERNA_main__tout+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn120
	MOVLW       0
	XORWF       CISTERNA_main__tout+0, 0 
L__RS485_WaitReturn120:
	BTFSC       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn112
	MOVF        _ticks+3, 0 
	SUBWF       R5, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn121
	MOVF        _ticks+2, 0 
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn121
	MOVF        _ticks+1, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn121
	MOVF        _ticks+0, 0 
	SUBWF       R2, 0 
L__RS485_WaitReturn121:
	BTFSC       STATUS+0, 0 
	GOTO        L_RS485_WaitReturn84
	MOVLW       1
	MOVWF       R1 
	GOTO        L_RS485_WaitReturn85
L_RS485_WaitReturn84:
	CLRF        R1 
L_RS485_WaitReturn85:
	MOVF        R1, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__RS485_WaitReturn112
	GOTO        L_RS485_WaitReturn83
L__RS485_WaitReturn112:
;CISTERNA_main.c,262 :: 		if(*TxtReturn==1) //received return
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+0, FSR0L+0
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_RS485_WaitReturn88
;CISTERNA_main.c,264 :: 		*TxtReturn = 0;
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+0, FSR1L+0
	MOVFF       FARG_RS485_WaitReturn_TxtReturn+1, FSR1H+0
	CLRF        POSTINC1+0 
;CISTERNA_main.c,265 :: 		return TRUE;    // toda a sequência foi varrida: fim.
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_RS485_WaitReturn
;CISTERNA_main.c,266 :: 		}
L_RS485_WaitReturn88:
;CISTERNA_main.c,267 :: 		}
	GOTO        L_RS485_WaitReturn82
L_RS485_WaitReturn83:
;CISTERNA_main.c,268 :: 		return FALSE;
	CLRF        R0 
;CISTERNA_main.c,269 :: 		}
L_end_RS485_WaitReturn:
	RETURN      0
; end of _RS485_WaitReturn

_RS484_Init:

;CISTERNA_main.c,271 :: 		bool_t RS484_Init(unsigned char tmp)
;CISTERNA_main.c,273 :: 		bool_t result = TRUE;
	MOVLW       1
	MOVWF       RS484_Init_result_L0+0 
;CISTERNA_main.c,274 :: 		switch(tmp)
	GOTO        L_RS484_Init89
;CISTERNA_main.c,276 :: 		case 0:
L_RS484_Init91:
;CISTERNA_main.c,277 :: 		result = result & SendComand("[AUT0]",&flagCMD1,20);
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
;CISTERNA_main.c,278 :: 		break;
	GOTO        L_RS484_Init90
;CISTERNA_main.c,279 :: 		case 1:
L_RS484_Init92:
;CISTERNA_main.c,280 :: 		result = result & SendComand("[AUT1]",&flagCMD1,20);
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
;CISTERNA_main.c,281 :: 		break;
	GOTO        L_RS484_Init90
;CISTERNA_main.c,282 :: 		case 2:
L_RS484_Init93:
;CISTERNA_main.c,283 :: 		result = result & SendComand("[V2V0]",&flagCMD2,20);
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
;CISTERNA_main.c,284 :: 		break;
	GOTO        L_RS484_Init90
;CISTERNA_main.c,285 :: 		case 3:
L_RS484_Init94:
;CISTERNA_main.c,286 :: 		result = result & SendComand("[V2V1]",&flagCMD2,20);
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
;CISTERNA_main.c,287 :: 		break;
	GOTO        L_RS484_Init90
;CISTERNA_main.c,288 :: 		}
L_RS484_Init89:
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init91
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init92
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init93
	MOVF        FARG_RS484_Init_tmp+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_RS484_Init94
L_RS484_Init90:
;CISTERNA_main.c,289 :: 		return result;
	MOVF        RS484_Init_result_L0+0, 0 
	MOVWF       R0 
;CISTERNA_main.c,290 :: 		}
L_end_RS484_Init:
	RETURN      0
; end of _RS484_Init

_REEnviarDados:

;CISTERNA_main.c,292 :: 		void REEnviarDados(unsigned char *retData)
;CISTERNA_main.c,294 :: 		UART1_Write('[');       //inicio do protocolo
	MOVLW       91
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,296 :: 		while(*retData != 0)
L_REEnviarDados95:
	MOVFF       FARG_REEnviarDados_retData+0, FSR0L+0
	MOVFF       FARG_REEnviarDados_retData+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_REEnviarDados96
;CISTERNA_main.c,298 :: 		UART1_Write(*retData);   //Conteúdo do protocolo
	MOVFF       FARG_REEnviarDados_retData+0, FSR0L+0
	MOVFF       FARG_REEnviarDados_retData+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,299 :: 		++retData;
	INFSNZ      FARG_REEnviarDados_retData+0, 1 
	INCF        FARG_REEnviarDados_retData+1, 1 
;CISTERNA_main.c,300 :: 		}
	GOTO        L_REEnviarDados95
L_REEnviarDados96:
;CISTERNA_main.c,302 :: 		UART1_Write(']');    //fim do protocolo
	MOVLW       93
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CISTERNA_main.c,303 :: 		}
L_end_REEnviarDados:
	RETURN      0
; end of _REEnviarDados

_Timers_Init:

;CISTERNA_main.c,305 :: 		void Timers_Init()
;CISTERNA_main.c,307 :: 		T0CON         = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;CISTERNA_main.c,308 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;CISTERNA_main.c,309 :: 		INTCON2.TMR0IP = 1;
	BSF         INTCON2+0, 2 
;CISTERNA_main.c,310 :: 		TMR0IE_bit         = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;CISTERNA_main.c,311 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;CISTERNA_main.c,312 :: 		TMR0L         = 0xC0; //20 ms
	MOVLW       192
	MOVWF       TMR0L+0 
;CISTERNA_main.c,313 :: 		TMR0ON_bit = 1;
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;CISTERNA_main.c,314 :: 		}
L_end_Timers_Init:
	RETURN      0
; end of _Timers_Init
