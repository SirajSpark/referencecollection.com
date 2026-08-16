// ---------------------------------------------------------------------------------
// JavaScript Reference and Guide
//
// ReferenceCollection.com
// Licensed under the MIT License
// ---------------------------------------------------------------------------------

// TABLE OF CONTENTS
// -----------------
// 1.  Introduction
// 2.  Basic Syntax and Structure
// 3.  Modules
// 4.  Variables and Data Types
// 5.  Operators
// 6.  Control Flow Statements
// 7.  Arrays
// 8.  Functions
// 9.  Objects
// 10. DOM Manipulation
// 11. Events
// 12. Asynchronous JavaScript
// 13. Error Handling
// 14. Classes
// 15. Iterators and Generators
// 16. Debugging

// ---------------------------------------------------------------------------------
// 1. Introduction
// ---------------------------------------------------------------------------------

// JavaScript is a versatile, high-level, dynamic programming language primarily
// known for adding interactivity to websites. It's a core technology of the web,
// alongside HTML and CSS.  It is also used in server-side environments (Node.js),
// mobile app development (React Native), and even desktop applications (Electron).

// Key Features:
// - Dynamic Typing: Variables can hold different types of data
// - First-class Functions: Functions can be assigned to variables
// - Event-Driven: Responds to user actions and system events
// - Rich Ecosystem: Vast collection of libraries and frameworks
// - Cross-Platform: Runs in browsers, servers, and various environments
// - Multi-Paradigm: Supports procedural, object-oriented, and functional programming

// Getting Started:
// - No installation is required for browser-based JavaScript.
// - For server-side development, install Node.js (which includes npm, the Node 
//   Package Manager).
// - Use a text editor or IDE (Integrated Development Environment) like VS Code.
// - JavaScript code can be embedded in HTML files using `<script>` tags or linked 
//   as separate `.js` files.

// JavaScript Engine:
// A program that executes JavaScript code.  Popular engines include:
// - V8 (Chrome, Node.js, Edge)
// - SpiderMonkey (Firefox)
// - JavaScriptCore (Safari)

// ECMAScript:
// The standard upon which JavaScript is based. It defines the core features.
// New versions (ES6, ES2017, ES2020, etc.) introduce new features and improvements.  
// It's often referred to as "ES" followed by the year of release.

// ---------------------------------------------------------------------------------
// 2. Basic Syntax and Structure
// ---------------------------------------------------------------------------------

// JavaScript programs are made up of statements, expressions, and declarations.

// Basic Elements:
// - Statements: Instructions that perform actions.
// - Expressions: Produce values.
// - Variables: Named storage for data.
// - Functions: Reusable blocks of code.
// - Objects: Collections of related data and functions.

// Syntax Rules:
// - Case-Sensitive: `myVariable` and `myvariable` are distinct.
// - Semicolons:  Generally optional, but highly recommended to avoid ambiguity.
// - Comments: `//` for single-line, `/* ... */` for multi-line.
// - Whitespace:  Mostly ignored, but crucial for readability.
// - Strict Mode: ` "use strict";`  at the beginning of a file or function enables 
//   stricter error handling and prevents some unsafe actions.

// Example:

"use strict"; // Enable strict mode

function greet(name) { // Function declaration
  return `Hello, ${name}!`; // String interpolation
}

console.log(greet("World")); // Function call and output

// ---------------------------------------------------------------------------------
// 3. Modules
// ---------------------------------------------------------------------------------

// Modules help organize code into reusable units, preventing naming conflicts and
// improving maintainability.

// Key Concepts:
// - `export`: Makes variables, functions, or classes available to other modules.
// - `import`:  Brings functionality from other modules into the current module.

// Example (module1.js):

// Exporting a constant
export const myConstant = 42;

// Exporting a function
export function myFunction(x) {
  return x * 2;
}

// Exporting a class
export class MyClass {
  constructor(value) {
    this.value = value;
  }
}

// Default export (only one per module)
export default function myDefaultFunction() {
  console.log("This is the default export.");
}

// Example (module2.js):

// Importing specific exports
import { myConstant, myFunction } from './module1.js';

// Importing the default export
import myDefaultFunction from './module1.js';

// Importing everything with a namespace
import * as MyModule from './module1.js';

console.log(myConstant); // Accessing the imported constant: 42
console.log(myFunction(5)); // Calling the imported function: 10
myDefaultFunction(); // Calling the default export function: "This is the default export."
console.log(MyModule.myConstant) // Accessing using the namespace: 42

// ---------------------------------------------------------------------------------
// 4. Variables and Data Types
// ---------------------------------------------------------------------------------

// Variables are used to store data. JavaScript is dynamically typed, meaning
// you don't need to specify the type of a variable when you declare it.

