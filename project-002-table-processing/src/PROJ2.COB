      ****************************************************************** 
      * FILENAME: HERC01.SOURCE.COBOL(PROJ2)                           * 
      * PROJECT 2: COBOL TABLE (ARRAY) PROCESSING                      * 
      ****************************************************************** 
123456*89012345678901234567890123456789012345678901234567890123456789012 
       IDENTIFICATION DIVISION.                                          
       PROGRAM-ID. PROJ2.                                                
      *                                                                  
       ENVIRONMENT DIVISION.                                             
       CONFIGURATION SECTION.                                            
       SOURCE-COMPUTER. IBM-370.                                         
       OBJECT-COMPUTER. IBM-370.                                         
      *                                                                  
       DATA DIVISION.                                                    
       WORKING-STORAGE SECTION.                                          
      *                                                                  
       01  WS-DATA-FIELDS.                                               
           05  IDX-1                   PIC 9(5)  VALUE 00050.            
      *                                                                  
       01  WS-ITEM-TABLE.                                                
           05  WS-ITEM-CODE            PIC X(6) OCCURS 5 TIMES.          
      *                                                                  
       PROCEDURE DIVISION.                                               
       MAIN-LOGIC.                                                       
      *                                                                  
           DISPLAY ' '.                                                  
           DISPLAY 'PROJECT 2: COBOL TABLE PROCESSING'.                  
           DISPLAY '------------------------------------'.               
           MOVE 'ITEM-A' TO WS-ITEM-CODE (1).                            
           MOVE 'ITEM-B' TO WS-ITEM-CODE (2).                            
           MOVE 'ITEM-C' TO WS-ITEM-CODE (3).                            
           MOVE 'ITEM-D' TO WS-ITEM-CODE (4).                            
           MOVE 'ITEM-E' TO WS-ITEM-CODE (5).                            
           DISPLAY 'TABLE CONTENTS:'.                                    
      *                                                                  
           MOVE 1 TO IDX-1.                                              
           PERFORM DISPLAY-SINGLE-ITEM                                   
               5 TIMES.                                                  
      *
           DISPLAY '------------------------------------'. 
           STOP RUN.                                       
      *                                                    
       DISPLAY-SINGLE-ITEM.                                
           DISPLAY '  ITEM ' IDX-1 ': '                    
               WS-ITEM-CODE (IDX-1).                       
           ADD 1 TO IDX-1.                                 
