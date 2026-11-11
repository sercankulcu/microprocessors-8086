; INT 16h AH = 00h ile Enter'a kadar tuş okumak; küçük harfleri büyüğe çevirip INT 10h/0Eh
; ile yansıtmak. Sunumdaki gibi O ve k tuşları, sonra Enter.
; Kaynak: Bölüm 5.2 sunumu, "İz: Tuş Oku ve Yansıt".
; GIRDI: "Ok\r"
org 100h
oku:
mov ah, 0        ; tuş bekle
int 16h          ; AH=tarama, AL=ASCII
cmp al, 0Dh      ; Enter?
je bitti
cmp al, 'a'
jb yaz
cmp al, 'z'
ja yaz
sub al, 20h      ; küçük → büyük
yaz:
mov ah, 0Eh
int 10h          ; ekrana yaz
jmp oku
bitti:
ret

; Beklenen cikti:
; OK
