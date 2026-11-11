; Koşullu atlama 8086'da yalnız kısa (-128..+127) olabilir. Hedef 200 bayt ötedeyse
; ters koşullu kısa atlama ile near JMP (E9) birlikte kullanılır.
; Sunum: Bölüm 7 Akış Kontrolü, slaytlar "Menzil Dışı Koşullu Atlama".
;
; Hatalı biçim (sunumdaki ilk kod; emu8086 "out of range" hatası verir):
;     cmp al, 0
;     je  cok_uzak    ; out of range!
;     ; ... 200 baytlık kod ...
;     cok_uzak:
;
; Doğru biçim:
org 100h            ; sunumda yok: .COM programı
cmp al, 0
jne devam       ; ters koşul, kısa
jmp cok_uzak    ; near JMP (E9)
devam:
; ... 200 baytlık kod ...
mov bx, 1           ; sunumda yok: buraya gelinirse BX = 1
db 197 dup (90h)    ; sunumda yok: 200 baytı tamamlayan NOP'lar
cok_uzak:
ret                 ; sunumda yok: DOS'a dönüş

; AL = 0 olduğundan JNE atlamaz, JMP cok_uzak 200 baytın üstünden atlar: BX = 0 kalır.
; YAZMACLAR: AL BX
; Beklenen cikti:
; AL=00h
; BX=0000h
