(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~ Tail of a list
  27/10/2025

  ---
    Write a function last : 'a list -> 'a option that returns the last element of a list
  ---
*)
let list = ["a";"b";"c";"d"];;

let last l = 
  let rec last = function
  | hd::tl when tl = [] -> Some hd
  | hd ::tl -> last tl
  | [] -> None
in last l;;

let resutl = last list;;