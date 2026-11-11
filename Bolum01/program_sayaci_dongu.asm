; Program sayacı (IP) ve döngü: LOOP ile 3 + 2 + 1 toplanır, HLT ile durulur.
; LOOP atlarken IP'ye hedef adres (0106h) yazılır; sıralı akış bozulur.
; Kaynak: Bölüm 1.1 Giriş, "Program Sayacı ve Döngü" (Kod İzleme: IP Nasıl Değişir?)
; Sunumda satır başlarındaki 0100, 0103, ... komut adresleridir; burada yorumda gösterildi.

org 100h              ; sunumda yok: .COM programı 0100h'den başlar

      mov  cx, 3     ; sayaç = 3          (0100)
      mov  ax, 0     ; toplam = 0         (0103)
dongu: add ax, cx    ;                    (0106)
      loop dongu     ; CX--, CX≠0 ise atla (0108)
      hlt            ; dur                (010A)

; YAZMACLAR: AX CX

; Beklenen cikti:
; AX=0006h
; CX=0000h
