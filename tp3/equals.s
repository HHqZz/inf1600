.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        /* Write your solution here */	

	##    movl 16(%ebp), %edx	#mo
	##    movl 12(%ebp), %ecx	#id2
	##    movl 8(%ebp), %ebx	#id1
	
	movl $0, -4(%ebp)	#r

for1:
	movl 16(%ebp), %ebx	#mo
	movl -4(%ebp), %esi	#r
	

	movl $0, -8(%ebp)	#c

	cmp %esi, %ebx		#on rentre dans le 2eme for si matorder-r > 0
	ja for2
	jmp retour1		#sinon on return 1


for2:
	movl 16(%ebp), %ebx	#mo
	movl -8(%ebp), %esi	#c
	

	cmp %esi, %ebx		#on rentre dans le if si matorder-c > 0
	ja if

	add $1, -4(%ebp)	#++r
	jmp for1		#sinon on retourne dans le 1er for
	
if:

	movl 16(%ebp), %ebx	#mo
	movl 12(%ebp), %ecx	#id2
	movl 8(%ebp), %edx	#id1
	movl -4(%ebp), %esi	#r
	movl -8(%ebp), %edi	#c

	imul %ebx, %esi		#r*matorder
	add %edi, %esi		#c+r*matorder

	movl (%edx, %esi, 4), %edi	#on recup les contenu des adresses, on multiplie par 4, car int=4octets
	movl (%ecx, %esi, 4), %esi
	cmp %edi, %esi
	jne retour0		#si les deux contenu sont diff, on return 0
	add $1, -8(%ebp)	#++c
	jmp for2		#sinon on retourne dans 1eme for
	
retour1:
	movl $1, %eax	#ladresse de retour est tjs dans eax
	jmp quit

retour0:
	movl $0, %eax
	jmp quit

quit:        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
