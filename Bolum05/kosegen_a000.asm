; Köşegeni A000h grafik belleğine doğrudan yazmak: (x, y) = y*320 + x, her adımda 321 (141h)
; ilerlenir. Tuş beklenir, sonra metin moduna dönülür. Kod izleme aynı döngüyü CX = 4 ile verir.
; Kaynak: Bölüm 5.2 sunumu, "Köşegen Çizimi" (A000h ile) ve "A000h ile Köşegen: Kod İzleme".
; GIRDI: " "
; YAZMACLAR: DI
org 100h         ; sunumda yok: .COM programı
mov ax, 0013h
int 10h
mov ax, 0A000h
mov es, ax
xor di, di       ; (0,0) → bağıl konum 0
mov al, 0Eh      ; sarı
mov cx, 200
ciz: mov es:[di], al
add di, 141h     ; 320 + 1
loop ciz
mov ah, 0
int 16h          ; tuş bekle
mov ax, 0003h
int 10h          ; metin moduna dön
ret              ; sunumda yok: programı bitir

; Beklenen cikti:
; DI=FAC8h
