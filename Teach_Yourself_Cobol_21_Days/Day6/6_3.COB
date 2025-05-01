      * Tuncated Values occur when a value that is too large for a 
      * numeric variable is move to the numerica variable, or when a 
      * value that is too long for an alphanumeric variable is moved 
      * to the alphanumeric variable. The risk is data loss.

      * This program demonstrates the effect of truncation on variables.
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. TRUNC01. 
       ENVIRONMENT DIVISION. 
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 

       01  6-BYTES                 PIC X(6). 
       01  5-BYTES                 PIC X(5). 
       01  4-BYTES                 PIC X(4). 
       01  3-BYTES                 PIC X(3). 
       01  2-BYTES                 PIC X(2). 
       01  1-BYTE                  PIC X(1). 

       01  5-DIGITS                PIC 9(5). 
       01  4-DIGITS                PIC 9(4). 
       01  3-DIGITS                PIC 9(3).
       01  2-DIGITS                PIC 9(2). 
       01  1-DIGIT                 PIC 9(1).

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN.

           MOVE "Hello" TO 4-BYTES. 
           MOVE "Hello" TO 3-BYTES. 
           MOVE "Hello" TO 2-BYTES. 
           MOVE "Hello" TO 1-BYTE. 

           MOVE 2497 TO 5-DIGITS. 
           MOVE 2397 TO 4-DIGITS. 
           MOVE 2397 TO 3-DIGITS. 
           MOVE 2397 TO 2-DIGITS. 
           MOVE 2397 TO 1-DIGIT. 

           DISPLAY 6-BYTES. 
           DISPLAY 5-BYTES. 
           DISPLAY 4-BYTES.
           DISPLAY 3-BYTES. 
           DISPLAY 2-BYTES.
           DISPLAY 1-BYTE. 

           DISPLAY 5-DIGITS. 
           DISPLAY 4-DIGITS. 
           DISPLAY 3-DIGITS. 
           DISPLAY 2-DIGITS. 
           DISPLAY 1-DIGIT. 

       PROGRAM-DONE. 
           STOP RUN. 
        
