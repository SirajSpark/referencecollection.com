// --------------------------------------------------------------------------------
// Go Reference and Guide
//
// ReferenceCollection.com
// Licensed under the MIT License
// --------------------------------------------------------------------------------

// TABLE OF CONTENTS
// -----------------
// 1.  Introduction to Go
// 2.  Basic Syntax and Structure
// 3.  Data Types and Variables
// 4.  Operators and Expressions
// 5.  Control Flow Statements
// 6.  Functions
// 7.  Arrays and Slices
// 8.  Maps
// 9.  Structs
// 10. Pointers
// 11. Methods
// 12. Interfaces
// 13. Error Handling
// 14. Concurrency with Goroutines
// 15. Channels
// 16. Packages and Modules
// 17. Input and Output
// 18. Testing
// 19. Reflection
// 20. Context

// --------------------------------------------------------------------------------------------
// 1. Introduction to Go
// --------------------------------------------------------------------------------------------

// Go, also known as Golang, is a statically typed, compiled programming language designed by
// Google. It is known for its simplicity, efficiency, and strong support for concurrency. Go
// is particularly well-suited for building scalable and high-performance applications, such
// as web servers, cloud services, and distributed systems.

// Key Features:
// - Simple and concise syntax
// - Fast compilation and execution
// - Built-in support for concurrency (goroutines and channels)
// - Garbage collection for automatic memory management
// - Strong standard library

// Getting Started:
// - Install Go from the official website: https://go.dev/dl/
// - Verify installation by running 'go version' in your terminal.
// - Use 'go run <filename.go>' to run a Go program.
// - Use 'go build <filename.go>' to compile a Go program into an executable.

// --------------------------------------------------------------------------------------------
// 2. Basic Syntax and Structure
// --------------------------------------------------------------------------------------------

// A Go program consists of packages, functions, variables, and statements. The `main` package 
// is the entry point for executables, and the `main` function is where execution begins.

// What a Go Program Consists Of:
// 1. Packages: Organize code into reusable modules. The `main` package is required for 
//    executables.
// 2. Functions: Define reusable blocks of code. The `main` function is mandatory.
// 3. Variables: Store data. Go is statically typed, so types are known at compile time.
// 4. Statements and Expressions: Perform actions and produce values.

// Syntax Highlights:
// - Case Sensitivity: Variable and Function names are case-sensitive.
// - Semicolons: Optional; the compiler inserts them automatically.
// - Curly Braces: `{}` define code blocks.
// - Comments: Use `//` for single-line and `/* ... */` for multi-line comments.

package main

import "fmt"

func main() {
	fmt.Println("Hello, World!")
}

// --------------------------------------------------------------------------------------------
// 3. Data Types and Variables
// --------------------------------------------------------------------------------------------

// Go is statically typed; meaning variable types are determined at compile time.

// Variables can be declared:
// - Using `var`: Explicitly declares a variable with a type.
// - Using `:=`: Infers the type from the assigned value (shorthand syntax).

// Constants can be declared:
// - Using `const`: Declares a constant value.

// Basic data types in Go:
// - `int`, `int8`, `int16`, `int32`, `int64`: Signed integers of varying sizes.
// - `uint`, `uint8`, `uint16`, `uint32`, `uint64`: Unsigned integers of varying sizes.
// - `complex64`, `complex128`: Complex numbers.
// - `float32`, `float64`: Floating-point numbers.
// - `string`: A sequence of characters.
// - `bool`: Boolean values (`true` or `false`).
// - `byte`: Alias for `uint8`, typically used for representing ASCII characters.
// - `rune`: Alias for `int32`, represents a Unicode code point.

// Zero values: 
// - Uninitialized variables have default values (`0` for integers, `""` for strings, `false` for booleans).

// Example:
func main() {
	
	// Explicit declaration with type
	var name string = "David"
	var age int = 30
	var isStudent bool = true

	// Implicit declaration (type inferred)
	height := 5.9       // float64 inferred
    grade := 'A'        // rune (int32) inferred
    salary := 75000.50  // float64 inferred

	const gravity float64 = 9.8

	// - `%d`: Decimal, `%f` Floating point, `%s`: String, `%t`: Boolean, `%c`: Character, `%v`: Default format, 
	// - `%T`: Type of the value, `%b`: Binary, `%x`, `%X`: Hexadecimal, `%%%`: Literal percent sign
	fmt.Println("Name: %s, Age: %d, Student: %t", name, age, isStudent)
	fmt.Println("Height: %f, Grade: %c, Salary: %f", height, grade, salary)
	fmt.Println("Gravity: %f", gravity)
}

// --------------------------------------------------------------------------------------------
// 4. Operators and Expressions
// --------------------------------------------------------------------------------------------

// Operators in Go are used to perform operations on variables and values. Go supports a wide
// range of operators. Expressions are combinations of variables, constants, and operators that
// evaluate to a single value.

