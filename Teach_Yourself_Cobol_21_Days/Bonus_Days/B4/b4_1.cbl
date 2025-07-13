      * This bonus day covers debuggers for ACUCOBOL,VAXCOBOL and 
      * MICROFOCUS Personal COBOL. 

      * For ACUCUOBL add - Zd to the command line for the debugger 
      *    Example: (using fle. wrdsrt01.cbl as example src file)
           ccbl -Zd -owrdsrt01 wrdsrt01.cbl 

      * For VAX COBOL add / DEBUG=ALL to cmd line and /DEBUG to the link
      * command line 
      *    E.g.
       COBOL/DEBUG=ALL WRDSRT01.COB  
       LINK/DEBUG/EXE=WRDSRT01  WRDSRT01.OBJ  

      * For Microfocus COBOL 
      * in editor  with 
           PCOBOL WRDSRT01 

      * press F2 key until "Animate" is displayed and then hit ENTER key.

      * for ACUCOBOL add-d to the command line 
           runcbl -d wrdsrt01 

      * for VAX COBOL a program compiled and linked with debug 
      * information will start autmatically in debug mode: 
           RUN WRDSRT01.EXE   

           