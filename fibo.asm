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
    cont DB 0
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
        add al, 1   
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
    local CYCLE1
    mov cont, 0
    xor ax,ax
        CYCLE1:
            mov al, num
            AAM
            mov remainder, al
            mov divv, ah
            mov num, al
            push word ptr num
            mov ah, divv
            mov num, ah
            inc cont
            cmp ah, 0
        JNE CYCLE1

        CYCLE2: 
            xor ax, ax
            pop dx
            add dl, '0'
            mov ah, 2
            int 21h
            xor dl, dl
            dec cont
            cmp cont, 0
            JNE CYCLE2
    ENDM
    START:
        mov ax, @data
        mov ds, ax
        xor cx, cx
        printS text1
        askForInput cant
        printS n_l
        mov cx, 9
        print x
        printS n_l
        mov bh, y
        fibo:
            mov result, bh
            getDigits result
            mov bl, x
            mov bh, y
            mov x, bh
            add bh, bl
            mov y, bh
            printS n_l
        LOOP fibo
        mov ax, 4c00h
        int 21h
    END START