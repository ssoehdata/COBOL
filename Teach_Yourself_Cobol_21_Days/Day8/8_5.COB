      * The structure definition
002300 01 THE-WHOLE-MESSAGE.
002400 05 DISPLAY-PRINCIPAL        PIC ZZZ,ZZZ,ZZ9.99.
002500 05 MESSAGE-PART-01          PIC X(4) VALUE " at ".
002600 05 DISPLAY-INTEREST         PIC Z9.9.
002700 05 MESSAGE-PART-02          PIC X(6) VALUE "% for ".
002800 05 DISPLAY-PERIODS          PIC ZZ9.
002900 05 MESSAGE-PART-03          PIC X(16)  
003000         VALUE " periods yields ".
003100 05 DISPLAY-VALUE PIC ZZZ,ZZZ,ZZ9.99

      *Three of the variables within THE-WHOLE-MESSAGE are 
      *never used in the main program. 
      *They are MESSAGE-PART-01, MESSAGE-PART-02, 
      *and MESSAGE-PART-03 at lines
      *002500, 002700, and 002900, respectively. 
      
      *They are used to format part of the display and are
      *assigned values in the definition, but nothing is ever 
      *moved to these values in the program.

      *MESSAGE-PART-01, MESSAGE-PART-02, and MESSAGE-PART-03 
      *really do not need to exist as variables with data names 
      *because they are never used in the PROCEDURE DIVISION. 
      *They exist only to fill out THE-WHOLE-MESSAGE.

      *In COBOL, this type of value in a structure variable 
      *can be defined as a filler by using the COBOL
      * reserved word FILLER. 
      * Example 8.6 uses FILLER 
      *in the definition of the same structure variable.
