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
```
### For loop array
```v
for number in array {}
```

## Function/Return
### Function
```v
// Basic
fn name(arg string) {}

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
