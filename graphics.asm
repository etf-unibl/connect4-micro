
_Graphics_SetPixel:
;graphics.c,19 :: 		void Graphics_SetPixel(unsigned char row, unsigned char column, Color color){
;graphics.c,20 :: 		switch(color){
	LJMP L_Graphics_SetPixel0
;graphics.c,21 :: 		case COLOR_BLACK:
L_Graphics_SetPixel2:
;graphics.c,22 :: 		gMatrixRed[column] = gMatrixRed[column] & ~(1 << row); // clear RED
	MOV A, #_gMatrixRed+0
	ADD A, FARG_Graphics_SetPixel_column+0
	MOV R0, A
	MOV R2, FARG_Graphics_SetPixel_row+0
	MOV A, #1
	INC R2
	SJMP L__Graphics_SetPixel15
L__Graphics_SetPixel16:
	CLR C
	RLC A
L__Graphics_SetPixel15:
	DJNZ R2, L__Graphics_SetPixel16
	MOV R1, A
	XRL 1, #255
	MOV R2, 1
	MOV A, @R0
	ANL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,23 :: 		gMatrixGreen[column] = gMatrixGreen[column] & ~(1 << row); // clear GREEN
	MOV A, #_gMatrixGreen+0
	ADD A, FARG_Graphics_SetPixel_column+0
	MOV R0, A
	MOV R2, FARG_Graphics_SetPixel_row+0
	MOV A, #1
	INC R2
	SJMP L__Graphics_SetPixel17
L__Graphics_SetPixel18:
	CLR C
	RLC A
L__Graphics_SetPixel17:
	DJNZ R2, L__Graphics_SetPixel18
	MOV R1, A
	XRL 1, #255
	MOV R2, 1
	MOV A, @R0
	ANL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,24 :: 		break;
	LJMP L_Graphics_SetPixel1
;graphics.c,25 :: 		case COLOR_RED:
L_Graphics_SetPixel3:
;graphics.c,26 :: 		gMatrixRed[column] = gMatrixRed[column] | (1 << row); // set RED
	MOV A, #_gMatrixRed+0
	ADD A, FARG_Graphics_SetPixel_column+0
	MOV R0, A
	MOV R2, FARG_Graphics_SetPixel_row+0
	MOV A, #1
	INC R2
	SJMP L__Graphics_SetPixel19
L__Graphics_SetPixel20:
	CLR C
	RLC A
L__Graphics_SetPixel19:
	DJNZ R2, L__Graphics_SetPixel20
	MOV R1, A
	MOV R2, 1
	MOV A, @R0
	ORL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,27 :: 		gMatrixGreen[column] = gMatrixGreen[column] & ~(1 << row); // clear GREEN
	MOV A, #_gMatrixGreen+0
	ADD A, FARG_Graphics_SetPixel_column+0
	MOV R0, A
	MOV R2, FARG_Graphics_SetPixel_row+0
	MOV A, #1
	INC R2
	SJMP L__Graphics_SetPixel21
L__Graphics_SetPixel22:
	CLR C
	RLC A
L__Graphics_SetPixel21:
	DJNZ R2, L__Graphics_SetPixel22
	MOV R1, A
	XRL 1, #255
	MOV R2, 1
	MOV A, @R0
	ANL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,28 :: 		break;
	LJMP L_Graphics_SetPixel1
;graphics.c,29 :: 		case COLOR_GREEN:
L_Graphics_SetPixel4:
;graphics.c,30 :: 		gMatrixRed[column] = gMatrixRed[column] & ~(1 << row); // clear RED
	MOV A, #_gMatrixRed+0
	ADD A, FARG_Graphics_SetPixel_column+0
	MOV R0, A
	MOV R2, FARG_Graphics_SetPixel_row+0
	MOV A, #1
	INC R2
	SJMP L__Graphics_SetPixel23
L__Graphics_SetPixel24:
	CLR C
	RLC A
L__Graphics_SetPixel23:
	DJNZ R2, L__Graphics_SetPixel24
	MOV R1, A
	XRL 1, #255
	MOV R2, 1
	MOV A, @R0
	ANL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,31 :: 		gMatrixGreen[column] = gMatrixGreen[column] | (1 << row); // set GREEN
	MOV A, #_gMatrixGreen+0
	ADD A, FARG_Graphics_SetPixel_column+0
	MOV R0, A
	MOV R2, FARG_Graphics_SetPixel_row+0
	MOV A, #1
	INC R2
	SJMP L__Graphics_SetPixel25
L__Graphics_SetPixel26:
	CLR C
	RLC A
L__Graphics_SetPixel25:
	DJNZ R2, L__Graphics_SetPixel26
	MOV R1, A
	MOV R2, 1
	MOV A, @R0
	ORL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,32 :: 		break;
	SJMP L_Graphics_SetPixel1
;graphics.c,33 :: 		case COLOR_YELLOW:
L_Graphics_SetPixel5:
;graphics.c,34 :: 		gMatrixRed[column] = gMatrixRed[column] | (1 << column); // set RED
	MOV A, #_gMatrixRed+0
	ADD A, FARG_Graphics_SetPixel_column+0
	MOV R0, A
	MOV R2, FARG_Graphics_SetPixel_column+0
	MOV A, #1
	INC R2
	SJMP L__Graphics_SetPixel27
L__Graphics_SetPixel28:
	CLR C
	RLC A
L__Graphics_SetPixel27:
	DJNZ R2, L__Graphics_SetPixel28
	MOV R1, A
	MOV R2, 1
	MOV A, @R0
	ORL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,35 :: 		gMatrixGreen[column] = gMatrixGreen[column] | (1 << column); // set GREEN
	MOV A, #_gMatrixGreen+0
	ADD A, FARG_Graphics_SetPixel_column+0
	MOV R0, A
	MOV R2, FARG_Graphics_SetPixel_column+0
	MOV A, #1
	INC R2
	SJMP L__Graphics_SetPixel29
L__Graphics_SetPixel30:
	CLR C
	RLC A
L__Graphics_SetPixel29:
	DJNZ R2, L__Graphics_SetPixel30
	MOV R1, A
	MOV R2, 1
	MOV A, @R0
	ORL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,36 :: 		break;
	SJMP L_Graphics_SetPixel1
;graphics.c,37 :: 		}
L_Graphics_SetPixel0:
	MOV A, FARG_Graphics_SetPixel_color+0
	JNZ #3
	LJMP L_Graphics_SetPixel2
	MOV A, FARG_Graphics_SetPixel_color+0
	XRL A, #1
	JNZ #3
	LJMP L_Graphics_SetPixel3
	MOV A, FARG_Graphics_SetPixel_color+0
	XRL A, #2
	JNZ #3
	LJMP L_Graphics_SetPixel4
	MOV A, FARG_Graphics_SetPixel_color+0
	XRL A, #3
	JZ L_Graphics_SetPixel5
L_Graphics_SetPixel1:
;graphics.c,38 :: 		}
	RET
