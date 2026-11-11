; Prosedür kullandığı yazmaçları girişte PUSH ile saklar, çıkışta TERS sırayla POP eder.
; Sunum: Bölüm 8 Prosedürler, slayt "Yazmaçların Korunması".
ORG 100h          ; sunumda yok: .COM programı
MOV AX, 1111h     ; sunumda yok: çağıranın değerleri
MOV SI, 2222h     ; sunumda yok
CALL yaz          ; sunumda yok
RET               ; sunumda yok: DOS'a dönüş
yaz PROC
    PUSH AX       ; kullanacaklarını
    PUSH SI       ; sakla
    ; ... AX ve SI kullanılır
    MOV AX, 0     ; sunumda yok: AX ve SI'yı bozan iş
    MOV SI, 0     ; sunumda yok
    POP  SI       ; TERS sırayla
    POP  AX       ; geri yükle
    RET
yaz ENDP

; YAZMACLAR: AX SI
; Beklenen cikti:
; AX=1111h
; SI=2222h
