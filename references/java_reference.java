// ---------------------------------------------------------------------------------
// Java Reference and Guide
//
// ReferenceCollection.com
// Licensed under the MIT License
// ---------------------------------------------------------------------------------

// TABLE OF CONTENTS
// -----------------
// 1.  Introduction to Java
// 2.  Basic Syntax and Structure
// 3.  Data Types and Variables
// 4.  Operators
// 5.  Control Flow Statements
// 6.  Arrays
// 7.  Collections
// 8.  Methods
// 9.  Object-Oriented Programming
// 10. Exception Handling
// 11. File Input/Output (I/O)
// 12. Generics

// ---------------------------------------------------------------------------------
// 1. Introduction to Java
// ---------------------------------------------------------------------------------

// Java is an object-oriented programming language designed for platform independence,
// meaning code runs on any device with a JVM. Known for its simplicity, security, and performance.

// Key Features:
// - Platform Independence: Code runs on any device with a JVM
// - Object-Oriented: Everything is an object (except primitives)
// - Strongly Typed: Type checking at compile time
// - Automatic Memory Management: Garbage collection
// - Rich Standard Library: Extensive built-in functionality
// - Security: Built-in security features

// Getting Started:
// - Install JDK (Java Development Kit)
// - Set up JAVA_HOME environment variable
// - Use 'javac' to compile: javac MyProgram.java
// - Use 'java' to run: java MyProgram

// Java Virtual Machine (JVM):
// A virtual machine that runs java on any platform, it handles memory management, garbage 
// collection, and provides a runtime environment for executing Java applications.

// ---------------------------------------------------------------------------------
// 2. Basic Syntax and Structure
// ---------------------------------------------------------------------------------

// A Java program consists of classes, methods, variables, and statements. The 'main' method
// is the entry point for execution.

// What a Java Program Consists Of:
// 1. Classes: Blueprints for creating objects.
// 2. Methods: Functions that perform actions. The 'main' method is essential for execution.
// 3. Variables: Named storage locations for data.
// 4. Statements: Individual actions that perform operations.

// Syntax Highlights:
// - Case Sensitivity: Variable and class names are case-sensitive.
// - Semicolons: Each statement ends with a semicolon ';'.
// - Curly Braces: '{ }' define code blocks.
// - Comments: Use '//' for single-line and '/* ... */' for multi-line comments.
// - Access Modifiers: Keywords like public, private, protected to control accessibility.

// Example Program:
public class HelloWorld { // Class name must match file name 'HelloWorld.java'
    public static void main(String[] args) { // Entry point
        System.out.println("Hello, World!"); // Print to console
    }
}

// ---------------------------------------------------------------------------------
// 3. Variables and Data Types
// ---------------------------------------------------------------------------------

class VariablesAndDataTypes {
    public static void main(String[] args) {
        /*
        * Primitive Data Types:
        * The eight basic data types, for storing simple values.
        */
        byte byteVariable = 12;            // Range: -128 to 127
        short shortVariable = 3200;        // Range: -32,768 to 32,767
        int intVariable = 2147;            // Range: -2^31 to 2^31-1
        long longVariable = 2335807L;      // Range: -2^63 to 2^63-1
        float floatVariable = 3.14f;       // Range: 1.4e-45 to 3.4e+38
        double doubleVariable = 3.1415;    // Range: 4.9e-324 to 1.8e+308
        char charVariable = 'A';           // Range: '\u0000' to '\uffff'
        boolean booleanVariable = true;    // true or false

        // Constants: values that remain unchanged.
        final double PI = 3.14159;
        final double RADIUS = 5.0;

        /*
        * Reference Data Types:
        * Used to store data that reference memory locations,
        * like arrays, objects, interfaces, etc.
        */
        String stringVariable = "Hello, World!";
        int[] numbers = {1, 2, 3};
        Integer num = new Integer(10);
        Double dbl = new Double(3.14);
        JavaReference javaReference = new JavaReference();

        /*
        * Type Conversion (Casting):
        * Casting is the process of converting one data type into another.
        * Implicit conversion (widening) happens automatically with no data is lost.
        * Explicit conversion (narrowing) uses casting operators and may lose data.
        */
        int typeInt = 7;
        double typeDouble = typeInt; // Implicit (int to double)
        System.out.println(typeDouble); // 7.0

        double numDouble = 3.14;
        int numInt = (int) numDouble; // Explicit (double to int)
        System.out.println(numInt); // 3
    }
}

