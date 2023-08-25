module type Generic = sig
  type t
  type rep
  val toRep : t -> rep
  val fromRep : rep -> t
end

let toRep {G : Generic}  = G.toRep

let fromRep {G : Generic} = G.fromRep

type 'a basic = Basic of (string * 'a)

type ('a, 'b) prod = Prod of ('a * 'b)

type ('a, 'b) sum = Left of 'a | Right of 'b

implicit module GenericUnit :
  Generic with type t = unit and type rep = unit basic
= struct
  type t = unit
  type rep = unit basic
  let toRep () = Basic ("unit", ())
  let fromRep _ = ()
end

implicit module GenericBool :
  Generic with type t = bool and type rep = (unit basic, unit basic) sum
= struct
  type t = bool
  type rep = (unit basic, unit basic) sum
  let toRep = function
    | false -> Left (Basic ("false", ()))
    | true -> Right (Basic ("true", ()))
  let fromRep = function
    | Left _ -> false
    | Right _ -> true
end
