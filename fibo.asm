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
    printF macro num
        mov ah, 2
        mov dl, num
        int 21h
    ENDM
    
    askForInput macro num
        mov ah,1
        int 21h
        sub al, '0'
        dec al
        mov [num], al
    ENDM

    print macro num
        mov ah,2
        mov dl, num
        add dl, '0'
        int 21h
    ENDM
    
    printS macro string
        lea dx, string
        mov ah, 9
        int 21h
    ENDM

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
        printS text1
        askForInput cant
        printS n_l
        mov cl, cant
        fibo:
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
