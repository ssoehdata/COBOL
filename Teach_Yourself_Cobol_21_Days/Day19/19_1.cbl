      * A payroll control file FD.
       FD  PAYROLL-CONTROL-FILE 
           LABEL RECORDS ARE STANDARD.
       01  PAYROLL-CONTROL-RECORD.
           05  PAYROLL-CONTROL-KEY                 PIC 9.
           05  PAYROLL-CONTROL-LAST-EMPLOYEE       PIC 9(5).
           05  PAYROLL-CONTROL-OVERTIME-HOURS      PIC 99V99.
           05  PAYROLL-CONTROL-LAST-CHECK          PIC 9(6).
           05  PAYROLL-CONTROL-CHECK-ACCOUNT       PIC X(15).
           