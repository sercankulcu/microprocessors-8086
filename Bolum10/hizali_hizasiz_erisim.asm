; Hizali (cift adres) ve hizasiz (tek adres) sozcuk erisimi. 20100h'ye yazilan sozcuk tek yol
; dongusunde, 20101h'ye yazilan iki dongude gider; sonuc bellekte 34h CDh ABh olur.
; Bayt okuma AL = 34h (AX = AB34h), hizasiz sozcuk okuma BX = ABCDh.
; Kaynak: Bolum 10.1 8086 Pinleri, "Kod İzleme: Hizalı ve Hizasız Erişim"
; YAZMACLAR: AX BX DS
; BELLEK: adres 3

ORG 100h           ; sunumda yok
mov ax, 2000h
mov ds, ax
mov ax, 1234h
mov [0100h], ax    ; çift adres
mov ax, 0ABCDh
mov [0101h], ax    ; tek adres
mov al, [0100h]    ; bayt
mov bx, [0101h]    ; tek adres
ret                ; sunumda yok
adres equ 0100h    ; sunumda yok: BELLEK yonergesi icin DS:0100h

; Beklenen cikti:
; AX=AB34h
; BX=ABCDh
; DS=2000h
; adres: 34h CDh ABh
