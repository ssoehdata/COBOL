      * This excerpt if from the jacko2 file 
      * "Using variables and constants"
000800 01 THE-MESSAGE                       PIC X(50).
000900 01 THE-NUMBER                        PIC 9(2).
001000 01 A-SPACE                             PIC X.
001100
      *        ......
001700
001800* Set up and display line 1
001900
           MOVE 1 TO THE-NUMBER.
002000
           MOVE "Jack be nimble," TO THE-MESSAGE.
002100
           DISPLAY THE-NUMBER A-SPACE THE-MESSAGE
      
      * These three variables can be combined into 
      * one record (data structure) and used as a group for the 
      * DISPLAY type, this grouping is shown here: 

       01  THE-WHOLE-MESSAGE.
           05 THE-NUMBER           PIC 9(2)    VALUE ZEROES.
           05 A-SPACE              PIC X(1)    VALUE SPACES. 
           05 THE-MESSAGE          PIC X(50)   VALUE SPACES.

      * Set up and display line 1
           PIC 9(2) VALUE ZEROES.
           PIC X(1) VALUE SPACE.
           PIC X(50) VALUE SPACES.

     
      *In a structure variable, the highest-level variable 
      *(the one that includes all the individual variables) has
      *the level number 01. The 01 level must appear in Area A 
      *(columns 8 through 12). The structure variable
      *name appears in Area B (columns 12 through 72), 
      *and it does not have a PICTURE. The variables that
      *fall within the structure begin with numbers 
      *higher than 01, and start in Area B (columns 12 through 72).