(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~ Drop Every N'th Element From a List
  29/10/2025

  ---
    Drop every N'th element from a list.
  ---
*)

let list =  ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"];;

let drop l n =
  let rec drop acc c n = function
  | hd::tl when c=(n-1) -> drop acc 0 n tl
  | hd::tl -> drop (hd::acc) (c+1) n tl
  | [] -> acc 

in List.rev (drop [] 0 n l);;


let result = drop list 3;;
