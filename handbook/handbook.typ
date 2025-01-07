#import "lib/template.typ": main
#import "lib/simpleTable.typ": simpleTable
#import "lib/codeBlock.typ": codeBlock

#show: doc => main(
  title: [
    Python - Reference Vault.
  ],
  version: "v0.1.",
  authors: ((name: "Juan Zurita", email: "juanzq10dev@gmail.com"),),
  abstract: [
    This is a collection of notes and thoughts that I've been taking in order to track my learning on Python.
    It is based on the *"Roadmap Python"* from *'roadmap.sh/python'*
  ],
  doc,
)

#show heading: set text(rgb("#1e3a8a"))
#show heading.where(level: 4): set text(13pt)

#show heading.where(level: 3): set text(15pt)

#show heading.where(level: 2): set text(17pt)

#show heading.where(level: 1): set text(20pt)

= Overview
- Python is a high level, interpreted, general-purpose programming language.
- Its design emphazises code readability with the use of significant identation.
- Python is dynamically-typed and garbage-collected.

== Naming conventions
- Python class names start with an uppercase letter. All other identifiers start with a lowercase letter.
- *Private identifiers* start with a single leading underscore e(e.g \_my\_private\_identifier)
- Identifiers with two leading underscores indicates a *strongly private* identifier.
- *Language-defined* special names #footnote[A language-defined spacial name refers to identifiers reserved by the programming language itself (e.g \_\_init\_\_ is the constructor method)] end with two trailing underscore

== Terminology
#simpleTable(
  columns: (1fr, 1fr),
  [*Term*],
  [*Concept*],
  [Suite],
  [Group of individual statements, which make a single code block],
)

= Python basics
Those are notes of some interesting things I found from the python basics.

== Python multi-line statements
Use the line continuation character (\\) to denote line should continue
#codeBlock(```python
  total = item_one + \
           item_two + \
           item_three
```)

== is vs ==
- `is` checks if two variables refer to the same object.
- `==` checks if objects have the same value.

== String formatting
Use f-strings to format string
#codeBlock(```python
 name = "Reiko"
 f"She said her name is {name}" # => "She said her name is Reiko"
```)

== None type
- None is an object
- None is a *singleton* object
- Do not use `==` to compare `None` use `is` instead. Some corner cases may fail using `==`:

== Data types
Python has the following build-in data types

#figure(
  image("./images/data_types.png"),
  caption: [
    Python Data Types
  ],
)

== Conditionals
- Python uses `if` as many other languages
- Python can use `elif` also.

=== Ternary operator
A simple form of the conditional expression.
#codeBlock(```python
<expr1> if <conditional_expr> else <expr2>
```)

Example:
#codeBlock(```python
'yes' if ('qux' in ['foo', 'bar', 'baz']) else 'no' # => 'no'
```)

=== The pass statement.
- Used to specify empty blocks in python

Wrong:
#codeBlock(```python
 if True:

 print('foo') # => IndentationError: expected an indented block
```)

Correct.
#codeBlock(```python
 if True:
   pass

 print('foo')
```)

=== The match statement
- Equivalent to switch

#codeBlock(```python
 a = 3
 match a:
  case 1:
    print("a = 1")
  case 2:
    print("a = 2")
  case 3:
    print("a = 3")
  case other:
    print("No match found")
```)

== Loops
=== Indefinite iteration (while)
- With indefinite iteration the number of times the loop executes is not explicit.

- The loop block executes as long as some condition is met.

#codeBlock(```python
 while <expression>:
  <statement(s)>
```)

==== While - else
You can also use `while-else` statement.
#codeBlock(```python
count = 0
while (count < 3):
  count = count + 1
  print("Hello")
else:
  print("Else block")

  # Output:
  #   Hello
  #   Hello
  #   Hello
  #   Else block
```)

If you use break, else statement will not execute

=== Definite iteration (for)
- The number of iterations is specified explicitly before loop execution.

Python uses `for in` syntax:
#codeBlock(```python
for <var> in <iterable>:
  <statement(s)>
```)

An iterable is a collection of objects: lists, tuples, strings and dictionaries.

#codeBlock(```python
list = ["apple", "orange", "banana"]
for i in list:
  print(i)

# Prints: apple orange banana
```)

==== How does for loop work?
Python contains the iterator object to iterate through an iterable:

#codeBlock(```python
list_ = ["apple", "orange", "banana"]

itr = iter(list_)

next(itr) # "apple"
next(itr) # "orange"
next(itr) # "banana"

