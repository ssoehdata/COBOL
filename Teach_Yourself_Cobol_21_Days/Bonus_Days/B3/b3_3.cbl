      * Basic vendor maintenance screen 
       01  VENDOR-SCREEN.
           05 BLANK SCREEN.
           05 LINE 4 COLUMN 20 VALUE "VENDOR NUMBER:".
           05 LINE 4 COLUMN 40 PIC Z(5) USING VENDOR-NUMBER.
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
           05 LINE 22 COLUMN 1 PIC X(79) FROM 2ND-FOOTER-FIELD.        
           05 LINE 24 COLUMN 1 PIC X(79) FROM ERROR-MESSAGE.
           