       IDENTIFICATION DIVISION.
       PROGRAM-ID. EJERCICIO1.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WKS-MENSAJE PICTURE X(99).

           01 WKS-NOMBRE-COMPLETO.
           05 WKS-NOMBRE PICTURE X(20).
           05 WKS-APELLIDO-PATERNO PICTURE X(20).
           05 WKS-APELLIDO-MATERNO PICTURE X(20).
       PROCEDURE DIVISION.
           INICIO.
           DISPLAY "INGRESA UN MENSAJE".
           ACCEPT WKS-MENSAJE.
           DISPLAY WKS-MENSAJE.

           DISPLAY "AHORA INGRESA TU NOMBRE".
           ACCEPT WKS-NOMBRE.
           DISPLAY "INGRESA TU APELLIDO PATERNO".
           ACCEPT WKS-APELLIDO-PATERNO.
           DISPLAY "POR ULTIMO INGRESA TU APELLIDO MATERNO".
           ACCEPT WKS-APELLIDO-MATERNO.

           DISPLAY WKS-NOMBRE-COMPLETO.

           STOP RUN.
