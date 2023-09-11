An OCaml Generics Library

The library derives many other implicit modules from the Generic module.

To use the derivations available you must implement the `Generic` module for your type:

```ocaml
implicit module GenBasicSum = struct 
  type t = basicSum 
  type rep = (int genBasic, string genBasic) genSum
  let toRep = function 
                  | L x -> Left (GenBasic ("L", x))
                  | R x -> Right (GenBasic ("R", x))
  let fromRep = function
                | Left (GenBasic (_, x)) -> L x
                | Right (GenBasic (_, x)) -> R x
end
```

You may then use any module that Generics derives in this library or others:

```ocaml
assert (show (L 1) = "L 1");
```