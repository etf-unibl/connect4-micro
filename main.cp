#line 1 "C:/Users/ETF/Desktop/connectfour-develop/main.c"
#line 1 "c:/users/etf/desktop/connectfour-develop/timer.h"
#line 16 "c:/users/etf/desktop/connectfour-develop/timer.h"
void Timer_Init();
#line 23 "c:/users/etf/desktop/connectfour-develop/timer.h"
unsigned long Timer_Miliseconds();
#line 1 "c:/users/etf/desktop/connectfour-develop/display.h"
#line 16 "c:/users/etf/desktop/connectfour-develop/display.h"
void Display_Init();
#line 1 "c:/users/etf/desktop/connectfour-develop/graphics.h"
#line 11 "c:/users/etf/desktop/connectfour-develop/graphics.h"
typedef enum Color{
 COLOR_BLACK,
 COLOR_RED,
 COLOR_GREEN,
 COLOR_YELLOW
} Color;
#line 24 "c:/users/etf/desktop/connectfour-develop/graphics.h"
void Graphics_SetPixel(unsigned char row, unsigned char column, Color color);
#line 32 "c:/users/etf/desktop/connectfour-develop/graphics.h"
void Graphics_VerticalLine(unsigned char column, unsigned char rowStart,
 unsigned char rowEnd, Color color);
#line 41 "c:/users/etf/desktop/connectfour-develop/graphics.h"
void Graphics_HorizontalLine(unsigned char row, unsigned char columnStart,
 unsigned char columnEnd, Color color);
#line 49 "c:/users/etf/desktop/connectfour-develop/graphics.h"
void Graphics_ClearDisplay();
#line 1 "c:/users/etf/desktop/connectfour-develop/connectfour.h"
#line 16 "c:/users/etf/desktop/connectfour-develop/connectfour.h"
void ConnectFour_Init();
#line 23 "c:/users/etf/desktop/connectfour-develop/connectfour.h"
void ConnectFour_SwitchPlayer();
#line 31 "c:/users/etf/desktop/connectfour-develop/connectfour.h"
unsigned char ConnectFour_InsertDisc(unsigned char column);
#line 38 "c:/users/etf/desktop/connectfour-develop/connectfour.h"
unsigned char ConnectFour_CheckWinner();
#line 46 "c:/users/etf/desktop/connectfour-develop/connectfour.h"
void ConnectFour_TurnWinnersDiscs(unsigned char onOff);
#line 53 "c:/users/etf/desktop/connectfour-develop/connectfour.h"
void ConnectFour_NewGame();
#line 6 "C:/Users/ETF/Desktop/connectfour-develop/main.c"
char keypadPort at P0;

const char keys[17] = {'\0', '1', '2', '3', 'A', '4', '5', '6', 'B',
 '7', '8', '9', 'C' ,'*', '0', '#', 'D'};

void Init(){
 Timer_Init();
 Keypad_Init();
 Display_Init();
 ConnectFour_Init();
}

void main(){

 char key;
 unsigned char keyIndex;

 unsigned char discInserted;
 unsigned char hasWinner;

 unsigned long startTime;
 unsigned long stopTime;

 Init();


 do{
 do{

 do{
 keyIndex = Keypad_Key_Click();
 key = keys[keyIndex];
 } while(key != 'D' && (key < '1' || key > '7'));

 if(key == 'D'){
 ConnectFour_NewGame();
 break;
 }

 discInserted = ConnectFour_InsertDisc(key - 48);
 }while(!discInserted);

 if(key != 'D'){

 hasWinner = ConnectFour_CheckWinner();

 if(hasWinner){
 startTime = Timer_Miliseconds();
 do{
 stopTime = Timer_Miliseconds();

 if(stopTime - startTime < 500){
 ConnectFour_TurnWinnersDiscs(1);
 }

 else if(stopTime - startTime < 1000){
 ConnectFour_TurnWinnersDiscs(0);
 }

 else{
 startTime = Timer_Miliseconds();
 }

 keyIndex = Keypad_Key_Click();
 key = keys[keyIndex];
 }while(key != 'D');

 ConnectFour_NewGame();
 }

 else{

 ConnectFour_SwitchPlayer();
 }
 }
 }while(1);

}
