      * Alternative Detail lines for vnddsp01.cbl
     
      * A second detail line 
004500 01  2ND-DETAIL-LINE.
004600     05  FILLER PIC X(6) VALUE SPACE.
004700     05  DISPLAY-CITY PIC X(20).
004800     05  FILLER PIC X VALUE SPACE.
004900     05  DISPLAY-STATE PIC XX.
005000     05  FILLER PIC X(8) VALUE SPACE.
005100     05  DISPLAY-ZIP PIC X(10).

      * Using 2nd-Detail-Line 
       DISPLAY-LINE-4.
014100     MOVE SPACE TO 2ND-DETAIL-LINE.
014200     MOVE VENDOR-CITY TO DISPLAY-CITY.
014300     MOVE VENDOR-STATE TO DISPLAY-STATE.
014500     MOVE VENDOR-ZIP TO DISPLAY-ZIP.
014600     MOVE 2ND-DETAIL-LINE TO DISPLAY-RECORD.
014700     PERFORM WRITE-DISPLAY-RECORD.

      * NOTES: 
      *     A record in an indexed file must contain at least one 
      *field that is unique to that record. That field is
      *used as the primary index or primary key of the file.
       
      * The primary key is frequently a number, that number then can
      * be used as the unique identifier of a particular record. 

      * The logical description of an indexed file defines the record
      * and fields  in the record. The logical description of an 
      * indexed file (FD) is not different from any other file. 

      * A file is identified as an indexed file by using 
      * ORGANIZATION IS INDEXED in the SELECT
      *statement and by naming the field that is to
      * be used as the primary key for the file. The SELECT
      *statement also should include ACCESS MODE IS DYNAMIC.

      * Attempting to add arecord ot a file with a vlaue in the 
      * primary key that is identical to a record  already in the 
      * file will cause a file error condition. 


      *File error conditions, such as reading past the end of a 
      *file or attempting to write a record with a
      *duplicate key value, usually cause a COBOL program to abort. 
      *Using AT END in a READ NEXT command and INVALID KEY in 
      *a WRITE command overrides the abort condition and allows the
      *program to continue. 

      *The natural order of records in an indexed file is in 
      *primary key order, and when the records are
      *retrieved sequentially, they are retrieved in primary key order.

      