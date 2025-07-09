      *****************************************************************
      * FILENAME: HERC01.SOURCE.COBOL(PROJ4)                          *
      * PURPOSE: DEMONSTRATES READING RECORDS FROM A SEQUENTIAL FILE. *
      * THIS PROGRAM IS DESIGNED FOR COBOL 68 ENVIRONMENTS.           *
      *****************************************************************
      *                                                                
       IDENTIFICATION DIVISION.                                        
       PROGRAM-ID. PROJ4.                                              
      *                                                                
       ENVIRONMENT DIVISION.                                           
       INPUT-OUTPUT SECTION.                                           
       FILE-CONTROL.                                                   
           SELECT INPUT-FILE ASSIGN TO UT-S-INFILE.                    
      *****************************************************************
      * INPUT-FILE: THIS IS THE INTERNAL NAME USED IN THE COBOL       *
      * PROGRAM TO REFER TO THE FILE.                                 *
      * DO NOT USE "ORGANIZATION IS LINE SEQUENTIAL." IN MVS-TK5      *
      * UT-S-INFILE: THIS IS THE EXTERNAL NAME (DDNAME) THAT WILL BE  *
      * USED IN THE JCL TO CONNECT THE COBOL PROGRAM'S                *
      * FILE TO THE ACTUAL DATASET ON THE SYSTEM.                     *
      * UT-S- IS A COMMON CONVENTION FOR UNIT-SEQUENTIAL.             *
      *****************************************************************
       DATA DIVISION.                                                  
       FILE SECTION.                                                   
       FD  INPUT-FILE                                                  
           LABEL RECORDS ARE STANDARD                                  
           BLOCK CONTAINS 0 RECORDS                                    
           RECORD CONTAINS 23 CHARACTERS.                              
      *****************************************************************
      * FD (FILE DESCRIPTION): DEFINES THE CHARACTERISTICS OF THE     *
      * SEQUENTIAL FILE.                                              *
      * LABEL RECORDS ARE STANDARD: INDICATES THAT THE FILE HAS       *
      * STANDARD SYSTEM-GENERATED LABELS.                             *
      * BLOCK CONTAINS 0 RECORDS: TELLS THE COMPILER THAT BLOCKING    *
      * WILL BE HANDLED BY THE JCL OR THE OPERATING SYSTEM.           *
      * RECORD CONTAINS 23 CHARACTERS: SPECIFIES THE FIXED LENGTH     *
      * OF EACH RECORD IN THE FILE.                                   *
      *****************************************************************
       01  INPUT-RECORD.                                               
           05  IR-NAME         PIC X(20).                              
          05  IR-AGE          PIC 9(03).                              
     *****************************************************************
     * 01 INPUT-RECORD: DEFINES THE LAYOUT OF EACH RECORD IN THE     *
     * INPUT-FILE.                                                   *
     * IR-NAME: PICTURE CLAUSE X(20) FOR A 20-CHARACTER ALPHANUMERIC *
     * FIELD TO STORE THE NAME.                                      *
     * IR-AGE: PICTURE CLAUSE 9(03) FOR A 3-DIGIT NUMERIC FIELD TO   *
     * STORE THE AGE.                                                *
     *****************************************************************
      WORKING-STORAGE SECTION.                                        
      01  WS-FILE-STATUS-FLAG     PIC X VALUE 'N'.                    
          88  END-OF-FILE         VALUE 'Y'.                          
     *****************************************************************
     * WS-FILE-STATUS-FLAG: A FLAG USED TO CONTROL THE READ LOOP.    *
     * IT'S INITIALIZED TO 'N' (NOT END-OF-FILE).                    *
     * 88 END-OF-FILE: A CONDITION-NAME THAT MAKES THE CODE MORE     *
     * READABLE. WHEN WS-FILE-STATUS-FLAG IS 'Y', END-OF-FILE        *
     * BECOMES TRUE.                                                 *
     *****************************************************************
     *                                                                
      PROCEDURE DIVISION.                                             
     *****************************************************************
     * MAIN-LOGIC: THE MAIN CONTROL FLOW OF THE PROGRAM.             *
     *****************************************************************
      MAIN-LOGIC.                                                     
          DISPLAY 'PROJECT 4: SEQUENTIAL FILE PROCESSING (INPUT)'.    
          DISPLAY '-----------------------------------------------'.  
          OPEN INPUT INPUT-FILE.                                      
     *****************************************************************
     * OPEN INPUT: PREPARES THE INPUT-FILE FOR READING. THIS MAKES   *
     * THE FILE AVAILABLE TO THE PROGRAM.                            *
     *****************************************************************
          PERFORM READ-INPUT-FILE                                     
              UNTIL END-OF-FILE.                                      
     *                                                                
           PERFORM READ-INPUT-FILE-EXIT.                               
      *****************************************************************
      * PERFORM UNTIL END-OF-FILE: REPEATEDLY EXECUTES THE            * 
      * READ-INPUT-FILE PARAGRAPH UNTIL THE END-OF-FILE CONDITION     *
      * (WS-FILE-STATUS-FLAG = 'Y') BECOMES TRUE.                     *
      *****************************************************************
           CLOSE INPUT-FILE.                                           
      *****************************************************************
      * CLOSE: RELEASES THE INPUT-FILE, MAKING IT UNAVAILABLE TO THE  *
      * PROGRAM. THIS IS CRUCIAL FOR PROPER FILE MANAGEMENT.          *
      *****************************************************************
           DISPLAY '-----------------------------------------------'.  
           DISPLAY 'END OF FILE PROCESSING.'.                          
           STOP RUN.                                                   
      *****************************************************************
      * STOP RUN: TERMINATES THE EXECUTION OF THE COBOL PROGRAM.      *
      *****************************************************************
      *                                                                
      *****************************************************************
      * READ-INPUT-FILE: PARAGRAPH TO READ ONE RECORD FROM THE FILE.  *
      *****************************************************************
       READ-INPUT-FILE.                                                
           READ INPUT-FILE                                             
               AT END                                                  
                   MOVE 'Y' TO WS-FILE-STATUS-FLAG.                    
           IF NOT END-OF-FILE                                          
               DISPLAY 'RECORD READ: ' INPUT-RECORD.                   
      *                                                                
       READ-INPUT-FILE-EXIT.                                           
           DISPLAY 'GOOD BYE'                                          
           EXIT.                                                       
      *****************************************************************
      * READ INPUT-FILE: ATTEMPTS TO READ THE NEXT RECORD.            *
      * AT END: IF THE END OF THE FILE IS REACHED DURING THE READ,    *
      * THIS CLAUSE IS EXECUTED, SETTING THE FLAG TO 'Y' TO           *
      * TERMINATE THE PERFORM LOOP.                                   * 
      * NOT AT END: IF A RECORD IS SUCCESSFULLY READ, THIS CLAUSE IS  * 
      * EXECUTED, DISPLAYING THE CONTENT OF THE RECORD.               * 
      * IMPORTANT COBOL 68 NOTE: THERE IS NO END-READ IN COBOL 68.    * 
      * THE PERIOD AFTER INPUT-RECORD. IS CRITICAL. IT MARKS THE      * 
      * END OF THE READ STATEMENT'S SCOPE (BOTH AT END AND            * 
      * NOT AT END CLAUSES).                                          * 
      ***************************************************************** 
      