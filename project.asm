	section .data
		red db "Red", 10
		red_len equ $ - red
		
		green db "Green", 10
		green_len equ $ - green
		
		yellow db "Yellow", 10
		yellow_len equ $ - yellow
		
		section .text
		global _start
		
		_start:
		mov rbx, 0 ; start with red
		
		loop_start:
		
		cmp rbx, 0
		je print_red
		
		cmp rbx, 1
		je print_green
		
		cmp rbx, 2
		je print_yellow
		
		print_red:
		mov rax, 1 ; sys_write
		mov rdi, 1 ; stdout
		mov rsi, red
		mov rdx, red_len
		syscall
		jmp next
		
		print_green:
		mov rax, 1
		mov rdi, 1
		mov rsi, green
		mov rdx, green_len
		syscall
		jmp next
		
		print_yellow:
		mov rax, 1
		mov rdi, 1
		mov rsi, yellow
		mov rdx, yellow_len
		syscall
		
		next:
		inc rbx ; move to next light
		
		cmp rbx, 3
		jne loop_start
		
		mov rbx, 0 ; reset back to red
		jmp loop_start