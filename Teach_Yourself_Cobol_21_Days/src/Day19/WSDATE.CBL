      

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
       
      