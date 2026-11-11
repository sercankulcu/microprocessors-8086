; BP varsayilan olarak SS ile birlesir: ayri yigin kesimli .EXE'de [bp] veriyi degil yigini okur.
; Sunum 4.1 Bellek Erisimi, slayt "BP ve SS Tuzağı: Kod İzleme".
; Slayttaki izleme: DS = 0710h, SS = 0711h; AL = 00h (yigin), BL = CL = 44h ('D').
; AL'yi sonda MOV AX, 4C00h ezdigi icin AL'nin [bp] degeri AX'te gorulmez (AL yine 00h).
.model small            ; sunumda yok: denetleyici .EXE olarak derlesin
veri segment
bos db 3 dup(0)
x db 'D'
veri ends
yigin segment stack
dw 64 dup(0)
yigin ends
kod segment
assume cs:kod, ds:veri, ss:yigin
basla:
mov ax, veri
mov ds, ax
mov bp, offset x
mov al, [bp]         ; SS:BP okunur!
mov bl, ds:[bp]      ; DS:BP
mov si, offset x
mov cl, [si]         ; DS:SI
mov ax, 4C00h
int 21h
kod ends
end basla

; YAZMACLAR: DS SS BP SI BL CL

; Beklenen cikti:
; DS=0710h
; SS=0711h
; BP=0003h
; SI=0003h
; BL=44h
; CL=44h
