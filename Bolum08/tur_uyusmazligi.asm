; CALISTIRMA: yalniz derleme
; HATALI KOD: yakın CALL yalnız IP'yi iter ama prosedür RETF ile döner. RETF IP'den sonra
; CS olarak DOS'un 0000h'sini çeker, işlemci 0000:0106h'ye (kesme vektör tablosu) atlar ve
; program çöker. Bu yüzden yalnızca derlenir. Doğru biçim: uzak_donus.asm (PUSH CS ile).
; Sunum: Bölüm 8 Prosedürler, slayt "Tür Uyuşmazlığı: Kod İzleme".
ORG  100h
MOV  AX, 5
CALL uzak        ; yakın CALL: yalnız IP
ADD  AX, 1
RET
uzak PROC
SHL  AX, 1
RETF             ; IP ve CS çeker!
uzak ENDP