// ---------------------------------------------------------------------------------
// 4. Operators
// ---------------------------------------------------------------------------------

class Operators {
    public static void main(String[] args) {

        int a = 2;
        int b = 5;

        /*
        * Arithmetic Operators:
        * Perform basic mathematical operations
        */
        int sum = a + b;                   // Addition
        int difference = a - b;            // Subtraction
        int product = a * b;               // Multiplication
        int quotient = a / b;              // Division
        int remainder = a % b;             // Modulus

        /*
        * Assignment Operators:
        * Assigning values with operations
        */
        a += 5;                             // Add (a = a + 5)
        a -= 3;                             // Subtract (a = a - 3)
        a *= 2;                             // Multiply (a = a * 2)
        a /= 5;                             // Divide (a = a / 5)
        a %= 7;                             // Modulus (a = a % 7)

        /*
        * Comparison Operators:
        * Comparing values, returns true or false
        */
        boolean isEqual = (a == b);        // Equality
        boolean isGreater = (a > b);       // Greater than
        boolean isLesser = (a < b);        // Less than
        boolean notEqual = (a != b);       // Not equal to
        boolean greaterOrEqual = (a >= b); // Greater than or equal to
        boolean lesserOrEqual = (a <= b);  // Less than or equal to

        /*
        * Logical Operators:
        * Combine multiple conditions, returns true or false
        */
        boolean x = true;
        boolean y = false;
        boolean logicalAnd = x && y;       // Logical AND
        boolean logicalOr = x || y;        // Logical OR
        boolean logicalNotX = !x;          // Logical NOT

        /*
        * Bitwise Operators:
        * Perform operations at bit level
        */
        int bitwiseAnd = a & b;            // Bitwise AND
        int bitwiseOr = a | b;             // Bitwise OR
        int bitwiseXor = a ^ b;            // Bitwise XOR
        int bitwiseComplement = ~a;        // Bitwise Complement
        int leftShift = a << 1;            // Left Shift
        int rightShift = a >> 1;           // Right Shift

        /*
        * Unary Operators:
        * Unary operators operate on a single operand.
        */
        int pre_increment = (++a);          // Pre-increment
        int pre_decrement = (--a);          // Pre-decrement
        int post_increment = (a++);         // Post-increment
        int post_decrement = (a--);         // Post-decrement
        int positive = (+a);                // Positive
        int negative = (-a);                // Negative
        boolean logical = (!true);          // Logical negation

        /*
        * Ternary Operator:
        * Concise way to write conditional expressions.
        * Syntax: (condition) ? (if-true) : (if-false)
        */
        int score = 65;
        String result = (score >= 50) ? "Pass" : "Fail";
    }
}

// ---------------------------------------------------------------------------------
// 5. Control Flow Statements
// ---------------------------------------------------------------------------------

class ControlFlowStatements {
    public static void main(String[] args) {

        // Conditional statements:

        /*
            * if-else statement:
            * Executes a code block if a condition is true.
            */
        int score = 65;
        if (score > 50) {
            System.out.println("score > 50");
        } else if (score < 50) {
            System.out.println("score < 50");
        } else {
            System.out.println("score = 50");
        }

        /*
            * switch statement:
            * Executes a code block based on the value of a variable.
            */
        int choice = 2;
        switch (choice) {
            case 1:
                System.out.println("Choice is 1");
                break;
            case 2:
                System.out.println("Choice is 2");
                break;
            default:
                System.out.println("Invalid choice");
        }

        // Looping statements:

        /*
            * for statement:
            * Repeat a code block until a condition is false.
            */
        for (int i = 0; i < 5; i++) {
            System.out.println("Iteration: " + i);
        }

        /*
            * while statement:
            * Repeat a code block until a condition is true.
            */
        int i = 1;
        while (i <= 5) {
            System.out.println("Iteration " + i);
            i++;
        }

        /*
            * do-while statement:
            * Similar to 'while', but the code block is executed at least once.
            */
        int j = 1;
        do {
            System.out.println("Iteration " + j);
            j++;
        } while (j <= 5);

        /*
            * for statement:
            * Iterate over arrays or collections.
            */
        int[] numbers = {1, 2, 3};
        for (int number : numbers) {
            System.out.println("Number: " + number);
        }

        // Transfer statements:

        /*
            * break statement:
            * Exit loop or switch statement.
            */
        for (int m = 0; m < 10; m++) {
            if (m == 7) {
                break;
            }
        }

        /*
            * continue statement:
            * Skip current iteration, proceed with next.
            */
        for (int m = 0; m < 10; m++) {
            if (m == 3) {
                continue;
            }
        }

        /*
            * return statement:
            * Exit method, optionally sending back value.
            */
        class ReturnStatement {
            public int multiply(int a, int b) {
                return a * b;
            }
        }

    }
}

