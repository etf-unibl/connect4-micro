/**
* @file     timer.c
* @author   Dejan Djekanovic
* @date     09 Aug 2017
* @version  1.0
* @brief    This source file contains functions for working with time.
* It's possible to initialize timer, get current miliseconds and refresh timer value.
*/

#ifndef _TIMER_H_
#define _TIMER_H_

/**
* @brief    Initialize and start timer
*
* The function sets current time to 0, configures and starts timer which used to refresh current
* time.
*
* @return   This function does not return value
* @note     Modify @p mMiliseconds
*/
void Timer_Init();

/**
* @brief    Returns current miliseconds from start of timer
*
* The function return current miliseconds from start of timer.
*
* @return   Curent miliseconds form start of timer
* @note     Reads @p mMiliseconds
*/
unsigned long Timer_Miliseconds();

#endif