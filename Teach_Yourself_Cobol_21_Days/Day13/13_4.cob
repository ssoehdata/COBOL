000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. VNDADD01.
000300*------------------------------------------------
000400* Add a record to an indexed Vendor File.
000500*------------------------------------------------
000600 ENVIRONMENT DIVISION.
000700 INPUT-OUTPUT SECTION.
000800 FILE-CONTROL.
000900
001000
       COPY "SLVND01.CBL".
001100
001200 DATA DIVISION.
001300 FILE SECTION.
001400
001500
       COPY "FDVND02.CBL".
001600
001700 WORKING-STORAGE SECTION.
001800
001900 77 RECORD-FOUND                 PIC X.
002000 77 VENDOR-NUMBER-FIELD          PIC Z(5).
002100
002200 PROCEDURE DIVISION.
002300 PROGRAM-BEGIN.
002400
           OPEN I-O VENDOR-FILE.
002500
           PERFORM GET-NEW-VENDOR-NUMBER.
002600
           PERFORM ADD-RECORDS
002700
           UNTIL VENDOR-NUMBER = ZEROES.
002800
           CLOSE VENDOR-FILE.
002900
003000 PROGRAM-DONE.
003100
           STOP RUN.
003200
003300 GET-NEW-VENDOR-NUMBER.
003400
           PERFORM INIT-VENDOR-RECORD.
003500
           PERFORM ENTER-VENDOR-NUMBER.
003600
           MOVE "Y" TO RECORD-FOUND.
003700
           PERFORM FIND-NEW-VENDOR-RECORD
003800
           UNTIL RECORD-FOUND = "N" OR
003900
           VENDOR-NUMBER = ZEROES.
004000
004100 INIT-VENDOR-RECORD.
004200
           MOVE SPACE TO VENDOR-RECORD.
004300
           MOVE ZEROES TO VENDOR-NUMBER.
004400
004500 ENTER-VENDOR-NUMBER.
004600
           DISPLAY " ".
004700
           DISPLAY "ENTER VENDOR NUMBER OF THE VENDOR" .
004800
           DISPLAY "TO ADD (1-99999)".
004900
           DISPLAY "ENTER 0 TO STOP ENTRY".
005000
           ACCEPT VENDOR-NUMBER-FIELD.
005100*OR ACCEPT VENDOR-NUMBER-FIELD WITH CONVERSION.
005200
005300
           MOVE VENDOR-NUMBER-FIELD TO VENDOR-NUMBER.
005400
005500 FIND-NEW-VENDOR-RECORD.
005600
           PERFORM READ-VENDOR-RECORD.
005700
           IF RECORD-FOUND = "Y"
005800
           DISPLAY "RECORD ALREADY ON FILE"
005900
           PERFORM ENTER-VENDOR-NUMBER.
006000
006100 READ-VENDOR-RECORD.
006200
           MOVE "Y" TO RECORD-FOUND.
006300
           READ VENDOR-FILE RECORD
006400
           INVALID KEY
006500
           MOVE "N" TO RECORD-FOUND.
006600
006700
006800 ADD-RECORDS.
006900
           PERFORM ENTER-REMAINING-FIELDS.
007000
           PERFORM WRITE-VENDOR-RECORD.
007100
           PERFORM GET-NEW-VENDOR-NUMBER.
007200
007300 WRITE-VENDOR-RECORD.
007400
           WRITE VENDOR-RECORD
007500
           INVALID KEY
007600
           DISPLAY "RECORD ALREADY ON FILE".
007700
007800 ENTER-REMAINING-FIELDS.
007900
           PERFORM ENTER-VENDOR-NAME.
008000
           PERFORM ENTER-VENDOR-ADDRESS-1.
008100
           PERFORM ENTER-VENDOR-ADDRESS-2.
008200
           PERFORM ENTER-VENDOR-CITY.
008300
           PERFORM ENTER-VENDOR-STATE.
008400
           PERFORM ENTER-VENDOR-ZIP.
008500
           PERFORM ENTER-VENDOR-CONTACT.
008600
           PERFORM ENTER-VENDOR-PHONE.
008700
008800 ENTER-VENDOR-NAME.
008900
           DISPLAY "ENTER VENDOR NAME".
009000
           ACCEPT VENDOR-NAME.
009100
009200 ENTER-VENDOR-ADDRESS-1.
009300
           DISPLAY "ENTER VENDOR ADDRESS-1".
009400
           ACCEPT VENDOR-ADDRESS-1.
009500
009600 ENTER-VENDOR-ADDRESS-2.
009700
           DISPLAY "ENTER VENDOR ADDRESS-2".
009800
           ACCEPT VENDOR-ADDRESS-2.
009900
010000 ENTER-VENDOR-CITY.
010100
       DISPLAY "ENTER VENDOR CITY".
010200
       ACCEPT VENDOR-CITY.
010300
010400 ENTER-VENDOR-STATE.
010500
           DISPLAY "ENTER VENDOR STATE".
010600
           ACCEPT VENDOR-STATE.
010700
010800 ENTER-VENDOR-ZIP.
010900
           DISPLAY "ENTER VENDOR ZIP".
011000
           ACCEPT VENDOR-ZIP.
011100
011200 ENTER-VENDOR-CONTACT.
011300
           DISPLAY "ENTER VENDOR CONTACT".
011400
           ACCEPT VENDOR-CONTACT.
011500
011600 ENTER-VENDOR-PHONE.
011700
           DISPLAY "ENTER VENDOR PHONE".
011800
011900
           ACCEPT VENDOR-PHONE.
           
