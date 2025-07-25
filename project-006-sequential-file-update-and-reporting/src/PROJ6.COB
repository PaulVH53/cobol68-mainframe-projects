       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PROJ6.                                               
       ENVIRONMENT DIVISION.                                            
       INPUT-OUTPUT SECTION.                                            
       FILE-CONTROL.
           SELECT TRANS-FILE ASSIGN TO "data/TRANS"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-FILE-STATUS.
           SELECT REPORT-FILE ASSIGN TO UT-S-REPORT
               ORGANIZATION IS LINE SEQUENTIAL.                    
                                                                        
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       FD  TRANS-FILE
           RECORDING MODE IS F.                              
                                                                        
       01  TRANS-RECORD.                                                
           05  TR-ITEM-CODE        PIC X(10).                           
           05  TR-QUANTITY         PIC 9(05).                           
           05  TR-PRICE            PIC 9(05)V99.                        
                                                                        
       FD  REPORT-FILE                                                  
           RECORDING MODE IS F.

       01  REPORT-RECORD           PIC X(132).                          
                                                                        
       WORKING-STORAGE SECTION. 
       01  WS-FILE-STATUS         PIC XX.
                                        
       01  WS-PROGRAM-FLAGS.                                            
           05  WS-EOF-FLAG         PIC X         VALUE 'N'.             
               88  EOF-REACHED                   VALUE 'Y'.             
                                                                        
       01  WS-CALCULATION-FIELDS.                                       
           05  WS-ITEM-TOTAL       PIC S9(10)V99 COMP-3.                
           05  WS-GRAND-TOTAL      PIC S9(13)V99 COMP-3 VALUE ZEROS.    
                                                                        
       01  WS-UTILITY-FIELDS.                                           
           05  WS-BLANK-LINE       PIC X(132)    VALUE SPACES.          
                                                                        
       01  WS-REPORT-HEADERS.                                       
           05  RH-TITLE.                                               
               10  FILLER          PIC X(45)     VALUE SPACES.         
               10  FILLER          PIC X(42)     VALUE                 
                   '--- PROJECT 6: TRANSACTION REPORT ---     '.       
               10  FILLER          PIC X(45)     VALUE SPACES.         
           05  RH-COLUMNS.                                             
               10  FILLER          PIC X(5)      VALUE SPACES.         
               10  FILLER          PIC X(10)     VALUE 'ITEM CODE'.    
               10  FILLER          PIC X(7)      VALUE SPACES.         
               10  FILLER          PIC X(10)     VALUE 'QUANTITY'.     
               10  FILLER          PIC X(7)      VALUE SPACES.         
               10  FILLER          PIC X(10)     VALUE 'PRICE'.        
               10  FILLER          PIC X(7)      VALUE SPACES.         
               10  FILLER          PIC X(12)     VALUE 'TOTAL COST'.   
               10  FILLER          PIC X(76)     VALUE SPACES.         
                                                                       
       01  WS-DETAIL-LINE.                                             
           05  FILLER              PIC X(5)      VALUE SPACES.         
           05  DL-ITEM-CODE        PIC X(10).                          
           05  FILLER              PIC X(5)      VALUE SPACES.         
           05  DL-QUANTITY         PIC ZZ,ZZ9.                         
           05  FILLER              PIC X(5)      VALUE SPACES.         
           05  DL-PRICE            PIC ZZ,ZZ9.99.                      
           05  FILLER              PIC X(5)      VALUE SPACES.         
           05  DL-ITEM-TOTAL       PIC Z(9)9.99.                       
           05  FILLER              PIC X(69)     VALUE SPACES.         
                                                                       
       01  WS-GRAND-TOTAL-LINE.                                        
           05  FILLER              PIC X(65)     VALUE SPACES.         
           05  FILLER              PIC X(15)     VALUE 'GRAND TOTAL:'. 
           05  GT-TOTAL-OUT        PIC ZZ,ZZZ,ZZ9.99.                 
           05  FILLER              PIC X(71)     VALUE SPACES.        
       PROCEDURE DIVISION.                                            
       000-MAIN-LOGIC.                                                
           DISPLAY 'PROJECT 6: STARTING TRANSACTION REPORT PROGRAM'.  
           DISPLAY '------------------------------------------------'.
           OPEN INPUT TRANS-FILE                                      
               OUTPUT REPORT-FILE.                                    
           PERFORM 100-WRITE-HEADERS THRU 100-WRITE-HEADERS-EXIT.     
           
           PERFORM UNTIL EOF-REACHED
               READ TRANS-FILE
                   AT END
                       DISPLAY "END OF FILE REACHED"
                       MOVE 'Y' TO WS-EOF-FLAG
                   NOT AT END
                       PERFORM 200-PROCESS-RECORD 
                           THRU 200-PROCESS-RECORD-EXIT
               END-READ
           END-PERFORM                        
           
           PERFORM 300-WRITE-GRAND-TOTAL                              
                THRU 300-WRITE-GRAND-TOTAL-EXIT.                      
           CLOSE TRANS-FILE                                           
               REPORT-FILE.                                           
                                                                      
           DISPLAY '------------------------------------------------'.
           DISPLAY 'PROJECT 6: TRANSACTION REPORT PROGRAM ENDED'.     
           STOP RUN.                                                  
       100-WRITE-HEADERS.                                             
           MOVE RH-TITLE TO REPORT-RECORD.                            
           WRITE REPORT-RECORD.                                       
           MOVE RH-COLUMNS TO REPORT-RECORD.                          
           WRITE REPORT-RECORD.                                       
           MOVE WS-BLANK-LINE TO REPORT-RECORD.                       
           WRITE REPORT-RECORD.                                       
       100-WRITE-HEADERS-EXIT.                                        
           EXIT.                                                      
       200-PROCESS-RECORD.                                
           COMPUTE WS-ITEM-TOTAL = TR-QUANTITY * TR-PRICE.
           ADD WS-ITEM-TOTAL TO WS-GRAND-TOTAL.           
           MOVE TR-ITEM-CODE TO DL-ITEM-CODE.             
           MOVE TR-QUANTITY    TO DL-QUANTITY.            
           MOVE TR-PRICE       TO DL-PRICE.               
           MOVE WS-ITEM-TOTAL  TO DL-ITEM-TOTAL.          
           MOVE WS-DETAIL-LINE TO REPORT-RECORD.          
           WRITE REPORT-RECORD.                           
           DISPLAY "READ: " TRANS-RECORD.
           DISPLAY "  QTY = " TR-QUANTITY "  PRICE = " TR-PRICE.
           
       200-PROCESS-RECORD-EXIT.                           
           EXIT.                                          
       
       300-WRITE-GRAND-TOTAL.                             
           MOVE WS-BLANK-LINE TO REPORT-RECORD.           
           WRITE REPORT-RECORD.                           
           MOVE WS-GRAND-TOTAL TO GT-TOTAL-OUT.           
           MOVE WS-GRAND-TOTAL-LINE TO REPORT-RECORD.     
           WRITE REPORT-RECORD.                           
       300-WRITE-GRAND-TOTAL-EXIT.                        
           EXIT.
    