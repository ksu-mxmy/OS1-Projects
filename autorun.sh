#!/bin/bash

module load googletest/1.10.0-GCCcore-9.3.0 CMake/3.16.4-GCCcore-9.3.0 foss/2020a || echo "no modules loaded"

modules=("module")  # Array of modules to build and test

for module in "${modules[@]}"; do
  mkdir -p "${module}/build" && cd "${module}/build" # Create build directory if it doesn't exist
  cmake .. -DCMAKE_TOOLCHAIN_FILE=/usr/local/vcpkg/scripts/buildsystems/vcpkg.cmake || cmake .. || continue
  make || { cd ../..; continue; }
  ./"${module}_test" || { cd ../..; continue; }
  cd ../..
  echo "${module} built and tested successfully."
done

echo "Finished building and testing modules."


# /opt/software/software/googletest/1.10.0-GCCcore-9.3.0/lib/../lib64/
