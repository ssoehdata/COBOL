      * A customer record 
       01  CUSTOMER-RECORD. 
           05 CUSTOMER-NUMBER          PIC 9(5). 
           05 CUSTOMER-NAME            PIC X(20).
           05 CUSTOMER-ADDRESS-1       PIC X(20).
           05 CUSTOMER-ADDRESS-2       PIC X(20).
           05 CUSTOMER-ZIP             PIC 9(5).
           05 CUSTOMER-PHONE.
               10 CUSTOMER-AREA-CODE   PIC 9(3).
               10 CUSTOMER-PREFIX      PIC 9(3).
               10 CUSTOMER-PHONE-NO    PIC 9(4).
       