000100*Automagically renumber this file any time from the terminal
000200*using the following awk command below. 
000300*in terminal enter:
      *    awk -    then paste the command below followed by file name
      *    (e.g. filename.cob )
      *-i inplace '{printf("%04d00%s\n", NR, substr($0,7,120)) }' filename.cob
      *
      * FOR Linux install gawk to use this
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
002100 LINKAGE SECTION.
002150*Report and SCREEN sections not available with IBM x86.
002200 REPORT SECTION.
002300 SCREEN SECTION. 
002400*
002500 PROCEDURE DIVISION.
026000       DISPLAY "Hello World, from GNU Cobol."
027000       STOP RUN.

        

