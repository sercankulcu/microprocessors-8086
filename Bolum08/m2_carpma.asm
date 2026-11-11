; Yazmaçla parametre: m2 AL * BL hesaplar. İki çağrı: 1 * 2 = 2, sonra 2 * 2 = 4.
; Sunum: Bölüm 8 Prosedürler, slaytlar "Örnek: m2 ile Çarpma" ve "Yazmaçların Korunması"
; (prosedür başlığı açıklaması).
ORG    100h
MOV    AL, 1       ; 1. parametre
MOV    BL, 2       ; 2. parametre
CALL   m2          ; 0104h: E8 04 00
CALL   m2          ; 0107h: E8 01 00
RET                ; 010Ah: DOS'a dön
; m2: AL * BL hesaplar
; Girdi : AL, BL (işaretsiz)
; Çıktı : AX = AL * BL
; Bozar : CF, OF
m2 PROC            ; 010Bh
MUL    BL          ; AX = AL * BL
RET                ; çağırana dön
m2 ENDP
END

; YAZMACLAR: AX BL CF OF
; Beklenen cikti:
; AX=0004h
; BL=02h
; CF=0
; OF=0
