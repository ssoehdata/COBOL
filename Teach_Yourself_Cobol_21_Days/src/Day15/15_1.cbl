000100*--------------------------------
000200* FDVND02.CBL
000300* Primary Key - VENDOR-NUMBER
000400* VENDOR-ADDRESS-2 not always used
000500* so may be SPACES
000600* VENDOR-PHONE is usually the
000700* number for VENDOR-CONTACT
000800* All fields should be entered in UPPER case.
001000*--------------------------------
001100 FD VENDOR-FILE 
       LABEL RECORDS ARE STANDARD.
001300 01 VENDOR-RECORD.
           05 VENDOR-NUMBER           PIC 9(5). 
           05 VENDOR-NAME             PIC X(30).
           05 VENDOR-ADDRESS-1        PIC X(30).
           05 VENDOR-ADDRESS-2        PIC X(30). 
           05 VENDOR-CITY             PIC X(20).
           05 VENDOR-STATE            PIC X(2).
           05 VENDOR-ZIP              PIC X(10).
           05 VENDOR-CONTACT          PIC X(30).
           05 VENDOR-PHONE            PIC X(15). 


           

      