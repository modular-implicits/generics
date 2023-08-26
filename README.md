# Generics

The project provides an implementation of *generics*, inspired by Haskell's [GHC.Generics](https://hackage.haskell.org/package/base/docs/GHC-Generics.html),
which is, in turn, based on the techniques described in the paper [*A generic deriving mechanism for Haskell*](https://dl.acm.org/doi/pdf/10.1145/2088456.1863529)

It is composed of two libraries:

* `generics_core` (in the `core/` directory), which contains the definitions of `Generic`
* `generics` (in the `lib/` directory), which enables automatic derivation of `Show`, `Eq`, `Ord`, and memoisation using a trie, partly just as a demonstration of how to use generics

The former has no dependencies; the latter depends on the [imp](https://github.com/modular-implicits/imp) library.
