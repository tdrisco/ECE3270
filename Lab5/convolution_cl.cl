
__kernel void convolution_kernel(__constant float* kernelvec, __constant float* vector,
			       int kernel_len, int vector_len, __global float* result)
  {
	int i = get_global_id(0);
	int count, j;

	count = i;
	for(j = 0; j <= kernel_len; j++)
		{
			if(count >= 0 && count < vector_len)
				result[i] += vector[i-j]*kernelvec[j];

			count--;
		}
  }
