000100*This ex. covers a structure in an arrays /from video 5/ 
      *this variant adds user inputs for age, weight, name
      *Variable names suck , to make it fit line length...
000200 IDENTIFICATION DIVISION.
000400 PROGRAM-ID. HELLOWORLD.
000500 AUTHOR. HAL9000.
000600 DATE-WRITTEN. 17/03/2024.
000700 DATE-COMPILED. 17/03/2024.
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
      *Let's create an array that is variable in size
      *will call it VaR for variable array 
      *need to also define the array size , will call it Ar_Size
       77  Ar_Sz pic 99 value 0.
       77  VaR occurs 1 to 99 times depending on Ar_Sz
               indexed by VD_Index usage  is comp-1.
       01  StructArray     occurs 10 times indexed by SA_Index.
           05 Name     PIC x(32).
           05 Age          PIC 9999.
           05 Weight       USAGE IS COMP-1.
       LOCAL-STORAGE SECTION. 
      *Local-Storage section mem is reallocated when program starts
002100 LINKAGE SECTION.
002150*Report and SCREEN sections not available with IBM x86.
002200 REPORT SECTION.
002300 SCREEN SECTION. 
002400*
002500 PROCEDURE DIVISION.
           BEGIN.
026000       DISPLAY "Demonstrating Structured Arrays in Cobol.".             
             MOVE 1 to WS_Counter.
             Perform 3 times
             DISPLAY "Please enter the name: " with no advancing
             ACCEPT Name in StructArray(WS_Counter)            
      *       MOVE "HAL" to FullName in StructArray(1).
             DISPLAY "Please enter the age: " with no advancing
             ACCEPT Age in StructArray(WS_Counter)
             DISPLAY "Please enter the weight: " with no advancing
             ACCEPT Weight in StructArray(WS_Counter)
             ADD 1 to WS_Counter
             END-PERFORM
             MOVE 1 to WS_Counter.             
             PERFORM 3 times
             DISPLAY Name(WS_Counter)", ", with no advancing
             DISPLAY Age(WS_Counter),", ", Weight(WS_Counter)
             ADD 1 to WS_Counter
             END-PERFORM.
             
             

      *       MOVE 9000 to Age in StructArray(1). 
      *       MOVE 9000 to Weight in StructArray(1).
      *       DISPLAY FullName(1),", ", Age(1), ", ", Weight(1).
      *       DISPLAY FullName(WS_Counter)", ", Age(WS_Counter), ", ", 
      *       DISPLAY Weight(WS_Counter).
      *       END-PERFORM.             


             DISPLAY "I'm Setting the Values in the array Dave".      
             PERFORM varying OD_Index from 1 by 1 until OD_Index > 10
              move OD_Index to OneDimArray(OD_Index)
             DISPLAY OneDimArray(OD_Index)                
             END-PERFORM.

             DISPLAY "How large is the array? ==> " with no advancing.
             ACCEPT Ar_Sz.
             DISPLAY "Setting the Values in the Array".
             PERFORM varying VD_Index from 1 by 1 until VD_Index > Ar_Sz
               MOVE VD_Index to VaR(VD_Index)                        
             END-PERFORM.       

             DISPLAY "Displaying the values in the array for you now".
             PERFORM varying VD_Index from 1 by 1 until VD_Index > Ar_Sz
             DISPLAY VaR(VD_Index)             
             END-PERFORM.

             DISPLAY "And the 2nd array's size? ==> " with no advancing.
             ACCEPT Ar_Sz.

             DISPLAY "Setting the Values in the Array".
             PERFORM varying VD_Index from 1 by 1 until VD_Index > Ar_Sz
               MOVE VD_Index to VaR(VD_Index)                        
             END-PERFORM.       

             DISPLAY "Displaying the values in the array for you now".
             PERFORM varying VD_Index from 1 by 1 until VD_Index > Ar_Sz
             DISPLAY VaR(VD_Index)             
             END-PERFORM.
027000       STOP RUN.

        

