; Çağıranın koruması: sayi_oku sonucu CX'te döndürür, bu yüzden döngü sayacını çağıran saklar.
; Üç sayı okunur (10, 20, 30), toplam = 60 = 003Ch. SCAN_NUM Enter'ı CR olarak yansıttığı için
; her sayı aynı satırın başına yazılır; ekranda yalnız son sayı (30) kalır.
; Sunum: Bölüm 8 Prosedürler, slayt "Çağıran mı Korur, Çağrılan mı?".
; GIRDI: "10\r20\r30\r"
include 'emu8086.inc'  ; sunumda yok: SCAN_NUM için
ORG 100h               ; sunumda yok: .COM programı
MOV  CX, 3             ; sunumda yok: üç sayı okunacak
dongu: PUSH CX         ; çağıran: sayaç
       CALL sayi_oku   ; sonuç CX'te
       ADD  toplam, CX
       POP  CX         ; sayaç geri
       LOOP dongu
RET                    ; sunumda yok: DOS'a dönüş
sayi_oku PROC          ; sunumda yok: klavyeden sayı okur, CX'te döndürür
CALL SCAN_NUM          ; sunumda yok
RET                    ; sunumda yok
sayi_oku ENDP          ; sunumda yok
toplam DW 0            ; sunumda yok
DEFINE_SCAN_NUM        ; sunumda yok

; YAZMACLAR: CX
; BELLEK: toplam 2
; Beklenen cikti:
; 30
; CX=0000h
; toplam: 3Ch 00h
