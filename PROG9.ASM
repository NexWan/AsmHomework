;Programa 9 uso de directiva LABEL
.386

STACK SEGMENT PARA STACK 'STACK'
    DB 100 DUP(?)
STACK ENDS

DATA SEGMENT PARA PUBLIC 'DATA'
a label WORD                ;a va a menejar de 2 en 2 bytes
b label DWORD               ;b va a manejar los 4 bytes
ar DB 10h, 20h, 30h, 40h    ;Valores alamacenados
DATA ENDS

CODE SEGMENT PARA PUBLIC USE16 'CODE'
    ASSUME CS:CODE, DS:DATA, SS:STACK
inicio:
        mov ax, SEG DATA
        mov ds, ax
        mov bx, a           ;Cargamos en BX el valor de a
        mov cx, a + 2       ;Cargamos en CX el valor de a + 2
        mov eax, b          ;Cargamos en el registro EAX el valor de b
        mov ax, 4C00h       
        INT 21h
CODE ENDS
    END inicio