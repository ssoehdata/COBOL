      *This program demonstrates spreading out sentences
      *A sentence continues untila period is encountered, regardless
      *of the number of lines it takes.
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. JACK03.
       ENVIRONMENT DIVISION.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  THE-MESSAGE             PIC X(50).
       01  THE-NUMBER              PIC 9(2).
       01  A-SPACE                 PIC X.

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 
      * Intitialize the space variable. 
           MOVE " " TO A-SPACE.
      *Set up and display line 1
           MOVE 1 TO THE-NUMBER. 
           MOVE "Jack be nimble," TO THE-MESSAGE. 
           display     
               THE-NUMBER
               A-SPACE 
               THE-MESSAGE.

      *Set up and display line 2 
           ADD 1 TO THE-NUMBER.
           MOVE "Jack be quick," TO THE-MESSAGE.
           display 
               THE-NUMBER 
               A-SPACE 
               THE-MESSAGE.
      *Set up and display line 3 
               ADD 1 TO THE-NUMBER.
               MOVE "Jack jump over the candlestick." TO THE-MESSAGE.
               display     
                   THE-NUMBER
                   A-SPACE 
                   THE-MESSAGE.
       PROGRAM-DONE.
           STOP RUN.
