(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~  Last Two Elements of a List 
  27/10/2025

  ---
    Find the N'th element of a list.
  ---
*)

let list = ["a";"b";"c";"d";"e"];;

let at n l = 
  let rec at n c = function
  | [] -> None
  | hd::tl when c=n -> Some hd
  | hd::tl -> at n (c+1) tl
in at n 0 l;;


let at_noc n l = 
  let rec at_noc n = function
  | [] -> None
  | hd::tl when n=0 -> Some hd
  | hd::tl -> at (n-1) tl
in at_noc n l;;

let result = at 2 list;;
let result2 = at_noc 2 list;;
