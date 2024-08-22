       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLOWORLD.
       AUTHOR. HAL9000.
       DATE-WRITTEN. 01/03/2024.
       DATE-COMPILED. 01/03/2024.
       REMARKS. This program is a demonstration of hello world.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
       OBJECT-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       I-O-CONTROL.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
      *Report and SCREEN sections not available with IBM x86.
       REPORT SECTION.
       SCREEN SECTION. 
      *
       PROCEDURE DIVISION.
       DISPLAY "Hello World, from GNU Cobol."
       STOP RUN.
       

        

