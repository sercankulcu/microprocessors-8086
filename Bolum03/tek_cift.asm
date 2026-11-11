; Aynı program 8086'da: 1'den n'ye (n = 3) her sayının tek mi çift mi olduğunu yazar.
; Yüksek düzeydeki for/if, CMP + koşullu atlama ve TEST ile en düşük bit sınaması olur.
; Kaynak: Bölüm 3.1 Programlama Dilleri, "Aynı Program: 8086"

org 100h
       mov  cx, 1       ; i = 1
dongu: cmp  cx, 3       ; i ile n karşılaştır
       ja   bitti       ; i > n ise bitir
       mov  dl, cl
       add  dl, '0'     ; rakam → ASCII
       mov  ah, 02h
       int  21h         ; DL'yi yaz
       test cl, 1       ; en düşük bit
       jnz  tek         ; 1 ise tek
       lea  dx, cift_m
       jmp  yaz
tek:   lea  dx, tek_m
yaz:   mov  ah, 09h
       int  21h         ; dizgiyi yaz
       inc  cx          ; i++
       jmp  dongu
bitti: ret
tek_m  db ' sayisi bir tek sayidir.',0Dh,0Ah,'$'
cift_m db ' sayisi bir cift sayidir.',0Dh,0Ah,'$'

; Beklenen cikti:
; 1 sayisi bir tek sayidir.
; 2 sayisi bir cift sayidir.
; 3 sayisi bir tek sayidir.
