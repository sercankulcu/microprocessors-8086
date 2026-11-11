; Prosedur: YAZ_A bellekte tek kopya, her kullanim yalnizca 3 baytlik bir CALL.
; Sunum 9.1 "Prosedur Ozellikleri".
ORG 100h                  ; sunumda yok
      JMP basla           ; sunumda yok: akis prosedure kendiliginden girmesin

YAZ_A PROC
      PUSH AX
      MOV  AL, 'A'
      MOV  AH, 0Eh
      INT  10h
      POP  AX
      RET
YAZ_A ENDP

basla:                    ; sunumda yok
      CALL YAZ_A  ; 3 bayt
      CALL YAZ_A  ; 3 bayt
      RET                 ; sunumda yok

; Beklenen cikti:
; AA
