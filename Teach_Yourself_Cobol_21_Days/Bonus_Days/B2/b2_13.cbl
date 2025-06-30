      *The LINKAGE SECTION

       DATA DIVISION.
       FILE SECTION.
      
       WORKING-STORAGE SECTION.
      
       77  VALID-TIME-FLAG  PIC X.
      
           88 TIME-IS-INVALID      VALUE "N".
           88 TIME-IS-ZERO         VALUE "0".
           88 TIME-IS-VALID        VALUE "Y".
           88 TIME-IS-OK           VALUES "Y" "0".

       LINKAGE SECTION.
      *--------------------------------
      * Fields passed for TIME routines.
      *--------------------------------
       77  FORMATTED-TIME            PIC Z9/99/99.

       01  TIME-HHMMSS            PIC 9(6).

           FILLER REDEFINES TIME-HHMMSS.
           05 TIME-HH           PIC 99.
           05 TIME-MM           PIC 99.
           05 TIME-SS           PIC 99.
       
       77  ZERO-TIME-IS-OK      PIC X VALUE "N".
       
