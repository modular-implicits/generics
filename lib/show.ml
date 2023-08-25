open Imp.Show
open Generic

implicit module ShowGenBasic {X : Show} : Show with type t = X.t basic = struct
    type t = X.t basic
    let show (Basic (s, x)) = s ^ " " ^ X.show x
end

implicit module ShowGenProd {X : Show} {Y : Show} : Show with type t = (X.t, Y.t) prod = struct
  type t = (X.t, Y.t) prod
  let show (Prod (x, y)) = X.show x ^ ", " ^ Y.show y
end

implicit module ShowGenSum {X : Show} {Y : Show} : Show with type t = (X.t, Y.t) sum = struct
  type t = (X.t, Y.t) sum
  let show = function
  | (Left a) -> X.show a
  | (Right b) -> Y.show b
end

module ShowGeneric {X : Generic} {XRep : Show with type t = X.rep} : Show with type t = X.t = struct
  type t = X.t
  let show x = XRep.show (X.toRep x)
end
