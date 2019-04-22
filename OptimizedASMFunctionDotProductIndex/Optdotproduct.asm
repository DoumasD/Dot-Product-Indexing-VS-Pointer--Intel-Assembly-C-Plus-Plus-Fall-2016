.686P
.model	flat
INCLUDELIB MSVCRTD
INCLUDELIB OLDNAMES
PUBLIC	?DotProduct@@YAHQAH0HH@Z			; DotProduct
_TEXT	SEGMENT
_i$1 = -32						; size = 4
_j$ = -20						; size = 4
_result$ = -8						; size = 4
_x$ = 8							; size = 4
_y$ = 12						; size = 4
_xsize$ = 16						; size = 4
_ysize$ = 20						; size = 4

?DotProduct@@YAHQAH0HH@Z PROC				; DotProduct, COMDAT
; Line 2
	push	ebp
	mov	ebp, esp
	sub	esp, 228				; 000000e4H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-228]
	mov	ecx, 57					; 00000039H
	mov	eax, -858993460				; ccccccccH

	rep stosd
	mov	DWORD PTR _result$[ebp], 0         ;result=0
	mov	DWORD PTR _j$[ebp], 0             ; j=0
	mov	DWORD PTR _i$1[ebp], 0            ; i=0

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;for condition (i<size)
	$Loop:
	cmp	eax, DWORD PTR _xsize$[ebp]        ; compare index i with the size of the array
	jge	SHORT $Exit
	
	;; increase i by one
	mov	eax, DWORD PTR _i$1[ebp]           ; i is saved to eax
 	add	eax, 1					           ; eax increases i by 1
	mov	DWORD PTR _i$1[ebp], eax            ; saves it back to i

	;;;;; result= X[i]*Y[i] + result;
	mov	eax, DWORD PTR _i$1[ebp]    ; move  i to eax
	mov	ecx, DWORD PTR _x$[ebp]       ;  move addres of x to ecx
	mov	edx, DWORD PTR _j$[ebp]       ; move j to edx
	mov	esi, DWORD PTR _y$[ebp]        ; move address of y to esi
	mov	eax, DWORD PTR [ecx+eax*4]      ; increment i and move it toeax
	imul eax, DWORD PTR [esi+edx*4]  ; y[j] 
	add	eax, DWORD PTR _result$[ebp]    ; add result to eax
	mov	DWORD PTR _result$[ebp], eax    ; save eax back to results
    ;;;;; increase j
	mov	eax, DWORD PTR _j$[ebp]         ; move j value to eax
	add	eax, 1                           ; add 1 to eax
	mov	DWORD PTR _j$[ebp], eax           ; save eax back to j
	;;; Save i to eax
	mov	eax, DWORD PTR _i$1[ebp]           ; move i to eax
	jmp	SHORT $Loop

	$Exit
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Line 13
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
?DotProduct@@YAHQAH0HH@Z ENDP				; DotProduct
_TEXT	ENDS
END
