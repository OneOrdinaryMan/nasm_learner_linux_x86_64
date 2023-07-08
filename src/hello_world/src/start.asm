section .comment
    ;Nasm Learner Linux x86_64
    ;Copyright (C) 2023  Srivathsan Sudarsanan

    ;This program is free software: you can redistribute it and/or modify
    ;it under the terms of the GNU General Public License as published by
    ;the Free Software Foundation, either version 3 of the License, or
    ;(at your option) any later version.

    ;This program is distributed in the hope that it will be useful,
    ;but WITHOUT ANY WARRANTY; without even the implied warranty of
    ;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    ;GNU General Public License for more details.

    ;You should have received a copy of the GNU General Public License
    ;along with this program.  If not, see <https://www.gnu.org/licenses/>.
section .data
    hello db "Hello, World!",10,0
    hello_size equ $-hello
section .text
    global _start
_start:
    ; print the hello var
    mov rax, 1
    mov rdi, 1
    mov rsi, hello
    mov rdx, hello_size
    syscall
    ; exit the prog
    mov rax, 60
    mov rdi, 0
    syscall
