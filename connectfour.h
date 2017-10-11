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

#ifndef _CONNECTFOUR_H_
#define _CONNECTFOUR_H_

/**
* @brief    Initializes connectfour
*
* The function sets the color of the current player and draws a horizontal line showing which
* player is on the move.
*
* @return   This function does not return value
* @note     Modify @p mCurrentPlayerColor
*/
void ConnectFour_Init();

/**
* @brief    Switches between red and green player
*
* The function checks if current player color is red or green and changes value of
* @p mCurrentPlayerColor to color of another player.
*
* @return   This function does not return value
* @note     Modify @p mCurrentPlayerColor
*/
void ConnectFour_SwitchPlayer();

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
unsigned char ConnectFour_InsertDisc(unsigned char column);

/**
* @brief    Checks for winner
*
* The function cheks if current player has four disc connected together. The discs can be
* connected by x or y axis, or by both of diagonales.
*
* @return   Returns 1 if somone wins the game, or 0 otherwise
* @note     Reads @p mGameMatrix, @p mCurrentPlayerColor and modify @p mWinnersDiscsPosition
*/
unsigned char ConnectFour_CheckWinner();

/**
* @brief     Turns ON or OFF winners discs
*
* The function turns off winners discs if @p onOff is 0, turns on otherwise.
*
* @param    onOff    Set 0 to turn off discs, 1 otherwise
* @return   This function does not return value
* @note     Reads @p mCurrentPlayerColor, @p mWinnersDiscsPosition
*/
void ConnectFour_TurnWinnersDiscs(unsigned char onOff);

/**
* @brief    Starts new game
*
* The function sets values of @p mGameMatrix and @p mWinnersDiscsPosition to 0, clears display
* and initializes connecfour game.
*
* @return   This function does not return value
* @note     Modify @p mGameMatrix, @p mWinnersDiscsPosition
*/
void ConnectFour_NewGame();

#endif