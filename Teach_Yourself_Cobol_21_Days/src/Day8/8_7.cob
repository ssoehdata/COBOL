      * A sample structure variable used to display an employee 
      * number and an hourly rate earned. 

000900 01  EMPLOYEE-DATA.
001000 05  FILLER              PIC X(4)
001100     VALUE "Emp ".
001200 05  EMP-NUMBER          PIC 9999.
001300 05  FILLER              PIC X(7)
001400     VALUE " earns ".
001500 05  EMP-HOURLY          PIC Z9.99.


      *The two fillers, as well as EMP-NUMBER and EMP-HOURLY, 
      *occupy some bytes that are in the same space in memory 
      *as the structure variable EMPLOYEE-DATA
      