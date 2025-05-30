      * Providing and index. 

       01   TABLE-STATE-RECORD OCCURS 50 TIMES
           INDEXED BY STATE-INDEX.
           05 TABLE-STATE-CODE     PIC XX.
           05 TABLE-STATE-NAME     PIC X(20).
       
      * In order to manipulate an index variable, 
      *you must use the SET command. Here is the syntax:
   

      *SET index variable TO value
      *SET index variable UP
      *    BY value
      *SET index variable DOWN
      *    BY value

      *You can use an index variable in a PERFORM VARYING 
      *command. Use this syntax:


      *PERFORM paragraph
      *    VARYING index variable
      *        FROM value BY value
      *            UNTIL condition.