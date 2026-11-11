; Dizi toplamı prosedürü: adres SI'da, adet CX'te verilir; toplam AL'de döner (17 = 11h).
; Sunum: Bölüm 8 Prosedürler, slayt "Dizi Toplamı Prosedürü".
ORG  100h
LEA  SI, vector     ; parametre 1: adres
MOV  CX, 5          ; parametre 2: adet
CALL topla
MOV  m, AL          ; dönüş değeri AL'de
RET
topla PROC          ; Girdi: SI, CX
MOV  AL, 0          ; Çıktı: AL = toplam
dongu:
ADD  AL, [SI]
INC  SI
LOOP dongu
RET
topla ENDP
vector DB 5, 4, 5, 2, 1
m      DB 0

; YAZMACLAR: AL CX
; BELLEK: m 1
; Beklenen cikti:
; AL=11h
; CX=0000h
; m: 11h
