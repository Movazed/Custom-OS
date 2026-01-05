org 0x7C900
bits 16

entry:
;setup stack
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 7C00h
    
    ; switch to protected mode
    cli
    call EnbleA20           


EnbleA20:

A20WaitInput:
    in al, KbdControllerCommandPort
    test al, 2
    jnz A20WaitInput
    ret

A20WaitOuput:
    in al, KbdControllerCommandPort
    test al, 1
    jz A20WaitOuput
    ret

.halt:
    jmp.halt


KbdControllerDataPort           equ 0x60
KbdControllerCommandPort        equ 0x64



times 510-($-$$) db 0
dw 0AA55H