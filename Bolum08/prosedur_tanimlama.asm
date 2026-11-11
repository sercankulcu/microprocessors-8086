; PROC / ENDP ile prosedür tanımlama ve CALL ile çağırma. Ana program RET ile biter;
; prosedür kodu sırayla yürütülmez, yalnız CALL ile girilir.
; Sunum: Bölüm 8 Prosedürler, slaytlar "Prosedür Tanımlama" (genel kalıp: ad PROC ... RET ad ENDP).
; Program sonunda yığın dengeli: son RET DOS'un 0000h'sini alır, SP = 0000h.
ORG 100h
    CALL p1
    RET          ; ana program biter
p1 PROC          ; RET'ten sonra:
    ; ...          ; sırayla yürütülmez
    RET
p1 ENDP
END

; YAZMACLAR: SP
; Beklenen cikti:
; SP=0000h
