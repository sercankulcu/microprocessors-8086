; .EXE program şablonu: .model small, ayrı yığın/veri/kod kesimleri, DS'nin @data ile
; ayarlanması ve INT 21h AH = 4Ch ile çıkış.
; Kaynak: Bölüm 5.2 sunumu, "COM ve EXE Şablonları" ve "EXE Şablonu: Kod İzleme".
.model small
.stack 100h
.data
msg db 'Merhaba$'
.code
basla:
mov ax, @data
mov ds, ax      ; DS'yi ayarla!
mov dx, offset msg
mov ah, 09h
int 21h
mov ax, 4C00h
int 21h
end basla

; Beklenen cikti:
; Merhaba