// Types of operators in Go:
// - Arithmetic: +, -, *, /, % (addition, subtraction, multiplication, division, modulus).
// - Comparison: ==, !=, >, <, >=, <= (equal, not equal, greater than, less than, etc.).
// - Logical: &&, ||, ! (AND, OR, NOT).
// - Bitwise: &, |, ^, <<, >> (AND, OR, XOR, left shift, right shift).
// - Assignment: =, +=, -=, *=, /=, %=, etc.

func main() {
	a := 10
	b := 5

	// Arithmetic operators
	fmt.Println("Addition:", a+b)     // Output: Addition: 15

	a++ // Increment a
	fmt.Println("Increment:", a)     // Output: Increment: 11

	// Assignment operators
	a += 5
	fmt.Println("Add and assign:", a)   // Output: Add and assign: 16

	// Comparison operators
	fmt.Println("Equal:", a == b)      // Output: Equal: false

	// Logical operators
	x := true
	y := false
	fmt.Println("Logical AND:", x && y) // Output: Logical AND: false

    // Bitwise operators
    c := 60 // Binary: 00111100
    d := 13 // Binary: 00001101
    fmt.Println("Bitwise AND:", c & d) // Output: Bitwise AND: 12 (00001100)
}

// --------------------------------------------------------------------------------------------
// 5. Control Flow Statements
// --------------------------------------------------------------------------------------------

// Control flow statements in Go allow you to control the execution flow of your program based
// on conditions or loops.

// Key Control Flow Statements:
// - `if` and `else`: Used for conditional execution of code blocks.
// - `else if`: Allows chaining multiple conditions.
// - `switch`: Used for multi-way branching based on the value of an expression.
// - `for`: Used for looping, including traditional loops, while-like loops, and infinite loops.
// - `range`: Used to iterate over elements in arrays, slices, maps, strings, and channels.
// - `break` and `continue`: Used to control loop execution.
// - `goto`: Jumps to a labeled statement (use with caution).
// - `defer`: Schedules a function call to be executed after the surrounding function returns.

func main() {
    // if-else statement
    score := 85
    if score >= 90 {
        fmt.Println("Grade: A")
    } else if score >= 80 {
        fmt.Println("Grade: B")
    } else {
        fmt.Println("Grade: C")
    }

    // switch statement
    day := "Monday"
    switch day {
    case "Monday":
        fmt.Println("Start of the workweek.")
    case "Friday":
        fmt.Println("End of the workweek.")
    default:
        fmt.Println("Midweek day.")
    }

    // for loop (traditional)
    for i := 0; i < 5; i++ {
        fmt.Println("Iteration:", i)
    }

    // while-like loop
    j := 0
    for j < 3 {
        fmt.Println("While-like iteration:", j)
        j++
    }

    // infinite loop with break
    k := 0
    for {
        if k >= 2 {
            break
        }
        fmt.Println("Infinite loop iteration:", k)
        k++
    }

    // continue statement
    for i := 0; i < 5; i++ {
        if i == 2 {
            continue // Skip iteration when i is 2
        }
        fmt.Println("Continue example iteration:", i)
    }

	// defer statement
    defer fmt.Println("Deferred statement executed last")
    fmt.Println("This will be printed first")

    // goto statement (use with caution)
    goto myLabel
    fmt.Println("This will be skipped") // This line will be skipped
	myLabel:
    fmt.Println("Jumped to myLabel")
}

// --------------------------------------------------------------------------------------------
// 6. Functions
// --------------------------------------------------------------------------------------------

// Functions in Go are reusable blocks of code that perform a specific task. Functions are a 
// fundamental building block in Go, enabling code modularity, reusability, and readability.

// Key Concepts:
// - Function Declaration: Defined using the `func` keyword, followed by the function name,
//   parameters, return type(s), and the function body.
// - Parameters: Functions can accept input values as parameters.
// - Return Values: Functions can return one or more values. Go supports named return values
//   for clarity.
// - Variadic Functions: Functions that accept a variable number of arguments.
// - Anonymous Functions: Functions without a name, often used as closures.
// - Recursion: Functions can call themselves.

// Function with parameters and a return value
func add(a int, b int) int {
    return a + b
}

// Function with multiple return values
func swap(x, y string) (string, string) {
    return y, x
}

// Function with named return values
func divide(a, b float64) (result float64, err error) {
    if b == 0 {
        err = fmt.Errorf("division by zero")
        return
    }
    result = a / b
    return
}

// Variadic function (accepts a variable number of arguments)
func sum(numbers ...int) int {
    total := 0
    for _, num := range numbers {
        total += num
    }
    return total
}

// Recursive function
func factorial(n int) int {
    if n == 0 {
        return 1
    }
    return n * factorial(n-1)
}

