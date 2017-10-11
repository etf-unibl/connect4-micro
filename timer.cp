#line 1 "C:/Users/ETF/Desktop/connectfour-develop/timer.c"
#line 1 "c:/users/etf/desktop/connectfour-develop/timer.h"
#line 16 "c:/users/etf/desktop/connectfour-develop/timer.h"
void Timer_Init();
#line 23 "c:/users/etf/desktop/connectfour-develop/timer.h"
unsigned long Timer_Miliseconds();
#line 10 "C:/Users/ETF/Desktop/connectfour-develop/timer.c"
static unsigned long mMiliseconds;
#line 17 "C:/Users/ETF/Desktop/connectfour-develop/timer.c"
void Timer_Init(){
 mMiliseconds = 0;

 TMOD |= 0x10;

 TH1 = 0xFC;
 TL1 = 0xBE;

 IE |= 0x88;

 TR1_bit = 1;
}
#line 35 "C:/Users/ETF/Desktop/connectfour-develop/timer.c"
unsigned long Timer_Miliseconds(){
 return mMiliseconds;
}
#line 44 "C:/Users/ETF/Desktop/connectfour-develop/timer.c"
void Timer_Tick() iv IVT_ADDR_ET1 {

 TR1_bit = 0;

 TH1 = 0xFC;
 TL1 = 0xBE;

 mMiliseconds++;

 TR1_bit = 1;
}
