#include <stdio.h>
#include <stdlib.h>

int main()
{
	int num_elements;
	/* Allocate memory */
	int *ptr = malloc(sizeof(int) * num_elements);

	if (ptr == NULL)
	/* Handle memory allocation error */
	{
		fprintf(stderr,"Memory allocation failed!");
		exit(1);
	}

	/* use the allocated memory */
	// ...

	/* Don't forget to free the allocated memory */
	free(ptr);

	return 0;
}
