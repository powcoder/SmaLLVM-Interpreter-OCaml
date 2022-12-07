https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
module type VARIABLE = sig
  type t = Llvm.llvalue

  val compare : t -> t -> int
end

module type VALUE = sig
  type t = Int of int | Bool of bool

  exception Invalid_argument

  exception Division_by_zero

  val of_int : int -> t

  val to_bool : t -> bool

  val print : t -> unit

  val add : t -> t -> t

  val sub : t -> t -> t

  val mul : t -> t -> t

  val div : t -> t -> t

  val cmp : Llvm.Icmp.t -> t -> t -> t
end

module Variable : VARIABLE = struct
  type t = Llvm.llvalue

  let compare = compare
end

module Value : VALUE = struct
  type t = Int of int | Bool of bool

  exception Invalid_argument

  exception Division_by_zero

  let of_int i = Int i

  let to_bool = function Bool b -> b | _ -> raise Invalid_argument

  let print = function
    | Int i -> print_endline (string_of_int i)
    | Bool b -> print_endline (string_of_bool b)

  let int_of_bool = function true -> 1 | false -> 0

  let add v1 v2 = failwith "Not implemented"

  let sub v1 v2 = failwith "Not implemented"

  let mul v1 v2 = failwith "Not implemented"

  let div v1 v2 = failwith "Not implemented"

  let cmp pred v1 v2 = failwith "Not implemented"
end

module type MEMORY = sig
  type t

  val empty : t

  val add : Variable.t -> Value.t -> t -> t

  val find : Variable.t -> t -> Value.t
end

module Memory : MEMORY = struct
  module M = Map.Make (Variable)

  type t = Value.t M.t

  let empty = M.empty

  let add = M.add

  let find = M.find
end
