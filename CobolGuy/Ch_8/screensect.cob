000100*AWK statement to format your COBOL Line Numbers from the terminal:
      *awk -i inplace '{printf("%04d00%s\n", NR, substr($0,7,120)) }' 
      *filename.cob
000200 IDENTIFICATION DIVISION.
000400 PROGRAM-ID. SCREENSECTION.
000500 AUTHOR. HAL9000.
000600 DATE-WRITTEN. 02.4.2024.
000700 DATE-COMPILED. 02.4.2024.
000800 REMARKS. This program is a demonstration of Screen Section.
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
       77 WS_Counter            pic 9999      value 0. 
       77 WS-NameEntry          pic x(32)     value SPACES.
      * 77 WS-NameDisplay        pic x(34).
       77 WS-EntryValue1        usage is comp-2.
       77 WS-EntryValue2        usage is comp-2.
       77 WS-TotalValue         usage is comp-2.
002100 LOCAL-STORAGE SECTION.
       77 LS_Counter               pic 9999      value 0.
002150*Report and SCREEN sections not available with IBM x86.
002200*REPORT SECTION.
002300 SCREEN SECTION. 
           01 Data-Entry-Screen.
      * you can determine the line and column where it appears in the
      * the manner below.
               05 TitleLine            LINE 1 COLUMN 35
                           VALUE "Data Entry Screen".
               05 NameText            LINE 3 COLUMN 10
                           VALUE "Enter your Name (Quit to exit) ==>".
      *Hint: by using COLUMN plus n, you don't need to count columns to
      *place the entry field 'n' columns after the last entry. 
      *Example COLUMN PLUS 2 places the NameEntry field 2 columns to the
      *right of the NameText field.                     
               05 NameEntry           pic x(32) LINE 3 COLUMN 45
                           using WS-NameEntry.
               05 EntryValueLabel1     LINE 4 COLUMN 10
                           VALUE "Enter a value here ===> ".
      *adding the '+' in front of the pic value allows for signed values
               05 EntryValue1         pic +9(4).99 LINE 4 COLUMN 35
                           using WS-EntryValue1.
               05 EntryValueLabel2     LINE 5 COLUMN 10
                           VALUE "Enter a value here ===> ".
               05 EntryValue2         pic +9(4).99 LINE 5 COLUMN 35               
                           using WS-EntryValue2.  
               05 SumLabel            LINE 7   COLUMN 10
                           VALUE "The summed Value ===> ".
               05 SumValue            pic 9(4).99 LINE 7   COLUMN 35.
               05 StatusText          LINE 20  COLUMN 2
                           VALUE "Status: ".
               05 NameDisplay         pic x(34) LINE 20 COLUMN 10.
      *adding this (and the def in the ws-section) allows us to tab
      *back and forth between the two fields "enter your name "
      * and 'status"
      *                       using WS-NameDisplay. 
      * but since this is not an area for user input, I commented it out.
002400*
002500 PROCEDURE DIVISION.
       BEGIN.
026000     DISPLAY "Hello World, from GNU Cobol."
      *Creating a loop to keep program running for user to continue 
      *inputting data. 
       Perform until WS-NameEntry equal 'Quit'
           DISPLAY DATA-ENTRY-SCREEN 
           ACCEPT Data-Entry-Screen
           MOVE WS-NameEntry to NameDisplay
           ADD WS-EntryValue1 to WS-EntryValue2 giving WS-TotalValue
           MOVE WS-TotalValue to SumValue
       End-Perform. 
027000 STOP RUN.
       END PROGRAM SCREENSECTION.

        

