       IDENTIFICATION DIVISION. 
       PROGRAM-ID. TAXES. 
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  SALARY              PICTURE 999999.
       01  INCOME-TAX          PICTURE 99999.99.
       01  MORE-DATA           PICTURE XXX       VALUE "YES".
       PROCEDURE DIVISION. 
       100-MAIN.
           PERFORM UNTIL MORE-DATA = "NO "
               DISPLAY "ENTER SALARY AS AN INTEGER FIELD"
               ACCEPT SALARY
               MULTIPLY SALARY BY .20 GIVING INCOME-TAX 
               DISPLAY "THE INCOME TAX IS ", INCOME-TAX 
               DISPLAY "IS THERE MORE DATA (YES/NO?)"
               ACCEPT MORE-DATA
           END-PERFORM   
           STOP RUN. 


       