      * Required Entry Validation 
      * The FD for the state code file 
      *--------------------------------------
      * FDSTATE.CBL 
      * PRIMARY KEY- STATE-CODE 
      * NAME is required 
      * NAME and CODE should be upper case
      *-------------------------------------- 
       FD  STATE-FILE 
           LABEL RECORDS ARE STANDARD. 
       01  STATE-RECORD.
           05 STATE-CODE                       PIC X(2). 
           05 STATE-NAME                       PIC X(20).
             