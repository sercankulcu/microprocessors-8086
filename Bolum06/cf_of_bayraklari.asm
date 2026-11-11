; CF ve OF: aynı toplama işaretsiz ve işaretli yorumda ayrı ayrı taşabilir; INC CF'ye
; dokunmaz, CMC CF'yi tersler. Sondaki bayraklar sunumdaki izin son satırıdır.
; Kaynak: Bölüm 6 sunumu, "CF ve OF: Kod İzleme".
; YAZMACLAR: AL CF ZF SF OF AF PF
org 100h         ; sunumda yok: .COM programı
MOV  AL, 9Ch     ; 156 ya da -100
ADD  AL, 70h     ; + 112
MOV  AL, 50h     ; 80
ADD  AL, 50h     ; + 80
ADD  AL, AL      ; A0h + A0h
MOV  AL, 0FFh
INC  AL          ; CF'ye dokunmaz
CMC              ; CF tersine
RET

; Beklenen cikti:
; AL=00h
; CF=0
; ZF=1
; SF=0
; OF=0
; AF=1
; PF=1
