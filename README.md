# V Cheatsheet

# Add Hello world

<table>
<td>

* [Imports](#import)
* [Variables](#variables)
* [Input/Output](#inputoutput)
* [Loops](#loops)


</td>
<td>

* [Function & Return](#functionreturn)
* [Extern file](#extern-file)
* [Logic](#logic)
* [Projects](#projects)

</td>
</table>

## Import
```V
import x
```

## Variables
### Types
```v
x := "string"
x := 0
x := i64(9999)
x := [0, 0, 0]
x := {
   'one': 1
   'two': 2
}

// mutable
mut x = 1
```
## Input/Output
### Output
```v
// Basic
println("Hello, world")

// Variable
println("Hello, $variable")
```
### Input
```v
import os

x := os.input("Hello")
```

## Loops
### For loop
```v
for mut i:=0; i<5; i++ {}
```¨
### For loop array
```v
for number in array {}
```

## Function/Return
### Function
```v
// Basic
void name() {}

// Main
fn main() { }
```
### Return
```v
fn name() int { return 5+5 }
```

## Extern file
### Import file
```v
// main.v
import second
second.second_function()

// second.v
module second

pub fn second_function() {  }
```

## Logic
### If/Else If/ Else
```v
if x {} else if y {} else {}
```
### Switch/Case
```v
switch (x) { case "y": break; }
```


## Projects
 - Abraham's algorithm
 - Graph
 - Discord bot from scratch

# Old
## VLang Cheat sheet (In progress.)

## Run 
`v run hello.v`

## Functions 
Basic function
```v
fn main(args string) {
	// do something
}
```

Using with return 
```v
fn add(arg1 int, arg2 int) int {
	return arg1 + arg2
}
```

Using function as module
```v
module functionmodule

pub fn my_function() {
	// do something
}
```
```V
import functionmodule

fn main() {
	mymodule.my_function()
}
```
## Print
Basic 
```V
println("Hello world")
```
Variable
```V
println("My name is: $name")
```

## Variables
Assign variable
```V
string := "This is my variable"
number := 1
large_number := i64(9999999999)
array := [1, 2, 3]
object := {
	'one': 1
	'two': 2
}
```

Change variable
```V
mut number := 1
number = 0
```
## Statements

If
```V
if x < y {
	println('x is smaller than y')
} else if a > b {
	println('x is bigger than y')
} else {
	println('x is same as y')
}
```
In
```V
object := {
	'one': 1
	'two': 2
}
println('two' in object) // true
println('three' in object) // false
println('three' !in object) // true
```
Loops
```V
number_array := [1, 2, 3, 4, 5]
for number in number_array {
	println(number)
}
```

