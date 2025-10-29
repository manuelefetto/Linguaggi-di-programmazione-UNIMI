(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~  Duplicate the Elements of a List 
  28/10/2025

  ---
    Duplicate the elements of a list.  
  ---
*)

let list = ["a"; "b"; "c"; "c"; "d"];;

let duplicate l = 
  let rec duplcate acc = function
  | hd::tl -> duplcate (hd::hd::acc) tl
  | [] -> acc
  in List.rev (duplcate [] l);; 

let result = duplicate list;;
