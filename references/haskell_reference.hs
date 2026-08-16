-- ---------------------------------------------------------------------------------
-- Haskell Reference and Guide
--
-- ReferenceCollection.com
-- Licensed under the MIT License
-- ---------------------------------------------------------------------------------

-- TABLE OF CONTENTS
-- -----------------
-- 1.  Introduction to Haskell
-- 2.  Basic Syntax and Structure
-- 3.  Types and Type Classes
-- 4.  Defining Functions
-- 5.  Control Flow
-- 6.  Lists
-- 7.  Tuples
-- 8.  Input and Output
-- 9.  Modules
-- 10. Algebraic Data Types
-- 11. Type Aliases and Newtypes
-- 12. Functors
-- 13. Applicatives
-- 14. Monads
-- 15. Error Handling
-- 16. Testing
-- 17. Profiling and Optimization
-- 18. Concurrency and Parallelism
-- 19. Template Haskell
-- 20. Generalized Algebraic Data Types (GADTs)
-- 21. Type Families
-- 22. Arrows
-- 23. Lenses

-- ---------------------------------------------------------------------------------
-- 1. Introduction to Haskell
-- ---------------------------------------------------------------------------------

{-
Haskell is a purely functional programming language known for its strong static
typing, lazy evaluation, and powerful type system. It encourages writing
declarative code where you describe what you want to compute rather than 
how to compute it.

Why Learn Haskell?
- Powerful abstraction capabilities.
- Reduced bugs due to strong typing and purity.
- Concurrency and parallelism are easier to manage.
- Excellent for domain-specific languages and formal methods.
- Influential and intellectually stimulating.

Getting Started:
- Install the Haskell Tool Stack (https://docs.haskellstack.org/).
- Use GHCi (Glasgow Haskell Compiler interactive interpreter) to experiment.
- Create Haskell source files with the `.hs` extension.

Basic Execution:
- Load a file in GHCi: `:l <filename.hs>` or `:load <filename.hs>`
- Reload changes: `:r` or `:reload`
- Evaluate an expression: `expression`

Example of a Simple Haskell Program:
----------------------------------
-}
module Main where

main :: IO ()
main = putStrLn "Hello, Haskell!"
{-
To execute this, save it as `hello.hs` and then run `runghc hello.hs`
or load it in GHCi and then run `main`.
-}

-- ---------------------------------------------------------------------------------
-- 2. Basic Syntax and Structure
-- ---------------------------------------------------------------------------------

-- Comments:
-- --------
-- Single-line comments start with "--".
-- Multi-line comments are enclosed in "{-" and "-}".

-- Identifiers:
-- -----------
-- Identifiers (variable and function names) must begin with a lowercase letter,
-- and can include letters, numbers, underscores, and apostrophes.
-- Type and Constructor names start with an uppercase letter.

myVariable :: Int
myVariable = 10

myFunction :: Int -> Int
myFunction x = x * 2

-- Layout and Indentation:
-- -----------------------
-- Haskell uses indentation to determine code blocks. Lines within a block
-- must be indented to the same level. This is similar to Python.

exampleIndentation :: Int -> Int
exampleIndentation x =
  let y = x + 1
      z = y * 2
  in z

-- Basic Operators:
-- ---------------
-- Arithmetic: +, -, *, /, ^ (power), `div` (integer division), `mod` (modulo)
-- Comparison: ==, /=, >, <, >=, <=
-- Logical: &&, ||, not

arithmeticExample :: Int
arithmeticExample = (5 + 3) * 2 `div` 3

comparisonExample :: Bool
comparisonExample = 10 > 5

logicalExample :: Bool
logicalExample = True && False

-- ---------------------------------------------------------------------------------
-- 3. Types and Type Classes
-- ---------------------------------------------------------------------------------

-- Explicitly state the types of functions and expressions using `::` 
-- The basic format for a function type signature is
-- `functionName :: argumentType1 -> argumentType2 -> ... -> returnType`.
-- While optional, type signatures are recommended for clarity and catching errors.

explicitInt :: Int  -- Declares explicitInt has the type Int
explicitInt = 5

addExplicit :: Int -> Int -> Int -- Declares addExplicit takes two Ints and returns an Int
addExplicit x y = x + y

-- Polymorphic Types:
-- -----------------
-- Type signatures can use lowercase letters (like `a`, `b`) as type variables.
-- These are like placeholders that can represent *any* type. This means the
-- function or value can work with multiple types, making code more reusable.

identity :: a -> a -- 'a' can be any type; function returns same type as input
identity x = x

-- Basic Types:
-- -----------
-- `Int`: Integer numbers (fixed precision, often 32 or 64 bits). Use for whole numbers.
-- `Integer`: Integer numbers (arbitrary precision). Use for very large whole numbers.
-- `Float`: Single-precision floating-point numbers (decimal numbers).
-- `Double`: Double-precision floating-point numbers. Use when precision is important.
-- `Bool`: Boolean values (`True` or `False`).
-- `Char`: Single characters (e.g., 'a').
-- `String`: A list of characters (e.g., "hello").

intVal :: Int
intVal = 42

integerVal :: Integer
integerVal = 12345678901234567890

stringVal :: String
stringVal = "A string"

-- Type Classes:
-- -------------
-- A type class is a collection of types that support certain operations (like
-- interfaces in other languages). For example, the `Num` type class includes
-- types that behave like numbers, so you can add them. Type classes enable
-- ad-hoc polymorphism (overloading), allowing functions to behave differently
-- based on the type of data they receive.
-- Syntax:
-- class TypeClassName a where
--   method1 :: a -> ...
--   method2 :: a -> ...

-- Common Type Classes:
-- --------------------
-- `Eq`:  Types that support equality (`==`, `/=`).
-- `Ord`: Types that support ordering (`<`, `>`, `<=`, `>=`).
-- `Show`: Types that can be converted to a string (`show`).
-- `Read`: Types that can be created from a string (`read`).
-- `Num`: Numeric types (Int, Integer, Float, Double).
-- `Integral`: Integer types (Int, Integer).
-- `Floating`: Floating-point types (Float, Double).

-- Example of using a type class constraint in a function:
showExample :: Show a => a -> String -- `Show a =>` means "for any type 'a' that has a Show instance"
showExample x = "The value is: " ++ show x

-- Define a custom type class:
class MyShow a where
  myShow :: a -> String

-- Creating Instances:
-- Use the `instance` keyword to make a type an instance of a type class,
-- providing specific implementations for the type class methods.
-- Syntax:
-- instance TypeClassName MyType where
--   method1 x = ...
--   method2 x = ...

instance MyShow Bool where
  myShow True  = "Boolean True"
  myShow False = "Boolean False"

-- Example with a custom type class
class Describable a where
  description :: a -> String

instance Describable TrafficLight where
  description Red    = "Stop!"
  description Yellow = "Caution!"
  description Green  = "Go!"

-- Derived Instances:
-- Haskell can automatically derive instances for simple type classes (Eq, Ord, Show)
-- using the `deriving` keyword.

data Color = Blue | Green deriving (Show, Eq)

-- Type Constraints:
-- Constrain type variables in function signatures using type classes to specify
-- required capabilities of the type.
-- Syntax:
-- func :: TypeClass a => a -> ...

printAndShow :: Show a => a -> String
printAndShow x = show x

-- ---------------------------------------------------------------------------------
-- 4. Defining Functions
-- ---------------------------------------------------------------------------------

-- Functions are defined with their name, parameters, and body.
-- Syntax:
-- functionName :: TypeSignature
-- functionName parameter1 parameter2 = expression

add :: Int -> Int -> Int
add x y = x + y

-- Function Application:
-- --------------------
-- Functions are applied by simply writing the function name followed by its
-- arguments, separated by spaces.

result :: Int
result = add 5 3

-- Currying:
-- ---------
-- Haskell functions are curried, meaning a function that appears to take multiple
-- arguments actually takes a single argument and returns a function that takes
-- the next argument, and so on.

addOne :: Int -> Int
addOne = add 1

resultCurried :: Int
resultCurried = addOne 5 -- evaluates to 6

-- Function Composition:
-- --------------------
-- You can combine functions using the `.` operator.
-- (f . g) x is equivalent to f (g x).

multiplyByTwo :: Int -> Int
multiplyByTwo x = x * 2

addOneThenMultiplyByTwo :: Int -> Int
addOneThenMultiplyByTwo = multiplyByTwo . addOne

compositionResult :: Int
compositionResult = addOneThenMultiplyByTwo 4

-- Infix Functions:
-- ----------------
-- Functions can be used in infix notation if their name consists of symbols.
-- You can also use backticks to use regular functions infix.

infixAdd :: Int -> Int -> Int
infixAdd x y = x + y

infixResult :: Int
infixResult = 5 `infixAdd` 3

power :: Int -> Int -> Int
power x y = x ^ y

powerResult :: Int
powerResult = 2 `power` 3

-- ---------------------------------------------------------------------------------
-- 5. Control Flow
-- ---------------------------------------------------------------------------------

-- If-Then-Else:
-- -------------
-- Standard conditional expression.

maxOfTwo :: Int -> Int -> Int
maxOfTwo x y = if x >= y then x else y

-- Guards:
-- ------
-- Guards are boolean expressions attached to function definitions, allowing you
-- to define different behavior based on input conditions.
-- Syntax:
-- functionName :: TypeSignature
-- functionName parameter
--   | condition1 = expression1
--   | condition2 = expression2
--   | otherwise  = defaultExpression

absoluteValue :: Int -> Int
absoluteValue n
  | n >= 0    = n
  | otherwise = -n

-- Where Clauses:
-- -------------
-- Used to define local bindings within a function. They come after the function
-- body.
-- Syntax:
-- functionName :: TypeSignature
-- functionName parameters =
--   expression
--   where
--     localBinding1 = value1
--     localBinding2 = value2

calculateArea :: Double -> Double -> Double
calculateArea width height = area
  where
    area = width * height

-- Let Expressions:
-- ---------------
-- Introduce local bindings within an expression.
-- Syntax:
-- let binding1 = value1
--     binding2 = value2
-- in expression

exampleLet :: Int
exampleLet = let x = 10
               y = 20
           in x + y

-- Case Expressions:
-- ---------------
-- Provide a way to perform pattern matching on values.
-- Syntax:
-- case expression of
--   pattern1 -> result1
--   pattern2 -> result2
--   _        -> defaultResult

describeBool :: Bool -> String
describeBool b = case b of
  True  -> "It's true!"
  False -> "It's false!"

-- ---------------------------------------------------------------------------------
-- 6. Lists
-- ---------------------------------------------------------------------------------

-- Ordered collections of elements of the same type.
-- Syntax:
-- [element1, element2, element3]

exampleList :: [Int]
exampleList = [1, 2, 3, 4, 5]

-- Common List Operations:
-- ----------------------
-- `head`: Returns the first element of a list.
-- `tail`: Returns the list without the first element.
-- `null`: Checks if a list is empty.
-- `length`: Returns the number of elements in a list.
-- `(++)`: Concatenates two lists.
-- `(:)`: Adds an element to the beginning of a list (the cons operator).
-- `!!`: Accesses an element at a specific index (0-based).

headExample :: Maybe Int
headExample xs = if null xs then Nothing else Just (head xs)

tailExample :: Maybe [Int]
tailExample xs = if null xs then Nothing else Just (tail xs)

concatExample :: [Int]
concatExample = [1, 2] ++ [3, 4]

consExample :: [Int]
consExample = 0 : [1, 2]

indexExample :: Maybe Int
indexExample xs i = if i >= 0 && i < length xs then Just (xs !! i) else Nothing

-- List Comprehensions:
-- --------------------
-- A concise way to create lists by specifying the elements based on other lists.
-- Syntax:
-- [expression | variable <- list, condition]

squares :: [Int]
squares = [x * x | x <- [1..5]]

evenSquares :: [Int]
evenSquares = [x * x | x <- [1..10], even x]

-- Common List Functions (from the Prelude):
-- ----------------------------------------
-- `map`: Applies a function to each element of a list.
-- `filter`: Creates a new list containing elements that satisfy a predicate.
-- `foldl` (fold left): Combines elements of a list using a binary function and a starting value.
-- `foldr` (fold right): Similar to `foldl` but operates from the right.

mapExample :: [Int]
mapExample = map (+ 1) [1, 2, 3]

filterExample :: [Int]
filterExample = filter even [1..10]

foldlExample :: Int
foldlExample = foldl (+) 0 [1, 2, 3, 4]

foldrExample :: Int
foldrExample = foldr (+) 0 [1, 2, 3, 4]

-- ---------------------------------------------------------------------------------
-- 7. Tuples
-- ---------------------------------------------------------------------------------

-- Fixed-size collections of elements that can be of different types.
-- Syntax:
-- (element1, element2, element3)

exampleTuple :: (Int, String, Bool)
exampleTuple = (1, "hello", True)

-- Common Tuple Operations:
-- -----------------------
-- `fst`: Returns the first element of a pair (2-tuple).
-- `snd`: Returns the second element of a pair.

firstOfPair :: (a, b) -> a
firstOfPair (x, _) = x

secondOfPair :: (a, b) -> b
secondOfPair (_, y) = y

-- Pattern Matching with Tuples:
-- ----------------------------
-- Tuples can be easily deconstructed using pattern matching.

addPair :: (Int, Int) -> Int
addPair (x, y) = x + y

-- ---------------------------------------------------------------------------------
-- 8. Input and Output
-- ---------------------------------------------------------------------------------

-- Haskell is a purely functional language, so side effects (like input/output)
-- are managed using the `IO` type. A value of type `IO a` represents an
-- action that, when performed, may interact with the outside world and produce
-- a value of type `a`.

helloIO :: IO ()
helloIO = putStrLn "Hello, IO!"

-- Common IO Actions:
-- -----------------
-- `putStrLn`: Prints a string to the console with a newline.
-- `putStr`: Prints a string to the console without a newline.
-- `print`: Prints a value of a type in the `Show` class.
-- `getLine`: Reads a line of input from the console.
-- `readFile`: Reads the content of a file into a string.
-- `writeFile`: Writes a string to a file.

getName :: IO String
getName = do
  putStrLn "What is your name?"
  getLine

-- The `do` Notation:
-- ---------------
-- Provides a way to sequence IO actions.

greet :: IO ()
greet = do
  name <- getName
  putStrLn ("Hello, " ++ name ++ "!")

-- Return Values in `IO`:
-- ---------------------
-- Use `return` to lift a pure value into the `IO` context.

pureValue :: IO Int
pureValue = return 42

-- Sequencing IO Actions:
-- ----------------------
-- The `>>` operator can be used to sequence IO actions when the result of the
-- first action is not needed.

sequenceActions :: IO ()
sequenceActions = putStrLn "First action" >> putStrLn "Second action"

-- ---------------------------------------------------------------------------------
-- 9. Modules
-- ---------------------------------------------------------------------------------

-- Organize Haskell code into reusable units.
-- Example (in a file named `MyModule.hs`):

module MyModule (
  myFunction,
  MyType(..) -- Export all constructors
) where

myFunction :: Int -> Int
myFunction x = x + 1

data MyType = TypeA Int | TypeB String deriving (Show)

-- Exporting Declarations:
-- -----------------------
-- Use the export list in the `module` declaration to specify what names are
-- visible outside the module.

module MyModule (myFunction, MyType) where

-- Importing Modules:
-- -----------------
-- Use the `import` keyword to bring names from other modules into the current
-- scope.
import MyModule

-- Qualified Imports:
-- -----------------
-- Import a module with `qualified` to require using the module name as a prefix.

import qualified Data.List as L
reversedList = L.reverse [1, 2, 3]

-- Hiding Imports:
-- ---------------
-- Import specific names from a module and hide others using `hiding`.

import Data.Maybe (fromJust) hiding (isJust, isNothing)

-- ---------------------------------------------------------------------------------
-- 10. Algebraic Data Types (ADTs)
-- ---------------------------------------------------------------------------------

-- Allow you to define your own composite data types.

-- Sum Types (Tagged Unions):
-- --------------------------
-- Represent a value that can be one of several possible forms.

data Shape = Circle Double
           | Rectangle Double Double
           deriving (Show)

-- Product Types (Records):
-- ------------------------
-- Combine multiple values into a single type.

data Person = Person { name :: String
                     , age  :: Int
                     } deriving (Show)

-- Constructors:
-- -------------
-- Functions that create values of the ADT.

myCircle :: Shape
myCircle = Circle 5.0

myPerson :: Person
myPerson = Person { name = "Alice", age = 30 }

-- Pattern Matching with ADTs:
-- --------------------------
-- ADT values can be easily deconstructed using pattern matching.

area :: Shape -> Double
area (Circle r)    = pi * r * r
area (Rectangle w h) = w * h

getNamePerson :: Person -> String
getNamePerson (Person n _) = n

-- ---------------------------------------------------------------------------------
-- 11. Type Aliases and Newtypes
-- ---------------------------------------------------------------------------------

-- Give existing types new names, improving readability.

type Name = String
type Age = Int

greetPerson :: Name -> String -> String
greetPerson name city = "Hello, " ++ name ++ " from " ++ city

-- Newtypes:
-- ---------
-- Create a new type with the same runtime representation as an existing type.
-- Used for type safety.

newtype Email = Email String deriving (Show)

validateEmail :: String -> Maybe Email
validateEmail s = if "@" `elem` s then Just (Email s) else Nothing

-- ---------------------------------------------------------------------------------
-- 12. Functors
-- ---------------------------------------------------------------------------------

-- Functors are types that can be "mapped over".  Think of them as containers
-- that you can apply a function to every value within, without changing the structure
-- of the container itself.

-- Using the standard type class `Functor`
class Functor f where
  fmap :: (a -> b) -> f a -> f b

-- Laws of Functors:
-- ----------------
-- - Identity: `fmap id = id`
-- - Composition: `fmap (f . g) = fmap f . fmap g`

-- Common Functors:
-- ----------------
-- - `List ([])` (a list of items)
-- - `Maybe` (an optional value)
-- - `IO` (an action that may interact with the outside world)
-- Example with Maybe
maybeIncrement :: Maybe Int -> Maybe Int
maybeIncrement m = fmap (+ 1) m

-- Example with List:
-- Imagine you have a list of prices and want to apply a discount to each.
applyDiscount :: Double -> [Double] -> [Double]
applyDiscount discount prices = fmap (\price -> price * (1 - discount)) prices
-- Here, we're mapping a function over the list of prices.

-- Example with IO
printLength :: IO String -> IO ()
printLength ioString = fmap length ioString >>= print

-- ---------------------------------------------------------------------------------
-- 13. Applicatives
-- ---------------------------------------------------------------------------------

-- Applicatives enhance Functors by allowing application of functions within a
-- context. Think of "context" as an extra layer around a value that gives
-- some added meaning. Example: `Maybe` adds the context of "may or may not exist"
-- An `IO` adds the context of "an action that may perform input output".

-- pure lifts a value into a context.
-- <*> allows functions within a context to be applied to values in a context.
class Functor f => Applicative f where
  pure :: a -> f a  
  (<*>) :: f (a -> b) -> f a -> f b

-- Laws of Applicatives:
-- --------------------
-- Identity: `pure id <*> v = v` (applying the identity function to `v` results in `v`)
-- Homomorphism: `pure f <*> pure x = pure (f x)` (applying a pure function to pure value)
-- Interchange: `u <*> pure y = pure ($ y) <*> u` (apply a function `u` to pure `y`)
-- Composition: `pure (.) <*> u <*> v <*> w = u <*> (v <*> w)` (composition)

-- Common Applicatives:
-- -------------------
-- - `Maybe`
-- - `List ([])`
-- - `IO`

-- Example with Maybe.
-- Let's say you have two optional numbers and want to add them,
-- returning Nothing if either is missing.
addMaybe :: Maybe Int -> Maybe Int -> Maybe Int
addMaybe mx my = pure (+) <*> mx <*> my

-- Example with List.
-- Let's say you have a list of functions and a list of values,
-- and you want to apply all functions to all values.
multiplyLists :: [Int -> Int] -> [Int] -> [Int]
multiplyLists funcs values = pure ($) <*> funcs <*> values
-- This will apply each function to each value, resulting in a list
-- of all possible results.
--For Example : multiplyLists [(+1),(*2)] [1,2,3] == [2,3,4,2,4,6]

-- Example with IO
readAndAddTwo :: IO Int -> IO Int -> IO Int
readAndAddTwo ioNum1 ioNum2 = pure (+) <*> ioNum1 <*> ioNum2

-- ---------------------------------------------------------------------------------
-- 14. Monads
-- ---------------------------------------------------------------------------------

-- Monads are a powerful abstraction for sequencing computations, especially those
-- involving side effects or contexts. Monads also build on top of Applicatives
-- The `Monad` type class defines `return` (same as `pure`) and `(>>=)` (bind).

-- Using the standard type class `Monad`
class Applicative m => Monad m where
  (>>=) :: m a -> (a -> m b) -> m b

-- Laws of Monads:
-- ---------------
-- - Left identity: `return a >>= k = k a`
-- - Right identity: `m >>= return = m`
-- - Associativity: `(m >>= f) >>= g = m >>= (\x -> f x >>= g)`

-- Common Monads:
-- --------------
-- - `Maybe` (for computations that might fail)
-- - `List ([])` (for non-deterministic computations)
-- - `IO` (for computations with side effects)
-- - `Either` (for computations that might result in an error value)

-- The `do` Notation for Monads:
-- ----------------------------
-- Makes monadic code look more sequential.
-- Example with Maybe
-- Let's consider a chain of calculations that might fail.
safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0 = Nothing
safeDivide x y = Just (x `div` y)

chainMaybeDo :: Maybe Int -> Maybe Int -> Maybe Int
chainMaybeDo mx my = do
  x <- mx
  y <- my
  safeDivide x y

-- Example with IO.
-- Imagine you want to ask the user for their name and age, then print them.
askForName :: IO String
askForName = do
  putStrLn "What is your name?"
  getLine

askForAge :: IO Int
askForAge = do
  putStrLn "What is your age?"
  ageStr <- getLine
  return (read ageStr :: Int)

--Example of using the previous IO actions.
greetWithAge :: IO ()
greetWithAge = do
    name <- askForName
    age <- askForAge
    putStrLn ("Hello, " ++ name ++ ", you are " ++ show age ++ " years old!")

-- ---------------------------------------------------------------------------------
-- 15. Error Handling
-- ---------------------------------------------------------------------------------

-- Ways to Handle Errors:
-- ----------------------
-- - `Maybe`: Represents a computation that might fail.
-- - `Either`: Represents a computation that can result in either a success value
--   or an error value.
-- - Exceptions: Can be thrown and caught using `IO`.

-- Working with `Maybe`:
-- --------------------
-- Use pattern matching or functions like `fromMaybe` to extract values.

fromMaybeExample :: Int
fromMaybeExample = fromMaybe 0 (safeDivide 10 0)

-- Working with `Either`:
-- ---------------------
-- Typically, the `Left` constructor is used for errors and `Right` for success.

type ErrorMessage = String
data Result a = Success a | Failure ErrorMessage deriving (Show)

safeDivideEither :: Int -> Int -> Either String Int
safeDivideEither _ 0 = Left "Division by zero"
safeDivideEither x y = Right (x `div` y)

-- Handling Exceptions:
-- -------------------
-- Use `catch` from `Control.Exception`.

import Control.Exception

fileReadSafe :: FilePath -> IO (Either IOException String)
fileReadSafe path = catch (Right <$> readFile path) (\e -> return (Left e))

-- ---------------------------------------------------------------------------------
-- 16. Testing
-- ---------------------------------------------------------------------------------

-- Popular Testing Libraries:
-- -------------------------
-- - HUnit (unit testing)
-- - QuickCheck (property-based testing)

-- Writing Unit Tests with HUnit:
-- -----------------------------
-- Define test cases and run them. (Requires importing `Test.HUnit`)

import Test.HUnit
testAdd :: Test
testAdd = TestCase $ assertEqual "Adding positive numbers" 3 (add 1 2)

-- Writing Property Tests with QuickCheck:
-- --------------------------------------
-- Specify properties that your functions should satisfy. (Requires importing `Test.QuickCheck`)

import Test.QuickCheck
prop_addCommutative :: Int -> Int -> Bool
prop_addCommutative x y = add x y == add y x

-- ---------------------------------------------------------------------------------
-- 17. Profiling and Optimization
-- ---------------------------------------------------------------------------------

-- Profiling: Measure Performance:
-- -----------------------------
-- Measure the performance of your Haskell code to identify bottlenecks.
-- Use GHC's profiling capabilities (`-prof`, `-fprof-auto`, `-fprof-cafs`).

-- Optimization Techniques:
-- -----------------------
-- - Strictness: Use `seq` or `!` to force evaluation.
-- - Compiler Flags: Explore optimization flags like `-O2`.
-- - Data Structures: Choose appropriate data structures.
-- - Algorithm Choice: Select efficient algorithms.
-- Example of forcing evaluation:
strictAdd :: Int -> Int -> Int
strictAdd x y = x `seq` y `seq` (x + y)

-- ---------------------------------------------------------------------------------
-- 18. Concurrency and Parallelism
-- ---------------------------------------------------------------------------------

-- Concurrency is about managing multiple tasks at once, while parallelism is
-- about executing multiple tasks simultaneously.

-- Lightweight Threads:
-- -------------------
-- Haskell supports lightweight concurrency using threads managed by the runtime.
-- Example using `forkIO`:
import Control.Concurrent

concurrentHello :: IO ()
concurrentHello = do
  _ <- forkIO (putStrLn "Hello from another thread!")
  putStrLn "Hello from the main thread!"

-- Parallel Evaluation:
-- --------------------
-- The `par` and `pseq` functions from `Control.Parallel.Strategies` can be used
-- to introduce parallelism.

import Control.Parallel.Strategies

parallelSum :: [Int] -> Int
parallelSum xs = sum xs `using` parListChunk 100 rseq

-- Software Transactional Memory (STM):
-- -----------------------------------
-- Provides a way to manage shared mutable state safely in concurrent programs.
-- (Requires importing `Control.Concurrent.STM`)

-- ---------------------------------------------------------------------------------
-- 19. Template Haskell
-- ---------------------------------------------------------------------------------

-- Metaprogramming in Haskell, allowing you to generate Haskell code at compile time.
-- (Requires the `TemplateHaskell` language extension).

{-# LANGUAGE TemplateHaskell #-}
module MyModule where
import Language.Haskell.TH

generateGreeting :: Q Dec
generateGreeting = [d| greeting :: String ; greeting = "Hello, Template Haskell!" |]

$(generateGreeting)

-- Example of using Template Haskell
main :: IO ()
main = putStrLn greeting

-- ---------------------------------------------------------------------------------
-- 20. Generalized Algebraic Data Types (GADTs)
-- ---------------------------------------------------------------------------------

-- Allow you to specify more precise type information for data constructors, enabling
-- more invariants to be encoded in the type system.
-- (Requires the `GADTs` language extension).

{-# LANGUAGE GADTs #-}
data Expr a where
  I :: Int -> Expr Int
  B :: Bool -> Expr Bool
  Add :: Expr Int -> Expr Int -> Expr Int
  If :: Expr Bool -> Expr a -> Expr a -> Expr a

eval :: Expr a -> a
eval (I i) = i
eval (B b) = b
eval (Add x y) = eval x + eval y
eval (If c t e) = if eval c then eval t else eval e

-- ---------------------------------------------------------------------------------
-- 21. Type Families
-- ---------------------------------------------------------------------------------

-- Allow you to define functions at the type level.  Enable more advanced type-level
-- programming by computing types based on other types.
-- (Requires the `TypeFamilies` language extension).

{-# LANGUAGE TypeFamilies #-}
class Collection c where
  type Elem c
  fromList :: [Elem c] -> c
  toList :: c -> [Elem c]

instance Collection [a] where
  type Elem [a] = a
  fromList = id
  toList = id

-- ---------------------------------------------------------------------------------
-- 22. Arrows
-- ---------------------------------------------------------------------------------

-- A generalization of monads, providing a more abstract way to describe
-- computations, particularly useful for composing computations in a declarative style.
-- (Requires importing `Control.Arrow`).

{-# LANGUAGE Arrows #-}
import Control.Arrow

process :: String -> String
process = words >>> map (++ "!") >>> unwords

main :: IO ()
main = print $ process "hello world"

-- ---------------------------------------------------------------------------------
-- 23. Lenses
-- ---------------------------------------------------------------------------------

-- Provide a way to access and modify parts of data structures in a composable and
-- type-safe manner, simplifying working with complex data.
-- (Requires importing a lens library like `lens`).

{-# LANGUAGE TemplateHaskell #-}
import Control.Lens

data Address = Address { _street :: String, _city :: String } deriving (Show)
data Person = Person { _name :: String, _address :: Address } deriving (Show)

makeLenses ''Address
makeLenses ''Person

main :: IO ()
main = do
  let person = Person "Alice" (Address "Main St" "Anytown")
      updatedPerson = person & address . city .~ "New City"
  print updatedPerson

-- Happy Haskelling!