// Variable Declarations:
// - let:   Block-scoped, can be reassigned.
// - const: Block-scoped, must be initialized, cannot be reassigned.
// - var:   Function-scoped (global if declared outside any function). 
//          Avoid using var in modern JavaScript.

// Primitive Data Types:
// - `number`:  Numeric values (integers and floating-point numbers).
// - `string`: Textual data.
// - `boolean`:  `true` or `false`.
// - `undefined`: Represents a variable that is declared but not assigned a value.
// - `null`: Represents the intentional absence of any object value.
// - `symbol`:  Unique and immutable values, often used as object property keys.
// - `bigint`:  Represents integers larger than the `number` type can handle.

// Reference Data Types:
// - `object`:  Collections of key-value pairs.
// - `array`:  Ordered lists of values.
// - `function`:  Reusable blocks of code.

// Examples:

let userAge = 30;                     // Number
const name = "Alice";                 // String
let isLoggedIn = true;                // Boolean
let city;                             // Undefined (no value assigned)
let address = null;                   // Null (intentional absence of value)
const id = Symbol("uniqueId");        // Symbol
let veryLargeNumber = 12345678901234567890n; // BigInt

let user = {                        // Object
    firstName: "Bob",
    lastName: "Smith",
    age: 25
};

let colors = ["red", "green", "blue"];// Array

function add(a, b) {                  // Function
    return a + b;
}

// Dynamic Typing Example:
let myVar = 10;     // myVar is a number
myVar = "Hello";    // myVar is now a string
myVar = true;       // myVar is now a boolean

// Type Coercion (Implicit Type Conversion):
let result = 5 + "5"; // "55" (number is coerced to a string)
let result2 = "5" * 2; // 10 (string is coerced to a number)

// Explicit Type Conversion:
let numStr = "123";
let numInt = parseInt(numStr);  // Converts string to integer: 123
let floatNum = parseFloat("3.14"); // Converts string to floating-point number: 3.14
let textStr = String(42);       // Converts number to string: "42"
let bool = Boolean(0);      // Converts to boolean (0 is falsy, so bool is false)

// ---------------------------------------------------------------------------------
// 5. Operators
// ---------------------------------------------------------------------------------

// Operators perform actions on values (operands).

// Arithmetic Operators:
// - `+`  (Addition)
// - `-`  (Subtraction)
// - `*`  (Multiplication)
// - `/`  (Division)
// - `%`  (Modulo - remainder of division)
// - `**` (Exponentiation)

// Assignment Operators:
// - `=`   (Assignment)
// - `+=`  (Add and assign)
// - `-=`  (Subtract and assign)
// - `*=`  (Multiply and assign)
// - `/=`  (Divide and assign)
// - `%=`  (Modulo and assign)
// - `**=` (Exponentiate and assign)

// Comparison Operators:
// - `==`  (Loose equality - checks only value, performs type coercion)
// - `===` (Strict equality - checks both value and type)
// - `!=`  (Loose inequality)
// - `!==` (Strict inequality)
// - `>`   (Greater than)
// - `<`   (Less than)
// - `>=`  (Greater than or equal to)
// - `<=`  (Less than or equal to)

// Logical Operators:
// - `&&` (Logical AND)
// - `||` (Logical OR)
// - `!`  (Logical NOT)

// Unary Operators:
// - `-`  (Negation)
// - `+`  (Unary plus - attempts to convert to a number)
// - `++` (Increment)
// - `--` (Decrement)
// - `typeof` (Returns a string indicating the type of a variable)
// - `delete` (Deletes an object property)
// - `void`   (Discards a return value)

// Ternary Operator:
// - `condition ? exprIfTrue : exprIfFalse` (Conditional operator)

// Bitwise Operators: (less commonly used)
// - `&`   (Bitwise AND)
// - `|`   (Bitwise OR)
// - `^`   (Bitwise XOR)
// - `~`   (Bitwise NOT)
// - `<<`  (Left shift)
// - `>>`  (Right shift - sign-propagating)
// - `>>>` (Right shift - zero-fill)

// Examples:

let x = 10;
let y = 5;

// Arithmetic
let sum = x + y; // 15
let diff = x - y; // 5
let product = x * y; // 50
let quotient = x / y; // 2
let remainder = x % y; // 0
let power = x ** y; // 100000

// Assignment
x += 5; // x is now 15
y -= 2; // y is now 3

// Comparison
console.log(x == y); // false
console.log(x === "15"); // false (strict equality checks type)
console.log(x != y); // true
console.log(x > y); // true

// Logical
let a = true;
let b = false;
console.log(a && b); // false
console.log(a || b); // true
console.log(!a); // false

