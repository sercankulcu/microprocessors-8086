; REP MOVSB: DS:SI'daki "ABC" ES:DI'ya kopyalanır; CLD ile SI ve DI her adımda artar.
; Kaynak: Bölüm 2.2 8086 Yazmaçları, "REP MOVSB" (SI ve DI ile Dizgi Kopyalama)

org 100h         ; sunumda yok: .COM programı
CLD              ; DF=0: artan adres
MOV SI, 0200h    ; kaynak
MOV DI, 0300h    ; hedef
MOV CX, 3        ; bayt sayısı
REP MOVSB        ; ES:[DI] ← DS:[SI]
RET              ; sunumda yok: DOS'a dön

org 0200h               ; sunumda yok: sunumdaki kaynak dizgi DS:0200h'de
kaynak db 'ABC'         ; sunumda yok
org 0300h               ; sunumda yok: hedef alan DS:0300h'de
hedef  db 4 dup(0)      ; sunumda yok

; YAZMACLAR: SI DI CX
; BELLEK: hedef 4

; Beklenen cikti:
; SI=0203h
; DI=0303h
; CX=0000h
; hedef: 41h 42h 43h 00h
