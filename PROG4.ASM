;Programa prog4.asm uso de operador de sobre-escritura de segmento 386
.386
PILA SEGMENT PARA STACK 'MIPILA'
    DB 100H DUP (?)
PILA ENDS

DATO1 SEGMENT DWORD PUBLIC USE16 'DATA_A'
a DB "Esta es una cadena"
p DW a 
paf DD a 
DATO1 ENDS

DATO2 SEGMENT DWORD PUBLIC USE16 'DATA_B'
xa DD 10 dup (0)
DATO2 ENDS

DATO3 SEGMENT DWORD PUBLIC USE16 'DATA_C'
r DD 10.25
DATO3 ENDS

SEGCOD SEGMENT DWORD PUBLIC USE16 'MICODE'
ASSUME cs:segcod, ss:pila

inicio:
    mov ax, SEG DATO1
    mov ds, ax
    mov ax, SEG DATO2
    mov es, ax
    mov ax, SEG DATO3
    mov fs, ax
    mov bh, ds:a 
    mov edx, ds:paf
    mov es:xa, edx
    mov eax, fs:r
    mov es:xa[4], eax
    mov ax, 4c00h
    int 21h
SEGCOD ENDS
        END inicio