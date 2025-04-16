      * Adding the continuation character "-" in column 7 indicates 
      *that the previous qouted string  is being continued. 
      *The rest of the string begins with a qoute and continues as 
      *required to complete the message. N.B.: Allow for this in the
      *PIC clause.
000100 IDENTIFICATION DIVISION. 
000200 PROGRAM-ID. CONTINUATION.
000300 ENVIRONMENT DIVISION.
000400 DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01  LONG-MESSAGE            PIC X(85).
000500 PROCEDURE DIVISION.
000600 PROGRAM-BEGIN.
           MOVE "This is an incredibly long message that will take more 
000650-    "more than one line to define." TO LONG-MESSAGE.
           DISPLAY LONG-MESSAGE.
000700
000800 PROGRAM-DONE.
000900     STOP-RUN.


