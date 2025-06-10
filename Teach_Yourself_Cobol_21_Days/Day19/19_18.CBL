      *Redefining a variable with a structure. 
       01  DATE-CCYYMMDD               PIC 9(8).
       01  A-DATE REDEFINES  DATE-CCYYMMDD.. 
           05 DATE-CC                  PIC 99. 
           05 DATE-YY                  PIC 99. 
           05 DATE-MM                  PIC 99. 
           05 DATE-DD                  PIC 99. 
           