func main() {
    // Calling a function with parameters and return value
    sumResult := add(3, 5)
    fmt.Println("3 + 5 =", sumResult)

    // Calling a function with multiple return values
    a, b := swap("hello", "world")
    fmt.Println("Swapped values:", a, b)

    // Calling a function with named return values
    result, err := divide(10.0, 2.0)
    if err != nil {
        fmt.Println("Error:", err)
    } else {
        fmt.Println("10 / 2 =", result)
    }

    // Calling a variadic function
    total := sum(1, 2, 3, 4, 5)
    fmt.Println("Sum of 1, 2, 3, 4, 5 =", total)

    // Calling a recursive function
    fmt.Println("Factorial of 5 =", factorial(5))

    // Anonymous function (closure)
    double := func(x int) int {
        return x * 2
    }
    fmt.Println("Double of 4 =", double(4))
}

// --------------------------------------------------------------------------------------------
// 7. Arrays and Slices
// --------------------------------------------------------------------------------------------

// Arrays and slices are fundamental data structures in Go used to store collections of elements.
// Arrays have a fixed size, while slices are dynamically sized and more flexible. Slices are
// built on top of arrays and are more commonly used in Go programs due to their versatility.

func main() {
	// Array declaration
	var numbers [5]int // An array of 5 integers
	numbers[0] = 10
	numbers[1] = 20
	numbers[2] = 30
	numbers[3] = 40
	numbers[4] = 50
	fmt.Println("Array:", numbers) // Output: Array: [10 20 30 40 50]

	// Array literal
	colors := [3]string{"red", "green", "blue"}
	fmt.Println("Colors Array:", colors) // Output: Colors Array: [red green blue]

	// Slice declaration using array slicing
	sliceFromArray := numbers[1:4] // Slice from index 1 to 3 (exclusive)
	fmt.Println("sliceFromArray:", sliceFromArray) // Output: sliceFromArray Length: [20 30 40]
	fmt.Println("sliceFromArray Length:", len(sliceFromArray)) // Output: sliceFromArray Length  3
	fmt.Println("sliceFromArray Capacity:", cap(sliceFromArray)) // Output: sliceFromArray Length Capacity: 4

	// Slice creation using make(type, length, capacity)
	makeSlice := make([]int, 3, 5) // Slice with length 3 and capacity 5
	fmt.Println("makeSlice:", makeSlice) // Output: makeSlice: [0 0 0]
	fmt.Println("makeSlice Length:", len(makeSlice)) // Output: makeSlice Length: 3
	fmt.Println("makeSlice Capacity:", cap(makeSlice)) // Output: makeSlice Capacity: 5

	// Appending to a slice
	makeSlice = append(makeSlice, 100)
	fmt.Println("makeSlice after append:", makeSlice) // Output: makeSlice after append: [0 0 0 100]
	fmt.Println("makeSlice Length:", len(makeSlice)) // Output: makeSlice Length: 4
	fmt.Println("makeSlice Capacity:", cap(makeSlice)) // Output: makeSlice Capacity: 5

	// Copying slices
    copySlice := make([]int, len(makeSlice))
    copy(copySlice, makeSlice)
    fmt.Println("copySlice:", copySlice) // Output: copySlice: [0 0 0 100]

	// Iterating over a slice
    for index, value := range copySlice {
        fmt.Printf("Index: %d, Value: %d\n", index, value)
    }
}

// --------------------------------------------------------------------------------------------
// 8. Maps
// --------------------------------------------------------------------------------------------

// Maps in Go are unordered collections of key-value pairs. They are used to store and retrieve
// data efficiently based on unique keys. Maps are similar to dictionaries or hash tables in
// other programming languages. Keys in a map must be of a type that supports equality
// comparison (e.g., integers, strings, structs), while values can be of any type.

func main() {
    // Declaring and initializing a map using a map literal
    person := map[string]string{
        "name": "Alice",
        "age":  "25",
        "city": "New York",
    }
    fmt.Println("Person Map:", person)

    // Accessing values using keys
    fmt.Println("Name:", person["name"])
    fmt.Println("Age:", person["age"])

    // Adding a new key-value pair
    person["occupation"] = "Engineer"
    fmt.Println("Updated Person Map:", person)

    // Updating an existing value
    person["age"] = "26"
    fmt.Println("Updated Age:", person["age"])

    // Deleting a key-value pair
    delete(person, "city")
    fmt.Println("Person Map after deletion:", person)

    // Checking if a key exists
    value, exists := person["city"]
    if exists {
        fmt.Println("City:", value)
    } else {
        fmt.Println("City does not exist in the map.")
    }

    // Iterating over a map
    for key, value := range person {
        fmt.Printf("Key: %s, Value: %s\n", key, value)
    }

    // Declaring and initializing a map using the make function
    scores := make(map[string]int)
    scores["Alice"] = 95
    scores["Bob"] = 85
    scores["Charlie"] = 90
    fmt.Println("Scores Map:", scores)
}

// --------------------------------------------------------------------------------------------
// 9. Structs
// --------------------------------------------------------------------------------------------

// Structs in Go are user-defined types that group together fields of different types. They
// are used to represent complex data structures, similar to classes in object-oriented
// programming. Structs are value types, meaning they are copied when assigned or passed as
// arguments to functions.

