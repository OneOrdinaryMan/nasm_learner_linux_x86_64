# Nasm Learner Linux x86_64
Every program compiles down to machine code. The human readable format of the machine code is assembly. Every architecture needs a different assembly.

## Architecture
The architecture used for this assembly is listed below,

1) Architecture: *x86_64*
2) Kernel: *Linux*
3) Assembler: *nasm*
4) Linker: *ld*

## Binary
*nasm* will not create the executable binary in linux. *nasm* will create *elf64* file in linux. It takes the file with *<file>.asm* extension.

*elf64* stands for 64-bit Executable and Linkable Format. *elf64* files contains the elf header and binary sections to run the program. elf header will contains the information
about the object files needed to be included Sections that are visible to the linker etc...

The *elf64* files need to be linked with the linker to produce the binary output. *ld* is used as linker here.

Commands to assemble and link the asm files are,

```sh
nasm -f elf64 -o <file>.o file.asm
ld -o <file> <file>.o
```
## CPU REGISTERS
Registers are the memory spaces in the cpu itself. Generally there are 16 registers in cpu. The registers name used will determine the usage of the register. Generally, it will use
last n-bits of the register accordingly
|No|64-bit|32-bit|16-bit|8-bit  |
|--|------|------|------|-------|
|00|rax   |eax   |ax    |ah,al  |
|01|rbx   |ebx   |bx    |bh,bl  |
|02|rcx   |ecx   |cx    |ch,cl  |
|03|rdx   |edx   |dx    |dh,dl  |
|05|rbp   |ebp   |bp    |bph,bpl|
|04|rsi   |esi   |si    |sih,sil|
|06|rdi   |edi   |di    |dih,dil|
|07|rsp   |esp   |sp    |sph,spl|
|08|r8    |r8d   |r8w   |r8b    |
|09|r9    |r9d   |r9w   |r9b    |
|10|r10   |r10d  |r10w  |r10b   |
|11|r11   |r11d  |r11w  |r11b   |
|12|r12   |r12d  |r12w  |r12b   |
|13|r13   |r13d  |r13w  |r13b   |
|14|r14   |r14d  |r14w  |r14b   |
|15|r15   |r15d  |r15w  |r15b   |
## Sections
The assembly code executes from the top to down. Sections are useful to seperate the code. 
+ *alloc* defines the section to be one which is loaded into memory when the program is run. noalloc defines it to be one which is not, such as an informational or comment section.
+ *exec* defines the section to be one which should have execute permission when the program is run. noexec defines it as one which should not.
+ *write* defines the section to be one which should be writable when the program is run. nowrite defines it as one which should not.
+ *progbits* defines the section to be one with explicit contents stored in the object file: an ordinary code or data section, for example.
+ *nobits* defines the section to be one with no explicit contents given, such as a BSS section. 
+ *note* indicates that this section contains ELF notes. The content of ELF notes are specified using normal assembly instructions; it is up to the programmer to ensure these are valid ELF notes. 
+ *preinit_array* indicates that this section contains function addresses to be called before any other initialization has happened. 
+ *init_array* indicates that this section contains function addresses to be called during initialization. 
+ *fini_array* indicates that this section contains function pointers to be called during termination. 
+ *align=*, used with a trailing number as in obj, gives the alignment requirements of the section. 
+ *byte*, word, dword, qword, tword, oword, yword, or zword with an optional *multiplier specify the fundamental data item size for a section which contains either fixed-sized data structures or strings; it also sets a default alignment. This is generally used with the strings and merge attributes (see below.) For example byte*4 defines a unit size of 4 bytes, with a default alignment of 1; dword also defines a unit size of 4 bytes, but with a default alignment of 4. The align= attribute, if specified, overrides this default alignment. 
+ *pointer* is equivalent to dword for elf32 or elfx32, and qword for elf64. 
+ *strings* indicate that this section contains exclusively null-terminated strings. By default these are assumed to be byte strings, but a size specifier can be used to override that. 
+ *merge* indicates that duplicate data elements in this section should be merged with data elements from other object files. Data elements can be either fixed-sized objects or null-terminatedstrings (with the strings attribute.) A size specifier is required unless strings is specified, in which case the size defaults to byte. 
+ *tls* defines the section to be one which contains thread local variables.

|section       |progbits     |alloc  |exec  |write  |align  |tls|
|-------       |--------     |-----  |----  |-----  |-----  |---|
|.text         |progbits     |alloc  |exec  |nowrite|16     |-  |
|.rodata       |progbits     |alloc  |noexec|nowrite|4      |-  |
|.lrodata      |progbits     |alloc  |noexec|nowrite|4      |-  |
|.data         |progbits     |alloc  |noexec|write  |4      |-  |
|.ldata        |progbits     |alloc  |noexec|write  |4      |-  |
|.bss          |nobits       |alloc  |noexec|write  |4      |-  |
|.lbss         |nobits       |alloc  |noexec|write  |4      |-  |
|.tdata        |progbits     |alloc  |noexec|write  |4      |tls|
|.tbss         |nobits       |alloc  |noexec|write  |4      |tls|
|.comment      |progbits     |noalloc|noexec|nowrite|1      |-  |
|.preinit_array|preinit_array|alloc  |noexec|nowrite|pointer|-  |
|.init_array   |init_array   |alloc  |noexec|nowrite|pointer|-  |
|.fini_array   |fini_array   |alloc  |noexec|nowrite|pointer|-  |
|.note         |note         |noalloc|noexec|nowrite|4      |-  |
|.other        |progbits     |alloc  |noexec|nowrite|1      |-  |
## General Instructions for x86_64 Linux
These are some of the instructions that can be used,

### ADC (ADD WITH CARRY)
```asm
adc <destination> <source>
```
Add the source operand to the destination operand with the carry flag and stores the result in destination operand. Operands are signed. Source must be a register
### ADCX (UNSIGNED ADD WITH CARRY)
```asm
adcx <destination> <source>
```
Add the source operand to the destination operand with the carry flag and stores the result in destination operand. Operands are unsigned. Source must be a register
### ADD (ADD WITHOUT CARRY)
```asm
add <destination> <source>
```
Add the source operand to the destination operand and stores the result in destination operand.If there is carry, the CF is set. Operands are unsigned. Source must be a register
# License
This project is licensed under *GNU GPL v3.0 OR LATER* license. Feel free to use the project.
