; AX = AH : AL. 8 bitlik yarıya yazmak diğer yarıyı değiştirmez; 8 bitlik toplamanın
; eldesi AH'ye değil CF'ye gider (AX = 1200h, CF = 1). 16 bitlik toplamada elde AH'ye
; geçer: 12FFh + 1 = 1300h, CF = 0.
; Kaynak: Bölüm 2.2 8086 Yazmaçları, "AX = AH : AL"

org 100h        ; sunumda yok: .COM programı
MOV AX, 1234h   ; AH=12h, AL=34h
MOV AL, 0FFh    ; yalnız alt yarı
ADD AL, 1       ; 8 bitlik toplama
MOV AX, 12FFh
ADD AX, 1       ; 16 bitlik toplama
RET             ; sunumda yok: DOS'a dön

; YAZMACLAR: AX AH AL CF

; Beklenen cikti:
; AX=1300h
; AH=13h
; AL=00h
; CF=0
