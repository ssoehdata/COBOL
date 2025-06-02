      * An FD that will work for the state code file. 
       FD  ST-FILE 
           LABEL RECORDS ARE STANDARD. 
       01  ST-RECORD. 
           05 ST-CODE              PIC X(2). 
           05 ST-NAME              PIC X(20).
           
      *If you used Listings 17.5 and 17.6 in a program, 
      *you would use the data names from these listings to
      *acess the file. When you open the file,
      * you would OPEN I-O ST-FILE. To write the record, you
      *would use WRITE ST-RECORD, but the file would 
      *still be accessed correctly.