// Unary
let z = -x; // -15
let strNum = +"42"; // 42 (converted to number)
let preIncrement = ++x;  // x is now 16, preIncrement is 16
let postIncrement = y++; // postIncrement is 3, y is now 4
console.log(typeof z); // "number"

// Ternary
let age = 20;
let status = age >= 18 ? "adult" : "minor"; // "adult"

// ---------------------------------------------------------------------------------
// 6. Control Flow Statements
// ---------------------------------------------------------------------------------

// Control flow statements determine the order in which code is executed.

// Conditional Statements:

// - `if...else`: Executes code based on a condition.
// - `switch`: Executes code based on the value of an expression.

// if...else
let num = 10;
if (num > 0) {
  console.log("Positive");
} else if (num < 0) {
  console.log("Negative");
} else {
  console.log("Zero");
}

// switch
let day = "Monday";
switch (day) {
  case "Monday":
    console.log("Start of the week");
    break;
  case "Friday":
    console.log("Almost the weekend");
    break;
  default:
    console.log("Another day");
}

// Looping Statements:

// - `for`: Repeats a block of code a specific number of times.
// - `while`: Repeats a block of code as long as a condition is true.
// - `do...while`: Similar to `while`, but the code block is executed at least once.
// - `for...in`:  Loops over properties of an object (not recommended for arrays).
// - `for...of`:  Loops over the values of an object (arrays, strings, maps, sets, etc.).

// for
for (let i = 0; i < 5; i++) {
  console.log(i); // 0, 1, 2, 3, 4
}

// while
let i = 0;
while (i < 5) {
  console.log(i); // 0, 1, 2, 3, 4
  i++;
}

// do...while
let j = 0;
do {
  console.log(j); // 0, 1, 2, 3, 4
  j++;
} while (j < 5);

// for...in (iterates over object keys)
const obj = { a: 1, b: 2, c: 3 };
for (const key in obj) {
  console.log(key); // "a", "b", "c"
  console.log(obj[key]);  // Accessing value using the key: 1, 2, 3
}

// for...of (iterates over iterable values)
const arr = [10, 20, 30];
for (const value of arr) {
  console.log(value); // 10, 20, 30
}

const str = "hello";
for (const char of str) {
  console.log(char); // "h", "e", "l", "l", "o"
}

// Transfer Statements:

// - `break`: Exits a loop or switch statement.
// - `continue`:  Skips the current iteration of a loop and continues with the next.
// - `return`:  Exits a function and optionally returns a value.

// break
for (let k = 0; k < 10; k++) {
  if (k === 5) {
    break; // Exit the loop when k is 5
  }
  console.log(k); // 0, 1, 2, 3, 4
}

// continue
for (let m = 0; m < 5; m++) {
  if (m === 2) {
    continue; // Skip the iteration when m is 2
  }
  console.log(m); // 0, 1, 3, 4
}

// return
function add(a, b) {
  return a + b; // Exit the function and return the sum
}
let sumResult = add(3, 4); // 7

// ---------------------------------------------------------------------------------
// 7. Arrays
// ---------------------------------------------------------------------------------

// Arrays are ordered collections of values.  They can hold elements of any data
// type, including other arrays.

// Declaration and Initialization:
let emptyArray = [];
let numbers = [1, 2, 3, 4, 5];
let mixedArray = [1, "hello", true, { name: "Alice" }];

// Accessing Elements:
// Use square brackets and the index (starting from 0).
console.log(numbers[0]); // 1
console.log(mixedArray[1]); // "hello"

// Modifying Elements:
numbers[2] = 10; // Change the element at index 2
console.log(numbers); // [1, 2, 10, 4, 5]

// Array Length:
console.log(numbers.length); // 5

// Adding Elements:
numbers.push(6);     // Add to the end: [1, 2, 10, 4, 5, 6]
numbers.unshift(0);  // Add to the beginning: [0, 1, 2, 10, 4, 5, 6]

// Removing Elements:
let lastElement = numbers.pop();    // Remove from the end (returns 6)
let firstElement = numbers.shift(); // Remove from the beginning (returns 0)
console.log(numbers); // [1, 2, 10, 4, 5]

// Other Common Array Methods:
// - `concat()`:  Joins arrays.  
// - `join()`:  Converts elements to a string.  
// - `slice()`:  Extracts a section into a new array.  
// - `splice()`:  Adds/removes elements (modifies original).  
// - `indexOf()`:  Returns first index of an element.  
// - `includes()`:  Checks if array includes a value.  
// - `find()`:  Returns first element satisfying a condition.  
// - `findIndex()`:  Returns index of first element satisfying a condition.  
// - `filter()`:  Creates new array with elements passing a condition.  
// - `map()`:  Creates new array by applying function to elements.  
// - `forEach()`:  Executes function for each element (no return).  
// - `reduce()`:  Reduces array to a single value.  
// - `sort()`:  Sorts elements (modifies original).  
// - `some()`:  Checks if any element passes a test.  
// - `every()`:  Checks if all elements pass a test.  
// - `flat()`:  Flattens nested arrays to a depth.  

