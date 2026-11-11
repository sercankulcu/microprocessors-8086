; Bölme-kalan yöntemi: 2989 tekrar tekrar 16'ya bölünür, kalanlar diziye yazılır.
; Kalanlar 0D 0A 0B; sondan başa okununca 0BADh = 2989.
; Kaynak: Bölüm 1.2 Sayı Sistemleri, "Bölme-Kalan: Kod İzleme"

ORG 100h
MOV AX, 2989   ; sayı
MOV BX, 16     ; taban
MOV SI, 0      ; sayaç
bol: MOV DX, 0 ; DX:AX
DIV BX         ; bölüm, kalan
MOV kalan[SI], DL
INC SI
CMP AX, 0      ; bölüm 0 mı?
JNE bol
RET
kalan DB 4 DUP(0)

; YAZMACLAR: AX DX SI
; BELLEK: kalan 4

; Beklenen cikti:
; AX=0000h
; DX=000Bh
; SI=0003h
; kalan: 0Dh 0Ah 0Bh 00h
