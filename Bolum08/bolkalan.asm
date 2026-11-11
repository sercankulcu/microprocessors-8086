; Birden çok sonuç: bolkalan AX'i BL'ye böler; AL = bölüm, AH = kalan, CF = 1 bölen 0 ise.
; 100 / 7 -> AL = 0Eh, AH = 02h, CF = 0 (DX'e saklanır); 100 / 0 -> CF = 1, AX değişmez.
; (Üçüncü girdi 1000 / 2 bölümü AL'ye sığmadığı için bölme hatası verir; burada denenmez.)
; Sunum: Bölüm 8 Prosedürler, slayt "Birden Çok Sonuç Döndürmek".
ORG  100h       ; sunumda yok: .COM programı
MOV  AX, 100    ; sunumda yok: 1. deneme
MOV  BL, 7      ; sunumda yok
CALL bolkalan   ; sunumda yok
MOV  DX, AX     ; sunumda yok: sonucu sakla
MOV  AX, 100    ; sunumda yok: 2. deneme, bölen 0
MOV  BL, 0      ; sunumda yok
CALL bolkalan   ; sunumda yok
RET             ; sunumda yok: DOS'a dönüş
bolkalan PROC   ; Girdi: AX, BL (bölen)
CMP  BL, 0      ; Çıktı: AL = bölüm
JE   hata       ;        AH = kalan
DIV  BL         ;        CF = 1: bölen 0
CLC
RET
hata: STC
RET
bolkalan ENDP

; YAZMACLAR: DX AX CF
; Beklenen cikti:
; DX=020Eh
; AX=0064h
; CF=1
