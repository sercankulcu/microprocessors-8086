; .COM program şablonu: ORG 100h, tek kesim, RET (ya da INT 20h) ile çıkış.
; Kaynak: Bölüm 5.2 sunumu, "COM ve EXE Şablonları".
org 100h
  mov dx, offset msg
  mov ah, 09h
  int 21h
  ret             ; ya da int 20h
msg db 'Merhaba$'

; Beklenen cikti:
; Merhaba
