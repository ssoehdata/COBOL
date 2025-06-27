      * Miscellaneous COBOL syntax
      * Internal Tables 
       01  TABLE-STATE-RECORD OCCURS 50 TIMES

       INDEXED BY STATE-INDEX.
           05 TABLE-STATE-CODE      PIC XX.
           05 TABLE-STATE-NAME      PIC X(20).
           