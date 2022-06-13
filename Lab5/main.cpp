#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <string.h>
#include "CL/opencl.h"
#include "AOCL_Utils.h"

using namespace aocl_utils;

// OpenCL runtime configuration
cl_platform_id platform = NULL;
unsigned num_devices = 0;
cl_device_id *device;
cl_context context = NULL;
cl_command_queue queue;
cl_program program = NULL;
cl_kernel ClKernel;
cl_mem kernel_in;
cl_mem vector_in;
cl_mem result_out;

// Problem data.
int vector_len;
int kernel_len = 3;
float kernel[3] = {1.0/3.0,1.0/2.0,1.0/6.0};
FILE *fptr;
float *vector;
float *result;

// Launch the problem for each device.
cl_event kernel_event;
cl_event finish_event;
cl_event writeEventVec;
cl_event writeEventKernel;

// Function prototypes
bool init_opencl();
void init_problem();
void run();
void cleanup();
//float *readBinFile(FILE *fptr, int *length)

// Entry point.
int main(int argc, char *argv[]) {

  //Open file so data can be read in
  if((fptr = fopen(argv[1],"rb"))== NULL)
    {
      printf("The file %s entered in the command line couldn't be opened\nExiting...\n",argv[1]);
      exit(1);
    }
  	// Initialize the problem data.
  	init_problem();
    fclose(fptr);

  	// Initialize OpenCL.
  	if(!init_opencl()) {
    		return -1;
  	}

  	// Run the kernel.
  	run();

  	// Free the resources allocated
  	cleanup();

  	return 0;
}

/////// HELPER FUNCTIONS ///////

// Initializes the OpenCL objects.
bool init_opencl() {
  	cl_int status;


  	if(!setCwdToExeDir()) {
    		return false;
  	}

  	// Get the OpenCL platform.
  	platform = findPlatform("Altera");
  	if(platform == NULL) {
    		printf("ERROR: Unable to find Altera OpenCL platform.\n");
    		return false;
  	}

  	// Query the available OpenCL device.
  	device = getDevices(platform, CL_DEVICE_TYPE_ALL, &num_devices);

  	// Create the context.
  	context = clCreateContext(NULL, num_devices, device, NULL, NULL, &status);
  	checkError(status, "Failed to create context");

  	// Create the program for all device. Use the first device as the
  	// representative device (assuming all device are of the same type).
  	std::string binary_file = getBoardBinaryFile("convolution_cl", *device);
  	program = createProgramFromBinary(context, binary_file.c_str(), device, num_devices);

  	// Build the program that was just created. (does nothing in our case)
  	status = clBuildProgram(program, 0, NULL, "", NULL, NULL);
  	checkError(status, "Failed to build program");

  	// Command queue.
  	queue = clCreateCommandQueue(context, *device, CL_QUEUE_PROFILING_ENABLE, &status);
  	checkError(status, "Failed to create command queue");

  	// Kernel.
  	const char *kernel_name = "convolution_kernel";
  	ClKernel = clCreateKernel(program, kernel_name, &status);
  	checkError(status, "Failed to create kernel");

	//Input buffers (create and queue).
	kernel_in = clCreateBuffer(context, CL_MEM_READ_WRITE,
			kernel_len * sizeof(float), NULL, &status);
	checkError(status, "Failed to create buffer for input");

  status = clEnqueueWriteBuffer(queue, kernel_in, CL_TRUE,
      0, kernel_len * sizeof(float), kernel, 0, NULL, &writeEventKernel);
  checkError(status, "Failed to write input buffer");

  vector_in = clCreateBuffer(context, CL_MEM_READ_WRITE,
      vector_len * sizeof(float), NULL, &status);
  checkError(status, "Failed to create buffer for input");

  status = clEnqueueWriteBuffer(queue, vector_in, CL_TRUE,
      0, vector_len * sizeof(float), vector, 0, NULL, &writeEventVec);
  checkError(status, "Failed to write input buffer");

  // Output buffer.
  result_out = clCreateBuffer(context, CL_MEM_READ_WRITE,
        		(vector_len+kernel_len-1)*sizeof(float), NULL, &status);
  checkError(status, "Failed to create buffer for output");

  return true;
}

//Initialize data for the problem.
void init_problem() {

  	if(fread(&vector_len,sizeof(int),1,fptr) != 1)
  		exit(1);

  	vector = (float *)malloc(sizeof(float)*(vector_len+1));

  	if(fread(vector,sizeof(float),vector_len,fptr) != vector_len)
  		exit(1);

    result = (float *)calloc((vector_len+kernel_len-1),sizeof(float));
}

void run() {

  //Define local variables
  int i;
  cl_int status;
  double total_time;


	// Set kernel arguments.
  unsigned argi = 0;
 	status = clSetKernelArg(ClKernel, argi++, sizeof(cl_mem), &kernel_in);
  checkError(status, "Failed to set argument %d", argi - 1);
  status = clSetKernelArg(ClKernel, argi++, sizeof(cl_mem), &vector_in);
	checkError(status, "Failed to set argument %d", argi - 1);
  status = clSetKernelArg(ClKernel, argi++, sizeof(int), &kernel_len);
  checkError(status, "Failed to set argument %d", argi - 1);
  status = clSetKernelArg(ClKernel, argi++, sizeof(int), &vector_len);
	checkError(status, "Failed to set argument %d", argi - 1);
  status = clSetKernelArg(ClKernel, argi++, sizeof(cl_mem), &result_out);
  checkError(status, "Failed to set argument %d", argi - 1);

  const double start_time = getCurrentTimestamp();
  //Launch the kernel
	const size_t global_work_size = kernel_len+vector_len-1;
	status = clEnqueueNDRangeKernel(queue, ClKernel, 1, NULL,
					&global_work_size, NULL, 1, &writeEventVec, &kernel_event);
	checkError(status, "Failed to launch kernel");

  status = clEnqueueReadBuffer(queue, result_out, CL_TRUE,
      0, (vector_len+kernel_len-1) * sizeof(float), result, 0, NULL, &kernel_event);
  checkError(status, "Failed to read output buffer");

	const double end_time = getCurrentTimestamp();
  total_time = end_time - start_time;


  printf("\nConvolution Output:\n");
  printf("\n--------------------------------\n");
  int ii;
  printf("Kernel:\n");
  for(ii = 0; ii < (kernel_len); ii++)
    printf("%f  ",kernel[ii]);
  printf("\n--------------------------------\n");
  printf("Input Vector:\n");
  for(ii = 0; ii < (vector_len); ii++)
    printf("%f  ",vector[ii]);
  printf("\n--------------------------------\n");
  printf("Convolution Vector:\n");
  for(ii = 0; ii < (kernel_len+vector_len-1); ii++)
    printf("%f  ",result[ii]);
  printf("\n--------------------------------\n");
  printf("Convolution Time: %f\n\n",total_time);

	// Get kernel times using the OpenCL event profiling API.
  cl_ulong time_ns = getStartEndTime(kernel_event);
	//printf("Kernel time (device 0): %0.3f ms\n", double(time_ns) * 1e-6);i

	// Release all events.
  clReleaseEvent(kernel_event);
	clReleaseEvent(finish_event);

}

// Free the resources allocated during initialization
void cleanup() {
  	if(ClKernel) {
    		clReleaseKernel(ClKernel);
  	}
  	if(queue) {
      		clReleaseCommandQueue(queue);
  	}

  	if(result_out) {
      		clReleaseMemObject(result_out);
  	}


  	if(program) {
    		clReleaseProgram(program);
  	}
  	if(context) {
    		clReleaseContext(context);
  	}
}
