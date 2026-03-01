      * Printing the names 
       01  DETAIL-LINE.
           05 PRINT-FIRST          PIC X(10).
           05 FILLER               PIC X(1).
           05 PRINT-MIDDLE         PIC X(10).
           05 FILLER               PIC X(1).
           05 PRINT-LAST           PIC X(10).

           MOVE SPACE TO DETAIL-LINE. 
           MOVE FIRST-NAME TO PRINT-FIRST. 
           MOVE MIDDLE-NAME TO PRINT-MIDDLE. 
           MOVE LAST-NAME TO PRINT-MIDDLE. 
      * the above appears in the text, but prob should read PRINT-LAST.
           PERFORM PRINT-DETAIL-LINE. 


      *  A better approach is to use the  STRING VERB, which can be 
      * used to concatenate all three fields. 

      * STRING 
      *    value
      *    DELIMITED delimiter
      * INTO variable. 

      * example: 
      *STRING 
      *    FIRST-NAME 
      *LAST-NAME 
      *    DELIMITED BY SPACE 
      *INTO FULL-NAME.

