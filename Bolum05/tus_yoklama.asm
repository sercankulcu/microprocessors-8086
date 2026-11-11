; INT 16h AH = 01h ile beklemeden tuş yoklamak (ZF = 1: tuş yok), tuş gelince AH = 00h ile
; tampondan almak. Tuş hemen hazır olduğu için arka plan işi bir kez yapılır (DX = 1).
; Kaynak: Bölüm 5.2 sunumu, "İz: Tuş Yoklama".
; GIRDI: "x"
; YAZMACLAR: DX AL
org 100h
xor dx, dx       ; iş sayacı
bekle:
inc dx           ; arka plan işi
mov ah, 01h      ; tuş var mı?
int 16h          ; ZF=1 → yok
jz bekle
mov ah, 00h      ; tuşu tampondan al
int 16h
ret

; Beklenen cikti:
; DX=0001h
; AL=78h
