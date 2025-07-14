      *UPPER.CBL converts an argument to uppercase.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. UPPER.
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
      
       01 ALPHA-FIELD  PIC X(20).
      
       01 DUMMY PIC X.
      
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

           MOVE "hello" TO ALPHA-FIELD.

           DISPLAY FUNCTION UPPER-CASE(ALPHA-FIELD).

           ACCEPT DUMMY.