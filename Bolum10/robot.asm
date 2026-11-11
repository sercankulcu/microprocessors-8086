; Robot (port 9 komut, 10 veri, 11 durum): her komuttan once mesgul biti (bit 1) sifir olana
; kadar, incele (4) komutundan sonra yeni veri biti (bit 0) bir olana kadar beklenir.
; Onunde duvar (FFh) varsa saga don (3), sonuk lamba (8) varsa yak (5), yoksa ileri (1).
; Burada port 11 hep 01h (hazir, veri var), port 10 sirayla 0 (bos), 8 (sonuk lamba),
; FFh (duvar), 0 dondurur. Sonsuz dongu.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Robot Programı" ve "Robot: Veri Bekleme"
; PORT 11: 01h
; PORT 10: 0 8 0FFh 0
; SINIR: 78

#start=robot.exe#
ORG 100h       ; sunumda yok
dongu: CALL hazir_bekle
       MOV  AL, 4       ; incele
       OUT  9, AL
       CALL veri_bekle
       IN   AL, 10
       CMP  AL, 0FFh    ; duvar?
       JE   don
       CMP  AL, 8       ; sönük lamba?
       JNE  ilerle
       CALL hazir_bekle
       MOV  AL, 5       ; yak
       OUT  9, AL
       JMP  dongu
don:   MOV  AL, 3       ; sağa dön
       JMP  gonder
ilerle: MOV AL, 1       ; ileri
gonder: PUSH AX         ; komutu koru
       CALL hazir_bekle
       POP  AX
       OUT  9, AL
       JMP  dongu

hazir_bekle PROC
b1:    IN   AL, 11
       TEST AL, 010b    ; meşgul?
       JNZ  b1
       RET
hazir_bekle ENDP

veri_bekle PROC
v1:    IN   AL, 11
       TEST AL, 001b    ; yeni veri?
       JZ   v1
       RET
veri_bekle ENDP

; Beklenen cikti:
; OUT 9 <- 04h
; OUT 9 <- 01h
; OUT 9 <- 04h
; OUT 9 <- 05h
; OUT 9 <- 04h
; OUT 9 <- 03h
