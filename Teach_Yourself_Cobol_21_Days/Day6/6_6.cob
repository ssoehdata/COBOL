      *Displaying Decimals and Signs 
      * Usiing Numeric and Display Variables 

      * This variable holds the values -999.99 through 999.99 for display
      * purposes. 

      * The display sign(-) displays only whenthe value is negative. 
      * If DISPLAY-VALUE contains -46.17 it displays -046.17 
      * However 55.03 displays as 055.03 

      * the following example shows the difference between the PICTURE 
      * of a signed value used for calculation at 000800 and the PIC
      * of  asigned value used for display at line 001300.

01     DISPLAY-VALUE PIC -999.99.
      *-----------------------------


000700 WORKING-STORAGE SECTION.
000800 01 SALES-TOTAL PIC S9(5)V99 VALUE 44707.66.
000900 01 COMMISSION-PERCENT PIC 99 VALUE 11.
001000 01 PERCENT-AS-DECIMAL PIC V99.
001100 01 THE-COMMISSION PIC S9(5)V99 VALUE ZERO.
001200001300 01 DISPLAY-COMMISSION PIC -9(5).99.
......
002500* Divide commission by 100 to convert to decimal
002600 COMPUTE PERCENT-AS-DECIMAL =
002700 COMMISSION-PERCENT / 100.
002800
002900 COMPUTE THE-COMMISSION =
003000 PERCENT-AS-DECIMAL * SALES-TOTAL.
003100
003200 MOVE THE-COMMISSION TO DISPLAY-COMMISSION.
003300
003400 DISPLAY "The Commission is "
003500 DISPLAY-COMMISSION.
      *---------------------------------
      * Suppressing Leading Zeroes 
      *---------------------------------

      * You can suppress leading zeros when displaying numbers. 
      * If -55.17 is moved to THE-DISPLAY-VALUE and then displayed, it 
      * will appear on the screen as 000055.17- 

      * In a display variable you can suppress the display of leading
      * zeroes using z to replace 9 in the picture of the variable as 
      * in this example: 
       01  THE-DISPLAY-VALUE               PIC ZZZZZ9.99-.

      * when entered like this, a value of -54.27 moved to 
      * THE-DISPLAY-VALUE displays as 54.27-
      
      * Using a PIC of ZZZZZ9.99- enables the value 0 to display thusly:
      *    0.00 

      * PIC ZZZZZZ.ZZ- would suppress all zeros and would display 
      * a blank screen as all zeros would be suppressed. 
      *----------------
      * Commas
      *-------------
      * Commas can be inserted int the pic to provide commas in the final
      * display: 
       01  DISPLAY-COMMISSION          PIC ZZ,ZZ9.99-. 
      * A value of 12345.67 move to DISPLAY-COMMISSION displays as 
      *    12,345.67 
      *---------------------
      * Editing Characters:, '-' , '.', ',' should not be mixed with 
      * s or v in a PIC clause. 
      * e.g.:   s99.99 and PIC -zzV99 are illegal PICTURES. 
      