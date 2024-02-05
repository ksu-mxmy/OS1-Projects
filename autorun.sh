#!/bin/bash
# ./autorun.sh "suites|PASSED" "sstring" "arrays" "bits" "system_programming"

# grepmode=${1:-"."} #"suites|PASSED"
shift
if [ "$#" -eq 0 ]; then
    modules=("module")  # Default modules
else
    modules=("$@")  # Modules provided as arguments
fi
# modules=("$@")
for module in "${modules[@]}"; do
  mkdir -p "${module}/build" && cd "${module}/build"  # Create build directory if it doesn't exist
  module load googletest/1.10.0-GCCcore-9.3.0 CMake/3.16.4-GCCcore-9.3.0 foss/2020a || echo "no modules loaded"
  cmake .. || { cd ../..; continue; }
  make || { cd ../..; continue; }
  if [[ ${module} == "module_a" ]]; then valgrind ./"mod_a_test" || { cd ../..; continue; }
  elif [[ ${module} == "module_b" ]]; then valgrind ./"mod-b_test" || { cd ../..; continue; }
  else valgrind ./"${module}_test" || { cd ../..; continue; }
  fi #| grep --color=always -E "${grepmode}"
  cd ../..
  echo "${module} built and tested successfully."
done

echo "Finished building and testing modules."
