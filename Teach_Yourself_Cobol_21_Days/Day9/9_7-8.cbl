      * READ-NEXT logic 

      * For programs that read a file from one end to the other 
      * it is important that the paragraph or command used to read the
      * the next record sets a flag when the file reaches the end.

      * This flag is used elsewhere in the program to determine that
      * the processing loop reading through the file must stop.
007600 READ-NEXT-RECORD.
007700     READ PHONE-FILE NEXT RECORD
007800     AT END
007900     MOVE "Y" TO END-OF-FILE.

      * The FILE Processing Loop 

      * 3 key pieces to use when processing a file from one 
      * end to the other: 

      * 1) Set a flag that keeps track of whether the file is at 
      *    the end to reflect a "not at end" condition and 
      *    read the first record. 
      * 2) Perform the processing loop unitl the file is at end.
      * 3) Read the next record at the bottom of the proceesing loop.
      
           MOVE "N" TO END-OF-FILE.
004800     PERFORM READ-NEXT-RECORD.
004900     PERFORM DISPLAY-RECORDS
005000         UNTIL END-OF-FILE = "Y".
......
......* The processing loop
006200 DISPLAY-RECORDS.
006300     PERFORM DISPLAY-FIELDS.
006400     PERFORM READ-NEXT-RECORD.
006500
......
......
007600 READ-NEXT-RECORD.
007700         READ PHONE-FILE NEXT RECORD
007800             AT END
007900     MOVE "Y" TO END-OF-FILE.

