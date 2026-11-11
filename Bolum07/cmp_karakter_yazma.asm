; CMP ve JE ile karar verip DOS'un 02h işleviyle bir karakter yazma: 25 <> 10, ekranda n.
; Sunum: Bölüm 7 Akış Kontrolü, slayt "CMP ve Karakter Yazma".
org    100h
mov    al, 25     ; al = 25
mov    bl, 10     ; bl = 10
cmp    al, bl     ; al - bl karşılaştır
je     equal      ; al = bl ise (zf = 1) atla
mov    dl, 'n'    ; al <> bl: 'n' yazılacak
jmp    yaz        ; ortak yazma satırına git
equal:
mov    dl, 'y'    ; al = bl: 'y' yazılacak
yaz:
mov    ah, 2      ; DOS: DL'deki karakteri yaz
int    21h
ret               ; DOS'a dön

; YAZMACLAR: AL
; Beklenen cikti:
; n
; AL=6Eh
