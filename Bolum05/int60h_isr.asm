; Tip 60h'ye ISR kurmak ve parametreyi yazmaçla (AL = '#') iletmek.
; Kaynak: Bölüm 5.1 sunumu, "Kendi Kesme Yordamı: Kod İzleme".
; YAZMACLAR: SP IF
org 100h
mov ax, 0
mov es, ax           ; ES = 0: IVT
cli
mov word ptr es:[60h*4], offset isr
mov word ptr es:[60h*4+2], cs
sti
mov al, '#'
int 60h              ; kendi kesmemiz
ret
isr:
mov ah, 0Eh
int 10h
iret

; Beklenen cikti:
; #
; SP=0000h
; IF=1