// Declaring a struct
type Car struct {
    Make  string
    Model string
    Year  int
    Specs Specs // Nested struct
}

// Declaring another struct
type Specs struct {
    Engine string
    Color  string
}

func main() {
    // Initializing a struct using a struct literal
    car1 := Car{
        Make:  "Toyota",
        Model: "Camry",
        Year:  2020,
        Specs: Specs{
            Engine: "V6",
            Color:  "Red",
        },
    }
    fmt.Println("Car 1:", car1)

    // Accessing struct fields
    fmt.Println("Make:", car1.Make)
    fmt.Println("Model:", car1.Model)
    fmt.Println("Engine:", car1.Specs.Engine)

    // Updating struct fields
    car1.Year = 2021
    car1.Specs.Color = "Blue"
    fmt.Println("Updated Car 1:", car1)

    // Creating a struct instance using the new function
    car2 := new(Car)
    car2.Make = "Honda"
    car2.Model = "Civic"
    car2.Year = 2019
    car2.Specs = Specs{
        Engine: "I4",
        Color:  "Black",
    }
    fmt.Println("Car 2:", *car2)

    // Anonymous struct
    bike := struct {
        Brand string
        Type  string
        Year  int
    }{
        Brand: "Harley-Davidson",
        Type:  "Cruiser",
        Year:  2022,
    }
    fmt.Println("Bike:", bike)

    // Nested structs
    type Showroom struct {
        Name string
        Car  Car
        Location string
    }

    showroom := Showroom{
        Name: "Auto World",
        Car: Car{
            Make:  "Ford",
            Model: "Mustang",
            Year:  2023,
            Specs: Specs{
                Engine: "V8",
                Color:  "Yellow",
            },
        },
        Location: "New York",
    }
    fmt.Println("Showroom:", showroom)
}

// --------------------------------------------------------------------------------------------
// 10. Pointers
// --------------------------------------------------------------------------------------------

// Pointers in Go are variables that store the memory address of another variable. They allow
// you to directly manipulate the memory of a variable, enabling efficient data sharing and
// modification. Pointers are particularly useful for passing large data structures to
// functions without copying the entire structure.

// Key Concepts:
// - Declaration: Pointers are declared using the `*` symbol followed by the type of the
//   variable they point to.
// - Address Operator: The `&` operator is used to get the memory address of a variable.
// - Dereferencing: The `*` operator is used to access the value stored at the memory address
//   a pointer holds.
// - Pointer to Pointer: A pointer can also point to another pointer.
// - Passing Pointers to Functions: Pointers can be passed to functions to modify the original
//   variable.

func main() {
    // Declaring a variable and a pointer
    var num int = 42
    var ptr *int = &num // ptr holds the memory address of num

    fmt.Println("Value of num:", num)
    fmt.Println("Address of num:", ptr)
    fmt.Println("Value at address stored in ptr:", *ptr)

    // Modifying the value using the pointer
    *ptr = 100
    fmt.Println("Updated value of num:", num)

    // Pointer to a pointer
    var ptr2 **int = &ptr
    fmt.Println("Address of ptr:", ptr2)
    fmt.Println("Value at address stored in ptr2:", *ptr2)
    fmt.Println("Value at address stored in *ptr2:", **ptr2)

    // Passing pointers to functions
    increment(&num)
    fmt.Println("Value of num after increment:", num)
}

// Function that accepts a pointer
func increment(p *int) {
    *p++ // Increment the value at the address stored in p
}

// --------------------------------------------------------------------------------------------
// 11. Methods
// --------------------------------------------------------------------------------------------

// Methods in Go are functions that are associated with a specific type, typically a struct.
// They allow you to define behavior for a type, making your code more organized and
// object-oriented. Methods have a receiver, which is a parameter that binds the method to
// the type. The receiver can be either a value or a pointer, depending on whether you want
// to modify the original data or work with a copy.

// Key Concepts:
// - Receiver: The receiver is a special parameter that binds the method to a type. It can be
//   a value receiver (works on a copy) or a pointer receiver (works on the original data).
// - Value Receiver: Methods with value receivers cannot modify the original data.
// - Pointer Receiver: Methods with pointer receivers can modify the original data.
// - Method Declaration: Methods are declared using the `func` keyword, followed by the
//   receiver, method name, parameters, and return type.
// - Method Invocation: Methods are called using the dot (`.`) operator, followed by the
//   method name.

// Declaring a struct
type Car struct {
    Make  string
    Model string
    Year  int
}

// Method with a value receiver
func (c Car) DisplayInfo() {
    fmt.Printf("Make: %s, Model: %s, Year: %d\n", c.Make, c.Model, c.Year)
}

// Method with a pointer receiver
func (c *Car) UpdateYear(newYear int) {
    c.Year = newYear
}

// Method with a value receiver (does not modify the original data)
func (c Car) IsVintage() bool {
    return c.Year < 2000
}

