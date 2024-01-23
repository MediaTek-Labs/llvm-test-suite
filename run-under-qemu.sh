#!/bin/bash
# Invocation run_under_qemu.sh [qemu_path] [test_name] [test_args...]

if [ $# -lt 2 ]; then
    echo "Usage: run_under_qemu.sh [qemu_path] [test_name] [test_args...]"
    exit 1
fi

# Read the qemu path
qemu_path=$1;

# Read the test name
# This will be passed to qemu as the kernel
test_name=$2;

# Remove the qemu path and test name from arguments
# This makes $@ expand to test arguments
shift 2

if [ $# -eq 0 ]; then
    $qemu_path -cpu I7200 -semihosting -nographic -kernel $test_name 2> /dev/null
else
    # Wrapped in eval to properly expand $@
    eval "$qemu_path -cpu I7200 -semihosting -nographic -kernel $test_name -append \"$@\"" 2> /dev/null
fi