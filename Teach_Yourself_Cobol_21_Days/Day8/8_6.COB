      * How to use FILLER  keyword 
002300 01 THE-WHOLE-MESSAGE.
002400 05 DISPLAY-PRINCIPAL PIC ZZZ,ZZZ,ZZ9.99.
002500 05 FILLER PIC X(4) VALUE " at ".
002600 05 DISPLAY-INTEREST PIC Z9.9.
002700 05 FILLER PIC X(6) VALUE "% for ".
002800 05 DISPLAY-PERIODS PIC ZZ9.
002900 05 FILLER PIC X(16)
003000 VALUE " periods yields ".
003100 05 DISPLAY-VALUE PIC ZZZ,ZZZ,ZZ9.99.

      * A FILLER cannot be treated as a variable. It is used to 
      * reserve space in a structure variable. 

      * You assign a PICTURE and a VALUE to  a FILLER when it is 
      * defined, but you cannnot use MOVE with FILLER. 
      