000100*AAAABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBIIIIIIIII
000200 IDENTIFICATION DIVISION.
000400 PROGRAM-ID. HELLOWORLD.
000500 AUTHOR. HAL9000.
000600 DATE-WRITTEN. 01/03/2024.
000700 DATE-COMPILED. 01/03/2024.
000800 REMARKS. This program is a demonstration of hello world.
      ****************************************************************
000900*Naming variables in Cobol: can  begin w A-Z,a-z,0-9,-,_
      * may begin w a digit as long as there are letters within the
      * variable name. 
      * Must contain at least 1 letter. No diff between upper/lower 
      * case letters. E.g.: "SomeVariable" and "SOMEVARIABLE" will be
      * treated as same variable name.
      *Avoid beg variables with a digit.
      ****************************************************************
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
       01  EmployeeData.    
         05   EmployeeName.   
           10   FirstName        PIC X(18).
           10   LastName         PIC X(32).
           10   MiddleInitial    PIC A.
         05   EmployeeAddress.
           10  HouseNumber       PIC ZZZZ9     value 0.     
           10  Street            PIC X(24).
           10  ZipCode.
                15 ZCFirst       PIC 9(5)      value 0.  
                15 ZCSecond      PIC 9(4)      value 0.  
         05   EmployeePayInfo.
           10  HourlyRate        PIC 999v99    value 0.0.
         05   EmpDOB.
           10  EmpDOBYear        PIC 9999      value 0.
           10                    PIC X         value "/".                    
           10  EmpDOBMonth       PIC 99        value 0. 
           10                    PIC X         value "/".                  
           10  EmpDOBDay         PIC 99        value 0. 
         05   Married            PIC X.
      *Datatype 88 is for enumerated values.
           88 EMPMarried         value 'Y', 'y'.
           88 EmpSingle          value 'N', 'n'.
      *Datatype 77 is for unstructured data.      
       77  LoopCounter           PIC 9999.
       77  TempMonth             PIC 99.
       77  TempYear              PIC 9999.
       77  TempDay               PIC 99.   
      *Can use level 0f 78 to create a constant.
       78  MonthsInYear          value 12.
      *Another way to create a constant is to use level 1.
       01  DaysInJanuary         constant as 31.       
       77  SOMEVARIABLE          PIC 99.
002100 LINKAGE SECTION.
002150*Report and SCREEN sections not available with IBM x86.
002200 REPORT SECTION.
002300 SCREEN SECTION. 
002400*
002500 PROCEDURE DIVISION.
026000        DISPLAY "working".   
              DISPLAY EmpDOB.
              move 2023 to EmpDOBYear.
              move 12 to EmpDOBMonth.
              move 25 to EmpDOBDay.
              Display EmpDOB.
              move 'y' to Married. 
              IF EmpMarried THEN
                    Display "Employee is Married" 
              ELSE  
                    Display "Employee is not Married"
              END-IF.  
              DISPLAY MonthsInYear. 
              DISPLAY DaysInJanuary.              
              move 20  to SOMEVARIABLE 
              DISPLAY SomeVariable.                   
027000        STOP RUN.

        

