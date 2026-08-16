// ---------------------------------------------------------------------------------
// Rust Programming Guide
//
// ReferenceCollection.com
// Licensed under the MIT License
// ---------------------------------------------------------------------------------

// TABLE OF CONTENTS
// -----------------
// 1.  Introduction to Rust
// 2.  Basic Syntax and Structure
// 3.  Data Types and Variables
// 4.  Ownership and Borrowing
// 5.  Control Flow
// 6.  Functions and Methods
// 7.  Structs and Enums
// 8.  Collections
// 9.  Error Handling
// 10. Traits and Generics
// 11. Lifetimes
// 12. Modules and Crates
// 13. Testing
// 14. Concurrency
// 15. Smart Pointers
// 16. Macros
// 17. Unsafe Rust
// 18. Advanced Topics
// 19. Common Rust Patterns
// 20. Performance and Optimization

// ---------------------------------------------------------------------------------
// 1. Introduction to Rust
// ---------------------------------------------------------------------------------

// Rust is a systems programming language that emphasizes safety, concurrency, and 
// performance. It achieves memory safety without garbage collection through its 
// unique ownership system and provides zero-cost abstractions for building reliable
// and efficient software.

// Key Features:
// - Memory Safety: Prevents common programming errors like null pointer dereferencing,
//   buffer overflows, and data races at compile time
// - Zero-cost Abstractions: High-level features that compile to efficient low-level code
// - Concurrency: Safe concurrent programming through ownership and type system
// - Performance: C-like performance with modern language features
// - Reliability: Strong type system and compile-time guarantees
// - Modern Tooling: Integrated package manager (Cargo), documentation generator (rustdoc),
//   and formatting tool (rustfmt)

// Getting Started:
// 1. Install Rust:
//    - Visit https://rustup.rs/
//    - Follow installation instructions for your platform
// 2. Verify installation:
//    - Run `rustc --version` in terminal
// 3. Create new project:
//    - Run `cargo new project_name`
//    - CD into project directory
// 4. Build and run:
//    - Use `cargo build` to compile
//    - Use `cargo run` to compile and execute
// 5. Package management:
//    - Use `cargo add package_name` to add dependencies
//    - Edit Cargo.toml for manual dependency management

// Basic Project Structure:
// project_name/
// ├── Cargo.toml      // Project metadata and dependencies
// ├── src/
// │   └── main.rs     // Main entry point
// └── target/         // Build artifacts

// Example of a basic Rust program:
fn main() {
    println!("Hello, Rust!");
}

// ---------------------------------------------------------------------------------
// 2. Basic Syntax and Structure
// ---------------------------------------------------------------------------------

// Rust programs consist of functions, statements, and expressions. The main function
// is the entry point of every executable Rust program. The language emphasizes 
// explicit over implicit behavior and provides strong static typing with type inference.

// Comments:
// - Single-line comments start with //
// - Multi-line comments use /* ... */
// - Documentation comments use /// or //! (generate documentation)

/// This is a documentation comment that generates documentation for the following item
fn documented_function() {
    println!("This function has documentation!");
}

// Statements and Expressions:
// - Statements perform actions but don't return values
// - Expressions evaluate to a value
// - Last expression in a block becomes its return value

fn expression_example() {
    let x = 5;          // Statement
    let y = {           // Expression block
        let z = 3;
        z + 1           // Expression (returns 4)
    };
    println!("y is: {}", y);
}

// Variables:
// - Declared using 'let'
// - Immutable by default
// - Type inference available
// - Explicit type annotations use ':'

let immutable = 42;             // Immutable variable
let mut mutable = 42;           // Mutable variable
let typed: i32 = 42;           // Explicit type annotation
let inferred = 42;             // Type inferred as i32

// Constants:
// - Declared using 'const'
// - Must have type annotation
// - Value must be known at compile time

const MAX_POINTS: u32 = 100_000;

// ---------------------------------------------------------------------------------
// 3. Data Types and Variables
// ---------------------------------------------------------------------------------

// Rust is statically typed, meaning all variables must have known types at compile time.
// The compiler can often infer types, but explicit annotations are sometimes needed.
// Understanding Rust's type system is crucial for writing efficient and safe code.

// Scalar Types:
// ------------

