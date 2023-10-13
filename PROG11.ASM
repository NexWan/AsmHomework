TITLE Programa Prog11 Muestra uso de $ y la igualdad EQU 
DOSSEG
.MODEL Small
.STACK 100h ;Aloja el stack 256 bytes
.DATA
a DB "Hola Muchas gracias.",13,10 ;Mensaje a ser escrito
la EQU $ - a    ;Calcula longitud del mensaje

.CODE
start:
    mov ax, @DATA   ;Carga localidad de segmento en el registro DS 
    mov ds, ax
    mov bx, 1   ;Carga 1 para archivo estándar de salida.
    mov cx, la  ;Carga longitud del mensaje en CX
    lea dx, a   ;Carga la dirección del mensaje
    mov ah, 40h ;Número de función de escritura
    INT 21h ;Interrupción del DOS 
    mov ax,4C00h
    INT 21h
END start