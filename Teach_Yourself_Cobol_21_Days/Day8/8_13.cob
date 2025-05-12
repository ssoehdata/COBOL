      * More Level 88 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. MENU03.
      *************************************************************
      * THIS PROGRAM DISPLAYS A THREE CHOICE MENU OF 
      * MESSAGES THAT CAN BE DISPLAYED.
      * THE USER ENTERS THE CHOICE, 1, 2, OR 3, AND 
      * THE APPROPRIATE MESSAGE IS DISPLAYED.
      * AN ERROR MESSAGE IS DISPLAYED IF AN INVALID CHOICE 
      * IS MADE. 
      **************************************************************      
       ENVIRONMENT DIVISION.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 

       01  MENU-PICK                   PIC 9. 
           88 PICK-IS-EXIT             VALUE 9. 
           88 PICK-IS-VALID            VALUES 1 THRU 3, 9. 

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN.

           MOVE 1 TO MENU-PICK. 
           PERFORM GET-AND-DO-PICK 
               UNTIL PICK-IS-EXIT.
      *                MENU-PICK = 9 

           DISPLAY "THANK YOU. EXITING".

       PROGRAM-DONE. 
           STOP RUN. 

       GET-AND-DO-PICK.
           PERFORM GET-THE-MENU-PICK. 

           PERFORM DO-THE-MENU-PICK. 

       GET-THE-MENU-PICK. 

           PERFORM DISPLAY-THE-MENU. 
           PERFORM GET-THE-PICK. 

       DO-THE-MENU-PICK.
      *    NOT (MENU-PICK = 1 OR 2 OR 3 OR 9 )
           IF NOT PICK-IS-VALID
               DISPLAY "INVALID SELECTION".

           IF MENU-PICK = 1 
              DISPLAY "ONE FOR THE MONEY.".
           IF MENU-PICK = 2 
               DISPLAY "TWO FOR THE SHOW.".
           IF MENU-PICK = 3 
               DISPLAY "THREE TO GET READY.".
      * LEVEL 3 ROUTINES 
       DISPLAY-THE-MENU.
           DISPLAY "PLEASE ENTER THE NUMBER OF THE MESSAGE".
           DISPLAY "THAT YOU WISH TO DISPLAY.".
      * DISPLAY A BLANK LINE 
           DISPLAY "  ".
           DISPLAY "1.  FIRST MESSAGE".
           DISPLAY "2.  SECOND MESSAGE".
           DISPLAY "3.  THIRD  MESSAGE".
      * DISPLAY A BLANK LINE 
           DISPLAY "  ".
           DISPLAY "9. EXIT".
           DISPLAY "  ".
           DISPLAY "YOUR SELECTION (1-3)?".

       GET-THE-PICK.
           ACCEPT MENU-PICK. 
           


      