next(itr) # StopIterationException
```)

So what python `for` loop does is:
+ Calls `iter()` to obtain an iterator
+ Calls `next()` to obtain each iterm from the iterator in turn.
+ Terminates the loop when `next()` raises the `StopIterator` exception.

This way all iterable objects can be the target of a for loop.

==== The range object
Python uses the range object to iterate through numbers

#codeBlock(```python
range(<begin>, <end>, <stride>)
```)

Parameters of range are:
- begin: Starting value
- end: End value
- stride: Amount of skipped values

#codeBlock(```python
for i in range(0, 10):
  print(i)
```)

Some key features of range:
- Range is an iterable object (not a list, not a tuple).
- Range objects are lazy loading

==== For - else
Similar to `which - else` else statement executes if loop finished with no break.

=== Loop Control Statements
Python provides to keywords:
- `continue`: Execution jumps to the top of the loop and expression is re-evaluated
- `break`: Terminates the loop entirely.

== Type Casting
Type casting is the process of converting data of one type to another.

There are two types of conversion in Python:
- Implicit Conversion (automatic)
- Explicit Conversion (manual)

=== Implicit Conversion
- Sometimes Python automatically converts one data-type to another.
- This occurs automatically
- Python allways converts smaller data types to larger data types to avoid the loss of data.
- Typically happens during operations that involved mixed data.
#codeBlock(```python
num_int = 6
num_float = 1.2
result = num_int + num_float # 6 (int) converts to 6.0 (float)
```)

=== Explicit Conversion
- Uses build-in function like `int()`, `float()`, `str()` to perform explicit type conversion.
- Loss of data may occur as we enforce the object to a specific data type.

== Exceptions
- Exceptions are events that disrupt the normal flow of a program's instructions.
- Python comes with many build-in exceptions.

=== Handling Exceptions
Python uses the `try` `except` block to catch and handle exceptions.

#codeBlock(```python
try:
  <statement(s)>
except:
  <statement(s)>
```)

You can catch specific exceptions:
#codeBlock(```python
try:
  <statement(s)>
except ValueError:
  <statement(s)>
```)

You can catch different exceptions at once.
#codeBlock(```python
try:
  <statement(s)>
except (ValueError, RuntimeError, TypeError):
  <statement(s)>
```)

=== How try - except works
+ First, the try statement(s) are executed.
+ If no exception occurs, the except clause is skipped.
+ If an exception occurs during the execution of a try statement, the rest of the clause is skipped. If the type matches the exception of the except, the except statement is executed.
+ If the exception does not match the exception named in the except clause, it is passed to outer try statements, if not handler is found, it is an unhandled exception and the execution stops.

=== Common built-in Exceptions
- `BaseException` is the common base class of all exceptions.
- `Exception` is the base class of all the non-fatal exceptions.
- Exceptions that are not subclasses of `Exception` are not typically hadled. They are used to indicate that the program should terminate e.g. `SystemExit` or `KeybordInterrupt`
- `Exception` catches almost all exceptions, but it is a bad practice to use it. Allways try to be specific.

=== Raising Exceptions
- Use the `raise` keyword to manually raise an exception.
- The `raise` keyword receives an argument that must be eithere an exception instance or an exception class (A class that derives from `BaseException` or `Exception`)
#codeBlock(```python
number = 10
if number > 5:
  raise Exception(f"The number should exceed be 5")
```)

- The `raise` keyword implicitely call the constructor with no arguemnts
#codeBlock(```python
raise ValueError # raise ValueError()
```)

- A simple `raise` statement re-raises a catched exception:
#codeBlock(```python
try:
  ...
except ValueError:
  ...
  raise # raise ValueError
```)

=== The finally clause (clean-up actions)
- The `finally` optional clause executes either an exception occurs ot not.
- It is intended to define clean-up actions.
#codeBlock(```python
try:
  raise KeybordInterrupt
finally:
  print("Good bye")
```)

Some things to take in count are:
- If no exception is handled by an `except` clause, the exception is re-raised after the `finally` clause has been executed.
- If the `finally` clause executes a `break`, `continue`, or `return` statement, exceptions are not re-raised.
- If the `try` statement reaches a `break`, `continue` or `return` statement, the finally clause executes before to the break, continue or return statement's execution.
- If a `finally` clause includes a `return` statement, the returned value will be the one from the `finally` statement, not the value from the `try`clause.

=== Custom Exceptions
- To define custom exceptions create a new class that inherits from the `Exception` class:
#codeBlock(```python
class CustomError(Exception):
  ...
  pass
