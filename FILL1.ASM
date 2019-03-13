;FILL1.ASM   SCREW WITH VIDEO, CHR & ATTRIB
;=======================================
; A program to fill the screen with characters (0-255)
; changing ONLY THE CHARACTER VALUE
;------------------------------------------------------------------------------
;
;------------------------------------------------------------------------------
CLS:    MOV     CX,2000         ;CLS, CLEAR THE SCREEN
        MOV     DI,0
        MOV     AX,1720H        ;USE BRIGHT WHITE ON BLUE BACKGROUND
CLS1:   MOV     [DI],AX
        INC     DI
        INC     DI
        LOOPNZ  CLS1            ;LOOP UNTIL CX=0
;------------------------------------------------------------------------------

FILL:   MOV     DS,0B800    ;Load The Data-Segment with start of Video Mem
FILL1:  MOV     DI,0        ;Load DI with SCREEN OFFSET STARTING VALUE
        MOV     CX,2000     ;Load CX with length of screen (Counter
FILL2:  MOV     [DI],BL     ;PAINT THE CHARACTER
        INC     DI          ;inc BX to allow for attributes
        INC     DI
        LOOPNZ  FILL2       ;Dec CX & JMP NZ TO LOOP2
        INC     BL          ;inc Dl (CHR data)
        CALL    LDEL
        CALL    KEYCHK
        JMP     FILL1
;----------------------------------------------------------------------------
KEYCHK: MOV     AH,01       ;AH=TEST FOR ANY KEYPRESS
        INT     16H         ;get character.
        JNZ     KEYCK1      ;
        RET                 ;NO KEY PRESSED, CONTINUE LOOPING.
KEYCK1: MOV     AX,04C00    ; MSDOS codes for "successful process termination"
        INT     33          ; go back to the operating system
;------------------------------------------------------------------------------
DELAY:  MOV     AX,65535          ;DELAY TIME
DELAY1: NOP                     ;DO NOTHING FOR 1 MACHINE CYCLE
        DEC     AX
        CMP     AX,0
        JNZ     DELAY1
        RET
;------------------------------------------------------------------------------
LDEL:   MOV     AX,1           ;Outer Loop Delay Value
LDEL1:  PUSH    AX
        MOV     AX,8192        ;Inner Loop Delay Value
LDEL2:  PUSH    AX
        NOP
        NOP
        NOP
        NOP
        POP     AX
        DEC     AX
        JNZ     LDEL2
        POP     AX
        DEC     AX
        JNZ     LDEL1
        RET
;------------------------------------------------------------------------------
LLDEL:  MOV     AX,10
LLDEL1: PUSH    AX
        MOV     AX,100
LLDEL2: PUSH    AX
        NOP
        NOP
        NOP
        NOP
        POP     AX
        DEC     AX
        JNZ     LLDEL2
        POP     AX
        DEC     AX
        JNZ     LLDEL1
        RET

