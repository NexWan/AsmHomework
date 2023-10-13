
TITLE PROGRAMA2.ASM
COMMENT *Copia una variable a otra*

.MODEL SMALL    ;Define modelo de memoria a usar

.STACK 20h      ;Define el tamaño del STACK

.DATA
a DW 1000   ;Define a co WORD y se inicializa en 1000
b DW ?      ;Define como WORD a b y no se inicializa
.CODE
inicio:
    mov ax, @data   ;Pone el inicio del segemento de datos
    mov ds, ax      ;En el registro DS
    mov bx, a       ;Copia el contenido de a en BX
    mov b, bx       ;Copia el contenido de BX en b
    mov ax, 4C00h
    INT 21h
    END inicio