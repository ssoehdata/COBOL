      * An extended selected record-processing loop.

       process-records
           read-first-valid-record
           perform process-loop
               until file-at-end
       process-loop
           process-this-record
           read-next-valid-record
       read-first-valid-record
           start-the-file
           read-next-valid-record
       read-next-valid-record
           read-next-record
           perform read-next-record
               until file is at end
               or (the selection condition is met)