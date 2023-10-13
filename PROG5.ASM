; programa 5 uso de assume
.386

PILA SEGMENT PARA STACK 'MIPILA'
    DB 100H DUP(?)
PILA ENDS

DATO1 SEGMENT DWORD PUBLIC USE16 'DATA_A'
a DB "Esta es una Cadena"
p DW a
paf DD a
DATO1 ENDS

DATO2 SEGMENT DWORD PUBLIC USE16 'DATA_B'
xa DD 10 DUP(0)
DATO2 ENDS

DATO3 SEGMENT DWORD PUBLIC USE16 'DATA_C'
r DD 10.15
DATO3 ENDS

SEGCOD SEGMENT DWORD PUBLIC USE16 'MICODE'
    ASSUME CS:SEGCOD, SS:PILA 
inicio:

    mov ax, SEG DATO1
    mov ds, ax
    
    mov ax, SEG DATO2
    mov es, ax
    
    mov ax, SEG DATO3
    mov fs, ax

    ASSUME DS:DATO1
    mov bh, a
    mov edx, paf

    ASSUME ES:DATO2
    mov xa, edx

    ASSUME FS:DATO3
    mov eax, r
    ASSUME ES:DATO2
    mov xa[4], eax

    mov ax, 4c00h
    int 21h
SEGCOD ENDS
        END inicio
        