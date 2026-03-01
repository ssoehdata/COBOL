      *Converting data to uppercase 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. UPPER01. 
      *-------------------------------------
      * Converts input to upper  case. 
      *-------------------------------------
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 

       DATA DIVISION. 
       FILE SECTION. 

       WORKING-STORAGE SECTION. 

       77  UPPER-ALPHA                     PIC X(26) VALUE   
               "ABCDEFGHIJKLMNOPQRSTUVWXYZ".

       77  LOWER-ALPHA                     PIC X(26) VALUE  
               "abcdefghijklmnopqrstuvwxyz".

       77  TEST-FIELD                      PIC X(30) VALUE SPACE. 
       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 
           PERFORM ENTER-TEST-FIELD. 
           PERFORM CONVERT-AND-ENTER 
               UNTIL TEST-FIELD = SPACE. 

       PROGRAM-DONE.
           STOP RUN. 

       ENTER-TEST-FIELD. 
           DISPLAY "Enter upper of lower case data".
           DISPLAY "Leave blank to end".
           ACCEPT TEST-FIELD. 
       CONVERT-AND-ENTER. 
           PERFORM CONVERT-TEST-FIELD. 
           PERFORM ENTER-TEST-FIELD. 

       CONVERT-TEST-FIELD. 
           INSPECT TEST-FIELD CONVERTING   
               LOWER-ALPHA TO UPPER-ALPHA. 
           DISPLAY TEST-FIELD. 


       
      *The INSPECT CONVERTING command will perform
      * a character-by-character translation of a field.
      *The syntax is the following:

      *INSPECT alphanumeric variable
      *CONVERTING compare value
      *TO replace value.
      *Here is an example:
      *CONVERT-TO-UPPER.
      *INSPECT DATA-FIELD
      *CONVERTING LOWER-ALPHA
      *TO
      *UPPER-ALPHA
      