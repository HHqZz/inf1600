.data
	r : .int 0
	c : .int 0

.global matrix_transpose_asm

matrix_transpose_asm:

        push %ebp      # Save old base pointer 
        mov %esp, %ebp # Set ebp to current esp 

	#Cette fonction permet de faire la transposée de la matrice en entrée


	push %esi				#On empile les registres utilisés
	push %edi
	push %ecx
	push %edx
	push %eax

	mov c, %edi
	mov r, %esi


  Test_pour_r: 
	
	mov 16(%ebp), %eax    #matorder -> eax
	cmp %esi, %eax        #eax - esi > 0 ?
	ja Test_pour_c	      #Tant que r < matorder : effectuer la boucle pour c
	jmp Fin	              #Sinon quand boucle finie : retourner à la fonction appelante
	


  Test_pour_c:								
	
	mov 16(%ebp), %eax		#matorder -> eax
	cmp %edi, %eax			#eax - edi > 0
	ja Boucle_transpose		#Tant que c < matorder : effectuer la boucle pour transposer
	
	inc %esi			#Sinon quand boucle finie : incrémenter r
	mov $0, %edi			#et on remet c à 0
	jmp Test_pour_r			#Puis on retourne à la boucle pour tester r
	 
	
	
  Boucle_transpose:
	
	#Rercher de l'élément dans la matrice en entrée
	mov 16(%ebp), %eax		#matorder -> eax
	imul %esi, %eax			#eax = r*matorder
	add %edi, %eax			#eax = matorder*r + c

	mov 8(%ebp), %ecx	        #On récupère la matrice en entrée Inmatdata
	mov (%ecx, %eax, 4), %ecx	#ecx = élément à l'indice eax de Inmatdata (en sautant 4octets)

	
	#Copie de cet l'élément dans la matrice en sortie en inversant la ligne et la colonne
	mov 16(%ebp), %eax		#matorder -> eax
	imul %edi, %eax			#eax = c*matorder  
	add %esi, %eax			#eax = matorder*c + r
	
	mov 12(%ebp), %edx		#On récupère la matrice en sortie Outmatdata
	mov %ecx, (%edx, %eax, 4)	#Élément à l'indice eax de Outmatdata (en sautant 4octets)=ecx	

	inc %edi                        # On incrémente c de 1
	jmp Test_pour_c




  Fin:
	pop %esi			#On désempile les registres utilisés
	pop %edi
	pop %ecx
	pop %edx
	pop %eax
	
	leave			  # restore ebp and esp
	ret		          # return to the caller

