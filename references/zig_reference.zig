// --------------------------------------------------------------------------------
// Zig Reference and Guide
//
// ReferenceCollection.com
// Licensed under the MIT License
// --------------------------------------------------------------------------------

// TABLE OF CONTENTS
// -----------------
// 1. Introduction to Zig
// 2. Basic Syntax and Structure
// 3. Data Types and Variables
// 4. Operators and Expressions
// 5. Control Flow
// 6. Functions
// 7. Pointers and Memory Management
// 8. Structs and Unions
// 9. Enums and Optionals
// 10. Error Handling
// 11. Arrays and Slices
// 12. Strings and Text
// 13. Generics and Compile-Time Programming
// 14. Testing and Debugging
// 15. Concurrency and Asynchronous Programming
// 16. Interfacing with C
// 17. Metaprogramming
// 18. Building and Package Management
// 19. Advanced Memory Management

// --------------------------------------------------------------------------------
// 1. Introduction to Zig
// --------------------------------------------------------------------------------

// Zig is a modern, general-purpose programming language designed for robustness,
// optimality, and maintainability. It emphasizes explicit control over memory
// and resources, making it suitable for systems programming, embedded development,
// and high-performance applications. Zig aims to be a simple, yet powerful language
// that enables developers to write efficient and reliable software.

// Key features of Zig:
// - Manual memory management without garbage collection
// - Compile-time execution and metaprogramming
// - First-class support for error handling
// - Interoperability with C
// - Simple and consistent syntax

// Zig is designed to be a language that is easy to learn and use, while also being
// powerful enough to handle complex tasks. It is a great choice for developers who
// want to have fine-grained control over their code and resources.

// --------------------------------------------------------------------------------
// 2. Basic Syntax and Structure
// --------------------------------------------------------------------------------

// Zig programs are organized into files with the `.zig` extension.
// A basic Zig program consists of the following:

// - Comments: Zig uses `//` for single-line comments and `//!` for documentation comments.
// - Functions: Code is organized into functions, with `main` being the entry point.
// - Statements: Functions contain statements, which are instructions for the compiler to execute.
// - Semicolons: Semicolons `;` are used to end statements.
// - Blocks: Code is organized into blocks using curly braces `{}`.
// - Namespaces: Zig utilizes namespaces for organizing code, such as `std` for the standard library.

// Example of a simple Zig program:
const std = @import("std");

pub fn main() void {
    // This is a single-line comment.
    const message: []const u8 = "Hello, Zig!"; // Declare a constant string
    std.debug.print("{s}\n", .{message}); // Print the message to the console
}

// Explanation:
//   - `const std = @import("std");`: Imports the standard library module.
//   - `fn main() void` declares the main function, the entry point of the program. 
//   - `pub` makes it public.
//   - `void` indicates that the function does not return any value.
//   - `const message: []const u8 = "Hello, Zig!";` constant of type slice of constant u8 (bytes) and assigns it a string literal.
//   - `std.debug.print("{s}\n", .{message});` uses the standard library's debug print function to output the message to the console.
//      - `{s}` is a format specifier for a string.
//      - `.{message}` is a tuple containing the argument to be formatted.

// Running a Zig program:
//   - Save the code in a file named `main.zig`.
//   - Compile the code using the Zig compiler: `zig build-exe main.zig`.
//   - Run the executable: `./main`.

// --------------------------------------------------------------------------------
// 3. Data Types and Variables
// --------------------------------------------------------------------------------

// Zig is a statically-typed language, meaning that the type of a variable must
// be known at compile time. Zig provides a variety of built-in data types:

// - Integers: Signed (`i8`, `i16`, `i32`, `i64`, `i128`) and unsigned (`u8`, `u16`, `u32`, `u64`, `u128`).
//   `isize` and `usize` are platform-dependent sized integer types.
// - Floating-point numbers: `f32`, `f64`.
// - Boolean: `bool` (true or false).
// - Void: `void` (represents no value).
// - Characters: `u8` (single byte).
// - Pointers: `*T` (pointer to a value of type `T`).
// - Arrays: `[N]T` (array of `N` elements of type `T`).
// - Slices: `[]T` (dynamically sized view into an array of `T`).
// - Structs: `struct { ... }` (collection of named fields).
// - Unions: `union { ... }` (a value that can hold different types).
// - Enums: `enum { ... }` (a set of named values).
// - Optionals: `?T` (a value of type `T` or null).

