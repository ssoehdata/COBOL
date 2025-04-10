000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. TEMPERATURES.
000300 DATA DIVISION.
000400 WORKING-STORAGE SECTION.
000500 01  FAHRENHEIT-TEMPERATURE PIC 99.9.
000600 01  CENTIGRADE-TEMPERATURE PIC 99.
000700 01  MORE-DATA              PIC XXX  VALUE 'YES'.
000800 PROCEDURE DIVISION.
000900 100-MAIN.
001000     PERFORM UNTIL MORE-DATA = 'NO'
001100         DISPLAY 'ENTER A CENTRIGRADE TEMPERATURE AS AN INTEGER'
001200         ACCEPT CENTIGRADE-TEMPERATURE
001300         COMPUTE FAHRENHEIT-TEMPERATURE = 1.8 *
001400             CENTIGRADE-TEMPERATURE + 32
001500         DISPLAY 'FAHRENHEIT TEMPERATURE ',FAHRENHEIT-TEMPERATURE
001600         DISPLAY 'IS THERE MORE INPUT (YES OR NO)?'
001700         ACCEPT MORE-DATA 
001800     END-PERFORM
001900     STOP RUN.
002000
002100