// Integers:
let signed: i32 = -42;         // Signed 32-bit integer
let unsigned: u32 = 42;        // Unsigned 32-bit integer
let byte: u8 = b'A';           // Byte (u8)

// Integer types:
// - Signed: i8, i16, i32, i64, i128, isize (pointer-sized)
// - Unsigned: u8, u16, u32, u64, u128, usize (pointer-sized)

// Integer literals:
let decimal = 98_222;          // Decimal
let hex = 0xff;                // Hexadecimal
let octal = 0o77;              // Octal
let binary = 0b1111_0000;      // Binary

// Floating-point:
let float32: f32 = 3.14;       // 32-bit float
let float64: f64 = 2.71828;    // 64-bit float (default)

// Boolean:
let boolean: bool = true;       // true or false

// Character:
let character: char = 'A';      // Unicode scalar value (4 bytes)

// Compound Types:
// -------------

// Tuples:
let tup: (i32, f64, char) = (500, 6.4, 'A');
let (x, y, z) = tup;           // Destructuring
let first = tup.0;             // Access by index

// Arrays:
let array: [i32; 5] = [1, 2, 3, 4, 5];  // Fixed-size array
let repeated = [3; 5];         // [3, 3, 3, 3, 3]

// Slices:
let slice = &array[1..4];      // Reference to part of array

// Strings:
let string_literal = "hello";   // String literal (&str)
let string = String::from("hello"); // Owned String

// Type Aliases:
type Distance = f64;           // Create type alias
let distance: Distance = 5.0;

// ---------------------------------------------------------------------------------
// 4. Ownership and Borrowing
// ---------------------------------------------------------------------------------

// Ownership is Rust's innovative approach to memory management, ensuring memory safety
// without garbage collection. It's based on a set of rules checked at compile time,
// preventing common programming errors like use-after-free and data races.

// Ownership Rules:
// 1. Each value has exactly one owner
// 2. Only one owner at a time
// 3. When owner goes out of scope, value is dropped

// Example of Ownership:
fn ownership_example() {
    let s1 = String::from("hello");    // s1 owns the string
    let s2 = s1;                       // Value moved to s2
    // println!("{}", s1);             // Error: s1 no longer valid
    println!("{}", s2);                // Works fine
}

// Borrowing:
// - References allow using a value without taking ownership
// - References are immutable by default
// - Only one mutable reference OR any number of immutable references at a time

// Immutable Borrowing:
fn calculate_length(s: &String) -> usize {
    s.len()
}

let s1 = String::from("hello");
let len = calculate_length(&s1);       // Borrow s1

// Mutable Borrowing:
fn change(s: &mut String) {
    s.push_str(", world");
}

let mut s = String::from("hello");
change(&mut s);

// Reference Rules:
// 1. References must always be valid (no dangling references)
// 2. References must be one of:
//    - One mutable reference
//    - Any number of immutable references
// 3. References must not outlive their referent

// ---------------------------------------------------------------------------------
// 5. Control Flow
// ---------------------------------------------------------------------------------

// Rust provides several control flow constructs for controlling program execution.
// These include conditional statements, loops, and pattern matching through the
// match expression.

// If Expressions:
let number = 7;

if number < 5 {
    println!("condition was true");
} else {
    println!("condition was false");
}

// If in a Let Statement:
let condition = true;
let number = if condition { 5 } else { 6 };

// Loops:
// Three types of loops: loop, while, and for

// Infinite Loop with Break:
let mut counter = 0;
let result = loop {
    counter += 1;
    if counter == 10 {
        break counter * 2;
    }
};

// While Loop:
let mut number = 3;
while number != 0 {
    println!("{}!", number);
    number -= 1;
}

// For Loop:
let a = [10, 20, 30, 40, 50];
for element in a.iter() {
    println!("the value is: {}", element);
}

// Range-based For Loop:
for number in 1..4 {
    println!("{}", number);
}

// Match Expression:
// Pattern matching with match is exhaustive and must cover all possibilities
let number = 6;
match number {
    1 => println!("One"),
    2 => println!("Two"),
    3..=5 => println!("Three to Five"),
    _ => println!("Something else"),
}

// ---------------------------------------------------------------------------------
// 6. Functions and Methods
// ---------------------------------------------------------------------------------

