.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        /* Write your solution here */
	

	movl 8(%ebp), %ecx	#On recupere ladresse de lobjet CCircle
	movl (%ecx), %ecx 	# On rentre dans lobjet CCircle
	lea 4(%ecx), %ecx	#On recupere mradius 
	fld %ecx		#float au dessy pile

	fldpi			#Pi -> pile	st[0]=mradius et st[1]=pi

	fmulp			#mradius * pi

	fld factor		#2.0 -> pile donc st[0]=2.0 et st[1]=pi*mradius
	
	fmulp			#2.0*pi*mradius
	
	movl st[0], %eax 		#return valeur
	jmp quit
	vzdfnhjgfrawe76ygadsg
	






quit:        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
