       IDENTIFICATION DIVISION. 
       PROGRAM-ID. PROBLEMS.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. SELECT SALES-FILE ASSIGN TO DISK1.
			            SELECT PRINT-FILE ASSIGN TO PRINTER. 
       DATA DIVISION. 
       FILE SECTION. 
       FD  SALES-FILE.
       01  SALES-REC.
           05  NAME-IN 			    PICTURE X(15).
           05  AMOUNT-OF-SALES-IN PICTURE 999V99.
       FD  PRINT-FILE.
       01  PRINT-REC.
           05                     PICTURE X(20).
           05 NAME-OUT            PICTURE X(15).
           05                     PICTURE X(20). 
           05 AMT-COMMISSION-OUT  PICTURE 99.99.
           05                     PICTURE X(72).
       WORKING-STORAGE SECTION. 
       01 ARE-THERE-ANY-MORE-RECORDS PICTURE XXX VALUE 'YES'.
       PROCEDURE DIVISION. 
       100-MAIN-MODULE. 
           OPEN INPUT SALES-FILE
             OUTPUT PRINT-FILE
           PERFORM UNTIL ARE-THERE-MORE-RECORDS = 'NO'
               READ SALES-FILE
                   AT END
                       MOVE 'NO' TO ARE-THERE-ANY-MORE-RECORDS
                   NOT AT END
                       PERFORM 200-COMISSION-RTN
               END-READ
           END-PERFORM
           CLOSE SALES-FILE
             PRINT-FILE
           STOP RUN.
       200-COMMISSION-RTN. 
           MOVE SPACES TO PRINT-REC
           MOVE NAME-IN TO NAME-OUT
           IF AMOUNT-OF-SALES-IN IS GREATER THAN 100.
              MULTIPLY .03 BY AMOUNT-OF-SALES-IN 
                   GIVING AMT-COMMISSION-OUT 
           ELSE 
               MULTIPLY .02 BY AMOUNT-OF-SALES-IN 
                   GIVING AMT-COMMISSION-OUT 
           END-IF  
           WRITE PRINT-REC. 
           
   
           
           

           

          

   