      * Using a Structure 
      *
      * the individual variables of the structure have higher level 
      * numbers (05) than the structure variable (1). 



       01  THE-WHOLE-MESSAGE.

       05  THE-NUMBER               PIC 9(2) VALUE ZEROES.

       05  A-SPACE                  PIC X(1) VALUE SPACE.

       05  THE-MESSAGE              PIC X(50) VALUE SPACES.

      * Set up and display line 1

           MOVE 1 TO THE-NUMBER.
           MOVE "Jack be nimble," TO THE-MESSAGE.
           DISPLAY THE-WHOLE-MESSAGE.

      *  Reminder: unitialized variables contain undefined values until
      * a MOVE statement moves something into them.

      *Therefore, moving a single space to an alphanumeric
      *variable is the same as filling it with spaces, as you see here:
       01 THE-MESSAGE
       PIC X(50) VALUE " ".
       01 THE-NUMBER                           PIC 9(4) VALUE 0.
      *Instead of a quoted space (which isn't clear), or a 0 (zero) 
      *that can be confused with the letter O, COBOL
      *has reserved the words SPACE, SPACES, ZERO, ZEROS, 
      *and ZEROES to represent these values. This
      *initialization is clearer:
       01 THE-MESSAGE                      PIC X(50) VALUE SPACES.
       01 THE-NUMBER                        PIC 9(4) VALUE ZEROES.
      *SPACE and SPACES both mean "fill with spaces." ZERO, ZEROS, 
      *and ZEROES all mean "fill with  zeroes." 
      *The singular and plural versions produce the identical 
      *effect. SPACE is the same as SPACES, and ZERO is the same as 
      *ZEROS and ZEROES.  SPACES and ZEROES also can be used in 
      *MOVE commands, like this:
           MOVE SPACES TO THE-MESSAGE.
           MOVE ZERO TO THE-NUMBER.
           