; STD ile geriye kopyalama: örtüşen alanda hedef kaynağın ilerisindeyse sondan başa
; kopyalanır. "KLMN" bir sağa kayar: KKLMN. (CLD ile kopyalansaydı KKKKK olurdu.)
; Kaynak: Bölüm 2.2 8086 Yazmaçları, "STD ile Geriye Kopyalama: Kod İzleme"

org 100h
mov si, offset dizi+3 ; kaynak
mov di, offset dizi+4 ; hedef
mov cx, 4
std                   ; DF = 1
rep movsb
cld
ret
dizi db 'KLMN', 0

; YAZMACLAR: SI DI CX DF
; BELLEK: dizi 5

; Beklenen cikti (dizi 010Eh'de):
; SI=010Dh
; DI=010Eh
; CX=0000h
; DF=0
; dizi: 4Bh 4Bh 4Ch 4Dh 4Eh
