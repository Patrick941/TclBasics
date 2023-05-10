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

namespace eval block2 {
    #puts $block::blockVal
}


namespace eval block {
    variable blockVal 1
    incr blockVal 3
}

proc block::passedBlock {} {
    variable blockVal
    puts $blockVal
}

block::passedBlock

set value 0
namespace eval level3 {
    variable value
    set value 1
    namespace eval level2 {
        variable value
        set value 2
        namespace eval level1 {
            variable value
            set value 3
            puts $value
        }
        puts $value
    }
    puts $value
}
puts $value

proc printLoop {args} {
    foreach arg $args {
        puts $arg
    }
}
set someList 10\ 20\ 30
set someOtherList 40\ 50\ 60
set someThirdList $someList\ $someOtherList
printLoop $someThirdList

set command "puts"
set args "Hello world!"
eval $command [list $args]

rename while oldWhile
proc while {} {
    puts "Hello world!"
}