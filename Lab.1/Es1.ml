(* 

  Ferro Manuele
  Programming Language | Lab. 1 Es. 1
  20/10/2025

  ---
  Put into a list, called alkaline_earth_metals, the atomic numbers of the six alkaline earth metals: beryllium (4), magnesium (12), calcium (20), strontium (38), barium (56), and radium (88). Then
      Write a function that returns the highest atomic number in alkaline_earth_metals.
      Write a function that sorts alkaline_earth_metals in ascending order (from the lightest to the heaviest).
  Put into a second list, called noble_gases, the noble gases: helium (2), neon (10), argon (18), krypton (36), xenon (54), and radon (86). Then
      Write a function (or a group of functions) that merges the two lists and print the result as couples (name, atomic number) sorted in ascending order on the element names.
  ---
*)

type elemento = {nome:string;numeroAtomico:int}

let alkaline_earth_metals = [
  {nome="Berylium"; numeroAtomico=4};
  {nome="Barium"; numeroAtomico=56};
  {nome="Magnesium"; numeroAtomico=12};
  {nome="Calcium"; numeroAtomico=20};
  {nome="Radium"; numeroAtomico=88};
  {nome="Strontium"; numeroAtomico=38};
]

let elementoMassimo l =
  let rec elementoMassimo l massimo =
    match l with
    | hd::tl -> if hd.numeroAtomico > massimo.numeroAtomico 
                then elementoMassimo tl hd
                else elementoMassimo tl massimo
    | [] -> massimo 
in elementoMassimo l {nome="";numeroAtomico=0};;

let massimo  = elementoMassimo alkaline_earth_metals;;
Printf.printf "Elemento massimo della lista \n| Elemento: %s\n| Numero Atomico: %d\n\n" massimo.nome massimo.numeroAtomico;;

let stampaElemento elemento = Printf.printf "| Elemento: %s\t | Numero Atomico: %d\n" elemento.nome elemento.numeroAtomico;;

let rec stampaListaElemento l =
  match l with
  | hd::tl -> stampaElemento hd ; stampaListaElemento tl
  | [] -> Printf.printf "\n";;

Printf.printf "Lista:\n";;

stampaListaElemento alkaline_earth_metals;;
let comparaElementi = fun x y -> compare x.numeroAtomico y.numeroAtomico;;
let sortaListaElementi l= List.sort comparaElementi l;;
let alkaline_earth_metals_sorted = sortaListaElementi alkaline_earth_metals;;

Printf.printf "Lista sortata:\n";;
stampaListaElemento alkaline_earth_metals_sorted;;

let noble_gases = [
  {nome="Helium"; numeroAtomico=2};
  {nome="Xenon"; numeroAtomico=54};
  {nome="Neon"; numeroAtomico=10};
  {nome="Argon"; numeroAtomico=18};
  {nome="Radon"; numeroAtomico=86};
  {nome="Krypton"; numeroAtomico=36};
]

let noble_gases_sorted = sortaListaElementi noble_gases ;;

let elementi = List.merge comparaElementi alkaline_earth_metals_sorted noble_gases_sorted;;

Printf.printf "Lista mergata:\n";;
stampaListaElemento elementi;;

