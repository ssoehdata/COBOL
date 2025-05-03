      * Pseudocode (ex. 7_1 - 7_4)
       THE-PROGRAM
           DISPLAY-ONE-TABLE
           UNTIL something???
       DISPLAY-ONE-TABLE
           GET-WHICH-TABLE
               DISPLAY-THE-TABLE
               GET-WHICH-TABLE
       DISPLAY "Which table? (01-99)"
       ACCEPT THE-TABLE
           DISPLAY-THE-TABLE
           GET-HOW-MANY-ENTRIES
           DISPLAY-ONE-ENTRY
               UNTIL all entries are displayed     
      * Example 7_5 the program in pseudocode takes shape
       THE-PROGRAM
           DISPLAY-ONE-TABLE
               UNTIL something???
       DISPLAY-ONE-TABLE
           GET-WHICH-TABLE
           DISPLAY-THE-TABLE
       GET-WHICH-TABLE
           DISPLAY "Which table? (01-99)"
           ACCEPT THE-TABLE
       DISPLAY-THE-TABLE
           GET-HOW-MANY-ENTRIES
           DISPLAY-ONE-ENTRY
           VARYING THE-ENTRY FROM 1 BY 1
               UNTIL THE-ENTRY > HOW-MANY-ENTRIES
       GET-HOW-MANY-ENTRIES
           DISPLAY "How many entries (01-99)?"
           ACCEPT HOW-MANY-ENTRIES

      * Example 7_6 The core of the program in pseudocode 
      THE-PROGRAM
       DISPLAY-ONE-TABLE
           UNTIL something???
       DISPLAY-ONE-TABLE
           GET-WHICH-TABLE
           DISPLAY-THE-TABLE
       GET-WHICH-TABLE
           DISPLAY "Which table? (01-99)"
           ACCEPT THE-TABLE
       DISPLAY-THE-TABLE
           GET-HOW-MANY-ENTRIES
           DISPLAY-ONE-ENTRY
               VARYING THE-ENTRY FROM 1 BY 1
                   UNTIL THE-ENTRY > HOW-MANY-ENTRIES
       GET-HOW-MANY-ENTRIES
           DISPLAY "How many entries (01-99)?"
           ACCEPT HOW-MANY-ENTRIES
       DISPLAY-ONE-ENTRY
           COMPUTE THE-PRODUCT = THE-TABLE * THE-ENTRY
           DISPLAY THE-TABLE " * "
               THE-ENTRY " = "
               THE-PRODUCT
               