      * Intrinsic Functions and the Year 2000 

      * This program uses the CURRENT-DATE instrinsic to extract the 
      * the current date information. 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. CURDAT.
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

       01  CD-DATE                     PIC X(21).
       01  FILLER REDEFINES CD-DATE.
           05 CD-CY6MD                 PIC 9(8).
           05 CD-HMSD                  PIC 9(8).
           05 CD-GMT-OFF  PIC S9(4) SIGN LEADING SEPARATE.

           05 FILLER REDEFINES CD-GMT-OFF.
           10 CD-GMT-OFF-SIGN PIC X.
           10 CD-GMT-OFF-HM            PIC 9(4).

       01  CD-MDCY                     PIC 9(8).
       01 CD-FORMATTED-MDCY            PIC Z9/99/9999.
       01 CD-FORMATTED-HMSD            PIC Z9/99/99/99.
       01 CD-FORMATTED-GMT-OFF         PIC 99/99.

       01 DUMMY                        PIC X.

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

       OPENING-PROCEDURE.
       CLOSING-PROCEDURE.
       MAIN-PROCESS.

           MOVE FUNCTION CURRENT-DATE TO CD-DATE.

           DISPLAY CD-DATE.          
           COMPUTE CD-MDCY = CD-CYMD * 10000.0001.          
           MOVE CD-MDCY TO CD-FORMATTED-MDCY.          
           MOVE CD-HMSD TO CD-FORMATTED-HMSD.          
           INSPECT CD-FORMATTED-HMSD REPLACING ALL `/' BY `:'.          
           MOVE CD-GMT-OFF-HM TO CD-FORMATTED-GMT-OFF.          
           INSPECT CD-FORMATTED-GMT-OFF REPLACING ALL `/' BY `:'.          
           DISPLAY "DATE = " CD-FORMATTED-MDCY.          
           DISPLAY "TIME = " CD-FORMATTED-HMSD.          
           DISPLAY "GMT OFFSET = " CD-GMT-OFF-SIGN CD-FORMATTED-GMT-OFF.          
           ACCEPT DUMMY.
