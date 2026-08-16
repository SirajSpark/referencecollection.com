# --------------------------------------------------------------------------------
# Python Reference and Guide
#
# ReferenceCollection.com
# Licensed under the MIT License
# --------------------------------------------------------------------------------

# TABLE OF CONTENTS
# -----------------
# 1.  Introduction to Python
# 2.  Installation and Setup
# 3.  Basic Syntax and Structure
# 4.  Data Types and Variables
# 5.  Operators and Expressions
# 6.  Control Flow Statements
# 7.  Functions and Lambda Expressions
# 8.  Data Structures
# 9.  Object-Oriented Programming
# 10. Modules and Packages
# 11. File Handling and I/O
# 12. Exception Handling
# 13. Advanced Python Features
# 14. Working with Data
# 15. Testing and Debugging
# 16. Standard Library Highlights
# 17. Concurrency and Parallelism

# --------------------------------------------------------------------------------
# 1. Introduction to Python
# --------------------------------------------------------------------------------

# Python is a high-level, interpreted programming language known for its simplicity,
# readability, and versatility. Created by Guido van Rossum and first released in
# 1991, Python has become one of the world's most popular programming languages.

# Key Features:
# - Readability: Clean syntax with significant whitespace
# - Interpreted: No compilation needed
# - Dynamically Typed: Type checking at runtime
# - Extensive Standard Library: "Batteries included" philosophy
# - Cross-Platform: Runs on various operating systems
# - Multi-Paradigm: Supports procedural, object-oriented, and functional programming
# - Large Ecosystem: Rich collection of third-party packages

# Version Information:
# - Python 2.x: Legacy version (End of Life: January 1, 2020)
# - Python 3.x: Current version (Recommended for all new projects)
#   Latest stable version can be found at https://www.python.org/downloads/

# --------------------------------------------------------------------------------
# 2. Installation and Setup
# --------------------------------------------------------------------------------

# Installing Python:
# 1. Visit https://www.python.org/downloads/
# 2. Download the latest version for your operating system
# 3. Run the installer (Important: Check "Add Python to PATH" on Windows)
# 4. Verify installation:

# Open terminal/command prompt and run:
# python --version  # Shows Python version
# pip --version     # Shows pip version (package installer)

# Virtual Environments:
# Isolated environments for project dependencies
# Create: python -m venv myenv
# Activate:
#   Windows: myenv\Scripts\activate
#   Unix/macOS: source myenv/bin/activate
# Deactivate: deactivate

# Package Management with pip:
# pip: Python's package installer
# pip list                        # List installed packages:
# pip install package_name        # Install package
# pip uninstall package_name      # Remove package
# pip freeze > requirements.txt   # Save dependencies
# pip install -r requirements.txt # Install from requirements

# First Python Program:
print("Hello, World!")  # Traditional first program

# --------------------------------------------------------------------------------
# 3. Basic Syntax and Structure
# --------------------------------------------------------------------------------

# Python's syntax is designed to be clear and readable. The language uses
# indentation to define code blocks, making proper spacing crucial.

# Comments:
# Single-line comments start with #
print("Hello")  # This is an inline comment

"""
This is a multi-line comment (docstring)
It can span multiple lines
Often used for documentation
"""

# Indentation:
# Python uses indentation (typically 4 spaces) to define code blocks
def example_function():
    if True:
        print("Indented block")  # 8 spaces (2 levels)
    print("Back one level")      # 4 spaces (1 level)

# Line Continuation:
# Long lines can be broken using \ or implicit continuation within parentheses
long_string = "This is a very long string that " \
             "continues on the next line"

total = (1 + 2 + 3 +
         4 + 5 + 6)  # Implicit continuation

# Naming Conventions:
snake_case_variable = "For variables and functions"
UPPERCASE_CONSTANT = "For constants"
CapitalizedClass = "For classes"
_private_variable = "Suggests private/internal use"

# Statement Termination:
# Unlike many languages, Python uses newlines to terminate statements
x = 1
y = 2
# Multiple statements on one line (not recommended for readability)
a = 1; b = 2

