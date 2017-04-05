.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        ##    movl 16(%ebp), %edx	#mo
	##    movl 12(%ebp), %ecx	#od
	##    movl 8(%ebp), %ebx	#id1
	push -4(%ebp)
	push -8(%ebp)
	movl $0, -4(%ebp)	#r
	

for1:
	mov 16(%ebp), %ebx	#mo
	mov -4(%ebp), %esi	#r
	
	
	movl $0, -8(%ebp)	#c

	cmp %esi, %ebx		#on rentre dans le 2eme for si matorder-r > 0
	ja for2
	jmp quit		#si la condition pas rempli on quitte le mini prog

for2:
	mov 16(%ebp), %ebx	#mo
	mov -8(%ebp), %esi	#c
	

	cmp %esi, %ebx		#on rentre dans le for2 si matorder-c > 0
	ja calcul

	addl $1, -4(%ebp)	#++r
	jmp for1

calcul:
	mov 16(%ebp), %ecx	#mo
	mov 8(%ebp), %edx	#id1
	mov -4(%ebp), %esi	#r
	mov -8(%ebp), %edi	#c
	
	imul %ecx, %edi		#c*mo
	add %esi, %edi		#r+c*mo
	
	mov (%edx, %edi, 4), %edx	#on recup les contenu de l'adresses de id1, on 
					#multiplie par 4, car int=4octets

	mov 16(%ebp), %ebx	#mo
	mov 12(%ebp), %ecx	#od
	mov -4(%ebp), %esi	#r
	mov -8(%ebp), %edi	#c

	imul %ebx, %esi		#r*matorder
	add %edi, %esi		#c+r*matorder

	mov %edx, (%ecx, %esi, 4)	#on deplace contenu id1, dans od

	addl $1, -8(%ebp)	#++c

	jmp for2

quit:
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
