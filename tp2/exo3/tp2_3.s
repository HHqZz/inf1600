.data
	/* Votre programme assembleur ici... */
	i:
			.int a,b,c,d,e

.global func_s

func_s:	
	/* Votre programme assembleur ici... */
	mov $0, %esi		# i correspond a esi
	mov $10, %edi		# on souhaite faire 11 iterations de 0 a 10
	jmp for

fin_prog:
	ret

for:
	cmp %esi, %edi		# on compare 10 et i
	jna fin_prog 		# si le flags est plus petit on stop 
	add $1, %esi		# on incremente i
	mov e, %eax		# a donne sa valeur a eax
	mov b, %ebx		# b donne sa valeur a ebx
	mov c, %ecx		# c donne sa valeur a ecx
	mov d, %edx		# d donne sa valeur a edx
	
	add %edx, %eax		# le registre eax prend eax + edx ( eax = d+e)
	sub %ebx, %eax		# le registre eax prend eax - ebx (eax = (d + e) - b)
	mov %eax, a		## on met eax dans a (a =  d + e - b)
	
	sub $1000, %ebx
	add $500, %ecx		
	cmp %ebx, %ecx		#  (ecx = c+500 et ebx = b-1000 )
	ja if			# On rentre dans if si ecx - ebx > 0 
	jmp else		# si on rentre pas dans if, alors on va dans else
	

if:
	mov c, %ecx		# on met la vraie valeur de c dans le registre ecx
	mov b, %ebx		# on met la vraie valeur de b dans le registe ebx

	sub $500, %ecx
	mov %ecx, c		## On modifie reelement la valeur de c
	cmp %ecx, %ebx 		 
	ja if_deux		# on rentre dans if deux si b - c > 0
	jmp for			# on a fini une iteration de for
	

if_deux: 
	
	sub $500, %ebx		
	mov %ebx, b		## b prend reellement  b-500
	jmp for			# on a fini une iteration de for

else: 
	mov b, %ebx		# init: on reinitialise ebx par b
	mov e, %eax		# init: on reinitialise eax par e

	sub %eax, %ebx		# le registre de b prend la valeur b - e
	mov %ebx, b		## b prend reellement  b-e
	add $500, %edx		# regsitre edx sincremente de 500
	mov %edx, d		## d prend reellement  d+500
	jmp for			# on a fini une iteration de for