// Functions are the primary building blocks of Rust code. They can take parameters,
// return values, and serve as the core organizational unit of code. Methods are
// functions associated with a particular type.

// Basic Function:
fn greet(name: &str) {
    println!("Hello, {}!", name);
}

// Function with Return Value:
fn add(a: i32, b: i32) -> i32 {
    a + b       // Implicit return (no semicolon)
}

// Methods:
// Functions associated with a type, defined in impl blocks
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    // Associated function (static method)
    fn new(width: u32, height: u32) -> Rectangle {
        Rectangle { width, height }
    }

    // Method (takes &self)
    fn area(&self) -> u32 {
        self.width * self.height
    }

    // Mutable method
    fn resize(&mut self, width: u32, height: u32) {
        self.width = width;
        self.height = height;
    }
}

// ---------------------------------------------------------------------------------
// 7. Structs and Enums
// ---------------------------------------------------------------------------------

// Structs and enums are the building blocks for creating custom data types in Rust.
// They allow you to create complex data structures that group related data together.

// Regular struct:
struct User {
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}

// Creating struct instance:
let user1 = User {
    email: String::from("someone@example.com"),
    username: String::from("someusername123"),
    active: true,
    sign_in_count: 1,
};

// Tuple structs:
struct Color(i32, i32, i32);
struct Point(i32, i32, i32);

// Unit structs:
struct AlwaysEqual;

// Enums:
// Define a type by enumerating its possible variants
enum IpAddr {
    V4(u8, u8, u8, u8),
    V6(String),
}

// Using enums with match:
let home = IpAddr::V4(127, 0, 0, 1);

match home {
    IpAddr::V4(a, b, c, d) => println!("{}.{}.{}.{}", a, b, c, d),
    IpAddr::V6(addr) => println!("{}", addr),
}

// Option enum:
// Built-in enum for handling nullable values
let some_number = Some(5);
let absent_number: Option<i32> = None;

// ---------------------------------------------------------------------------------
// 8. Collections
// ---------------------------------------------------------------------------------

// Rust's standard library includes several collection types that provide ways to
// store multiple values. Unlike arrays, these collections are stored on the heap
// and can grow or shrink at runtime.

// Vectors:
// Growable arrays
let mut vec: Vec<i32> = Vec::new();
vec.push(1);
vec.push(2);

// Vector with initial values:
let vec = vec![1, 2, 3];

// Accessing elements:
let third: &i32 = &vec[2];
let third: Option<&i32> = vec.get(2);

// Strings:
// UTF-8 encoded, growable text
let mut s = String::from("hello");
s.push_str(", world!");

// Hash Maps:
use std::collections::HashMap;

let mut scores = HashMap::new();
scores.insert(String::from("Blue"), 10);
scores.insert(String::from("Yellow"), 50);

// Accessing values:
let team_name = String::from("Blue");
let score = scores.get(&team_name);

// Updating values:
scores.entry(String::from("Blue")).or_insert(50);

// ---------------------------------------------------------------------------------
// 9. Error Handling
// ---------------------------------------------------------------------------------

// Rust groups errors into two categories: recoverable errors using Result<T, E>
// and unrecoverable errors using panic!. This approach ensures robust error handling
// while maintaining program reliability.

// Result enum:
enum Result<T, E> {
    Ok(T),    // Success case with value of type T
    Err(E),   // Error case with error of type E
}

// Example using Result:
fn divide(a: f64, b: f64) -> Result<f64, String> {
    if b == 0.0 {
        Err(String::from("Division by zero"))
    } else {
        Ok(a / b)
    }
}

// Using match with Result:
match divide(10.0, 2.0) {
    Ok(result) => println!("Result: {}", result),
    Err(e) => println!("Error: {}", e),
}

// Using ? operator for error propagation:
fn read_username_from_file() -> Result<String, std::io::Error> {
    let mut file = std::fs::File::open("username.txt")?;
    let mut username = String::new();
    file.read_to_string(&mut username)?;
    Ok(username)
}

// Panic:
// For unrecoverable errors
// panic!("crash and burn");

// Custom error types:
#[derive(Debug)]
struct AppError {
    kind: String,
    message: String,
}

// ---------------------------------------------------------------------------------
// 10. Traits and Generics
// ---------------------------------------------------------------------------------

