;STARS.ASM   Another Stupid Scrolling Program, four scrolls at one time.
;==============================================================================
;=                            ****  STARS  ****                               =
;=      UP, DOWN, LEFT and RIGHT attempt at creating a hyper speed star       =
;=      travel effect                                                         =
;==============================================================================
;=            *****   VARIABLE / REGISTER USAGE DEFENITIONS   *****           =
;=            -----------------------------------------------------           =
;=                                                                            =
;=   DS:DI  SEG & OFFSET INTO SCREEN MEMORY                                   =
;=   ES:SI  SEG & OFFSET INTO DATA TABLE                                      =
;=   AL     CURRENT OFFSET INTO SCREEN (LOW BYTE)  AX                         =
;=   AH     CURRENT OFFSET INTO SCREEN (HIGH BYTE) AX                         =
;=   BL     LANE LENGTH COUNTER                                               =
;=   BH     TEMP STORAGE FOR EACH BYTE MOVE                                          =
;=   CL\_CX COLUMN COUNT FOR EACH ROW
;=   CH/                                                                       =
;=   DL     DELAY ROUTINES                                         =
;=   DH                                                                       =
;=                                                                            =
;=                                                                            =
;=   SCRSEG     START OF SCREEN MEMORY SEGMENT ADDRESS                        =
;=                                                                            =
;=                                                                            =
;=                                                                            =
;------------------------------------------------------------------------------
; HERE WE GO!!!!!

SCRSEG  EQU     0B800H           ;START OF SCREEN MEMORY

SETUP:  MOV     AX,SCRSEG
        MOV     DS,AX
        MOV     AX,TABLE1
        MOV     ES,AX
;------------------------------------------------------------------------------
; SCROLL LEFT ROUTINE
;
L1:     MOV     AX,0            ;LOAD DI WITH START OF SCREEN OFFSET
        MOV     DI,AX
        MOV     BL,25           ;LOAD BL WITH NUMBER OF SCREEN ROWS
L2:     MOV     BH,[DI]         ;SAVE THE FIRST CHR IN BH
        MOV     CX,40           ;NUMBER OF SCREEN COLUMNS TO MOVE
L3:     MOV     AL,[DI+2]       ;* MOVE THE SCREEN DATA *
        MOV     [DI],AL
        INC     DI              ;INC DI FOR CHR DATA
        INC     DI              ;INC DI FOR ATTR DATA
        LOOPNZ  L3              ;LOOP FOR 80 CHRS
        MOV     [DI-2],BH       ;RESTORE FIRST CHR TO LAST POSITION
        ADD     DI,80           ;POINT INDEX (SCREEN-OFFSET) TO NEXT ROW
        DEC     BL
        JNZ     L2              ;REPEAT FOR 25 ROWS
;------------------------------------------------------------------------------
; SCROLL RIGHT ROUTINE
;
R1:     MOV     AX,158          ;LOAD DI WITH START OF SCREEN OFFSET
        MOV     DI,AX
        MOV     BL,25           ;LOAD BL WITH NUMBER OF SCREEN ROWS
R2:     MOV     BH,[DI]         ;SAVE THE FIRST CHR IN BH
        MOV     CX,40           ;NUMBER OF SCREEN COLUMNS TO MOVE
R3:     MOV     AL,[DI-2]       ;* MOVE THE SCREEN DATA *
        MOV     [DI],AL
        DEC     DI
        DEC     DI
        LOOPNZ  R3              ;LOOP TO MOVE THE ROW ONE SPACE LEFT
        MOV     [DI+2],BH       ;RESTORE FIRST CHR TO LAST POSITION
        ADD     DI,240
        DEC     BL
        JNZ     R2              ;
;------------------------------------------------------------------------------
; SCROLL UP ROUTINE
;
U1:     MOV     BL,80            ;LOAD BL WITH NUMBER OF SCREEN COLUMNS
        MOV     AX,0             ;LOAD DI WITH START OF SCREEN OFFSET
U2:     MOV     DI,AX
        MOV     BH,[DI]          ;SAVE THE FIRST CHR IN BH
        MOV     CX,12            ;NUMBER OF SCREEN ROWS TO MOVE
U3:     MOV     DL,[DI+160]      ;* MOVE THE SCREEN DATA *
        MOV     [DI],DL
        ADD     DI,160
        LOOPNZ  U3               ;LOOP TO MOVE THE ROW ONE SPACE LEFT
        MOV     [DI],BH          ;RESTORE FIRST CHR TO LAST POSITION
        INC     AX
        INC     AX
        DEC     BL
        JNZ     U2               ;
;------------------------------------------------------------------------------
; SCROOL DOWN ROUTINE
;
D1:     MOV     BL,80           ;LOAD BL WITH NUMBER OF SCREEN COLUMNS
        MOV     AX,3840         ;LOAD DI WITH SCREEN SEGMENT OFFSET
D2:     MOV     DI,AX
        MOV     BH,[DI]         ;SAVE THE FIRST CHR IN BH
        MOV     CX,11           ;NUMBER OF SCREEN ROWS TO MOVE
D3:     MOV     DL,[DI-160]     ;* MOVE THE SCREEN DATA *
        MOV     [DI],DL
        SUB     DI,160
        LOOPNZ  D3              ;LOOP TO MOVE THE ROW ONE SPACE LEFT
        MOV     [DI],BH         ;RESTORE FIRST CHR TO LAST POSITION
        INC     AX
        INC     AX
        DEC     BL
        JNZ     D2
;------------------------------------------------------------------------
        CALL    LDEL
        CALL    KEYCHK
        JMP     L1
;------------------------------------------------------------------------------
KEYCHK: MOV     AH,01           ;AH=TEST FOR ANY KEYPRESS
        INT     16H             ;get character.
        JNZ     KEYCK1
        RET                     ;NO KEY PRESED, RETURN FROM KEYCHK ROUTINE
KEYCK1: MOV     AX,04C00        ;MSDOS codes for "GOOD ENDING"
        INT     33              ;go back to the operating system
;------------------------------------------------------------------------------
DELAY:  MOV     AX,512          ;DELAY TIME
DELAY1: NOP                     ;DO NOTHING FOR 1 MACHINE CYCLE
        DEC     AX
        CMP     AX,0
        JNZ     DELAY1
        RET
;------------------------------------------------------------------------------
LDEL:   MOV     AX,1            ;Outer Loop Delay Value
LDEL1:  PUSH    AX
        MOV     AX,32767        ;Inner Loop Delay Value
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
;--------------------------------------------
TABLE1:
;----------------
;A TEMPORARY STORAGE AREA FOR UP & DOWN SCROLLING ROUTINES;
        DW      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DW      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
