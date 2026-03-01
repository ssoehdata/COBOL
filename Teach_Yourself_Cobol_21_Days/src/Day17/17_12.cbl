      *The FD for the original vendor file. 
000100*--------------------------------
000200* FDOVND01.CBL
000300* Primary Key - OLD-VENDOR-NUMBER
000400* Original before alt path added
000500* NAME, ADDRESS-1, CITY, STATE,
000600*  and PHONE are required fields.
000700*
000800* OLD-VENDOR-STATE must be looked up
000900*  and must exist in the STATE-FILE
001000*  to be valid.
001100* OLD-VENDOR-ADDRESS-2 not always used
001200*  so may be SPACES
001300* OLD-VENDOR-PHONE is usually the
001400*  number for OLD-VENDOR-CONTACT
001500* All fields should be entered in
001600*  UPPER case.
001700*--------------------------------
001800 FD OLD-VENDOR-FILE
001900
 LABEL RECORDS ARE STANDARD.
002000 01 OLD-VENDOR-RECORD.
           05 OLD-VENDOR-NUMBER    PIC 9(5).
           05 OLD-VENDOR-NAME      PIC X(30).
           05 OLD-VENDOR-ADDRESS-1 PIC X(30).
           05 OLD-VENDOR-ADDRESS-2  PIC X(30).
           05 OLD-VENDOR-CITY       PIC X(20).
           05 OLD-VENDOR-STATE       PIC X(2).
           05 OLD-VENDOR-ZIP        PIC X(10).
           05 OLD-VENDOR-CONTACT    PIC X(30).
           05 OLD-VENDOR-PHONE       PIC X(15).
