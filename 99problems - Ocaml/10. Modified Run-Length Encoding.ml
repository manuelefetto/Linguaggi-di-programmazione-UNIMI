(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~ Run-Length Encoding
  28/10/2025

  ---
  Modify the result of the previous problem in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

  Since OCaml lists are homogeneous, one needs to define a type to hold both single elements and sub-lists.
  ---
*)

type 'a rle =
  | One of 'a
  | Many of int * 'a

let list = ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;

let encode l = 
  let rec encode c acc = function
  | e1::e2::tl when e1 = e2 -> encode (match c with | One e -> Many (2,e) | Many (e1,e2) -> Many (e1+1,e2) ) acc (e2::tl)
  | e1::e2::tl -> encode (One e2) (c::acc) (e2::tl)
  | hd::tl -> encode (One hd) (c::acc) []
  | [] -> acc
in List.rev(encode (One "") [] l);;

let result = encode list;;