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