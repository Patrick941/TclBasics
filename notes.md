# Tcl
## Basics
### Setting
Values can be set using the following syntax:
```
set value 9
```
This same command can also be used for everyother data type, such as strings as can be seen below:
```
set string "hello world"
set string2 helloWorld
```
### Arithmetic
Arithmetic can be performed using some set functions but also by using the expr function, both can be seen used as followed:
```
incr someInt 3;
set someInt [expr {$someInt * 3}]
```
### String formatting
A number of different things can be done in order to format strings in a specific way, the first of which is using a backslash to remove the special meaning from characters. In the below code snippet the printed result would be "$16.42" and the special characters will be printed as they appear
```
set string "\$16.42"
```
Newlines work as they do in C.
Another way to remove the special meaning from characters is to use curly brackets, the following code snippet will print all of the special meaning characters as their symbols
```
set string {Special character 1 is $, special character 2 is , and the final special character is \, they are all ignored} outside the brackets I can use a \n
```
Adding strings can be done using the $ character. if we want to print hello world we can use the following code snippet:
```
set str1 hello
set str2 world
set str3 "$str1 $str2"
puts $str3
```
### Structs
A struct can be created in Tcl that can perform the same operations as a struct in C. This struct can be set up an used as shown in the code snippet below:
```
set object(string1) Hello
set object(string2) world
set object(string3) !
puts "$object(string1) $object(string2)$object(string3)"
```