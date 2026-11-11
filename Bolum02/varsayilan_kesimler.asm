; Varsayılan kesimler: aynı bağıl konum (0010h) üç farklı bayta gider.
; [bx] -> DS:0010 = 20010h, [bp] -> SS:0010 = 07010h, es:[bx] -> ES:0010 = 30010h
; (.COM programında SS = CS = 0700h)
; Kaynak: Bölüm 2.1 8086 Mimarisi, "Varsayılan Kesimler: Kod İzleme"

hucre EQU 0010h          ; sunumda yok: BELLEK yönergesi için DS:0010'un adı

org 100h
mov ax, 2000h
mov ds, ax
mov ax, 3000h
mov es, ax
mov bx, 0010h
mov bp, 0010h
mov byte ptr [bx], 11h    ; DS
mov byte ptr [bp], 22h    ; SS
mov byte ptr es:[bx], 33h ; ES
mov al, [bx]              ; DS
mov ah, [bp]              ; SS
ret

; YAZMACLAR: AX DS ES SS
; BELLEK: hucre 1

; Beklenen cikti:
; AX=2211h
; DS=2000h
; ES=3000h
; SS=0700h
; hucre: 11h
