      * Example of Structured Loop control
      * Processing Loops (Loops) are used to perform a task 
      * repetitively. 


      * In this example, the all the key pieces of the Loop
      * are together in one section of code.
003700 MOVE 1 TO THE-MULTIPLIER.
003800 PERFORM CALCULATE-AND-DISPLAY
003900 UNTIL THE-MULTIPLIER > 12.
004000
004100 CALCULATE-AND-DISPLAY.
004200 COMPUTE THE-PRODUCT = THE-NUMBER * THE-MULTIPLIER.
004300 DISPLAY
004400 THE-NUMBER " * " THE-MULTIPLIER " = " THE-PRODUCT.
004500 ADD 1 TO THE-MULTIPLIER. 
