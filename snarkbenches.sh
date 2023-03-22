#!/bin/sh

# Find all directories containing a "benches" folder
directories=$(find . -type d -name "benches" -not -path "./.*/*")

# Run cargo bench in each directory and append results to the output file
while IFS= read -r dir; do
  if [ -d "$dir" ]; then
    echo "Running benchmarks in $dir"
    (cd "$dir" && cargo bench --features serial)
    echo "----------------------------------------"
  else
    echo "Directory $dir not found"
  fi
done <<< "$directories"

echo "Benchmarks completed!"
