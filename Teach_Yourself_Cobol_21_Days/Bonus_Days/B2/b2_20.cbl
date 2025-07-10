      * Using MOVE CORRESPONDENCE       
       
       FD  SALES-FILE
           LABEL RECORDS ARE STANDARD.
       01  SALES-RECORD.
           05 SALES-STORE          PIC 9(2).
           05 SALES-DIVISION       PIC 9(2).
           05 SALES-DEPARTMENT     PIC 9(2).
           05 SALES-CATEGORY       PIC 9(2).           
           05 SALES-AMOUNT         PIC S9(6)V99.

       01  DETAIL-LINE.
           05 FILLER               PIC X(3) VALUE SPACE.
           05 SALES-DIVISION       PIC Z9.
           05 FILLER               PIC X(4) VALUE SPACE.
           05 FILLER               PIC X(3) VALUE SPACE.       
           05 SALES-DEPARTMENT     PIC Z9.
           05 FILLER               PIC X(6) VALUE SPACE.
           05 FILLER               PIC X(3) VALUE SPACE.
           05 SALES-CATEGORY       PIC Z9.
           05 FILLER               PIC X(4) VALUE SPACE.
           05 SALES-AMOUNT         PIC ZZZ,ZZ9.99-.

           MOVE CORRESPONDING SALES-RECORD TO DETAIL-LINE.
