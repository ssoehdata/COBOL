      *Converting CCYYMMDD to MMDDCCYY.
       77  FORMATTED-DATE              PIC Z9/99/9999.
       77  DATE-CCYYMMDD               PIC 9(8).
       77  DATE-MMDDCCYY               PIC 9(8).

           MOVE 19970515 TO DATE-CCYYMMDD.
           COMPUTE DATE-MMDDCCYY = 
                   DATE-CCYYMMDD * 10000.0001
           MOVE DATE-MMDDCCYY TO FORMATTED-DATE.
           DISPLAY FORMATTED-DATE. 
           