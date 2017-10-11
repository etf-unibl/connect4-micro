
_Timer_Init:
;timer.c,17 :: 		void Timer_Init(){
;timer.c,18 :: 		mMiliseconds = 0;
	MOV timer_mMiliseconds+0, #0
	MOV timer_mMiliseconds+1, #0
	MOV timer_mMiliseconds+2, #0
	MOV timer_mMiliseconds+3, #0
;timer.c,20 :: 		TMOD |= 0x10;
	ORL TMOD+0, #16
;timer.c,22 :: 		TH1 = 0xFC;
	MOV TH1+0, #252
;timer.c,23 :: 		TL1 = 0xBE;
	MOV TL1+0, #190
;timer.c,25 :: 		IE |= 0x88;
	ORL IE+0, #136
;timer.c,27 :: 		TR1_bit = 1;
	SETB TR1_bit+0
;timer.c,28 :: 		}
	RET
; end of _Timer_Init

_Timer_Miliseconds:
;timer.c,35 :: 		unsigned long Timer_Miliseconds(){
;timer.c,36 :: 		return mMiliseconds;
	MOV R0, timer_mMiliseconds+0
	MOV R1, timer_mMiliseconds+1
	MOV R2, timer_mMiliseconds+2
	MOV R3, timer_mMiliseconds+3
;timer.c,37 :: 		}
	RET
; end of _Timer_Miliseconds

_Timer_Tick:
	PUSH PSW+0
	PUSH 224
	PUSH B+0
	PUSH 130
	PUSH 131
;timer.c,44 :: 		void Timer_Tick() iv IVT_ADDR_ET1 {
;timer.c,46 :: 		TR1_bit = 0;
	CLR TR1_bit+0
;timer.c,48 :: 		TH1 = 0xFC;
	MOV TH1+0, #252
;timer.c,49 :: 		TL1 = 0xBE;
	MOV TL1+0, #190
;timer.c,51 :: 		mMiliseconds++;
	MOV A, #1
	ADD A, timer_mMiliseconds+0
	MOV timer_mMiliseconds+0, A
	MOV A, #0
	ADDC A, timer_mMiliseconds+1
	MOV timer_mMiliseconds+1, A
	MOV A, #0
	ADDC A, timer_mMiliseconds+2
	MOV timer_mMiliseconds+2, A
	MOV A, #0
	ADDC A, timer_mMiliseconds+3
	MOV timer_mMiliseconds+3, A
;timer.c,53 :: 		TR1_bit = 1;
	SETB TR1_bit+0
;timer.c,54 :: 		}
	POP 131
	POP 130
	POP B+0
	POP 224
	POP PSW+0
	RETI
; end of _Timer_Tick
