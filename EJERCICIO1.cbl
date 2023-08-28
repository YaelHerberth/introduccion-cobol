       IDENTIFICATION DIVISION.
       PROGRAM-ID. EJERCICIO1.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WKS-NUMERO-1 PIC 99.
       01 WKS-NUMERO-2 PIC 99.
       01 WKS-NUMERO-3 PIC 99 VALUE 0.
       01 WKS-TEMPORAL PIC 99.
       PROCEDURE DIVISION.
           INICIO.
           DISPLAY "CICLO FIBONACCI".

           PERFORM CICLO UNTIL WKS-NUMERO-2 = 50.


           CICLO.
               DISPLAY WKS-NUMERO-1.

               MOVE WKS-NUMERO-1 TO WKS-TEMPORAL.
               ADD WKS-NUMERO-1 TO WKS-NUMERO-2.
               MOVE WKS-TEMPORAL TO WKS-NUMERO-1.


               ADD 1 TO WKS-NUMERO-2.

               IF WKS-NUMERO-2 > 50
               DISPLAY "Fin de la serie Fibonacci".

               CONTINUE.    DISPLAY WKS-NUMERO-1.

           MOVE WKS-NUMERO-2 TO WKS-TEMPORAL.
           ADD WKS-NUMERO-1 TO WKS-NUMERO-2.
           MOVE WKS-TEMPORAL TO WKS-NUMERO-1.

           ADD 1 TO WKS-NUMERO-3.

           IF WKS-NUMERO-2 > 50
           DISPLAY "Fin de la serie Fibonacci"
           END-IF.

           CONTINUE.
           STOP RUN.
