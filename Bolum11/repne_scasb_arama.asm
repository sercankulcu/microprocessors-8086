; REPNE SCASB ile karakter arama: 'merhaba' icinde 'h' 4. karsilastirmada bulunur (ZF = 1,
; CX = 3). DI eslesmenin bir sonrasini gosterir; DEC DI ve baslangicin cikarilmasiyla
; DI = 3 (0'dan sayarak 'h'nin indisi).
; Kaynak: Bolum 11 Komut Kodlama ve Dizgi Komutlari, "İz: REPNE SCASB"
; YAZMACLAR: DI CX ZF

org 100h
cld
lea di, metin
mov cx, 7          ; uzunluk
mov al, 'h'        ; aranan
repne scasb        ; ara
jne yok
dec di             ; bulunan konum
sub di, offset metin
yok:
ret
metin db 'merhaba'

; Beklenen cikti:
; DI=0003h
; CX=0003h
; ZF=0
