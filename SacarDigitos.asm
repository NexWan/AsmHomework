.model small
.stack 20h
.data
    cubo DB 0,1,8,27,64,125,216
    a DB ?
    b DB ?
    c DB ?
    n_l DB 0AH, 0DH, "$"
.CODE
    inicio:
        mov ax, @data ; Carga la data en el registro AX
        mov ds, ax ; Carga la data en el registro de data
        lea si, cubo ; Se manda el arreglo de cubo al Source Index, que se encarga de acceder a elementos del arreglo
        mov cx, 07 ; Tamaño del ciclo
        BACK:
            mov al, [si] ; Se carga el elemento i del arreglo (como usar x[i])
            AAM ; La instruccion realiza una operacion donde AH = x/10 y AL = x%10
            mov a, al
            add a,'0' ; Se tiene que agregar un caracter 0 para convertir de ascii a numerico
            mov al, ah
            AAM ; Se repite el AAM para los valores que hayan quedado de la operacion de x/10
            mov c, ah
            mov b, al
            add c,'0'
            add b, '0'
            mov ah, 2
            mov dl, c   ; Se cargan los valores a imprimir en el registro DL
            int 21H ; Interrupcion 21h para imprimir
            mov dl, b
            int 21h
            mov dl, a
            int 21h
            mov ah, 09h
            LEA dx, n_l ; Este registro carga un valor que contiene el valor de salto de linea
            int 21h
            inc si
            LOOP BACK ; Termina el loop
        mov ax, 4c00h
        int 21h ; Termina el programa
    END inicio