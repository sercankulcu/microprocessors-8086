; XLAT ile bir bayti onaltilik yazdirma: ust dortlu (SHR AL, CL; 8086'da 1'den buyuk kaydirma
; sayisi CL'de) ve alt dortlu (AND AL, 0Fh) tablo[] ile karaktere cevrilir. 3Ch -> "3C".
; Kaynak: Bolum 11 Komut Kodlama ve Dizgi Komutlari, "İz: XLAT"
; YAZMACLAR: BX

org 100h
mov bx, offset tablo
mov al, sayi       ; AL = 3Ch
mov cl, 4
shr al, cl         ; üst dörtlü
xlat               ; AL = [BX+AL]
mov dl, al
mov ah, 2
int 21h            ; DL'yi yaz
mov al, sayi
and al, 0Fh        ; alt dörtlü
xlat
mov dl, al
int 21h
ret
sayi  db 3Ch
tablo db '0123456789ABCDEF'

; Beklenen cikti:
; 3C
; BX=011Dh
