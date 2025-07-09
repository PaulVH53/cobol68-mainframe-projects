      ******************************************************************        
      * FILENAME: HERC01.SOURCE.COBOL(PROJ3)                           *        
      * PROJECT 3: CONDITIONAL LOGIC AND CONTROL FLOW                  *        
      * This program is designed for COBOL 68 environments.            *       
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. PROJ3.                                                       
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
           05  WS-TEST-NUMBER          PIC S9(5) VALUE +0.                      
           05  WS-CHOICE               PIC X(1)  VALUE 'B'.                     
           05  WS-LOOP-COUNTER         PIC 9(2)  VALUE 0.                       
       01  WS-DISPLAY-NUMBER           PIC -ZZZ99.                              
      *                                                                         
       PROCEDURE DIVISION.                                                      
       MAIN-LOGIC.                                                              
           DISPLAY ' '.                                                         
           DISPLAY 'PROJECT 3: CONDITIONAL LOGIC AND CONTROL FLOW'.             
           DISPLAY '-----------------------------------------------'.           
      *                                                                         
      *    TASK 1: IF/ELSE FOR NUMBER CONDITION ---                             
           DISPLAY ' '.                                                         
           DISPLAY '--- IF/ELSE DEMONSTRATION ---'.                             
      *                                                                         
           MOVE 10 TO WS-TEST-NUMBER.                                           
           PERFORM CHECK-NUMBER-CONDITION THRU                                  
               CHECK-NUMBER-CONDITION-EXIT.                                     
      *                                                                         
           MOVE -5 TO WS-TEST-NUMBER.                                           
           PERFORM CHECK-NUMBER-CONDITION THRU                                  
               CHECK-NUMBER-CONDITION-EXIT.                                     
      *
           MOVE 0 TO WS-TEST-NUMBER.                                     
           PERFORM CHECK-NUMBER-CONDITION THRU                           
               CHECK-NUMBER-CONDITION-EXIT.                              
      *                                                                  
      *    TASK 2: EVALUATE FOR MULTIPLE CHOICE ---                      
           DISPLAY ' '.                                                  
           DISPLAY '--- EVALUATE STATEMENT DEMONSTRATION ---'.           
      *                                                                  
           MOVE 'A' TO WS-CHOICE.                                        
           PERFORM PROCESS-CHOICE THRU PROCESS-CHOICE-EXIT.              
      *                                                                  
           MOVE 'B' TO WS-CHOICE.                                        
           PERFORM PROCESS-CHOICE THRU PROCESS-CHOICE-EXIT.              
      *                                                                  
           MOVE 'C' TO WS-CHOICE.                                        
           PERFORM PROCESS-CHOICE THRU PROCESS-CHOICE-EXIT.              
      *                                                                  
           MOVE 'X' TO WS-CHOICE.                                        
           PERFORM PROCESS-CHOICE THRU PROCESS-CHOICE-EXIT.              
      *                                                                  
      *    TASK 3: PERFORM N TIMES LOOP ---                              
           DISPLAY ' '.                                                  
           DISPLAY '--- PERFORM VARYING LOOP (1 TO 10) ---'.             
      *                                                                  
           MOVE 1 TO WS-LOOP-COUNTER.                                    
           PERFORM DISPLAY-LOOP-COUNTER                                  
               10 TIMES.                                                 
      *                                                                  
           DISPLAY '-----------------------------------------------'.    
           STOP RUN.                                                     
      *                                                                  
       CHECK-NUMBER-CONDITION.                                           
           MOVE WS-TEST-NUMBER TO WS-DISPLAY-NUMBER.                     
           DISPLAY 'CHECKING NUMBER: ' WS-DISPLAY-NUMBER.                
           IF WS-TEST-NUMBER > 0                            
               DISPLAY '    RESULT: THE NUMBER IS POSITIVE.'
           ELSE IF WS-TEST-NUMBER < 0                       
               DISPLAY '    RESULT: THE NUMBER IS NEGATIVE.'
           ELSE                                             
               DISPLAY '    RESULT: THE NUMBER IS ZERO.'.   
      *                                                          
       CHECK-NUMBER-CONDITION-EXIT.                              
           EXIT.                                                 
      *                                                          
      * IN COBOL 68, EVALUATE IS NOT AVAILABLE                   
       PROCESS-CHOICE.                                           
           DISPLAY 'PROCESSING CHOICE: ' WS-CHOICE.              
           IF WS-CHOICE = 'A'                                    
               DISPLAY '   SELECTED: OPTION A - ALPHA.'          
           ELSE IF WS-CHOICE = 'B'                               
               DISPLAY '   SELECTED: OPTION B - BETA.'           
           ELSE IF WS-CHOICE = 'C'                               
               DISPLAY '   SELECTED: OPTION C - GAMMA.'          
           ELSE                                                  
               DISPLAY '   SELECTED: INVALID OR OTHER OPTION.'.  
      *                                                          
       PROCESS-CHOICE-EXIT.                                      
           EXIT.                                                 
      *                                                          
       DISPLAY-LOOP-COUNTER.                                     
           DISPLAY 'NUMBER: ' WS-LOOP-COUNTER.                   
           ADD 1 TO WS-LOOP-COUNTER.
    