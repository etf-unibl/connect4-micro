/**
* @file     graphics.c
* @author   Dejan Djekanovic
* @date     09 Aug 2017
* @version  1.0
* @brief    This source file contains functions for working with graphics elements. 
* It's possible to set a pixel to one of the colors, draw horizontal or vertical line and clear
* entire display.
*/

#ifndef _GRAPHICS_H_
#define _GRAPHICS_H_

typedef enum Color{
     COLOR_BLACK,
     COLOR_RED,
     COLOR_GREEN,
     COLOR_YELLOW
} Color;

/**
* @brief    Sets the pixel of row and column to specified color
*
* The function sets video memory depends on @p row, @p column and @p color values.
*
* @param    row       Discs row
* @param    column    Discs column
* @param    color     Discs color
* @return   This function does not return value
* @note     Modify @p gMatrixRed, @p gMatrixGreen
* @warning  Parameters @p row and @p column must be between 0 and 7
*/
void Graphics_SetPixel(unsigned char row, unsigned char column, Color color);

/**
* @brief    Draws a vertical line on a given column from rowStart to rowEnd
*
* The function draws a vertical line on a given @p column from @p rowStart to @p rowEnd.
*
* @param    column      Line column
* @param    rowStart    Line start row
* @param    rowEnd      Line end row
* @param    color       Line color
* @retuen   This function does not return value
* @warning  Parameters @p column, @p rowStart and @p rowEnd must be between 0 and 7, and
*           @p rowStart must be less then @p rowEnd
*/
void Graphics_VerticalLine(unsigned char column, unsigned char rowStart,  
                           unsigned char rowEnd, Color color);

/**
* @brief    Draws a horizontal line on a given row from columnStar to columnEnd
*
* The function draws a horizontal line on a given @p row from @p columnStart to @p columnEnd.
*
* @param    row            Line row
* @param    columnStart    Line start column
* @param    columnEnd      Line end column
* @param    color          Line color
* @return   This function does not return value
* @warning  Parameters @p row, @p columnStart and @p columnEnd must be between 0 and 7, and
*           @p columnStart must be less then @p columnEnd
*/
void Graphics_HorizontalLine(unsigned char row, unsigned char columnStart, 
                             unsigned char columnEnd, Color color);

/**
* @brief    Clears display
*
* The function clears display, sets video memory @p gMatrixRed and @p gMatrixGreen to 0.
*
* @return   This function does not return value
* @note     Modify @p gMatrixRed, @p gMatrixGreen
*/
void Graphics_ClearDisplay();

#endif