      * The SELECT for the original vendoer file 
      *-----------------------------------------------
      * SL0VND01.CBL
      *-----------------------------------------------
       SELECT OLD-VENDOR-FILE 
           ASSIGN TO "ovendor"
           ORGANIZATION IS INDEXED  
           RECORD KEY IS OLD-VENDOR-NUMBER 
           ACCESS MODE IS DYNAMIC. 
            
          