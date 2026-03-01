      * Opening I/O and closing it. 

       PROCEDURE DIVISION. 
       PROGRAM BEGIN. 
           OPEN I/O VENDOR-FILE. 
           PERFORM MAIN-PROCESS. 
           CLOSE VENDOR-FILE. 
           