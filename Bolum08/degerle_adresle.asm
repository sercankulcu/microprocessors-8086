; Değerle ve adresle parametre geçirme: iki_kat AX'teki kopyayı, iki_kat_m [SI]'daki
; asıl değişkeni iki katına çıkarır. Sonuç: AX = 10, a = 10.
; Sunum: Bölüm 8 Prosedürler, slayt "Değerle mi, Adresle mi?".
ORG  100h         ; sunumda yok: .COM programı
MOV  AX, a        ; değer: AX'te a'nın kopyası
CALL iki_kat      ; AX iki katına çıkar, a aynı kalır
LEA  SI, a        ; adres: SI = OFFSET a
CALL iki_kat_m    ; [SI] iki katına çıkar, a değişir
RET               ; sunumda yok: DOS'a dönüş
iki_kat PROC      ; sunumda yok: AX'i iki katına çıkarır
SHL  AX, 1        ; sunumda yok
RET               ; sunumda yok
iki_kat ENDP      ; sunumda yok
iki_kat_m PROC    ; sunumda yok: [SI] sözcüğünü iki katına çıkarır
SHL  WORD PTR [SI], 1 ; sunumda yok
RET               ; sunumda yok
iki_kat_m ENDP    ; sunumda yok
a DW 5            ; sunumda yok: örnek değişken

; AX'teki 10, ilk çağrıda a'nın kopyasından; bellekteki a = 10 ise ikinci çağrıdan gelir.
; YAZMACLAR: AX
; BELLEK: a 2
; Beklenen cikti:
; AX=000Ah
; a: 0Ah 00h