// Examples:

let arr1 = [1, 2, 3];
let arr2 = [4, 5, 6];

let combined = arr1.concat(arr2); // [1, 2, 3, 4, 5, 6]
let joined = arr1.join("-"); // "1-2-3"
let sliced = arr1.slice(1, 3); // [2, 3] (from index 1 up to, but not including, 3)

// Removes 1 element from index 1, inserts 7 and 8. Returns removed elements: [2].  
let spliced = arr1.splice(1, 1, 7, 8);  // arr1 is now [1, 7, 8, 3]

console.log(arr1.indexOf(3)); // 3
console.log(arr1.includes(7)); // true

let found = arr1.find(element => element > 2); // 7 (first element greater than 2)
let filtered = arr1.filter(element => element > 2); // [7, 8, 3]
let mapped = arr1.map(element => element * 2); // [2, 14, 16, 6]

arr1.forEach(element => console.log(element)); // Prints each element

// 19 (sum of elements)
let sumArr = arr1.reduce((accumulator, currentValue) => accumulator + currentValue, 0); 

let unsorted = [3, 1, 4, 1, 5, 9, 2, 6];
 // Sorts alphabetically (for strings) or numerically (with a compare function)
unsorted.sort();

let nested = [1, [2, [3, [4]]]];
let flattened = nested.flat(Infinity); // [1, 2, 3, 4]

// ---------------------------------------------------------------------------------
// 8. Functions
// ---------------------------------------------------------------------------------

// Functions are reusable blocks of code that perform a specific task.

// Function Declaration:
function greet(name) {
  console.log(`Hello, ${name}!`);
}

// Function Expression:
const add = function(a, b) {
  return a + b;
};

// Arrow Function (ES6):
const multiply = (a, b) => a * b;

// Function Call (Invocation):
greet("World"); // "Hello, World!"
let sumFunc = add(5, 3); // 8
let productFunc = multiply(4, 6); // 24

// Parameters and Arguments:
// - Parameters are the variables listed in the function definition.
// - Arguments are the actual values passed to the function when it's called.

// Default Parameters (ES6):
function greetWithDefault(name = "Guest") {
  console.log(`Hello, ${name}!`);
}
greetWithDefault(); // "Hello, Guest!"
greetWithDefault("Alice"); // "Hello, Alice!"

// Rest Parameters (ES6):
// Allows a function to accept an indefinite number of arguments as an array.
function sum(...numbers) {
  return numbers.reduce((sum, num) => sum + num, 0);
}
console.log(sum(1, 2, 3, 4)); // 10

// Return Value:
// Functions can return a value using the `return` statement.  If no `return`
// statement is present, the function returns `undefined`.

// Scope:
// - Variables declared inside a function are local to that function.
// - `let` and `const` are block-scoped (within `{}` blocks).

// Closures:
// A closure is a function that has access to variables from its outer (enclosing)
// function's scope, even after the outer function has finished executing.

function outerFunction() {
  let outerVar = "Hello";
  function innerFunction() {
    console.log(outerVar); // innerFunction has access to outerVar (closure)
  }
  return innerFunction;
}

let myClosure = outerFunction();
myClosure(); // "Hello"

// Immediately Invoked Function Expression (IIFE):
// A function that is executed immediately after it's defined.  Used to create
// private scope.
(function() {
  let privateVar = "This is private";
  console.log(privateVar);
})();
// console.log(privateVar); // Error: privateVar is not defined (outside the IIFE)

// Higher-Order Functions:
// Functions that take other functions as arguments or return functions.
function applyOperation(a, b, operation) {
  return operation(a, b);
}

let resultHOF = applyOperation(5, 3, add); // 8
let result2HOF = applyOperation(5, 3, multiply); // 15

// Callback Functions:
// Functions passed as arguments to other functions, to be executed later.  Common
// in asynchronous operations.
function fetchData(callback) {
    setTimeout(() => {
        const data = { name: "Example Data" };
        callback(data); // Call the callback function with the fetched data
    }, 1000);
}

fetchData(data => {
    console.log("Received data:", data); // Received data: {name: 'Example Data'}
});

// ---------------------------------------------------------------------------------
// 9. Objects
// ---------------------------------------------------------------------------------

// Objects are collections of key-value pairs.  Keys are strings (or Symbols),
// and values can be any data type, including other objects or functions.

