
      *    A duplicate of the state code record.
      *    This can be set up in working storage and contains fields that
      *    are the same size as the state code and state name fields
      *    for the state code file.  You load this into memory by 
      *    reading the state record and then moving STATE-CODE 
      *    to TABLE-STATE-CODE and STATE-NAME to TABLE-STATE-NAME.


      *Listing 16.9 allows for only one occurrence of the 
      *state information--and you need 50 occurrences. This
      *is handled by adding an OCCURS clause after the 
      *TABLE-STATE-RECORD, as shown in Listing 16.10.
      * This creates space in memory for 50 occurrences of 
      *TABLE-STATE-RECORD. The TABLE-STATE-RECORD is 22 bytes 
      *long, so this reserves 1,100 bytes (50x22).

       01  TABLE-STATE-RECORD.
           05  TABLE-STATE-CODE        PIC XX.
           05 TABLE-STATE-NAME         PIC X(20).