# --------------------------------------------------------------------------------
# 4. Data Types and Variables
# --------------------------------------------------------------------------------

# Python is dynamically typed, meaning variable types are determined at runtime.
# Variables are created when first assigned and can reference different types.

# Basic Data Types:
# 1. Numeric Types
integer = 42               # int: Whole numbers (unlimited size)
floating = 3.14            # float: Decimal numbers (64-bit precision)
complex_num = 1 + 2j       # complex: Numbers with real and imaginary parts

# 2. Text Type
string = "Hello, Python!"   # str: Immutable sequence of characters
multi_line = """
Multiple lines
of text
"""

# 3. Boolean Type
is_true = True             # bool: True or False values
is_false = False

# 4. None Type
empty_value = None         # NoneType: Represents absence of value

# Type Conversion:
str_num = "123"
num = int(str_num)         # String to integer
float_num = float(num)     # Integer to float
str_back = str(num)        # Number to string

# Variable Assignment:
x = 5                     # Single assignment
a = b = c = 0             # Multiple assignment
x, y = 1, 2               # Tuple unpacking

# Type Checking:
print(type(x))            # Check variable type
isinstance(x, int)        # Check if variable is of specific type

# Memory Management:
# Python uses automatic memory management (garbage collection)
# Objects are automatically deallocated when no longer referenced

# String Operations:
name = "Python"
print(len(name))         # Length: 6
print(name[0])           # Indexing: 'P'
print(name[1:4])         # Slicing: 'yth'
print(name + " 3.x")     # Concatenation: 'Python 3.x'
print(name * 2)          # Repetition: 'PythonPython'

# F-strings (Python 3.6+):
age = 30
print(f"Age: {age}")     # Modern string formatting

# --------------------------------------------------------------------------------
# 5. Operators and Expressions
# --------------------------------------------------------------------------------

# Operators allow you to perform operations on variables and values.
# Python follows standard operator precedence rules (PEMDAS).

# 1. Arithmetic Operators:
a = 10
b = 3

addition = a + b          # Addition: 13
subtraction = a - b       # Subtraction: 7
multiplication = a * b    # Multiplication: 30
division = a / b          # Float division: 3.333...
floor_division = a // b   # Integer division: 3
modulus = a % b           # Remainder: 1
power = a ** b            # Exponentiation: 1000

# 2. Comparison Operators:
equals = a == b          # Equal to: False
not_equals = a != b      # Not equal to: True
greater = a > b          # Greater than: True
less = a < b             # Less than: False
greater_equal = a >= b   # Greater than or equal to: True
less_equal = a <= b      # Less than or equal to: False

# 3. Logical Operators:
x = True
y = False

and_result = x and y     # Logical AND: False
or_result = x or y       # Logical OR: True
not_result = not x       # Logical NOT: False

# 4. Assignment Operators:
c = 5                    # Simple assignment
c += 2                   # Add and assign (c = c + 2)
c -= 1                   # Subtract and assign
c *= 3                   # Multiply and assign
c /= 2                   # Divide and assign
c //= 2                  # Floor divide and assign
c %= 3                   # Modulus and assign
c **= 2                  # Power and assign

# 5. Identity Operators:
list1 = [1, 2, 3]
list2 = [1, 2, 3]
list3 = list1

print(list1 is list3)    # True (same object)
print(list1 is list2)    # False (different objects)
print(list1 is not list2)# True

# 6. Membership Operators:
numbers = [1, 2, 3, 4, 5]
print(3 in numbers)      # True
print(6 not in numbers)  # True

# 7. Bitwise Operators:
x = 5  # Binary: 0101
y = 3  # Binary: 0011

print(x & y)  # AND: 1 (0001)
print(x | y)  # OR: 7 (0111)
print(x ^ y)  # XOR: 6 (0110)
print(~x)     # NOT: -6
print(x << 1) # Left shift: 10 (1010)
print(x >> 1) # Right shift: 2 (0010)