; end of _Graphics_SetPixel

_Graphics_VerticalLine:
;graphics.c,47 :: 		unsigned char rowEnd, Color color){
;graphics.c,49 :: 		for(row = rowStart; row <= rowEnd; row++){
	MOV Graphics_VerticalLine_row_L0+0, FARG_Graphics_VerticalLine_rowStart+0
L_Graphics_VerticalLine6:
	SETB C
	MOV A, Graphics_VerticalLine_row_L0+0
	SUBB A, FARG_Graphics_VerticalLine_rowEnd+0
	JNC L_Graphics_VerticalLine7
;graphics.c,50 :: 		Graphics_SetPixel(row, column, color);
	MOV FARG_Graphics_SetPixel_row+0, Graphics_VerticalLine_row_L0+0
	MOV FARG_Graphics_SetPixel_column+0, FARG_Graphics_VerticalLine_column+0
	MOV FARG_Graphics_SetPixel_color+0, FARG_Graphics_VerticalLine_color+0
	LCALL _Graphics_SetPixel+0
;graphics.c,49 :: 		for(row = rowStart; row <= rowEnd; row++){
	INC Graphics_VerticalLine_row_L0+0
;graphics.c,51 :: 		}
	SJMP L_Graphics_VerticalLine6
L_Graphics_VerticalLine7:
;graphics.c,52 :: 		}
	RET
; end of _Graphics_VerticalLine

_Graphics_HorizontalLine:
;graphics.c,61 :: 		unsigned char columnEnd, Color color){
;graphics.c,63 :: 		for(column = columnStart; column <= columnEnd; column++){
	MOV Graphics_HorizontalLine_column_L0+0, FARG_Graphics_HorizontalLine_columnStart+0
L_Graphics_HorizontalLine9:
	SETB C
	MOV A, Graphics_HorizontalLine_column_L0+0
	SUBB A, FARG_Graphics_HorizontalLine_columnEnd+0
	JNC L_Graphics_HorizontalLine10
;graphics.c,64 :: 		Graphics_SetPixel(row, column, color);
	MOV FARG_Graphics_SetPixel_row+0, FARG_Graphics_HorizontalLine_row+0
	MOV FARG_Graphics_SetPixel_column+0, Graphics_HorizontalLine_column_L0+0
	MOV FARG_Graphics_SetPixel_color+0, FARG_Graphics_HorizontalLine_color+0
	LCALL _Graphics_SetPixel+0
;graphics.c,63 :: 		for(column = columnStart; column <= columnEnd; column++){
	INC Graphics_HorizontalLine_column_L0+0
;graphics.c,65 :: 		}
	SJMP L_Graphics_HorizontalLine9
L_Graphics_HorizontalLine10:
;graphics.c,66 :: 		}
	RET
; end of _Graphics_HorizontalLine

_Graphics_ClearDisplay:
;graphics.c,73 :: 		void Graphics_ClearDisplay(){
;graphics.c,75 :: 		for(i = 0; i < 8; i++){
	MOV Graphics_ClearDisplay_i_L0+0, #0
L_Graphics_ClearDisplay12:
	CLR C
	MOV A, Graphics_ClearDisplay_i_L0+0
	SUBB A, #8
	JNC L_Graphics_ClearDisplay13
;graphics.c,76 :: 		gMatrixRed[i] = 0x00;
	MOV A, #_gMatrixRed+0
	ADD A, Graphics_ClearDisplay_i_L0+0
	MOV R0, A
	MOV @R0, #0
;graphics.c,77 :: 		gMatrixGreen[i] = 0x00;
	MOV A, #_gMatrixGreen+0
	ADD A, Graphics_ClearDisplay_i_L0+0
	MOV R0, A
	MOV @R0, #0
;graphics.c,75 :: 		for(i = 0; i < 8; i++){
	INC Graphics_ClearDisplay_i_L0+0
;graphics.c,78 :: 		}
	SJMP L_Graphics_ClearDisplay12
L_Graphics_ClearDisplay13:
;graphics.c,79 :: 		}
	RET
; end of _Graphics_ClearDisplay
