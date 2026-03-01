      * Redefining the variable 
    01
       THE-DIVISIONS.

            05 FILLER             PIC 99 VALUE 01.           
            05 FILLER             PIC X(15) VALUE "ATHLETICS".           
            05 FILLER             PIC 99 VALUE 02.           
            05 FILLER             PIC X(15) VALUE "SPORTING GOODS".           
            05 FILLER             PIC 99 VALUE 03.           
            05 FILLER             PIC X(15) VALUE "CAMPING".
       01  FILLER REDEFINES THE-DIVISIONS.           
           05 DIVISION-TABLE OCCURS 3 TIMES           
              INDEXED BY DIVISION-INDEX.           
              10 DIVISION-NUMBER   PIC 99.           
              10 DIVISION-NAME     PIC X(15).
              