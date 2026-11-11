; BP taban işaretçisi: prosedür girişinde PUSH BP + MOV BP, SP; yığındaki parametre
; [BP+4]'ten okunur ([BP] eski BP, [BP+2] dönüş adresi). RET 2 parametreyi yığından atar.
; Kaynak: Bölüm 2.2 8086 Yazmaçları, "BP — Taban İşaretçisi"

org 100h               ; sunumda yok: .COM programı
  MOV  BX, 0025h       ; sunumda yok: parametre
  PUSH BX              ; sunumda yok: parametreyi yığına it
  CALL TOPLA           ; sunumda yok: prosedürü çağır
  MOV  DX, SP          ; sunumda yok: RET 2 sonrası SP (FFFEh: parametre atıldı)
  RET                  ; sunumda yok: DOS'a dön

TOPLA PROC
  PUSH BP
  MOV  BP, SP     ; çerçeve tabanı
  MOV  AX, [BP+4] ; 1. parametre
  POP  BP
  RET  2
TOPLA ENDP

; YAZMACLAR: AX DX

; Beklenen cikti:
; AX=0025h
; DX=FFFEh