// Object Literal Notation:
const person = {
  firstName: "John",
  lastName: "Doe",
  age: 30,
  address: {
    street: "123 Main St",
    city: "Anytown"
  },
  greet: function() { // Method
    console.log(`Hello, my name is ${this.firstName}`);
  }
};

// Accessing Properties:
// - Dot notation: `object.property`
// - Bracket notation: `object["property"]` (useful when the property name is dynamic)
console.log(person.firstName); // "John"
console.log(person["lastName"]); // "Doe"
console.log(person.address.city); // "Anytown"

// Modifying Properties:
person.age = 31;
person["lastName"] = "Smith";

// Adding Properties:
person.email = "john.doe@example.com";

// Deleting Properties:
delete person.age;

// Methods:
// Functions that are properties of an object.
person.greet(); // "Hello, my name is John"

// `this` Keyword:
// Inside a method, `this` refers to the object the method belongs to.

// Constructor Functions:
// Used to create multiple objects of the same type.
function Person(firstName, lastName, age) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.age = age;
  this.greet = function() {
    console.log(`Hello, my name is ${this.firstName}`);
  };
}

const person1 = new Person("Alice", "Smith", 25);
const person2 = new Person("Bob", "Jones", 30);
person1.greet(); // "Hello, my name is Alice"

// Prototypes:
// Every JavaScript object has a prototype, which is another object.  Objects
// inherit properties and methods from their prototype.
// The `prototype` property of a constructor function is used to add properties
// and methods to all instances created by that constructor.

Person.prototype.getFullName = function() {
  return `${this.firstName} ${this.lastName}`;
};

console.log(person1.getFullName()); // "Alice Smith"

// Object.create():
// Creates a new object with the specified prototype object and properties.
const animal = {
    makeSound: function() { console.log("Generic animal sound"); }
};

const dog = Object.create(animal);
dog.bark = function() { console.log("Woof!"); };
dog.makeSound(); // "Generic animal sound"
dog.bark(); // "Woof!"

// Object Destructuring:
// A concise way to extract properties from objects into variables.
const { firstName, lastName } = person;
console.log(firstName); // "John"
console.log(lastName); // "Smith"

// Spread Syntax (...):
// Used to copy properties from one object to another, or to merge objects.
const personCopy = { ...person }; // Shallow copy
const mergedObject = { ...person, occupation: "Engineer" };

// Object.keys(), Object.values(), Object.entries():
console.log(Object.keys(person));
console.log(Object.values(person));
console.log(Object.entries(person));

// ---------------------------------------------------------------------------------
// 10. DOM Manipulation
// ---------------------------------------------------------------------------------

// The Document Object Model (DOM) is a programming interface for HTML and XML
// documents. It represents the page as a tree of nodes, allowing JavaScript to
// access and manipulate the structure, style, and content of the page.

// Accessing Elements:  
// - `document.getElementById(id)`: Gets element by ID.  
// - `document.getElementsByClassName(className)`: Gets elements by class.  
// - `document.getElementsByTagName(tagName)`: Gets elements by tag.  
// - `document.querySelector(selector)`: Gets first element matching CSS selector.  
// - `document.querySelectorAll(selector)`: Gets all elements matching CSS selector.  

// Modifying Elements:  
// - `element.textContent`: Gets/sets text content.  
// - `element.innerHTML`: Gets/sets HTML content.  
// - `element.setAttribute(name, value)`: Sets attribute value.  
// - `element.getAttribute(name)`: Gets attribute value.  
// - `element.removeAttribute(name)`: Removes attribute.  
// - `element.style`: Modifies inline styles.  
// - `element.classList`: Manages CSS classes (add/remove/toggle).  

// Creating and Appending Elements:  
// - `document.createElement(tagName)`: Creates new element.  
// - `element.appendChild(childElement)`: Appends child to parent.  
// - `element.insertBefore(newElement, referenceElement)`: Inserts new element before reference.  
// - `element.removeChild(childElement)`: Removes child element.  
// - `element.replaceChild(newChild, oldChild)`: Replaces child element.

// Examples:

// HTML:
// <div id="myDiv" class="container">
//   <p>This is a paragraph.</p>
//   <ul>
//     <li>Item 1</li>
//     <li>Item 2</li>
//   </ul>
// </div>

// JavaScript:
const myDiv = document.getElementById("myDiv");
const paragraphs = document.getElementsByTagName("p");
const firstParagraph = document.querySelector("p");
const listItems = document.querySelectorAll("li");

// Accessing
console.log(myDiv.textContent); // " This is a paragraph. Item 1 Item 2 "
console.log(paragraphs[0].textContent); // "This is a paragraph."

// Modifying
firstParagraph.textContent = "This is an updated paragraph.";
myDiv.style.backgroundColor = "lightblue";
myDiv.classList.add("highlight");

