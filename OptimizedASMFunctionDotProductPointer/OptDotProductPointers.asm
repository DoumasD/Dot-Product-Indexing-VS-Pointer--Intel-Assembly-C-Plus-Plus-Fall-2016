	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB MSVCRTD
INCLUDELIB OLDNAMES

PUBLIC	?DotProductPointers@@YAHPBH0H@Z			; DotProductPointers
EXTRN	__RTC_InitBase:PROC
EXTRN	__RTC_Shutdown:PROC

_TEXT	SEGMENT
_result$ = -32						; size = 4
_q$ = -20						; size = 4
_p$ = -8						; size = 4
_a$ = 8							; size = 4
_b$ = 12						; size = 4
_size$ = 16						; size = 4
?DotProductPointers@@YAHPBH0H@Z PROC			; DotProductPointers, COMDAT

; Line 1
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

	mov	DWORD PTR _result$[ebp], 0   ; results =0
	mov	eax, DWORD PTR _a$[ebp]  ; 
	mov	DWORD PTR _p$[ebp], eax  ; p points a
	mov	ecx, DWORD PTR _b$[ebp]  ;
	mov	DWORD PTR _q$[ebp], ecx  ; q points b

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; calculate the end of the array and compare current pointer to the end pointer
	
	$Loop:
	mov	eax, DWORD PTR _size$[ebp]
	mov	ecx, DWORD PTR _a$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	cmp	DWORD PTR _p$[ebp], edx
	jae	SHORT $Exit
	; Muiltply result= (x[i] +y[i])  + result;
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _q$[ebp]
	mov	edx, DWORD PTR [eax]
	imul	edx, DWORD PTR [ecx]
	add	edx, DWORD PTR _result$[ebp]
	mov	DWORD PTR _result$[ebp], edx
	; increment pointer p and q by 4 bytes
	mov	eax, DWORD PTR _p$[ebp]
	add	eax, 4
	mov	DWORD PTR _p$[ebp], eax
	mov	ecx, DWORD PTR _q$[ebp]
	add	ecx, 4
	mov	DWORD PTR _q$[ebp], ecx
	jmp SHORT $Loop
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$Exit:
; Line 8
	mov	eax, DWORD PTR _result$[ebp]
; Line 9
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
?DotProductPointers@@YAHPBH0H@Z ENDP			; DotProductPointers
_TEXT	ENDS
END
