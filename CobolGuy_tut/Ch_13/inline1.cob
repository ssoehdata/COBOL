000100*in-line procedures
000200
000300*awk -i inplace '{printf("%04d00%s\n", NR, substr($0,7,120)) }' filename.cob
000400 IDENTIFICATION DIVISION. 
000500 PROGRAM-ID.  INLINEPROCEDURES.
000600 DATE-WRITTEN.  19-10-2024.
000700 DATE-COMPILED. 19-10-2024.
000800 AUTHOR. 
000900 ENVIRONMENT DIVISION.
001000  CONFIGURATION SECTION.
001100  SOURCE-COMPUTER. LINUXMINT21.
001200  OBJECT-COMPUTER. LINUXMINT21.
001300  INPUT-OUTPUT SECTION.
001400  FILE-CONTROL.
001500 DATA DIVISION. 
001600  FILE SECTION.
001700 WORKING-STORAGE SECTION.
001800 77  WS_COUNTER          PIC 9999 VALUE 0.
001900 LOCAL-STORAGE SECTION. 
002000 77  LS_COUNTER          PIC 9999 VALUE 0. 
002100 PROCEDURE DIVISION. 
002200     000-BEGIN.
002300         DISPLAY "DEBUGGING TEXT: IF DISPLAYED, PROGRAM RUNNING." 
002400* inline block of code
002500         PERFORM 4 times
002600             DISPLAY "Inside simple perform"
002700             DISPLAY "Is this a loop?"
002800* could have also used WS_COUNTER in place of LS_COUNTER
002900             ADD 1 TO LS_COUNTER 
003000             DISPLAY "YOU ARE IN A LOOP: ", LS_COUNTER
003100         END-PERFORM.
003200
003300* example of an inline procedure 
      * could also just write peform 010-procedure-alpha 2 times.
003400         PERFORM 010-PROCEDURE-ALPHA thru 
                       010-PROCEDURE-ALPHA-END 2 TIMES.
003500         DISPLAY "IF YOU COMMENT OUT 'GOBACK' THIS IS DISPLAYED, "
                        "AND YOU EXITED THE ALPHA LOOP PROCEDURE."
003600         STOP RUN.
003700
003800        010-PROCEDURE-ALPHA.
                   ADD 1 TO WS_COUNTER.
003900             DISPLAY "I'M IN " WITH NO ADVANCING
004000             DISPLAY "PROCEDURE ALPHA ", WS_COUNTER.
                   DISPLAY "ENDING PROCEDURE ALPHA".
      *  if goback is commented out, it breaks the procedure alpha loop
      *  and the procedure alpha counter will only read 001 
      *  as well as displaying the debug message above regarding 
      *  commenting out goback. 
      *  otherwise, with goback in, the debug display is not run  
                 GOBACK. 
              010-PROCEDURE-ALPHA-END.
                   
004100
004200 END PROGRAM INLINEPROCEDURES.
004300
004400
004500
004600
