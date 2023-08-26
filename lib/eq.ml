open Generics_core
open Imp.Data

implicit module EqGenBasic {X : Eq} : Eq with type t = X.t basic = struct
  type t = X.t basic
  let ( = ) (Basic (_, a)) (Basic (_, b)) = X.( = ) a b
end

implicit module EqGenProd {X : Eq} {Y : Eq} : Eq with type t = (X.t, Y.t) prod = struct
  type t = (X.t, Y.t) prod
  let ( = ) (Prod (a1, a2)) (Prod (b1, b2)) = X.( = ) a1 b1 && Y.( = ) a2 b2
end

implicit module EqGenSum {X : Eq} {Y : Eq} : Eq with type t = (X.t, Y.t) sum = struct
  type t = (X.t, Y.t) sum
  let ( = ) a b = match a, b with
    | Left a, Left b -> X.( = ) a b
    | Right a, Right b -> Y.( = ) a b
    | _ -> false
end

module EqGeneric {X : Generic} {XRep : Eq with type t = X.rep} : Eq with type t = X.t = struct
  type t = X.t
  let ( = ) a b = XRep.(=) (toRep a) (toRep b)
end
