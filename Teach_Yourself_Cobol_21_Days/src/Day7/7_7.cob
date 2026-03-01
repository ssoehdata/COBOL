      * The pseudocode is almost complete 
      THE-PROGRAM
           DISPLAY-ONE-TABLE
               UNTIL YES-NO = "N"  
       DISPLAY-ONE-TABLE
           GET-WHICH-TABLE
           DISPLAY-THE-TABLE
           GO-AGAIN
       GET-WHICH-TABLE
           DISPLAY "Which table? (01-99)"
           ACCEPT THE-TABLE
       DISPLAY-THE-TABLE
           GET-HOW-MANY-ENTRIES
           DISPLAY-ONE-ENTRY
               VARYING THE-ENTRY FROM 1 BY 1
                   UNTIL THE-ENTRY > HOW-MANY-ENTRIES
       GO-AGAIN
           DISPLAY "Go Again (Y/N)?"
           ACCEPT YES-NO
           IF YES-NO = "y"
               MOVE "Y" TO YES-NO
           IF YES-NO NOT = "Y"
               MOVE "N" TO YES-NO
       GET-HOW-MANY-ENTRIES
           DISPLAY "How many entries (01-99)?"
           ACCEPT HOW-MANY-ENTRIES
           DISPLAY-ONE-ENTRY
           COMPUTE THE-PRODUCT = THE-TABLE * THE-ENTRY
           DISPLAY THE-TABLE " * "
                   THE-ENTRY " = "
                   THE-PRODUCT
