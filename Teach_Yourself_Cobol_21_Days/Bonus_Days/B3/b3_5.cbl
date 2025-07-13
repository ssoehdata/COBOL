      * Maintenance using full-screen I/O
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. VNDMNT06.
      *---------------------------------------
      * Add, Change, Inquire and Delete 
      * for the Vendor FIle.
      * This includes Inquire by name 
      * The vendor report, and the vendor
      * report in name order.
      * Added Display all records.
      * Uses full screen IO.
      *-----------------------------------------
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 

           COPY "SLVND02.CBL".

           COPY "SLSTATE.CBL".

       DATA DIVISION. 
       FILE SECTION.

           COPY "FDVND04.CBL".

           COPY "FDSTATE.CBL".

       WORKING-STORAGE SECTION.

       77  MENU-PICK               PIC 9 VALUE ZERO.
           88 MENU-PICK-IS-VALID   VALUES 0 THRU 8. 

       77  VENDOR-RECORD-FOUND     PIC X. 
       77  STATE-RECORD-FOUND      PIC X. 

       77  SCREEN-ERROR            PIC X. 
       77  ERROR-MESSAGE           PIC X(79) VALUE SPACE. 

       77  CONTINUE-MESSAGE        PIC X(40) VALUE SPACE. 
       77  OK-TO-CONTINUE          PIC X. 

       01  FOOTER-FIELD.
           05 FOOTER-1-FIELD       PIC X(40) VALUE SPACE. 
           05 FOOTER-2-FIELD       PIC X(39) VALUE SPACE. 

           COPY "WSCASE01.CBL".

       SCREEN SECTION.
       01  MENU-SCREEN.
           05 BLANK SCREEN. 
           05 LINE 2 COLUMN    30      VALUE "VENDOR MAINTENANCE".
           05 LINE 6 COLUMN    20      VALUE "PLEASE SELECT:".
           05 LINE 8 COLUMN    25      VALUE  "1.ADD RECORDS".
           05 LINE 9 COLUMN    25      VALUE  "2.CHANGE A RECORD".
           05 LINE 10 COLUMN   25      VALUE  "3.LOOK UP A RECORD".
           05 LINE 11 COLUMN   25      VALUE  "4.DELETE A RECORD".
           05 LINE 12 COLUMN   25      VALUE  "5.LOOK UP A NAME".
           05 LINE 13 COLUMN   25      VALUE  "6.PRINT NAME".
           05 LINE 14 COLUMN   25      VALUE  "7.PRINT IN NAME ORDER".
           05 LINE 15 COLUMN   25      VALUE  "8.DISPLAY ALL RECORDS".
           05 LINE 17 COLUMN   25      VALUE  "0.EXIT".
           05 LINE 20 COLUMN   1       VALUE  "YOUR SELECTION?".                
           05 LINE 20 COLUMN   17      VALUE  ".".
           05 LINE 24 COLUMN   1       PIC X(79) FROM ERROR-MESSAGE.
       

       01  KEY-SCREEN.
           05 BLANK SCREEN.
           05 LINE 4 COLUMN 20 VALUE "VENDOR NUMBER:".
           05 LINE 4 COLUMN 40 PIC Z(5) USING VENDOR-NUMBER.
           05 LINE 22 COLUMN 1 PIC X(79) FROM FOOTER-FIELD.
           05 LINE 24 COLUMN 1 PIC X(79) FROM ERROR-MESSAGE.        

       01  ENTRY-SCREEN.
           05 BLANK SCREEN. 
           05 LINE 4 COLUMN 20 VALUE "VENDOR NUMBER:".           
           05 LINE 4 COLUMN 40 PIC Z(5) FROM VENDOR-NUMBER.
           05 LINE 6 COLUMN 20 VALUE "VENDOR NAME: ".
           05 LINE 6 COLUMN 40 PIC X(30) USING VENDOR-NAME.
           05 LINE 8 COLUMN 20 VALUE "VENDOR ADDRESS:".
           05 LINE 8 COLUMN 40 PIC X(30) USING VENDOR-ADDRESS-1.
           05 LINE 9 COLUMN 40 PIC X(30) USING VENDOR-ADDRESS-2.
           05 LINE 10 COLUMN 20 VALUE "VENDOR CITY:".
           05 LINE 10 COLUMN 40 PIC X(20) USING VENDOR-CITY.
           05 LINE 12 COLUMN 20 VALUE "VENDOR STATE:".
           05 LINE 12 COLUMN 40 PIC XX USING VENDOR-STATE.
           05 LINE 12 COLUMN 45 PIC X(20) FROM STATE-NAME.
           05 LINE 14 COLUMN 20 VALUE "VENDOR ZIP:".
           05 LINE 14 COLUMN 40 PIC X(10) USING VENDOR-ZIP.
           05 LINE 16 COLUMN 20 VALUE "VENDOR CONTACT:".
           05 LINE 16 COLUMN 40 PIC X(30) USING VENDOR-CONTACT.
           05 LINE 18 COLUMN 20 VALUE "VENDOR PHONE:".
           05 LINE 18 COLUMN 40 PIC X(15) USING VENDOR-PHONE.
           05 LINE 22 COLUMN 1 PIC X(79) FROM FOOTER-FIELD.
           05 LINE 23 COLUMN 1 PIC X(40) FROM CONTINUE-MESSAGE.
           05 LINE 23 COLUMN 41 PIC X USING OK-TO-CONTINUE.
           05 LINE 24 COLUMN 1 PIC X(79) FROM ERROR-MESSAGE.

       01  DISPLAY-SCREEN.  
           05 BLANK SCREEN.
           05 LINE 4 COLUMN 20 VALUE "VENDOR NUMBER:".
           05 LINE 4 COLUMN 40 PIC Z(5) FROM VENDOR-NUMBER.
           05 LINE 6 COLUMN 20 VALUE "VENDOR NAME: ".
           05 LINE 6 COLUMN 40 PIC X(30) FROM VENDOR-NAME.
           05 LINE 8 COLUMN 20 VALUE "VENDOR ADDRESS:".
           05 LINE 8 COLUMN 40 PIC X(30) FROM VENDOR-ADDRESS-1.
           05 LINE 9 COLUMN 40 PIC X(30) FROM VENDOR-ADDRESS-2.
           05 LINE 10 COLUMN 20 VALUE "VENDOR CITY:".
           05 LINE 10 COLUMN 40 PIC X(20) FROM VENDOR-CITY.
           05 LINE 12 COLUMN 20 VALUE "VENDOR STATE:".
           05 LINE 12 COLUMN 40 PIC XX FROM VENDOR-STATE.
           05 LINE 12 COLUMN 45 PIC X(20) FROM STATE-NAME.
           05 LINE 14 COLUMN 20 VALUE "VENDOR ZIP:".
           05 LINE 14 COLUMN 40 PIC X(10) FROM VENDOR-ZIP.
           05 LINE 16 COLUMN 20 VALUE "VENDOR CONTACT:".
           05 LINE 16 COLUMN 40 PIC X(30) FROM VENDOR-CONTACT.
           05 LINE 18 COLUMN 20 VALUE "VENDOR PHONE:".
           05 LINE 18 COLUMN 40 PIC X(15) FROM VENDOR-PHONE.
           05 LINE 23 COLUMN 1 PIC X(40) FROM CONTINUE-MESSAGE.
           05 LINE 23 COLUMN 41 PIC X USING OK-TO-CONTINUE.
           05 LINE 24 COLUMN 1 PIC X(79) FROM ERROR-MESSAGE.
       
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM OPENING-PROCEDURE.
           PERFORM MAIN-PROCESS.
           PERFORM CLOSING-PROCEDURE. 

       PROGRAM-EXIT. 
           EXIT PROGRAM.
          
       PROGRAM-DONE. 
           STOP RUN. 

       OPENING-PROCEDURE. 
           OPEN I-O VENDOR-FILE.
           OPEN I-O STATE-FILE. 

       CLOSING-PROCEDURE. 
           CLOSE VENDOR-FILE.
           CLOSE STATE-FILE. 

       MAIN-PROCESS.
           PERFORM GET-MENU-PICK.
           PERFORM MAINTAIN-THE-FILE 
               UNTIL MENU-PICK = 0.

      *------------------------------------
      *    MENU 
      *------------------------------------
       GET-MENU-PICK.
           PERFORM INITIALIZE-MENU-PICK.
           PERFORM DISPLAY-ACCEPT-MENU.
           PERFORM RE-DISPLAY-ACCEPT-MENU
               UNTIL MENU-PICK-IS-VALID.

       INITIALIZE-MENU-PICK.
           MOVE 0 TO MENU-PICK.

       DISPLAY-ACCEPT-MENU.
           DISPLAY MENU-SCREEN.
           ACCEPT MENU-SCREEN. 
           MOVE SPACE TO ERROR-MESSAGE. 

       RE-DISPLAY-ACCEPT-MENU.
           MOVE "INVALID SELECTION - PLEASE RE-TRY."
               TO ERROR-MESSAGE.
           PERFORM DISPLAY-ACCEPT-MENU. 

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
               PERFORM CHANGE-MODE
           ELSE 
           IF MENU-PICK = 4
               PERFORM DELETE-MODE
           ELSE 
           IF MENU-PICK = 5
               PERFORM INQUIRE-BY-NAME
           ELSE 
           IF MENU-PICK = 6
               PERFORM PRINT-VENDOR-REPORT 
           ELSE 
           IF MENU-PICK = 7 
               PERFORM PRINT-BY-NAME 
           ELSE 
           IF MENU-PICK = 8 
               PERFORM DISPLAY-ALL. 

      *-------------------------------------------
      *    ADD 
      *-------------------------------------------
       ADD-MODE.
           PERFORM INITIALIZE-ADD-MODE.
           PERFORM GET-NEW-RECORD-KEY.
           PERFORM ADD-RECORDS
               UNTIL VENDOR-NUMBER = ZEROES. 
           INITIALIZE-ADD-MODE.

           MOVE "ENTER THE VENDOR NUMBER TO ADD"

           TO FOOTER-1-FIELD.

       GET-NEW-RECORD-KEY.

           PERFORM ACCEPT-NEW-RECORD-KEY.
           PERFORM RE-ACCEPT-NEW-RECORD-KEY
           UNTIL VENDOR-NUMBER = ZEROES
           OR VENDOR-RECORD-FOUND = "N".

       ACCEPT-NEW-RECORD-KEY.
           PERFORM INITIALIZE-VENDOR-FIELDS.
           PERFORM ENTER-VENDOR-NUMBER.
           IF VENDOR-NUMBER NOT = ZEROES
           PERFORM READ-VENDOR-RECORD.

       RE-ACCEPT-NEW-RECORD-KEY.
           MOVE "RECORD ALREADY ON FILE" TO ERROR-MESSAGE.
           PERFORM ACCEPT-NEW-RECORD-KEY.

       ADD-RECORDS.
           PERFORM INITIALIZE-TO-ADD-FIELDS.
           PERFORM ENTER-REMAINING-FIELDS.
           IF OK-TO-CONTINUE = "Y"
           PERFORM WRITE-VENDOR-RECORD.
           PERFORM GET-NEW-RECORD-KEY.

       INITIALIZE-TO-ADD-FIELDS.
           MOVE "ADD NEW FIELDS" TO FOOTER-FIELD.
           MOVE "CONTINUE WITH ADDITIONS (Y/N)?"
           TO CONTINUE-MESSAGE.
           MOVE "Y" TO OK-TO-CONTINUE.

      *---------------------------------
      *    CHANGE 
      *---------------------------------
       CHANGE-MODE.
           PERFORM INITIALIZE-CHANGE-MODE.
           PERFORM GET-EXISTING-RECORD.
           PERFORM CHANGE-RECORDS
               UNTIL VENDOR-NUMBER = ZEROES.

       INITIALIZE-CHANGE-MODE.
           MOVE "ENTER THE VENDOR NUMBER TO CHANGE"
               TO FOOTER-1-FIELD. 

       CHANGE-RECORDS.
           PERFORM INITIALIZE-TO-CHANGE-FIELDS.
           PERFORM ENTER-REMAINING-FIELDS.
           IF OK-TO-CONTINUE = "Y"
           PERFORM REWRITE-VENDOR-RECORD.
           PERFORM GET-EXISTING-RECORD.

       INITIALIZE-TO-CHANGE-FIELDS.
           MOVE "CHANGE FIELDS" TO FOOTER-FIELD.
           MOVE "CONTINUE WITH CHANGES (Y/N)?"
           TO CONTINUE-MESSAGE.
           MOVE "Y" TO OK-TO-CONTINUE.

      *------------------------------
      *    INQUIRE
      *------------------------------
       INQUIRE-MODE. 
           PERFORM INITIALIZE-INQUIRE-MODE.
           PERFORM GET-EXISTING-RECORD. 
           PERFORM INQUIRE-RECORDS 
               UNTIL VENDOR-NUMBER = ZEROES.

       INITIALIZE-INQUIRE-MODE.

           MOVE "ENTER THE VENDOR NUMBER TO DISPLAY"

           TO FOOTER-1-FIELD.
           
       INQUIRE-RECORDS.
           PERFORM INITIALIZE-TO-INQUIRE.
           PERFORM DISPLAY-ACCEPT-ALL-FIELDS.
           PERFORM GET-EXISTING-RECORD.

       INITIALIZE-TO-INQUIRE.
           MOVE "PRESS ENTER TO CONTINUE" TO CONTINUE-MESSAGE.    
           MOVE SPACE TO OK-TO-CONTINUE.
                  
      *-------------------------------------
      *    DELETE 
      *-------------------------------------
       DELETE-MODE.
           PERFORM INITIALIZE-DELETE-MODE.
           PERFORM GET-EXISTING-RECORD. 
           PERFORM DELETE-RECORDS 
               UNTIL VENDOR-NUMBER = ZEROES. 

       INITIALIZE-DELETE-MODE.

           MOVE "ENTER THE VENDOR NUMBER TO DELETE"

           TO FOOTER-1-FIELD.

       DELETE-RECORDS.
           PERFORM INITIALIZE-TO-DELETE-RECORD.
           PERFORM ASK-OK-TO-DELETE.
           IF OK-TO-CONTINUE = "Y"
           PERFORM DELETE-VENDOR-RECORD.
           PERFORM GET-EXISTING-RECORD.

       INITIALIZE-TO-DELETE-RECORD.
           MOVE "OK TO DELETE(Y/N)?" TO CONTINUE-MESSAGE.
           MOVE "N" TO OK-TO-CONTINUE.

       ASK-OK-TO-DELETE.
           PERFORM DISPLAY-ACCEPT-ALL-FIELDS.
           PERFORM RE-DISPLAY-ACCEPT-ALL-FIELDS
           UNTIL OK-TO-CONTINUE = "Y" OR "N".

       RE-DISPLAY-ACCEPT-ALL-FIELDS.
           MOVE "YOU MUST ENTER YES OR NO"
           TO ERROR-MESSAGE.
           PERFORM DISPLAY-ACCEPT-ALL-FIELDS.
                 
      *--------------------------------
      * Routines shared by all modes
      *--------------------------------
       INITIALIZE-VENDOR-FIELDS.           
           MOVE SPACE TO VENDOR-RECORD.           
           MOVE ZEROES TO VENDOR-NUMBER.           
           MOVE SPACE TO STATE-NAME.
           
       ENTER-VENDOR-NUMBER.            
           MOVE "ENTER 0 TO QUIT" TO FOOTER-2-FIELD.           
           DISPLAY KEY-SCREEN.           
           ACCEPT KEY-SCREEN.           
           MOVE SPACE TO ERROR-MESSAGE.
       
      *---------------------------------------
      *    Routines shared by Add and Change
      *----------------------------------------
       ENTER-REMAINING-FIELDS.
           PERFORM DISPLAY-ACCEPT-ENTRY-SCREEN. 
           PERFORM DISPLAY-ACCEPT-ENTRY-SCREEN 
               UNTIL SCREEN-ERROR = "N"
                    OR OK-TO-CONTINUE = "N".

       DISPLAY-ACCEPT-ENTRY-SCREEN. 
           DISPLAY ENTRY-SCREEN.
           ACCEPT ENTRY-SCREEN. 
           MOVE SPACE TO ERROR-MESSAGE. 

           INSPECT OK-TO-CONTINUE 
               CONVERTING LOWER-ALPHA TO UPPER-ALPHA.

           IF OK-TO-CONTINUE = "Y"
               PERFORM EDIT-CHECK-FIELDS. 

       EDIT-CHECK-FIELDS.
           MOVE "N" TO SCREEN-ERROR.
           PERFORM EDIT-CHECK-VENDOR-NAME.
           IF SCREEN-ERROR NOT = "Y" 
               PERFORM EDIT-CHECK-VENDOR-ADDRESS-1. 
           IF SCREEN-ERROR NOT = "Y"
               PERFORM EDIT-CHECK-VENDOR-ADDRESS-2. 
           IF SCREEN-ERROR NOT = "Y"
               PERFORM EDIT-CHECK-VENDOR-CITY.
           IF SCREEN-ERROR NOT = "Y"
               PERFORM EDIT-CHECK-VENDOR-STATE.
           IF SCREEN-ERROR NOT = "Y"
               PERFORM EDIT-CHECK-VENDOR-ZIP.
           IF SCREEN-ERROR NOT = "Y"
               PERFORM EDIT-CHECK-VENDOR-CONTACT.  
           IF SCREEN-ERROR NOT = "Y"
               PERFORM EDIT-CHECK-VENDOR-PHONE.
       
       EDIT-CHECK-VENDOR-NAME.
           INSPECT VENDOR-NAME
               CONVERTING  LOWER-ALPHA 
               TO          UPPER-ALPHA.

           IF VENDOR-NAME = SPACES 
               MOVE "Y" TO SCREEN-ERROR 
               MOVE "VENDOR NAME MUST BE ENTERED"
                   TO ERROR-MESSAGE. 

       EDIT-CHECK-VENDOR-ADDRESS-1.
           INSPECT VENDOR-ADDRESS-1
               CONVERTING  LOWER-ALPHA
               TO          UPPER-ALPHA.

           IF VENDOR-ADDRESS-1 = SPACE
               MOVE "Y" TO SCREEN-ERROR
               MOVE "VENDOR ADDRESS-1 MUST BE ENTERED"
               TO ERROR-MESSAGE.
       EDIT-CHECK-VENDOR-ADDRESS-2.
      
            INSPECT VENDOR-ADDRESS-2

            CONVERTING LOWER-ALPHA

            TO
            UPPER-ALPHA.

       EDIT-CHECK-VENDOR-CITY.
           INSPECT VENDOR-CITY
           CONVERTING LOWER-ALPHA
           TO         UPPER-ALPHA.


           IF VENDOR-CITY = SPACE
           MOVE "Y" TO SCREEN-ERROR
           MOVE "VENDOR CITY MUST BE ENTERED"
           TO ERROR-MESSAGE.

       EDIT-CHECK-VENDOR-STATE.
           PERFORM EDIT-VENDOR-STATE.
           PERFORM CHECK-VENDOR-STATE.

       EDIT-VENDOR-STATE.
           INSPECT VENDOR-STATE
           CONVERTING LOWER-ALPHA
           TO
           UPPER-ALPHA.
    
       CHECK-VENDOR-STATE.
           PERFORM VENDOR-STATE-REQUIRED.  
           IF VENDOR-STATE NOT = SPACES 
           PERFORM VENDOR-STATE-ON-FILE.
    
       VENDOR-STATE-REQUIRED.         
           IF VENDOR-STATE = SPACE        
           MOVE "Y" TO SCREEN-ERROR       
           MOVE "VENDOR STATE MUST BE ENTERED"     
           TO ERROR-MESSAGE.

       VENDOR-STATE-ON-FILE.      
           MOVE VENDOR-STATE TO STATE-CODE.      
           PERFORM READ-STATE-RECORD.       
           IF STATE-RECORD-FOUND = "N"       
           MOVE "Y" TO SCREEN-ERROR       
           MOVE "STATE CODE NOT FOUND IN CODES FILE"        
           TO ERROR-MESSAGE.
       
       EDIT-CHECK-VENDOR-ZIP.     
            INSPECT VENDOR-ZIP      
            CONVERTING LOWER-ALPHA       
            TO         UPPER-ALPHA.
      
            IF VENDOR-ZIP = SPACE       
            MOVE "Y" TO SCREEN-ERROR   
            MOVE "VENDOR ZIP MUST BE ENTERED"    
            TO ERROR-MESSAGE.
         
        EDIT-CHECK-VENDOR-CONTACT.     
            INSPECT VENDOR-CONTACT     
            CONVERTING LOWER-ALPHA    
            TO         UPPER-ALPHA.
 
       EDIT-CHECK-VENDOR-PHONE.      
            INSPECT VENDOR-PHONE   
            CONVERTING LOWER-ALPHA      
            TO         UPPER-ALPHA.
    
           IF VENDOR-PHONE = SPACE       
               MOVE "Y" TO SCREEN-ERROR       
               MOVE "ENTER VENDOR PHONE"       
                   TO ERROR-MESSAGE.

      *---------------------------------------------------
      *    Routines shared by Change, Inquire and Delete
      *----------------------------------------------------
       GET-EXISTING-RECORD.
           PERFORM INITIALIZE-VENDOR-FIELDS.
           PERFORM ACCEPT-EXISTING-KEY. 
           PERFORM RE-ACCEPT-EXISTING-KEY 
               UNTIL VENDOR-RECORD-FOUND = "Y" OR   
                     VENDOR-NUMBER = ZEROES.

       ACCEPT-EXISTING-KEY.
           PERFORM ENTER-VENDOR-NUMBER.
           IF VENDOR-NUMBER NOT = ZEROES
           PERFORM READ-VENDOR-AND-STATE.

       RE-ACCEPT-EXISTING-KEY.
           MOVE "RECORD NOT FOUND" TO ERROR-MESSAGE.
           PERFORM ACCEPT-EXISTING-KEY.
                  
      *-----------------------------------------------
      *    Routines shared by delete and inquire 
      *-----------------------------------------------
       DISPLAY-ACCEPT-ALL-FIELDS.
           DISPLAY DISPLAY-SCREEN.
           ACCEPT DISPLAY-SCREEN.
           MOVE SPACE TO ERROR-MESSAGE.
           INSPECT OK-TO-CONTINUE
            CONVERTING LOWER-ALPHA TO UPPER-ALPHA.

      *-------------------------------------------------
      *    FILE I-O Routines 
      *------------------------------------------------- 
       READ-VENDOR-AND-STATE.

           PERFORM READ-VENDOR-RECORD.
           IF VENDOR-RECORD-FOUND = "Y"
           MOVE VENDOR-STATE TO STATE-CODE
           PERFORM READ-STATE-RECORD
           IF STATE-RECORD-FOUND = "N"
           MOVE "*** NOT FOUND ***" TO STATE-NAME.

       READ-VENDOR-RECORD.          
           MOVE "Y" TO VENDOR-RECORD-FOUND.
           READ VENDOR-FILE RECORD
           INVALID KEY
           MOVE "N" TO VENDOR-RECORD-FOUND.

       WRITE-VENDOR-RECORD.
           WRITE VENDOR-RECORD
           INVALID KEY
           DISPLAY "RECORD ALREADY ON FILE".

       REWRITE-VENDOR-RECORD.
           REWRITE VENDOR-RECORD
           INVALID KEY
           DISPLAY "ERROR REWRITING VENDOR RECORD".

       DELETE-VENDOR-RECORD.
           DELETE VENDOR-FILE RECORD
           INVALID KEY
           DISPLAY "ERROR DELETING VENDOR RECORD".

       READ-STATE-RECORD.
           MOVE "Y" TO STATE-RECORD-FOUND.
           READ STATE-FILE RECORD
           INVALID KEY
           MOVE "N" TO STATE-RECORD-FOUND.

      *-------------------------------------------
      *    CALLS TO OTHER PROGRAMS 
      *------------------------------------------- 

      *-------------------------------------------
      *    INQUIRE BY NAME 
      *-------------------------------------------
       INQUIRE-BY-NAME.
           PERFORM CLOSING-PROCEDURE.
           CALL "VNINNM03".
           PERFORM OPENING-PROCEDURE.

      *---------------------------------------------
      *    PRINT 
      *---------------------------------------------
       PRINT-VENDOR-REPORT. 
           PERFORM CLOSING-PROCEDURE. 
           DISPLAY "VENDOR REPORT IN PROGRESS".
           CALL "VNDRPT04".
           PERFORM OPENING-PROCEDURE.

      *----------------------------------------------
      *    PRINT BY NAME 
      *----------------------------------------------
       PRINT-BY-NAME.
           PERFORM CLOSING-PROCEDURE. 
           DISPLAY "REPORT BY NAME IN PROGRESS".
           CALL "VNBYNM02".
           PERFORM OPENING-PROCEDURE.

      *-------------------------------------------------
      *    DISPLA ALL 
      *--------------------------------------------------
       DISPLAY-ALL.
           PERFORM CLOSING-PROCEDURE.
           CALL "VNDDSP03".
           DISPLAY "DISPLAY COMPLETE".
           DISPLAY "PRESS ENTER TO CONTINUE". 
           ACCEPT OK-TO-CONTINUE.
           PERFORM OPENING-PROCEDURE. 
           
           