# Operator Precedence:
result = 2 + 3 * 4      # Multiplication before addition: 14
result = (2 + 3) * 4    # Parentheses override precedence: 20

# --------------------------------------------------------------------------------
# 6. Control Flow Statements
# --------------------------------------------------------------------------------

# Control flow statements determine the execution path of your program based on
# conditions and allow you to repeat blocks of code.

# 1. Conditional Statements:
# if statement
age = 20
if age >= 18:
    print("Adult")        # Executes if condition is True

# if-else statement
temperature = 15
if temperature > 25:
    print("Hot day")
else:
    print("Cool day")     # Executes if condition is False

# if-elif-else statement
score = 85
if score >= 90:
    print("Grade: A")
elif score >= 80:
    print("Grade: B")     # Executes as score is between 80 and 89
else:
    print("Grade: C")

# 2. Looping Statements:
# for loop - iterate over a sequence
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)          # Prints each fruit in the list

# range() function with for loop
for i in range(5):        # range(5) generates numbers 0 to 4
    print(i)

# while loop - repeat while condition is True
count = 0
while count < 5:
    print(count)
    count += 1           # Important: prevent infinite loop

# 3. Loop Control Statements:
# break - exit the loop
for i in range(10):
    if i == 5:
        break           # Exit loop when i equals 5
    print(i)

# continue - skip current iteration
for i in range(5):
    if i == 2:
        continue        # Skip printing when i equals 2
    print(i)

# pass - do nothing (placeholder)
for i in range(3):
    if i == 1:
        pass           # Placeholder for future code
    print(i)

# 4. Loop with else:
# else block executes when loop completes normally (not via break)
for i in range(3):
    print(i)
else:
    print("Loop completed")  # Executes after loop finishes

# 5. Nested Loops:
# Loop inside another loop
for i in range(2):
    for j in range(2):
        print(f"i={i}, j={j}")  # Prints all combinations

# 6. Comprehensions:
# List comprehension
squares = [x**2 for x in range(5)]  # Create list of squares

# Dictionary comprehension
square_dict = {x: x**2 for x in range(5)}

# Set comprehension
even_squares = {x**2 for x in range(10) if x % 2 == 0}

# 7. Match Statement (Python 3.10+):
# Modern alternative to multiple if-elif statements
status_code = 404
match status_code:
    case 200:
        print("OK")
    case 404:
        print("Not Found")
    case _:              # Default case
        print("Unknown")

# --------------------------------------------------------------------------------
# 7. Functions and Lambda Expressions
# --------------------------------------------------------------------------------

# Functions are reusable blocks of code that perform specific tasks.
# They help organize code and follow the DRY (Don't Repeat Yourself) principle.

# 1. Basic Function Definition:
def greet(name):
    """
    Simple greeting function.
    Args:
        name (str): Name to greet
    Returns:
        str: Greeting message
    """
    return f"Hello, {name}!"

# Function call
message = greet("Alice")
print(message)           # Output: Hello, Alice!

# 2. Parameters and Arguments:
# Default parameters
def power(base, exponent=2):
    return base ** exponent

print(power(4))         # Uses default exponent=2: 16
print(power(2, 3))      # Overrides default: 8

# Keyword arguments
def display_info(name, age):
    print(f"Name: {name}, Age: {age}")

display_info(age=25, name="Bob")  # Order doesn't matter

# 3. Variable Arguments:
# *args - variable positional arguments
def sum_all(*args):
    return sum(args)

print(sum_all(1, 2, 3, 4))  # Can take any number of arguments

# **kwargs - variable keyword arguments
def print_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_info(name="Alice", age=25, city="New York")

# 4. Return Values:
def divide(a, b):
    if b == 0:
        return None     # Return on error
    return a / b        # Return result

# Multiple return values (actually returns a tuple)
def get_coordinates():
    return 3, 4

x, y = get_coordinates()  # Tuple unpacking

# 5. Lambda Functions:
# Anonymous functions for simple operations
square = lambda x: x**2
print(square(5))        # Output: 25