// Variable declaration:
// - `var <name>: <type> = <value>;` (mutable variable).
// - `const <name>: <type> = <value>;` (immutable variable).

// Example of variable declarations:
pub fn main() void {
    var age: i32 = 30; // Mutable integer variable
    const pi: f64 = 3.14159; // Immutable floating-point variable
    const is_valid: bool = true; // Immutable boolean variable
    var name: [10]u8 = "Zig"; // Mutable array of bytes
    name[3] = '!'; // Modify array
    std.debug.print("Age: {d}, Pi: {f}, Valid: {any}, Name: {s}\n", .{age, pi, is_valid, name[0..]}); // Prints the variables with formatting
}

// --------------------------------------------------------------------------------
// 4. Operators and Expressions
// --------------------------------------------------------------------------------

// Zig provides a variety of operators for performing calculations and comparisons.
// Expressions are combinations of values, variables, and operators that evaluate to a value.

// Arithmetic operators:
// - `+` (addition), `-` (subtraction), `*` (multiplication), `/` (division), `%` (modulo)

// Comparison operators:
// - `==` (equal to), `!=` (not equal to), `<` (less than), `>` (greater than), `<=` (less than or equal to), `>=` (greater than or equal to)

// Logical operators:
// - `and` (logical AND), `or` (logical OR), `!` (logical NOT)

// Bitwise operators:
// - `&` (bitwise AND), `|` (bitwise OR), `^` (bitwise XOR), `~` (bitwise NOT), `<<` (left shift), `>>` (right shift)

// Assignment operators:
// - `=` (assignment), `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=` (compound assignment)

// Example of operators and expressions:
pub fn main() void {
    var a: i32 = 10;
    var b: i32 = 5;
    const sum: i32 = a + b; // Addition
    const difference: i32 = a - b; // Subtraction
    const product: i32 = a * b; // Multiplication
    const quotient: i32 = a / b; // Division
    const remainder: i32 = a % b; // Modulo
    const is_equal: bool = a == b; // Equality comparison
    const is_greater: bool = a > b; // Greater than comparison
    const logical_and: bool = true and false; // Logical AND
    const bitwise_and: i32 = a & b; // Bitwise AND
    a += 5; // Compound assignment
    std.debug.print("Sum: {d}, Diff: {d}, Prod: {d}, Quo: {d}, Rem: {d}\n", .{sum, difference, product, quotient, remainder});
    std.debug.print("Equal: {any}, Greater: {any}, And: {any}, Bitwise And: {d}, a: {d}\n", .{is_equal, is_greater, logical_and, bitwise_and, a});
}

// Operators have a precedence that determines the order in which they are evaluated

// --------------------------------------------------------------------------------
// 5. Control Flow
// --------------------------------------------------------------------------------

// Zig provides several control flow statements to control the execution of code:

// - `if` statement: Executes a block of code if a condition is true.
// - `else` statement: Executes a block of code if the `if` condition is false.
// - `else if` statement: Executes a block of code if the preceding `if` or `else if` condition is false and the current condition is true.
// - `while` loop: Executes a block of code repeatedly as long as a condition is true.
// - `for` loop: Executes a block of code for each element in a range or collection.
// - `break` statement: Terminates the innermost loop.
// - `continue` statement: Skips the rest of the current iteration of the innermost loop and proceeds to the next iteration.
// - `switch` statement: Executes a block of code based on the value of an expression.

// Example of control flow statements:
pub fn main() void {
    var x: i32 = 10;

    // if statement
    if (x > 5) {
        std.debug.print("x is greater than 5\n", .{});
    } else {
        std.debug.print("x is not greater than 5\n", .{});
    }

    // while loop
    var i: i32 = 0;
    while (i < 5) {
        std.debug.print("while loop: i = {d}\n", .{i});
        i += 1;
    }

    // for loop
    for (0..5) |j| {
        std.debug.print("for loop: j = {d}\n", .{j});
    }

    // switch statement
    const day: i32 = 3;
    switch (day) {
        1 => std.debug.print("Monday\n", .{}),
        2 => std.debug.print("Tuesday\n", .{}),
        3 => std.debug.print("Wednesday\n", .{}),
        else => std.debug.print("Other day\n", .{}),
    }
}

