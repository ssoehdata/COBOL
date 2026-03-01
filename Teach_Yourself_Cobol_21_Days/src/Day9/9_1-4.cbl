      * File - collection of related units of information within a 
      * data category. 

      * Data File  or Logical File     
      *---------------
      * Field - aka as a data field, is one piece of data contained in
      * a  record. 

      * Logical COBOL file 

      .
002000
002100 DATA DIVISION.
002200 FILE SECTION.
002300
002400 FD PHONE-FILE
002500 LABEL RECORDS ARE STANDARD.
002600 01 PHONE-RECORD.
002700 05 PHONE-LAST-NAME PIC X(20).
002800 05 PHONE-FIRST-NAME PIC X(20).
002900 05 PHONE-NUMBER PIC X(15).
003000
003100 WORKING-STORAGE SECTION. 


      *  File Descriptor - a logical file definition. 

      * OPEN mode needs to be speficied to open a file. 
       OPEN OUTPUT PHONE-FILE
       OPEN EXTEND PHONE-FILE
       OPEN INPUT PHONE-FILE
       OPEN I-O PHONE-FILE
      * SELECT OPTIONAL 
000300
000400 ENVIRONMENT DIVISION.
000500 INPUT-OUTPUT SECTION.
000600 FILE-CONTROL.
000700 SELECT OPTIONAL PHONE-FILE
000800 ASSIGN TO "phone.dat"
000900 ORGANIZATION IS SEQUENTIAL.
001000
001100 DATA DIVISION