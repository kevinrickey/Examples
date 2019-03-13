;CARS.ASM  an attempt at recreating my old chicken program for the Z-80
;==============================================================================
;=                            ****  CARS  ****                                =
;=                                                                            =
;=                                                                            =
;==============================================================================
;=            *****   VARIABLE / REGISTER USAGE DEFENITIONS   *****           =
;=            -----------------------------------------------------           =
;=                                                                            =
;=   DS:DI  SEG & OFFSET INTO SCREEN MEMORY                                   =
;=   ES:SI  SEG & OFFSET INTO DATA TABLE                                      =
;=   AL     TEMP STORAGE                                                      =
;=   AH     -                                                                 =
;=   BL     LANE LENGTH COUNTER                                               =
;=   BH     SAVE FIRST CHAR. OF LANE                                          =
;=   CL     LANE SPEED COUNTER                                                =
;=   CH                                                                       =
;=   DL     USED FOR RND NUMBER GERERATION 1/100 SEC. SYSTEM TIME             =
;=   DH                                                                       =
;=                                                                            =
;=                                                                            =
;=   SCRSEG     START OF SCREEN MEMORY SEGMENT ADDRESS                        =
;=                                                                            =
;=                                                                            =
;=                                                                            =
;------------------------------------------------------------------------------
; HERE WE GO!!!!!
;
SCRSEG  EQU     0B800H   ;START OF SCREEN MEMORY (COLOR)
;SCRSEG  EQU     0B000H   ;START OF SCREEN MEMORY (MONOCHROME)

SETUP:  MOV     AX,SCRSEG
        MOV     DS,AX
        MOV     AX,TABLE1
        MOV     SI,AX
;------------------------------------------------------------------------------
CLS:    MOV     CX,2000         ;CLS, CLEAR THE SCREEN
        MOV     DI,0
        MOV     AX,1720H        ;USE BRIGHT WHITE ON BLUE BACKGROUND
CLS1:   MOV     [DI],AX
        INC     DI
        INC     DI
        LOOPNZ  CLS1            ;LOOP UNTIL CX=0
;------------------------------------------------------------------------------
        MOV     CX,80           ;PAINT THE FREEWAY TOP ROW
        MOV     DI,160
        MOV     AX,17DFH
TR1:    MOV     [DI],AX
        INC     DI
        INC     DI
        LOOPNZ  TR1
;------------------------------------------------------------------------------
        MOV     CX,40           ;PAINT THE FREEWAY DIVIDING LINE
        MOV     DI,1920
        MOV     AX,17FEH
MR1:    MOV     [DI],AX
        ADD     DI,4
        LOOPNZ  MR1
;------------------------------------------------------------------------------
        MOV     CX,80           ;PAINT THE FREEWAY BOTTOM ROW
        MOV     DI,3680
        MOV     AX,17DCH
BR1:    MOV     [DI],AX
        INC     DI
        INC     DI
        LOOPNZ  BR1
;------------------------------------------------------------------------------
;RANDOM -- GENERATE AN EVEN PSEUDO RND NUMBER BETWEEN 0-140
;-----------
RND:    MOV     AX,TABLE2       ;READ FROM TABLE OF CAR OFFSETS
        MOV     SI,AX           ;REMEBER FORMAT: XX,ES:[SI]

RND2:   MOV     AH,2CH          ;LOAD AH WITH GET SYSTEM TIME CODE
        INT     21H             ;CALL INT 21 - GET SYSTEM TIME
        AND     DL,127          ;MASK OUT THE 7th BIT WE WANT 0-127 ONLY
        CMP     DL,70           ;SEE IF OUR RND NUMBER IS >70
        JBE     RND3            ;JUMP BELOW OR EQUAL, RND # IS = or < 70
        SUB     DL,70           ;RND # IS >70, SUBTRACT 70 FROM #
