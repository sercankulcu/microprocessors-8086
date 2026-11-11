; Yazici: once form feed (12), sonra msg'deki 59 (3Bh) karakter INT 21h / AH = 05h ile tek tek
; yaziciya gonderilir; uzunluk offset msg_end - offset msg derleme zamaninda hesaplanir.
; Yaziciya gidenler test ortaminda YAZICI: satirlari olarak gorunur. 0Ah, 0Dh tek satir sonudur;
; tek basina CR (13) de yeni satir sayilir (kagitta satirin basina donup ustune basar);
; form feed (0Ch) ve sekme (09h) satirda ham karakter olarak kalir.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Yazıcı Verisi" ve "Yazıcı Programı"

org 100h
jmp start
msg db "Hello, Printer!", 0Ah, 0Dh
    db "***************"
    db 13, 9    ; CR ve yatay sekme (HT)
    db "Have a nice printing day!"
msg_end db 0
msg2 db "press any key to eject the page.$"

start:
mov dl, 12      ; form feed: yeni sayfa
mov ah, 5
int 21h
mov si, offset msg
mov cx, offset msg_end - offset msg
print:
mov dl, [si]
mov ah, 5       ; DOS yazıcı işlevi
int 21h
inc si          ; sonraki karakter
loop print
ret             ; sunumda yok

; Beklenen cikti:
; YAZICI: Hello, Printer!
; YAZICI: ***************
; YAZICI: 	Have a nice printing day!
