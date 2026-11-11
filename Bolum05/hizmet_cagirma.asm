; Hizmet çağırma kalıbı: AH = servis numarası, diğer yazmaçlar parametre, sonra INT.
; Kaynak: Bölüm 5.2 sunumu, "Hizmet Çağırma Kalıbı".
org 100h       ; sunumda yok: .COM programı
mov ah, 02h    ; servis: karakter yaz
mov dl, 'A'    ; parametre
int 21h        ; DOS'u çağır
ret            ; sunumda yok: programı bitir

; Beklenen cikti:
; A
