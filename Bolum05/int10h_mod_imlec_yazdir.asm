; INT 10h: video modu (00h), imleç (02h), öznitelikli karakter (09h, imleç ilerlemez) ve
; teletype (0Eh, imleç ilerler). 'A' ilk yıldızın üstüne yazılır: ekranda AB*.
; Kaynak: Bölüm 5.2 sunumu, "İz: INT 10h" (ve "Video Modu ve Ekran").
org 100h
mov ax, 0003h    ; AH=00h, AL=03h
int 10h          ; ekran silinir
mov ah, 02h      ; imleç konumla
mov bh, 0        ; sayfa 0
mov dx, 0104h    ; DH=1, DL=4
int 10h
mov ah, 09h      ; karakter + öznitelik
mov al, '*'
mov bl, 4Eh      ; kırmızı üstüne sarı
mov cx, 3        ; 3 kez
int 10h          ; imleç ilerlemez!
mov ah, 0Eh      ; teletype
mov al, 'A'
int 10h          ; imleç ilerler
mov al, 'B'
int 10h
ret

; Beklenen cikti:
;
;     AB*
