; XCHG ile tek komutta takas.
; Sunum: Bölüm 8 Yığın, slayt "Takas Yöntemleri" (3. yöntem).
ORG 100h          ; sunumda yok: .COM programı
MOV AX, 1212h     ; sunumda yok: başlangıç değerleri
MOV BX, 3434h     ; sunumda yok: başlangıç değerleri
XCHG AX, BX
RET               ; sunumda yok: DOS'a dönüş

; YAZMACLAR: AX BX
; Beklenen cikti:
; AX=3434h
; BX=1212h