func main() {
    // Creating an instance of Car
    car := Car{
        Make:  "Ford",
        Model: "Mustang",
        Year:  1967,
    }

    // Calling a method with a value receiver
    car.DisplayInfo()

    // Calling a method with a pointer receiver
    car.UpdateYear(1970)
    fmt.Println("Updated Car Info:")
    car.DisplayInfo()

    // Calling a method with a value receiver
    if car.IsVintage() {
        fmt.Println("This car is vintage.")
    } else {
        fmt.Println("This car is not vintage.")
    }
}

// --------------------------------------------------------------------------------------------
// 12. Interfaces
// --------------------------------------------------------------------------------------------

// Interfaces in Go are a powerful feature that define a set of method signatures. They allow
// you to specify behavior without implementing it, enabling polymorphism and flexible code
// design. A type implements an interface by implementing all its methods. Interfaces are
// implicitly satisfied, meaning no explicit declaration is required.

// Key Concepts:
// - Interface Declaration: Interfaces are declared using the `type` and `interface` keywords,
//   followed by a list of method signatures.
// - Implementing Interfaces: A type implements an interface by defining all the methods
//   specified in the interface.
// - Polymorphism: Interfaces allow different types to be treated as the same type if they
//   implement the same interface.
// - Empty Interface: The `interface{}` type is an empty interface that can hold values of any
//   type, similar to `Object` in other languages.
// - Type Assertion: Used to extract the underlying value from an interface.
// - Type Switch: A switch statement that works with types instead of values.

// Declaring an interface
type Vehicle interface {
    Start() string
    Stop() string
}

// Declaring a struct that implements the Vehicle interface
type Car struct {
    Make  string
    Model string
}

// Implementing the Start method for Car
func (c Car) Start() string {
    return fmt.Sprintf("%s %s is starting.", c.Make, c.Model)
}

// Implementing the Stop method for Car
func (c Car) Stop() string {
    return fmt.Sprintf("%s %s is stopping.", c.Make, c.Model)
}

// Declaring another struct that implements the Vehicle interface
type Bike struct {
    Brand string
}

// Implementing the Start method for Bike
func (b Bike) Start() string {
    return fmt.Sprintf("%s bike is starting.", b.Brand)
}

// Implementing the Stop method for Bike
func (b Bike) Stop() string {
    return fmt.Sprintf("%s bike is stopping.", b.Brand)
}

// Function that accepts any type implementing the Vehicle interface
func OperateVehicle(v Vehicle) {
    fmt.Println(v.Start())
    fmt.Println(v.Stop())
}

func main() {
    // Creating instances of Car and Bike
    car := Car{Make: "Toyota", Model: "Camry"}
    bike := Bike{Brand: "Harley-Davidson"}

    // Using the Vehicle interface to operate different vehicles
    OperateVehicle(car)
    OperateVehicle(bike)

    // Type assertion
    var v Vehicle = Car{Make: "Ford", Model: "Mustang"}
    if car, ok := v.(Car); ok {
        fmt.Println("Type assertion successful:", car.Make, car.Model)
    } else {
        fmt.Println("Type assertion failed.")
    }

    // Type switch
    switch v.(type) {
    case Car:
        fmt.Println("The vehicle is a Car.")
    case Bike:
        fmt.Println("The vehicle is a Bike.")
    default:
        fmt.Println("Unknown vehicle type.")
    }

    // Empty interface
    var empty interface{} = 42
    fmt.Println("Empty interface value:", empty)
}

// --------------------------------------------------------------------------------------------
// 13. Error Handling
// --------------------------------------------------------------------------------------------

// Error handling is explicit and relies on returning errors as values from functions.
// Unlike many other languages, Go does not use exceptions or try-catch blocks. Instead,
// errors are treated as regular values, and the caller is responsible for checking and
// handling them. This approach encourages writing robust and predictable code.

// Key Concepts:
// - Errors are represented by the built-in `error` interface.
// - The `error` interface has a single method `Error() string` that returns a string
//   representation of the error.
// - Functions that can fail should return an error as their last return value.
// - Use the `if err != nil` pattern to check for errors.
// - The `fmt.Errorf` function is used to create custom error objects.
// - The `panic` function is used to signal unrecoverable errors (use sparingly).
// - The `recover` function can be used to handle panics (usually in deferred functions).

import (
    "errors"
    "fmt"
)

// Function that returns an error
func divide(a, b float64) (float64, error) {
    if b == 0 {
        // Return an error using the errors package
        return 0, errors.New("division by zero")
    }
    // Return the result and nil for the error
    return a / b, nil
}

// Custom error type
type NegativeNumberError struct {
    Number float64
}

// Implementing the error interface for the custom error type
func (e NegativeNumberError) Error() string {
    return fmt.Sprintf("negative number not allowed: %f", e.Number)
}

// Function that returns a custom error
func sqrt(n float64) (float64, error) {
    if n < 0 {
        // Return a custom error
        return 0, NegativeNumberError{Number: n}
    }
    // Simplified implementation for demonstration
    return n * n, nil
}

