      * Some additional comments on example 10_6: 
      * A printer file has been added in FILE-CONTROL and in the FILE SECTION of the DATA
      *DIVISION. The OPENING-PROCEDURE and CLOSING-PROCEDURE paragraphs include an appropriate
      *OPEN and CLOSE for the PRINTER-FILE, including a closing form feed to eject the last page. The
      *DISPLAY-FIELDS paragraph in phnlst02.cbl has been changed to a PRINT-FIELDS paragraph,
      *which loads the fields and prints them. 

007000
       IF SCREEN-LINES = 15
007100
           PERFORM PRESS-ENTER.
      *   This is the phnprt01.cbl program:
008100
       IF PRINT-LINES = 55
008200
       PERFORM NEW-PAGE

      * The SCREEN-LINES variable has been changed to a 
      *PRINT-LINES variable, and the size of a print page
      *has been set to 55. A print page usually has 66 
      *(sometimes 68) lines on which you can print data. Laser
      *printers might have fewer lines. If you print from the 
      *top to the bottom of the page, the output might appear
      *cluttered, so it is common to allow a margin. 
      * 55 are used in this example as the breakpoint.

      *In the original phnlst02.cbl, the user is asked to press 
      *Enter to continue, as in the following:
008500 PRESS-ENTER.
008600
           DISPLAY "Press ENTER to continue . . ".
008700
           ACCEPT A-DUMMY.
008800
           MOVE ZEROES TO SCREEN-LINES.
      *In a printing program, this pause between screens is 
      *changed into a page break (form feed):
009700 NEW-PAGE.
009800
           MOVE SPACE TO PRINTER-RECORD.
009900
           WRITE PRINTER-RECORD BEFORE ADVANCING PAGE.
010000
           MOVE ZEROES TO PRINT-LINES.