// --------------------------------------------------------------------------------
// 6. Functions
// --------------------------------------------------------------------------------

// Functions are blocks of code that perform a specific task. They can take
// arguments and return a value.

// Function declaration syntax:
// `fn <name>(<arg1>: <type1>, <arg2>: <type2>, ...) <return_type> { ... }`

// Example of functions:
fn add(a: i32, b: i32) i32 {
    return a + b;
}

fn greet(name: []const u8) void {
    std.debug.print("Hello, {s}!\n", .{name});
}

pub fn main() void {
    const result: i32 = add(5, 3);
    std.debug.print("Sum: {d}\n", .{result});
    greet("Zig User");
}

// --------------------------------------------------------------------------------
// 7. Pointers and Memory Management
// --------------------------------------------------------------------------------

// Zig is a manual memory management language, meaning that you are responsible for
// allocating and deallocating memory. Pointers are used to access memory locations directly.

// Pointer types:
// - `*T`: A raw pointer to a value of type `T`.
// - `[*]T`: A pointer to an array of `T`.
// - `?*T`: An optional pointer to a value of type `T`.

// Memory allocation:
// - Use the `std.heap.page_allocator` to allocate memory.
// - Use `allocator.alloc(T)` to allocate a single value of type `T`.
// - Use `allocator.alloc(T, n)` to allocate an array of `n` values of type `T`.
// - Use `allocator.free(ptr)` to deallocate memory pointed to by `ptr`.

// Example of pointers and memory allocation:
const std = @import("std");
pub fn main() void {
    var allocator = std.heap.page_allocator;

    // Allocate an integer
    var ptr: ?*i32 = allocator.alloc(i32);
    if (ptr) |p| {
        p.* = 100; // Dereference pointer and assign a value
        std.debug.print("Value at ptr: {d}\n", .{p.*});
        allocator.free(p);
    } else {
        std.debug.print("Failed to allocate memory.\n", .{});
    }


    // Allocate an array of integers
    const array_len: usize = 5;
    var array_ptr: ?*[]i32 = allocator.alloc([]i32, array_len);
    if (array_ptr) |arr_p| {
        for (0..array_len) |i| {
            arr_p[i] = @intCast(i32, i);
        }
        std.debug.print("Array: {any}\n", .{arr_p});
        allocator.free(arr_p);
    } else {
        std.debug.print("Failed to allocate array.\n", .{});
    }
}

// --------------------------------------------------------------------------------
// 8. Structs and Unions
// --------------------------------------------------------------------------------

// Structs are used to group related data together into a single unit.
// Unions are used to hold a value of different types at different times, but only one type at a time.

// Struct declaration syntax:
// `struct <name> { <field1>: <type1>, <field2>: <type2>, ... }`

// Union declaration syntax:
// `union <name> { <field1>: <type1>, <field2>: <type2>, ... }`

// Example of structs and unions:
const std = @import("std");

// Struct
struct Point {
    x: f32,
    y: f32,
}

// Union
union Data {
    int_val: i32,
    float_val: f32,
    string_val: []const u8,
}

pub fn main() void {
    // Create a struct
    var point: Point = Point{ .x = 1.0, .y = 2.0 };
    std.debug.print("Point: x = {f}, y = {f}\n", .{point.x, point.y});

    // Create a union
    var data: Data = Data{ .int_val = 10 };
    std.debug.print("Data (int): {d}\n", .{data.int_val});
    data = Data{ .float_val = 3.14 };
    std.debug.print("Data (float): {f}\n", .{data.float_val});
    data = Data{ .string_val = "hello" };
    std.debug.print("Data (string): {s}\n", .{data.string_val});
}

// --------------------------------------------------------------------------------
// 9. Enums and Optionals
// --------------------------------------------------------------------------------

// Enums are used to define a set of named values.
// Optionals are used to represent values that may or may not be present (null).

// Enum declaration syntax:
// `enum <name> { <value1>, <value2>, ... }`

// Optional type:
// `?T` (represents a value of type `T` or null)

// Example of enums and optionals:
const std = @import("std");

// Enum
enum Color {
    Red,
    Green,
    Blue,
}

