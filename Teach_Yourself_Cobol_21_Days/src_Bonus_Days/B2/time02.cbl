      * A calling program 

      ***************************************
      * compile together with time02.cbl :
      * cobc -x time02.cbl timedit.cbl 
      * then run time02
      *****************************************
       IDENTIFICATION DIVISION.
000200 PROGRAM-ID. TIME02.
000300*--------------------------------
000400* Testing Time Entry and handling
000500*--------------------------------
000600 ENVIRONMENT DIVISION.
000700 INPUT-OUTPUT SECTION.
000800 FILE-CONTROL.

001000 DATA DIVISION.
001100 FILE SECTION.

001300 WORKING-STORAGE SECTION.

001500 77 ANY-TIME  PIC 9(6) VALUE ZEROES.

001700 77 ANY-FORMATTED  PIC X(8).

001900 77 FORMATTED-TIME  PIC Z9/99/99.

002100 77 THE-TIME  PIC 9(6).

002300 77 ZERO-IS-OK  PIC X VALUE "N".

002500 PROCEDURE DIVISION.
002600 PROGRAM-BEGIN.

           PERFORM OPENING-PROCEDURE.
           PERFORM MAIN-PROCESS.
           PERFORM CLOSING-PROCEDURE.

       PROGRAM-EXIT.
           EXIT PROGRAM.

       PROGRAM-DONE.
        STOP RUN.

       OPENING-PROCEDURE.

       CLOSING-PROCEDURE.

       MAIN-PROCESS.

           PERFORM GET-ANY-TIME.

           PERFORM DISPLAY-AND-GET-ANY-TIME
           UNTIL ANY-TIME = 000001.

       GET-ANY-TIME.
           MOVE "Y" TO ZERO-IS-OK.
           PERFORM GET-THE-TIME.
           MOVE THE-TIME TO ANY-TIME.
           MOVE FORMATTED-TIME TO ANY-FORMATTED.

       GET-THE-TIME.
           CALL "TIMEDIT" USING
           THE-TIME FORMATTED-TIME
           ZERO-IS-OK.

       DISPLAY-AND-GET-ANY-TIME.
           PERFORM DISPLAY-THE-TIME.
           PERFORM GET-ANY-TIME.        
       DISPLAY-THE-TIME.
           DISPLAY "ANY TIME IS " ANY-FORMATTED.
           