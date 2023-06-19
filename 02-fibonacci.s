        B   main

fibbEnd DEFW    16
fib     DEFB "Fibonacci number ",0
is      DEFB " is ",0
nl      DEFB ".\n",0

        ALIGN
main    
        LDR R4,fibbEnd
        MOV R5,#1
        ADR R0, fib
        SWI 3
        MOV R0,R5
        SWI 4
        ADR R0, is
        SWI 3
        MOV R0,#1
        SWI 4
        ADR R0,nl
        SWI 3
        MOV R1,#1
        MOV R2,#0
        B condition
fibruhnacci
        ADD R3,R1,R2
        ADR R0, fib
        SWI 3
        MOV R0,R5
        SWI 4
        ADR R0, is
        SWI 3
        MOV R0,R3
        SWI 4
        ADR R0,nl
        SWI 3
        CMP R1,R2
        BLE assr1
        MOV R2,R3
condition
        ADD R5,R5,#1
        CMP R5,R4
        BLE fibruhnacci
        SWI 2
assr1
        MOV R1,R3
        B condition
