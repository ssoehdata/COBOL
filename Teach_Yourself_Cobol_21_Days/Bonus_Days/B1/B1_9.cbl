      * The FD for the sales file 

      *-----------------------------------
      * FDSALES.CBL
      * Temporary daily sales file. 
      *-----------------------------------
       FD  SALES-FILE 
           LABEL RECORDS ARE STANDARD.
       01  SALES-RECORD 
           05 SALES-STORE              PIC 9(2).
           05 SALES-DIVISION           PIC 9(2).
           05 SALES-DEPARTMENT         PIC 9(2).
           05 SALES-CATEGORY           PIC 9(2).
           05 SALES-AMOUNT             PIC S9(6)V99. 
           
            