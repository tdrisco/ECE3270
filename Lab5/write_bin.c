//Include the neccesary libraries
#include <stdio.h>
#include <stdlib.h>
struct vec
{
	int length;
	float n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12;
};
int main(int argc, char *argv[])
  {

	FILE *fptr;
	struct vec vec1;
	vec1.length = 12;
	vec1.n1 = 1.0;
	vec1.n2 = 2.0;
	vec1.n3 = 3.0;
	vec1.n4 = 4.0;
	vec1.n5 = 5.0;
	vec1.n6 = 6.0;
	vec1.n7 = 7.0;
	vec1.n8 = 8.0;
	vec1.n9 = 9.0;
	vec1.n10 = 10.0;
	vec1.n11 = 11.0;
	vec1.n12 = 12.0;


	if((fptr = fopen("bintest2.bin","wb"))== NULL)
		exit(1);

	//int length;
	//int *lengthptr= &length;
	//char test;

	if(fwrite(&vec1,sizeof(struct vec),1,fptr) != 1)
		exit(1);
	
	printf("The Binary Test File has been succesfully written and saved to bintest2.bin\n");



return 0;
}