pub fn main() void {
    // Enum usage
    const color: Color = .Green;
    switch (color) {
        .Red => std.debug.print("Color is Red\n", .{}),
        .Green => std.debug.print("Color is Green\n", .{}),
        .Blue => std.debug.print("Color is Blue\n", .{}),
    }

    // Optional usage
    var optional_value: ?i32 = 10;
    if (optional_value) |value| {
        std.debug.print("Optional value: {d}\n", .{value});
    } else {
        std.debug.print("Optional value is null\n", .{});
    }

    optional_value = null;
    if (optional_value) |value| {
        std.debug.print("Optional value: {d}\n", .{value});
    } else {
        std.debug.print("Optional value is null\n", .{});
    }
}

// --------------------------------------------------------------------------------
// 10. Error Handling
// --------------------------------------------------------------------------------

// Zig uses explicit error handling, which means that errors are treated as first-class
// values and must be handled explicitly.

// Error type:
// `error { <error1>, <error2>, ... }`

// Error return type:
// `!<error_set>T` (represents a value of type `T` or an error from `error_set`)

// Error handling:
// - Use `try` to propagate errors.
// - Use `catch` to handle errors.
// - Use `orelse` to provide a default value if an error occurs.

// Example of error handling:
const std = @import("std");

fn divide(a: i32, b: i32) !error{DivideByZero}i32 {
    if (b == 0) {
        return error.DivideByZero;
    }
    return a / b;
}

pub fn main() void {
    const result1 = divide(10, 2) catch |err| {
        std.debug.print("Error: {any}\n", .{err});
        return 0;
    };
    std.debug.print("Result 1: {d}\n", .{result1});

    const result2 = try divide(10, 0);
    std.debug.print("Result 2: {d}\n", .{result2});
    // The above will print the error, and exit the program

    const result3 = divide(10, 2) orelse 0;
    std.debug.print("Result 3: {d}\n", .{result3});

    const result4 = divide(10, 0) orelse 0;
    std.debug.print("Result 4: {d}\n", .{result4});
}

// --------------------------------------------------------------------------------
// 11. Arrays and Slices
// --------------------------------------------------------------------------------

// Arrays are fixed-size collections of elements of the same type.
// Slices are dynamically sized views into arrays.

// Array type:
// `[N]T` (array of `N` elements of type `T`)

// Slice type:
// `[]T` (slice of elements of type `T`)

// Example of arrays and slices:
const std = @import("std");

pub fn main() void {
    // Array declaration
    var array: [5]i32 = .{1, 2, 3, 4, 5};
    std.debug.print("Array: {any}\n", .{array});

    // Slice creation
    const slice: []i32 = array[1..4];
    std.debug.print("Slice: {any}\n", .{slice});

    // Modify slice
    slice[0] = 10;
    std.debug.print("Modified array: {any}\n", .{array});
    std.debug.print("Modified slice: {any}\n", .{slice});

    // Iterate over slice
    for (slice) |value, index| {
        std.debug.print("Slice[{d}]: {d}\n", .{index, value});
    }
}

// --------------------------------------------------------------------------------
// 12. Strings and Text
// --------------------------------------------------------------------------------

// Zig uses slices of bytes (`[]u8`) to represent strings. String literals are
// constant slices of bytes.

// String literals:
// `"string"` (constant slice of bytes)

// String manipulation:
// - Use `std.mem` for memory manipulation.
// - Use `std.fmt` for string formatting.

// Example of strings and text:
const std = @import("std");

pub fn main() void {
    // String literal
    const message: []const u8 = "Hello, Zig!";
    std.debug.print("Message: {s}\n", .{message});

    // String concatenation (requires allocation)
    var allocator = std.heap.page_allocator;
    const part1: []const u8 = "Hello";
    const part2: []const u8 = ", world!";
    const combined = try std.mem.concat(allocator, u8, .{part1, part2});
    defer allocator.free(combined);
    std.debug.print("Combined: {s}\n", .{combined});


    // String formatting
    const name: []const u8 = "Zig User";
    const age: i32 = 30;
    std.debug.print("Name: {s}, Age: {d}\n", .{name, age});
}

// --------------------------------------------------------------------------------
// 13. Generics and Compile-Time Programming
// --------------------------------------------------------------------------------

// Zig supports generics (compile-time polymorphism) using comptime parameters.
// Compile-time programming allows you to execute code at compile time.

// Generic function declaration:
// `fn <name>(comptime <param>: <type>, ...) <return_type> { ... }`

// Compile-time execution:
// Use `comptime` keyword or `@compileLog`

