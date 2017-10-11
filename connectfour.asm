
_ConnectFour_Init:
;connectfour.c,29 :: 		void ConnectFour_Init(){
;connectfour.c,31 :: 		mCurrentPlayerColor = COLOR_RED;
	MOV connectfour_mCurrentPlayerColor+0, #1
;connectfour.c,32 :: 		Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
	MOV FARG_Graphics_HorizontalLine_row+0, #7
	MOV FARG_Graphics_HorizontalLine_columnStart+0, #0
	MOV FARG_Graphics_HorizontalLine_columnEnd+0, #7
	MOV FARG_Graphics_HorizontalLine_color+0, #1
	LCALL _Graphics_HorizontalLine+0
;connectfour.c,33 :: 		}
	RET
; end of _ConnectFour_Init

_ConnectFour_SwitchPlayer:
;connectfour.c,40 :: 		void ConnectFour_SwitchPlayer(){
;connectfour.c,41 :: 		if(mCurrentPlayerColor == COLOR_RED){
	MOV A, connectfour_mCurrentPlayerColor+0
	XRL A, #1
	JNZ L_ConnectFour_SwitchPlayer0
;connectfour.c,42 :: 		mCurrentPlayerColor = COLOR_GREEN;
	MOV connectfour_mCurrentPlayerColor+0, #2
;connectfour.c,43 :: 		Graphics_HorizontalLine(7, 0, 7, COLOR_GREEN);
	MOV FARG_Graphics_HorizontalLine_row+0, #7
	MOV FARG_Graphics_HorizontalLine_columnStart+0, #0
	MOV FARG_Graphics_HorizontalLine_columnEnd+0, #7
	MOV FARG_Graphics_HorizontalLine_color+0, #2
	LCALL _Graphics_HorizontalLine+0
;connectfour.c,44 :: 		}else if(mCurrentPlayerColor == COLOR_GREEN){
	SJMP L_ConnectFour_SwitchPlayer1
L_ConnectFour_SwitchPlayer0:
	MOV A, connectfour_mCurrentPlayerColor+0
	XRL A, #2
	JNZ L_ConnectFour_SwitchPlayer2
;connectfour.c,45 :: 		mCurrentPlayerColor = COLOR_RED;
	MOV connectfour_mCurrentPlayerColor+0, #1
;connectfour.c,46 :: 		Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
	MOV FARG_Graphics_HorizontalLine_row+0, #7
	MOV FARG_Graphics_HorizontalLine_columnStart+0, #0
	MOV FARG_Graphics_HorizontalLine_columnEnd+0, #7
	MOV FARG_Graphics_HorizontalLine_color+0, #1
	LCALL _Graphics_HorizontalLine+0
;connectfour.c,47 :: 		}
L_ConnectFour_SwitchPlayer2:
L_ConnectFour_SwitchPlayer1:
;connectfour.c,48 :: 		}
	RET
; end of _ConnectFour_SwitchPlayer

