; Hangi komut bayrağa dokunur? MOV ve NOT bayrakları değiştirmez; INC ve DEC CF'ye
; dokunmaz; ADD bütün durum bayraklarını yeniden yazar; STC/CLC yalnız CF'yi değiştirir.
; Son durum: AL = FFh ama ZF hâlâ 1 (NOT bayrak değiştirmedi).
; Kaynak: Bölüm 3.2 Assembly, "Bayrak Değiştirmeyen Komutlar: Kod İzleme"

ORG 100h
STC              ; CF = 1
MOV AL, 0FFh     ; bayraklar aynı
INC AL           ; CF'ye dokunmaz
MOV CX, 0        ; ZF aynı kalır
DEC AL
ADD AL, 1        ; CF yeni
CLC
NOT AL           ; bayraklar aynı
RET

; YAZMACLAR: AL CF ZF SF AF PF

; Beklenen cikti:
; AL=FFh
; CF=0
; ZF=1
; SF=0
; AF=1
; PF=1
