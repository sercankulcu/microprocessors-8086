; Tek çıkış noktası: bul prosedürü hangi yoldan çıkarsa çıksın son etiketinde POP'ları yapar.
; dizi = 3, 9, 7, 1, 4 içinde 7 aranır: CF = 1 (bulundu), BX = 2; CX ve SI (dizi = 011Fh) korunur.
; Sunum: Bölüm 8 Prosedürler, slayt "Tek Çıkış Noktası: Kod İzleme".
ORG  100h
LEA  SI, dizi
MOV  CX, 5
MOV  AL, 7
CALL bul         ; CF = 1: bulundu
RET
bul PROC         ; Girdi: SI, CX, AL
PUSH CX
PUSH SI
XOR  BX, BX      ; Çıktı: BX = indis
ara: CMP [SI], AL
JE   buldu
INC  SI
INC  BX
LOOP ara
CLC              ; bulunamadı
JMP  son
buldu: STC
son: POP SI      ; tek çıkış noktası
POP  CX
RET
bul ENDP
dizi DB 3, 9, 7, 1, 4

; YAZMACLAR: BX CX SI CF
; Beklenen cikti:
; BX=0002h
; CX=0005h
; SI=011Fh
; CF=1
