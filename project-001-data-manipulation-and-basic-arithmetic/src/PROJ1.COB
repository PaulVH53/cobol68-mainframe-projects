      ******************************************************************
      * FILENAME: HERC01.SOURCE.COBOL(PROJ1)                           *
      * PROJECT 1: DATA MANIPULATION AND BASIC ARITHMETIC              *
      ******************************************************************
123456*89012345678901234567890123456789012345678901234567890123456789012
       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PROJ1.                                               
      *                                                                 
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
       SOURCE-COMPUTER. IBM-370.                                        
       OBJECT-COMPUTER. IBM-370.                                        
      *                                                                 
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.                                         
       01  WS-DATA-FIELDS.                                              
           05  WS-ALPHANUMERIC-FIELD   PIC X(20) VALUE 'HI COBOL WORLD'.
           05  WS-INTEGER-1            PIC 9(5)  VALUE 12345.           
           05  WS-INTEGER-2            PIC 9(5)  VALUE 00050.           
           05  WS-PACKED-DECIMAL-1     PIC S9(3)V99 COMP-3 VALUE +12.34.
           05  WS-PACKED-DECIMAL-2     PIC S9(3)V99 COMP-3 VALUE -05.25.
           05  WS-DISPLAY-PACKED-DECIMAL-2 PIC -Z(5).99.
           05  WS-RESULT-ADD           PIC S9(5)V99 COMP-3.             
           05  WS-DISPLAY-ADD          PIC +Z(5).99.                    
           05  WS-RESULT-SUB           PIC S9(5)V99 COMP-3.
           05  WS-DISPLAY-SUB          PIC +Z(9).99.   
           05  WS-RESULT-MUL           PIC S9(6)V99 COMP-3.   
           05  WS-DISPLAY-MUL          PIC +,ZZZ,ZZZ.99.
           05  WS-RESULT-DIV           PIC S9(5)V99 COMP-3.
           05  WS-DISPLAY-DIV          PIC +Z(11).99.   
           05  WS-MOVE-TARGET-ALPHA    PIC X(20).                       
           05  WS-MOVE-TARGET-NUM      PIC 9(5).                        
      *                                                                 
       PROCEDURE DIVISION.                                              
       MAIN-LOGIC.                                                      
           DISPLAY 'PROJECT 1: BASIC COBOL PROGRAM'.                    
           DISPLAY '------------------------------------'.              
      *                                                                 
           COMPUTE WS-RESULT-ADD =
               WS-INTEGER-1 + WS-INTEGER-2.         
           MOVE WS-RESULT-ADD TO WS-DISPLAY-ADD.                        
      *                                                                 
           COMPUTE WS-RESULT-SUB =                                      
               WS-PACKED-DECIMAL-1 - WS-PACKED-DECIMAL-2.
           MOVE WS-RESULT-SUB TO WS-DISPLAY-SUB. 
      *                                                          
           COMPUTE WS-RESULT-MUL =                               
               WS-INTEGER-1 * WS-PACKED-DECIMAL-1.
           MOVE WS-RESULT-MUL TO WS-DISPLAY-MUL.              
      *                                                          
           COMPUTE WS-RESULT-DIV =                               
               WS-INTEGER-1 / WS-INTEGER-2.
           MOVE WS-RESULT-DIV TO WS-DISPLAY-DIV.                      
      *                                                          
           MOVE WS-ALPHANUMERIC-FIELD TO WS-MOVE-TARGET-ALPHA.   
           MOVE WS-INTEGER-1 TO WS-MOVE-TARGET-NUM.
           MOVE WS-PACKED-DECIMAL-2 TO WS-DISPLAY-PACKED-DECIMAL-2.              
      *                                                          
           DISPLAY 'ALPHANUMERIC (PIC X(20) ): '
                WS-ALPHANUMERIC-FIELD. 
           DISPLAY 'INTEGER 1 (PIC 9(5)): ' 
                WS-INTEGER-1.                   
           DISPLAY 'INTEGER 2 (PIC 9(5)): '
                WS-INTEGER-2.    
           DISPLAY 'PACKED DECIMAL 1 (PIC S9(3)V99 COMP-3): '
                WS-PACKED-DECIMAL-1.     
           DISPLAY 'PACKED DECIMAL 2 ((PIC S9(3)V99 COMP-3): '
                WS-PACKED-DECIMAL-2. 
           DISPLAY 'PACKED DECIMAL 2 (PIC -Z(3).99): '
                WS-DISPLAY-PACKED-DECIMAL-2.      
           DISPLAY 'ADD RESULT (PIC S9(5)V99 COMP-3): ' 
                WS-RESULT-ADD.     
           DISPLAY 'ADD RESULT (PIC +Z(5).99): '
                WS-DISPLAY-ADD.                
           DISPLAY 'SUBTRACT RESULT (PIC S9(5)V99 COMP-3): '
                WS-RESULT-SUB.
           DISPLAY 'SUBTRACT RESULT (PIC +Z(9).99): '
                WS-DISPLAY-SUB.            
           DISPLAY 'MULTIPLY RESULT (PIC S9(5)V99 COMP-3): '
                WS-RESULT-MUL.
           DISPLAY 'MULTIPLY RESULT (PIC +,ZZZ,ZZZ.99 - FIXED): '
                WS-DISPLAY-MUL.            
           DISPLAY 'DIVIDE RESULT (PIC S9(5)V99 COMP-3): '
                WS-RESULT-DIV.
           DISPLAY 'DIVIDE RESULT (PIC +Z(11).99): '
                WS-DISPLAY-DIV.              
           DISPLAY 'MOVED ALPHANUMERIC (PIC X(20)): '
                WS-MOVE-TARGET-ALPHA.  
           DISPLAY 'MOVED NUMERIC (PIC 9(5)): '
                WS-MOVE-TARGET-NUM.         
           DISPLAY '------------------------------------'.       
           STOP RUN.                                             