// Example of generics and compile-time programming:
const std = @import("std");

// Generic function
fn printValue(comptime T: type, value: T) void {
    std.debug.print("Value: {any}\n", .{value});
}

// Compile-time calculation
const compile_time_value: i32 = comptime 2 * 3;

pub fn main() void {
    // Generic function usage
    printValue(i32, 10);
    printValue(f32, 3.14);
    printValue([]const u8, "Hello");

    // Compile-time value
    std.debug.print("Compile-time value: {d}\n", .{compile_time_value});

    // Compile-time error
    // const compile_time_error = comptime @compileError("This is a compile error"); // Uncomment to see the error
}

// --------------------------------------------------------------------------------
// 14. Testing and Debugging
// --------------------------------------------------------------------------------

// Zig provides built-in support for testing using the `test` keyword.
// Debugging can be done using `std.debug.print` and debuggers.

// Test function declaration:
// `test "<test_name>" { ... }`

// Example of testing and debugging:
const std = @import("std");

fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "add function test" {
    const result = add(2, 3);
    try std.testing.expectEqual(5, result);
}

test "add function negative test" {
    const result = add(-2, -3);
    try std.testing.expectEqual(-5, result);
}

pub fn main() void {
    const result = add(5, 7);
    std.debug.print("Result: {d}\n", .{result});
}

// - To run the tests, use `zig test <filename>.zig`

// --------------------------------------------------------------------------------
// 15. Concurrency and Asynchronous Programming
// --------------------------------------------------------------------------------

// Zig supports concurrency using threads and asynchronous programming using
// async functions and await.

// Thread creation:
// Use `std.Thread` to create and manage threads.

// Async function declaration:
// `async fn <name>(...) <return_type> { ... }`

// Await expression:
// `await <async_expression>`

// Example of concurrency and asynchronous programming:
const std = @import("std");
const print = std.debug.print;

// Async function
async fn asyncTask(id: i32) i32 {
    print("Async task {d} started\n", .{id});
    await std.time.sleep(1000000); // Sleep for 1 second
    print("Async task {d} finished\n", .{id});
    return id * 2;
}

// Thread function
fn threadTask(id: i32) void {
    print("Thread task {d} started\n", .{id});
    std.time.sleep(1000000); // Sleep for 1 second
    print("Thread task {d} finished\n", .{id});
}

pub fn main() !void {
    var allocator = std.heap.page_allocator;

    // Create and start a thread
    var thread = try std.Thread.spawn(allocator, threadTask, .{1});
    defer thread.join();

    // Call async functions
    const result1 = await asyncTask(1);
    print("Async result 1: {d}\n", .{result1});
    const result2 = await asyncTask(2);
    print("Async result 2: {d}\n", .{result2});
}

// --------------------------------------------------------------------------------
// 16. Interfacing with C
// --------------------------------------------------------------------------------

// Zig provides seamless interoperability with C code. You can import C headers
// and call C functions directly from Zig.

// Import C headers:
// `@cImport(<header_file>)`

// Call C functions:
// Call C functions as if they were regular Zig functions.

// Example of interfacing with C:
const std = @import("std");

// Import C standard library
const c = @cImport({
    @cInclude("stdio.h");
});

pub fn main() void {
    // Call C function
    c.printf("Hello from C!\n");
    const message: []const u8 = "Hello from Zig!";
    c.printf("Message from Zig: %s\n", message.ptr);
}

// --------------------------------------------------------------------------------
// 17. Metaprogramming
// --------------------------------------------------------------------------------

// Zig's metaprogramming capabilities allow you to write code that manipulates
// other code at compile time. This is done using comptime and reflection.

// Compile-time reflection:
// Use `@typeInfo` to get information about types.

// Example of metaprogramming:
const std = @import("std");

fn printTypeInfo(comptime T: type) void {
    const info = @typeInfo(T);
    // Print the type name using @typeName.
    std.debug.print("Type: {s}\n", .{@typeName(T)});
    // Print the type kind using @tagName.
    std.debug.print("Kind: {s}\n", .{@tagName(info.kind)});
    switch (info.kind) {
        // If the type is an integer, print the number of bits.
        .Int => std.debug.print("Bits: {d}\n", .{info.Int.bits}),
        // If the type is a float, print the number of bits.
        .Float => std.debug.print("Bits: {d}\n", .{info.Float.bits}),
        else => {},
    }
}

