      *Using the PERFORM verb
000100 IDENTIFICATION DIVISION. 
000200 PROGRAM-ID. HELLO04.
      *This program illustrates the use of a PERFORM. 
000300 ENVIRONMENT DIVISION. 
000400 DATA DIVISION. 
000500 PROCEDURE DIVISION.
000900 
000100 PROGRAM-BEGIN. 
001100     DISPLAY " TODAY'S MESSAGE IS:".
      * the PERFORM verb directs the program to locate the paragraph
      * SAY-HELLO. When it has finished, it returns to the end of 
      * this sentence(PERFORM SAY-HELLO)
001200     PERFORM SAY-HELLO. 
001300
001400 PROGRAM-DONE.
001500     STOP RUN. 
001600
001700 SAY-HELLO.
001800     DISPLAY "HELLO.".
001900
      * Whenever a paragraph ends because of an end-of-file (EOF) or
      * because a new paragraph starts, COBOL checks whether it is in 
      * the middle of a PERFORM routine. If it is, it returns to the 
      * line that requested  the PERFORM. 

      * In this example, the SAY-HELLO paragraph ends, and the 
      * the execution continues at the end of line 001200.
      * As their are no further instructions on that line execution
      * continues at line 001400. 
      