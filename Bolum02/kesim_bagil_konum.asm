; Kesim:bağıl konum ile erişim: 2000h:0010h ile 2001h:0000h aynı fiziksel bayttır
; (20010h). DS = 2001h iken [FFFFh] kesimin son baytıdır: 3000Fh.
; Kaynak: Bölüm 2.1 8086 Mimarisi, "Kod İzleme: Kesim:Bağıl Konum ile Erişim"

hucre EQU 0000h          ; sunumda yok: BELLEK yönergesi için 2001:0000'ın adı

org 100h                 ; sunumda yok: .COM programı
mov ax, 2000h
mov ds, ax          ; DS = 2000h
mov bx, 0010h
mov byte ptr [bx], 41h
mov ax, 2001h
mov ds, ax          ; +16 bayt
mov bx, 0000h
mov al, [bx]        ; aynı bayt
mov si, 0FFFFh
mov ah, [si]        ; son bayt
ret                      ; sunumda yok: DOS'a dön

; YAZMACLAR: AL DS
; BELLEK: hucre 1

; Beklenen cikti:
; AL=41h
; DS=2001h
; hucre: 41h
