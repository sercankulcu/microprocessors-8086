; Kosullu derleme: KAYDIR AX (n bos -> SHL AX, 1) ve KAYDIR BX, 3 (MOV CL, 3 / SHL BX, CL);
; HATA_AYIKLA = 1 oldugu icin PUTC '*' derlenir. Sunum 9.1 "Kosullu Derleme";
; kullanim ve degerler "Kosullu Acilim: Kod Izleme"den.
include 'emu8086.inc'    ; sunumda yok: PUTC tanimi

KAYDIR MACRO r, n
  IFB <n>          ;; n verilmedi mi?
    SHL r, 1
  ELSE
    MOV CL, n
    SHL r, CL
  ENDIF
ENDM

ORG 100h                 ; sunumda yok
mov ax, 5                ; sunumda yok
mov bx, 3                ; sunumda yok
KAYDIR AX                ; sunumda yok
KAYDIR BX, 3             ; sunumda yok

HATA_AYIKLA = 1
IF HATA_AYIKLA
  PUTC '*'         ; yalnız deneme sürümünde
ENDIF
RET                      ; sunumda yok

; YAZMACLAR: AX BX CL
; Beklenen cikti:
; *
; AX=000Ah
; BX=0018h
; CL=03h
