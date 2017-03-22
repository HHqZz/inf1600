.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
	mov 8(%ebp), %ebx
	fld 4(%ebx)		#msides[0] sur la pile

	fld 8(%ebx)		#msides[1] sr pile avec st[0]=ms{1} et st[1]=ms{0}
	
	faddp			#mSides[0] + mSides[1]

	fld 12(%ebx)		#msides[2] sr pile ac st[0]=ms{2} et st[1]=somme
	
	faddp			#mSides[0] + mSides[1] + mSides[2]
	
	
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