// ---------------------------------------------------------------------------------
// 6. Arrays
// ---------------------------------------------------------------------------------

class Arrays {
    public static void main(String[] args) {

        /*
        * Declaration and Initialization:
        * Arrays are objects that store multiple variables of the same type.
        */
        double[] doubleArray = new double[5]; // Initialization with size 5
        int[] intArray = new int[]{1, 2, 3, 4, 5};
        int[] fibonacci = {0, 1, 1, 2, 3, 5};
        char[] vowels = {'a', 'e', 'i', 'o', 'u'};
        String[] stringArray = {"apple", "banana", "orange"};

        /*
        * Accessing Array Elements:
        * Elements are accessed using index numbers, starting from 0.
        */
        System.out.println("First element: " + intArray[0]);
        System.out.println("Second element: " + intArray[1]);

        /*
        * Modifying Elements:
        * Arrays can be modified by assigning new values to them.
        */
        doubleArray[0] = 10;
        doubleArray[1] = 20;

        // Iterating Through Arrays:
        for (int f = 0; f < fibonacci.length; f++) {
            System.out.print(fibonacci[f] + " ");
        }

        /*
        * Multidimensional Arrays:
        * Arrays can have more than one dimension.
        */
        int[][] matrix = new int[3][3]; // Declaration and initialization of a 3x3 matrix
        matrix[0][0] = 1; // Assigning value (0,0)
        matrix[0][1] = 2; // Assigning value (0,1)
        System.out.println("Element at (0,1): " + matrix[0][1]);
    }
}

// ---------------------------------------------------------------------------------
// 7. Collections
// ---------------------------------------------------------------------------------

class Collections {
    public static void main(String[] args) {

        /*
        * List: ArrayList:
        * Lists maintain the order of elements and allow duplicate elements.
        */
        List<String> arrayList = new ArrayList<>();
        arrayList.add("one");
        arrayList.add("two");

        /*
        * List: LinkedList
        * A sequence of elements, each element is connected to its next and previous elements
        */
        List<String> linkedList = new LinkedList<>();
        linkedList.add("one");
        linkedList.add("two");

        /*
        * Set: HashSet
        * Stores unique elements, without maintaining any order.
        */
        Set<String> hashSet = new hashSet<>();
        linkedList.add("one");
        linkedList.add("two");

        /*
        * Set: TreeSet
        * Sorted set that stores unique elements in ascending order.
        */
        Set<String> treeSet = new TreeSet<>();
        linkedList.add("one");
        linkedList.add("two");

        /*
        * Map: HashMap
        * Stores key-value pairs, allowing fast retrieval of values by their keys.
        */
        Map<String, Integer> hashMap = new HashMap<>();
        hashMap.put("one", 1);
        hashMap.put("two", 2);

        /*
        * Map: TreeMap
        * Sorted map that stores key-value pairs in sorted order based on the keys.
        */
        Map<String, Integer> treeMap = new TreeMap<>();
        treeMap.put("one", 1);
        treeMap.put("two", 2);

        /*
        * Iterating Through Lists/Sets:
        * Use for-each loop or iterators.
        */
        for (String item : hashSet) {
            System.out.println(item);
        }

        Iterator<String> arrayListIterator = hashSet.iterator();
        while (arrayListIterator.hasNext()) {
            System.out.println(arrayListIterator.next());
        }

        /*
        * Iterating Through Maps:
        * Use for-each loop or iterators.
        */
        for (Map.Entry<String, Integer> entry : hashMap.entrySet()) {
            System.out.println(entry.getKey() + " > " + entry.getValue());
        }

        Iterator<Map.Entry<String, Integer>> hashMapIterator = hashMap.entrySet().iterator();
        while (hashMapIterator.hasNext()) {
            Map.Entry<String, Integer> entry = hashMapIterator.next();
            System.out.println(entry.getKey() + " > " + entry.getValue());
        }

        /*
        * Collection Algorithms:
        * Java provides different methods to work with collections.
        */
        List<Integer> numbers = new ArrayList<>();
        numbers.add(5);
        numbers.add(2);
        // Sort
        Collections.sort(numbers);
        // Sum
        int sum = Collections.sum(numbers);
        System.out.println("Sum of Numbers: " + sum);
        // Reverse
        Collections.reverse(numbers);
        System.out.println("Reversed Numbers: " + numbers);
    }
}

