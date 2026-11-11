; Aynı CMP, iki farklı karar: FBh işaretsiz 251 (JA atlar), işaretli -5 (JG atlamaz).
; 7Fh ile 80h karşılaştırılınca SF = OF = 1, JG atlar (127 > -128).
; Sonuç: CL = 0 (JA atladı), CH = 1 (JG atlamadı), DL = 0 (ikinci JG atladı).
; Sunum: Bölüm 7 Akış Kontrolü, slayt "JA ve JG: Kod İzleme".
ORG  100h        ; sunumda yok: .COM programı
MOV  AL, 0FBh    ; 251 ya da -5
MOV  BL, 03h
CMP  AL, BL      ; FBh - 03h
JA   a1          ; işaretsiz: 251 > 3 ?
MOV  CL, 1       ; JA atlamasaydı
a1:  JG  g1      ; işaretli: -5 > 3 ?
MOV  CH, 1       ; JG atlamadı
g1:  MOV AL, 7Fh ; 127
CMP  AL, 80h     ; 127 - (-128)
JG   g2          ; SF = OF ?
MOV  DL, 1       ; JG atlamasaydı
g2:  RET

; YAZMACLAR: AL CL CH DL CF SF OF
; Beklenen cikti:
; AL=7Fh
; CL=00h
; CH=01h
; DL=00h
; CF=1
; SF=1
; OF=1
