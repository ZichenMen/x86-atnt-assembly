.section .bss
input_space: .skip 1            


.section .data
menu_message: .asciz "Menu Options:\nA.Option A\nB.Option B\nQ. Exit\nChoose:  "
option_a_message: .asciz "You selected Option A\n"
option_b_message: .asciz "You selected Option B\n"
invalid_message: .asciz "Invalid option. Please try again.\n"
prompt: .asciz "> "


.section .text
.global _start


.global main
main:
    movl $4, %eax              
    movl $1, %ebx              
    movl $menu_message, %ecx   
    movl $52, %edx             
    int $0x80                  


    movl $3, %eax              
    movl $0, %ebx              
    movl $input_space, %ecx    
    movl $1, %edx              
    int $0x80                  


    movl $4, %eax              
    movl $1, %ebx              
    movl $prompt, %ecx         
    movl $2, %edx              
    int $0x80                  


    movzbl input_space, %eax   
    cmpb $'A', %al             
    je option_a
    cmpb $'B', %al             
    je option_b
    cmpb $'Q', %al             
    je exit_program
    jmp invalid_option         


option_a:
    movl $4, %eax              
    movl $1, %ebx              
    movl $option_a_message, %ecx   
    movl $20, %edx             
    int $0x80                  
    jmp _start                 


option_b:
    movl $4, %eax              
    movl $1, %ebx              
    movl $option_b_message, %ecx   
    movl $20, %edx             
    int $0x80                  
    jmp _start                 


invalid_option:
    movl $4, %eax              
    movl $1, %ebx              
    movl $invalid_message, %ecx   
    movl $34, %edx             
    int $0x80                  
    jmp _start                 


exit_program:
    movl $1, %eax              
    xorl %ebx, %ebx            
    int $0x80