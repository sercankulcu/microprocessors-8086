; CALISTIRMA: yalniz derleme
; HATALI KOD: prosedür PUSH AX yapıp POP AX'i unutuyor. RET yığının tepesindeki 1234h'yi
; dönüş adresi sanır (IP = 1234h), program çöker. Bu yüzden yalnızca derlenir.
; Doğrusu: prosedürün RET'inden önce POP AX.
; Sunum: Bölüm 8 Prosedürler, slayt "Dengesiz Yığın".
ORG 100h
MOV  AX, 1234h     ; 0100h: B8 34 12
CALL hatali        ; 0103h: dönüş = 0106h
RET                ; 0106h
hatali PROC
PUSH AX            ; AX saklandı...
; ... işlemler ...
RET                ; POP AX unutuldu!
hatali ENDP
