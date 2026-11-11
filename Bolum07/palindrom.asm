; Bir dizginin palindrom olup olmadığını baştan ve sondan karşılaştırarak bulma.
; Sunum: Bölüm 7 Akış Kontrolü, slaytlar "Palindrom: Hazırlık" ve "Palindrom: Karşılaştırma".
option nokeyword:<str> ; sunumda yok: UASM str adını 286 komutu STR sanıyor
org 100h
jmp start
msg:
str db '123321'
str_size = $ - msg     ; = 6
db 0Dh,0Ah,'$'
start:
mov ah, 9              ; '$'e kadar yaz
mov dx, offset str
int 21h
lea di, str            ; DI = str adresi
mov si, di
add si, str_size       ; SI = son + 1
dec si                 ; SI = son karakter
mov cx, str_size
cmp cx, 1              ; tek karakter mi?
je is_palindrome       ; tek karakter palindromdur
shr cx, 1              ; CX = uzunluk / 2
next_char:
mov al, [di]          ; baştaki karakter
mov bl, [si]          ; sondaki karakter
cmp al, bl
jne not_palindrome    ; farklıysa değil
inc di                ; baştan bir ileri
dec si                ; sondan bir geri
loop next_char
is_palindrome:
mov ah, 9             ; "palindrome!" yaz
mov dx, offset msg1
int 21h
jmp stop
not_palindrome:
mov ah, 9             ; "not palindrome!" yaz
mov dx, offset msg2
int 21h
stop:
ret
msg1 db "palindrome!$"
msg2 db "not palindrome!$"

; YAZMACLAR: CX DI SI
; Beklenen cikti:
; 123321
; palindrome!
; CX=0000h
; DI=0105h
; SI=0104h
