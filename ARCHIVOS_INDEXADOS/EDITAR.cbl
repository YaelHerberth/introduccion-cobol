       IDENTIFICATION DIVISION.
       PROGRAM-ID. EDITAR.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT REG-CLI ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS ID-CLIENTE-FILE.
       DATA DIVISION.
       FILE SECTION.
       FD REG-CLI.
       01 REG-CLIENTES.
           05 ID-CLIENTE-FILE PIC 9(3).
           05 NOMBRE-CLIENTE-FILE PIC X(20).
           05 CLAVE-TARJETA-FILE PIC 9(01).
           05 NOMBRE-TARJETA-FILE PIC X(08).
           05 ANUALIDAD-FILE PIC 9(05).
           05 FECHA-ALTA-FILE.
            10 Y PIC 9(4).
            10 M PIC 99.
            10 D PIC 99.

       WORKING-STORAGE SECTION.
       01 WKS-FIN PIC 9.
       01 WKS-ID-CLIENTE PIC 9(3).
       01 WKS-CLIENTE-EXISTE PIC X VALUE "S".
       01 WKS-ANUALIDAD PIC 9(5).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 1000-INICIO.
           PERFORM 2000-PROCESO UNTIL WKS-FIN = 2.
           PERFORM 3000-FIN.
           STOP RUN.

      *RUTINAS
       1000-INICIO.
           OPEN I-O REG-CLI.
           DISPLAY "*****BIENVENIDO*****".
           DISPLAY "*****EDITAR*****".

       2000-PROCESO.
           DISPLAY "INTRODUCE ID CLIENTE".
           ACCEPT WKS-ID-CLIENTE.

           MOVE WKS-ID-CLIENTE TO ID-CLIENTE-FILE.

           READ REG-CLI KEY IS ID-CLIENTE-FILE
           INVALID KEY
           DISPLAY "NO VALIDO/ NO EXISTE"
           MOVE "N" TO WKS-CLIENTE-EXISTE.

           IF WKS-CLIENTE-EXISTE = "S"
           DISPLAY "ID: " ID-CLIENTE-FILE
           DISPLAY "NOMBRE: " NOMBRE-CLIENTE-FILE
           DISPLAY "CLAVE TARJETA: " CLAVE-TARJETA-FILE
           DISPLAY "NOMBRE-CLIENTE-FILE: " NOMBRE-CLIENTE-FILE
           DISPLAY    "ANUALIDAD: " ANUALIDAD-FILE.
           MOVE "S" TO WKS-CLIENTE-EXISTE
           DISPLAY "INTRODUCE NUEVA ANUALIDAD"
           ACCEPT WKS-ANUALIDAD
           MOVE WKS-ANUALIDAD TO ANUALIDAD-FILE
           DISPLAY "*****REGISTRO ACTUALIZADO*****"
           REWRITE REG-CLIENTES INVALID KEY
           DISPLAY "ERROR INTENTELO DE NUEVO".

           DISPLAY "�DESEAS EDITAR OTRO CLIENTE?".
           DISPLAY "1. SI".
           DISPLAY "2. NO".
           ACCEPT WKS-FIN.

       3000-FIN.
           CLOSE REG-CLI.

       END PROGRAM EDITAR.
