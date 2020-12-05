global start

extern MessageBoxA                ; user32.dll
extern ExitWindowsEx              ; user32.dll

section .data
    text:  db 0xD3, 0xE4, 0xE0, 0xEB, 0xE8, 0xF2, 0xFC, 0x20, 0x77, 0x69, 0x6e, 0x64, 0x6f, 0x77, 0x73, 0x3f, 0     ; "Удалить windows?"
    title:  db 0x61, 0x70, 0x70, 0                                                                                  ; "App"

section .text
    exitWindows:                  ; ExitWindowsEx(uFlags, dwReason)
        push    0x00000008        ; EWX_POWEROFF
        push    0x00000007        ; SHTDN_REASON_MINOR_DISK
        call    [ExitWindowsEx]   ; Вызов функции "ExitWindowsEx"
        
    createMessageBox:             ; MessageBoxA(hWnd, lpText, lpCaption, uType)
        push  	0x00000001        ; Дескриптор (какие будут кнопки в окне)
        push    title             ; Заголовок окна
        push    text              ; Сообщение которое будет отображаться
        push    0x00000000        ; Содержание и поведение диалогового окна
        call    MessageBoxA       ; Вызов функции "MessageBoxA"
        
        cmp   	eax, 1            ; Если нажата кнопка "OK", перескочить на следущую строку
        je    	exitWindows       ; Вызов локальной функции "exitWindows"
                                  ; Если вместо кнопки "ОК" будет нажата другая, с окном ничего не произойдёт

    start:
        call createMessageBox     ; Вызов локальной функции "createMessageBox"
