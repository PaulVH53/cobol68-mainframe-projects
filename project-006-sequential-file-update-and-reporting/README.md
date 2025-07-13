# Project 6: 
Sequential File Update and Reporting

## Objective: 
Combine input and output file processing with data manipulation to produce a report.

## Tasks:
- Create an input file with simple transaction records (e.g., ITEM-CODE, QUANTITY, PRICE).
- Write a COBOL program to:
    - Read each transaction.
    - Calculate the total cost for each item (QUANTITY * PRICE).
    - Produce a formatted report, including a header, detail lines (ITEM-CODE, QUANTITY, PRICE, TOTAL-COST), and a grand total at the end.
    - Output the report to SYSOUT=* (printer output).
- JCL Focus: DD statements for INPUT and SYSOUT.

## Expected Output: 
A readable report printed to your Hercules console or SYSOUT spool.
