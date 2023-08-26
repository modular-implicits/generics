open Imp.Show
open Generics_core
open Generics.Memo

type basicSum = L of int | R of string

implicit module GenBasicSum = struct
  type t = basicSum
  type rep = (int basic, string basic) sum
  let toRep = function
                  | L x -> Left (Basic ("L", x))
                  | R x -> Right (Basic ("R", x))
  let fromRep = function
                | Left (Basic (_, x)) -> L x
                | Right (Basic (_, x)) -> R x
end

let () =
begin
  let open Generics.Show in
  let implicit module ShowGeneric = ShowGeneric in
  assert (show (L 1) = "L 1");
end

(* Testing Memo *)

type ints = L1 of int | R1 of int

implicit module IntsGeneric = struct
  type t = ints
  type rep = (int basic, int basic) sum
  let (toRep : ints -> (int basic, int basic) sum) = function
    | L1 a -> Left (Basic ("L1", a))
    | R1 b -> Right (Basic ("R1", b))
  let (fromRep : (int basic, int basic) sum -> ints) = function
    | Left (Basic (_, a)) -> L1 a
    | Right (Basic (_,b)) -> R1 b
end

let rec fib : int -> int = function
  | 0 -> 0
  | 1 -> 1
  | n -> fib (n-1) + fib (n-2)

let weirdFib : ints -> int = function
  | (L1 i) -> i
  | (R1 i) -> fib i

let () =
begin
  let m = memo weirdFib in
  (* Dune doesn't show live output when running tests, it just prints it all at the end.
     So, to test how fast they run, compare the times with different numbers of copies of this line.
     (If memoisation is working, then 2 should be barely slower than 1)
   *)
  print (m (R1 46));
  print (m (R1 46));
  print (m (R1 46));
end
