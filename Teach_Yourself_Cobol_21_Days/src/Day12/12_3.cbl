      * Running this will delete any exising vendor file.
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. VNDBLD02. 
      **********************************************
      * Create an empty vendor file 
      ********************************************** 
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
      * COPY is a compiler Directive, not a programming command.
      * The COPY directive makes it possible to code the SELECT 
      * and FD for a file only once, and then to include it in all
      * programs that access that file. 
      *--------------------------------------------------
      * From the gnuCobol programmers guide 3.2
      *--------------------------------------------------
      * COPY is an example of a CDF(Compiler Directing Facility)
      * in gnuCOBOL.
      *CDF's enable dynamic setting /resetting certain compiler 
      * switches.
      * Compiler directives are NEVER terminated with a period. 

           COPY "SLVNDO1.CBL"

       DATA DIVISION. 
       FILE SECTION. 
           COPY "FDVNDO1.CBL"

       WORKING-STORAGE SECTION. 
       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 
           OPEN OUTPUT VENDOR-FILE.
           CLOSE VENDOR-FILE. 

       PROGRAM-DONE.
           STOP RUN. 
          
