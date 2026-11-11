; 16 bitlik işlemcide 32 bitlik toplama: ADD düşük yarıları, ADC yüksek yarıları
; ve düşük yarıdan taşan eldeyi (CF) toplar.
; a = 0001FFFFh (131.071), b = 00030002h (196.610), a + b = 00050001h (327.681)
; Kaynak: Bölüm 1.1 Giriş, "32 Bitlik Toplama: Kod İzleme"

org 100h
mov ax, 0FFFFh ; a: düşük yarı
mov dx, 0001h  ; a: yüksek yarı
mov bx, 0002h  ; b: düşük yarı
mov cx, 0003h  ; b: yüksek yarı
add ax, bx     ; düşük yarılar
adc dx, cx     ; yüksek + CF
ret

; YAZMACLAR: DX AX CF

; Beklenen cikti:
; DX=0005h
; AX=0001h
; CF=0
