       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMMISSION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SALES-AMOUNT           PIC 99V99.
       01  SALES-COMMISSION        PIC 99V99.
      *01  TAX-INCLUDED           PIC 99V99.
       01  MORE-DATA              PIC XXX  VALUE 'YES'.
       PROCEDURE DIVISION.
       100-MAIN.
           PERFORM UNTIL MORE-DATA = 'NO'
               DISPLAY 'ENTER A SALES AMOUNT AS AN INTEGER'
               ACCEPT SALES-AMOUNT
               COMPUTE SALES-COMMISSION = .12 *
                   SALES-AMOUNT               
               DISPLAY 'COMMISSION ON SALES ', SALES-COMMISSION               
               DISPLAY 'IS THERE MORE INPUT (YES OR NO)?'
               ACCEPT MORE-DATA 
           END-PERFORM
           STOP RUN.

