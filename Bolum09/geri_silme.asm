; Geri silmeyi isleyen okuma: tus yankisiz okunur (INT 16h), tampona alinan harf yankilanir;
; geri silmede DI geri alinir ve ekrana 8, ' ', 8 yazilir. Girdi: A, b, geri silme, c, Enter
; -> tampon 'A', 'c', 0; ekranda Ac. Sunum 9.2 "Geri Silme: Kod Izleme".
ORG  100h
LEA  DI, ad
oku: MOV AH, 0
INT  16h         ; AL = tuş (yankısız)
CMP  AL, 13      ; Enter mi?
JE   bitti
MOV  AH, 0Eh
CMP  AL, 8       ; geri silme mi?
JNE  ekle
CMP  DI, OFFSET ad
JE   oku         ; silinecek harf yok
DEC  DI
INT  10h         ; 8: imleç sola
MOV  AL, ' '
INT  10h         ; harfin yerine boşluk
MOV  AL, 8
INT  10h         ; yine sola
JMP  oku
ekle: MOV [DI], AL
INC  DI
INT  10h         ; yankı
JMP  oku
bitti: MOV BYTE PTR [DI], 0
RET
ad   DB 6 DUP(?)

; GIRDI: "Ab\x08c\r"
; BELLEK: ad 3
; Beklenen cikti:
; Ac
; ad: 41h 63h 00h
