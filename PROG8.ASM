; Programa 8 Tipos de datos
.MODEL small
.STACK 100h

.DATA
a DB 10h, 20h, 30h, 40h
b DW 1122H
C DD 11223344h
d DF 112233445566h
e DQ 1122334455667788h
f DT 112233445566778899AAh
g DT -9252851

.CODE
inicio:
    mov ax, DGROUP
    mov ds, ax
    mov ah, a + 2   ;Almacena en AH el 30h
    mov bx, b       ;Almacena en BX el valor de b
    mov ax, 4C00h
    int 21h
END inicio

