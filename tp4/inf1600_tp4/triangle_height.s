.data
        factor: .float 2.0 /* use this to multiply by two */

.globl	_ZNK9CTriangle9HeightAsmEv

_ZNK9CTriangle9HeightAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */

	movl 8(%ebp), %eax	#on recup ladresse de lobjet
	push %eax		#
	movl (%eax), %eax	#on rentre dans la table
	call *16(%eax)		#on choisis la bonne fonction

	fld factor	#st[0]=2.0 ----------------- st[1]=AreaCpp()
	fmulp		#st[0]=2.0*AreaCpp() ------- st[1]=2.0*AreaCpp()
	fld 12(%eax)	#st[0]=ms{2} --------------- st[1]=2.0*AreaCpp()
	fdivrp


        leave          /* restore ebp and esp */
        ret            /* return to the caller */
