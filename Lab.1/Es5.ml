(* 

  Ferro Manuele
  Programming Language | Lab. 1 Es. 5
  20/10/2025

  ---
    Define the following functions/operators on strings:
      is_palindrome: string → bool that checks if the string is palindrome, a string is palindrome when the represented sentence can be read the same way in either directions in spite of spaces, punctual and letter cases, e.g., detartrated, "Do geese see God?", "Rise to vote, sir.", ...
      operator (-): string → string → string that subtracts the letters in a string from the letters in another string, e.g., "Walter Cazzola"-"abcwxyz" will give "Wlter Col" note that the operator - is case sensitive
      anagram : string → string list → boolean that given a dictionary of strings, checks if the input string is an anagram of one or more of the strings in the dictionary
  ---
*)


let isLettera carattere = String.contains "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm" carattere ;;

let palindroma frase = 
  let x = 
    String.to_seq frase
      |> Seq.filter isLettera
      |> Seq.map Char.lowercase_ascii
      |> List.of_seq
  in List.equal Char.equal x (List.rev x)
  
let ( - ) s1 s2 =  
  String.to_seq s1 
    |> Seq.filter (fun (carattere) -> not (String.contains s2 carattere)) 
    |> String.of_seq ;;

let ordinaParolaCaseInsensitive parola = 
  String.to_seq parola
    |> List.of_seq 
    |> List.map Char.lowercase_ascii
    |> List.sort Char.compare
    |> List.to_seq
    |> String.of_seq
let anagramma parola1 lista = 
  List.fold_left (fun pal parola2 -> if (String.equal (ordinaParolaCaseInsensitive parola1) (ordinaParolaCaseInsensitive parola2)) then true else pal) false lista;;

(* Test 1*)
let frase = "Do geese see God?";;
Printf.printf "%s %B\n" frase (palindroma frase) 
(* Test 2 *)
let stringa = "Walter Cazzola";;
let stringa_da_sottrarre = "abcwxyz";;
Printf.printf "Stringa: %s\nStringa da sottrarre: %s\nRisultato: %s \n" stringa stringa_da_sottrarre (stringa-stringa_da_sottrarre)
(* Test 3 *)
let parola = "Lara";;
let listaParole = ["rala";"ralal";"aral"];;

Printf.printf "Esiste anagramma di %s nella lista? %B\n" parola (anagramma parola listaParole);;