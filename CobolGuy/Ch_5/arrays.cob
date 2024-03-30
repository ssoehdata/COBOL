000100*This example covers 1-D arrays /from video 5 of the series. 
000200 IDENTIFICATION DIVISION.
000400 PROGRAM-ID. HELLOWORLD.
000500 AUTHOR. HAL9000.
000600 DATE-WRITTEN. 01/03/2024.
000700 DATE-COMPILED. 01/03/2024.
000800 REMARKS. This program is a demonstration of hello world.
000900*
001000 ENVIRONMENT DIVISION.
001100 CONFIGURATION SECTION.
001200 SOURCE-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001300 OBJECT-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001400 INPUT-OUTPUT SECTION.
001500 FILE-CONTROL.
001600 I-O-CONTROL.
001700*
001800 DATA DIVISION.
001900 FILE SECTION.
002000 WORKING-STORAGE SECTION.
      *     Working-Storage section mem alloc when program starts
       77  WS_Counter        PIC 9999        value 0.
      * float OneDimArray[10].
       77  OneDimArray occurs 10 times usage is comp-1.
       LOCAL-STORAGE SECTION. 
      *Local-Storage section mem is reallocated when program starts
002100 LINKAGE SECTION.
002150*Report and SCREEN sections not available with IBM x86.
002200 REPORT SECTION.
002300 SCREEN SECTION. 
002400*
002500 PROCEDURE DIVISION.
           BEGIN.
026000       DISPLAY "Demonstrating Arrays in Cobol."
             DISPLAY "I'm Setting the Values in the array Dave".
      *PERFORM is like a loop function
      *Cobol Arrays begin at 1, so we need to move a 1 to start i
             MOVE 1 to WS_Counter.
             PERFORM UNTIL WS_Counter > 10
             move WS_Counter to OneDimArray(WS_Counter)
             ADD 1 to WS_Counter
             
      * A period is not needed after WS_Counter above as it's still in
      * scope of the PERFORM UNTIL function
             END-PERFORM.
             DISPLAY "Displaying the values in the array for you now".
             move 1 to WS_Counter.
             perform until WS_Counter > 10
             DISPLAY OneDimArray(WS_Counter)
             add 1 to WS_Counter
             END-PERFORM.
027000       STOP RUN.

        

