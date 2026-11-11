; BIOS'suz çıktı: B800h ekran belleğine doğrudan yazmak. Her hücre 2 bayt (karakter,
; öznitelik); (1,4) hücresi (1*80+4)*2 = 00A8h'dedir. Sonra REP STOSW ile ilk 3 hücre '.'.
; Sunumdaki ilk örnek tüm ekranı CX = 2000 ile doldurur; kod izleme aynı kodu CX = 3 ile verir.
; Ekranda ilk satırda '...', (1,4) hücresinde 'A' görünür; yazmaçlar da denetlenir.
; Kaynak: Bölüm 5.2 sunumu, "Doğrudan Ekran Belleği" ve "B800h Ekran Belleği: Kod İzleme".
; YAZMACLAR: ES DI AX CX
org 100h
mov ax, 0B800h
mov es, ax
mov di, (1*80+4)*2  ; 00A8h
mov ax, 4E41h
mov es:[di], ax
xor di, di
mov ax, 072Eh
mov cx, 3           ; ilk 3 hücre
cld
rep stosw
ret

; Beklenen cikti:
; ...
;     A
; ES=B800h
; DI=0006h
; AX=072Eh
; CX=0000h
