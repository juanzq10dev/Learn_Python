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

== None
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

#codeBlock(```python
'yes' if ('qux' in ['foo', 'bar', 'baz']) else 'no' # => 'no'
```)

=== The pass statement.
- It is not possible to specify en empty block because python uses identation instead of delimiters.
- The `pass` statement solves this problem.

#codeBlock(```python
 if True:

 print('foo') # => IndentationError: expected an indented block
```)

#codeBlock(```python
 if True:
   pass

 print('foo')
```)

=== The match statement
- Equivalent to switch
