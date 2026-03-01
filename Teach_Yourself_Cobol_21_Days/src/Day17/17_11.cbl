      * The right wat to test for shipping charges 
      *(compare to 17_9.cbl) 

      * Add extra shipping for non-continental US

       IF STATE-CONTINENTAL = "N"
           PERFORM CHARGE-EXTRA-SHIPPING
           ELSE
           PERFORM CHARGE-REGULAR-SHIPPING.
           