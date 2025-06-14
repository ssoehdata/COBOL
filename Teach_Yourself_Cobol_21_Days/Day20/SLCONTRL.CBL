      * The SELECT statement for a control file.
      *---------------------------------------
      *    SLCONTRL.CBL
      *---------------------------------------
           SELECT CONTROL-FILE 
               ASSIGN TO "CONTROL"
               ORGANIZATION IS INDEXED 
               RECORD KEY IS CONTROL-KEY 
               ACCESS MODE IS DYNAMIC. 
               
       