// ---------------------------------------------------------------------------------
// 8. Methods
// ---------------------------------------------------------------------------------

class Methods {
    public static void main(String[] args) {

        /*
        * Method Declaration:
        * Methods are reusable blocks of code.
        * Syntax: <access modifier> <return type> <method name>(<parameter list>)
        */
        public void greet() {
            System.out.println("Hello, world!");
        }
        
        /*
        * Access modifiers:
        * Access modifiers define the accessibility of a method.
        *  - public: Accessible from any class
        *  - private: Accessible only within the same class
        *  - protected: Accessible within the same package and subclasses
        */
        protected int substract(int x, int y) {
            return x - y;
        }
        
        /*
        * Recursion:
        * Method calls itself, known as recursion.
        */
        public int factorial(int n) {
            if (n == 0 || n == 1) {
                return 1;
            } else {
                return n * factorial(n - 1);
            }
        }
        

    }
}

// ---------------------------------------------------------------------------------
// 9. Object-Oriented Programming
// ---------------------------------------------------------------------------------

class OOP {
    public static void main(String[] args) {

        /*
        * Classes:
        * Class is a blueprint for creating objects.
        */
        class Car {
            // Variables
            String brand;
            String model;

            // Constructor without parameters and with default value
            public Car() {
                brand = "Unknown";
                model = "Unknown";
            }

            // Constructor with parameters
            public Car(String brand, String model) {
                this.brand = brand;
                this.model = model;
            }

            // Method
            public void displayCarInfo() {
                System.out.println("Brand: " + brand);
                System.out.println("Model: " + model);
            }
        }

        /*
        * Objects:
        * Objects are instances of classes.
        */
        Car honda = new Car("Honda", "Accord");
        // Accessing object property and method
        System.out.println("Honda model: " + honda.model);
        honda.displayCarInfo();

        /*
        * Encapsulation:
        * Hide the internal state of an object, and only allows access through methods.
        */
        class Wallet {
            // private variables
            private double balance;

            // Getter and Setter methods for encapsulated fields
            public double getBalance() {
                return balance;
            }

            public void setBalance(double balance) {
                this.balance = balance;
            }
        }

        Wallet wallet = new Wallet();
        wallet.setBalance(1000);
        System.out.println("Balance: " + wallet.getBalance());

        /*
        * Inheritance:
        * Allows a class to inherit properties and behavior from another class.
        */
        class ElectricCar extends Car {

            // specific field to ElectricCar
            private int batteryLife;

            // Constructor including fields from Car (super) class and ElectricCar class
            public ElectricCar(String make, String model, int batteryLife) {
                super(make, model);
                this.batteryLife = batteryLife;
            }

            /*
            * Method overriding:
            * Providing a specific implementation for a method
            * already defined in its superclass (car).
            */
            @Override
            public void displayCarInfo() {
                super.displayCarInfo();
                System.out.println("Battery Life: " + batteryLife + " miles");
            }

            /*
            * Method overloading:
            * Defining multiple methods with the same name but different parameters.
            */
            public void displayCarInfo(boolean includeBatteryLife) {
                super.displayCarInfo();
                if (includeBatteryLife) {
                    System.out.println("Battery Life: " + batteryLife + " miles");
                }
            }

            // Additional method specific to ElectricCar
            public void charge() {
                System.out.println("Charging the car...");
            }
        }

        /*
        * Polymorphism:
        * Lets different objects be treated similarly, even if they're from different classes
        */
        Car teslaModelS = new ElectricCar("Tesla", "Model S", 400);
        // Calls the overridden displayCarInfo() method in ElectricCar
        teslaModelS.displayCarInfo();

        /*
        * Abstraction:
        * Is about hiding implementation details and showing only essential features.
        * Abstract classes can contain both implemented and abstract methods.
        * Abstract Classes can only extend one abstract class.
        */
        abstract class Vehicle {
            abstract void operate();
        }

        class Car extends Vehicle {
            @Override
            void operate() {
                System.out.println("Operating Car");
            }
        }

        class Motorcycle extends Vehicle {
            @Override
            void operate() {
                System.out.println("Operating Motorcycle");
            }
        }

        Vehicle myCar = new Car();
        myCar.operate(); // Operating Car

        Vehicle myMotorcycle = new Motorcycle();
        myMotorcycle.operate(); // Operating Motorcycle

        /*
        * Interfaces:
        * Define a contract for classes, specifying methods they must implement.
        * Classes can implement multiple interfaces.
        */
        interface MessagingService {
            void sendMessage(String message, String recipient);
        }

        class EmailService implements MessagingService {
            @Override
            public void sendMessage(String message, String recipient) {
                System.out.println("Sending email to " + recipient + ": " + message);
            }
        }

        MessagingService emailService = new EmailService();
        emailService.sendMessage("Hello, how are you?", "example@example.com");

    }
}

