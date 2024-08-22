000100*
000200 IDENTIFICATION DIVISION.
000300 PROGRAM-ID. HELLOWORLD.
000400 AUTHOR. HAL9000.
000500 DATE-WRITTEN. 01/03/2024.
000600 DATE-COMPILED. 01/03/2024.
000700 REMARKS. This program is a demonstration of hello world.
000800*
000900 ENVIRONMENT DIVISION.
001000 CONFIGURATION SECTION.
001100 SOURCE-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001200 OBJECT-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001300 INPUT-OUTPUT SECTION.
001400 FILE-CONTROL.
001500 I-O-CONTROL.
001600*
001700 DATA DIVISION.
001800 FILE SECTION.
001900*working-storage section memory is allocated when program starts 
002000 WORKING-STORAGE SECTION.
002100 77   WS_Counter         PIC 9999    value 0.
002200 77   BinaryVar1         PIC 9999    USAGE IS BINARY.
002300* 1-4   9's: 2 Byte Integer
002400* 5-9   9's: 4 Byte Integer
002500* 10-18 9's: 8 Byte Integer
       77  CompVar             PIC S99999  USAGE IS COMP.
      *  The S makes the abve a signed integer
002600 77  CompVar1                        USAGE IS COMP-1.
002700* Comp-1 is single precision floating point (float in c/c++)
002800 77  Comp2Var                        USAGE IS COMP-2.
002900* Comp -2 is a double precision floating point
003000 77  PDecimalVar         PIC 9999   USAGE IS PACKED-DECIMAL.
003100* Comp- 3 is Packed-Decimal and you could also enter COMP-3
003200* in place of 'PACKED-DECIMAL' in the previous line.
003300* COMP-4 is the same as Comp, i.e. binary
003400* DISPLAY same as PIC 9999 with value 0. for display purposes
003500 77  DisplayVar          PIC 9999   USAGE IS DISPLAY.
003600* the above is the  'defualt' for DISPLAY
003700    
003800 LOCAL-STORAGE SECTION.
003900*Local-storage Memory re-allocated each time a funct is called
004000 77  LS_Counter          PIC 9999    value 0.
004100 LINKAGE SECTION.
004200*
004300*A line that needs to be numbered.
004400 REPORT SECTION.
004500 SCREEN SECTION. 
004600*
004700 PROCEDURE DIVISION.
004800     BEGIN.
004900     DISPLAY "From video 4 from series."
005000     DISPLAY "The length of WS Counter is: ",LENGTH OF WS_COUNTER
           DISPLAY "The length of BinaryVar1 is: ",
      -             LENGTH OF BINARYVar1
      *N.B. the above will throw a compiler warning in gnucobol
      * " continuation of COBOL words used" but it runs.
      * this is a way to continue on the next line, by entering space 
      * for the text to push down to next line and entering a '-' 
      * in column 7 (see abDISPLAY "The length of BinaryVar1 is: ",
           DISPLAY "The length of CompVar is: ",LENGTH OF CompVar.
           DISPLAY "The length of Comp2Var is: ",LENGTH OF Comp2Var.
           DISPLAY "The length of PDecimalVar is: ",
      -     LENGTH OF PDecimalVar.
      * The gnucobol compiler adds an extra byte to PDecimal var to
      * store the sign whether or not an "S" is assigned to it,
      * which is why an extra byte is needed to store that nibble
      * (a nibble is 2 bits) if the PIC contains an even number of 9's.
      * This the reason the above displays a length of '3' for PDecimal.
005100     STOP RUN.
005400
