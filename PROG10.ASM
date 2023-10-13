;Programa 10, Uso de Operadores


INT21 EQU 21h   ;Se define una constante para 21h 

STACK SEGMENT PARA STACK 'STACK'
    DB 100 DUP (?)
STACK ENDS

DATA SEGMENT PARA PUBLIC 'DATA'
x DB 0AAh, 0BBh, 0CCh, 0DDh, 0EEh, 0FFh
a EQU x + 4 ;a es el contenido de dirección x + 4 (0004)
b EQU a - 2 ;b es el contenido de dirección x + 4 - 2 (0002)
c EQU 50 MOD 9  ;c = 5
d EQU NOT 0F0h  ;d = 0Fh 
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE' 
    ASSUME CS:CODE, DS:DATA, SS:STACK

inicio:
    mov ax, SEG DATA 
    mov ds, ax
    mov ch, c SHL 1 ;ch almacena 0Ah mov cl, 4
    SHL x[2], cl    ;x[2] almacena C0h
    mov cl, b   ;cl almacena [0002] = C0h
    mov ax, d AND 0Afh  ;ax almacena 000Fh
    mov ch, a   ;ch almacena [0004] = EEh
    add ch, c   ;ch almacena F3h
    mov bx, 4 EQ 3  ;bx almacena FALSE (0)
    mov si, 4 NE 3  ;si almacena TRUE (-1) 
    mov ax, 4C00h
    INT INT21
CODE ENDS

    END inicio