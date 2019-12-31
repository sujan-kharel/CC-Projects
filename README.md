# MIPS-Encryption-and-Decryption
Encryption/Decryption Using MIPS

When running the program, you will be asked to enter either ‘e’ for encryption or ‘d’ for decryption. The goal is to encrypt or decrypt the text user has entered. The program does 3 tasks:
1. Asks users to enter a text to enc or dec
2. Asks users to enter an add value
3. Asks users to enter value to toggle (must range 0 - 7)

Outputs either encrypted or decrypted text depending on user’s call
 Task Description
Input a string of characters from the keyboard, encrypt or decrypt
it and print it back to the screen. Encryption and decryption are to use 2 keys. Details as
Follows:


The Encryption process should have two operations:
1. Addition of a number (the addition key) to the character's ASCII value. 
2. Flipping a single bit in the result of part 1 - the second key species which bit to toggle.


The decryption process will involve the exact inverse, that is
1. Flipping a bit specified by the second key
2. Subtraction of the addition key.

Specifications:
You are required to use the input/output and string storage features (syscall, .asciiz) to print
out prompts asking the user for the necessary data and then read in the data. The user
should input:
1. A single letter, either `e' or `d' depending on whether you wish to either encrypt or
decrypt the text you enter. You may assume that these are always entered in lower
case, though you can try to make it case insensitive as an option.
2. The addition key, a single integer between 0 and 9
3. The toggle key, a single integer between 0 and 7 (since ASCII codes are 8-bit values).
The bits are numbered using the standard convention. Bit 0 is the LSB and bit 7 is the
MSB.
5. The text to encrypt or decrypt as a stream of characters. You should stop taking in
character input when you hit the Enter key.


Contains .asm file
