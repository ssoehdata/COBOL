
      * changes for vnbynm02.cbl
007600 PROCEDURE DIVISION.
007700 PROGRAM-BEGIN.
007800
007900
           PERFORM OPENING-PROCEDURE.
008000
           MOVE ZEROES TO LINE-COUNT
008100
           PAGE-NUMBER.
008200
008300
           PERFORM START-NEW-PAGE.
008400
008500
           MOVE "N" TO FILE-AT-END.
008600
           PERFORM READ-FIRST-RECORD.
008700
           IF FILE-AT-END = "Y"
008800
           MOVE "NO RECORDS FOUND" TO PRINTER-RECORD
008900
           PERFORM WRITE-TO-PRINTER
009000
           ELSE
009100
           PERFORM PRINT-VENDOR-FIELDS
009200
           UNTIL FILE-AT-END = "Y".
009300
009400
           PERFORM CLOSING-PROCEDURE.
009500
009600 PROGRAM-EXIT.
009700
           EXIT PROGRAM.
009800
009900 PROGRAM-DONE.
010000
           STOP RUN.
           

