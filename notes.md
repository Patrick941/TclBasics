# Tcl
## Basics
### Setting
Values can be set using the following syntax:
```t
set value 9
```
This same command can also be used for everyother data type, such as strings as can be seen below:
```t
set string "hello world"
set string2 helloWorld
```
### Arithmetic
Arithmetic can be performed using some set functions but also by using the expr function, both can be seen used as followed:
```t
incr someInt 3;
set someInt [expr {$someInt * 3}]
```
### String formatting
A number of different things can be done in order to format strings in a specific way, the first of which is using a backslash to remove the special meaning from characters. In the below code snippet the printed result would be "$16.42" and the special characters will be printed as they appear
```t
set string "\$16.42"
```
Newlines work as they do in C.
Another way to remove the special meaning from characters is to use curly brackets, the following code snippet will print all of the special meaning characters as their symbols
```t
set string {Special character 1 is $, special character 2 is , and the final special character is \, they are all ignored} outside the brackets I can use a \n
```
Adding strings can be done using the $ character. if we want to print hello world we can use the following code snippet:
```t
set str1 hello
set str2 world
set str3 "$str1 $str2"
puts $str3
```
### Structs
A struct can be created in Tcl that can perform the same operations as a struct in C. This struct can be set up an used as shown in the code snippet below:
```t
set object(string1) Hello
set object(string2) world
set object(string3) !
puts "$object(string1) $object(string2)$object(string3)"
```
### Variables
Variable can be used to declare or set a variable and differs from the set command as a the created variable will be local to the given scope. 
```t
variable blockVal 1
```
### Namespace
A namespace is very similar to a block in c, the only difference is that it has a label attached to the block, it can be used to define local variables that cannot be used outside the block.
```t
namespace eval block {
    variable blockVal 1
    incr blockVal 3
}
```
When using set, it will first try to set the value of a local variable and will go up the namespace heirarchy to eventually global variables and will set the first one it find. This can be demonstrated by the following code snippet which outputs 3 then 2 then 1 then 0.
```t
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
```
### Casting to a namespace
We can also cast to a namespace to access variables inside this namespace. We can do this is the following code snippet where we perform a cast for a single variable inside a line of code.
```t
namespace eval block2 {
    puts $block::blockVal
}
```
We can also cast to a routine, this means that anything inside this routine can access the data that has been cast to. To access a variable, the variable has to be defined again but will keeps its already given value, this can be done in the following code snippet:
```t
proc block::passedBlock {} {
    variable blockVal
    puts $blockVal
}
block::passedBlock
```
To specify the use of a global variable we can use two colons with nothing before them to specify the global space. This can be used to specify a global variable or to enter a different namespace. It would be used as follows:
```t
namespace eval block2 {
    puts $::blockVal
}
```
### Importing
New routines can be imported using namespaces. The mathop library can be imported as follows:
```
namespace import ::tcl::mathop::+
```
### Multiple Arguments
Multiple arguments can be passed into a function using "args". Whenever args is used all following arguments will be stored in args as a list. This list can then be treated as usual. Here is an example of it in use as shown below:
```t
proc printLoop {args} {
    foreach arg $args {
        puts $arg
    }
}
printLoop 1 2 3 4 5 6 7 8
```
### Conditional statements
If and else statements can be used much like C put have curly braces. An example of once being used is shown below:
```t
if {3>int} {
    puts "3 is greater than int"
}
```
### Loops
For loops are used much like C but are syntaxally different. An example of a standard for loop is given as follows:
```t
for {set i 0} {$i < 100} {incr i} {
    puts $i
}
```
While loops are then much as would be expected. They follow the same syntax as above
```
while {$i < 100}
```
### Lists
Lists are created in TCL by using whitespaces. This means we simply put a space between values in order to create a list of these values. This can be used in conjuction with our print loop function above as follows:
```t
set someList 10\ 20\ 30
printLoop $someList
```
Lists can be created from other lists as follows:
```t
set someList 10\ 20\ 30
set someOtherList 40\ 50\ 60
set someThirdList $someList\ $someOtherList
printLoop $someThirdList
```
### Eval 
Eval can be used to execute a some code by passing both the operation name and the operation arguments both as arguments to the eval block. An example of an eval block in use is given below:
```t
set command "puts"
set args "Hello world!"
eval $command [list $args]
```
In the above code snippet braces are placed around the args list so that whitespaces are not treated as seperate words but it understand that the words are all part of one string.
### Redefining routines
We can redefine a given routine in a given namespace and apply a different meaning to it. For example if we wanted to redefine the while loop to just print hello world instead we could do that as follows:
```t
rename while oldWhile
proc while {} {
    puts "Hello world!"
}
while
```
### Coroutines
Coroutines can be used for asynchronous code to be able to move between differents points of code to carry out some piece of code then return to main. A coroutine when entered multiple times do not have an individual scope. Each time the coroutine is entered it picks up where it left off. This can be seen in the below code snippet which will print the same values from the main as it will the coroutine:
```t
coroutine co1 apply {{} {
    for {set i 0} {$i < 10} {incr i} {
        puts "Coroutine iteration $i"
        yield
    }
}}
for {set i 0} {$i < 10} {incr i} {
    puts "Main iteration $i"
    co1
}
```