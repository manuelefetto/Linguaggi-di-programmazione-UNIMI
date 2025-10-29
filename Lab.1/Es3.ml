 (* Write the matrix datatype with the following operations:

    A function zeroes to construct a matrix of size n×m filled with zeros.
    A function identity to construct the identity matrix (the one with all 0s but the 1s on the diagonal) of given size.
    A function init to construct a square matrix of a given size n filled with the first n×n integers. *)


  (* scrivo il datatype matrice *)

  type matrice = int list list ;; 
  let zeroes n m = List.init m (fun (x) -> (List.init n (fun (x) -> 0)));;

  let stampaMatrice matrice = 
    List.iter (fun (x) -> (List.iter (fun (y) -> Printf.printf "\t%d" y) x ; Printf.printf "\n")) (matrice);;
  
  let identity n m = List.init m (fun (x) -> (List.init n (fun (y) -> if x = y then 1 else 0)));;
  stampaMatrice (identity 3 3);;

  let init n m = List.init m (fun (x) -> (List.init n (fun (y) -> x*n+y)));;
 (* 0 1 2 | 0 1 2 *)
  stampaMatrice (init 3 3);;
