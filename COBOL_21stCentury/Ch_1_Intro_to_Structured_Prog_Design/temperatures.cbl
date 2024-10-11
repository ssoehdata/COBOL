       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEMPERATURES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  FAHRENHEIT-TEMPERATURE PIC 99.9.
       01  CENTIGRADE-TEMPERATURE PIC 99.
       01  MORE-DATA              PIC XXX  VALUE 'YES'.
       PROCEDURE DIVISION.
       100-MAIN.
           PERFORM UNTIL MORE-DATA = 'NO'
               DISPLAY 'ENTER A CENTRIGRADE TEMPERATURE AS AN INTEGER'
               ACCEPT CENTIGRADE-TEMPERATURE
               COMPUTE FAHRENHEIT-TEMPERATURE = 1.8 *
                   CENTIGRADE-TEMPERATURE + 32
               DISPLAY 'FAHRENHEIT TEMPERATURE ',FAHRENHEIT-TEMPERATURE
               DISPLAY 'IS THERE MORE INPUT (YES OR NO)?'
               ACCEPT MORE-DATA 
           END-PERFORM
           STOP RUN.

      