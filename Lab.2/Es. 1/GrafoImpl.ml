module GrafoImplementato (V: Vertice.VerticeTipo) : Grafo.Grafo with type vertice = V.t = 
struct
  type vertice = V.t;;
  type arco = vertice * vertice;;
  type grafo = {
    vertici: vertice list;
    archi: arco list
  };;

  let crea vertice = {
    vertici = [vertice];
    archi = [];
  };;

  
  let connetti vertice1 vertice2 grafo = 
    if List.exists (fun (x) -> x=vertice2) grafo.vertici 
      then
        if List.exists (fun (x) -> x = vertice1) grafo.vertici
          then
            {
              vertici = grafo.vertici;
              archi= List.append grafo.archi [(vertice1, vertice2)]
              }
          else
            {
              vertici = List.append grafo.vertici [vertice1];
              archi= List.append grafo.archi [(vertice1, vertice2)]
            }
      else raise (Invalid_argument "");;

  let vicini vertice grafo = 
    List.filter (fun (x) -> fst(x) = vertice) grafo.archi|>
    List.map (fun (x) -> snd(x))
  let visita f grafo = 
    let rec visita vertice_corrente visitati grafo = 
      if not (List.exists (fun x -> x=vertice_corrente) visitati) 
        then begin
          f vertice_corrente;
          List.iter (fun (x) -> visita x ( vertice_corrente::visitati ) grafo)(vicini vertice_corrente grafo)
        end
  in visita (List.hd grafo.vertici) [] grafo;;
end
