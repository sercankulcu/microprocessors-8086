; BIOS veri alanı (0040h kesimi): 006Ch'deki tık sayacıyla yaklaşık 1 saniye (18 tık) beklemek;
; 0017h'deki klavye durum baytından Caps Lock'u, 001Ah/001Ch'den klavye tamponunu denetlemek.
; Etiketlerin hedefleri ve yazdırma sunumda yok: Caps Lock kapalı ve tampon boş olduğu için
; 'B' yazılır (AH = 02h, AL = yazılan karakter).
; Kaynak: Bölüm 5.2 sunumu, "Tık Sayacı ile Bekleme".
; YAZMACLAR: AX
org 100h            ; sunumda yok: .COM programı
; yaklaşık 1 saniye bekle
mov ax, 0040h
mov es, ax
mov bx, es:[006Ch]  ; başlangıç tıkı
bekle:
mov ax, es:[006Ch]  ; şimdiki tık
sub ax, bx          ; geçen tık
cmp ax, 18          ; 18 tık ≈ 0,99 s
jb  bekle

; Caps Lock açık mı? Bekleyen tuş var mı?
test byte ptr es:[0017h], 40h
jnz caps_acik       ; bit 6 = 1
mov ax, es:[001Ah]  ; tampon başı
cmp ax, es:[001Ch]  ; tampon sonu
je  tampon_bos
mov dl, 'T'         ; sunumda yok: tamponda tuş var
jmp yaz             ; sunumda yok
caps_acik:          ; sunumda yok
mov dl, 'C'         ; sunumda yok
jmp yaz             ; sunumda yok
tampon_bos:         ; sunumda yok
mov dl, 'B'         ; sunumda yok
yaz:                ; sunumda yok
mov ah, 02h         ; sunumda yok
int 21h             ; sunumda yok
ret                 ; sunumda yok

; Beklenen cikti:
; B
; AX=0242h
