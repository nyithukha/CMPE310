#!/bin/bash
# run_tests.sh

PROGRAM=./program   # path to your compiled program

echo "*** Hamming Distance Tests ***"

test_case() {
    local input="$1"            # First argument  
    local expected="$2"         # Second argument

    # Feed input through echo
    echo -e "$input" | $PROGRAM
    echo "Expected: $expected"
    echo "------------------------"
}

# Test cases
test_case "this is a test\nof the emergency broadcast" "38"
test_case "abc\na" "0"
test_case "a\na" "0"

echo "Testing complete"