// Traits define shared behavior across types, similar to interfaces in other languages.
// Generics provide a way to write flexible, reusable code that works with different types
// while maintaining type safety.

// Traits: Define shared behavior
trait Summary {
    fn summarize(&self) -> String;
    
    // Default implementation
    fn default_summary(&self) -> String {
        String::from("(Read more...)")
    }
}

// Implementing a trait
struct NewsArticle {
    headline: String,
    location: String,
    author: String,
}

impl Summary for NewsArticle {
    fn summarize(&self) -> String {
        format!("{}, by {} ({})", self.headline, self.author, self.location)
    }
}

// Generic Functions with Trait Bounds
fn largest<T: PartialOrd>(list: &[T]) -> &T {
    let mut largest = &list[0];
    for item in list {
        if item > largest {
            largest = item;
        }
    }
    largest
}

// Generic Structs
struct Point<T> {
    x: T,
    y: T,
}

// ---------------------------------------------------------------------------------
// 11. Lifetimes
// ---------------------------------------------------------------------------------

// Lifetimes are Rust's way of ensuring that references are valid for the duration
// they're used. Every reference in Rust has a lifetime, which is the scope for
// which that reference is valid.

// Lifetime Annotation Syntax:
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}

// Struct with Lifetime Annotation:
struct ImportantExcerpt<'a> {
    part: &'a str,
}

// Lifetime Elision Rules:
// 1. Each parameter gets its own lifetime
// 2. If there is exactly one input lifetime, it is assigned to all outputs
// 3. If there is a &self parameter, its lifetime is assigned to all outputs

// ---------------------------------------------------------------------------------
// 12. Modules and Crates
// ---------------------------------------------------------------------------------

// Modules help organize code into logical units, while crates are the smallest
// amount of code that the Rust compiler considers at a time. Modules control
// privacy and provide namespace separation.

// Module Definition:
mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
        
        fn seat_at_table() {}
    }
}

// Using modules:
use crate::front_of_house::hosting;

// Re-exporting names:
pub use crate::front_of_house::hosting;

// Nested paths:
use std::{cmp::Ordering, io};

// The glob operator:
use std::collections::*;

// Creating a library crate:
// In lib.rs:
pub mod client;
pub mod network;

// ---------------------------------------------------------------------------------
// 13. Testing
// ---------------------------------------------------------------------------------

// Rust has built-in support for unit testing, integration testing, and
// documentation testing. Tests are functions annotated with the #[test] attribute.

// Unit Tests:
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }

    #[test]
    #[should_panic(expected = "panic message")]
    fn test_panic() {
        panic!("panic message");
    }
    
    #[test]
    fn larger_can_hold_smaller() {
        let larger = Rectangle { width: 8, height: 7 };
        let smaller = Rectangle { width: 5, height: 1 };
        assert!(larger.can_hold(&smaller));
    }
}

// Integration Tests:
// In tests/integration_test.rs:
use my_crate;

#[test]
fn it_adds_two() {
    assert_eq!(4, my_crate::add_two(2));
}

// Documentation Tests:
/// Adds one to the number given.
///
/// # Examples
///
/// ```
/// let arg = 5;
/// let answer = my_crate::add_one(arg);
/// assert_eq!(6, answer);
/// ```
pub fn add_one(x: i32) -> i32 {
    x + 1
}

// ---------------------------------------------------------------------------------
// 14. Concurrency
// ---------------------------------------------------------------------------------

// Rust's ownership and type systems guarantee thread safety and prevent data races.
// The language provides multiple tools for concurrent programming, including threads,
// message passing, and shared state concurrency.

// Threads:
use std::thread;
use std::time::Duration;

let handle = thread::spawn(|| {
    for i in 1..10 {
        println!("hi number {} from the spawned thread!", i);
        thread::sleep(Duration::from_millis(1));
    }
});

// Message Passing:
use std::sync::mpsc;

let (tx, rx) = mpsc::channel();

thread::spawn(move || {
    tx.send(String::from("hello")).unwrap();
});

println!("Got: {}", rx.recv().unwrap());

// Mutual Exclusion:
use std::sync::Mutex;

let m = Mutex::new(5);
{
    let mut num = m.lock().unwrap();
    *num = 6;
}

