.global matrix_diagonal_asm

matrix_diagonal_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here 

movl $0, -4(%ebp)	#r

for1:
	movl 16(%ebp), %ebx	#mo
	movl -4(%ebp), %esi	#r
	
	movl $0, -8(%ebp)	#c

	cmp %esi, %ebx		#on rentre dans le 2eme for si matorder-r > 0
	ja for2
	jmp quit		#sinon on return 1


for2:
	movl 16(%ebp), %ebx	#mo
	movl -8(%ebp), %esi	#c
	

	cmp %esi, %ebx		#on rentre dans le if si matorder-c > 0
	ja if

	add $1, -4(%ebp)	#++r
	jmp for1		#sinon on retourne dans le 1er for
if:
	movl -4(%ebp), $ebx
	movl -8(%ebp), $ecx
	cmp %ecx, %ebx
	jne condition
	jmp else

condition:
	movl 16(%ebp), %ebx	#mo
	movl 12(%ebp), %ecx	#od
	movl 8(%ebp), %ebx	#id
	movl -4(%ebp), %edi	#r
	movl -8(%ebp), %esi	#c

	imul %ebx, %edi		#r*mo
	add %esi, %edi		#c+r*mo

	movl (%ebx, %edi, 4), %ebx	#on prend les donne de indata
	movl (%ecx, %edi, 4), %edi	#on 

quit:	
*/       
 leave          			/* Restore ebp and esp */
        ret            			/* Return to the caller */