RND3:   XOR     AX,AX           ;ZERO OUT THE AX REGISTER PAIR
        MOV     AL,DL           ;MOVE RND # TO AL REG.
        IMUL    AX,2            ;DOUBLE THE RND #.  RND*2 (EVEN # ALWAYS!)
                                ;CAPTAIN! WE HAVE OUR EVEN# BETWEEN 0 - 140!
        MOV     CX,ES:[SI]      ;MOVE CAR OFFSET VALUE INTO CX
        CMP     CX,65535        ;TEST FOR DONE, (END OF TABLE)
        JE      START           ;DONE, START MOVING THOSE CARS
        ADD     CX,AX           ;ADD THE RND# TO CAR OFFSET
        MOV     DI,CX           ;MOVE THE NEW OFFSET TO THE SCREEN OFFSET
        CALL    DCAR            ;CALL 'DRAW THE CAR ROUTINE'
        INC     SI              ;INC SI TWICE TO POINT TO NEXT DATA
        INC     SI              ;
;       CALL    LDEL            ;call long delay cause machine is too fast..
        CALL    LDEL            ;ditto
        JMP     RND2            ;LOOP TILL ALL CARS DRAWN ON THE SCREEN
;--------------------------------------------------------------------
DCAR:   MOV     AX,17B0H        ;SUBROUTINE TO DRAW 'CARS'
        MOV     [DI],AX         ;THE CARS ARE SIMPLE AND UGLY
        INC     DI              ;BUT YOU COULD ALTER THE CHARACTER
        INC     DI              ;SET TO LOOK LIKE CARS
        MOV     AX,17B1H
        MOV     [DI],AX
        INC     DI
        INC     DI
        MOV     AX,17B2H
        MOV     [DI],AX
        INC     DI
        INC     DI
        MOV     AX,17DBH
        MOV     [DI],AX
        INC     DI
        INC     DI
        MOV     AX,17B2H
        MOV     [DI],AX
        INC     DI
        INC     DI
        MOV     AX,17B0H
        MOV     [DI],AX
        RET
;------------------------------------------------------------------------------
START:                           ;ROUTINE TO MOVE THE CARS
                                 ;USING A TABLE TO DEFINE LANE & SPEED
;
; SCROLL LEFT ROUTINE
;
L1:     MOV     AX,TABLE1       ;LOAD SI WITH START OF TABLE
        MOV     SI,AX
L2:     MOV     BL,ES:[SI]      ;LOAD BL WITH SPEED COUNT
        INC     SI
        CMP     BL,255
        JZ      R2              ;DONE, JUMP TO START
L3:     MOV     DI,ES:[SI]      ;LOAD DI WITH START OF LANE
        MOV     BH,[DI]         ;SAVE THE FIRST CHR IN BH
        MOV     CX,79           ;LINE BYTE COUNT IN BL
L4:     MOV     AL,[DI+2]       ;* MOVE THE CAR *
        MOV     [DI],AL
        INC     DI
        INC     DI
        LOOPNZ  L4              ;JUMP TO MOVE CAR 1 CHR SPACE
        MOV     [DI-2],BH       ;RESTORE FIRST CHR TO LAST POSITION
        DEC     BL              ;
        JNZ     L3              ;JUMP FOR LANE SPEED
        INC     SI
        INC     SI
        JMP     L2
;----------------------------------------------------------------------------
; SCROLL RIGHT ROUTINE
;
R1:     DEC     SI
R2:     MOV     BL,ES:[SI]      ;LOAD BL WITH SPEED COUNT
        INC     SI
        CMP     BL,255
        JZ      L1              ;DONE, JUMP TO START
R3:     MOV     DI,ES:[SI]      ;LOAD DI WITH START OF LANE
        MOV     BH,[DI]         ;SAVE THE FIRST CHR IN BH
        MOV     CX,80           ;LINE BYTE COUNT IN BL