# Lambda with multiple arguments
sum_lambda = lambda a, b: a + b
print(sum_lambda(2, 3)) # Output: 5

# 6. Function as First-Class Objects:
def apply_operation(func, value):
    return func(value)

result = apply_operation(lambda x: x*2, 5)  # Output: 10

# 7. Type Hints (Python 3.5+):
def calculate_area(radius: float) -> float:
    """Calculate circle area with type hints."""
    import math
    return math.pi * radius ** 2

# 8. Decorators:
# Higher-order functions that modify the behavior of other functions
def timer(func):
    """Simple timer decorator."""
    from time import time
    
    def wrapper(*args, **kwargs):
        start = time()
        result = func(*args, **kwargs)
        end = time()
        print(f"Function {func.__name__} took {end-start:.2f} seconds")
        return result
    return wrapper

@timer
def slow_function():
    """Simulates a slow operation."""
    import time
    time.sleep(1)
    print("Finished executing!")

slow_function() 

# Output:
# Finished executing!
# Function slow_function took 1.00 seconds

# --------------------------------------------------------------------------------
# 8. Data Structures
# --------------------------------------------------------------------------------

# Python provides several built-in data structures for organizing and storing data.

# 1. Lists and Tuples
# -------------------

# Lists: Ordered, mutable sequences
fruits = ["apple", "banana", "cherry"]

# List Operations:
fruits.append("orange")    # Add item to end
fruits.insert(1, "mango")  # Insert at specific position
fruits.remove("banana")    # Remove specific item
popped = fruits.pop()      # Remove and return last item
fruits.sort()              # Sort in place
fruits.reverse()           # Reverse in place
length = len(fruits)       # Get length
exists = "apple" in fruits # Check membership

# List Slicing:
numbers = [0, 1, 2, 3, 4, 5]
subset = numbers[1:4]       # Get elements 1 through 3
reversed = numbers[::-1]    # Reverse list
every_second = numbers[::2] # Get every second element

# Tuples: Ordered, immutable sequences
coordinates = (10, 20)
x, y = coordinates        # Tuple unpacking
single_item = (1,)        # Single-item tuple needs comma

# 2. Dictionaries
# ---------------

# Dictionaries: Key-value pairs
person = {
    "name": "Alice",
    "age": 25,
    "city": "New York"
}

# Dictionary Operations:
person["email"] = "alice@example.com"  # Add/update item
del person["age"]                      # Remove item
value = person.get("name", "Unknown")  # Safe access with default
keys = person.keys()                   # Get all keys
values = person.values()               # Get all values
items = person.items()                 # Get key-value pairs

# Dictionary Methods:
person.update({"age": 26, "phone": "123"})  # Update multiple
person.pop("phone")                         # Remove and return
person.clear()                              # Remove all items

# 3. Sets
# -------

# Sets: Unordered collections of unique elements
numbers = {1, 2, 3, 3}    # Duplicates are automatically removed

# Set Operations:
numbers.add(4)            # Add single item
numbers.update([5, 6])    # Add multiple items
numbers.remove(2)         # Remove item (raises error if missing)
numbers.discard(10)       # Remove item (no error if missing)

# Set Mathematics:
set1 = {1, 2, 3}
set2 = {3, 4, 5}
union = set1 | set2        # Union: {1, 2, 3, 4, 5}
intersection = set1 & set2 # Intersection: {3}
difference = set1 - set2   # Difference: {1, 2}
symmetric = set1 ^ set2    # Symmetric difference: {1, 2, 4, 5}

# --------------------------------------------------------------------------------
# 9. Object-Oriented Programming
# --------------------------------------------------------------------------------

# Python is an object-oriented programming language where everything is an object.

