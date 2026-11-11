; .COM program şablonu: kod 0100h'den başlar (önünde 256 baytlık PSP), değişkenler
; RET'ten sonra durur ve komut olarak yürütülmez. sayi 010Bh'dedir.
; Kaynak: Bölüm 3.2 Assembly, ".COM Program Şablonu" ve ".COM Programı: Kod İzleme"

ORG 100h          ; .COM: kod 0100h'den başlar

MOV AX, 5         ; AX = 5
MOV BX, 3         ; BX = 3
ADD AX, BX        ; AX = AX + BX = 8
MOV CL, AL        ; CL = 08h

RET               ; DOS'a dön

sayi DB 0         ; değişkenler RET'ten sonra

; YAZMACLAR: AX BX CL
; BELLEK: sayi 1

; Beklenen cikti:
; AX=0008h
; BX=0003h
; CL=08h
; sayi: 00h