pub fn main() void {
    printTypeInfo(i32);
    printTypeInfo(f64);
    printTypeInfo(bool);
}

// --------------------------------------------------------------------------------
// 18. Building and Package Management
// --------------------------------------------------------------------------------

// Zig uses a build system to compile and manage projects. The build system is
// defined in a `build.zig` file.

// Basic build.zig structure:
// `pub fn build(b: *std.Build) void { ... }`

// Package management:
// Zig does not have a central package manager. Packages are managed using git and
// imported using the `std.build.addModule` function in `build.zig`.

// Example `build.zig` file:
// ```zig
// const std = @import("std");
//
// pub fn build(b: *std.Build) void {
//     const target = b.standardTargetOptions(.{});
//     const optimize = b.standardOptimizeOption(.{});
//     
//     // creates an executable 
//     const exe = b.addExecutable(.{
//         .name = "my-project",
//         .root_source_file = .{ .path = "src/main.zig" },
//         .target = target,
//         .optimize = optimize,
//     });
//
//     // installs the executable
//     b.installArtifact(exe);
// }
// ```
//
// Example of building a project:
// `zig build`

// --------------------------------------------------------------------------------
// 19. Advanced Memory Management
// --------------------------------------------------------------------------------

// Zig provides fine-grained control over memory management. This includes custom
// allocators, arenas, and more.

// Custom allocators:
// Implement the `std.mem.Allocator` interface.

// Arenas:
// Use `std.mem.ArenaAllocator` for efficient allocation within a specific region.

// Example of advanced memory management:
const std = @import("std");

// Define a Custom allocator struct.
pub const MyAllocator = struct {
    // The underlying allocator.
    allocator: std.mem.Allocator,
    // Track the total number of allocated elements.
    allocated_count: usize,

    // Initialize the custom allocator.
    pub fn init(allocator: std.mem.Allocator) MyAllocator {
        return .{
            .allocator = allocator,
            .allocated_count = 0,
        };
    }

    // Allocate memory for a given type and increment the allocated count.
    pub fn alloc(self: *MyAllocator, comptime T: type, count: usize) ![]T {
        self.allocated_count += count;
        return self.allocator.alloc(T, count);
    }

    // Free allocated memory.
    pub fn free(self: *MyAllocator, ptr: []const u8) void {
        self.allocator.free(ptr);
    }
};

// Main function, the entry point of the program.
pub fn main() void {
    // Initialize the custom allocator with the page allocator.
    var allocator = MyAllocator.init(std.heap.page_allocator);
    // Allocate an array of 5 i32 integers using the custom allocator.
    var numbers = try allocator.alloc(i32, 5);
    // defer is used to schedule code to be executed at the end of the current scope.
    // Ensure the allocated memory is freed when the function exits.
    defer allocator.free(numbers);
    // Iterate over the allocated array and set each element to its index.
    for (numbers, 0..) |*num, i| {
        num.* = @intCast(i32, i);
    }
    // Print the total number of allocated elements.
    std.debug.print("Allocated count: {}\n", .{allocator.allocated_count});
    // Iterate over the allocated array and print each element.
    for (numbers) |num| {
        std.debug.print("Number: {}\n", .{num});
    }
}

// Zig also provides features like arena allocators, which can be used to
// allocate memory in a contiguous block and deallocate it all at once.

// Example of using an arena allocator:
// - `std.heap.ArenaAllocator`: An arena allocator.
// - `arena.allocator()`: Gets an allocator from the arena.
// - `arena.deinit()`: Deallocates all memory allocated by the arena.

pub fn main() void {
    // Initialize an arena allocator using the page allocator.
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // Ensure the arena allocator is deinitialized when the function exits.
    defer arena.deinit();
    // Get the allocator from the arena.
    var allocator = arena.allocator();
    // Allocate an array of 5 i32 integers using the arena's allocator.
    var numbers = try allocator.alloc(i32, 5);
    // Ensure the allocated memory is freed when the function exits.
    defer allocator.free(numbers);
    // Iterate over the allocated array and set each element to its index.
    for (numbers, 0..) |*num, i| {
        num.* = @intCast(i32, i);
    }
    // Iterate over the allocated array and print each element.
    for (numbers) |num| {
        std.debug.print("Number: {}\n", .{num});
    }
}

// Happy coding!