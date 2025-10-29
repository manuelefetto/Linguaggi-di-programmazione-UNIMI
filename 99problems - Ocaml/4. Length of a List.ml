(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~  Length of a List 
  27/10/2025

  ---
    Find the number of elements of a list.
  ---
*)

let list = ["a";"b";"c";"d";"e"];;

let reverse l = 
  let rec reverse l acc = 
    match l with
    | [] -> acc
    | hd::tl -> reverse tl (hd::acc)
  in reverse l [];;

let result = reverse list;;



