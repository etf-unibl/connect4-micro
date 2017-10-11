#line 1 "C:/Users/ETF/Desktop/connectfour-develop/connectfour.c"
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
#line 11 "C:/Users/ETF/Desktop/connectfour-develop/connectfour.c"
static unsigned char mGameMatrix[6][7] = {{0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0}};

static unsigned char mWinnersDiscsPosition[4][2] = {{0, 0}, {0, 0}, {0, 0}, {0, 0}};

static unsigned char mCurrentPlayerColor;

static unsigned char mDiscXPosition, mDiscYPosition;
#line 29 "C:/Users/ETF/Desktop/connectfour-develop/connectfour.c"
void ConnectFour_Init(){

 mCurrentPlayerColor = COLOR_RED;
 Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
}
#line 40 "C:/Users/ETF/Desktop/connectfour-develop/connectfour.c"
void ConnectFour_SwitchPlayer(){
 if(mCurrentPlayerColor == COLOR_RED){
 mCurrentPlayerColor = COLOR_GREEN;
 Graphics_HorizontalLine(7, 0, 7, COLOR_GREEN);
 }else if(mCurrentPlayerColor == COLOR_GREEN){
 mCurrentPlayerColor = COLOR_RED;
 Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
 }
}
#line 56 "C:/Users/ETF/Desktop/connectfour-develop/connectfour.c"
unsigned char ConnectFour_InsertDisc(unsigned char column){
 signed char i;
 signed char j;

 for(i = 5; i >= 0; i--){
 if(mGameMatrix[i][column - 1] == COLOR_BLACK){
 mGameMatrix[i][column - 1] = mCurrentPlayerColor;
 mDiscXPosition = i;
 mDiscYPosition = column - 1;
 break;
 }
 }

 for(j = 0; j < i; j++){
 Graphics_SetPixel(j, column, mCurrentPlayerColor);
 Delay_ms(100);
 Graphics_SetPixel(j, column, COLOR_BLACK);
 }

 if(i >= 0){
 Graphics_SetPixel(i, column, mCurrentPlayerColor);
 return 1;
 }else{
 return 0;
 }
}
#line 88 "C:/Users/ETF/Desktop/connectfour-develop/connectfour.c"
unsigned char ConnectFour_CheckWinner(){
 signed char i;
 signed char j;
 unsigned char hits = 0;

 for(j = mDiscYPosition; j >= 0; j--){
 if(mGameMatrix[mDiscXPosition][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = mDiscXPosition;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 for(j = mDiscYPosition + 1; j < 7; j++){
 if(mGameMatrix[mDiscXPosition][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = mDiscXPosition;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 hits = 0;

 for(i = mDiscXPosition, j = mDiscYPosition; i < 6 && j >= 0; i++, j--){
 if(mGameMatrix[i][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = i;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 for(i = mDiscXPosition - 1, j = mDiscYPosition + 1; i >= 0 && j < 7; i--, j++){
 if(mGameMatrix[i][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = i;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 hits = 0;

 for(i = mDiscXPosition, j = mDiscYPosition; i >= 0 && j >= 0; i--, j--){
 if(mGameMatrix[i][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = i;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 for(i = mDiscXPosition + 1, j = mDiscYPosition + 1; i < 6 && j < 7; i++, j++){
 if(mGameMatrix[i][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = i;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 hits = 0;

 for(i = mDiscXPosition; i < 6; i++){
 if(mGameMatrix[i][mDiscYPosition] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = i;
 mWinnersDiscsPosition[hits][1] = mDiscYPosition;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }
 return 0;
}
#line 191 "C:/Users/ETF/Desktop/connectfour-develop/connectfour.c"
void ConnectFour_TurnWinnersDiscs(unsigned char onOff){
 unsigned char i;

 if(onOff){
 for(i = 0; i < 4; i++){
 Graphics_SetPixel(mWinnersDiscsPosition[i][0], mWinnersDiscsPosition[i][1] + 1,
 mCurrentPlayerColor);
 }
 }

 else{
 for(i = 0; i < 4; i++){
 Graphics_SetPixel(mWinnersDiscsPosition[i][0], mWinnersDiscsPosition[i][1] + 1,
 COLOR_BLACK);
 }
 }
}
#line 214 "C:/Users/ETF/Desktop/connectfour-develop/connectfour.c"
void ConnectFour_NewGame(){
 unsigned char i;
 unsigned char j;

 for(i = 0; i < 6; i++){
 for(j = 0; j < 7; j++){
 mGameMatrix[i][j] = 0;
 }
 }

 for(i = 0; i < 4; i++){
 for(j = 0; j < 2; j++){
 mWinnersDiscsPosition[i][j] = 0;
 }
 }

 Graphics_ClearDisplay();

 ConnectFour_Init();
}
