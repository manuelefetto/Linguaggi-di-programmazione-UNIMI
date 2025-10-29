(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~   Eliminate consecutive duplicates of list elements.
  27/10/2025

  ---
    Eliminate consecutive duplicates of list elements.
  ---
*)

let list = ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;

let compress l = 
  let rec compress acc = function
  | e1::e2::tl when e1 = e2 -> compress acc (e2::tl)
  | e1::e2::tl -> compress (e1::acc) (e2::tl)
  | hd :: tl -> hd::acc
  | [] -> acc
in List.rev(compress [] l);;

let result = compress list;;