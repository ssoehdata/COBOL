000100*AWK statement to format your COBOL Line Numbers from the terminal:
000200*awk -i inplace '{printf("%04d00%s\n", NR, substr($0,7,120)) }' 
000300*filename.cob
000400 IDENTIFICATION DIVISION.
000500 PROGRAM-ID. IFSTATEMENTS.
000600 AUTHOR. HAL9000.
000700 DATE-WRITTEN. 25/06/2024.
000800 DATE-COMPILED. 25/06/2024.
000900 REMARKS. This program is a demonstration of IF STATEMENTS.
001000*
001100 ENVIRONMENT DIVISION.
001200 CONFIGURATION SECTION.
001300 SOURCE-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001400 OBJECT-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001500 INPUT-OUTPUT SECTION.
001600 FILE-CONTROL.
001700 I-O-CONTROL.
001800*
001900 DATA DIVISION.
002000 FILE SECTION.
002100 WORKING-STORAGE SECTION.
002200 77 Var1     USAGE IS COMP-1.
002300 77 Var2     USAGE IS COMP-1.
002400 LOCAL-STORAGE SECTION.
002500 LINKAGE SECTION.
002600*Report and SCREEN sections not available with IBM x86.
002700 REPORT SECTION.
002800 SCREEN SECTION. 
002900*
003000 PROCEDURE DIVISION.
003100       DISPLAY "Examples of IF Statements in Cobol."
003200
003300       move 100 to Var1.
003400       move 200 to var2.
003500* This is the older "verbose" method for writing if statements.
003600       if Var1 is equal to Var2 then
003700         Display "#1:Var1 is equal to Var2"
003800       else 
003900         Display "#1: Var1 is not equal to Var2"
004000       END-IF.
004100
004200       if Var1 is not equal to Var2 then
004300         DISPLAY "#2: Var 1 is not equal to Var2"
004400         move 300 to Var1
004500       else
004600         DISPLAY "#2: Var 1 is equal to Var2"
004700       END-IF.
004800* can also use Var1 = Var2  syntax
004900* Else-If statements
005000       if Var1 is equal to 200 then
005100         DISPLAY "#3: Var 1 is equal to 200"
005200       else if Var1 is equal to 100 then
005300         DISPLAY "#3: Var1 is equal to 100"
005400       else
005500         DISPLAY "#3: Something strange has occurred Dave"
005600       END-IF.
005700* Combined if statements 
005800       move 201 to Var2.
005900       if Var1 is equal to 100 AND Var2 is equal to 200 then
006000         DISPLAY "#4: Var 1 is 100 and Var2 is 200"
006100       else if Var1 is equal to 100 OR Var2 is equal to 201 then
006200         DISPLAY "#4: Var1 is 100 OR Var2 is 201"
006300       else 
006400         DISPLAY "#4: Something strange occurred Dave"
006500
006600
006700       DISPLAY "Program Terminating Dave, thank you."
006800       STOP RUN.
006900
007000
007100  
