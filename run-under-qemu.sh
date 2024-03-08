#!/bin/bash
# Invocation run_under_qemu.sh [qemu_path] [cpu] [test_name] [test_args...]

if [ $# -lt 3 ]; then
    echo "Usage: run_under_qemu.sh [qemu_path] [cpu] [test_name] [test_args...]"
    exit 1
fi

# Read the qemu path
qemu_path=$1;

# Read the CPU name
cpu=$2

# Read the test name
# This will be passed to qemu as the kernel
test_name=$3;

# Remove the qemu path, cpu name and test name from arguments
# This makes $@ expand to test arguments
shift 3

if [ $# -eq 0 ]; then
    $qemu_path -cpu $cpu -semihosting -nographic -m 256 -kernel $test_name 2> /dev/null
else
    # Wrapped in eval to properly expand $@
    eval "$qemu_path -cpu $cpu -semihosting -nographic -m 256 -kernel $test_name -append \"$@\"" 2> /dev/null
fi