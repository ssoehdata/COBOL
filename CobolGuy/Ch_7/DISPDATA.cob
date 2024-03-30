000100*DataFormatting from Video 7/CobolGuySeries
000200 IDENTIFICATION DIVISION.
000400 PROGRAM-ID. DISPDATA.
000500 AUTHOR. HAL9000.
000600 DATE-WRITTEN. 27.32024.
000700 DATE-COMPILED. 27.3.2024.
000800 REMARKS. Demonstrating formatting for Data Types.
000900*
001000 ENVIRONMENT DIVISION.
001100 CONFIGURATION SECTION.
001200 SOURCE-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001300 OBJECT-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001400 INPUT-OUTPUT SECTION.
001500 FILE-CONTROL.
001600 I-O-CONTROL.
001800 DATA DIVISION.
      * Note: if the LINKAGE SECTION is not commented out,gnucobol 
      * throws compiler errors. 
      * LINKAGE SECTION.
      *The Linlage Section is used to pass data between cobol programs
      * and to receive data from the JCL. 
001900 FILE SECTION.
002000 WORKING-STORAGE SECTION.
      *Working stoarge section memory allocated when program starts
       77 WS_Counter           pic 9999  value 0.
      * comp vars are used to perform math ops, before passing on to
      * a different variable type for printing output to display.
       77 Comp1_Var1           usage is Comp-1 value is 1234.5.
       77 Comp2_Var2           usage is Comp-2 value is 36.987699.
      *create a var PrintComp to define better display formatting. 
      * the z(3) will suppress leading zeroes (3 in this case)
      *one 9 is included to retain one leading zero for fractional vals.
      *
      *Adding a '$' sign in front to be displayed, removing the '+'
      *reducing the trailing decimals to 2 places for currency values.
      *if less space infront of the characters displayed is desired
      * remove the 'z' in front of the '$' sign
      * between them. e.g.: pic $z
      *77 PrintComp // with extra space//     pic $z(3)9.99 value is 0.
      * without the extra space in front of '$' sign
      * need to have (4) to display all leading digits of 1234.5 value.
      *
      * various formattin characters: $, +, -, z, ., 
       77 PrintComp              pic $(4)9.99 value is 0.
002100 LOCAL-STORAGE SECTION.
      *Local Storage memory is re-alloc each time a func is called.
       77 LS_Counter              pic 9999        value is 0.
002200 REPORT SECTION.
002300 SCREEN SECTION. 
002400*
002500 PROCEDURE DIVISION.
       BEGIN.
026000 DISPLAY "From Video Nr. 7 / Display Data Types."
       DISPLAY Comp1_Var1.
       DISPLAY Comp2_Var2.
      *IBM's cobol compiler has a ROUND function,GNUCobol does not.
      *To round the value of 36.987699 we need to do the folliowing:
      * below will round up to digits after the decimal place
      * to display $36.99
      * Nota bene.: keep in mind the pic clause value for decimal places
      * you define! e.g. if you instead had pic $(4)9.9999 you could 
      * display rounded values at higher precision 
       compute PrintComp = Comp1_Var1 + .005.
      *move Comp1_Var1 to PrintComp.
       Display PrintComp.
      *move Comp2_Var2 to PrintComp. 
       compute PrintComp = Comp2_Var2 + .005.
       Display PrintComp. 
027000 STOP RUN.
       END PROGRAM DISPDATA. 

        

