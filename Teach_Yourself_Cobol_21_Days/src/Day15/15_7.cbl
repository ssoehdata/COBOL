      * A standard field-entry routine including 
      * edit-check-the-data 

       enter-the-data.
           PERFORM accept-the-data.
           PERFORM re-accept-the-data. 
               UNTIL the-data is valid. 
       accept-the-data.
           DISPLAY a-prompt.
           ACCEPT the-data. 
           edit-check-the-data.
       re-accept-the-data.
           DISPLAY error-message.
           PERFORM accept-the-data. 
           