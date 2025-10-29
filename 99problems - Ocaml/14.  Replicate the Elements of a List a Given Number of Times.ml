(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~   Replicate the Elements of a List a Given Number of Times
  29/10/2025

  ---
    Replicate the elements of a list a given number of times.
  ---
*)

let list = ["a"; "b"; "c"; "c"; "d"];;

let rec repeat n elem acc =
  match n with
  | x when x = 0 -> acc
  | x -> repeat (x-1) elem (elem::acc);;

let replicate l n= 
  let rec replicate n acc = function
  | hd::tl -> replicate n (repeat n hd acc) tl
  | [] -> acc
  in List.rev (replicate n [] l);; 

let result = replicate list 3;;
