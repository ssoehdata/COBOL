000100*AWK statement to format your COBOL Line Numbers from the terminal:
000200*awk -i inplace '{printf("%04d00%s\n", NR, substr($0,7,120)) }' 
000300*filename.cob
000400 IDENTIFICATION DIVISION.
000500 PROGRAM-ID. MOVEDATA.
000600 AUTHOR. HAL9000.
000700 DATE-WRITTEN. 01/03/2024.
000800 DATE-COMPILED. 01/03/2024. GnuCobol 3.1.2.0
000900 REMARKS. This program is a demonstration for Moving Data.
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
002200*creating a variable - (comp-1 is a floating point)
002300 77 SomeFloat             USAGE IS COMP-1      VALUE IS 0.
      * D for display float for formatting
       77 SomeDFloat            PIC 999.99999        VALUE IS 0.
002400 77 SomeString            PIC X(32)            VALUE IS SPACES.
       77 SomeString2           PIC X(32)            VALUE IS SPACES.

       01 EmployeeData1.
           05 EmployeeID       PIC 9(6)              VALUE IS 9000.
           05 EmployeeFName    PIC x(32)             VALUE IS "HAL".  
           05 EmployeeLName    PIC x(32).
           05 EmployeeZip      PIC 9(6).9(5).

       01 EmployeeData2.
           05 EmployeeID       PIC 9(6).
           05 EmployeeFName    PIC x(32).
           05 EmployeeLName    PIC x(32).
           05 EmployeeZip      PIC 9(6).9(5).
           05 EmployeePhone.
              10 AreaCode      PIC 9(3).  
      * value is zero can be done in place of'move zeros' command below
              10 Exchange      PIC 9(3)        VALUE IS ZERO.   
              10 PhNumber      PIC 9(4).
      * a constant value to move as example       
       78 INTERESTRATE       value 6.5.



002500 LOCAL-STORAGE SECTION. 
002600 LINKAGE SECTION.
002700*Report and SCREEN sections not available with IBM x86.
002800 REPORT SECTION.
002900 SCREEN SECTION. 
003000*
003100 PROCEDURE DIVISION.
003200 BEGIN.
003300       DISPLAY "Moving Data for you Dave."
003400       DISPLAY SomeFloat.
003500       MOVE 10.2 TO SomeFloat.
003600       DISPLAY SomeFloat.
003700
003800       DISPLAY "SomeString is: ", SomeString.
003900       MOVE "Hello Dave" to Somestring.
004000       DISPLAY "SomeString  is: " , Somestring.
             MOVE SomeString to SomeString2.
             DISPLAY "SomeString2 is: ", SomeString2.

             Move SomeFloat to SomeDFloat.
             DISPLAY "SomeDFloat is: ", SomeDFloat.
      *Read a record from file into EmployeeData1 (he'll do this later)
      * below is how you would do this in C
             MOVE  EmployeeID in EmployeeData1 to EmployeeID 
             in EmployeeData2.
             MOVE EmployeeFName in EmployeeData1 to EmployeeFName
             in EmployeeData2.
      
             DISPLAY EmployeeID    in EmployeeData1.
             DISPLAY EmployeeFName in EmployeeData1. 
      *Cobol has this nifty method vs. the c move method above:      
             MOVE corresponding EmployeeData1 to EmployeeData2.
             DISPLAY EmployeeID    in EmployeeData1.
             DISPLAY EmployeeFName in EmployeeData2.
             MOVE ZEROS to AreaCode in EmployeeData2.
      *moving a constant
             MOVE INTERESTRATE TO SomeFloat.
             DISPLAY SomeFloat.
      * below can be done, generally in COBOL use the MOVE function 
      * instead of the compute examples below. 
             COMPUTE SomeFloat = 100.
             COMPUTE SomeFloat = INTERESTRATE.

004100       STOP RUN.
004200 END PROGRAM MOVEDATA.
004300
004400  
004500
