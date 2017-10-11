#line 1 "C:/Users/ETF/Desktop/connectfour-develop/display.c"
#line 1 "c:/users/etf/desktop/connectfour-develop/display.h"
#line 16 "c:/users/etf/desktop/connectfour-develop/display.h"
void Display_Init();
#line 10 "C:/Users/ETF/Desktop/connectfour-develop/display.c"
static char mRowOutputPort at P1;
static char mRedOutputPort at P2;
static char mGreenOutputPort at P3;


const unsigned char gMatrixRow[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
unsigned char gMatrixRed[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
unsigned char gMatrixGreen[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
#line 24 "C:/Users/ETF/Desktop/connectfour-develop/display.c"
void Display_Init(){

 mRowOutputPort = 0x00;
 mRedOutputPort = 0x00;
 mGreenOutputPort = 0x00;

 TMOD |= 0x01;

 TH0 = 0xF9;
 TL0 = 0x7D;

 IE |= 0x82;

 TR0_bit = 1;
}
#line 45 "C:/Users/ETF/Desktop/connectfour-develop/display.c"
void Display_SetOutput(unsigned char row, unsigned char red, unsigned char green){

 mRowOutputPort = 0x00;
 mRedOutputPort = 0x00;
 mGreenOutputPort = 0x00;

 mRedOutputPort = red;
 mGreenOutputPort = green;

 mRowOutputPort = row;
}
#line 62 "C:/Users/ETF/Desktop/connectfour-develop/display.c"
void Display_Refresh() iv IVT_ADDR_ET0 {
 static unsigned char i = 0;

 TR0_bit = 0;

 TH0 = 0xF9;
 TL0 = 0x7D;

 Display_SetOutput(gMatrixRow[i], gMatrixRed[i], gMatrixGreen[i]);
 i++;

 if(i == 8){
 i = 0;
 }

 TR0_bit = 1;
}
