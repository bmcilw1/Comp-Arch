        .data
str:
        .asciiz "Per"
        .asciiz "Per aspera, ad astra!"
msg:
        .asciiz "The length of string \n   \"%/a1/s\"\nis %/v1/d.\n"
        .word 123, 456
        .double 12.34

        .text
        .globl __start
__start:
        la $a0, str             # Load address of string.
        jal strlen              # Call strlen procedure.
        nop
        la $a1, str             # Load address of string to $a1
        addi $v1, $v0, 0        # Move length of string to $v1
        addi $v0, $0, 11        # System call code for message.
        la $a0, msg             # Address of message.
        syscall
        addi $v0, $0, 10        # System call code for exit.
        syscall

strlen:
        ## Register Usage
        #
        # $a0: Address of first character of string.
        # $v0: Return value, the length of the string.
        #

        add $v0, $0, $0
        lb $t0, 0($a0)
                
        jr $ra
        nop