// ---------------------------------------------------------------------------------
// 10. Exception Handling
// ---------------------------------------------------------------------------------

class ExceptionHandling {
    public static void main(String[] args) {

        /*
        * Try-Catch Blocks:
        * Handle potential errors or exceptions in code.
        */
        int[] intArray = {1, 2, 3, 4, 5};
        try {
            System.out.println(intArray[10]);
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("Caught ArrayIndexOutOfBoundsException: " + e.getMessage());
        }

        /*
        * Multiple Catch Blocks:
        * Handling different types of exceptions separately.
        */
        try {
            int[] numbers = {1, 2, 3};
            System.out.println(numbers[4]); // Index out of bounds exception
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("Array index out of bounds");
        } catch (Exception e) {
            System.out.println("An error occurred");
        }

        /*
        * Finally Block:
        * Finally block get executed regardless of an exception or not.
        */
        try {
            int result = 10 / 0;
            System.out.println("Result: " + result);
        } catch (ArithmeticException e) {
            System.out.println("Error: Division by zero");
        } finally {
            System.out.println("Inside finally block");
        }

        /*
        * Custom Exceptions:
        * You can create your own exceptions to handle specific situations.
        */
        class InvalidAgeException extends Exception {
            public InvalidAgeException(String message) {
                super(message);
            }
        }

        /*
        * Throwing Exceptions:
        * You can manually throw exceptions to handle specific cases.
        */
        class ThrowExceptionExample {
            public static void main(String[] args) {
                try {
                    validateAge(15);
                } catch (InvalidAgeException e) {
                    System.out.println("Invalid age: " + e.getMessage());
                }
            }

            public static void validateAge(int age) throws InvalidAgeException {
                if (age < 18) {
                    throw new InvalidAgeException("Age must be at least 18");
                }
            }

        }
    }
}

// ---------------------------------------------------------------------------------
// 11. File Input/Output (I/O)
// ---------------------------------------------------------------------------------

