.data
        factor: .float 2.0 /* use this to multiply by two */

#demandez pour ce .data

.globl _ZNK9CTriangle7AreaAsmEv

_ZNK9CTriangle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
	push %edi
	push %ebx
	
	call _ZNK9CTriangle12PerimeterAsmEv

	

	fld factor		#st[0]=2.0 ----------------- st[1]=PermietreCpp()
	fdivrp			#st[0]=PermietreCpp()/2.0 -- st[1]=idem
	fstp (%edi)		# ECX contient p ;;; st[0]=p
	mov 8(%ebp), %ebx	#on recup ladresse de ms{}

	
	fld 4(%ebx)		#st[0]=ms{0} --------- st[1]=p
	fld (%edi)		#st[0]=p ------------- st[1]=ms{0}
	fsubp			#st[0]=p-ms{0} ------- st[1]=p-ms{0}
	fld (%edi)		#st[0]=p ------------- st[1]=p-ms{0}
	fmulp			#st[0]=p*(p-ms{0}) --- st[1]=p*(p-ms{0})

	fstp (%eax)		# EDX contient p*(p-ms{0})


	fld 8(%ebx)	#st[0]=ms{1} --------------------------- st[1]=p*(p-ms{0})
	fld (%edi)	#st[0]=p ------------------------------- st[1]=ms{1}
	fsubp		#st[0]=p-ms{1} ------------------------- st[1]=p-ms{1}
	fld (%eax)	#st[0]= p*(p-ms{0}) -------------------- st[1]=p-ms{1}
	fmulp		#st[0]= p*(p-ms{0})*(p-ms{1})----------- st[1]=idem

	fstp (%eax)	# EDX contient p*(p-ms{0})*(p-ms{1})

	
	fld 12(%ebx)	#st[0]=ms{2} --------------------------- st[1]=...
	fld (%edi)	#st[0]=p ------------------------------- st[1]=ms{2}
	fsubp		#st[0]=p-ms{2} ------------------------- st[1]=p-ms{2}
	fld (%eax)	#st[0]=p*(p-ms{0})*(p-ms{1}) ----------- st[1]=idem
	fmulp		#st[0]=p*(p-ms{0})*(p-ms{1})*(p-ms{2})-- st[1]=idem
	
	fsqrt		#st[0]=sqrt(p*(p-ms{0})*(p-ms{1})*(p-ms{2}))
	
	#pop %ebx
	#pop %edi
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
