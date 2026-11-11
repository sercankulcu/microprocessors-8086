; 320 × 200 grafik modunda (13h) INT 10h AH = 0Ch ile köşegen çizmek: 200 piksel.
; Piksel çıktısı deneme ortamında görünmez; döngünün sonu yazmaçlardan denetlenir.
; Kaynak: Bölüm 5.2 sunumu, "Köşegen Çizimi" (BIOS ile).
; YAZMACLAR: CX DX
org 100h         ; sunumda yok: .COM programı
mov ax, 0013h
int 10h          ; 320×200, 256 renk
xor cx, cx       ; x = 0
xor dx, dx       ; y = 0
mov bh, 0        ; sayfa
nokta: mov ax, 0C0Eh ; AH=0Ch, AL=sarı
int 10h
inc cx           ; bir sağ
inc dx           ; bir alt
cmp dx, 200
jb  nokta         ; 200 piksel
ret              ; sunumda yok: programı bitir

; Beklenen cikti:
; CX=00C8h
; DX=00C8h
