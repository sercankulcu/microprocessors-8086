; JMP ile koşulsuz atlama: akış 1 -> 2 -> 3 -> calc -> back -> stop, sonuç AX = 7.
; Sunum: Bölüm 7 Akış Kontrolü, slayt "JMP Örneği".
org    100h
mov    ax, 5          ; ax = 5
mov    bx, 2          ; bx = 2
jmp    calc           ; 'calc' etiketine git
back:  jmp stop       ; 'stop' etiketine git
calc:
add    ax, bx         ; ax = ax + bx
jmp    back           ; 'back' etiketine dön
stop:
ret                   ; işletim sistemine dön

; YAZMACLAR: AX BX
; Beklenen cikti:
; AX=0007h
; BX=0002h
