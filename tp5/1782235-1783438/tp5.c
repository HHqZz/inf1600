
#include <stdio.h>

unsigned int Decryption_fct(unsigned int le)
{
	unsigned int be;

	/*
	 * Remplacez le code suivant par de l'assembleur en ligne
	 * en utilisant le moins d'instructions possible
	 
	 be = (le & 0xff000000) | (le&0xff) << 16  | (le & 0xff00) | (le & 0xff0000) >> 16;*/
     
	 
	asm volatile
	( 
            		"movl %1, %0;"  // On prend la valeur de 'le' et on la met dans 'be'
			"rol $8, %0;"	// Les huit premiers bits sont places dans le meme ordre a la fin
		  	"bswap %0;"	// On inverse les octets
            
		 	: "=r"(be)	// Sorties 
		 	: "r"(le)    	// Entrées
		 	: 		// Registres modifiés (Pas de registre modifié)
    	);

	return be;
}

int main()
{
	unsigned int data = 0xeeaabbff;

	printf("Représentation crypte en little-endian:   %08x\n"
	       "Représentation decrypte en big-endian:    %08x\n",
	       data,
	       Decryption_fct(data));

	return 0;
}

