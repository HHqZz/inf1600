.global func_s

func_s:
	/* Votre programme assembleur ici... */
	flds b 			#ajoute au dessus de la pile lentier a ladresse b
	flds d 			#ajoute au dessus de la pile lentier a ladresse d
	fmulp			#effectue la multiplication entre b et d
	flds c
	fsubrp 			#soustrait c de b*d
	fstps a 		# b = b*d -c
	flds f
	flds g			# g est a st0 et f est a st1
	fsubrp 			# f-g
	flds a			# on recupere ladresse b et on la met aud essus de la pile
	fdivp			# b*d-c est div par f-g
	flds e			# on met e au dessus de la pile
	faddp			# on ajoute e, on a la partie droite du produit
	fstps a			# on met la partie droite dans b
	flds g          # on met g au dessus de la pile
	flds e          # on met e au dessus de la pile
	fsubrp			#g-e
	flds f			# on appelle f au dessus de la pile
	fdivrp			# on a la partie a gauche de ce produit
	flds a			# st0 partie a droite ,  st1 partie a gauche
	fmulp			# on multiplie les deux parties
	fstps a
	ret
