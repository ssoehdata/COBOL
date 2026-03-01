      *  THis Program shows some string functions. 

      * The REVERSE function, reverses it's argument.
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRNG.
       AUTHOR. MO BUDLONG.
       INSTALLATION.
       DATE-WRITTEN. 09/07/96.
       DATE-COMPILED.
       SECURITY. NONE
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      
       01  ALPHA-FIELD         PIC X(26).
       01  SECOND-FIELD        PIC X(26).
      
       01  DUMMY  PIC X.
      
       PROCEDURE DIVISION.
       MAIN-LOGIC SECTION.
       PROGRAM-BEGIN.
      
           PERFORM OPENING-PROCEDURE.          
  
           PERFORM MAIN-PROCESS.
  
           PERFORM CLOSING-PROCEDURE.

       EXIT-PROGRAM.      
              EXIT PROGRAM.
       STOP-RUN.      
              STOP RUN.      
      
       THE-OTHER SECTION.
      
       OPENING-PROCEDURE.
       CLOSING-PROCEDURE.
       MAIN-PROCESS.     

           MOVE FUNCTION UPPER-CASE("goodbye") TO ALPHA-FIELD.


           DISPLAY ALPHA-FIELD.   

           MOVE FUNCTION LOWER-CASE(ALPHA-FIELD) TO SECOND-FIELD.

           DISPLAY "SECOND = " SECOND-FIELD.

           MOVE "abcdefghijklmnopqrstuvwxyz" TO ALPHA-FIELD.

           STRING

           FUNCTION UPPER-CASE( "hello") DELIMITED BY SIZE           
           INTO ALPHA-FIELD.

           DISPLAY FUNCTION REVERSE(ALPHA-FIELD).

           ACCEPT DUMMY.
