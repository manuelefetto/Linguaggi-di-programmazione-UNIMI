(* 

  Ferro Manuele
  Programming Language | Lab. 1 Es. 4
  19/10/2025

  ---
    Define the following functions/operators on strings:
    Let's write a function (or a pool of functions) that given a quite large text
    (over than 2000 words) counts how frequent each word occurs in the text.
    The text is read from a file (look at the pervasive module in the manual) and it is a 
    real text with punctuation (i.e., commas, semicolons, ...) that should be counted.
    Note that words with different case should be considered the same. 
  ---
*)

(* Apro il file e creo la hashtable *)
let file = open_in "testo.txt";;
let hashTable = Hashtbl.create 200;;
 

(* Funzione che va a leggere il file riga per riga, taglia in base agli spazi e inserisce dentro la hashtable *)
 let rec linee ()= 
  try 
    List.iter (fun (parola) -> 
      match Hashtbl.find_opt hashTable ((String.lowercase_ascii(parola))) with 
        |  None -> Hashtbl.add hashTable (String.lowercase_ascii(parola)) 1 
        |  _ -> Hashtbl.replace hashTable (String.lowercase_ascii(parola))  ((Hashtbl.find hashTable (String.lowercase_ascii(parola))) +1)
        ) (String.split_on_char ' ' (input_line file));
    linee()
  with End_of_file -> Printf.printf "\n";;

  linee();;

  (* Stampo la hashtable  *)
  Hashtbl.iter (fun x y -> Printf.printf "%s: %d \n" x y ) hashTable;;





