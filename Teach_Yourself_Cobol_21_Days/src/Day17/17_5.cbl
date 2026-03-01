      * A SELECT that will work for the state code file. 

       SELECT  ST-FILE 
           ASSIGN TO  "STATE"
           ORGANIZATION IS INDEXED 
           RECORD KEY IS ST-CODE 
           ACCESS MODE IS DYNAMIC. 
            
      *If you used Listings 17.5 and 17.6 in a program, 
      *you would use the data names from these listings to
      *acess the file. When you open the file,
      * you would OPEN I-O ST-FILE. To write the record, you
      *would use WRITE ST-RECORD, but the file would 
      *still be accessed correctly.