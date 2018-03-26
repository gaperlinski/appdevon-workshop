# appdevon-workshop
Various code snippets from the 2018 AppDevCon (Amsterdam). Best to be followed by commits.

Stream-of-thought notes to accompany the commits:

## Errors
- `throws` vs `rethrows`
- Non-throwing functions are subtypes of throwing functions, so throws = “can throw”
- rethrows used for functions that accept throwing functions as arguments
- `assert()` (won’t crash in release code)
- assert message argument is actually a function so you can, for example, write the error to a file
- `precondition()` (will crash in release code too)
- Don’t always use pokemon-catch. Sometimes handle some error types at lower level
- `try?` converts throwing functions to optionals
- `try!` makes the app crash if the function throws
- `fatalError()` returns a special type Never
# Nil coalescing
- Nothing new here
- Good to use with try?
# Labeled statements
- Frowned upon thanks to **goto**
- Used in Swift to exit different scopes
# High-performance Swift
- Aim for natural, idiomatic Swift, but understand the trade-offs you’re making
- `UIImage(named:) creates a cached object and uses thread locks
- `UIImage(contentsOfFile:)` doesn’t create cached objects and no locks involved
- Value types are stack-allocated
- Objects are heap-allocated due to memory management
- Strings, Arrays, Dictionaries are **reference types** with **value-type semantics**
- When interacting with C, Swift value-types are implicitly converted to reference-types
- Due to unknown type size for protocols, when creating arrays of protocols references to values inside the array are allocated
- **Fine-grained lock**
- If a struct contains reference type, each has a retain-release cycle (**if more than 3 slower than object which has just one retain-release cycle**)
- Static vs dynamic dispatch – being explicit about types makes the compiler do a better job at optimizing the code
- Using generics vs protocols helps the compiler to create specialized functions
# Protocol-oriented programming
- Use `AnyObject` instead of `class` to create class-bound protocols
- See source code for ideas
# Functional programming
- `flatMap` → `compactMap` in Swift 4.1
- From Swift 4 `Equatable` and `Hashable` have default implementations
- Combining functions using the `>>>` operator -- look into source code
# Closures
- Closures are reference types and therefore share captured variable (see code for example)
- `@autoclosure` – converts passed argument to closure
# Pattern matching
- It's possible to pattern match tuples, also in for-in loops
# Codable
- Introduced in Swift 4, improved in 4.1
