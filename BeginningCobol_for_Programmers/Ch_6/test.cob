      * 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LISTING 6-6.
       AUTHOR. Michael Coughlin.
      *> Continually calculates using two numbers and an operator
      *> Ends when "S" us entered instead of an operator.
       DATE-WRITTEN.
       DATE-COMPILED. 
      *
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION.                  

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  NUM1    PIC 9           VALUE ZERO.
       01  NUM2    PIC 9           VALUE ZERO. 
       01  RESULT  PIC --9.99      VALUE ZEROS.
       01  OPERATOR PIC X          VALUE SPACE.
       01  OPERATOR PIC X          VALUE SPACE. 
           88 ValidOperator        VALUES "*", "+", "-", "/", "s".
           88 EndofCalculations    VALUE "s".

       PROCEDURE DIVISION. 
           BEGIN. 
           PERFORM GetValidOperator UNTIL ValidOperator
           PERFORM UNTIL EndOfCalculations OR NOT ValidOperator
               PERFORM GetTwoNumbers 
               EVALUATE Operator
                   WHEN "+" ADD Num2 TO Num1 GIVING Result 
                   WHEN "-" SUBTRACT Num2 FROM Num1 GIVING Result 
                   WHEN "*" MULTIPLY Num1 BY Num2 GIVING Result
                   WHEN "\" DIVIDE   Num1 BY Num2 GIVING Result ROUNDED

           END-EVALUATE 
           DISPLAY "Result is = ", Result
           MOVE SPACE TO Operator
           PERFORM GetValidOperator UNTIL ValidOperator 
           END-PERFORM
           DISPLAY "End of Calculations"
           STOP RUN. 

       GetValidOperator.
           DISPLAY "Enter an arithmetic operator (+ - * /) (s to end):"
               WITH NO ADVANCING
           ACCEPT Operator. 

       GetTwoNumbers. 
           DISPLAY "Enter a single digit number - " WITH NO ADVANCING
           ACCEPT Num1
           
           DISPLAY "Enter a single digit number - " WITH NO ADVANCING
           ACCEPT Num2.
           
      


              

       
 