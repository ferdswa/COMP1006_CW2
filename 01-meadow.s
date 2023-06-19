		B main

verses 	DEFW	4
newline DEFB "\n",0
menwent	DEFB " men went to mow\n",0
manwent	DEFB " man went to mow\n",0
men		DEFB " men, ",0
mandog	DEFB " man and his dog, Spot\n",0
meadow	DEFB "Went to mow a meadow\n",0

		ALIGN
main	
		LDR R3,verses
		CMP R3,#0
		BEQ zero
		CMP R3,#1
		BEQ one
		B whilecomp
		SWI 2
while
		MOV R0,R3
		MOV R1,R3
		SWI 4
		ADR R0,menwent
		SWI 3
		ADR R0,meadow
		SWI 3
		B midlinec
whilecomp
		CMP R3,#1
		BGT while
		B final
midline
		MOV R0,R1
		SWI 4
		ADR R0,men
		SWI 3
		SUB R1,R1,#1
midlinec
		CMP R1,#1
		BGT midline
		MOV R0,#1
		SWI 4
		ADR R0, mandog
		SWI 3
		ADR R0, meadow
		SWI 3
		ADR R0, newline
		SWI 3
		SUB R3,R3,#1
		B whilecomp
zero
		SWI 2
one
		MOV R1,#1
		B final
final
		MOV R0, R1
		SWI 4
		ADR R0, manwent
		SWI 3
		ADR R0, meadow
		SWI 3
		MOV R0, R1
		SWI 4
		ADR R0, mandog
		SWI 3
		ADR R0, meadow
		SWI 3
		SWI 2