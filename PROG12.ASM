;Programa prog12
;Uso de Operadores, Y PTR

STACK SEGMENT PARA STACK 'STACK'
 DB 64 DUP (?)
STACK ENDS

DATA SEGMENT PARA PUBLIC 'DATA' 
    a DB 10h, 20h, 30h, 40h, 50h
    b DW 6070h, 8090h 
    c DD ?
    d EQU 0AABBh 
DATA ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
 ASSUME CS:CSEG, DS:DATA, SS:STACK
inicio:
    mov ax, SEG DATA 
    mov ds, ax
    mov ax, WORD PTR a  ;Carga en AX los 2 primeros bytes de A 
    mov WORD PTR c[0], ax   ;Carga en c los primeros 2 bytes de A
    mov ax, WORD PTR a[2]   ;Carga en AX los 2 bytes sig. de A
    mov WORD PTR c[2], ax   ;Carga en c los 2 bytes sig. de A
    mov ax, b   ;Vamos a realizar una suma de 32 bits 
    add WORD PTR c[0], ax   ;c = c + 80906070, ésto es,
    mov ax, b[2]    ;c = 40302010h + 80906070h = C0C08080h
    adc WORD PTR c[2], ax   ;usamos ADC para sumar el Carry 
    mov bh, HIGH d  ;Cargamos en BH la parte alta de D
    mov bl, LOW d   ;Cargamos en BL la parte baja de D 
    mov ax, 4C00h
    INT 21h 
CSEG ENDS
    END inicio

