.model small
.stack 100h
.data
    buffer db 10
    x db 0
    y db 1
    z db 0
    cant db 0
    n_l DB 10D, 13D, "$"
    result DB ?
    text1 DB "Teclee un numero (0-9): ", "$"
    divv DB ?
    remainder DB ?
.code
; Imprime un caracter en formato ascii
    printF macro num
        mov ah, 2
        mov dl, num
        int 21h
    ENDM
    ; Metodo para input
    askForInput macro num
        mov ah,1
        int 21h
        sub al, '0'
        dec al
        mov [num], al
    ENDM
    ; Metodo para imprimir un caracter en forma de numero
    print macro num
        mov ah,2
        mov dl, num
        add dl, '0'
        int 21h
    ENDM
    ; Metodo para imprimir un string
    printS macro string
        lea dx, string
        mov ah, 9
        int 21h
    ENDM
    ;Metodo para leer numeros
    getDigits MACRO num
        CYCLE1:
            mov al, num
            AAM
            mov remainder, al
            mov divv, ah
            mov num, al
            print remainder
            mov ah, divv
            cmp ah, 0
        JNE CYCLE1
    ENDM
    START:
        mov ax, @data
        mov ds, ax
        xor cx, cx
        printS text1 ; Se imprime el texto de input
        askForInput cant ; Se procesa el input
        printS n_l ; salto de linea
        mov cl, cant ; Se mueve a cl la cantidad, si borras el label de input reemplazalo por un 7 que es hasta donde lee el programa por alguna razon
        fibo: ; Logica para fibonacci
            getDigits z
            mov bl, x
            add z, bl
            mov bl, y
            add z, bl
            mov bh, y
            mov x, bh
            mov y, bl
            printS n_l
        LOOP fibo
        mov ax, 4c00h
        int 21h
    END START
