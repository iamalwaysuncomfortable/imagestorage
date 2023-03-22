#!/bin/bash

# Find all cargo.toml files in the current directory and its subdirectories
find . -type f -name "Cargo.toml" | while read -r cargo_toml; do
    # Check if the cargo.toml file contains the "serial" feature flag
    if grep -q '\[features\]' "$cargo_toml" && grep -q 'serial' "$cargo_toml"; then
        # If the feature flag is found, get the directory containing the cargo.toml file
        project_dir="$(dirname "$cargo_toml")"
        echo "Running 'cargo test --features serial' in $project_dir"

        # Run the test with the "serial" feature flag in the directory
        (cd "$project_dir" && cargo test --features serial)
    fi
done
