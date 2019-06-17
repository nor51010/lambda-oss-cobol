      ******************************************************************
      *  opensource COBOL and AWS Lambda sample program
      ******************************************************************
       IDENTIFICATION              DIVISION.
      ******************************************************************
       PROGRAM-ID.                 hello.
       AUTHOR.                     nor51010.
       DATE-WRITTEN.               2019-06-11.
      ******************************************************************
       ENVIRONMENT                 DIVISION.
      ******************************************************************
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.
      ******************************************************************
       DATA                        DIVISION.
      ******************************************************************
       FILE                        SECTION.
      ******************************************************************
       WORKING-STORAGE             SECTION.
       01  HELLO-STR               PIC  X(256).
       01  ACCEPT-STR              PIC  X(128).
       01  SPACE-IDX               PIC  9(005).
      ******************************************************************
       PROCEDURE                   DIVISION.
      ******************************************************************
       MAIN-RTN.
           STRING  '{"statusCode": 200, '         DELIMITED BY SIZE
                   '"body": "Hello from opensource COBOL!", '
                                                  DELIMITED BY SIZE
                   '"input": [;'                  DELIMITED BY SIZE
                   INTO HELLO-STR.
       MAIN-001.
           ACCEPT  ACCEPT-STR FROM CONSOLE.
           PERFORM VARYING SPACE-IDX FROM FUNCTION LENGTH(ACCEPT-STR)
                                     BY   -1
                                     UNTIL SPACE-IDX = 0
              IF   ACCEPT-STR(SPACE-IDX:) NOT = SPACE
                   EXIT  PERFORM
              END-IF
           END-PERFORM.
           STRING  HELLO-STR                      DELIMITED BY ";"
                   ACCEPT-STR(1:SPACE-IDX)        DELIMITED BY SIZE
                   ';'                            DELIMITED BY SIZE
                   INTO HELLO-STR.
       MAIN-002.
           STRING  HELLO-STR                      DELIMITED BY ";"
                   ']}'                           DELIMITED BY SIZE
                   INTO HELLO-STR.
           DISPLAY HELLO-STR.
       MAIN-EXT.
           STOP RUN.

