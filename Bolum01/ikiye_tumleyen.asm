; İkiye tümleyen: NOT + 1 ile NEG aynı sonucu verir (-45 = D3h), -45 + 45 = 0;
; 16 bitte -45 = FFD3h.
; Kaynak: Bölüm 1.2 Sayı Sistemleri, "İkiye Tümleyen: Kod İzleme"

ORG 100h
MOV AL, 45       ; +45
MOV BL, AL
NOT BL         ; 1'e tümleyen
INC BL           ; + 1
NEG AL           ; tek komutla
CMP AL, BL       ; aynı mı?
ADD AL, 45       ; -45 + 45
MOV AX, 45
NEG AX           ; 16 bitte -45
RET

; YAZMACLAR: AX BL CF ZF SF OF

; Beklenen cikti:
; AX=FFD3h
; BL=D3h
; CF=1
; ZF=0
; SF=1
; OF=0
