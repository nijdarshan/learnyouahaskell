# haskell-project
A stack-based Haskell app for reading Learn You a Haskell for Great Good! via cli

### Available commands are:

- create
- insert
- show
- displayFetched
- displayParsed
- fetchAndParse
- displayParsedHTML
- fetch

### How to run

1. Clone/Download the repo
2. Go to the repo dir and run `stack build`
3. If no error (hopefully) run `stack run <command>`


#### Example: An output of displayParsedHTML
(in progress)
```
> stack run displayParsedHTML
Chapter {chapterName = "\r\n            Introduction", lessons = fromList []}
Chapter {chapterName = "About this tutorial", lessons = fromList []}
Chapter {chapterName = "So what's Haskell?", lessons = fromList []}
Chapter {chapterName = "What you need to dive in", lessons = fromList []}
Chapter {chapterName = "\r\n            Starting Out", lessons = fromList []}
Chapter {chapterName = "Ready, set, go!", lessons = fromList []}
Chapter {chapterName = "Baby's first functions", lessons = fromList []}
Chapter {chapterName = "An intro to lists", lessons = fromList []}
Chapter {chapterName = "Texas ranges", lessons = fromList []}
Chapter {chapterName = "I'm a list comprehension", lessons = fromList []}
Chapter {chapterName = "Tuples", lessons = fromList []}
Chapter {chapterName = "\r\n            Types and Typeclasses", lessons = fromList []}
Chapter {chapterName = "Believe the type", lessons = fromList []}
Chapter {chapterName = "Type variables", lessons = fromList []}
Chapter {chapterName = "Typeclasses 101", lessons = fromList []}
Chapter {chapterName = "\r\n            Syntax in Functions", lessons = fromList []}
Chapter {chapterName = "Pattern matching", lessons = fromList []}
Chapter {chapterName = "Guards, guards!", lessons = fromList []}
Chapter {chapterName = "Where!?", lessons = fromList []}
Chapter {chapterName = "Let it be", lessons = fromList []}
Chapter {chapterName = "Case expressions", lessons = fromList []}
Chapter {chapterName = "\r\n            Recursion", lessons = fromList []}
Chapter {chapterName = "Hello recursion!", lessons = fromList []}
Chapter {chapterName = "Maximum awesome", lessons = fromList []}
Chapter {chapterName = "A few more recursive functions", lessons = fromList []}
Chapter {chapterName = "Quick, sort!", lessons = fromList []}
Chapter {chapterName = "Thinking recursively", lessons = fromList []}
Chapter {chapterName = "\r\n            Higher Order Functions", lessons = fromList []}
Chapter {chapterName = "Curried functions", lessons = fromList []}
Chapter {chapterName = "Some higher-orderism is in order", lessons = fromList []}
Chapter {chapterName = "Maps and filters", lessons = fromList []}
Chapter {chapterName = "Lambdas", lessons = fromList []}
Chapter {chapterName = "Only folds and horses", lessons = fromList []}
Chapter {chapterName = "Function application with $", lessons = fromList []}
Chapter {chapterName = "Function composition", lessons = fromList []}
Chapter {chapterName = "\r\n            Modules", lessons = fromList []}
Chapter {chapterName = "Loading modules", lessons = fromList []}
Chapter {chapterName = "Data.List", lessons = fromList []}
Chapter {chapterName = "Data.Char", lessons = fromList []}
Chapter {chapterName = "Data.Map", lessons = fromList []}
Chapter {chapterName = "Data.Set", lessons = fromList []}
Chapter {chapterName = "Making our own modules", lessons = fromList []}
Chapter {chapterName = "\r\n            Making Our Own Types and Typeclasses", lessons = fromList []}
Chapter {chapterName = "Algebraic data types intro", lessons = fromList []}
Chapter {chapterName = "Record syntax", lessons = fromList []}
Chapter {chapterName = "Type parameters", lessons = fromList []}
Chapter {chapterName = "Derived instances", lessons = fromList []}
Chapter {chapterName = "Type synonyms", lessons = fromList []}
Chapter {chapterName = "Recursive data structures", lessons = fromList []}
Chapter {chapterName = "Typeclasses 102", lessons = fromList []}
Chapter {chapterName = "A yes-no typeclass", lessons = fromList []}
Chapter {chapterName = "The Functor typeclass", lessons = fromList []}
Chapter {chapterName = "Kinds and some type-foo", lessons = fromList []}
Chapter {chapterName = "\r\n            Input and Output", lessons = fromList []}
Chapter {chapterName = "Hello, world!", lessons = fromList []}
Chapter {chapterName = "Files and streams", lessons = fromList []}
Chapter {chapterName = "Command line arguments", lessons = fromList []}
Chapter {chapterName = "Randomness", lessons = fromList []}
Chapter {chapterName = "Bytestrings", lessons = fromList []}
Chapter {chapterName = "Exceptions", lessons = fromList []}
Chapter {chapterName = "\r\n            Functionally Solving Problems", lessons = fromList []}
Chapter {chapterName = "Reverse Polish notation calculator", lessons = fromList []}
Chapter {chapterName = "Heathrow to London", lessons = fromList []}
Chapter {chapterName = "\r\n            Functors, Applicative Functors and Monoids", lessons = fromList []}
Chapter {chapterName = "Functors redux", lessons = fromList []}
Chapter {chapterName = "Applicative functors", lessons = fromList []}
Chapter {chapterName = "The newtype keyword", lessons = fromList []}
Chapter {chapterName = "Monoids", lessons = fromList []}
Chapter {chapterName = "\r\n            A Fistful of Monads", lessons = fromList []}
Chapter {chapterName = "Getting our feet wet with Maybe", lessons = fromList []}
Chapter {chapterName = "The Monad type class", lessons = fromList []}
Chapter {chapterName = "Walk the line", lessons = fromList []}
Chapter {chapterName = "do notation", lessons = fromList []}
Chapter {chapterName = "The list monad", lessons = fromList []}
Chapter {chapterName = "Monad laws", lessons = fromList []}
Chapter {chapterName = "\r\n            For a Few Monads More", lessons = fromList []}
Chapter {chapterName = "Writer? I hardly know her!", lessons = fromList []}
Chapter {chapterName = "Reader? Ugh, not this joke again.", lessons = fromList []}
Chapter {chapterName = "Tasteful stateful computations", lessons = fromList []}
Chapter {chapterName = "Error error on the wall", lessons = fromList []}
Chapter {chapterName = "Some useful monadic functions", lessons = fromList []}
Chapter {chapterName = "Making monads", lessons = fromList []}
Chapter {chapterName = "\r\n            Zippers", lessons = fromList []}
Chapter {chapterName = "Taking a walk", lessons = fromList []}
Chapter {chapterName = "A trail of breadcrumbs", lessons = fromList []}
Chapter {chapterName = "Focusing on lists", lessons = fromList []}
Chapter {chapterName = "A very simple file system", lessons = fromList []}
Chapter {chapterName = "Watch your step", lessons = fromList []}
```