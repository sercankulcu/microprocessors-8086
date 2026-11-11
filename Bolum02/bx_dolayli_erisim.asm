; BX ile dolaylı erişim: [BX] BX'in gösterdiği baytı, [0501h] sabit adresi okur;
; AL = 25h + 17h = 3Ch, [BX+2] = [0502h] adresine yazılır.
; Kaynak: Bölüm 2.2 8086 Yazmaçları, "BX ile Dolaylı Erişim"

org 100h          ; sunumda yok: .COM programı
MOV BX, 0500h     ; BX = adres
MOV AL, [BX]      ; AL = [0500h]
MOV DL, [0501h]   ; doğrudan adres
ADD AL, DL        ; AL = 25h + 17h
MOV [BX+2], AL    ; [0502h] = AL
RET               ; sunumda yok: DOS'a dön

org 0500h                  ; sunumda yok: sunumdaki bellek içeriği DS:0500h'de
veri db 25h, 17h, 00h, 9Ch ; sunumda yok

; YAZMACLAR: AL DL BX
; BELLEK: veri 4

; Beklenen cikti:
; AL=3Ch
; DL=17h
; BX=0500h
; veri: 25h 17h 3Ch 9Ch
