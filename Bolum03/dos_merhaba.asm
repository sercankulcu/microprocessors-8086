; x86 Assembly (DOS): INT 21h / 09h '$' ile biten dizgiyi yazar, 4Ch programı bitirir.
; Kaynak: Bölüm 3.1 Programlama Dilleri, "x86 Assembly (DOS)"

org 100h          ; COM programı
mov ah, 09h       ; DOS 09h: dizgi yaz
lea dx, mesaj     ; DS:DX = adres
int 21h           ; DOS hizmetini çağır
mov ax, 4C00h     ; DOS 4Ch: sonlandır
int 21h
mesaj db 'Merhaba, DOS!$'

; Beklenen cikti:
; Merhaba, DOS!
