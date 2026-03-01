      * COBOL Numeric Operations 
      * Order of operations and () , COMPUTE verbe etc. 

      * clauses in [] are optional 
       COMPUTE numerica variable 
               [ROUNDED] = arithmetic expression 
                   [ ON SIZE ERROR do something else] 

      * in the following examples, the first COMPUTE statement uses all
      * the options 

           COMPUTE THE-RESULT
           ROUNDED =
           (BASE-VALUE * 10) +
           (A-VALUE / 50)
           ON SIZE ERROR
           DISPLAY "Warning Size error."

           COMPUTE THE-RESULT = 12 * 15.
           COMPUTE THE-RESULT
           ROUNDED =
           (BASE-VALUE * 10) / 1.5

      * This example would crash the progam if DAYS-WORKED equals 0.
002600 COMPUTE DOLLARS-PER-DAY =
002700 MONTH-DOLLARS / DAYS-WORKED
002800 ON SIZE ERROR
002900 DISPLAY "Division by zero error".

      * ADD verb (2 versions)
       ADD value TO variable
           [ROUNDED]
           [ ON SIZE ERROR
               do something ]

      *example 
       ADD 1.17 TO THE-VALUE.
       ADD A-VALUE TO THE-VALUE
       ROUNDED.
       ADD 1.17 TO THE-VALUE
       ROUNDED
       ON SIZE ERROR
       DISPLAY "Add - overflow"

      * ADD verb using reserved word GIVING 
       
       .
           ADD value TO value
           GIVING variable [ROUNDED]
           [ ON SIZE ERROR
           do something ]
      * example 
           ADD 17.5 TO THE-VALUE
           GIVING THE-SUM ROUNDED
           ON SIZE ERROR
           DISPLAY "Add - overflow"
           ADD 17.5 TO 22.7
           GIVING THE-SUM
           ADD A-VALUE TO THE-VALUE
           GIVING THE-SUM
           ON SIZE ERROR
           DISPLAY "Add - overflow"
      * SUBTRACT works in the same manner as well as with GIVING

           SUBTRACT 1.17
           FROM THE-VALUE ROUNDED
           ON SIZE ERROR
           DISPLAY "Subtract - overflow
           
           SUBTRACT 17.5 FROM THE-VALUE
           GIVING THE-DIFFERENCE ROUNDED
           ON SIZE ERROR
           DISPLAY "Subtract-overflow
           
      * MULTIPLY also follows the same pattern 
           MULTIPLY 1.17
           BY THE-VALUE ROUNDED
           ON SIZE ERROR
           DISPLAY "Multiply-overflow"
           MULTIPLY 17.5 BY THE-VALUE
           GIVING THE-PRODUCT ROUNDED
           ON SIZE ERROR
           DISPLAY "Multiply-overflow"
      * the DIVIDE verb comes in several versions. 

                 DIVIDE value
           INTO variable [ROUNDED]
           [ ON SIZE ERRORdo something ]
           DIVIDE value INTO value
           GIVING variable [ROUNDED]
           [ ON SIZE ERROR
           do something ]

           DIVIDE value INTO value
           GIVING variable [ROUNDED]
           REMAINDER variable
           [ ON SIZE ERROR
           do something ]

           DIVIDE value BY value
           GIVING variable [ROUNDED]
           [ ON SIZE ERROR
           do something ]

           DIVIDE value BY value
           GIVING variable [ROUNDED]
           REMAINDER variable
           [ ON SIZE ERROR
           do something]

      * examples of DIVIDE verb 
           DIVIDE 56.2
           INTO THE-VALUE ROUNDED
           ON SIZE ERROR
           DISPLAY "Divide-error"
           DIVIDE 56.2 INTO THE-VALUE
           GIVING THE-QUOTIENT ROUNDED
           ON SIZE ERROR
           DISPLAY "Divide-error"

           DIVIDE 15 INTO THE-VALUE
           GIVING THE-QUOTIENT ROUNDED
           REMAINDER THE RE-REMAINDER
           ON SIZE ERRROR
           DISPLAY "Divide-error"

           DIVIDE 56.2 BY THE-VALUE
           GIVING THE-QUOTINT ROUNDED
           ON SIZE ERROR
           DISPLAY "Divide-error"

           DIVIDE 15 BY 7
           GIVING THE-QUOTIENT ROUNDED
           REMAINDER THE-REMAINDER
           ON SIZE ERROR
           DISPLAY "Divide-error"
