      *****************************************************************
      * FILENAME: HERC01.SOURCE.COBOL(PROJ4)                          *
      * PURPOSE: Demonstrates reading records from a sequential file. *
      * This program is designed for COBOL 68 environments.           *
      *****************************************************************    
      * 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROJ4.
      *
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO "data/INPUT"
               ORGANIZATION IS LINE SEQUENTIAL.
      *    SELECT INPUT-FILE ASSIGN TO UT-S-INFILE.
      *****************************************************************
      * INPUT-FILE: This is the internal name used in the COBOL       *
      * program to refer to the file.                                 *
      * DO NOT USE "ORGANIZATION IS LINE SEQUENTIAL." in mvs-tk5      *
      * UT-S-INFILE: This is the external name (DDNAME) that will be  *
      * used in the JCL to connect the COBOL program's                *
      * file to the actual dataset on the system.                     *
      * UT-S- is a common convention for Unit-Sequential.             *
      *****************************************************************
       DATA DIVISION.
       FILE SECTION.
       FD  INPUT-FILE
           LABEL RECORDS ARE STANDARD
           BLOCK CONTAINS 0 RECORDS
           RECORD CONTAINS 23 CHARACTERS.
      *****************************************************************
      * FD (File Description): Defines the characteristics of the     *
      * sequential file.                                              *
      * LABEL RECORDS ARE STANDARD: Indicates that the file has       *
      * standard system-generated labels.                             *
      * BLOCK CONTAINS 0 RECORDS: Tells the compiler that blocking    *
      * will be handled by the JCL or the operating system.           *
      * RECORD CONTAINS 23 CHARACTERS: Specifies the fixed length     *
      * of each record in the file.                                   *
      *****************************************************************
       01  INPUT-RECORD.
           05  IR-NAME         PIC X(20).
           05  IR-AGE          PIC 9(03).
      *****************************************************************
      * 01 INPUT-RECORD: Defines the layout of each record in the     *
      * INPUT-FILE.                                                   *
      * IR-NAME: Picture clause X(20) for a 20-character alphanumeric *
      * field to store the name.                                      *
      * IR-AGE: Picture clause 9(03) for a 3-digit numeric field to   *
      * store the age.                                                *
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  WS-FILE-STATUS-FLAG     PIC X VALUE 'N'.
           88  END-OF-FILE         VALUE 'Y'.
      *****************************************************************
      * WS-FILE-STATUS-FLAG: A flag used to control the READ loop.    *
      * It's initialized to 'N' (Not End-Of-File).                    *
      * 88 END-OF-FILE: A condition-name that makes the code more     *
      * readable. When WS-FILE-STATUS-FLAG is 'Y', END-OF-FILE        *
      * becomes true.                                                 *
      *****************************************************************
      *
       PROCEDURE DIVISION.
      *****************************************************************
      * MAIN-LOGIC: The main control flow of the program.             *
      *****************************************************************
       MAIN-LOGIC.
           DISPLAY 'PROJECT 4: SEQUENTIAL FILE PROCESSING (INPUT)'.
           DISPLAY '-----------------------------------------------'.
           OPEN INPUT INPUT-FILE.
      *****************************************************************
      * OPEN INPUT: Prepares the INPUT-FILE for reading. This makes   *
      * the file available to the program.                            *
      *****************************************************************
           PERFORM READ-INPUT-FILE
               UNTIL END-OF-FILE.
      *****************************************************************
      * PERFORM UNTIL END-OF-FILE: Repeatedly executes the           *
      * READ-INPUT-FILE paragraph until the END-OF-FILE condition     *
      * (WS-FILE-STATUS-FLAG = 'Y') becomes true.                     *
      *****************************************************************
           CLOSE INPUT-FILE.
      *****************************************************************
      * CLOSE: Releases the INPUT-FILE, making it unavailable to the  *
      * program. This is crucial for proper file management.          *
      *****************************************************************
           DISPLAY '-----------------------------------------------'.
           DISPLAY 'END OF FILE PROCESSING.'.
           STOP RUN.
      *****************************************************************
      * STOP RUN: Terminates the execution of the COBOL program.      *
      *****************************************************************
      * 
      *****************************************************************
      * READ-INPUT-FILE: Paragraph to read one record from the file.  *
      *****************************************************************
       READ-INPUT-FILE.
           READ INPUT-FILE
               AT END
                   MOVE 'Y' TO WS-FILE-STATUS-FLAG
               NOT AT END
                   DISPLAY 'RECORD READ: ' INPUT-RECORD.    
      *****************************************************************
      * READ INPUT-FILE: Attempts to read the next record.            *
      * AT END: If the end of the file is reached during the READ,    *
      * this clause is executed, setting the flag to 'Y' to           *
      * terminate the PERFORM loop.                                   *
      * NOT AT END: If a record is successfully read, this clause is  *
      * executed, displaying the content of the record.               *
      * IMPORTANT COBOL 68 NOTE: There is no END-READ in COBOL 68.    *
      * The period after INPUT-RECORD. is critical. It marks the      *
      * end of the READ statement's scope (both AT END and            *
      * NOT AT END clauses).                                          *
      *****************************************************************