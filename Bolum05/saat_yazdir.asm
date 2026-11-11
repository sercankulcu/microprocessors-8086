; INT 21h AH = 2Ch ile sistem saatini (ikili) alıp AAM ile iki haneye ayırarak SS:DD yazdırmak.
; Deneme ortamının saati 12:00:00.
; Kaynak: Bölüm 5.2 sunumu, "İz: Saati Yazdır".
org 100h
mov ah, 2Ch       ; sistem saatini al
int 21h           ; CH=saat CL=dakika
mov al, ch
call yaz2
mov dl, ':'
mov ah, 02h
int 21h
mov al, cl
call yaz2
ret
yaz2:             ; AL (0-99) → 2 hane
aam               ; AH=onlar AL=birler
add ax, 3030h     ; ASCII
mov bx, ax
mov dl, bh
mov ah, 02h
int 21h
mov dl, bl
int 21h
ret

; Beklenen cikti:
; 12:00
