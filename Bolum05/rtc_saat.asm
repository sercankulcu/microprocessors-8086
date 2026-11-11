; INT 1Ah AH = 02h ile RTC saatini (paketli BCD) okuyup SS:DD:ss yazdırmak; BCD baytın üst
; hanesi SHR ile, alt hanesi AND 0Fh ile alınır. ikinokta, bcdyaz'a kendiliğinden geçer.
; Deneme ortamının RTC saati 12:00:00 (sunumdaki örnek 14:35:07).
; Kaynak: Bölüm 5.2 sunumu, "İz: RTC Saatini Yazdır".
org 100h
mov ah, 02h
int 1Ah          ; CH=saat CL=dk DH=sn
jc  son          ; CF=1: saat okunamadı
mov bl, cl       ; dakikayı sakla
mov cl, 4        ; SHR kaydırma sayısı
mov bh, ch
call bcdyaz      ; "14"
mov bh, bl
call ikinokta    ; ":35"
mov bh, dh
call ikinokta    ; ":07"
son: ret
ikinokta: mov dl, ':'
mov ah, 02h
int 21h
bcdyaz:          ; BH = paketli BCD
mov dl, bh
shr dl, cl       ; üst hane
add dl, 30h      ; ASCII rakam
mov ah, 02h
int 21h
mov dl, bh
and dl, 0Fh      ; alt hane
add dl, 30h
int 21h
ret

; Beklenen cikti:
; 12:00:00