// Creating and Appending
const newListItem = document.createElement("li");
newListItem.textContent = "Item 3";
const ul = document.querySelector("ul");
ul.appendChild(newListItem);

// Removing
const itemToRemove = listItems[0];
ul.removeChild(itemToRemove);

// ---------------------------------------------------------------------------------
// 11. Events
// ---------------------------------------------------------------------------------

// Events are actions or occurrences that happen in the browser (user interactions,
// page loading, etc.).  JavaScript can listen for and respond to these events.

// Event Handling:
// - Inline event handlers (in HTML): `<button onclick="myFunction()">` (not recommended)
// - DOM property event handlers: `element.onclick = function() { ... };`
// - Event listeners: `element.addEventListener(eventType, function, useCapture);` (preferred)

// Common Event Types:
// - Mouse Events: `click`, `dblclick`, `mouseover`, `mouseout`, `mousedown`, `mouseup`, `mousemove`
// - Keyboard Events: `keydown`, `keyup`, `keypress`
// - Form Events: `submit`, `change`, `input`, `focus`, `blur`
// - Window Events: `load`, `resize`, `scroll`, `unload`
// - Touch Events: `touchstart`, `touchmove`, `touchend`, `touchcancel`

// Event Object:
// When an event occurs, an event object is automatically passed to the event
// handler function.  This object contains information about the event (type,
// target element, mouse coordinates, key pressed, etc.).

// Event Propagation:
// - Bubbling:  The event is first handled by the innermost element and then
//   propagates up to the outermost element.
// - Capturing: The event is first handled by the outermost element and then
//   propagates down to the innermost element. (less commonly used)
// - `event.stopPropagation()`: Prevents the event from bubbling up or capturing down.

// Preventing Default Behavior:
// - `event.preventDefault()`:  Prevents the default action associated with an
//   event (e.g., preventing a form submission).

// Examples:

// HTML:
// <button id="myButton">Click Me</button>
// <form id="myForm">
//   <input type="text" id="myInput">
//   <button type="submit">Submit</button>
// </form>

// JavaScript:

const button = document.getElementById("myButton");
const input = document.getElementById("myInput");
const form = document.getElementById("myForm");

// Event Listener
button.addEventListener("click", function(event) {
  console.log("Button clicked!");
  console.log("Event type:", event.type); // "click"
  console.log("Target element:", event.target); // <button id="myButton">
});

// Keyboard Event
input.addEventListener("keydown", function(event) {
  console.log("Key pressed:", event.key);
});

// Form Event (preventing default submission)
form.addEventListener("submit", function(event) {
  event.preventDefault(); // Prevent the form from submitting
  console.log("Form submitted (but prevented)");
});

// Event Propagation (Bubbling) Example:
// <div id="outer">
//   <button id="inner">Inner Button</button>
// </div>

const outer = document.getElementById("outer");
const inner = document.getElementById("inner");

outer.addEventListener("click", function(event) {
  console.log("Outer div clicked");
});

inner.addEventListener("click", function(event) {
  console.log("Inner button clicked");
  // event.stopPropagation(); // Uncomment to stop the bubbling
});
// Clicking "Inner Button
// (Output without stopPropagation: "Inner button clicked", "Outer div clicked")
// (Output with stopPropagation: "Inner button clicked")

// ---------------------------------------------------------------------------------
// 12. Asynchronous JavaScript
// ---------------------------------------------------------------------------------

// Asynchronous JavaScript allows you to execute code without blocking the main
// thread, preventing the user interface from freezing.

// Key Concepts:

// - Callbacks: Functions passed as arguments to other functions, to be executed
//   later (often after an asynchronous operation completes).
// - Promises: Objects representing the eventual completion (or failure) of an
//   asynchronous operation.  They have states (pending, fulfilled, rejected) and
//   methods like `.then()` and `.catch()` to handle the results.
// - Async/Await:  Syntactic sugar built on top of Promises, making asynchronous
//   code look and behave more like synchronous code.

// Common Asynchronous Operations:

// - `setTimeout()`: Executes a function after a specified delay.
// - `setInterval()`:  Repeatedly executes a function at a specified interval.
// - Fetch API:  Used for making network requests (e.g., fetching data from a server).
// - AJAX (Asynchronous JavaScript and XML):  A set of techniques for making
//   asynchronous requests to a server (Fetch API is generally preferred now).
// - Event listeners (many events are asynchronous).

// Examples:

// setTimeout
console.log("Before setTimeout");
setTimeout(() => {
  console.log("Inside setTimeout (after 2 seconds)");
}, 2000); // 2000 milliseconds = 2 seconds
console.log("After setTimeout");
// Output:
// Before setTimeout
// After setTimeout
// Inside setTimeout (after 2 seconds)

