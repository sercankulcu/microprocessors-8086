; CMP ve JE ile eşitlik sınaması: AX = BX = 5 olduğundan ZF = 1, equal_message'a atlanır.
; Sunum: Bölüm 7 Akış Kontrolü, slayt "Eşitlik Örneği".
org 100h              ; sunumda yok: .COM programı
mov ax, 5
mov bx, 5
cmp ax, bx
je  equal_message
jmp not_equal_message
equal_message:        ; eşitse
mov cx, 1             ; sunumda yok: hangi dalın çalıştığını göstermek için
jmp end_program
not_equal_message:    ; eşit değilse
mov cx, 2             ; sunumda yok: hangi dalın çalıştığını göstermek için
end_program:
ret                   ; sunumda yok: DOS'a dönüş

; YAZMACLAR: AX BX CX ZF
; Beklenen cikti:
; AX=0005h
; BX=0005h
; CX=0001h
; ZF=1
