(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~  Decode a Run-Length Encoded List 
  28/10/2025

  ---
Given a run-length code list generated as specified in the previous problem, construct its uncompressed version.
  ---
*)

type 'a rle =
  | One of 'a
  | Many of int * 'a

let list = [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d"; Many (4, "e")];;

let rec concN n elem list =
  match n with
  | x when x=0 -> list 
  | x -> concN (n-1) elem (elem::list)

let decode l = 
  let rec decode acc = function
  | (One hd)::tl -> decode (hd::acc) tl
  | (Many (m1,m2))::tl -> decode (concN m1 m2 acc) tl
  | [] -> acc
  in List.rev (decode [] l);;

let result = decode list;;
