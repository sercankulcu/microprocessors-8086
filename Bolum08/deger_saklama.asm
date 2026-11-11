; Yığınla değer saklama: AX geçici olarak başka iş için kullanılır, POP ile eski değerine döner.
; Sunum: Bölüm 8 Yığın, slayt "Örnek: Değer Saklama".
ORG    100h
MOV    AX, 1234h
PUSH   AX         ; AX'in değerini sakla
MOV    AX, 5678h  ; AX'i değiştir
POP    AX         ; eski değeri geri yükle
RET
END

; YAZMACLAR: AX
; Beklenen cikti:
; AX=1234h
