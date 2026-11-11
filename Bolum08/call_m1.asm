; CALL ve RET: CALL dönüş adresini (0103h) yığına iter, RET onu geri alır.
; Sunum: Bölüm 8 Prosedürler, slayt "Örnek: CALL m1".
ORG    100h
CALL   m1         ; 0100h: E8 04 00
MOV    AX, 2      ; 0103h: B8 02 00
RET               ; 0106h: C3 → DOS
m1 PROC
MOV    BX, 5      ; 0107h: BB 05 00
RET               ; 010Ah: C3 → çağırana
m1 ENDP
END

; YAZMACLAR: AX BX
; Beklenen cikti:
; AX=0002h
; BX=0005h
