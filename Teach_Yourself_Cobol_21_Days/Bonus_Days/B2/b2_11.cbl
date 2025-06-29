       01  INPUT-DATA   PIC X(50).

       01   FORMATTED-NAME.
           
           05 FIRST-NAME            PIC X(25).
           05 LAST-NAME            PIC X(25).  

           DISPLAY "ENTER FIRST AND LAST NAMES".
           DISPLAY "WITH A SPACE BETWEEN THE NAMES".

           ACCEPT INPUT-DATA.
           MOVE SPACE TO FORMATTED-NAME.
           UNSTRING INPUT-DATA
           DELIMITED BY ALL SPACE
           INTO FIRST-NAME
           LAST-NAME.

       
