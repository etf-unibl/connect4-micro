
# Connect four - Using 8051 microcontroller

Copyright © 2017 Faculty of Electrical Engineering - www.etf.unibl.org

### Introduction
This poject show how to make [connect four game](https://en.wikipedia.org/wiki/Connect_Four) using microcontroller 8051 and RGB LED dot matrix display. The document contains instructions how to build the project from ground, hardware components and software used in this project. They describe all steps needed to make hardware layer. It contains instructions how to flash code to microcontroller and play game after completing previous steps.

### Hardware
This section show which hardware components was needed to make hardware layer for this game.
Hardware layer contains next components:
* AT89S8253 microcontroller
* Easy8051 v6 development board *
* RGB dot LED matrix display
* 4 x 4 keyboard
* 2 x ULN2803A transistor array (sink type)
* 1 x TD62783AGP transistor array (source type)
* 24 x 10K resistors
* 8 x 150R resistors
* 8 x 50R resistors

[This picture](resources/images/connect_four_scheme.jpg) show how to connect all these components together. Jumpers for port P0, P1, P2 and P3 of development board must be connected to pull up and all switches must be on which shown in [this picture](resources/images/dev_board_port_switches.jpg). If you use Easy8051 development kit you don't need 10K resistors.

### Software
This section show which software used for this project.
Required software:
* [MikroC for 8051](https://www.mikroe.com/mikroc/#8051)
* [8051FLASH](https://www.mikroe.com/mikroc/#8051)
* [source code](https://github.com/djn21/connectfour)

Instruction for using [MikroC for 8051](http://download.mikroe.com/documents/compilers/mikroc/8051/mikroc-8051-manual-v100.pdf) and  [8051FLASH](https://download.mikroe.com/documents/programmers-debuggers/other/8051prog2/8051flash-programmer-manual-v100.pdf).

### User guide
After all components has been connected together, next step is to compile source code and flash [connectfour.hex](connectfour.hex) file to microcontroller. For [flashing code to microcontroller](https://download.mikroe.com/documents/programmers-debuggers/other/8051prog2/8051flash-programmer-manual-v100.pdf) use 8051FLASH software. 

After successfully flashing you will see [this picture](resources/images/game_after_init.jpg) on matrix display. Now you able to play game using keyboard connected to development board. Keys 1 to 7 used to put the disc in the appropriate column. After one of players get four connected discs you will see the discs turn [ON](resources/images/winners_discs_on.jpg) and [OFF](resources/images/winners_discs_off.jpg) with interval of 500 ms. This indicate that one of player wins the game. Now, by pressing D button you will start a new game.

**\*** You don't need to use Easy8051v6 development board. Instead, you will need 10kHz clock oscillator, voltage source of 5 V for microcontroller and programmer kit for 8051 microcontroller familly.
