# x86-at&t-assembly
The programs in this repository serve as exercises for understanding how to interact directly with the CPU and the operating system at the machine level. Each program is a standalone example showcasing different aspects of assembly language programming, such as input/output operations, control flow, and basic subroutine calls.

# Usage
To run these programs on a Linux system, you'll need to have an assembler like GNU Assembler(as) and compiler(gcc) for linking. 
1. Assemble the program into an object file:
```
as -o program.o program.asm
```
2. Link the object file to create an executable:
```
gcc -nostdlib -o program program.o
```
3. Execute the program:
```
./program
```

