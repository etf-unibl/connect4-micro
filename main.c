#include <timer.h>
#include <display.h>
#include <graphics.h>
#include <connectfour.h>

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

    // repeat until die :)
    do{
        do{
            // wait until 1...7  or D (new game) is pressed
            do{
                keyIndex = Keypad_Key_Click();
                key = keys[keyIndex];
            } while(key != 'D' && (key < '1' || key > '7'));
            // if D (new game) is pressed
            if(key == 'D'){
                ConnectFour_NewGame();
                break;
            }
            // if 1 to 7 pressed
            discInserted = ConnectFour_InsertDisc(key - 48);
        }while(!discInserted);
        // is not new game
        if(key != 'D'){
            // check winner
            hasWinner = ConnectFour_CheckWinner();
            // has winner
            if(hasWinner){
                startTime = Timer_Miliseconds();
                do{
                    stopTime = Timer_Miliseconds();
                    // turn on winners discs  500 ms
                    if(stopTime - startTime < 500){
                        ConnectFour_TurnWinnersDiscs(1);
                    }
                    // turn off winners discs 500 ms
                    else if(stopTime - startTime < 1000){
                        ConnectFour_TurnWinnersDiscs(0);
                    }
                    // reset time
                    else{
                        startTime = Timer_Miliseconds();
                    }
                    // wait until D (new game) is pressed
                    keyIndex = Keypad_Key_Click();
                    key = keys[keyIndex];
                }while(key != 'D');
                // new game
                ConnectFour_NewGame();
            }
            // has not winner
            else{
                // switch player
                ConnectFour_SwitchPlayer();
            }
        }
    }while(1);

}