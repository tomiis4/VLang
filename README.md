# VLang

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
