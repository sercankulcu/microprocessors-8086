; 5 + 10 - 1 = 14 hesaplayıp sonucu TEST ve SHL ile bit bit ikilik tabanda yazdırmak.
; Kaynak: Bölüm 5.2 sunumu, "Toplama, Çıkarma ve Sonucu Yazdırma" (iki slayt) ve
; "Kod İzleme: Hesaplama" / "Kod İzleme: Döngü".
; GIRDI: " "
org 100h
mov al, 5       ; 00000101b
mov bl, 10      ; 0Ah = 00001010b
; 5 + 10 = 15 = 0Fh = 00001111b
add bl, al
; 15 - 1 = 14 = 0Eh = 00001110b
sub bl, 1
mov cx, 8       ; sonucu ikilik tabanda yazdır
print:
mov ah, 2   ; yazdırma fonksiyonu
mov dl, '0'
test bl, 10000000b  ; ilk biti test et
jz zero
mov dl, '1'
zero:
int 21h
shl bl, 1
loop print
; ikili sayı eki b yazdır
mov dl, 'b'
int 21h
; klavye tuşu basılmasını bekle
mov ah, 0
int 16h
ret

; Beklenen cikti:
; 00001110b