# Class Definition:
class Person:
    """
    A class representing a person.
    """
    
    # Class variable (shared by all instances)
    species = "Homo sapiens"
    
    def __init__(self, name: str, age: int):
        """Initialize a new Person instance."""
        self.name = name     # Instance variable
        self.age = age
        self._private = True # Convention for private variable
    
    def greet(self) -> str:
        """Return a greeting."""
        return f"Hello, my name is {self.name}"
    
    @property
    def age_group(self) -> str:
        """Property decorator example."""
        if self.age < 18:
            return "minor"
        return "adult"
    
    @classmethod
    def from_birth_year(cls, name: str, year: int):
        """Alternative constructor using class method."""
        from datetime import datetime
        age = datetime.now().year - year
        return cls(name, age)
    
    @staticmethod
    def species_info():
        """Static method example."""
        return "Humans are mammals"

# Creating Objects:
person = Person("Alice", 25)
print(person.greet())
print(person.age_group)

# Inheritance:
class Student(Person):
    def __init__(self, name: str, age: int, student_id: str):
        super().__init__(name, age)  # Call parent constructor
        self.student_id = student_id
    
    def study(self):
        return f"{self.name} is studying"

# Multiple Inheritance:
class A:
    def method(self):
        return "A method"

class B:
    def method(self):
        return "B method"

class C(A, B):  # Method Resolution Order (MRO) determines which method to use
    pass

# Special Methods:
class Point:
    def __init__(self, x: float, y: float):
        self.x = x
        self.y = y
    
    def __str__(self) -> str:
        """String representation for end users."""
        return f"Point({self.x}, {self.y})"
    
    def __repr__(self) -> str:
        """String representation for developers."""
        return f"Point(x={self.x}, y={self.y})"
    
    def __eq__(self, other) -> bool:
        """Define equality comparison."""
        if not isinstance(other, Point):
            return NotImplemented
        return self.x == other.x and self.y == other.y

# --------------------------------------------------------------------------------
# 10. Modules and Packages
# --------------------------------------------------------------------------------

# Modules are Python files containing code, while packages are directories
# containing multiple modules. They help organize and reuse code.

# Importing Modules:
import math                    # Import entire module
from datetime import datetime  # Import specific item
import numpy as np             # Import with alias
from typing import List, Dict  # Import type hints

# Creating a Module:
# Save as mymodule.py
def greet(name):
    return f"Hello, {name}"

# Using the Module:
import mymodule
print(mymodule.greet("Alice"))

# Package Structure:
# my_package/
# ├── __init__.py
# ├── module1.py
# └── module2.py

# Built-in Modules:
import os               # Operating system interface
import json             # JSON encoding/decoding
import random           # Random number generation
import collections      # Specialized container datatypes

# --------------------------------------------------------------------------------
# 11. File Handling and I/O
# --------------------------------------------------------------------------------

# Python provides built-in functions for file operations.

# Opening Files:
# Modes: 'r' (read), 'w' (write), 'a' (append), 'b' (binary), '+' (read and write), 
#        'x' (Exclusive creation), 't' (Text mode)
with open('example.txt', 'r') as file:  # Context manager
    content = file.read()               # Read entire file
    
# Reading Files:
with open('example.txt', 'r') as file:
    lines = file.readlines()            # Read all lines into list
    line = file.readline()              # Read single line
    for line in file:                   # Iterate over lines
        print(line.strip())

# Writing Files:
with open('output.txt', 'w') as file:
    file.write('Hello\n')               # Write string
    file.writelines(['Line 1\n',        # Write multiple lines
                    'Line 2\n'])

# Binary Files:
with open('image.jpg', 'rb') as file:   # Read binary
    data = file.read()

# File System Operations:
import os
import shutil

# Directory Operations:
os.mkdir('new_dir')                     # Create directory
os.makedirs('path/to/new_dir')          # Create nested directories
os.rmdir('dir_name')                    # Remove empty directory
os.listdir('.')                         # List directory contents

# File Operations:
os.rename('old.txt', 'new.txt')         # Rename file
os.remove('file.txt')                   # Delete file
shutil.copy('src.txt', 'dst.txt')       # Copy file
shutil.move('src.txt', 'dst/')          # Move file

# Path Operations:
from pathlib import Path

path = Path('folder/file.txt')
print(path.exists())                    # Check if path exists
print(path.is_file())                   # Check if path is file
print(path.suffix)                      # Get file extension

