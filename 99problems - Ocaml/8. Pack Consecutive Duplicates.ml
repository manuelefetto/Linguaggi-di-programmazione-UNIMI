(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~   Eliminate consecutive duplicates of list elements.
  27/10/2025

  ---
    Pack consecutive duplicates of list elements into sublists.
  ---
*)

let list = ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;

let pack l = 
  let rec pack acc1 acc2 = function
  | e1::e2::tl when e1=e2 -> pack acc1 ( e1::acc2 ) (e2::tl)
  | e1::e2::tl -> pack ((e1::acc2)::acc1) [] (e2::tl)
  | hd::tl -> pack ((hd::acc2)::acc1) [] (tl)
  | [] -> acc1
in  List.rev (pack [] [] l);;

let result = pack list;;