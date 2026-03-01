      * Using REDEFINES to define a new variable.
       01  A-DATE. 
           05 DATE-CC              PIC 99. 
           05 DATE-YY              PIC 99. 
           05 DATE-MM              PIC 99. 
           05 DATE-DD              PIC 99. 
       01  DATE-CCYYMMDD REDEFINES  
           A-DATE                  PIC 9(8). 
           