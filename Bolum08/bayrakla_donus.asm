; Bayrakla dönüş: rakam prosedürü AL'deki karakteri sayıya çevirir, başarıyı CF ile bildirir.
; '7' -> CF = 0, AL = 7 (BL'ye saklanır); 'x' -> CF = 1 (rakam değil).
; Sunum: Bölüm 8 Prosedürler, slayt "Bayrakla Dönüş: Kod İzleme".
ORG  100h        ; sunumda yok: .COM programı
MOV  AL, '7'
CALL rakam       ; CF = 0 → AL = değer
MOV  BL, AL
MOV  AL, 'x'
CALL rakam       ; CF = 1 → rakam değil
RET
rakam PROC       ; Girdi AL, Çıktı CF
SUB  AL, '0'
CMP  AL, 10      ; 0..9 → ödünç, CF = 1
CMC              ; rakamsa CF = 0
RET
rakam ENDP

; YAZMACLAR: AL BL CF
; Beklenen cikti:
; AL=48h
; BL=07h
; CF=1