```)

We can also customize the exception adding a constructor.

== TO DO
- Self documenting expressions
- AssertionError for debugging

== Conclusions
Some important concepts to keep in mind are:
- `==` checks if object values are equal. Meanwhile `is` checks if two variables refer to the same object.
- `None` object is a singleton.
  - That is why it is better to use `a is None` than `a == None`.
- There are two types of type conversion (casting): implicit and explicit.
- There are two types of iterations: definite and indefinite.
- `for` loop uses an iterator object:
  + Calls `iter()` to obtain an iterator
  + Calls `next()` to obtain each iter from the iterator in turn.
  + Terminates the loop when `next()` raises the `StopIterator` exception.
- The `finally` clause contain some complex cases. (Review the exceptions notes or the exceptions jupiter notebook on the repo)

= Lambdas
- Lambdas are a small anonymous function.
- They are just like normal functions and behave like them.
- The main use of lambda functions on Python is using them as arguments to higher order function.

#codeBlock(```python
lambda arguments: expressions
```)

Some main features of lambda function are:
- Do not have a name (are anonymous).
- Can have many arguments.
- Limited to one expression; no complex logic or multiple statements
- It is assumed that the single expression is returned.

*Examples:*
Lambda with multiple arguments
#codeBlock(```python
add = lambda a, b: a + b
print(add(3, 5)) # Output 8
```)

Using lambda in map
#codeBlock(```python
nums = [1, 2, 3, 4]
squared = list(map(lambda x: x ** 2, nums))
print(squared)  # Output: [1, 4, 9, 16]
```)

=== Lambdas late binding
First, we need to understand bound and unbound variables:

- A bound variable is an argument to a lambda function
#codeBlock(```python
lambda x: x + 1 # x is a bound variable
```)

- A free variable(or unbound variable) is not bound and may be referenced in the body of the expression. (IMPORTANT: When a lambda has free variables it becomes a *closure*)
#codeBlock(```python
y = 10
lambda x: x + y # y is a free variable
```)

Free variables are looked up at the time the lambda executes, not when the lambda is defined.
#codeBlock(```python
numbers = 'one', 'two', 'three'
funcs = []
for n in numbers:
  funcs.append(lambda: print(n))

# At this point funcs is a list that contain the lambda expressions.

for f in funcs:
  f() # Here lambda executes

# Output is: three, three, three
```)

To solve this use default arguments to assign the free variable at definition time:
#codeBlock(```python
numbers = 'one', 'two', 'three'
funcs = []
for n in numbers:
  funcs.append(lambda n=n: print(n)) # n defined as argument.

for f in funcs:
  f() # Here lambda executes

# Output is: one, two, three
```)

= Design Patterns
== Decorator
- Adds new functionality to an existing object without modifying its structure.
- Applied to functions and classes.

=== How to create decorators
A decorator is a function that:
+ Takes a function as an argument.
+ Uses an enclosed function to add more functionality.
+ Returns the enclosed function.

#codeBlock(```python
def uppercase_decorator(function): # decorator
    def wrapper(): # enclosed function
        func = function()
        make_uppercase = func.upper()
        return make_uppercase

    return wrapper
```)

=== Calling decorators
This is how we call decorators.

#codeBlock(```python
def say_hi():
  return 'hello there'

decorate = uppercase_decorator(say_hi)
decorate() # Output: HELLO THERE
```)

Python provides a sugar syntax #footnote("A sugar syntax is syntax designed to make code easier to read or write.") for that:

#codeBlock(```python
@uppercase_decorator
def say_hi():
    return 'hello there'

say_hi() # Output: HELLO THERE
```)

=== Applying multiple decorators
Decorators apply from the bottom up.

#codeBlock(```python
@split_string        # This applies second
@uppercase_decorator # This applies first
def say_hi():
    return 'hello there'

say_hi() # Output: [HELLO, THERE]
```)

=== Adding params to the wrapped functions
If the decorated function has params:
+ Pass the arguments to the wrapper function.
+ Inside the wrapper function, pass the arguments to the decorated function.

#codeBlock(```python
def uppercase_decorator(function):
    def wrapper(name):
        func = function(name) # decorated function
        make_uppercase = func.upper()
        return make_uppercase

    return wrapper

@uppercase_decorator
def say_hi(name):
    return f'hello there {name}'

say_hi("Alice") # Output: [HELLO, THERE]
```)

=== General purpose decorators
To define a decorator that can be applied to any function use `*args` and `**kwargs`.
#codeBlock(```python
def my_decorator(func):
    def wrapper(*args, **kwargs):
        print("Before the function call.")
        result = func(*args, **kwargs)
        print("After the function call.")
        return result
    return wrapper

@my_decorator
def greet(name):
    print(f"Hello, {name}!")

greet("Alice")
```)

=== Passing arguments to the decorator
In order to create a decorator with arguments:
+ Create a decorator maker with the decorator arguments
+ Inside it add a decorator function the wrapper function
#codeBlock(```python
def repeat(n): # decorator maker
  def decorator(func): # decorator
    def wrapper(*args, **kwargs):
      for _ in range(n):
          func(*args, **kwargs)
    return wrapper
  return decorator

