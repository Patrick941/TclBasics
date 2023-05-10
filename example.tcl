# call, and subsequent words are arguments to the routine.  Words are delimited
# by whitespace.  Since each argument is a word in the command it is already a
# string, and may be unquoted:
set part1 Sal
set part2 ut; set part3 ations


# a dollar sign introduces variable substitution:
set greeting $part1$part2$part3


# When "set" is given only the name of a variable, it returns the
# value of that variable:
set part3 ;# Returns the value of the variable.


# Left and right brackets embed a script to be evaluated for a result to
# substitute into the word:
set greeting $part1$part2[set part3]
set greeting "hello world";


# An embedded script may be composed of multiple commands, the last of which provides
# the result for the substitution:
set greeting $greeting[
    incr i
    incr i
    incr i
]

set someInt 6;
incr someInt 3;
set someInt [expr {$someInt * 3}]
puts $someInt;
puts $greeting ;# The output is "Salutations3"

set object(string1) Hello
set object(string2) world
set object(string3) !
puts "$object(string1) $object(string2)$object(string3)"