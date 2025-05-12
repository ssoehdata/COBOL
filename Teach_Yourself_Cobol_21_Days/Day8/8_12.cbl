      * Using a level 88 condition name 

      * Level 88 is a special level number used to improve readability
      * of COBOL programs and to improve IF tests.

       IDENTIFICATION DIVISION. 
       PROGRAM-ID. MENU02. 
      *----------------------------------------------------
      * This program displays a three choice menu of 
      * messages that can be displayed. 
      * The user enters the choice, 1, 2 or 3 , and 
      * the appropriate message is displayed. 
      * An error mesage is displayed if an invalid 
      * choide is made. 
      *----------------------------------------------
       ENVIRONMENT DIVISION. 
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 

       01  MENU-PICK           PIC 9. 
           88 PICK-IS-EXIT     VALUE 0. 

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 

           MOVE 1 TO MENU-PICK. 
           PERFORM GET-AND-DO-PICK
               UNTIL PICK-IS-EXIT. 

002500     DISPLAY "Thank you. Exiting".
       PROGRAM-DONE.
           STOP RUN. 

       GET-AND-DO-PICK.
           PERFORM GET-THE-MENU-PICK. 

           PERFORM DO-THE-MENU-PICK.
       GET-THE-MENU-PICK.
           PERFORM DISPLAY-THE-MENU.
           PERFORM GET-THE-PICK. 

       DO-THE-MENU-PICK.
           IF MENU-PICK > 3 
               DISPLAY "Invalid Seletion".
           
           IF MENU-PICK = 1
               DISPLAY "One for the money.".
           
           IF MENU-PICK = 2 
               DISPLAY "Two for the show.".

           IF MENU-PICK = 3
               DISPLAY "Three to get ready.".
       
       DISPLAY-THE-MENU.
      * Includes the display of some blank lines to 
      * improve the appearance
           DISPLAY "Please enter the number of the messages".
           DISPLAY "that you wish to display.".
           DISPLAY " ".
           DISPLAY "1. First Message".
           DISPLAY "2. Second Message".
           DISPLAY "3. Third Message".
           DISPLAY " ".
           DISPLAY "0. EXIT".
           DISPLAY "Your selection (1-3)?".

       GET-THE-PICK. 
           ACCEPT MENU-PICK. 
      *********************************
      * 8_13  A complex IF 
004100*    IF MENU-PICK < 1 OR
004200*        ( MENU-PICK < 9 AND MENU-PICK > 3)
004300*         DISPLAY "Invalid selection"
      ********************************************
      * 8_14
      * Alternate level 88 

      *IF  MENU-PICK NOT = 1 AND
004200*    MENU-PICK NOT = 2 AND
004300*    MENU-PICK NOT = 3 AND
004400*    MENU-PICK NOT = 9
004500*        DISPLAY "Invalid selection".

      *  8_15  Level 88 with a list of values  

       
002600*01  MENU-PICK                PIC 9.
002700*    88 PICK-IS-VALID        VALUES 1, 2, 3, 9.
002800*        MENU-PICK = 1 OR
002900*        MENU-PICK = 2 OR
003000*        MENU-PICK = 3 OR
003100*        MENU-PICK = 9
      
      * 8_16 Level 88 with a range of values
002600* 01  MENU-PICK          PIC 9.
002700*    88 PICK-IS-VALID    VALUES 0 THROUGH 3.
002800*    MENU-PICK = 0 OR
002900*    MENU-PICK = 1 OR
003000*    MENU-PICK = 2 OR
003100*    MENU-PICK = 3

      * 8_17 Level 88 with range and list values 
      *01 MENU-PICK PIC 9.
002700*    88 PICK-IS-VALID VALUES 8, 9, 0 THROUGH 3
002800*    MENU-PICK = 8 OR
002900*    MENU-PICK = 9 OR
003000*    MENU-PICK = 0 OR
003100*    MENU-PICK = 1 OR
003200*    MENU-PICK = 2 OR
003300*    MENU-PICK = 3
003400

      * 8_18 More than one level 88 
002500
002600*01 MENU-PICK PIC 9.
002700*    88 PICK-IS-VALID VALUES 8, 9, 0 THROUGH 3
002800*    88 PICK-IS-EXIT VALUE 9.
