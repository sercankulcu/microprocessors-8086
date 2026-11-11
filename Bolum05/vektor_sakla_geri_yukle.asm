; INT 3 vektörünü XCHG ile değiştirip eskisini saklamak, kendi ISR'mizi çağırmak ve
; eski vektörü geri yüklemek. ISR kullandığı AX'i PUSH/POP ile korur.
; Sunumda eski vektör emu8086'nın F000:1003h'sidir; bu deneme ortamında varsayılan
; yordamlar F000:n*4'tedir, bu yüzden eski vektör F000:000Ch çıkar.
; Kaynak: Bölüm 5.1 sunumu, "Vektörü Sakla ve Geri Yükle: Kod İzleme".
; YAZMACLAR: AX BX
; BELLEK: eski 4
org 100h
xor ax, ax
mov es, ax          ; ES = 0: IVT
mov ax, offset isr3
xchg ax, es:[3*4]   ; yeni IP ↔ eski
mov eski, ax
mov ax, cs
xchg ax, es:[3*4+2] ; yeni CS ↔ eski
mov eski+2, ax
mov ax, 1234h
int 3               ; bizim ISR
mov bx, eski
mov es:[3*4], bx    ; geri yükle
mov bx, eski+2
mov es:[3*4+2], bx
ret
isr3: push ax
mov ax, 0E21h       ; AH=0Eh, AL='!'
int 10h
pop ax
iret
eski dw ?, ?

; Beklenen cikti:
; !
; AX=1234h
; BX=F000h
; eski: 0Ch 00h 00h F0h