# --------------------------------------------------------------------------------
# 12. Exception Handling
# --------------------------------------------------------------------------------

# Exception handling allows you to gracefully handle errors in your code.

# Basic Try-Except:
try:
    x = 1 / 0                          # Raises ZeroDivisionError
except ZeroDivisionError as e:
    print(f"Error: {e}")

# Multiple Except Blocks:
try:
    num = int("abc")                   # Raises ValueError
except ValueError:
    print("Invalid number")
except TypeError:
    print("Type error occurred")
except Exception as e:                 # Catch all other exceptions
    print(f"Unexpected error: {e}")

# Try-Except-Else-Finally:
try:
    file = open("data.txt")
except FileNotFoundError:
    print("File not found")
else:                                 # Runs if no exception
    print("File operations successful")
finally:                              # Always runs
    file.close()

# Custom Exceptions:
class CustomError(Exception):
    """Custom exception class"""
    def __init__(self, message):
        self.message = message
        super().__init__(self.message)

# Raising Exceptions:
def validate_age(age):
    if age < 0:
        raise ValueError("Age cannot be negative")
    if not isinstance(age, int):
        raise TypeError("Age must be an integer")

# Context Managers:
class FileManager:
    def __init__(self, filename):
        self.filename = filename
        self.file = None
    
    def __enter__(self):
        self.file = open(self.filename, 'r')
        return self.file
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        if self.file:
            self.file.close()

# Using context manager:
with FileManager('example.txt') as file:
    content = file.read()

# --------------------------------------------------------------------------------
# 13. Advanced Python Features
# --------------------------------------------------------------------------------

# 1. Iterators and Generators
# ---------------------------

# Iterators are objects that implement __iter__ and __next__ methods
class Counter:
    def __init__(self, start, end):
        self.start = start
        self.end = end
    
    def __iter__(self):
        return self
    
    def __next__(self):
        if self.start >= self.end:
            raise StopIteration
        current = self.start
        self.start += 1
        return current

# Using iterator
for num in Counter(0, 3):
    print(num)              # Prints 0, 1, 2

# Generators using yield
def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

# Using generator
for num in fibonacci(5):
    print(num)              # Prints 0, 1, 1, 2, 3

# Generator expressions
squares = (x**2 for x in range(5))

# Class decorators
def singleton(cls):
    instances = {}
    def get_instance(*args, **kwargs):
        if cls not in instances:
            instances[cls] = cls(*args, **kwargs)
        return instances[cls]
    return get_instance

@singleton
class Configuration:
    def __init__(self):
        self.settings = {}

# 2. Context Managers
# -------------------

# Context manager using class - e.g. measures execution time
class Timer:
    def __enter__(self):
        """Called when entering 'with' block. Sets start time."""
        import time
        self.start = time.time()
        return self
    
    def __exit__(self, *args):
        """Called when exiting 'with' block. Calculates duration."""
        import time
        self.end = time.time()
        self.duration = self.end - self.start

# Usage: 
# with Timer() as t:
#     do_something()
# print(t.duration)

# Context manager using decorator - e.g. handles temporary files
from contextlib import contextmanager

@contextmanager
def temporary_file(filename):
    """Creates a file that is automatically deleted after use."""
    try:
        f = open(filename, 'w')      # Create and open file
        yield f                      # Provide file to with block
    finally:
        f.close()                    # Ensure file is closed
        import os
        os.remove(filename)          # Delete the temporary file

# Usage: 
# with temporary_file('temp.txt') as f:
#      f.write('data')  # File is automatically deleted after use.

# --------------------------------------------------------------------------------
# 14. Working with Data
# --------------------------------------------------------------------------------

# 1. Regular Expressions
# ----------------------

import re

# Pattern matching
text = "Python 3.9"
if re.match(r'Python \d\.\d', text):
    print("Version string matched")

# Finding all matches
text = "Python2 Python3 Python4"
matches = re.findall(r'Python\d', text)

# Substitution
text = "Date: 2023-08-15"
new_text = re.sub(r'(\d{4})-(\d{2})-(\d{2})', r'\3/\2/\1', text)

