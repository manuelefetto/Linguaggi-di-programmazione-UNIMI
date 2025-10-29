(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~ Run-Length Encoding
  28/10/2025

  ---
  ---
*)

let list = ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "d"];;

let encode l = 
  let rec encode c acc = function
  | e1::e2::tl when e1 = e2 -> encode (c+1) acc (e2::tl)
  | e1::e2::tl -> encode 0 ((c+1,e1)::acc) (e2::tl)
  | hd::tl -> encode 0 ((c+1,hd)::acc) []
  | [] -> acc
in List.rev( encode 0 [] l);;

let result = encode list;;