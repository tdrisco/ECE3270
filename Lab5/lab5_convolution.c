// Tim Driscoll 4/24/20 Lab 5
//C code implementation of convolution

//Include the neccesary libraries
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

float *vector;
float *convolutionPtr;

void convolution(float *kernel, int kernel_len, int vector_len)
  {
    int convolution_len;
    int count, i, j;

    convolution_len = kernel_len+vector_len-1;

    for (i = 0; i < convolution_len; i++)
      {
        count = i;
        for(j = 0; j <= kernel_len; j++)
          {
            if(count >= 0 && count < vector_len){
              convolutionPtr[i] += vector[i-j]*kernel[j];
}

            count--;
          }
	
      }

  }

void readBinFile(FILE *fptr, int *length)
   {

	if(fread(length,sizeof(int),1,fptr) != 1)
		exit(1);
	
	vector = (float *)malloc(sizeof(float)*(*length));
	
	if(fread(vector,sizeof(float),*length,fptr) != *length)
		exit(1);

   }


int main(int argc, char *argv[])
  {
    float kernel[3] = {1.0/3.0,1.0/2.0,1.0/6.0};
    int kernel_len = 3;


    int *vector_len;
    vector_len = (int*)malloc(sizeof(int));



    FILE *fptr;
    if((fptr = fopen(argv[1],"rb"))== NULL)
      {
	printf("The file entered in the command line couldn't be opened\nExiting...\n");
	exit(1);
      }

    readBinFile(fptr, vector_len);
    fclose(fptr);
	

    clock_t begin = clock();
    convolutionPtr = (float*)calloc(((*vector_len)+kernel_len-1),sizeof(float));
    convolution(kernel,kernel_len,*vector_len);
    clock_t end = clock();
    double conv_time = (double)(end-begin) / CLOCKS_PER_SEC;

    printf("\nConvolution Output:\n");
    printf("\n--------------------------------\n");
    int i;
    printf("Kernel:\n");
    for(i = 0; i < (kernel_len); i++)
      printf("%f  ",kernel[i]);
    printf("\n--------------------------------\n");
    printf("Input Vector:\n");
    for(i = 0; i < (*vector_len); i++)
      printf("%f  ",vector[i]);
    printf("\n--------------------------------\n");
    printf("Convolution Vector:\n");
    for(i = 0; i < (kernel_len+(*vector_len)-1); i++)
      printf("%f  ",convolutionPtr[i]);
    printf("\n--------------------------------\n");
    printf("Convolution Time: %f\n\n",conv_time);

    return 0;
}
