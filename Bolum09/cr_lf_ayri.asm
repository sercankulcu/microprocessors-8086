; CR ve LF ayri ayri: yalniz LF alt satira iner ama sutun degismez; yalniz CR satir
; basina doner, satirdaki yazi silinmez. Ekranda "ab" ve altinda "d c".
; Sunum 9.2 "CR ve LF Ayri Ayri: Kod Izleme".
ORG  100h
MOV  AH, 0Eh     ; teletype
MOV  AL, 'a'
INT  10h
MOV  AL, 'b'
INT  10h
MOV  AL, 10      ; yalnız LF
INT  10h
MOV  AL, 'c'
INT  10h
MOV  AL, 13      ; yalnız CR
INT  10h
MOV  AL, 'd'
INT  10h
RET

; Beklenen cikti:
; ab
; d c
