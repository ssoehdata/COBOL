      * The wrong way to test for shipping charges. 

      * Add extra shipping for Alaska and Hawaii

           IF STATE-CODE = "HI" OR STATE-CODE = "AK"
               PERFORM CHARGE-EXTRA-SHIPPING
           ELSE
           PERFORM CHARGE-REGULAR-SHIPPING.

      * Hard-coded special conditions like this should be avoided.

      *This code keeps working until the business expands and 
      *you need to include state codes for U.S. territories and 
      *Canadian provinces. There are just too many of these to 
      *hard-code into the program.
      *By inspecting the STATE-FILE you find that none of the 
      *states uses the full 20 characters of STATE-NAME, 
      *and in every record, the 20th character of the STATE-NAME
      * is a space.