class InputOuput {
    public static void main(String[] args) {

        /*
        * File Handling:
        * Managing files on a computer system.
        */
        try {

            // Creating a new file
            File file = new File("newfile.txt");
            if (file.createNewFile()) {
                System.out.println("File created successfully.");
            } else {
                System.out.println("File already exists.");
            }

            // Deleting the file
            if (file.delete()) {
                System.out.println("File deleted successfully.");
            } else {
                System.out.println("Failed to delete the file.");
            }

            // Check if a file exists
            File existingFile = new File("newfile.txt");
            if (existingFile.exists()) {
                System.out.println("File exists: " + existingFile.getName());
            } else {
                System.out.println("File does not exist.");
            }

        } catch (FileNotFoundException e) {
            System.out.println("File not found");
        } catch (IOException e) {
            e.printStackTrace();
        }

        /*
        * Writing to Files:
        * Ways of writing data to a file.
        */
        try {

            String content = "Hello, this is a sample text.";
            File file = new File("filename.txt");

            // Using FileOutputStream
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(content.getBytes());
            fos.close();

            // Using FileWriter
            FileWriter fileWriter = new FileWriter(file);
            fileWriter.write(content);
            fileWriter.close();

            // Using BufferedWriter
            BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
            bufferedWriter.write(content);
            bufferedWriter.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

        /*
        * Reading from Files:
        * Ways of reading data from a file.
        */
        try {

            File file = new File("filename.txt");

            // Using FileInputStream
            FileInputStream fis = new FileInputStream(file);
            int content;
            while ((content = fis.read()) != -1) {
                System.out.print((char) content);
            }
            fis.close();

            // Using FileReader
            FileReader fileReader = new FileReader(file);
            int data;
            while ((data = fileReader.read()) != -1) {
                System.out.print((char) data);
            }
            fileReader.close();

            // Using BufferedReader
            BufferedReader bufferedReader = new BufferedReader(new FileReader(file));
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                System.out.println(line);
            }
            bufferedReader.close();

            // Using Scanner
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
                System.out.println(scanner.nextLine());
            }
            scanner.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

// ---------------------------------------------------------------------------------
// 12. Generics
//  ---------------------------------------------------------------------------------

// Create classes, interfaces, and methods that operate with parameterized types.
// The letter 'T' represents the type parameter.

class Generics {
    public static void main(String[] args) {

        /*
        * Generic Classes
        * Classes with type parameters for flexible and type-safe code.
        */
        class Shape<T> {
            private T t;

            public void set(T t) {
                this.t = t;
            }

            public T get() {
                return t;
            }
        }

        Shape<String> stringBox = new Shape<>();
        stringBox.set("Hello World");

        Shape<Integer> integerBox = new Shape<>();
        integerBox.set(100);

        /*
        * Generic Methods:
        * Methods with type parameters for flexibility.
        */
        class GenericMethod {
            public static <T> void printList(List<T> list) {
                for (T item : list) {
                    System.out.println(item);
                }
            }

            public static void main(String[] args) {
                List<String> stringArrayList = new ArrayList<>();
                stringArrayList.add("one");
                List<Integer> integerArrayList = new ArrayList<>();
                integerArrayList.add(100);

                printList(stringArrayList);
                printList(integerArrayList);
            }
        }

        /*
        * Wildcards:
        * Flexible typing for methods with unknown types.
        * There are three types of wildcards: ?, ? extends T, and ? super T.
        */
        class Wildcards {
            public static void printListWildcard(List<?> list) {
                for (Object item : list) {
                    System.out.println(item);
                }
            }

            public static void main(String[] args) {
                List<String> stringArrayList = new ArrayList<>();
                stringArrayList.add("one");
                List<Integer> integerArrayList = new ArrayList<>();
                integerArrayList.add(100);

                printListWildcard(stringArrayList);
                printListWildcard(integerArrayList);
            }
        }

        /*
        * Bounded Type Parameters:
        * You can restrict the types that can be passed as type arguments
        * There are two kinds of bounds: upper bound and lower bound.
        */
        class MathUtils {

            // Upper Bound: Accepts types that extend Number
            public static <T extends Number> double findMaxValue(List<T> list) {
                double max = Double.NEGATIVE_INFINITY;
                for (T num : list) {
                    if (num.doubleValue() > max) {
                        max = num.doubleValue();
                    }
                }
                return max;
            }

            // Lower Bound: Accepts types that are superclasses of Integer
            public static int sum(List<? super Integer> list) {
                int sum = 0;
                for (Object obj : list) {
                    if (obj instanceof Integer) {
                        sum += (Integer) obj;
                    }
                }
                return sum;
            }

            public static void main(String[] args) {
                List<Integer> integerList = new ArrayList<>();
                integerList.add(5);
                integerList.add(10);
                integerList.add(15);

                System.out.println("Sum of integers: " + MathUtils.sum(integerList));
                System.out.println("Maximum value: " + MathUtils.findMaxValue(integerList));

            }
        }

    }
} 