func main() {
    // Example 1: Handling errors from a function
    result, err := divide(10, 0)
    if err != nil {
        fmt.Println("Error:", err)
    } else {
        fmt.Println("Result:", result)
    }

    // Example 2: Handling custom errors
    sqrtResult, err := sqrt(-4)
    if err != nil {
        fmt.Println("Error:", err)
    } else {
        fmt.Println("Square Root Result:", sqrtResult)
    }

    // Example 3: Error wrapping
    _, err = divide(10, 0)
    if err != nil {
        // Wrap the error with additional context
        wrappedErr := fmt.Errorf("calculation failed: %w", err)
        fmt.Println("Wrapped Error:", wrappedErr)
    }

    // Example 4: Panic and recover (not recommended for regular error handling)
    defer func() {
        // Recover from a panic and handle it gracefully
        if r := recover(); r != nil {
            fmt.Println("Recovered from panic:", r)
        }
    }()
    // Trigger a panic (simulating an exceptional situation)
    panic("something went wrong")
}

// --------------------------------------------------------------------------------------------
// 14. Concurrency with Goroutines
// --------------------------------------------------------------------------------------------

// Concurrency is achieved using goroutines, which are lightweight threads managed by
// the Go runtime. Goroutines allow you to perform tasks concurrently, making it easier to
// write efficient and scalable programs. Goroutines are cheaper than traditional threads
// and are multiplexed onto a smaller number of OS threads.

// Key Concepts:
// - A goroutine is created by using the `go` keyword followed by a function call.
// - Goroutines run concurrently with the main function and other goroutines.
// - The main function will exit when all non-goroutine functions are done, even if other
//   goroutines are still running.
// - Goroutines communicate with each other primarily through channels (discussed later).
// - Goroutines are non-blocking; the program does not wait for a goroutine to finish before
//   moving on to the next line of code.
// - Use `sync.WaitGroup` to wait for a group of goroutines to finish.

// Important Notes:
// - Goroutines are not threads; they are multiplexed onto threads by the Go runtime.
// - Goroutines are very efficient and can be created in large numbers.

import (
    "fmt"
    "sync"
    "time"
)

// Function to be executed as a goroutine
func printMessage(message string, wg *sync.WaitGroup) {
	defer wg.Done() // Decrement the counter when the goroutine finishes
	for i := 0; i < 5; i++ {
		fmt.Println(message, ":", i)
		time.Sleep(time.Millisecond * 100) // Simulate some work
	}
}

func main() {
	var wg sync.WaitGroup // Create a WaitGroup

	wg.Add(2) // Add 2 to the counter
	go printMessage("First Goroutine", &wg) // Start the first goroutine
	go printMessage("Second Goroutine", &wg) // Start the second goroutine

	fmt.Println("Main function continues...")

	wg.Wait() // Wait for all goroutines to finish
	fmt.Println("Main function finished.")
}

// --------------------------------------------------------------------------------------------
// 15. Channels
// --------------------------------------------------------------------------------------------

// Channels are a typed conduit through which you can send and receive values between goroutines.
// They are a fundamental part of Go's concurrency model, providing a safe way for goroutines
// to communicate and synchronize.

// Key Concepts:
// - Channels are created using the `make` function with the `chan` keyword, followed by the
//   data type that the channel will carry.
// - Channels can be buffered or unbuffered.
// - Unbuffered channels require both a sender and a receiver to be ready before a transfer
//   can occur (synchronous).
// - Buffered channels have a capacity; a sender can send values until the buffer is full,
//   and a receiver can receive values until the buffer is empty (asynchronous).
// - The `<-` operator is used to send and receive values on a channel.
// - Sending to a closed channel will cause a panic.
// - Receiving from a closed channel will return the zero value of the channel's type and false.
// - The `close` function is used to close a channel (only the sender should close a channel).
// - The `range` keyword can be used to iterate over a channel until it is closed.

import "fmt"
import "time"

// Function to send data on a channel
func sendData(ch chan int) {
	for i := 0; i < 5; i++ {
		ch <- i // Send data to the channel
		fmt.Println("Sent:", i)
		time.Sleep(time.Millisecond * 100)
	}
    close(ch) // Close the channel after sending all data
}

// Function to receive data from a channel
func receiveData(ch chan int) {
    for value := range ch { // Receive data from the channel until it is closed
        fmt.Println("Received:", value)
    }
}

func main() {
	// Create an unbuffered channel
	ch := make(chan int)

	// Start goroutines to send and receive data
	go sendData(ch)
	go receiveData(ch)

	// Wait for the goroutines to finish
	time.Sleep(time.Second * 2)
	fmt.Println("Main function finished.")

    // Buffered Channel
    bufferedCh := make(chan string, 2)
    bufferedCh <- "First"
    bufferedCh <- "Second"
    fmt.Println("Buffered channel length:", len(bufferedCh)) // Output: Buffered channel length: 2
    fmt.Println("Received:", <-bufferedCh) // Output: Received: First
    fmt.Println("Received:", <-bufferedCh) // Output: Received: Second
    close(bufferedCh)

    // Receiving from closed channel
    val, ok := <-bufferedCh
    fmt.Println("Received from closed channel:", val, ok) // Output: Received from closed channel:  false
}

