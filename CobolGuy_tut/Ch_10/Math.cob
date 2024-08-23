000100*From video 10 cobolguy series
000200*AWK statement to format COBOL Line Numbers from the terminal:
000300*awk -i inplace '{printf("%04d00%s\n", NR, substr($0,7,120)) }' 
000400*filename.cob 
000500 IDENTIFICATION DIVISION.
000600 PROGRAM-ID. MATH.
000700 AUTHOR. HAL9000.
000800 DATE-WRITTEN. 23.03.2024.
000900 DATE-COMPILED. 23.03.2024.
001000 REMARKS. This program is a demo of some basic math functions.
001100*
001200 ENVIRONMENT DIVISION.
001300 CONFIGURATION SECTION.       
001400 SOURCE-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001500 OBJECT-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001600* See note about the addition of this REPOSITORY Section below 
001700* in the notes on Instrinsics
001800* Essentially this makes all the Intrinsics available without 
001900* requiring the need for adding "function" in front as in the
002000* absolute value example
002100 REPOSITORY.
002200     FUNCTION ALL INTRINSIC.
002300*N.B.: Alternatively, instead of adding all Intrinics,
002400* you can add only those you want to use: e.g.
002500*    FUNCTION ABS INTRINSIC
002600*    FUNCITON SIN INTRINSIC
002700*    FUNCTION PI INTRINSIC      
002800 INPUT-OUTPUT SECTION.
002900 FILE-CONTROL.
003000 I-O-CONTROL.
003100*
003200 DATA DIVISION.
003300 FILE SECTION.
003400 WORKING-STORAGE SECTION.
003500* let's create a function to add a space to display we can call
003600* this is  constant so we will place this before the variables
003700* this will be in hexadecimal hence the X
003800* in the ascii table 0D0A: D is a carriage return,0A is line feed
003900* or "go to the next line". So 0D  means go to the next line  
004000* and 0A means go to the beginning of that next line
004100 78 CRLF                 value X"0D0A".
004200
004300 77 COMP1_VAR1           USAGE is COMP-1  value 0.
004400 77 COMP1_VAR2           USAGE is COMP-1  value 0. 
       77 COMP1_VAR3           USAGE is COMP-1  value 0.
