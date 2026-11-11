; CALISTIRMA: yalniz derleme
; HATALI KOD: PUSH AX'in POP'u unutulmuş. RET yığının tepesindeki 1234h'yi dönüş adresi
; sanar, CPU 0700:1234h'deki rastgele baytları yürütür. Bu yüzden yalnızca derlenir.
; Doğrusu: RET'ten önce POP AX.
; Sunum: Bölüm 8 Yığın, slayt "Hata: Dengesiz PUSH".
ORG   100h
MOV   AX, 1234h
PUSH  AX         ; POP unutuldu!
RET              ; IP ← ?
