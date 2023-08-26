open Generics_core
open Imp.Data

implicit module OrdGenBasic {X : Ord} : Ord with type t = X.t basic = struct
  type t = X.t basic
  let compare (Basic (_, a)) (Basic (_, b)) = X.compare a b
end

implicit module OrdGenProd {X : Ord} {Y : Ord} : Ord with type t = (X.t, Y.t) prod = struct
  type t = (X.t, Y.t) prod
  let compare (Prod (a1, a2)) (Prod (b1, b2)) =
    let comp = X.compare a1 b1 in
    if comp = EQ then Y.compare a2 b2 else comp
end

implicit module OrdGenSum {X : Ord} {Y : Ord} : Ord with type t = (X.t, Y.t) sum = struct
  type t = (X.t, Y.t) sum
  let compare a b = match a, b with
    | Left _, Right _ -> LT
    | Right _, Left _ -> GT
    | Left a, Left b -> X.compare a b
    | Right a, Right b -> Y.compare a b
end

module OrdGeneric {X : Generic} {XRep : Ord with type t = X.rep} : Ord with type t = X.t = struct
  type t = X.t
  let compare a b = XRep.compare (toRep a) (toRep b)
end
