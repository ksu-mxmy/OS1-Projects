#include <cstdlib>
#include <iostream>
#include <sys/wait.h>
extern "C" {
	#include "../include/module.h"
}

#include <gtest/gtest.h>

int main()
{
  int exitCode = system("../src/module");
  int status = WEXITSTATUS(exitCode);

  if (status == 0)
  {
    std::cout << "Exit code is 0. Test passed." << std::endl;
  }
  else
  {
    std::cout << "Exit code is not 0. Test failed." << std::endl;
  }

  return 0;
}
