(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~  Last Two Elements of a List 
  27/10/2025

  ---
    Find the last two (last and penultimate) elements of a list.
  ---
*)

let list = ["a";"b";"c";"d";"e"];;

let last_two l = 
  let rec last_two = function
  | e1::e2::tl when tl = [] -> Some (e1,e2)
  | e1::e2::tl -> last_two (e2::tl)
  | e1::tl -> None
  | []-> None 
in last_two l;;

let risultato = last_two list;;
