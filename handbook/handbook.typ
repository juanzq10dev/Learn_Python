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

= Basic syntax
Those are notes of some interesting things I found from the python syntax.

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

== TO DO
- Type Casting
- Exceptions

== Conclusions
Some important concepts to keep in mind are:
- `==` checks if object values are equal. Meanwhile `is` checks if two variables refer to the same object.
- `None` object is a singleton.
  - That is why it is better to use `a is None` than `a == None`.
- `for` loop uses an iterator object:
  + Calls `iter()` to obtain an iterator
  + Calls `next()` to obtain each iter from the iterator in turn.
  + Terminates the loop when `next()` raises the `StopIterator` exception.

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
