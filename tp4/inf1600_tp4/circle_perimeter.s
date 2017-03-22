.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        /* Write your solution here */
	
	movl 8(%ebp), %ebx	#on a l adresse de l objet CCircle
	fld 4(%ebx)		#radius sur la pile des float st[0]
	
	fldpi			#st[0]=pi st[1]=radius
	
	fmulp			#pi*radius

	fld factor		#st[0]=2.0 st[1]=pi*radius

	fmulp			#2.0*pi*radius
	
	    
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
