      *--------------------------------
      * SELECT for an alternate indexed file. 
      *--------------------------------
      * SLVND02.CBL
      *--------------------------------
       SELECT VENDOR-FILE
           ASSIGN TO "vendor"
           ORGANIZATION IS INDEXED
           RECORD KEY IS VENDOR-NUMBER
           ALTERNATE KEY
           IS VENDOR-NAME WITH DUPLICATES
           ACCESS MODE IS DYNAMIC.
           