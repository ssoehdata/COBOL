000100* Fixed version from CobolGuy
      *His comments from 24.3.2024 below: 

      *OK, I'm a bit confused here.  When I run your code, the SIN(90) 
      *displays 1, and when I run that function in my HP calculator, 
      *the sin of 90 degrees returns 1.  
      *So the sin of 90 degrees is indeed 1.
      *The cosin of 90 degrees is zero, but it displays as -4.3711388E-8.  
      *If you change both variables to COMP-2's, then you get more accurate values

      *The SIN of 90 degrees isn't: 0.9999999999999999
      * The SIN of 90 degrees is: 6.123233995736765E-17
      *The values are not exact because of the floating point unit's inability 
      *to represent some numbers 100% accurately.  
      *When in increase the number of bits in the floating point number, 
      *you get greater accuracy, but unlike some C/C++ functions that display 
      *these numbers rounded automatically (printf and cout), 
      *in COBOL you need to purposefully move them to a pic 9 type 
      *variable for display as I did in the code below.

      *You can use rounded within compute to do some rounding for you
      *I changed your code a bit to give better results:
      *Now, SIN(90 degrees) = 1.0 and COS(90) degrees = 0.0.  
      *The reason is because we computed the result as rounded and 
      *placed them in a display variable DisplayFract.

000200
000300 IDENTIFICATION DIVISION.
000400 PROGRAM-ID. SINTEST.
000500 AUTHOR. HAL9000.
000600 DATE-WRITTEN. 23.3.2024.
000700 DATE-COMPILED. 23.3.2024.
000800 REMARKS. This is the COBOL GUY Fix of my code for SINTEST Code.
000900*
001000 ENVIRONMENT DIVISION.
001100 CONFIGURATION SECTION.
001200 SOURCE-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001300 OBJECT-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001400 REPOSITORY.
001500* N.B.:! only add '.' after final function below.
001600     FUNCTION ALL INTRINSIC.
001700*    FUNCTION SIN INTRINSIC
001800*    FUNCTION PI  INTRINSIC.
001900 INPUT-OUTPUT SECTION.
002000 FILE-CONTROL.
002100 I-O-CONTROL.
002200*
002300 DATA DIVISION.
002400 FILE SECTION.
002500 WORKING-STORAGE SECTION.
002600 77 COMP1_VAR1           USAGE IS COMP-2 value 0.
002700 77 RadiansVar           USAGE IS COMP-2 value 0.
002800 77 DisplayFract         PIC z(3)9.9(4).
002900 LINKAGE SECTION.
003000*Report and SCREEN sections not available with IBM x86.
003100 REPORT SECTION.
003200 SCREEN SECTION. 
003300*
003400 PROCEDURE DIVISION.
003500     DISPLAY "This is the Sinfix from the CobolGuy."
003600     add 1 to COMP1_VAR1.
003700     Display "Comp-1 Var-1 is: ", COMP1_VAR1.
003800     compute RadiansVar = (90.0 * FUNCTION PI)/180.0
003900     Display "RadiansVar: ", RadiansVar
004000*This returns a neg value
004100     move SIN(RadiansVar) to COMP1_VAR1.
004200     DISPLAY "The old SIN attempt: ", COMP1_VAR1.
004300     move SIN(RadiansVar) to DisplayFract.
004400     compute DisplayFract ROUNDED = SIN(RadiansVar).
004500     Display "In a display varaible: ", DisplayFract.
004600*This returns 1, in line with SIN function oddly enough..     
004700     move COS(RadiansVar) to COMP1_VAR1.
004800     DISPLAY "The COS of 90 degrees is: ", COMP1_VAR1.
004900     move COS(RadiansVar) to DisplayFract.
005000     compute DisplayFract ROUNDED = COS(RadiansVar).
005100     Display "In a display variable: ", DisplayFract.
005200
005300    
005400     STOP RUN.
005500 END PROGRAM SINTEST.



