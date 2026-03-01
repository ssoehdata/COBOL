      * Indexed files in COBOL 
      ****************************************************************
      * In a COBOL indexed file, one field must be designed so that it
      * will contain a unique value for each record. This field is 
      * set up as the primary index for the file. 
      * The primary index is called the   primary key or simply the key.
      ****************************************************************
      * FD for a keyed file 
000900 FD
       CUSTOMER-FILE


       LABEL RECORDS ARE STANDARD.
           CUSTOMER-RECORD.
           05 CUSTOMER-NUMBER              PIC 9(4).
           05 CUSTOMER-NAME                PIC X(20).
           05 CUSTOMER-ADDRESS-1           PIC X(20).
           05 CUSTOMER-ADDRESS-2           PIC X(20).
           05 CUSTOMER-ZIP                 PIC 9(5).
           05 CUSTOMER-PHONE.              
               10 CUSTOMER-AREA-CODE       PIC 9(3).
               10 CUSTOMER-PREFIX          PIC 9(3).
               10 CUSTOMER-PHONE-NO        PIC 9(4).

      *  A SELECT statement for a sequential file
       SELECT CUSTOMER-FILE
           ASSIGN TO "customer.dat"
           ORGANIZATION IS SEQUENTIAL.
      *Compare this to the SELECT statement 
      *for the customer file as an indexed file as shown in this ex:


       SELECT CUSTOMER-FILE
           ASSIGN TO "customer.dat"
           ORGANIZATION IS INDEXED
           RECORD KEY IS CUSTOMER-NUMBER
           ACCESS MODE IS DYNAMIC.