R4:     MOV     AL,[DI-2]       ;* MOVE THE CAR *
        MOV     [DI],AL
        DEC     DI
        DEC     DI
        LOOPNZ  R4              ;JUMP TO MOVE CAR 1 CHR SPACE
        MOV     [DI+2],BH       ;RESTORE FIRST CHR TO LAST POSITION
        DEC     BL
        JNZ     R3              ;JUMP FOR LANE SPEED
;---------------------------------------------------------------------------
        CALL    KEYCHK
        CALL    LLDEL
        INC     SI
        INC     SI
        JMP     R2
;------------------------------------------------------------------------------
KEYCHK: MOV     AH,01           ;AH=TEST FOR ANY KEYPRESS
        INT     16H             ;get character.
        JNZ     KEYCK1          ;EXIT
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
LDEL:   MOV     AX,1           ;Outer Loop Delay Value
LDEL1:  PUSH    AX
        MOV     AX,65535        ;Inner Loop Delay Value
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
;
TABLE1:
;---------------------------------------
; LEFT SCROLLING LANES
;
        DB      2               ;LANE1 SPEED
        DW      320             ;LANE1 OFFSET FROM SCRSEG
        DB      3               ;LANE1 SPEED
        DW      480             ;LANE1 OFFSET FROM SCRSEG
        DB      4               ;LANE2 SPEED
        DW      640             ;LANE2 OFFSET FROM SCRSEG
        DB      2               ;LANE3 SPEED
        DW      800             ;LANE3 OFFSET FROM SCRSEG
        DB      1               ;LANE4 SPEED
        DW      960             ;LANE4 OFFSET FROM SCRSEG
        DB      3               ;LANE5 SPEED
        DW      1120            ;LANE5 STARTING ADDRESS
        DB      2               ;LANE6 SPEED
        DW      1280            ;LANE6 STARTING ADDRESS
        DB      1               ;LANE7 SPEED
        DW      1440            ;LANE7 STARTING ADDRESS
        DB      4               ;LANE8 SPEED
        DW      1600            ;LANE8 STARTING ADDRESS
        DB      3               ;LANE9 SPEED
        DW      1760            ;LANE9 STARTING ADDRESS
        DB      255             ;END OF LANE MARKER
;---------------------------------------
; RIGHT SCROLLING LANES
;
        DB      2               ;LANE10 SPEED
        DW      2238            ;LANE10 STARTING ADDRESS
        DB      1               ;LANE11 SPEED
        DW      2398            ;LANE11 STARTING ADDRESS
        DB      4               ;LANE12 SPEED
        DW      2558            ;LANE12 STARTING ADDRESS
        DB      3               ;LANE13 SPEED
        DW      2718            ;LANE13 STARTING ADDRESS
        DB      2               ;LANE14 SPEED
        DW      2878            ;LANE14 STARTING ADDRESS
        DB      1               ;LANE15 SPEED
        DW      3038            ;LANE15 STARTING ADDRESS
        DB      3               ;LANE16 SPEED
        DW      3198            ;LANE16 STARTING ADDRESS
        DB      2               ;LANE17 SPEED
        DW      3358            ;LANE17 STARTING ADDRESS
        DB      4               ;LANE18 SPEED
        DW      3518            ;LANE18 STARTING ADDRESS
        DB      1               ;LANE18 SPEED
        DW      3678            ;LANE18 STARTING ADDRESS
        DB      255             ;END OF LANE MARKER
;------------------------------------------------------------------------------
TABLE2:
;------------------------------
; TABLE OF SCREEN SEGMENT OFFSETS FOR DRAWING CARS
;
        DW      320
        DW      480
        DW      640
        DW      800
        DW      960
        DW      1120
        DW      1280
        DW      1440
        DW      1600
        DW      1760
        DW      2080
        DW      2240
        DW      2400
        DW      2560
        DW      2720
        DW      2880
        DW      3040
        DW      3200
        DW      3360
        DW      3520
        DW      65535   ;END OF CAR DRAWING MARKER
;------------------------------------------------------------------------------
