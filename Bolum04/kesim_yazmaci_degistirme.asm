; Kesim yazmacini gecici degistirmek: PUSH DS / POP DS arasinda DS = B800h (video);
; SS degisince hemen ardindan SP kurulur.
; Sunum 4.1 Bellek Erisimi, slayt "Kesim Yazmacını Değiştirmek" (iki parca).
.model small            ; sunumda yok: yeni_yigin kesimi icin .EXE
yigin segment stack     ; sunumda yok: baslangic yigini
dw 32 dup(0)            ; sunumda yok
yigin ends              ; sunumda yok
yeni_yigin segment      ; sunumda yok: 0400h baytlik ikinci yigin
dw 200h dup(0)          ; sunumda yok
yeni_yigin ends         ; sunumda yok
kod segment             ; sunumda yok
assume cs:kod           ; sunumda yok
basla:                  ; sunumda yok
PUSH DS            ; DS'yi sakla
MOV  AX, 0B800h
MOV  DS, AX        ; geçici kesim
MOV  BYTE PTR [0], 'Z'
MOV  BL, DS:[0]    ; sunumda yok: yazilani geri oku
POP  DS            ; değişkenler geri

MOV  AX, yeni_yigin
MOV  SS, AX        ; ardından hemen
MOV  SP, 0400h     ; SP kurulur
MOV  AX, 4C00h     ; sunumda yok: DOS'a don
INT  21h           ; sunumda yok
kod ends           ; sunumda yok
end basla          ; sunumda yok

; YAZMACLAR: DS BL SP

; Beklenen cikti:
; Z
; DS=0700h
; BL=5Ah
; SP=0400h
