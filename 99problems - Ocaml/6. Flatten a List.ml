(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~  Palindrome
  27/10/2025

  ---
    Flatten a nested list structure.
  ---
*)

type 'a node =
| One of 'a 
| Many of 'a node list

let list = [One "a"; Many [One "b"; Many [One "c" ;One "d"]; One "e"]];;

let flatten l =
  let rec flatten acc l = 
    match l with
    | (One hd)::tl -> flatten (hd::acc) tl
    | (Many hd)::tl -> flatten (flatten acc hd) tl
    | [] -> acc
  in List.rev (flatten [] l);;

let result = flatten list;;