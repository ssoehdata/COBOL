      * Make it happen 50 times. 


      *Adding the OCCURS 50 TIMES works as if you had typed these lines 
      * 50 times.This creates 50 occurrences of TABLE-STATE-RECORD. 
      * It also creates multiple occurrences of all the subordinate 
      *variables, so 50 occurrences of TABLE-STATE-CODE and 
      *TABLE-STATE-NAME are also within the 50 occurrences of 
      *TABLE-STATE-RECORD.



       01  TABLE-STATE-RECORD OCCURS 50 TIMES.
           05 TABLE-STATE-CODE    PIC XX.
           05 TABLE-STATE-NAME    PIC X(20).

      *If you move something to or from a table variable 
      *TABLE-STATE-RECORD (or TABLE-STATE-CODE
      *or TABLE-STATE-NAME), you must add some additional information to identify to or from which
      *occurrence you are moving. You single out a 
      *specific variable in a table by adding a number in
      *parentheses after the variable name. This number is called
      * an index or a subscript. This is not the same index as 
      *the index to a file, but it is a number that 
      *identifies which occurrence of the variable is being
      *referenced.
      