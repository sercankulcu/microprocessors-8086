; Video bellegine dogrudan yazma: B800:015Eh (satir 2, sutun 15) <- 'A' ve renk DFh.
; Sunum 4.1 Bellek Erisimi, slaytlar "Program Örneği" ve "Program İzleme" (ayni kod).
; 'A' ekranda satir 2, sutun 15'te gorunur; hucre ayrica BELLEK ile okunur
; (program bittiginde DS = B800h oldugu icin 'hucre' B800:015Eh'yi gosterir).
ORG 100h          ; .com programı için
MOV AX, 0B800h    ; AX = B800h
MOV DS, AX        ; DS = B800h
MOV CL, 'A'       ; CL = 41h
MOV CH, 11011111b ; CH = DFh
MOV BX, 15Eh      ; BX = 015Eh
MOV [BX], CX      ; B800:015E ← CX
RET               ; DOS'a dön
hucre EQU 15Eh    ; sunumda yok: BELLEK yonergesi icin ad

; YAZMACLAR: DS CX BX
; BELLEK: hucre 2

; Beklenen cikti:
;
;
;                A
; DS=B800h
; CX=DF41h
; BX=015Eh
; hucre: 41h DFh
