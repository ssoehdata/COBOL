      * The SELECT statement for the state code file. 
      *--------------------------------
      * SLSTATE.CBL
      *--------------------------------
       SELECT STATE-FILE 
           ASSIGN TO "STATE"
           ORGANIZATION IS INDEXED 
           RECORD KEY IS STATE-CODE 
           ACCESS MODE IS DYNAMIC. 
           
           