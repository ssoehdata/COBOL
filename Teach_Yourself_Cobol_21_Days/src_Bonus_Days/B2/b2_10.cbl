      *Adding extra spaces 
       01  DETAIL-LINE.
           05 PRINT-WHOLE-NAME             PIC X(32). 

           MOVE SPACE TO DETAIL-LINE.
           STRING 
               FIRST-NAME DELIMITED BY SPACE 
               " " DELIMITED BY SIZE 
               MIDDLE-NAME DELIMITED BY SPACE 
               " " DELIMITED BY SIZE 
               LAST-NAME DELIMITED BY SPACE 
               INTO PRINT-WHOLE-NAME. 
           PEFORM PRINT-DETAIL-LINE. 


      * the UNSTRING verb does the opposite of the STRING verb, 
      * enabling you to break a single field on a specific character
      * into several separate fields. It is used less often than 
      * the STRING verb.

      *UNSTRING variable
      *    DELIMITED BY [ALL] delimiter
      *    [ OR [ALL] delimiter ]
      *     INTO variable . . .
      *         Here is an example:
      *      UNSTRING INPUT-DATA
      *    DELIMITED BY SPACE
      *     INTO FIRST-NAME
      *      LAST-NAME