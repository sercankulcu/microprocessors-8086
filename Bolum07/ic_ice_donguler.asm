; İç içe döngüler: dış sayaç PUSH/POP ile saklanır. Ekranda 5 kez "122222", BX = 30.
; Sunum: Bölüm 7 Akış Kontrolü, slayt "İç İçe Döngüler".
option nokeyword:<k1 k2> ; sunumda yok: UASM k1/k2 adlarını AVX-512 yazmacı sanıyor
org 100h
mov bx, 0      ; toplam adım
mov cx, 5      ; dış döngü sayacı
k1:
 add bx, 1
 mov al, '1'
 mov ah, 0eh
 int 10h       ; '1' yaz
 push cx       ; dış sayacı sakla
 mov cx, 5     ; iç döngü sayacı
k2:
  add bx, 1
  mov al, '2'
  mov ah, 0eh
  int 10h      ; '2' yaz
  loop k2      ; iç döngü
 pop cx        ; dış sayacı geri al
loop k1        ; dış döngü
ret

; YAZMACLAR: BX CX
; Beklenen cikti:
; 122222122222122222122222122222
; BX=001Eh
; CX=0000h
