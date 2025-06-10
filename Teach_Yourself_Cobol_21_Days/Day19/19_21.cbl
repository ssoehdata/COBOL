      * HANDLING DATE VALIDATION. 
            
      * A demonstration of date validation. 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATE02.
      *--------------------------------------
      * Demo of Date Entry and validation
      *-------------------------------------- 
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 

       DATA DIVISION. 
       FILE SECTION. 

       WORKING-STORAGE SECTION.

       77  DATE-ENTRY-FIELD            PIC Z9/99/9999.
       77  DATE-MMDDCCYY               PIC 9(8).
       77  DATE-QUOTIENT               PIC 9999.
       77  DATE-REMAINDER              PIC 9999.

       77  VALID-DATE-FLAG             PIC X.
           88  DATE-IS-INVALID         VALUE "N".
           88  DATE-IS-ZERO            VALUE "0".
           88  DATE-IS-VALID           VALUE "Y".
           88  DATE-IS-OK              VALUES "Y" "0".

       01  DATE-CCYYMMDD               PIC 9(8).
       01  FILLER REDEFINES DATE-CCYYMMDD. 
           05 DATE-CCYY                PIC 9999. 
           05 DATE-MM                  PIC 99.
           05 DATE-DD                  PIC 99. 

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN.
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
           PERFORM GET-A-DATE.
           PERFORM DISPLAY-AND-GET-DATE 
               UNTIL DATE-MMDDCCYY = ZEROES. 

       GET-A-DATE.
           PERFORM ACCEPT-A-DATE. 
           PERFORM RE-ACCEPT-A-DATE 
               UNTIL DATE-IS-OK. 
       
       ACCEPT-A-DATE.
           DISPLAY "ENTER A DATE (MM/DD/CCYY)".
           ACCEPT DATE-ENTRY-FIELD. 

           PERFORM EDIT-CHECK-DATE. 

       RE-ACCEPT-A-DATE.
           DISPLAY "INVALID DATE".
           PERFORM ACCEPT-A-DATE.

       EDIT-CHECK-DATE.
           PERFORM EDIT-DATE.
           PERFORM CHECK-DATE. 

       EDIT-DATE.
           MOVE DATE-ENTRY-FIELD TO DATE-MMDDCCYY. 
           COMPUTE DATE-CCYYMMDD =  
                   DATE-MMDDCCYY * 10000.0001.
      
      *----------------------------------------------------------
      *  Assume that the date is good, then test the date in the
      *  date in the following steps. The routine stops if any 
      *  of these conditions is true, and sets conditions is true,
      *  and sets the valid date flag. Condition 1 returns the 
      *  valid date flat set to "0". If any other condition is 
      *  true, the valid date flag is set to "N". 
      * 1. Is the date zeroes 
      * 2. Month > 12 or < 1
      * 3. Day < 1 or > 31 
      * 4. Day > 30 and 
      *    Month = 2  (February)  or 
      *            4  (April)     or 
      *            6  (June)      or 
      *            9  (September) or
      *    Day > 29 and 
      *    Month = 2 (February)
      * 5. Day = 29 and Month = 2 and  
      *    Not a leap year 
      * (A leap year is any year evenly divisible by 4, but does 
      *  not  end in 00 and that is not evenly divisible by 400).
      *------------------------------------------------------------ 
       CHECK-DATE. 
           MOVE "Y" TO VALID-DATE-FLAG. 
           PERFORM CHECK-IF-DATE-ZEROES. 
           IF DATE-IS-VALID 
               PERFORM CHECK-MM.
           IF DATE-IS-VALID 
               PERFORM CHECK-DD.
           IF DATE-IS-VALID 
                PERFORM CHECK-MMDD.
           IF DATE-IS-VALID 
               PERFORM CHECK-LEAP-YEAR.

       CHECK-IF-DATE-ZEROES. 
           IF DATE-CCYYMMDD = ZEROES 
               MOVE "0" TO VALID-DATE-FLAG. 

       CHECK-MM.
           IF DATE-MM  < 1 OR DATE-MM > 12 
               MOVE "N" TO VALID-DATE-FLAG. 

       CHECK-DD.
           IF DATE-MM < 1 OR DATE-MM > 31 
               MOVE "N" TO VALID-DATE-FLAG.

       CHECK-MMDD. 
           IF (DATE-DD > 30) AND  
               (DATE-MM = 2 OR 4 OR 6 OR 9 OR 11)
               MOVE "N" TO VALID-DATE-FLAG 
           ELSE 
           IF DATE-DD > 29 AND DATE-MM = 2 
               MOVE "N" TO VALID-DATE-FLAG. 

       CHECK-LEAP-YEAR. 
           IF DATE-DD = 29 AND DATE-MM = 2 
               DIVIDE DATE-CCYY BY 400 GIVING DATE-QUOTIENT 
                   REMAINDER DATE-REMAINDER 
               IF DATE-REMAINDER = 0 
                   MOVE "Y" TO VALID-DATE-FLAG 
               ELSE 
                   DIVIDE DATE-CCYY BY 100 GIVING DATE-QUOTIENT 
                       REMAINDER DATE-REMAINDER 
                   IF DATE-REMAINDER = 0 
                       MOVE "N" TO VALID-DATE-FLAG 
                   ELSE 
                       DIVIDE DATE-CCYY BY 4 GIVING DATE-QUOTIENT 
                           REMAINDER DATE-REMAINDER 
                       IF DATE-REMAINDER = 0 
                           MOVE "Y" TO VALID-DATE-FLAG 
                       ELSE 
                           MOVE "N" TO VALID-DATE-FLAG. 

       DISPLAY-AND-GET-DATE. 
           PERFORM DISPLAY-A-DATE. 
           PERFORM GET-A-DATE. 

       DISPLAY-A-DATE. 
           MOVE DATE-MMDDCCYY TO DATE-ENTRY-FIELD. 
           DISPLAY "FORMATTED DATE IS "    DATE-ENTRY-FIELD. 
           DISPLAY "DATE-MMDDCCYY  IS "    DATE-MMDDCCYY. 
           DISPLAY "DATE-CCYYMMDD  IS "    DATE-CCYYMMDD.


