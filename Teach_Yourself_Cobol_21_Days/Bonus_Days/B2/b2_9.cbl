      * Using STRING to put fields together 
       01  DETAIL-LINE.
           05 PRINT-WHOLE-NAME         PIC X(30).

           MOVE SPACE TO DETAIL-LINE. 
           STRING 
               FIRST-NAME DELIMITED BY SPACE 
               MIDDLE-NAME DELIMITED BY SPACE 
               LAST-NAME DELIMITIED BY SPACE 
                   INTO PRINT-WHOLE-NAME. 
               PERFORM PRINT-DETAIL-LINE. 
               
