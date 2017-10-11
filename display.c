/**
* @file     display.c
* @author   Dejan Djekanovic
* @date     09 Aug 2017
* @version  1.0
* @brief    This source file contains functions for working with display.
* It's possible to initialize display, set output display ports and refresh display content.
*/

#include <display.h>

static char mRowOutputPort at P1;
static char mRedOutputPort at P2;
static char mGreenOutputPort at P3;

static const unsigned char gMatrixRow[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};

/**
* Video memory for red color.
*/
unsigned char gMatrixRed[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

/**
* Video memory for green color.
*/
unsigned char gMatrixGreen[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

/**
* @brief    Initializes display
*
* The function sets output ports to 0, configures and starts timer which used to refresh display.
*
* @return   This function does not return value
* @note     Modify @p mRowOutputPort, @p mRedOutputPort, @p mGreenOutputPort
*/
void Display_Init(){
    // init ports
    mRowOutputPort = 0x00;
    mRedOutputPort = 0x00;
    mGreenOutputPort = 0x00;
    // set timer 0 (gate disable, interval timer, mode 1)
    TMOD |= 0x01;
    // initial values to get interrupt at 2 ms
    TH0 = 0xF9;
    TL0 = 0x7D;
    // enable interrupts (sets EA and ET0)
    IE |= 0x82;
    // run the timer
    TR0_bit = 1;
}

/**
* @brief    Sets display rows and colors matrix
*
* The function turns off all ports to avoid ghosts, then sets output ports to appropriate
* values.
*
* @param    row      Output value for row port
* @param    red      Output value for red color port
* @param    green    Output value for green color port
* @return   This function does not return value
* @note     Modify @p mRowOutputPort, @p mRedOutputPort, @p mGreenOutputPort
*/
void Display_SetOutput(unsigned char row, unsigned char red, unsigned char green){
    // turn off ports to avoid ghosts
    mRowOutputPort = 0x00;
    mRedOutputPort = 0x00;
    mGreenOutputPort = 0x00;
    // set colors
    mRedOutputPort = red;
    mGreenOutputPort = green;
    // set row
    mRowOutputPort = row;
}

/**
* @brief    Refreshes display
*
* The function is interrupt routine which refreshes the display every 2 miliseconds.
*
* @return   This function does not return value
* @note     Reads @p gMatrixRow, @p gMatrixRed, @p gMatrixGreen
*/
void Display_Refresh() iv IVT_ADDR_ET0 {
    static unsigned char i = 0;
    // stop timer
    TR0_bit = 0;
    // reset timer values to get interrupt at 2 ms
    TH0 = 0xF9;
    TL0 = 0x7D;
    // set output ports
    Display_SetOutput(gMatrixRow[i], gMatrixRed[i], gMatrixGreen[i]);
    i++;
    // reset row count
    if(i == 8){
        i = 0;
    }
    // start timer
    TR0_bit = 1;
}