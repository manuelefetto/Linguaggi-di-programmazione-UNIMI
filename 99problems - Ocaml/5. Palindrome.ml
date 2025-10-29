(* 

  Ferro Manuele
  Programming Language | https://ocaml.org/exercises ~  Palindrome
  27/10/2025

  ---
    Find out whether a list is a palindrome.
  ---
*)

let list = ["x"; "a"; "m"; "a"; "x"];;

let is_palindrome s = List.rev s = s;;

let result = is_palindrome list;;
