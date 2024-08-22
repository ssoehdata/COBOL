000100*AWK statement to format your COBOL Line Numbers from the terminal:
      *awk -i inplace '{printf("%04d00%s\n", NR, substr($0,7,120)) }' 
      *filename.cob
000200 IDENTIFICATION DIVISION.
000400 PROGRAM-ID. DisplayAccept.
000500 AUTHOR. HAL9000.
000600 DATE-WRITTEN. 01.04.2024.
000700 DATE-COMPILED.01.04.2024.Compiler:GnuCobol 3.1.2.0 C ver. 11.2.0
000800 REMARKS. This program demonstrates Display and Accept.
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
       77 WS_Counter                pic 9999        value 0. 
       77 InputFloat                pic z(3)9.99    value 0.
       77 WorkingFloat              usage is comp-2 value 100.22.
       77 FinalFloat                usage is comp-2.
       77 FullName                  pic x(32).
002100 LOCAL-STORAGE SECTION.
       77 LS_Counter                pic 9999        value 0. 
       
002150*Report and SCREEN sections not available with IBM x86.
002200 REPORT SECTION.
002300 SCREEN SECTION. 
002400*
002500 PROCEDURE DIVISION.
026000       DISPLAY "Display & Accept Example."
             DISPLAY "Enter a floating point number: "with no advancing.
             ACCEPT InputFloat.
             DISPLAY "Dave, your FloatNumber is: " InputFloat.
             MOVE InputFloat to FInalFloat.
             MOVE 100.22 to WorkingFloat
             Multiply FinalFloat by WorkingFloat giving FinalFloat.
             DISPLAY "Your number multplied by 100.22 is: " FinalFloat.
             DISPLAY "Enter your name: " with no advancing. 
             ACCEPT FullName.
             DISPLAY "Thank you for your cooperation " FullName. 
027000       STOP RUN.
       END PROGRAM DisplayAccept. 

        

