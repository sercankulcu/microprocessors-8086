; Kendi kesme yordamımızı tip 90h'ye kurup INT 90h ile çağırmak; ISR '*' yazar ve IRET ile döner.
; Kaynak: Bölüm 5.1 sunumu, "Kendi Kesme Yordamımız".
org 100h
mov ax, 0
mov es, ax          ; ES = 0: IVT kesimi
cli                 ; kesmeleri kapat
mov word ptr es:[90h*4], offset isr  ; IP
mov word ptr es:[90h*4+2], cs       ; CS
sti                 ; kesmeleri aç
int 90h             ; kendi kesmemiz
ret
isr:
mov ah, 0Eh
mov al, '*'
int 10h
iret                ; RET değil!

; Beklenen cikti:
; *
