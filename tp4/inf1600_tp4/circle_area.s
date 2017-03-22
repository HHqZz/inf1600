.globl _ZNK7CCircle7AreaAsmEv

_ZNK7CCircle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
	movl 8(%ebp), %ebx	#on a l adresse de l objet CCircle
	fld 4(%ebx)		#radius sur la pile des float st[0]

	fldpi			#st[0]=pi st[1]=radius
	
	fmulp			#pi*radius
	
	fld 4(%ebx)		#radius sur la pile des float st[0]
	
	fmulp			#pi*radius*radius
	
	
	
	
	
	
	
	
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
