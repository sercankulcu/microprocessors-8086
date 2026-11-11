; INT 10h AH = 02h ile imleci konumlamak, AH = 03h ile konumu okuyup bir sağa kaydırmak.
; Kaynak: Bölüm 5.2 sunumu, "İmleç: AH = 02h ve 03h".
; YAZMACLAR: DX
org 100h        ; sunumda yok: .COM programı
; imleci ortaya al
mov ah, 02h
mov bh, 0
mov dx, 0C28h   ; 12. satır, 40. sütun
int 10h

; imleci bir sağa kaydır
mov ah, 03h
mov bh, 0
int 10h        ; DH, DL = konum
inc dl
mov ah, 02h
int 10h
mov ah, 0Eh    ; sunumda yok: imlecin yerini göstermek için '*' yaz
mov al, '*'    ; sunumda yok
int 10h        ; sunumda yok
ret            ; sunumda yok: programı bitir

; Beklenen cikti:
;
;
;
;
;
;
;
;
;
;
;
;
;                                          *
; DX=0C29h
