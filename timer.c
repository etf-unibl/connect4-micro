/**
* @file     timer.c
* @author   Dejan Djekanovic
* @date     09 Aug 2017
* @version  1.0
* @brief    This source file contains functions for working with time.
* It's possible to initialize timer, get current miliseconds and refresh timer value.
*/

#include <timer.h>

static unsigned long mMiliseconds;

/**
* @brief    Initialize and start timer
*
* The function sets current time to 0, configures and starts timer which used to refresh current
* time.
*
* @return   This function does not return value
* @note     Modify @p mMiliseconds
*/
void Timer_Init(){
    mMiliseconds = 0;
    // set timer 1 (gate disable, interval timer, mode 1)
    TMOD |= 0x10;
    // initial values to get interrupt at 1 ms
    TH1 = 0xFC;
    TL1 = 0xBE;
    // enable interrupts (sets EA and ET1)
    IE |= 0x88;
    // run the timer
    TR1_bit = 1;
}

/**
* @brief    Returns current miliseconds from start of timer
*
* The function return current miliseconds from start of timer.
*
* @return   Curent miliseconds form start of timer
* @note     Reads @p mMiliseconds
*/
unsigned long Timer_Miliseconds(){
    return mMiliseconds;
}

/**
* @brief    Increases current time every milisecond
*
* The function is interrupt routine which increases current time evry milisecond.
*
* @return   This function does not return value
* @note     Modify @p mMiliseconds
*/
void Timer_Tick() iv IVT_ADDR_ET1 {
    // stop timer
    TR1_bit = 0;
    // reset timer values to get interrupt at 1 ms
    TH1 = 0xFC;
    TL1 = 0xBE;
    // set current miliseconds
    mMiliseconds++;
    // start timer
    TR1_bit = 1;
}