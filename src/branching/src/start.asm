    global _start
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
    v_1 db 25 ;string constant stored at addr at v_1
section .text

_start:
    mov rax,1 ;move the value 1 to rax
    mov rbx,2
    mov rax,rbx ;move the value at rbx to rax
    mov rax, [v_1] ;move the value at v_1 addr to rax
    lea rax, v_1 ;load effective address of the memory location into the rax
    call .empty
    jmp .exit ;jmp to the section

.exit:
    mov rax, 60
    mov rdi, 0
    syscall
.empty:
    mov rax, 1
    ret
