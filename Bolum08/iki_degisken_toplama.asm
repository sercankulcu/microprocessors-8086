; Bellek değişkenleriyle parametre: AddNumbers number1 + number2 = 8'i result'a yazar.
; Sunum: Bölüm 8 Prosedürler, slayt "İki Değişken Toplama".
ORG 100h
start:
CALL AddNumbers    ; prosedürü çağır
RET                ; DOS'a dön
AddNumbers PROC
MOV AX, number1    ; AX = ilk sayı
ADD AX, number2    ; AX = AX + ikinci sayı
MOV result, AX     ; sonucu sakla
RET                ; prosedürü bitir
AddNumbers ENDP
number1 DW 5       ; ilk sayı 5
number2 DW 3       ; ikinci sayı 3
result  DW ?       ; sonucu tutar

; YAZMACLAR: AX
; BELLEK: result 2
; Beklenen cikti:
; AX=0008h
; result: 08h 00h