// --------------------------------------------------------------------------------------------
// 16. Packages and Modules
// --------------------------------------------------------------------------------------------

// Packages and modules are fundamental for organizing and reusing Go code.

// Packages:
// - A package is a collection of source files in the same directory that are compiled together.
// - Packages provide namespaces for code, preventing naming conflicts.
// - Package names are typically the same as the directory they reside in.
// - The `main` package is special; it's the entry point for executable programs.
// - Packages can be imported into other packages using the `import` statement.
// - Exported identifiers (functions, types, variables, etc.) start with a capital letter.
// - Unexported identifiers start with a lowercase letter and are only visible within the package.

// Modules:
// - A module is a collection of related Go packages.
// - Modules are used for versioning and managing dependencies.
// - A module is defined by a `go.mod` file in the root directory of the module.
// - The `go.mod` file specifies the module's import path, Go version, and dependencies.
// - Modules are used to manage external libraries.
// - The `go get` command is used to download and install module dependencies.

// Key Concepts:
// - Packages provide code organization; modules provide dependency management.
// - Modules are the modern way to manage Go projects.
// - Use `go mod init <module-name>` to create a new module.
// - Use `go mod tidy` to automatically add and remove dependencies.
// - Use `go build` to compile code within a module.


// mypackage/mypackage.go
package mypackage

import "fmt"

// Exported function
func Greet(name string) {
    fmt.Println("Hello, ", name, " from mypackage!")
}

// Unexported function
func internalMessage() {
    fmt.Println("This is an internal message from mypackage.")
}

// main.go
package main

import (
	"fmt"
    "myproject/mypackage" // Import the custom package
)

func main() {
	fmt.Println("This is the main package.")
    mypackage.Greet("Go User") // Call the exported function from mypackage
    // mypackage.internalMessage() // This will cause a compile error, internalMessage is not exported.
}

// --------------------------------------------------------------------------------------------
// 17. Input and Output
// --------------------------------------------------------------------------------------------

// Input and output (I/O) in Go are handled using the `fmt`, `os`, and `bufio` packages, among
// others.

// Key Concepts:
// - Console I/O: The `fmt` package provides functions like `Println`, `Scan`, and `Scanln` for
//   reading from and writing to the console.
// - File I/O: The `os` package provides functions for opening, reading, writing, and closing
//   files.
// - Buffered I/O: The `bufio` package provides buffered I/O operations, which can improve
//   performance for large data streams.
// - Interfaces: Go's I/O is based on interfaces like `io.Reader` and `io.Writer`, allowing
//   for flexible and reusable code.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Console Output
    fmt.Println("Hello, World!")

    // Console Input
    var name string
    fmt.Print("Enter your name: ")
    fmt.Scanln(&name)
    fmt.Println("Hello,", name)

    // File I/O: Writing to a file
    file, err := os.Create("output.txt")
    if err != nil {
        fmt.Println("Error creating file:", err)
        return
    }
    defer file.Close()

    writer := bufio.NewWriter(file)
    _, err = writer.WriteString("Hello, File!\n")
    if err != nil {
        fmt.Println("Error writing to file:", err)
        return
    }
    writer.Flush()

    // File I/O: Reading from a file
    file, err = os.Open("output.txt")
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        fmt.Println("Read from file:", scanner.Text())
    }

    if err := scanner.Err(); err != nil {
        fmt.Println("Error reading file:", err)
    }
}

// --------------------------------------------------------------------------------------------
// 18. Testing
// --------------------------------------------------------------------------------------------

// Testing in Go is built into the language through the `testing` package. Go encourages writing
// tests alongside your code, and the `go test` command is used to run tests. Tests are written
// in files ending with `_test.go` and use functions prefixed with `Test` to define test cases.
// Go also supports benchmarks and example tests.

// Key Concepts:
// - Test Functions: Test functions are defined with the prefix `Test` and take a `*testing.T`
//   parameter. They use methods like `Error`, `Fail`, and `Log` to report test failures.
// - Table-Driven Tests: A common pattern where multiple test cases are defined in a slice and
//   iterated over in a single test function.
// - Benchmarks: Benchmark functions are defined with the prefix `Benchmark` and take a
//   `*testing.B` parameter. They measure the performance of code.
// - Example Tests: Example functions are defined with the prefix `Example` and are used to
//   demonstrate how to use a package or function.
// - Test Coverage: The `go test` command can generate coverage reports to show how much of
//   your code is tested.

// File: mymodule/mymath/mymath.go
// package mymath
package mymath

// Function to be tested
func Add(a int, b int) int {
	return a + b
}

