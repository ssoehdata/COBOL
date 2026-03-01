      * Pseudocode for a selected records-processing loop

       process-records 
           read-first-valid-record 
           perform-process-loop 
               until file-at-end 
       process-loop 
           process-this-record 
           read-next-valid-record 
           