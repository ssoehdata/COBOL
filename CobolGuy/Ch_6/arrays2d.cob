000100*2-DArrays from Vide0 6 in the series
      * awk -i inplace '{printf("%04d00%s\n", NR, substr($0,7,120)) }' 
      *filename.cob
000200 IDENTIFICATION DIVISION.
000400 PROGRAM-ID. Arrays2d.
000500 AUTHOR. HAL9000.
000600 DATE-WRITTEN. 01/03/2024.
000700 DATE-COMPILED. 01/03/2024.
000800 REMARKS. This demonstrates multi-dim arrays.
000900*
001000 ENVIRONMENT DIVISION.
001100 CONFIGURATION SECTION.
001200 SOURCE-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001300 OBJECT-COMPUTER. Mint_Cinnamon_Linux_Oubuntu_21_0_Vanessa.
001400 INPUT-OUTPUT SECTION.
001500 FILE-CONTROL.
001600 I-O-CONTROL.
001700*
001800 DATA DIVISION.
001900 FILE SECTION.
002000 WORKING-STORAGE SECTION.
      *Working storage section memory allocated when the program starts
      * Here we specify some constants NUMROWS and NUMCOLS
       78 NUMROWS  Value 10.
       78 NUMCOLS  Value 10. 
       78 NUMCELLS Value 10. 
       

       77 WS_Counter      pic 9999  value 0.
      * 
       01 Two_Dim_Array.
       05 TDA_Rows occurs NUMROWS times indexed by TDA_Row_Index.
      * TDA Columns needs to be a data level below columns(i.e.10 vs.5)
       10 TDA_Cols occurs NUMCOLS times indexed by TDA_Col_Index                   
      * let's add another dimension to the array (for a 3d array)   
       pic 9(5) USAGE IS BINARY.   

       LOCAL-STORAGE SECTION.
       77 LS_Counter     pic 9999     value 0.

002100*LINKAGE SECTION.
002150
002200*REPORT SECTION.
002300*SCREEN SECTION. 
002400*
002500 PROCEDURE DIVISION.
       BEGIN.
026000     DISPLAY "2D-Arrays in Cobol."
           PERFORM varying TDA_Row_Index from 1 by 1 until 
           TDA_Row_Index > NUMROWS
           PERFORM varying TDA_Col_Index from 1 by 1 until 
           TDA_Col_Index > NUMCOLS 
           compute TDA_Cols(TDA_Row_Index, TDA_Col_Index) =
           (TDA_Row_Index * 10000) + TDA_Col_Index
           END-PERFORM
       END-PERFORM.

           PERFORM varying TDA_Row_Index from 1 by 1 until 
           TDA_Row_Index > NUMROWS
           PERFORM varying TDA_Col_Index from 1 by 1 until 
           TDA_Col_Index > NUMCOLS
             DISPLAY TDA_Row_Index, ", " TDA_Col_Index,"," 
             TDA_Cols(TDA_Row_Index,TDA_Col_Index)
           END-PERFORM
       END-PERFORM.   

027000 STOP RUN.
       END PROGRAM Arrays2d.

        

