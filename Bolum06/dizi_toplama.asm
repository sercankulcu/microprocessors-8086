; İki bayt dizisini eleman eleman toplayıp üçüncü diziye yazmak (SI, BX, DI ile adresleme).
; Kaynak: Bölüm 6 sunumu, "Dizi Elemanları Toplama" ve "Kod İzleme: Dizi Toplama".
; BELLEK: vec3 4
org 100h
jmp start
vec1 db 1, 2, 5, 6
vec2 db 3, 5, 6, 1
vec3 db ?, ?, ?, ?
start:
lea si, vec1
lea bx, vec2
lea di, vec3
mov cx, 4
sum:
mov al, [si]
add al, [bx]
mov [di], al
inc si
inc bx
inc di
loop sum
ret

; Beklenen cikti:
; vec3: 04h 07h 0Bh 07h
