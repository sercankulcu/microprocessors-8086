; Uc adresleme modu daha: dizgi (MOVSB), G/C (IN/OUT) ve goreceli (JNZ, 75 FA = -6).
; Sunum 4.1 Bellek Erisimi, slayt "Dizgi, G/Ç ve Göreceli Mod" (uc ayri parca).
; Parcalar tek programda calissin diye isaretci, port numarasi ve dongu govdesi eklendi.
; PORT 69: 7Fh
ORG 100h                ; sunumda yok
LEA SI, kaynak          ; sunumda yok: DS:SI kaynak
LEA DI, hedef           ; sunumda yok: ES:DI hedef (.COM'da ES = DS)
CLD                     ; sunumda yok: SI/DI ileri
MOVSB ; ES:[DI] ← DS:[SI]

IN  AL, 45h
MOV DX, 50h             ; sunumda yok: OUT DX'teki port
OUT DX, AX

MOV CX, 3               ; sunumda yok: 3 tur
dongu:                  ; sunumda yok: 4 baytlik govde (83 C3 02, 49)
ADD BX, 2               ; sunumda yok
DEC CX                  ; sunumda yok
JNZ dongu ; 75 FA = −6
RET                     ; sunumda yok
kaynak DB 'X'           ; sunumda yok
hedef  DB '.'           ; sunumda yok

; YAZMACLAR: AX BX SI DI
; BELLEK: hedef 1

; Beklenen cikti:
; OUT 80 <- 007Fh
; AX=007Fh
; BX=0006h
; SI=0119h
; DI=011Ah
; hedef: 58h