@repeat(3) # decorator with argument
def greet(name):
  print(f"Hello, {name}!")

greet("Alice")
```)

=== Debugging decorators
When you decorate a function, its metadata (like name and docstring) gets replaced by the wrapper's metadata. Use `functools.wraps` decorator to preserve it.
#codeBlock(```python
from functools import wraps

def my_decorator(func):
  @wraps(func) # functool.wraps decorator
  def wrapper(*args, **kwargs):
    print("Before the function call.")
    result = func(*args, **kwargs)
    print("After the function call.")
    return result
  return wrapper
```)

= Object Oriented Programming
NOTE: These notes do not delve deeply into the concepts of Object-Oriented Programming (OOP); they focus solely on how to implement OOP using Python.
== Classes
=== Class definition
Use the `class` keyword, then add the name of the class and a colon. Any code indent below the class definition is part of the class's body:
#codeBlock(```python
class Dog:
  pass
```)

=== Adding attributes
==== Instance attributes
- Instance attributes are values specific to a particular instance of the class. (All instance has the attributes, but the values may differ)
- Attributes created in the `__init__()` are instance attributes.
- The `__init__()` function is the constructor of the functions.
- It sets the initial state of the object.
- First parameter must be `self`.
- Python uses `self` to define the new attributes on the object.
#codeBlock(```python
class Dog:
  def __init__(self, name, age):
    self.name = name
    self.age = age
```)

==== Class attributes.
- Class attributes are attributes shared by all instances.
- Variables assigned outside of `__init__()` are class attributes.
#codeBlock(```python
class Dog:
  species = "Canis familiaris" # Class attribute

  def __init__(self, name, age):
    self.name = name
    self.age = age
```)

=== Defining methods
==== Instance methods
- Functions defined inside the class are instance methods.
- An instance method always takes `self` as its first parameter.
#codeBlock(```python
class Dog:
  species = "Canis familiaris" # Class attribute

  def __init__(self, name, age):
    self.name = name
    self.age = age

  def bark(self): # instance method.
    return "Guau, guau"
```)

==== TODO
- Static methods
- Class methods

=== Private variables
Private variables do not exist on Python. However there is a convention: A name prefixed with an underscore (e.g. `_spam`) should be treated as non-public.

== Inheritance
Python supports inheritance using the next syntax
#codeBlock(```python
class DerivedClassName(BaseClassName):
  <statement(s)>
```)

Features:
- The derived class inherits all functions and variables of the base class.
- The function `super()` allows access to the parent class's methods in the child class.

=== Overriding methods
Overriding allows a child class to redefine a method that is already defined in its parent class.

#codeBlock(```python
class Animal:
  def sound(self):
    return "Some generic sound"

class Dog:
  def sound(self): # Overriding method
    return "Woof"
```)

Overriding main features:
- The method in the child class must have the same name and signature as the one in the parent class.
- Using `super()` helps retain and extend the parent class's functionality.

#codeBlock(```python
class Animal:
  def sound(self):
    return "Some generic sound"

class Dog:
  def sound(self):
    return super().sound() + "Woof" # Using super()
```)

=== Abstract classes
A class becomes abstract if it inherits from the `ABC` class (Abstract Base Class) on the `abc` module.
#codeBlock(```python
from abc import ABC, abstractmethod

# Abstract Class
class Animal(ABC):
  @abstractmethod
  def sound(self):
    pass

# Concrete subclass
class Dog(Animal):
  def sound(self):
    return "Woof!"
```)

Key features of Abstract Classes:
- *Abstract methods:* Declared using the `@abstractmethod` decorator. Subclasses are required to override those methods.
- *Partial implementation:* Abstract classes can include fully implemented methods that provdide default behavior.
- *Cannot Instantiate:* You cannot create an instance of an abstract class.

=== Multiple inheritance
A class may inherit from multiple classes
#codeBlock(```python
class DerivedClassName(BaseClass1, BaseClass2, BaseClass3):
  <statement(s)>
```)

=== Methods Resolution Order (MRO)
- Determines the order in which classes are searched for a method.
- In simple inhneritance, first it searches on the derived class, if not found, searches on the base class.
- On simple scenarios, method resolution order (MRO) goes as depth-first, left-to-right, not searching twice in the same class.
- The methods resolution order changes dynamically to support cooperative calls to `super()`.
- Dynamic ordering in MRO is necesary because all cases of multiple inheritance exhibit one or more diamond relationships (at least one parent classes can be accessed through different paths)
- Complex inheritance may not reach all conditions MRO requires. In this case Python just fails.
