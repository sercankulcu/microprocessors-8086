; 0 ile biten dizgiyi BIOS teletype (INT 10h, AH = 0Eh) ile karakter karakter yazma.
; Sunum: Bölüm 7 Akış Kontrolü, slayt "Ekrana Hello Yazdırma".
org     100h
jmp     start
msg db 'Hello', 0
start:
mov     si, 0          ; kaynak indisi = 0
next_char:
mov     al, msg[si]    ; karakteri al
cmp     al, 0          ; 0 ile karşılaştır
je      stop           ; 0 ise yazmayı durdur
mov     ah, 0eh        ; teletype işlevi
int     10h            ; AL'deki karakteri yaz
inc     si             ; sonraki karakter
jmp     next_char      ; başa dön
stop:
ret

; YAZMACLAR: SI
; Beklenen cikti:
; Hello
; SI=0005h
