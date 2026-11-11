; Üçüncü bir yazmaçla (CX) takas: yığın kullanmadan üç MOV.
; Sunum: Bölüm 8 Yığın, slayt "Takas Yöntemleri" (2. yöntem).
ORG 100h          ; sunumda yok: .COM programı
MOV AX, 1212h     ; sunumda yok: başlangıç değerleri
MOV BX, 3434h     ; sunumda yok: başlangıç değerleri
MOV CX, AX
MOV AX, BX
MOV BX, CX
RET               ; sunumda yok: DOS'a dönüş

; YAZMACLAR: AX BX CX
; Beklenen cikti:
; AX=3434h
; BX=1212h
; CX=1212h
