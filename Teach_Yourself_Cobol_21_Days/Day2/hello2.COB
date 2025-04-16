       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO2.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION. 

       01  THE-NAME            PICTURE IS XXXXXXXXXXX.

       PROCEDURE DIVISION. 

       PROGRAM-BEGIN.
           DISPLAY "Enter someone's name.".
           ACCEPT THE-NAME.
           DISPLAY "Hello  " THE-NAME.

       PROGRAM-DONE.
           STOP0-RUN.
           