004500* remember 'z' is a zero suppression 
004600* for this reason if we change the INT var 1 and 2 definitions
004700* here
004800*77 INT_VAR1             pic z(7)9        value 0.
004900* 77 INT_VAR2             pic z(7)9        value 0.
005000* to the following (below) then the display COMPUTE INT_VAR1
005100* function below will display (albeit with a lot of zeroes)
005200 77 INT_VAR1             pic 9(8)        value 0.
005300 77 INT_VAR2             pic 9(8)        value 0.
005400* All trig functions in Cobol Intrinsics are based on radians
005500 77 RadiansVar           USAGE IS COMP-1 value 0.
005600 77 PIover2              USAGE IS COMP-1 value 0.
005700 LINKAGE SECTION.
005800*Report and SCREEN sections not available with IBM x86.
005900 REPORT SECTION.
006000 SCREEN SECTION. 
006100*
006200 PROCEDURE DIVISION.
006300       DISPLAY "Hello World, from GNU Cobol."
006400       DISPLAY "Comp-1 VAR-1 Value is: ", COMP1_VAR1.
006500       add 1 to COMP1_VAR1.
006600       DISPLAY "Comp-1 VAR-1 is: ", COMP1_VAR1.
006700       ADD 2000 to COMP1_VAR1 giving COMP1_VAR2.
006800       DISPLAY "Comp-1 VAR-2 is: ", COMP1_VAR2.             
006900
007000       subtract 2002 from COMP1_VAR2 giving COMP1_VAR1.
007100       DISPLAY "Comp-1 VAR-1 is: ", COMP1_VAR1.
007200* Multiply "by" requires the giving clause if the  by value
007300* is a literal
007400* Multiply literal by Variable does not and the result is placed
007500* in the Variable
007600       multiply COMP1_VAR1 by  -1 giving COMP1_VAR1.
007700       DISPLAY "Comp-1 Value is: ", COMP1_VAR1.
007800
007900       move 123.1234 to COMP1_VAR1.
008000* moving the value into INT will round it up if we add "Rounded"      
008100       multiply COMP1_VAR1 by 2 giving INT_VAR1.
008200       DISPLAY "INT VAR-1 Value is: ", INT_VAR1.
008300
008400             move 123.4234 to COMP1_VAR1.
008500* the above will be rounded up after multiplication now     
008600       multiply COMP1_VAR1 by 2 giving INT_VAR1 ROUNDED.
008700       DISPLAY "INT VAR-1 Rounded Value is: ", INT_VAR1.
008800
008900* Overflow in Integer 
009000       move 12345678 to COMP1_VAR1.
009100       multiply COMP1_VAR1 by 123 giving INT_VAR1
009200*the above will overflow because we are trying to store the 
009300* result in a 9 digit variable that we defined for INT_VAR1  
009400* note: comp-1 will hold the initial 8 digit value, but the 
009500* int var we defined will not   
009600         ON SIZE ERROR DISPLAY "Overflow!"
009700         NOT ON SIZE ERROR Display INT_VAR1.
009800* Let's try it by multiplying by 2
009900         move 12345678 to COMP1_VAR1.
010000         multiply COMP1_VAR1 by 2 giving INT_VAR1        
010100         ON SIZE ERROR DISPLAY "Overflow!"
010200         NOT ON SIZE ERROR Display INT_VAR1.
010300* Division
010400*Nota bene.:
010500*    Divide 'by' requires the giving clause
010600*    Divide 'into' does not require the giving clause     
010700
010800         divide COMP1_VAR1 by 10 giving COMP1_VAR2
010900         DISPLAY "COMP1 VAR-2 Value is: ", COMP1_VAR2.
011000         divide 100 into COMP1_VAR1. 
011100         DISPLAY "COMP1 VAR-1 Value is: ", COMP1_VAR1.
011200* Example of handling and displaying remainders         
011300         move 12345 to INT_VAR1.
011400         divide 10 into INT_VAR1 giving INT_VAR1 
011500              remainder INT_VAR2
011600         DISPLAY "INT VAR1's value is: ", INT_VAR1.
011700         DISPLAY "INT VAR2's (remainder) value is: ", INT_VAR2.
011800* can also do on size and not on size errors for division to
011900* capture underflow or overflow  issues  in integers etc    
012000
012100* 'Compute' statement as a shorthand method to perform the above
012200* functions
012300         compute COMP1_VAR1 = (COMP1_VAR1 * COMP1_VAR2) / 20
012400             ON SIZE ERROR Display "Overflow"
012500             NOT ON SIZE ERROR Display COMP1_VAR1.
012600         DISPLAY "Comp1_VAR1's value is: ", COMP1_VAR1.
012700
012800         compute INT_VAR1 = (INT_VAR1 * INT_VAR2) / 20
012900             ON SIZE ERROR Display "Overflow"
013000             NOT ON SIZE ERROR Display INT_VAR1.
013100         DISPLAY "INT_VAR1's value is: ", INT_VAR1.
013200* the operation below will give an overflow
013300         move 12345678 to INT_VAR1.
013400         move 1000 to INT_VAR2.
013500         compute INT_VAR1 = (INT_VAR1 * INT_VAR2) / 20
013600             ON SIZE ERROR Display "Overflow"
013700             NOT ON SIZE ERROR Display INT_VAR1.
013800         DISPLAY "INT_VAR1's value is: ", INT_VAR1.
013900
014000* Intrinsic Functions examples   
014100* Note: this is before the Repository section with
014200*       "Function ALL INTRINSIC" was added above in the 
014300* Configuration SECTION    
014400         move -123 to INT_VAR1.
014500         DISPLAY "The Absolute value for INT_VAR1 is. ", 
014600* below is how you need to use this before adding the 
014700* ' FUNCTION ALL INTRINSIC "  statement in the Repository Section
014800* in the CONFIGURATION Section above.
014900
015000*            FUNCTION ABS(INT_VAR1).
015100
015200* w/ the Intrisic function we can now write it this way:
015300         ABS(INT_VAR1).
015400
015500* some compilers will not compile w a function that takes no args
015600* in other words the empty() after PI below. 
015700* GNUCobol compiles this  however
      *  Check to see if COMP1_VAR1 is positive 1
               move 1 to COMP1_VAR3.
               DISPLAY "value for COMP1_VAR3 is now: ", COMP1_VAR3.
015800         compute RadiansVar = (90.0 * PI())/180.0
015900         move SIN(RadiansVar) to COMP1_VAR3.
016000* Formatting - to create a new line you can add DISPLAY " ". 
016100* This will add a space between the output      
016200* OR, you can create a variable for adding a space like "new line"  
016300         DISPLAY " ".
               DISPLAY "value of comp1_Var3 is: " COMP1_VAR3.
016400         DISPLAY "The SIN of 90 degrees is: ", COMP1_VAR3.
016500* using the function we created to add a space and new line:         
016600         DISPLAY CRLF , "SIN of 90 degr is: ", COMP1_VAR3,
016700          CRLF.
016800* the second CRLF. can be added to aadd an additional blank line
016900* before the end of the output displayed
017000**** N.B.:! You need to add a comma after the COMP1_VAR1 (in this
017100*   example) and then finish the statement after CRLF w/ a "."
017200        DISPLAY "value of PI is: ", PI,
              CRLF.
              
017300        compute PIover2 = (PI/2)
017400        DISPLAY " PI over 2 is: ", PIover2, CRLF.
017500
017600
017700
017800       STOP RUN.
017900 END PROGRAM MATH.
018000
018100  
018200
