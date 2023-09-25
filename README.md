An OCaml Generics Library

The library derives many other implicit modules from the Generic module.

To use the derivations available you must implement the `Generic` module for your type:

```ocaml
implicit module GenBasicSum = struct 
  type t = basic 
  type rep = (int basic, string basic) sum
  let toRep = function 
                  | L x -> Left (Basic ("L", x))
                  | R x -> Right (Basic ("R", x))
  let fromRep = function
                | Left (Basic (_, x)) -> L x
                | Right (Basic (_, x)) -> R x
end
```

You may then use any module that Generics derives in this library or others:

```ocaml
assert (show (L 1) = "L 1");
```
