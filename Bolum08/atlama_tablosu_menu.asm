; Atlama tablosuyla menü: basılan tuş ('1'..'3') tablo indisine çevrilir, CALL islem[BX]
; ilgili prosedürü çağırır. JA işaretsiz aralık denetimi '0' ve '4'..'9'u da reddeder.
; Burada '2' basılır: BX = 2, cikar çağrılır.
; Sunum: Bölüm 8 Prosedürler, slayt "Atlama Tablosuyla Menü".
; GIRDI: "2"
ORG  100h         ; sunumda yok: .COM programı
MOV  AH, 1
INT  21h          ; AL = '1'..'3'
SUB  AL, '1'      ; 0..2
CMP  AL, 2
JA   gecersiz     ; aralık denetimi
MOV  BL, AL
MOV  BH, 0
SHL  BX, 1        ; her adres 2 bayt
CALL islem[BX]
gecersiz: RET
islem DW topla, cikar, carp
topla: MOV DX, 1  ; sunumda yok: hangi prosedürün çağrıldığını DX gösterir
RET               ; sunumda yok
cikar: MOV DX, 2  ; sunumda yok
RET               ; sunumda yok
carp:  MOV DX, 3  ; sunumda yok
RET               ; sunumda yok

; YAZMACLAR: AL BX DX
; Beklenen cikti:
; 2
; AL=01h
; BX=0002h
; DX=0002h
