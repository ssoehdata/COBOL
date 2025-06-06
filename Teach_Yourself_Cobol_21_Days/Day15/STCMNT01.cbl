      * Validating field Entry 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. STCMNT01.
      *----------------------------------------------------------
      *    Add, Change, Inquire and Delete for the State Code. 
      *----------------------------------------------------------
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           
           COPY "SLSTATE.CBL".

       DATA DIVISION.
       FILE SECTION.

           COPY "FDSTATE.CBL".

       WORKING-STORAGE SECTION. 
       77  MENU-PICK                   PIC 9. 
           88 MENU-PICK-IS-VALID       VALUES 0 THRU 4. 

       77  THE-MODE                    PIC X(7). 
       77  OK-TO-DELETE                PIC X. 
       77  RECORD-FOUND                PIC X. 
       77  WHICH-FIELD                 PIC 9.


       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 
           PERFORM OPENING-PROCEDURE. 
           PERFORM MAIN-PROCESS. 
           PERFORM CLOSING-PROCEDURE. 

       PROGRAM-DONE. 
           STOP RUN. 

       OPENING-PROCEDURE. 
           OPEN I-O STATE-FILE. 

       CLOSING-PROCEDURE.
           CLOSE STATE-FILE. 

       MAIN-PROCESS. 
           PERFORM GET-MENU-PICK.
           PERFORM MAINTAIN-THE-FILE 
               UNTIL MENU-PICK =  0. 
      ********************************************************
      *                    MENU 
      ********************************************************
       GET-MENU-PICK.
           PERFORM DISPLAY-THE-MENU. 
           PERFORM ACCEPT-MENU-PICK. 
           PERFORM RE-ACCEPT-MENU-PICK 
               UNTIL MENU-PICK-IS-VALID. 
       DISPLAY-THE-MENU.
           PERFORM CLEAR-SCREEN. 
           DISPLAY "   PLEASE SELECT:".
           DISPLAY "  ".
           DISPLAY "           1. ADD RECORDS".
           DISPLAY "           2. CHANGE A RECORD".
           DISPLAY "           3. LOOK UP A RECORD".
           DISPLAY "           4. DELETE A RECORD".
           DISPLAY " ".
           DISPLAY "           0. EXIT".
           PERFORM SCROLL-LINE 8 TIMES. 
       
       ACCEPT-MENU-PICK. 
           DISPLAY "YOUR CHOICE  (0-4)?".
           ACCEPT MENU-PICK. 
      
       RE-ACCEPT-MENU-PICK. 
           DISPLAY "INVALID SELECTION  - PLEASE RE-TRY.".
           PERFORM ACCEPT-MENU-PICK. 
          
       CLEAR-SCREEN. 
           PERFORM SCROLL-LINE 25 TIMES. 

       SCROLL-LINE. 
           DISPLAY " ".

       MAINTAIN-THE-FILE. 
           PERFORM DO-THE-PICK. 
           PERFORM GET-MENU-PICK. 

       DO-THE-PICK. 
           IF MENU-PICK = 1 
               PERFORM ADD-MODE 
           ELSE 
           IF MENU-PICK = 2 
               PERFORM CHANGE-MODE 
           ELSE 
           IF MENU-PICK = 3 
               PERFORM INQUIRE-MODE 
           ELSE 
           IF MENU-PICK = 4 
              PERFORM DELETE-MODE. 
      *****************************************************
      *                       ADD 
      *****************************************************
       ADD-MODE. 
           MOVE "ADD"  TO THE-MODE. 
           PERFORM GET-NEW-STATE-CODE. 
           PERFORM ADD-RECORDS 
               UNTIL STATE-CODE = "ZZ".
       
       GET-NEW-STATE-CODE. 
           PERFORM INIT-STATE-RECORD. 
           PERFORM ENTER-STATE-CODE. 
           MOVE "Y" TO RECORD-FOUND. 
           PERFORM FIND-NEW-STATE-RECORD 
               UNTIL RECORD-FOUND = "N" OR   
                   STATE-CODE = "ZZ".

       FIND-NEW-STATE-RECORD. 
           PERFORM READ-STATE-RECORD. 
           IF RECORD-FOUND = "Y" 
               DISPLAY "RECORD ALREADY ON FILE"
               PERFORM ENTER-STATE-CODE. 
       
       ADD-RECORDS. 
           PERFORM ENTER-REMAINING-FIELDS. 
           PERFORM WRITE-STATE-RECORD. 
           PERFORM GET-NEW-STATE-CODE. 

       ENTER-REMAINING-FIELDS. 
           PERFORM ENTER-STATE-NAME. 

      *****************************************************
      *                     CHANGE 
      ***************************************************** 
       CHANGE-MODE. 
           MOVE "CHANGE" TO THE-MODE. 
           PERFORM GET-STATE-RECORD. 
           PERFORM CHANGE-RECORDS 
               UNTIL STATE-CODE = "ZZ".
       
       CHANGE-RECORDS. 
           PERFORM GET-FIELD-TO-CHANGE. 
           PERFORM CHANGE-ONE-FIELD 
               UNTIL WHICH-FIELD = ZERO. 

           PERFORM GET-STATE-RECORD. 

       GET-FIELD-TO-CHANGE.
           PERFORM DISPLAY-ALL-FIELDS. 
           PERFORM ASK-WHICH-FIELD. 

       ASK-WHICH-FIELD.
           PERFORM ACCEPT-WHICH-FIELD.
           PERFORM RE-ACCEPT-WHICH-FIELD 
               UNTIL WHICH-FIELD NOT > 1.

       ACCEPT-WHICH-FIELD. 
           DISPLAY "ENTER THE NUMBER OF THE FIELD".
           DISPLAY "TO CHANGE (1) OR 0 TO EXIT".
           ACCEPT WHICH-FIELD.                  
               

       RE-ACCEPT-WHICH-FIELD. 
           DISPLAY "INVALID ENTRY".
           PERFORM ACCEPT-WHICH-FIELD.
              

       CHANGE-ONE-FIELD. 
           PERFORM CHANGE-THIS-FIELD. 
           PERFORM GET-FIELD-TO-CHANGE. 

       CHANGE-THIS-FIELD.
           IF WHICH-FIELD = 1 
               PERFORM ENTER-STATE-NAME. 

           PERFORM REWRITE-STATE-RECORD. 
          
      ****************************************************
      *                    INQUIRE 
      ****************************************************
       INQUIRE-MODE. 
           MOVE "DISPLAY" TO THE-MODE. 
           PERFORM GET-STATE-RECORD. 
           PERFORM INQUIRE-RECORDS 
               UNTIL STATE-CODE = "ZZ".

       INQUIRE-RECORDS. 
           PERFORM DISPLAY-ALL-FIELDS. 
           PERFORM GET-STATE-RECORD. 

      *****************************************************
      *                     DELETE 
      *****************************************************
       DELETE-MODE. 
           MOVE "DELETE" TO THE-MODE. 
           PERFORM GET-STATE-RECORD. 
           PERFORM DELETE-RECORDS 
               UNTIL STATE-CODE = "ZZ".

       DELETE-RECORDS. 
           PERFORM DISPLAY-ALL-FIELDS. 

           PERFORM ASK-OK-TO-DELETE 
           IF OK-TO-DELETE = "Y"
               PERFORM DELETE-STATE-RECORD. 

           PERFORM GET-STATE-RECORD. 

       ASK-OK-TO-DELETE.
           PERFORM ACCEPT-OK-TO-DELETE. 
           PERFORM RE-ACCEPT-OK-TO-DELETE 
               UNTIL OK-TO-DELETE = "Y"  OR "N". 

       ACCEPT-OK-TO-DELETE.
           DISPLAY "DELETE THIS RECORD (Y/N)?".
           ACCEPT OK-TO-DELETE. 
           IF OK-TO-DELETE = "y"
               MOVE "Y" TO OK-TO-DELETE. 
           IF OK-TO-DELETE = "n"
               MOVE "N" TO OK-TO-DELETE. 

       RE-ACCEPT-OK-TO-DELETE. 
           DISPLAY "YOU MUST ENTER YES OR NO". 
           PERFORM ACCEPT-OK-TO-DELETE. 

      ****************************************************
      *     Routines shared by all modes 
      ****************************************************
       INIT-STATE-RECORD. 
           MOVE SPACE TO STATE-RECORD. 

       ENTER-STATE-CODE. 
           PERFORM ACCEPT-STATE-CODE. 
           PERFORM RE-ACCEPT-STATE-CODE 
               UNTIL STATE-CODE NOT = SPACE. 

       ACCEPT-STATE-CODE. 
           DISPLAY " ".
           DISPLAY "ENTER STATE CODE OF THE STATE".
           DISPLAY "TO " THE-MODE 
                   "(2 UPPER CASE CHARACTERES)".
           DISPLAY "ENTER ZZ TO STOP ENTERY".
           ACCEPT STATE-CODE. 

       RE-ACCEPT-STATE-CODE. 
           DISPLAY "STATE CODE MUST BE ENTERED". 
           PERFORM ACCEPT-STATE-CODE. 

       GET-STATE-RECORD. 
           PERFORM INIT-STATE-RECORD. 
           PERFORM ENTER-STATE-CODE. 
           MOVE "N" TO RECORD-FOUND.
           PERFORM FIND-STATE-RECORD 
               UNTIL RECORD-FOUND = "Y" OR 
                   STATE-CODE = "ZZ".

      ***********************************************
      *    Routines shared Add and Change 
      ***********************************************
       FIND-STATE-RECORD. 
           PERFORM READ-STATE-RECORD.
           IF RECORD-FOUND = "N"
               DISPLAY "RECORD NOT FOUND"
               PERFORM ENTER-STATE-CODE. 

       ENTER-STATE-NAME. 
           PERFORM ACCEPT-STATE-NAME. 
           PERFORM RE-ACCEPT-STATE-NAME 
               UNTIL STATE-NAME NOT = SPACES. 

       ACCEPT-STATE-NAME.
           DISPLAY "ENTER STATE NAME".
           ACCEPT STATE-NAME. 

       RE-ACCEPT-STATE-NAME. 
           DISPLAY "STATE NAME MUST BE ENTERED".
           PERFORM ACCEPT-STATE-NAME. 

      ****************************************************
      *    Routines shared by Change, Inquire, Delete 
      ****************************************************
       DISPLAY-ALL-FIELDS.
           DISPLAY " ".
           PERFORM DISPLAY-STATE-CODE. 
           PERFORM DISPLAY-STATE-NAME. 
           DISPLAY " ".

       DISPLAY-STATE-CODE. 
           DISPLAY "   STATE CODE: "  STATE-CODE.
       
       DISPLAY-STATE-NAME.
           DISPLAY "1. STATE NAME: "  STATE-NAME.

      *****************************************************
      *                FILE I-O Routines
      *****************************************************
       READ-STATE-RECORD.
           MOVE "Y" TO RECORD-FOUND. 
           READ STATE-FILE RECORD 
               INVALID KEY 
                   MOVE "N" TO RECORD-FOUND. 
      * or READ STATE-FILE RECORD WITH LOCK 
      *        INVALID KEY 
      *                MOVE "N" TO RECORD-FOUND. 

      * or READ STATE-FILE RECORD WITH HOLD 
      *        INVALID KEY 
      *        DISPLAY "RECORD ALREADY ON FILE".

       WRITE-STATE-RECORD. 
           WRITE STATE-RECORD 
               INVALID KEY 
               DISPLAY "RECORD ALREADY ON FILE".

       REWRITE-STATE-RECORD. 
           REWRITE STATE-RECORD 
               INVALID KEY 
               DISPLAY "ERROR REWRITING STATE RECORD". 

       DELETE-STATE-RECORD. 
           DELETE STATE-FILE RECORD 
               INVALID KEY 
               DISPLAY "ERROR DELETING STATE RECORD".
               
               






       

       
       
           
       
      