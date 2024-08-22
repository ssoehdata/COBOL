000100*This ex. covers a 2nd way for 1-D arrays /from video 5/ 
      *This method (vs the one in array.cob) is faster/more accepted
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
       77  OneDimArray occurs 10 times indexed by OD_Index usage comp-1.
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
      *Cobol Arrays begin at 1, so we need to move a 1 to start 
      *The WS_Counter is a way to index the arrays
      *A better method for indexing is to use a var (e.g. ODA_index)
             PERFORM varying OD_Index from 1 by 1 until OD_index > 10
             move OD_Index to OneDimArray(OD_index)
                   
      * A period is not needed after WS_Counter above as it's still in
      * scope of the PERFORM UNTIL function
             END-PERFORM.
             DISPLAY "Displaying the values in the array for you now".
             PERFORM varying OD_Index from 1 by 1 until OD_index > 10
             DISPLAY OneDimArray(OD_Index)             
             END-PERFORM.
027000       STOP RUN.

        

