      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EJERCICIO2.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "clientes.txt".

       DATA DIVISION.
       FILE SECTION.
       FD CLIENTES.
       01 WKS-REG-CLIENTES.
           02 WKS-ID-CLIENTE-FILE PIC 9.
           02 WKS-NOMBRE-CLIENTE-FILE PIC X(20).
           02 WKS-CLAVE-TARJETA-FILE PIC X(1).
           02 WKS-ANUALIDAD-FILE PIC 9(5).
           02 WKS-FECHA-FILE PIC X(15).
       WORKING-STORAGE SECTION.
       01 WKS-CONFIRMAR PIC 9(1).
       01 Fecha-Actual.
           05 Año PIC 9(4).
           05 Mes PIC 99.
           05 Día PIC 99.
           05 Hora PIC 99.
           05 Minuto PIC 99.
           05 Segundo PIC 99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      *    INICIA PROGRAMA
           PERFORM 1000INICIO.
      *    PROCESO
           PERFORM 2000PROCESO.
      *    FIN

           PERFORM 3000FIN.
           3000FIN.
               CLOSE CLIENTES
               DISPLAY "GRACIAS POR SU VISITA"
           STOP RUN.

           1000INICIO.
           OPEN OUTPUT CLIENTES.

           2000PROCESO.
           PERFORM 2100ENTRADADATOS.

           DISPLAY "¿LOS DATOS ESTAN CORRECTOS?".
           DISPLAY "1.SI".
           DISPLAY "2.NO".

           ACCEPT WKS-CONFIRMAR.
           DISPLAY WKS-CONFIRMAR.

           IF WKS-CONFIRMAR = 1
            WRITE WKS-REG-CLIENTES

            DISPLAY "DATOS ENVIADOS"

            DISPLAY "¿DESEA AGREGAR MAS DATOS?"
            DISPLAY "1.SI"
            DISPLAY "2.NO"
            ACCEPT WKS-CONFIRMAR
            IF WKS-CONFIRMAR = 1

             PERFORM 2100ENTRADADATOS
             WRITE WKS-REG-CLIENTES

            ELSE NEXT SENTENCE
           ELSE
               IF WKS-CONFIRMAR = 2
                PERFORM 2100ENTRADADATOS
                WRITE WKS-REG-CLIENTES.



           2100ENTRADADATOS.
           DISPLAY "INTRODUCE ID DE CLIENTE".
           ACCEPT WKS-ID-CLIENTE-FILE.

           DISPLAY "INTRODUCE NOMBRE DE CLIENTE".
           ACCEPT WKS-NOMBRE-CLIENTE-FILE.

           DISPLAY "ELIGE CLAVE DE TARJETA".
           DISPLAY "1.DEBITO - 1,000".
           DISPLAY "2.CREDITO - 10,000".
           DISPLAY "3.NOMINA - 0"
           ACCEPT WKS-CLAVE-TARJETA-FILE.

           IF WKS-CLAVE-TARJETA-FILE = 1
            MOVE 1000 TO WKS-ANUALIDAD-FILE
           ELSE
            IF WKS-CLAVE-TARJETA-FILE = 2
             MOVE 10000 TO WKS-ANUALIDAD-FILE
              ELSE
               IF WKS-CLAVE-TARJETA-FILE = 3
                MOVE 0 TO WKS-ANUALIDAD-FILE.

           MOVE FUNCTION CURRENT-DATE TO Fecha-Actual.
           MOVE Fecha-Actual TO WKS-FECHA-FILE.

       END PROGRAM EJERCICIO2.
