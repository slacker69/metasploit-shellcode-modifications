# metasploit-shellcode-modifications
These are a few shellcodes that I've developed, slightly modified versions
of existing shellcodes that provide new or additional functionality.

meterpreter_shell_reverse_tcp_dns_selfdel.asm:	This is basiclly the 
	meterpreter/windows/reverse_tcp_dns shellcode, but juggles the code
	around with CreateProcess and VirtualProtectEx, to move the inner
	part of the shellcode into memory, so the remaining exe file can 
	be deleted.

meterpreter_keylogger_file.asm:  This is a msf-like PIC shellcode that
    will log keystrokes to the file "keylog.bin" in the user's %TEMP%
    directory.
