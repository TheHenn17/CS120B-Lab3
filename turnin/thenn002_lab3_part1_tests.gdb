# Test file for "Lab3"


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

test "PINA: 0x00, PINB: 0x00 => PORTC: 0"
setPINA 0x00
setPINB 0x00
continue 5
expectPORTC 0
checkResult

test "PINA: 0xFF, PINB: 0xFF => PORTC: 16"
setPINA 0xFF
setPINB 0xFF
continue 5
expectPORTC 16
checkResult

test "PINA: 0xAA, PINB: 0x55 => PORTC: 8"
setPINA 0xAA
setPINB 0x55
continue 5
expectPORTC 8
checkResult

test "PINA: 0xAA, PINB: 0xAA => PORTC: 8"
setPINA 0xAA
setPINB 0xAA
continue 5
expectPORTC 8
checkResult

test "PINA: 0xFF, PINB: 0x00 => PORTC: 8"
setPINA 0xFF
setPINB 0x00
continue 5
expectPORTC 8
checkResult

test "PINA: 0x00, PINB: 0xFF => PORTC: 8"
setPINA 0x00
setPINB 0xFF
continue 5
expectPORTC 8
checkResult

test "PINA: 0x80, PINB: 0x01 => PORTC: 2"
setPINA 0x80
setPINB 0x01
continue 5
expectPORTC 2
checkResult

test "PINA: 0x97, PINB: 0x1E => PORTC: 9"
setPINA 0x97
setPINB 0x1E
continue 5
expectPORTC 9
checkResult


# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
