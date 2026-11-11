; INC ve DEC CF'yi değiştirmez; 7Fh + 1 işaretli taşmadır (OF = 1); NOT bayrak değiştirmez;
; NEG 80h'nin tersi 7Fh'yi 81h (-127) yapar, CF = 1.
; Kaynak: Bölüm 6 sunumu, "Kod İzleme: INC, DEC, NOT, NEG".
; YAZMACLAR: AL BL CF SF OF
org 100h        ; sunumda yok: .COM programı
mov al, 0FFh
inc al          ; FFh + 1
dec al          ; 00h - 1
mov bl, 7Fh     ; +127
inc bl          ; +128 ?
not bl
neg bl
ret             ; sunumda yok: programı bitir

; Beklenen cikti:
; AL=FFh
; BL=81h
; CF=1
; SF=1
; OF=0
