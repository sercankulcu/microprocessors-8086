; TF'yi FLAGS yığın üzerinden kurmak (PUSHF / POP / OR / PUSH / POPF). TF = 1 iken her
; komuttan sonra INT 1 gelir; burada INT 1 varsayılan yordamdır (yalnız IRET), program
; tek adımla sonuna kadar çalışır ve TF = 1 kalır.
; Kaynak: Bölüm 5.1 sunumu, "Tek Adım ve Kesme Noktası".
; YAZMACLAR: TF
org 100h          ; sunumda yok: .COM programı
PUSHF
POP  AX
OR   AH, 01h      ; bit 8 = TF
PUSH AX
POPF              ; TF = 1
ret               ; sunumda yok

; Beklenen cikti:
; TF=1
