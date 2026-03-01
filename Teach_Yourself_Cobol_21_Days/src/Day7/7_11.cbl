      * Pseudocode for Compound Interest 
       THE-PROGRAM
           MOVE "Y" TO YES-NO
           PERFORM GET-AND-DISPLAY-RESULT
               UNTIL YES-NO = "N".
       GET-AND-DISPLAY-RESULT.
           PERFORM GET-THE-PRINCIPAL
           PERFORM GET-THE-INTEREST
           PERFORM GET-THE-PERIODS.
           PERFORM CALCULATE-THE-RESULT.
           PERFORM DISPLAY-THE-RESULT.
           PERFORM GO-AGAIN.
       GET-THE-PRINCIPAL.
           ( between 0.01 and 999999.99 )
       GET-THE-INTEREST.
           ( between 00.1 and 99.9%)
       GET-THE-PERIODS.
           ( between 001 and 999 )
       CALCULATE-THE-RESULT.
           PERFORM CALCULATE-ONE-PERIOD
               VARYING THE-PERIOD FROM 1 BY 1
               UNTIL THE-PERIOD > NO-OF-PERIODS.
       CALCULATE-ONE-PERIOD.
           COMPUTE EARNED-INTEREST ROUNDED =
               THE-PRINCIPAL * INTEREST-AS-DECIMAL.
           COMPUTE THE-NEW-VALUE =
               THE-PRINCIPAL + EARNED-INTEREST.
       MOVE THE-NEW-VALUE TO THE-PRINCIPAL.
       GO-AGAIN
           ( YES OR NO)
       DISPLAY-THE-RESULT
           (VALUE = THE-PRINCIPAL)
           