// setInterval
let counter = 0;
const intervalId = setInterval(() => {
  console.log("Interval:", counter);
  counter++;
  if (counter > 3) {
    clearInterval(intervalId); // Stop the interval
  }
}, 1000);

// Callback Example:
function getData(callback) {
  setTimeout(() => {
    const data = { message: "This is the data" };
    callback(data); // Call the callback with the data
  }, 1000);
}

getData(data => {
  console.log("Received data:", data); // Received data: {message: 'This is the data'}
});

// Promise Example:
function fetchData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const success = true;
      if (success) {
        resolve({ data: "Fetched data!" }); // Resolve with the data
      } else {
        reject("Error fetching data"); // Reject with an error message
      }
    }, 1500);
  });
}

fetchData()
  .then(result => { // .then() handles successful resolution
    console.log("Success:", result.data); // Success: Fetched data!
  })
  .catch(error => { // .catch() handles rejection
    console.error("Error:", error);
  });

// Async/Await Example:
async function getDataAsync() {
  try {
    const result = await fetchData(); // Await the Promise resolution
    console.log("Async/Await Success:", result.data); // Async/Await Success: Fetched data!
  } catch (error) {
    console.error("Async/Await Error:", error);
  }
}

getDataAsync();

// Fetch API Example:
fetch("https://jsonplaceholder.typicode.com/todos/1") // Example API endpoint
  .then(response => {
    if (!response.ok) { // Check for HTTP errors
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    return response.json(); // Parse the JSON response
  })
  .then(data => {
    console.log("Fetched data:", data); // Fetched data: {userId: 1, id: 1, title: 'delectus aut autem', completed: false}
  })
  .catch(error => {
    console.error("Fetch error:", error);
  });

// ---------------------------------------------------------------------------------
// 13. Error Handling
// ---------------------------------------------------------------------------------

// Error handling is crucial for writing robust code.  JavaScript provides
// mechanisms to handle errors gracefully and prevent unexpected program crashes.

// `try...catch` Statement:
// - `try`:  Encloses the code that might throw an error.
// - `catch`:  Handles the error if one occurs within the `try` block.
// - `finally`: (Optional) Executes code regardless of whether an error occurred.

// `throw` Statement:
// - Used to manually throw an error (can be a built-in error object or a custom error).

// Error Object:
// - When an error occurs, a JavaScript Error object is created.
// - Properties:
//   - `name`: The type of error (e.g., "Error", "TypeError", "ReferenceError").
//   - `message`:  A description of the error.
//   - `stack`: (Non-standard, but widely supported) The call stack at the time of the error.

// Examples:

try {
  // Code that might throw an error
  let result = undefinedVariable + 10; // ReferenceError: undefinedVariable is not defined
} catch (error) {
  console.error("Error name:", error.name);       // Error name: ReferenceError
  console.error("Error message:", error.message); // Error message: undefinedVariable is not defined
  // console.error("Stack trace:", error.stack);
} finally {
  console.log("Finally block executed"); // Finally block executed
}

// Throwing a custom error:
function divide(a, b) {
  if (b === 0) {
    throw new Error("Division by zero is not allowed");
  }
  return a / b;
}

try {
  let result = divide(10, 0);
} catch (error) {
  console.error(error.message); // Division by zero is not allowed
}

// Creating a custom error class:
class ValidationError extends Error {
    constructor(message) {
        super(message); // Call the parent constructor with the message
        this.name = "ValidationError"; // Set the error name
    }
}

try {
    throw new ValidationError("Invalid input data");
} catch (error) {
    if (error instanceof ValidationError) {
        console.error("Validation Error:", error.message); // Validation Error: Invalid input data
    } else {
        console.error("Other Error:", error.message);
    }
}

// ---------------------------------------------------------------------------------
// 14. Classes
// ---------------------------------------------------------------------------------

// Classes provide a more structured way to create objects and implement
// inheritance, introduced in ES6 (ECMAScript 2015). They are syntactic sugar
// over JavaScript's existing prototype-based inheritance.

// Class Declaration:
class Animal {
  // Constructor: Initializes the object
  constructor(name) {
    this.name = name;
  }

  // Method
  speak() {
    console.log(`${this.name} makes a sound.`);
  }

    // Static Method (associated with the class, not instances)
    static info() {
        console.log("This is the Animal class.");
    }
}

// Creating an Instance:
const myAnimal = new Animal("Generic Animal");
myAnimal.speak(); // "Generic Animal makes a sound."
Animal.info(); // "This is the Animal class."

// Inheritance:
class Dog extends Animal {
  constructor(name, breed) {
    super(name); // Call the parent class constructor
    this.breed = breed;
  }

  // Overriding a method
  speak() {
    console.log(`${this.name} barks!`);
  }

  // New method specific to Dog
  fetch() {
    console.log(`${this.name} fetches a ball.`);
  }
}

const myDog = new Dog("Buddy", "Golden Retriever");
myDog.speak(); // "Buddy barks!"
myDog.fetch(); // "Buddy fetches a ball."
console.log(myDog.breed); // Golden Retriever

// Getters and Setters:
class Rectangle {
    constructor(width, height) {
        this._width = width; // Use _ to indicate "private" (convention)
        this._height = height;
    }

    get width() {
        return this._width;
    }

    set width(value) {
        if (value > 0) {
            this._width = value;
        } else {
            console.error("Width must be positive.");
        }
    }

    get height() {
        return this._height;
    }

    set height(value) {
        if (value > 0) {
            this._height = value;
        } else {
            console.error("Height must be positive");
        }
    }

    get area() {
        return this._width * this._height;
    }
}

const rect = new Rectangle(5, 10);
console.log(rect.area); // 50
rect.width = 12;
console.log(rect.area); // 120
rect.width = -5; // "Width must be positive."

// ---------------------------------------------------------------------------------
// 15. Iterators and Generators
// ---------------------------------------------------------------------------------

// Iterators:
// Objects that define a sequence and potentially a return value upon its
// termination.  They implement the *iterator protocol*, which requires a `next()`
// method that returns an object with `value` and `done` properties.

// Generators:
// Special functions that can be paused and resumed, allowing you to create
// iterators in a more concise way.  They use the `function*` syntax and the
// `yield` keyword.

// Examples:

// Custom Iterator:
const myIterator = {
  data: [1, 2, 3],
  currentIndex: 0,
  next() {
    if (this.currentIndex < this.data.length) {
      return { value: this.data[this.currentIndex++], done: false };
    } else {
      return { value: undefined, done: true };
    }
  }
};

console.log(myIterator.next()); // {value: 1, done: false}
console.log(myIterator.next()); // {value: 2, done: false}
console.log(myIterator.next()); // {value: 3, done: false}
console.log(myIterator.next()); // {value: undefined, done: true}

// Making an Object Iterable:
const myIterable = {
    data: [4,5,6],
    [Symbol.iterator](){
        let index = 0;
        const self = this;
        return {
            next(){
                if(index < self.data.length){
                    return {value: self.data[index++], done: false}
                }else{
                    return {value: undefined, done: true}
                }
            }
        }
    }
}

for (const value of myIterable) {
    console.log(value); // 4, 5, 6
}
// Generator Function:
function* myGenerator() {
  yield 1;
  yield 2;
  yield 3;
}

const gen = myGenerator();
console.log(gen.next()); // {value: 1, done: false}
console.log(gen.next()); // {value: 2, done: false}
console.log(gen.next()); // {value: 3, done: false}
console.log(gen.next()); // {value: undefined, done: true}

// Generator for Infinite Sequence:
function* infiniteNumbers() {
  let n = 0;
  while (true) {
    yield n++;
  }
}

const infiniteGen = infiniteNumbers();
console.log(infiniteGen.next().value); // 0
console.log(infiniteGen.next().value); // 1
console.log(infiniteGen.next().value); // 2
// ... and so on

// Using Generators with `for...of`:
function* iterateArray(arr) {
    for (const item of arr) {
        yield item;
    }
}

const myArray = ["a", "b", "c"];
for (const value of iterateArray(myArray)) {
    console.log(value); // "a", "b", "c"
}

// ---------------------------------------------------------------------------------
// 18. Debugging
// ---------------------------------------------------------------------------------

// Debugging is the process of finding and fixing errors in your code.

// Tools and Techniques:

// - Browser Developer Tools:  All modern browsers have built-in developer tools
//   that provide a powerful debugger.
//   - Console:  Log messages, inspect variables, execute code.
//   - Sources (or Debugger):  Set breakpoints, step through code, inspect the call stack.
//   - Network:  Monitor network requests.
//   - Elements (or Inspector):  Inspect and modify the DOM and CSS.
//   - Performance:  Profile the performance of your code.

// - `console.log()`:  The simplest way to debug is to log values to the console.
// - `debugger;` statement:  Inserts a breakpoint in your code, pausing execution
//   in the debugger.
// - Linting:  Use a linter (like ESLint) to catch potential errors and enforce
//   coding style.
// - Unit Testing:  Write unit tests to verify that individual parts of your code
//   work as expected.

// Examples:

// Using console.log()
function myFunction(a, b) {
  console.log("a:", a);
  console.log("b:", b);
  return a + b;
}

// Using the debugger statement
function anotherFunction() {
  let x = 5;
  debugger; // Execution will pause here in the debugger
  x = x * 2;
  console.log("x:", x);
}