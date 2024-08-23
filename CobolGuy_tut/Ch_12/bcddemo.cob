000100*AWK statement to format your COBOL Line Numbers from the terminal:
000200*awk -i inplace '{printf("%04d00%s\n", NR, substr($0,7,120)) }' 
000300*filename.cob
000400 IDENTIFICATION DIVISION.
000500 PROGRAM-ID. BCDDEMO.
000600 AUTHOR. HAL9000.
000700 DATE-WRITTEN. 12/07/2024.
000800 DATE-COMPILED. 12/07/2024.Using GnuCOBOL 3.2.0
000900 REMARKS. This program is a demonstration of BCD.
001000*
001100 ENVIRONMENT DIVISION.
001200 CONFIGURATION SECTION.
001300 SOURCE-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001400 OBJECT-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001500 REPOSITORY.
001600 FUNCTION ALL INTRINSIC. 
001700 INPUT-OUTPUT SECTION.
001800 FILE-CONTROL.
001900 I-O-CONTROL.
002000*
002100 DATA DIVISION.
002200 FILE SECTION.
002300 WORKING-STORAGE SECTION.
002400 77 comp1_Var         usage is comp-1.
002500 77 comp2_Var         usage is comp-2.
002600 77 comp3_Var         pic 9(6)v9(8)        usage is comp-3.
002700
002800 77 display_FloatVar  pic z(4)9.9(2)   usage is display.
002900
003000 77 charArray pic x(32) value spaces.
003100 LOCAL-STORAGE SECTION.
003200 LINKAGE SECTION.
003300*Report and SCREEN sections not available with IBM x86.
003400 REPORT SECTION.
003500 SCREEN SECTION. 
003600*
003700 PROCEDURE DIVISION.
003800     Begin.
003900       DISPLAY "Hello GNU Cobol Using Binary Coded Decimals."
004000       move 100.2 to comp1_Var.
004100       move 100.2 to comp2_Var.
004200       move 100.2 to comp3_Var.
004300       move comp1_Var to display_FloatVar.
004400       Display "#1: Single precision floatpt: ",display_FloatVar.
004500       move comp2_Var to display_FloatVar.
004600       Display "#2 Double precision floatpt: ", display_FloatVar.
004700       move comp3_Var to display_FloatVar.
004800       Display "3 BCD floating point: ", display_FloatVar.
004900       add 3425.92 to  comp3_Var.
005000       move comp3_Var to display_FloatVar.
005100       Display "#4:BCD fltpt with addition: ", display_FloatVar.
005200* use of HEX-OF function displays the hex value (in gnucobol 3.2)       
005300       move function HEX-OF(comp3_Var) to charArray.
005400       DISPLAY "#5:charArray showing hex storage ",charArray.
005500       move 123456.7890 to comp3_Var.
005600       move function HEX-OF(comp3_Var) to charArray.
005700       DISPLAY "#6:charArray with addition ",charArray.
005800       move 123456.7890 to comp2_Var.
005900       move function HEX-OF(comp2_Var) to charArray.
006000       DISPLAY "#7:floatpt in hex using comp2 ",charArray.
006100
006200
006300       STOP RUN.
006400 END PROGRAM BCDDEMO.
006500 
006600
006700  
006800
