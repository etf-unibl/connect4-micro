/**
* @file     display.c
* @author   Dejan Djekanovic
* @date     09 Aug 2017
* @version  1.0
* @brief    This source file contains functions for working with display.
* It's possible to initialize display, set output display ports and refresh display content.
*/

#ifndef _DISPLAY_H_
#define _DISPLAY_H_

/**
* @brief    Initializes display
*
* The function sets output ports to 0, configures and starts timer which used to refresh display.
*
* @return   This function does not return value
* @note     Modify @p mRowOutputPort, @p mRedOutputPort, @p mGreenOutputPort
*/
void Display_Init();

#endif