# 2. JSON Processing
# ------------------

import json

# Writing JSON
data = {
    "name": "Alice",
    "age": 30,
    "cities": ["New York", "London"]
}
json_string = json.dumps(data, indent=2)

# Reading JSON
parsed_data = json.loads(json_string)

# File operations
with open('data.json', 'w') as f:
    json.dump(data, f, indent=2)

with open('data.json', 'r') as f:
    loaded_data = json.load(f)

# 3. Date and Time
# ----------------

from datetime import datetime, timedelta

# Current date and time
now = datetime.now()
today = datetime.today()
utc_now = datetime.utcnow()

# Creating datetime objects
date = datetime(2023, 8, 15, 14, 30)
timestamp = date.timestamp()

# Date formatting
formatted = date.strftime('%Y-%m-%d %H:%M:%S')
parsed = datetime.strptime('2023-08-15', '%Y-%m-%d')

# Date arithmetic
tomorrow = today + timedelta(days=1)
next_week = today + timedelta(weeks=1)

# --------------------------------------------------------------------------------
# 15. Testing and Debugging
# --------------------------------------------------------------------------------

# Python provides built-in tools for testing and debugging code.

# Unit Testing with unittest:
import unittest

class TestStringMethods(unittest.TestCase):
    def setUp(self):
        """Run before each test method."""
        self.text = "hello"

    def test_upper(self):
        """Test upper() method."""
        self.assertEqual(self.text.upper(), "HELLO")

    def test_split(self):
        """Test split() method."""
        self.assertEqual("hello world".split(), ["hello", "world"])

# Running tests:
if __name__ == '__main__':
    unittest.main()

# Assertions:
def divide(a, b):
    assert b != 0, "Division by zero!"
    return a / b

# Debugging with pdb:
import pdb

def complex_function():
    x = 5
    y = 0
    pdb.set_trace()    # Start debugger
    z = x / y          # This will raise an error

# Using print for debugging:
def debug_function():
    print(f"Debug: entering function")  # Debug message
    result = some_calculation()
    print(f"Debug: result = {result}")  # Debug message
    return result

# --------------------------------------------------------------------------------
# 16. Standard Library Highlights
# --------------------------------------------------------------------------------

# Python's standard library provides a rich set of modules

# Collections:
from collections import defaultdict, Counter, deque

# Default dictionary
word_count = defaultdict(int)
for word in ["apple", "banana", "apple"]:
    word_count[word] += 1

# Counter
inventory = Counter(["apple", "banana", "apple"])

# Double-ended queue
queue = deque(["first", "second"])
queue.append("third")      # Add to right
queue.appendleft("zero")   # Add to left

# Random Numbers:
import random

random.random()           # Float between 0 and 1
random.randint(1, 10)     # Integer between 1 and 10
random.choice([1, 2, 3])  # Random element from sequence

# Math Operations:
import math

math.pi                  # Pi constant
math.sqrt(16)            # Square root
math.ceil(3.7)           # Round up
math.floor(3.7)          # Round down

# --------------------------------------------------------------------------------
# 17. Concurrency and Parallelism
# --------------------------------------------------------------------------------

# Python offers several ways to handle concurrent operations

# Threading - for I/O-bound tasks:
import threading

def worker():
    """Thread worker function."""
    print("Worker thread running")

thread = threading.Thread(target=worker)
thread.start()           # Begin thread execution
thread.join()            # Wait for thread completion

# Multiprocessing - for CPU-bound tasks:
from multiprocessing import Process

def process_worker():
    """Process worker function."""
    print("Process running")

process = Process(target=process_worker)
process.start()          # Start new process
process.join()           # Wait for process completion

# Asyncio (Python 3.5+) - for cooperative multitasking:
import asyncio

async def async_function():
    """Asynchronous function."""
    await asyncio.sleep(1)
    return "Done"

# Running async function:
async def main():
    result = await async_function()
    print(result)

asyncio.run(main())      # Execute async program