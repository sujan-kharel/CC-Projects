
.data
	prompt_type: .asciiz "Enter 'e' for encrypt or 'd' for decrypt: "
	prompt_string: .asciiz "\nEnter text: "
	prompt_addKey: .asciiz "\nEnter add key: "
	prompt_toggleValue: .asciiz "Enter bit to toggle: "
	encrypted_output: .asciiz "\nEncrypted output is: "
	decrypted_output: .asciiz "\nDecrypted output is: "

buffer: .byte 0x0a:50  #Fill up memory with 50 values: 0a0a0a0a0a0a0a...
buffer1: .space 50
 

.text

main: 
	#prints message to encrypt or decrypt
	li $v0, 4
    	la $a0, prompt_type
    	syscall

    # read encrypt or decrypt choice
    	li $v0, 12   	
    	syscall
    	add $t6, $v0, $0	
    	
	#prints message for user to enter a string
	li $v0, 4
	la $a0, prompt_string
	syscall
	
	#lets user enter a string
   	li $v0, 8
   	la $a0, buffer1
   	lb $t0, 0($a0)
    	li $a1, 48
    	syscall
    	la $s2, buffer1
	
	#prints message user to enter add key
	li $v0, 4
	la $a0, prompt_addKey
	syscall
	
	
	#lets user to enter add key
	li $v0, 5
	syscall
	add $s0, $v0, $0
	
	#pints message user to enter toggle bit
	li $v0, 4
	la $a0, prompt_toggleValue
	syscall
	
	#lets user enter toggle bit
	li $v0, 5
	syscall
	add $s1, $v0, $0
	
	
	la $t0, ($s0)   # load addition key
  	la $t1, ($s1)   # load bit to toggle
    	la $t2, ($s2) # load user inputed string
	
	
	beq $t6, 101, ENCRYPT # if user entered 'e' goes to encrypt  (e = 101)
	beq $t6, 100, DECRYPT # if user entered 'd' goes to decrypt (d = 100)
	
	
	
	
ENCRYPT: 

loop: 

	lb   $t3, 0($t2)
	beq  $t3, 10, ENCRYPTED # if end of character, jumps to encrypted
	add  $t3, $t3, $t0
    	addi $t4, $0, 1       
    	sllv   $t4, $t4, $t1    
   	xor   $t3, $t3, $t4    # toggle the bit
   	
 	sb   $t3, 0($t2)      # put the encrypted character back in the array
    	addi $t2, $t2, 1
    	j loop #loops thrugh array of characters entered
    	
 ENCRYPTED:   	
   	li $v0, 4               # Print out encrypted text
     	la $a0, encrypted_output
     	syscall
     	la $a0, ($s2)
     	syscall
     	
     	j EXIT #program finish running
	




DECRYPT: 
loop2:
	lb $t3, 0($t2) # loads bytes of charcter in t3
	beq $t3, 10, DECRYPTED
	addi $t4, $0, 1
	sllv $t4, $t4, $t1
	xor $t3, $t3, $t4
	sub $t3, $t3, $t0
	sb $t3, 0($t2)
	addi $t2, $t2, 1
	
	j loop2


DECRYPTED: 
	li $v0, 4
	la $a0, decrypted_output
	syscall
	la $a0, ($s2)
     	syscall
	
	j EXIT


	
	
	EXIT:

	
	
		 
		
	
	
	
	
	
	
	
	
	
