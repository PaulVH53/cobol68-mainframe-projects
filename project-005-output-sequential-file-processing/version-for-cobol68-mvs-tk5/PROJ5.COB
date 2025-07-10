       IDENTIFICATION DIVISION.                                        
       PROGRAM-ID. PROJ5.                                              
      *                                                                
       ENVIRONMENT DIVISION.                                           
       INPUT-OUTPUT SECTION.                                           
       FILE-CONTROL.                                                   
           SELECT OUTPUT-FILE ASSIGN TO UT-S-OUTFILE.                  
      *****************************************************************
      * OUTPUT-FILE: THIS IS THE INTERNAL NAME USED IN THE COBOL      *
      * PROGRAM FOR THE OUTPUT FILE.                                  *
      * UT-S-OUTFILE: THIS IS THE EXTERNAL NAME (DDNAME) THAT WILL BE *
      * USED IN THE JCL TO CONNECT THE COBOL PROGRAM'S OUTPUT FILE    *
      * TO THE ACTUAL DATASET ON THE SYSTEM.                          *
      * UT-S- IS A COMMON CONVENTION FOR UNIT-SEQUENTIAL.             *
      *****************************************************************
       DATA DIVISION.                                                  
       FILE SECTION.                                                   
       FD  OUTPUT-FILE                                                 
           LABEL RECORDS ARE STANDARD                                  
           BLOCK CONTAINS 0 RECORDS                                    
           RECORD CONTAINS 80 CHARACTERS.                              
      *****************************************************************
      * FD (FILE DESCRIPTION): DEFINES THE CHARACTERISTICS OF THE     *
      * SEQUENTIAL OUTPUT FILE.                                       *
      * LABEL RECORDS ARE STANDARD: INDICATES STANDARD SYSTEM LABELS. *
      * BLOCK CONTAINS 0 RECORDS: TELLS THE COMPILER THAT BLOCKING    *
      * WILL BE HANDLED BY THE JCL OR THE OPERATING SYSTEM.           *
      * RECORD CONTAINS 80 CHARACTERS: SPECIFIES THE FIXED LENGTH     *
      * OF EACH RECORD THAT WILL BE WRITTEN.                          *
      *****************************************************************
       01  OUTPUT-REC.                                                 
           05  OR-DATA             PIC X(80).                          
      *****************************************************************
      * 01 OUTPUT-REC: DEFINES THE LAYOUT OF EACH RECORD FOR THE      *
      * OUTPUT-FILE. IT'S A SIMPLE 80-CHARACTER FIELD FOR THIS TEST.  *
      *****************************************************************
       WORKING-STORAGE SECTION.                                        
       01  WS-PROGRAM-CONTROL.                                         
           05  WS-RECORD-COUNTER    PIC 9(03) VALUE ZEROS.            
           05  WS-ACTUAL-COUNT      PIC 9(03) VALUE ZEROS.             
      *****************************************************************
      * WS-RECORD-COUNTER: USED TO COUNT THE NUMBER OF RECORDS        *
      * GENERATED AND TO CONTROL THE LOOP.                            *
      *****************************************************************
       01  WS-BUILD-OUTPUT-AREA.                                       
           05  WS-HEADER-PART       PIC X(25)                          
               VALUE 'GENERATED RECORD NUMBER: '.                      
           05  WS-COUNTER-PART      PIC 9(03) VALUE ZEROS.             
           05  WS-TRAILER-PART      PIC X(52)                          
               VALUE ' - THIS IS A TEST RECORD FOR PROJ5.'.            
      *****************************************************************
      * WS-BUILD-OUTPUT-AREA: A WORKING STORAGE AREA TO CONSTRUCT     *
      * THE OUTPUT RECORD BEFORE WRITING IT TO THE FILE.              *
      *****************************************************************
       PROCEDURE DIVISION.                                             
      *****************************************************************
      * MAIN-LOGIC: THE MAIN CONTROL FLOW OF THE PROGRAM.             *
      *****************************************************************
       MAIN-LOGIC.                                                     
           DISPLAY 'PROJECT 5: SEQUENTIAL FILE PROCESSING (OUTPUT)'.   
           DISPLAY '------------------------------------------------'. 
           OPEN OUTPUT OUTPUT-FILE.                                    
      *****************************************************************
      * OPEN OUTPUT: PREPARES THE OUTPUT-FILE FOR WRITING. IF THE     *
      * JCL SPECIFIES DISP=NEW, THIS WILL CREATE THE FILE.            *
      *****************************************************************
           PERFORM 100-GENERATE-AND-WRITE                              
               VARYING WS-RECORD-COUNTER FROM 1 BY 1                   
               UNTIL WS-RECORD-COUNTER > 5.                            
      *****************************************************************
      * PERFORM VARYING: EXECUTES THE 100-GENERATE-AND-WRITE          *
      * PARAGRAPH 5 TIMES (FOR WS-RECORD-COUNTER FROM 1 TO 5).        *
      *****************************************************************
           CLOSE OUTPUT-FILE.                                         
      ***************************************************************** 
      * CLOSE: RELEASES THE OUTPUT-FILE, ENSURING ALL BUFFERS ARE     * 
      * FLUSHED AND THE FILE IS PROPERLY TERMINATED. THIS IS CRUCIAL. * 
      ***************************************************************** 
           COMPUTE WS-ACTUAL-COUNT = WS-RECORD-COUNTER - 1.             
           DISPLAY '------------------------------------------------'.  
           DISPLAY WS-ACTUAL-COUNT                                      
               ' RECORDS WRITTEN TO HERC01.PROJ5.OUTPUT.'.              
           DISPLAY 'END OF PROCESSING FOR PROJ5.'.                      
           STOP RUN.                                                    
      ***************************************************************** 
      * STOP RUN: TERMINATES THE EXECUTION OF THE COBOL PROGRAM.      * 
      ***************************************************************** 
      * 100-GENERATE-AND-WRITE: PARAGRAPH TO GENERATE AND WRITE ONE   * 
      * RECORD TO THE OUTPUT FILE.                                    * 
      ***************************************************************** 
       100-GENERATE-AND-WRITE.                                          
           MOVE WS-RECORD-COUNTER TO WS-COUNTER-PART.                   
           MOVE WS-BUILD-OUTPUT-AREA TO OR-DATA.                        
           WRITE OUTPUT-REC.                                            
      ***************************************************************** 
      * WRITE OUTPUT-REC: WRITES THE CONTENT OF THE OUTPUT-REC BUFFER * 
      * (WHICH WAS POPULATED FROM WS-BUILD-OUTPUT-AREA) TO THE        * 
      * OUTPUT-FILE.                                                  * 
      ***************************************************************** 
           