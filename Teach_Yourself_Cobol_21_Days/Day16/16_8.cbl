      
      *  A Table or an Array is an area of memory that has been set 
      * aside and organized in such a way that it can hold multiple 
      * occurrences of the same type of information. 

      * Turning a file into a Table: 
      
      *--------------------------------
      * FDSTATE.CBL
      * Primary Key - STATE-CODE
      * NAME is required
      * NAME and CODE should be uppercase
      *--------------------------------
       FD STATE-FILE
       LABEL RECORDS ARE STANDARD.
       01  STATE-RECORD.
           05 STATE-CODE               PIC X(2).
       05  STATE-NAME                  PIC X(20).
       



