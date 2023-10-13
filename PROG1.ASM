TITLE PROGRAMA1.ASM
COMMENT *Programa prog02.ASM*
        ;inicializa SI y luego lo incrementa. usa estructura simplificada

.MODEL SMALL
.STACK 100h
.CODE
inicio:
    mov SI, 2
    inc SI
    INC SI
    mov AX, 4C00h
    INT 21h
end inicio