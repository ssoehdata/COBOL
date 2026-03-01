      * INSPECT

      * The INSPECT verb, which you used to convert lowercase to 
      *uppercase, has two other formats.
      *INSPECT can be used to count characters in a field. 
      *In the following example, SLASH-COUNTER (if it starts
      *with a zero value) will contain the number of / characters 
      *that appear in DATE-FIELD. Here is the syntax:
      *INSPECT variable
      *TALLYING counter
      *FOR [ALL] character
      *and the example:
      *INSPECT DATE-FIELD
      *TALLYING SLASH-COUNTER
      *FOR ALL "/"
      *The second version of INSPECT is more useful. 
      *INSPECT can be used to convert a single character in much the
      *same way it is used to convert multiple characters. 
      *Multiple characters are converted by using INSPECT
      *CONVERTING; a single character is converted by using \
      *INSPECT REPLACING. This is the syntax:
      *INSPECT variable
      *REPLACING [ALL]
      *character BY character.
      *and the example:
      *INSPECT FORMATTED-DATE
      *REPLACING ALL
      *"/" BY "-"


      * Using INSPECT
       01  FORMATTED-DATE  PIC Z9/99/9999.
       01   DATE-MMDDCCYY   PIC 9(8).
......

           MOVE 02141995 TO DATE-MMDDCCYY.
           MOVE DATE-MMDDCCYY TO FORMATTED-DATE.
           DISPLAY FORMATTED-DATE.
           INSPECT FORMATTED-DATE
           REPLACING ALL "\" BY "-".
           DISPLAY FORMATTED-DATE.

      * Output: 
      * 2/14/1995
      * 2-14-1995


      *It is possible to CALL a program and pass it a 
      *variable from the calling program with this syntax:
      *    CALL "TIMEDIT"
      *   USING variable
      *    [variable . . ]
      *   The following is an example:
      *    CALL "TIMEDIT"
      *     USING TIME-HHMMSS
      *     FORMATTED-TIME
      *    ZERO-TIME-IS-OK    
      