module type Generic = sig
  type t
  type rep
  val toRep : t -> rep
  val fromRep : rep -> t
end

let toRep {G : Generic}  = G.toRep

let fromRep {G : Generic} = G.fromRep

type 'a basic = Basic of (string * 'a)

type ('a, 'b) prod = Prod of ('a * 'b )

type ('a, 'b) sum = Left of 'a | Right of 'b
