; İşaretli taşma: -92 + -92 = -184 sekiz bite sığmaz (OF = 1); JO ile CBW'ye geçilip
; toplama 16 bitte yapılır: AX = FF48h = -184.
; Kaynak: Bölüm 6 sunumu, "İşaretli Taşma: JO ve CBW".
; YAZMACLAR: AX OF
org 100h         ; sunumda yok: .COM programı
mov al, -92      ; A4h
mov bl, -92
add al, bl       ; 8 bit toplama
jo  genislet     ; OF = 1 ise
jmp bitti
genislet:
mov al, -92      ; birinci sayı
cbw              ; AL -> AX
mov dx, ax
mov al, bl       ; ikinci sayı
cbw
add ax, dx       ; 16 bit toplama
bitti:
ret

; Beklenen cikti:
; AX=FF48h
; OF=0
