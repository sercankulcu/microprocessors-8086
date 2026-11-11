; Sık yapılan hata: ISR'yi IRET yerine RET ile bitirmek. Yakın RET yalnız IP'yi alır;
; CS ve FLAGS yığında kalır (SP = FFFAh, FFFEh değil) ve IF = 0 kalır.
; Sunumdaki kod bilerek hatalıdır; HLT'de durduğu için çalıştırılabilir.
; Kaynak: Bölüm 5.1 sunumu, "RET ile Biten ISR: Kod İzleme".
; YAZMACLAR: SP IF
org 100h
mov ax, 0
mov es, ax
mov word ptr es:[61h*4], offset isr
mov word ptr es:[61h*4+2], cs
int 61h
hlt              ; SP = ?
isr:
ret              ; HATA!
; Doğrusu: iret

; Beklenen cikti:
; SP=FFFAh
; IF=0
