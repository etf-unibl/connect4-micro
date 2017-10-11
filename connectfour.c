/**
* @file     connectfour.c
* @author   Dejan Djekanovic
* @date     09 Aug 2017
* @version  1.0
* @brief    This source file contains functions for abstracting connectfour game.
* It's possible to initialize connect four game, insert disc in appropriate column, switch
* between red and green player, check if one of players wins the game, turn on or off winners
* discs and start new game.
*/

#include <connectfour.h>
#include <graphics.h>

static unsigned char mGameMatrix[6][7] = {{0, 0, 0, 0, 0, 0, 0},
                                          {0, 0, 0, 0, 0, 0, 0},
                                          {0, 0, 0, 0, 0, 0, 0},
                                          {0, 0, 0, 0, 0, 0, 0},
                                          {0, 0, 0, 0, 0, 0, 0},
                                          {0, 0, 0, 0, 0, 0, 0}};
                      
static unsigned char mWinnersDiscsPosition[4][2] = {{0, 0}, {0, 0}, {0, 0}, {0, 0}};
                                          
static unsigned char mCurrentPlayerColor;

static unsigned char mDiscXPosition, mDiscYPosition;

/**
* @brief    Initializes connectfour
*
* The function sets the color of the current player and draws a horizontal line showing which 
* player is on the move.
*
* @return   This function does not return value
* @note     Modify @p mCurrentPlayerColor
*/
void ConnectFour_Init(){
    // set player
    mCurrentPlayerColor = COLOR_RED;
    Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
}

/**
* @brief    Switches between red and green player
*
* The function checks if current player color is red or green and changes value of
* @p mCurrentPlayerColor to color of another player.
*
* @return   This function does not return value
* @note     Modify @p mCurrentPlayerColor
*/
void ConnectFour_SwitchPlayer(){
    if(mCurrentPlayerColor == COLOR_RED){
        mCurrentPlayerColor = COLOR_GREEN;
        Graphics_HorizontalLine(7, 0, 7, COLOR_GREEN);
    }else if(mCurrentPlayerColor == COLOR_GREEN){
        mCurrentPlayerColor = COLOR_RED;
        Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
    }
}

/**
* @brief    Inserts disc into the appropriate column
*
* The function iserts the disc into @p mGameMatrix, then simulates insertion of the disc into 
* the display. Finnaly, it checks if the disc is inserted successfully.
*
* @param    column    Disc column
* @return   Returns 1 if disc inserted successfully, 0 otherwise
* @note     Reads @p mCurrentPlayerColor and modify @p mGameMatrix, @p mDiscXPosition,
*           @p mDiscYPosition
* @warning  Parameter @p column must be between 1 and 7
*/
unsigned char ConnectFour_InsertDisc(unsigned char column){
    signed char i;
    signed char j;
    // insert disc into game matrix
    for(i = 5; i >= 0; i--){
        if(mGameMatrix[i][column - 1] == COLOR_BLACK){
            mGameMatrix[i][column - 1] = mCurrentPlayerColor;
            mDiscXPosition = i;
            mDiscYPosition = column - 1;
            break;
        }
    }
    // simulate inserting disc on display
    for(j = 0; j < i; j++){
        Graphics_SetPixel(j, column, mCurrentPlayerColor);
        Delay_ms(100);
        Graphics_SetPixel(j, column, COLOR_BLACK);
    }
    // avoid inserting disc at position with index -1
    if(i >= 0){
         Graphics_SetPixel(i, column, mCurrentPlayerColor);
         return 1;
    }else{
         return 0;
    }
}

/**
* @brief    Checks for winner
*
* The function cheks if current player has four disc connected together. The discs can be 
* connected by x or y axis, or by both of diagonales.
*
* @return   Returns 1 if somone wins the game, or 0 otherwise
* @note     Reads @p mGameMatrix, @p mCurrentPlayerColor and modify @p mWinnersDiscsPosition
*/
unsigned char ConnectFour_CheckWinner(){
    signed char i;
    signed char j;
    unsigned char hits = 0;
    // check x axis left
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
    // check x axis right
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
    // reset hits
    hits = 0;
    // check d1 left
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
    // check d1 right
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
    // reset hits
    hits = 0;
    // check d2 left
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
    // check d2 right
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
    // reset hits
    hits = 0;
    // check y axis down
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

/**
* @brief     Turns ON or OFF winners discs
*
* The function turns off winners discs if @p onOff is 0, turns on otherwise.
*
* @param    onOff    Set 0 to turn off discs, 1 otherwise
* @return   This function does not return value
* @note     Reads @p mCurrentPlayerColor, @p mWinnersDiscsPosition
*/
void ConnectFour_TurnWinnersDiscs(unsigned char onOff){
    unsigned char i;
    // turn winners discs on
    if(onOff){
        for(i = 0; i < 4; i++){
            Graphics_SetPixel(mWinnersDiscsPosition[i][0], mWinnersDiscsPosition[i][1] + 1,
            mCurrentPlayerColor);
        }
    }
    // turn winners discs off
    else{
        for(i = 0; i < 4; i++){
            Graphics_SetPixel(mWinnersDiscsPosition[i][0], mWinnersDiscsPosition[i][1] + 1,
            COLOR_BLACK);
        }
    }
}

/**
* @brief    Starts new game
*
* The function sets values of @p mGameMatrix and @p mWinnersDiscsPosition to 0, clears display
* and initializes connecfour game.
*
* @return   This function does not return value
* @note     Modify @p mGameMatrix, @p mWinnersDiscsPosition
*/
void ConnectFour_NewGame(){
    unsigned char i;
    unsigned char j;
    // clear game matrix
    for(i = 0; i < 6; i++){
        for(j = 0; j < 7; j++){
            mGameMatrix[i][j] = 0;
        }
    }
    // clear winners discs positions
    for(i = 0; i < 4; i++){
        for(j = 0; j < 2; j++){
            mWinnersDiscsPosition[i][j] = 0;
        }
    }
    // clear display
    Graphics_ClearDisplay();
    // init connectfour
    ConnectFour_Init();
}