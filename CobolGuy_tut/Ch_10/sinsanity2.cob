000100*Removed the COS Intrinsic function cross tests
000200 IDENTIFICATION DIVISION.
000300 PROGRAM-ID. SINSANITY2.
000400 DATE-WRITTEN. 24/03/2024.
000500 DATE-COMPILED. 24/03/2024.
000600 REMARKS. Additional SIN function test without COS tests.
000700*
000800 ENVIRONMENT DIVISION.
000900 CONFIGURATION SECTION.
001000 SOURCE-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001100 OBJECT-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001200 REPOSITORY.
001300     FUNCTION ALL INTRINSIC.
001400 INPUT-OUTPUT SECTION.
001500 FILE-CONTROL.
001600 I-O-CONTROL.
001700
001800 DATA DIVISION.
001900 FILE SECTION.
002000 WORKING-STORAGE SECTION.
002100 77 COMP2_VAR2           USAGE IS COMP-2 value 0.
002200 77 RadiansVar           USAGE IS COMP-2 value 0.
002300 77 DisplayFract         PIC z(3)9.9(4).
002400 LINKAGE SECTION.
002500 REPORT SECTION.
002600 SCREEN SECTION.
002700
002800 PROCEDURE DIVISION.
002900     DISPLAY "Sanity2 check for SIN Intrinsic function."
003000     add 1 to COMP2_VAR2.
003100     DISPLAY "Comp-2 Var-2 is: ", COMP2_VAR2.
003200     compute RadiansVar = (90.0 * FUNCTION PI)/180.0
003300     DISPLAY "RadiansVar: ", RadiansVar
003400     move SIN(RadiansVar) to COMP2_VAR2.
003500     DISPLAY "Initial SIN 90deg attempt COMP2: ", COMP2_VAR2.
003600     move SIN(RadiansVar) to DisplayFract.
003700     compute DisplayFract ROUNDED = SIN(RadiansVar).
003800     DISPLAY "In a display variable: ", DisplayFract.
003900     
004000     STOP RUN.
004100 END PROGRAM SINSANITY2.
004200
004300  
004400