_ConnectFour_InsertDisc:
;connectfour.c,56 :: 		unsigned char ConnectFour_InsertDisc(unsigned char column){
;connectfour.c,60 :: 		for(i = 5; i >= 0; i--){
	MOV ConnectFour_InsertDisc_i_L0+0, #5
L_ConnectFour_InsertDisc3:
	CLR C
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_InsertDisc_i_L0+0
	XRL A, #128
	SUBB A, R0
	JC L_ConnectFour_InsertDisc4
;connectfour.c,61 :: 		if(mGameMatrix[i][column - 1] == COLOR_BLACK){
	MOV B+0, ConnectFour_InsertDisc_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R2, A
	CLR C
	MOV A, FARG_ConnectFour_InsertDisc_column+0
	SUBB A, #1
	MOV R0, A
	CLR A
	SUBB A, #0
	MOV R1, A
	MOV A, R2
	ADD A, R0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	JNZ L_ConnectFour_InsertDisc6
;connectfour.c,62 :: 		mGameMatrix[i][column - 1] = mCurrentPlayerColor;
	MOV B+0, ConnectFour_InsertDisc_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R2, A
	CLR C
	MOV A, FARG_ConnectFour_InsertDisc_column+0
	SUBB A, #1
	MOV R0, A
	CLR A
	SUBB A, #0
	MOV R1, A
	MOV A, R2
	ADD A, R0
	MOV R0, A
	MOV @R0, connectfour_mCurrentPlayerColor+0
;connectfour.c,63 :: 		mDiscXPosition = i;
	MOV connectfour_mDiscXPosition+0, ConnectFour_InsertDisc_i_L0+0
;connectfour.c,64 :: 		mDiscYPosition = column - 1;
	CLR C
	MOV A, FARG_ConnectFour_InsertDisc_column+0
	SUBB A, #1
	MOV connectfour_mDiscYPosition+0, A
;connectfour.c,65 :: 		break;
	SJMP L_ConnectFour_InsertDisc4
;connectfour.c,66 :: 		}
L_ConnectFour_InsertDisc6:
;connectfour.c,60 :: 		for(i = 5; i >= 0; i--){
	DEC ConnectFour_InsertDisc_i_L0+0
;connectfour.c,67 :: 		}
	SJMP L_ConnectFour_InsertDisc3
L_ConnectFour_InsertDisc4:
;connectfour.c,69 :: 		for(j = 0; j < i; j++){
	MOV ConnectFour_InsertDisc_j_L0+0, #0
L_ConnectFour_InsertDisc7:
	CLR C
	MOV A, ConnectFour_InsertDisc_i_L0+0
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_InsertDisc_j_L0+0
	XRL A, #128
	SUBB A, R0
	JNC L_ConnectFour_InsertDisc8
;connectfour.c,70 :: 		Graphics_SetPixel(j, column, mCurrentPlayerColor);
	MOV FARG_Graphics_SetPixel_row+0, ConnectFour_InsertDisc_j_L0+0
	MOV FARG_Graphics_SetPixel_column+0, FARG_ConnectFour_InsertDisc_column+0
	MOV FARG_Graphics_SetPixel_color+0, connectfour_mCurrentPlayerColor+0
	LCALL _Graphics_SetPixel+0
;connectfour.c,71 :: 		Delay_ms(100);
	MOV R6, 163
	MOV R7, 30
	DJNZ R7, 
	DJNZ R6, 
	NOP
;connectfour.c,72 :: 		Graphics_SetPixel(j, column, COLOR_BLACK);
	MOV FARG_Graphics_SetPixel_row+0, ConnectFour_InsertDisc_j_L0+0
	MOV FARG_Graphics_SetPixel_column+0, FARG_ConnectFour_InsertDisc_column+0
	MOV FARG_Graphics_SetPixel_color+0, #0
	LCALL _Graphics_SetPixel+0
;connectfour.c,69 :: 		for(j = 0; j < i; j++){
	INC ConnectFour_InsertDisc_j_L0+0
;connectfour.c,73 :: 		}
	SJMP L_ConnectFour_InsertDisc7
L_ConnectFour_InsertDisc8:
;connectfour.c,75 :: 		if(i >= 0){
	CLR C
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_InsertDisc_i_L0+0
	XRL A, #128
	SUBB A, R0
	JC L_ConnectFour_InsertDisc10
;connectfour.c,76 :: 		Graphics_SetPixel(i, column, mCurrentPlayerColor);
	MOV FARG_Graphics_SetPixel_row+0, ConnectFour_InsertDisc_i_L0+0
	MOV FARG_Graphics_SetPixel_column+0, FARG_ConnectFour_InsertDisc_column+0
	MOV FARG_Graphics_SetPixel_color+0, connectfour_mCurrentPlayerColor+0
	LCALL _Graphics_SetPixel+0
;connectfour.c,77 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,78 :: 		}else{
L_ConnectFour_InsertDisc10:
;connectfour.c,79 :: 		return 0;
	MOV R0, #0
;connectfour.c,81 :: 		}
	RET
; end of _ConnectFour_InsertDisc

_ConnectFour_CheckWinner:
;connectfour.c,88 :: 		unsigned char ConnectFour_CheckWinner(){
;connectfour.c,91 :: 		unsigned char hits = 0;
	MOV ConnectFour_CheckWinner_hits_L0+0, #0
;connectfour.c,93 :: 		for(j = mDiscYPosition; j >= 0; j--){
	MOV ConnectFour_CheckWinner_j_L0+0, connectfour_mDiscYPosition+0
L_ConnectFour_CheckWinner12:
	CLR C
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_CheckWinner_j_L0+0
	XRL A, #128
	SUBB A, R0
	JC L_ConnectFour_CheckWinner13
;connectfour.c,94 :: 		if(mGameMatrix[mDiscXPosition][j] == mCurrentPlayerColor){
	MOV B+0, connectfour_mDiscXPosition+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner15
;connectfour.c,95 :: 		mWinnersDiscsPosition[hits][0] = mDiscXPosition;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner86
L__ConnectFour_CheckWinner87:
	CLR C
	RLC A
L__ConnectFour_CheckWinner86:
	DJNZ R1, L__ConnectFour_CheckWinner87
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, connectfour_mDiscXPosition+0
;connectfour.c,96 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner88
L__ConnectFour_CheckWinner89:
	CLR C
	RLC A
L__ConnectFour_CheckWinner88:
	DJNZ R1, L__ConnectFour_CheckWinner89
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,97 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner16
;connectfour.c,98 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,99 :: 		}
L_ConnectFour_CheckWinner16:
;connectfour.c,100 :: 		}else{
	SJMP L_ConnectFour_CheckWinner17
L_ConnectFour_CheckWinner15:
;connectfour.c,101 :: 		break;
	SJMP L_ConnectFour_CheckWinner13
;connectfour.c,102 :: 		}
L_ConnectFour_CheckWinner17:
;connectfour.c,93 :: 		for(j = mDiscYPosition; j >= 0; j--){
	DEC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,103 :: 		}
	SJMP L_ConnectFour_CheckWinner12
L_ConnectFour_CheckWinner13:
;connectfour.c,105 :: 		for(j = mDiscYPosition + 1; j < 7; j++){
	MOV A, connectfour_mDiscYPosition+0
	ADD A, #1
	MOV ConnectFour_CheckWinner_j_L0+0, A
L_ConnectFour_CheckWinner18:
	CLR C
	MOV A, #7
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_CheckWinner_j_L0+0
	XRL A, #128
	SUBB A, R0
	JNC L_ConnectFour_CheckWinner19
;connectfour.c,106 :: 		if(mGameMatrix[mDiscXPosition][j] == mCurrentPlayerColor){
	MOV B+0, connectfour_mDiscXPosition+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner21
;connectfour.c,107 :: 		mWinnersDiscsPosition[hits][0] = mDiscXPosition;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner90
L__ConnectFour_CheckWinner91:
	CLR C
	RLC A
L__ConnectFour_CheckWinner90:
	DJNZ R1, L__ConnectFour_CheckWinner91
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, connectfour_mDiscXPosition+0
;connectfour.c,108 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner92
L__ConnectFour_CheckWinner93:
	CLR C
	RLC A
L__ConnectFour_CheckWinner92:
	DJNZ R1, L__ConnectFour_CheckWinner93
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,109 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner22
;connectfour.c,110 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,111 :: 		}
L_ConnectFour_CheckWinner22:
;connectfour.c,112 :: 		}else{
	SJMP L_ConnectFour_CheckWinner23
L_ConnectFour_CheckWinner21:
;connectfour.c,113 :: 		break;
	SJMP L_ConnectFour_CheckWinner19
;connectfour.c,114 :: 		}
L_ConnectFour_CheckWinner23:
;connectfour.c,105 :: 		for(j = mDiscYPosition + 1; j < 7; j++){
	INC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,115 :: 		}
	SJMP L_ConnectFour_CheckWinner18
L_ConnectFour_CheckWinner19:
;connectfour.c,117 :: 		hits = 0;
	MOV ConnectFour_CheckWinner_hits_L0+0, #0
;connectfour.c,119 :: 		for(i = mDiscXPosition, j = mDiscYPosition; i < 6 && j >= 0; i++, j--){
	MOV ConnectFour_CheckWinner_i_L0+0, connectfour_mDiscXPosition+0
	MOV ConnectFour_CheckWinner_j_L0+0, connectfour_mDiscYPosition+0
L_ConnectFour_CheckWinner24:
	CLR C
	MOV A, #6
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_CheckWinner_i_L0+0
	XRL A, #128
	SUBB A, R0
	JC #3
	LJMP L_ConnectFour_CheckWinner25
	CLR C
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_CheckWinner_j_L0+0
	XRL A, #128
	SUBB A, R0
	JC L_ConnectFour_CheckWinner25
L__ConnectFour_CheckWinner85:
;connectfour.c,120 :: 		if(mGameMatrix[i][j] == mCurrentPlayerColor){
	MOV B+0, ConnectFour_CheckWinner_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner29
;connectfour.c,121 :: 		mWinnersDiscsPosition[hits][0] = i;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner94
L__ConnectFour_CheckWinner95:
	CLR C
	RLC A
L__ConnectFour_CheckWinner94:
	DJNZ R1, L__ConnectFour_CheckWinner95
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, ConnectFour_CheckWinner_i_L0+0
;connectfour.c,122 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner96
L__ConnectFour_CheckWinner97:
	CLR C
	RLC A
L__ConnectFour_CheckWinner96:
	DJNZ R1, L__ConnectFour_CheckWinner97
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,123 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner30
;connectfour.c,124 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,125 :: 		}
L_ConnectFour_CheckWinner30:
;connectfour.c,126 :: 		}else{
	SJMP L_ConnectFour_CheckWinner31
L_ConnectFour_CheckWinner29:
;connectfour.c,127 :: 		break;
	SJMP L_ConnectFour_CheckWinner25
;connectfour.c,128 :: 		}
L_ConnectFour_CheckWinner31:
;connectfour.c,119 :: 		for(i = mDiscXPosition, j = mDiscYPosition; i < 6 && j >= 0; i++, j--){
	INC ConnectFour_CheckWinner_i_L0+0
	DEC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,129 :: 		}
	LJMP L_ConnectFour_CheckWinner24
L_ConnectFour_CheckWinner25:
;connectfour.c,131 :: 		for(i = mDiscXPosition - 1, j = mDiscYPosition + 1; i >= 0 && j < 7; i--, j++){
	CLR C
	MOV A, connectfour_mDiscXPosition+0
	SUBB A, #1
	MOV ConnectFour_CheckWinner_i_L0+0, A
	MOV A, connectfour_mDiscYPosition+0
	ADD A, #1
	MOV ConnectFour_CheckWinner_j_L0+0, A
L_ConnectFour_CheckWinner32:
	CLR C
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_CheckWinner_i_L0+0
	XRL A, #128
	SUBB A, R0
	JNC #3
	LJMP L_ConnectFour_CheckWinner33
	CLR C
	MOV A, #7
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_CheckWinner_j_L0+0
	XRL A, #128
	SUBB A, R0
	JNC L_ConnectFour_CheckWinner33
L__ConnectFour_CheckWinner84:
;connectfour.c,132 :: 		if(mGameMatrix[i][j] == mCurrentPlayerColor){
	MOV B+0, ConnectFour_CheckWinner_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner37
;connectfour.c,133 :: 		mWinnersDiscsPosition[hits][0] = i;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner98
L__ConnectFour_CheckWinner99:
	CLR C
	RLC A
L__ConnectFour_CheckWinner98:
	DJNZ R1, L__ConnectFour_CheckWinner99
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, ConnectFour_CheckWinner_i_L0+0
;connectfour.c,134 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner100
L__ConnectFour_CheckWinner101:
	CLR C
	RLC A
L__ConnectFour_CheckWinner100:
	DJNZ R1, L__ConnectFour_CheckWinner101
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,135 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner38
;connectfour.c,136 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,137 :: 		}
L_ConnectFour_CheckWinner38:
;connectfour.c,138 :: 		}else{
	SJMP L_ConnectFour_CheckWinner39
L_ConnectFour_CheckWinner37:
;connectfour.c,139 :: 		break;
	SJMP L_ConnectFour_CheckWinner33
;connectfour.c,140 :: 		}
L_ConnectFour_CheckWinner39:
;connectfour.c,131 :: 		for(i = mDiscXPosition - 1, j = mDiscYPosition + 1; i >= 0 && j < 7; i--, j++){
	DEC ConnectFour_CheckWinner_i_L0+0
	INC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,141 :: 		}
	LJMP L_ConnectFour_CheckWinner32
L_ConnectFour_CheckWinner33:
;connectfour.c,143 :: 		hits = 0;
	MOV ConnectFour_CheckWinner_hits_L0+0, #0
;connectfour.c,145 :: 		for(i = mDiscXPosition, j = mDiscYPosition; i >= 0 && j >= 0; i--, j--){
	MOV ConnectFour_CheckWinner_i_L0+0, connectfour_mDiscXPosition+0
	MOV ConnectFour_CheckWinner_j_L0+0, connectfour_mDiscYPosition+0
L_ConnectFour_CheckWinner40:
	CLR C
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_CheckWinner_i_L0+0
	XRL A, #128
	SUBB A, R0
	JNC #3
	LJMP L_ConnectFour_CheckWinner41
	CLR C
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_CheckWinner_j_L0+0
	XRL A, #128
	SUBB A, R0
	JC L_ConnectFour_CheckWinner41
L__ConnectFour_CheckWinner83:
;connectfour.c,146 :: 		if(mGameMatrix[i][j] == mCurrentPlayerColor){
	MOV B+0, ConnectFour_CheckWinner_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner45
;connectfour.c,147 :: 		mWinnersDiscsPosition[hits][0] = i;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner102
L__ConnectFour_CheckWinner103:
	CLR C
	RLC A
L__ConnectFour_CheckWinner102:
	DJNZ R1, L__ConnectFour_CheckWinner103
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, ConnectFour_CheckWinner_i_L0+0
;connectfour.c,148 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner104
L__ConnectFour_CheckWinner105:
	CLR C
	RLC A
L__ConnectFour_CheckWinner104:
	DJNZ R1, L__ConnectFour_CheckWinner105
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,149 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner46
;connectfour.c,150 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,151 :: 		}
L_ConnectFour_CheckWinner46:
;connectfour.c,152 :: 		}else{
	SJMP L_ConnectFour_CheckWinner47
L_ConnectFour_CheckWinner45:
;connectfour.c,153 :: 		break;
	SJMP L_ConnectFour_CheckWinner41
;connectfour.c,154 :: 		}
L_ConnectFour_CheckWinner47:
;connectfour.c,145 :: 		for(i = mDiscXPosition, j = mDiscYPosition; i >= 0 && j >= 0; i--, j--){
	DEC ConnectFour_CheckWinner_i_L0+0
	DEC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,155 :: 		}
	LJMP L_ConnectFour_CheckWinner40
L_ConnectFour_CheckWinner41:
;connectfour.c,157 :: 		for(i = mDiscXPosition + 1, j = mDiscYPosition + 1; i < 6 && j < 7; i++, j++){
	MOV A, connectfour_mDiscXPosition+0
	ADD A, #1
	MOV ConnectFour_CheckWinner_i_L0+0, A
	MOV A, connectfour_mDiscYPosition+0
	ADD A, #1
	MOV ConnectFour_CheckWinner_j_L0+0, A
L_ConnectFour_CheckWinner48:
	CLR C
	MOV A, #6
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_CheckWinner_i_L0+0
	XRL A, #128
	SUBB A, R0
	JC #3
	LJMP L_ConnectFour_CheckWinner49
	CLR C
	MOV A, #7
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_CheckWinner_j_L0+0
	XRL A, #128
	SUBB A, R0
	JNC L_ConnectFour_CheckWinner49
L__ConnectFour_CheckWinner82:
;connectfour.c,158 :: 		if(mGameMatrix[i][j] == mCurrentPlayerColor){
	MOV B+0, ConnectFour_CheckWinner_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner53
;connectfour.c,159 :: 		mWinnersDiscsPosition[hits][0] = i;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner106
L__ConnectFour_CheckWinner107:
	CLR C
	RLC A
L__ConnectFour_CheckWinner106:
	DJNZ R1, L__ConnectFour_CheckWinner107
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, ConnectFour_CheckWinner_i_L0+0
;connectfour.c,160 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner108
L__ConnectFour_CheckWinner109:
	CLR C
	RLC A
L__ConnectFour_CheckWinner108:
	DJNZ R1, L__ConnectFour_CheckWinner109
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,161 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner54
;connectfour.c,162 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,163 :: 		}
L_ConnectFour_CheckWinner54:
;connectfour.c,164 :: 		}else{
	SJMP L_ConnectFour_CheckWinner55
L_ConnectFour_CheckWinner53:
;connectfour.c,165 :: 		break;
	SJMP L_ConnectFour_CheckWinner49
;connectfour.c,166 :: 		}
L_ConnectFour_CheckWinner55:
;connectfour.c,157 :: 		for(i = mDiscXPosition + 1, j = mDiscYPosition + 1; i < 6 && j < 7; i++, j++){
	INC ConnectFour_CheckWinner_i_L0+0
	INC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,167 :: 		}
	LJMP L_ConnectFour_CheckWinner48
L_ConnectFour_CheckWinner49:
;connectfour.c,169 :: 		hits = 0;
	MOV ConnectFour_CheckWinner_hits_L0+0, #0
;connectfour.c,171 :: 		for(i = mDiscXPosition; i < 6; i++){
	MOV ConnectFour_CheckWinner_i_L0+0, connectfour_mDiscXPosition+0
L_ConnectFour_CheckWinner56:
	CLR C
	MOV A, #6
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_CheckWinner_i_L0+0
	XRL A, #128
	SUBB A, R0
	JNC L_ConnectFour_CheckWinner57
;connectfour.c,172 :: 		if(mGameMatrix[i][mDiscYPosition] == mCurrentPlayerColor){
	MOV B+0, ConnectFour_CheckWinner_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, connectfour_mDiscYPosition+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner59
;connectfour.c,173 :: 		mWinnersDiscsPosition[hits][0] = i;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner110
L__ConnectFour_CheckWinner111:
	CLR C
	RLC A
L__ConnectFour_CheckWinner110:
	DJNZ R1, L__ConnectFour_CheckWinner111
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, ConnectFour_CheckWinner_i_L0+0
;connectfour.c,174 :: 		mWinnersDiscsPosition[hits][1] = mDiscYPosition;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner112
L__ConnectFour_CheckWinner113:
	CLR C
	RLC A
L__ConnectFour_CheckWinner112:
	DJNZ R1, L__ConnectFour_CheckWinner113
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, connectfour_mDiscYPosition+0
;connectfour.c,175 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner60
;connectfour.c,176 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,177 :: 		}
L_ConnectFour_CheckWinner60:
;connectfour.c,178 :: 		}else{
	SJMP L_ConnectFour_CheckWinner61
L_ConnectFour_CheckWinner59:
;connectfour.c,179 :: 		break;
	SJMP L_ConnectFour_CheckWinner57
;connectfour.c,180 :: 		}
L_ConnectFour_CheckWinner61:
;connectfour.c,171 :: 		for(i = mDiscXPosition; i < 6; i++){
	INC ConnectFour_CheckWinner_i_L0+0
;connectfour.c,181 :: 		}
	SJMP L_ConnectFour_CheckWinner56
L_ConnectFour_CheckWinner57:
;connectfour.c,182 :: 		return 0;
	MOV R0, #0
;connectfour.c,183 :: 		}
	RET
; end of _ConnectFour_CheckWinner

_ConnectFour_TurnWinnersDiscs:
;connectfour.c,191 :: 		void ConnectFour_TurnWinnersDiscs(unsigned char onOff){
;connectfour.c,194 :: 		if(onOff){
	MOV A, FARG_ConnectFour_TurnWinnersDiscs_onOff+0
	JZ L_ConnectFour_TurnWinnersDiscs62
;connectfour.c,195 :: 		for(i = 0; i < 4; i++){
	MOV ConnectFour_TurnWinnersDiscs_i_L0+0, #0
L_ConnectFour_TurnWinnersDiscs63:
	CLR C
	MOV A, ConnectFour_TurnWinnersDiscs_i_L0+0
	SUBB A, #4
	JNC L_ConnectFour_TurnWinnersDiscs64
;connectfour.c,196 :: 		Graphics_SetPixel(mWinnersDiscsPosition[i][0], mWinnersDiscsPosition[i][1] + 1,
	MOV R1, #1
	MOV A, ConnectFour_TurnWinnersDiscs_i_L0+0
	INC R1
	SJMP L__ConnectFour_TurnWinnersDiscs114
L__ConnectFour_TurnWinnersDiscs115:
	CLR C
	RLC A
L__ConnectFour_TurnWinnersDiscs114:
	DJNZ R1, L__ConnectFour_TurnWinnersDiscs115
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV FARG_Graphics_SetPixel_row+0, @R0
	INC R0
	MOV A, @R0
	ADD A, #1
	MOV FARG_Graphics_SetPixel_column+0, A
;connectfour.c,197 :: 		mCurrentPlayerColor);
	MOV FARG_Graphics_SetPixel_color+0, connectfour_mCurrentPlayerColor+0
	LCALL _Graphics_SetPixel+0
;connectfour.c,195 :: 		for(i = 0; i < 4; i++){
	INC ConnectFour_TurnWinnersDiscs_i_L0+0
;connectfour.c,198 :: 		}
	SJMP L_ConnectFour_TurnWinnersDiscs63
L_ConnectFour_TurnWinnersDiscs64:
;connectfour.c,199 :: 		}
	SJMP L_ConnectFour_TurnWinnersDiscs66
L_ConnectFour_TurnWinnersDiscs62:
;connectfour.c,202 :: 		for(i = 0; i < 4; i++){
	MOV ConnectFour_TurnWinnersDiscs_i_L0+0, #0
L_ConnectFour_TurnWinnersDiscs67:
	CLR C
	MOV A, ConnectFour_TurnWinnersDiscs_i_L0+0
	SUBB A, #4
	JNC L_ConnectFour_TurnWinnersDiscs68
;connectfour.c,203 :: 		Graphics_SetPixel(mWinnersDiscsPosition[i][0], mWinnersDiscsPosition[i][1] + 1,
	MOV R1, #1
	MOV A, ConnectFour_TurnWinnersDiscs_i_L0+0
	INC R1
	SJMP L__ConnectFour_TurnWinnersDiscs116
L__ConnectFour_TurnWinnersDiscs117:
	CLR C
	RLC A
L__ConnectFour_TurnWinnersDiscs116:
	DJNZ R1, L__ConnectFour_TurnWinnersDiscs117
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV FARG_Graphics_SetPixel_row+0, @R0
	INC R0
	MOV A, @R0
	ADD A, #1
	MOV FARG_Graphics_SetPixel_column+0, A
;connectfour.c,204 :: 		COLOR_BLACK);
	MOV FARG_Graphics_SetPixel_color+0, #0
	LCALL _Graphics_SetPixel+0
;connectfour.c,202 :: 		for(i = 0; i < 4; i++){
	INC ConnectFour_TurnWinnersDiscs_i_L0+0
;connectfour.c,205 :: 		}
	SJMP L_ConnectFour_TurnWinnersDiscs67
L_ConnectFour_TurnWinnersDiscs68:
;connectfour.c,206 :: 		}
L_ConnectFour_TurnWinnersDiscs66:
;connectfour.c,207 :: 		}
	RET
; end of _ConnectFour_TurnWinnersDiscs

_ConnectFour_NewGame:
;connectfour.c,214 :: 		void ConnectFour_NewGame(){
;connectfour.c,218 :: 		for(i = 0; i < 6; i++){
	MOV ConnectFour_NewGame_i_L0+0, #0
L_ConnectFour_NewGame70:
	CLR C
	MOV A, ConnectFour_NewGame_i_L0+0
	SUBB A, #6
	JNC L_ConnectFour_NewGame71
;connectfour.c,219 :: 		for(j = 0; j < 7; j++){
	MOV ConnectFour_NewGame_j_L0+0, #0
L_ConnectFour_NewGame73:
	CLR C
	MOV A, ConnectFour_NewGame_j_L0+0
	SUBB A, #7
	JNC L_ConnectFour_NewGame74
;connectfour.c,220 :: 		mGameMatrix[i][j] = 0;
	MOV B+0, ConnectFour_NewGame_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_NewGame_j_L0+0
	MOV R0, A
	MOV @R0, #0
;connectfour.c,219 :: 		for(j = 0; j < 7; j++){
	INC ConnectFour_NewGame_j_L0+0
;connectfour.c,221 :: 		}
	SJMP L_ConnectFour_NewGame73
L_ConnectFour_NewGame74:
;connectfour.c,218 :: 		for(i = 0; i < 6; i++){
	INC ConnectFour_NewGame_i_L0+0
;connectfour.c,222 :: 		}
	SJMP L_ConnectFour_NewGame70
L_ConnectFour_NewGame71:
;connectfour.c,224 :: 		for(i = 0; i < 4; i++){
	MOV ConnectFour_NewGame_i_L0+0, #0
L_ConnectFour_NewGame76:
	CLR C
	MOV A, ConnectFour_NewGame_i_L0+0
	SUBB A, #4
	JNC L_ConnectFour_NewGame77
;connectfour.c,225 :: 		for(j = 0; j < 2; j++){
	MOV ConnectFour_NewGame_j_L0+0, #0
L_ConnectFour_NewGame79:
	CLR C
	MOV A, ConnectFour_NewGame_j_L0+0
	SUBB A, #2
	JNC L_ConnectFour_NewGame80
;connectfour.c,226 :: 		mWinnersDiscsPosition[i][j] = 0;
	MOV R1, #1
	MOV A, ConnectFour_NewGame_i_L0+0
	INC R1
	SJMP L__ConnectFour_NewGame118
L__ConnectFour_NewGame119:
	CLR C
	RLC A
L__ConnectFour_NewGame118:
	DJNZ R1, L__ConnectFour_NewGame119
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_NewGame_j_L0+0
	MOV R0, A
	MOV @R0, #0
;connectfour.c,225 :: 		for(j = 0; j < 2; j++){
	INC ConnectFour_NewGame_j_L0+0
;connectfour.c,227 :: 		}
	SJMP L_ConnectFour_NewGame79
L_ConnectFour_NewGame80:
;connectfour.c,224 :: 		for(i = 0; i < 4; i++){
	INC ConnectFour_NewGame_i_L0+0
;connectfour.c,228 :: 		}
	SJMP L_ConnectFour_NewGame76
L_ConnectFour_NewGame77:
;connectfour.c,230 :: 		Graphics_ClearDisplay();
	LCALL _Graphics_ClearDisplay+0
;connectfour.c,232 :: 		ConnectFour_Init();
	LCALL _ConnectFour_Init+0
;connectfour.c,233 :: 		}
	RET
; end of _ConnectFour_NewGame
