       IDENTIFICATION DIVISION.
       PROGRAM-ID. SAMPLE.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. SELECT EMPLOYEE-DATA      ASSIGN TO EMP-DAT.
                     SELECT PAYROLL-LISTING    ASSIGN TO PRINTER.
       DATA DIVISION.
       FILE SECTION.
       FD  EMPLOYEE-DATA.
       01  EMPLOYEE-RECORD.
           05 EMPLOYEE-NAME-IN         PICTURE X(20).
           05 HOURS-WORKED-IN          PICTURE 9(2).
           05 HOURLY-RATE-IN           PICTURE 9V99.
       FD  PAYROLL-LISTING.
       01  PRINT-REC.
           05                          PICTURE X(20).
           05 NAME-OUT                 PICTURE X(20).
           05                          PICTURE X(10).
           05 HOURS-OUT                PICTURE 9(2).
           05                          PICTURE X(8).
           05 RATE-OUT                 PICTURE 9.99.
           05                          PICTURE X(6).
           05 WEEKLY-WAGES-OUT         PICTURE 999.99.
       WORKING-STORAGE SECTION.
       01  ARE-THERE-MORE-RECORDS      PICTURE XXX VALUE 'YES'.
       PROCEDURE DIVISION.
       100-MAIN-MODULE.
           OPEN INPUT EMPLOYEE-DATA    
                OUTPUT PAYROLL-LISTING
           PERFORM UNTIL ARE-THERE-MORE-RECORDS = 'NO'
               READ EMPLOYEE-DATA 
                   AT END 
                       MOVE 'NO' TO ARE-THERE-MORE-RECORDS
                   NOT AT END 
                       PERFORM 200-WAGE-ROUTINE 
                END-READ 
           END-PERFORM 
           CLOSE EMPLOYEE-DATA 
                 PAYROLL-LISTING 
           STOP RUN.
       200-WAGE-ROUTINE.
           MOVE SPACES TO PRINT-REC 
           MOVE EMPLOYEE-NAME-IN TO NAME-OUT 
           MOVE HOURS-WORKED-IN TO RATE-OUT 
           MOVE HOURLY-RATE-IN TO RATE-OUT
           MULTIPLY HOURS-WORKED-IN BY HOURLY-RATE-IN 
                   GIVING WEEKLY-WAGES-OUT 
           WRITE PRINT-REC.
           
                            



       
           