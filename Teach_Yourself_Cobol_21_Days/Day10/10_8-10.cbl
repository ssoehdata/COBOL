      *Listing 10.8. The structure for the report detail.

      *The main part of the report is detail lines holding 
      *enough space for each field, with a space between each field,
      *as shown in Listing 10.8.

       01 DETAIL-LINE.

           05 PRINT-LAST-NAME   PIC X(20).

           05 FILLER            PIC X(1) VALUE SPACE. 

           05 PRINT-FIRST-NAME  PIC X(20).

           05 FILLER           PIC X(1) VALUE SPACE.

           05 PRINT-NUMBER     PIC X(15).
           05 FILLER           PIC X(1) VALUE SPACE.                                                                            
           05 PRINT-EXTENSION

      *The top line of the report is a title line; 
      *the structure shown in Listing 10.9 holds the title 
      *for the report and an incrementing page number. 

*Listing 10.9. The structure for the title.
       01  TITLE-LINE.
           05 FILLER     PIC X(21) VALUE SPACE.
           05 FILLER     PIC X(17) VALUE.
           "PHONE BOOK REPORT".
           05 FILLER     PIC X(15) VALUE SPACE.
           05 FILLER     PIC X(5) VALUE "Page:".
           05 FILLER   
           05 PRINT-PAGE-NUMBER PIC ZZZZ9.

      *The second line at the top of each page of the report 
      *is for column headings; the structure shown in Listing
      *10.10 is used to print the columns. The column headings 
      *do not change, so all the values in
      *COLUMN-HEADINGS are defined as FILLER.

      *Listing 10.10. The column headings.
       01  COLUMN-HEADINGS.

           05 FILLER   PIC X(9)    VALUE "Last Name".
           05 FILLER   PIC X(12)   VALUE SPACE.
           05 FILLER   PIC X(10)   VALUE "First Name".
           05 FILLER   PIC X(11)   VALUE SPACE.
           05 FILLER   PIC X(6)    VALUE "Number".
           05 FILLER   PIC X(10)   VALUE SPACE.
           05 FILLER   PIC X(4)    VALUE "Ext.".

         