// ---------------------------------------------------------------------------------
// 15. Smart Pointers
// ---------------------------------------------------------------------------------

// Smart pointers are data structures that act like pointers but include additional
// metadata and capabilities. They often own the data they point to.

// Box<T>: Heap allocation
let b = Box::new(5);

// Rc<T>: Reference counting
use std::rc::Rc;

let rc = Rc::new(String::from("shared data"));
let rc2 = Rc::clone(&rc);

// RefCell<T>: Interior mutability
use std::cell::RefCell;

let data = RefCell::new(5);
*data.borrow_mut() = 6;

// Custom Smart Pointer:
struct CustomSmartPointer {
    data: String,
}

impl Drop for CustomSmartPointer {
    fn drop(&mut self) {
        println!("Dropping CustomSmartPointer with data `{}`!", self.data);
    }
}

// ---------------------------------------------------------------------------------
// 16. Macros
// ---------------------------------------------------------------------------------

// Macros are a way of writing code that writes other code, known as metaprogramming.
// Rust provides several types of macros: declarative macros and procedural macros.

// Declarative Macros:
macro_rules! say_hello {
    () => {
        println!("Hello!");
    };
    ($name:expr) => {
        println!("Hello, {}!", $name);
    };
}

// Using macros:
say_hello!();           // Prints: Hello!
say_hello!("Rust");     // Prints: Hello, Rust!

// Procedural Macros:
// These are more complex and require a separate crate
#[derive(Debug)]     // Example of a derive macro
struct Point {
    x: i32,
    y: i32,
}

// ---------------------------------------------------------------------------------
// 17. Unsafe Rust
// ---------------------------------------------------------------------------------

// Unsafe Rust exists to perform operations that the compiler cannot guarantee are safe.
// It's necessary for low-level programming and interfacing with other languages.

// Unsafe blocks allow:
// 1. Dereferencing raw pointers
// 2. Calling unsafe functions
// 3. Implementing unsafe traits
// 4. Mutating static variables
// 5. Accessing fields of unions

unsafe fn dangerous() {
    // Unsafe operations here
}

unsafe {
    dangerous();
}

// Raw Pointers:
let mut num = 5;
let r1 = &num as *const i32;
let r2 = &mut num as *mut i32;

unsafe {
    println!("r1 is: {}", *r1);
    *r2 = 6;
}

// ---------------------------------------------------------------------------------
// 18. Advanced Topics
// ---------------------------------------------------------------------------------

// Advanced Type System Features:

// Type Aliases:
type Kilometers = i32;
let distance: Kilometers = 5;

// Never Type:
fn bar() -> ! {
    panic!("This function never returns!");
}

// Sized Trait:
fn generic<T: ?Sized>(t: &T) {
    // This function can take unsized types
}

// Associated Types:
trait Container {
    type Item;
    fn get(&self) -> &Self::Item;
}

// ---------------------------------------------------------------------------------
// 19. Common Rust Patterns
// ---------------------------------------------------------------------------------

// Builder Pattern:
struct Builder {
    field1: Option<i32>,
    field2: Option<String>,
}

impl Builder {
    fn new() -> Builder {
        Builder {
            field1: None,
            field2: None,
        }
    }

    fn field1(mut self, value: i32) -> Builder {
        self.field1 = Some(value);
        self
    }

    fn field2(mut self, value: String) -> Builder {
        self.field2 = Some(value);
        self
    }
}

// RAII (Resource Acquisition Is Initialization):
struct Resource {
    data: String,
}

impl Drop for Resource {
    fn drop(&mut self) {
        println!("Cleaning up resource!");
    }
}

// ---------------------------------------------------------------------------------
// 20. Performance and Optimization
// ---------------------------------------------------------------------------------

// Zero-Cost Abstractions:
fn zero_cost_example<T: Iterator<Item = i32>>(iter: T) -> i32 {
    iter.filter(|&x| x > 0)
        .map(|x| x * 2)
        .sum()
}

// Memory Layout Optimization:
#[repr(C)]
struct Aligned {
    a: u8,
    b: u32,
    c: u16,
}

// Compile-Time Evaluation:
const fn compile_time_fn(x: u32) -> u32 {
    x * 2
}

const COMPUTED: u32 = compile_time_fn(21);

// Happy coding