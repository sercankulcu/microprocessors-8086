; Prosedürle mesaj yazdırma: print_me SI'daki 0 ile biten dizgiyi INT 10h teletype ile yazar.
; Sunum: Bölüm 8 Prosedürler, slaytlar "Merhaba Dünya Mesajı" (iskelet) ve "print_me İzleme".
ORG    100h
LEA    SI, msg       ; SI = msg adresi
CALL   print_me
RET                  ; DOS'a dön
print_me PROC
next_char:
CMP  b.[SI], 0       ; sıfır mı?
JE   stop            ; evet: bitir
MOV  AL, [SI]        ; sıradaki ASCII karakter
MOV  AH, 0Eh         ; teletype işlevi
INT  10h             ; AL'yi ekrana yaz
ADD  SI, 1           ; sonraki karakter
JMP  next_char       ; başa dön
stop:
RET                  ; çağırana dön
print_me ENDP
msg DB 'Hello World!', 0
END

; YAZMACLAR: AL
; Beklenen cikti:
; Hello World!
; AL=21h
