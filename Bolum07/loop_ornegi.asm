; LOOP: CX'i azaltır, sıfır değilse etikete atlar; döngü 5 kez döner.
; Sunum: Bölüm 7 Akış Kontrolü, slayt "LOOP Örneği".
org 100h
mov cx, 5         ; CX = tekrar sayısı (5)
dongu:
; döngü içeriği
inc ax            ; sunumda yok: tur sayısını AX'te saymak için
loop dongu        ; CX ≠ 0 ise dongu'ye atla
jmp dur           ; döngü bitince dur'a atla
dur:
ret

; YAZMACLAR: AX CX
; Beklenen cikti:
; AX=0005h
; CX=0000h