// File: mymodule/mymath/mymath_test.go
// package mymath
package mymath

import "testing"

// Test function for Add
func TestAdd(t *testing.T) {
	result := Add(2, 3)
	if result != 5 {
		t.Errorf("Add(2, 3) = %d; want 5", result)
	}
}

// Test function for Add with table-driven tests
func TestAddTable(t *testing.T) {
	testCases := []struct {
		a    int
		b    int
		want int
	}{
		{2, 3, 5},
		{-1, 1, 0},
		{0, 0, 0},
		{10, -5, 5},
	}

	for _, tc := range testCases {
		result := Add(tc.a, tc.b)
		if result != tc.want {
			t.Errorf("Add(%d, %d) = %d; want %d", tc.a, tc.b, result, tc.want)
		}
	}
}

// Benchmark function for Add
func BenchmarkAdd(b *testing.B) {
    for i := 0; i < b.N; i++ {
        Add(10, 20)
    }
}

// --------------------------------------------------------------------------------------------
// 19. Reflection
// --------------------------------------------------------------------------------------------

// Reflection is provided by the `reflect` package, which allows you to inspect and manipulate
// the types and values of variables at runtime. Reflection is a powerful feature but should be
// used sparingly, as it can make code harder to understand and less efficient.

// Key Concepts:
// - `reflect.TypeOf`: Represents the type of a variable.
// - `reflect.ValueOf`: Represents the value of a variable.
// - Type Inspection: You can inspect the type of a variable, including its kind (e.g., int,
//   string, struct) and methods.
// - Value Manipulation: You can modify the value of a variable using reflection, but this
//   requires care to avoid runtime errors.
// - Struct Tags: Reflection is often used to work with struct tags, which are metadata
//   associated with struct fields.

import (
    "fmt"
    "reflect"
)

// Struct with tags
type Person struct {
    Name string `json:"name"`
    Age  int    `json:"age"`
}

func main() {
    // Inspecting a variable's type and value
    x := 42
    fmt.Println("Type of x:", reflect.TypeOf(x))
    fmt.Println("Value of x:", reflect.ValueOf(x))

    // Inspecting a struct
    p := Person{Name: "Alice", Age: 25}
    t := reflect.TypeOf(p)
    v := reflect.ValueOf(p)

    // Iterating over struct fields
    for i := 0; i < t.NumField(); i++ {
        field := t.Field(i)
        value := v.Field(i)
        fmt.Printf("Field: %s, Type: %s, Value: %v, Tag: %s\n",
            field.Name, field.Type, value.Interface(), field.Tag.Get("json"))
    }

    // Modifying a value using reflection (requires a pointer)
    y := 10
    v2 := reflect.ValueOf(&y).Elem() // Get the addressable value
    v2.SetInt(20)                    // Modify the value
    fmt.Println("Modified value of y:", y)
}

// --------------------------------------------------------------------------------------------
// 20. Context
// --------------------------------------------------------------------------------------------

// The `context` package provides a way to manage the lifecycle of operations, such as
// cancelation, timeouts, and deadlines, across API boundaries and between goroutines. It is
// commonly used in servers, clients, and other systems where operations need to be canceled
// or have a timeout.

// Key Concepts:
// - `context.Context`: The core type that carries deadlines, cancelation signals, and other
//   request-scoped values across API boundaries and between goroutines.
// - Cancelation: A `context.Context` can be canceled using the `context.WithCancel`,
//   which returns a cancel function to signal that the operation should be stopped.
// - Timeouts: A `context.Context` can have a timeout using the `context.WithTimeout`,
//   which automatically cancels the context after a specified duration.
// - Deadlines: A `context.Context` can have a deadline using the `context.WithDeadline`
//   which cancels the context at a specific time.
// - Values: A `context.Context` can carry request-scoped values using the `context.WithValue`.

import (
    "context"
    "fmt"
    "time"
)

func operation(ctx context.Context) {
    select {
    case <-time.After(500 * time.Millisecond):
        fmt.Println("Operation completed.")
    case <-ctx.Done():
        fmt.Println("Operation canceled:", ctx.Err())
    }
}

func main() {
    // Context with cancelation
    ctx, cancel := context.WithCancel(context.Background())
    go operation(ctx)
    time.Sleep(200 * time.Millisecond)
    cancel() // Cancel the operation
    time.Sleep(100 * time.Millisecond)

    // Context with timeout
    ctx, cancel = context.WithTimeout(context.Background(), 300*time.Millisecond)
    defer cancel()
    go operation(ctx)
    time.Sleep(500 * time.Millisecond)

    // Context with deadline
    deadline := time.Now().Add(400 * time.Millisecond)
    ctx, cancel = context.WithDeadline(context.Background(), deadline)
    defer cancel()
    go operation(ctx)
    time.Sleep(500 * time.Millisecond)

    // Context with values
    ctx = context.WithValue(context.Background(), "key", "value")
    fmt.Println("Value from context:", ctx.Value("key"))
}

// Happy Coding!