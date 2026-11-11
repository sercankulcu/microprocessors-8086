; Kaydır-topla çarpma: çarpanın her biti SHR ile CF'ye alınır, bit 1 ise çarpılan eklenir,
; çarpılan her adımda SHL ile ikiye katlanır. 13 × 5 = 65 = 41h.
; Kaynak: Bölüm 6 sunumu, "İz: Kaydır-Topla Çarpma".
; BELLEK: sonuc 1
org 100h
mov bl, carpilan  ; 13
mov dl, carpan    ; 5 = 0101b
mov cx, 4         ; 4 bit
kontrol:
shr dl, 1         ; en sağ bit → CF
jnc atla
add sonuc, bl     ; bit 1 ise ekle
atla:
shl bl, 1         ; çarpılan × 2
loop kontrol
ret
carpilan db 13
carpan   db 5
sonuc    db 0

; Beklenen cikti:
; sonuc: 41h
