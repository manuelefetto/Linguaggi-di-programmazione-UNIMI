module type Grafo =
    sig
        type grafo
        type arco
        type vertice
        val crea: vertice -> grafo
        val connetti: vertice -> vertice -> grafo -> grafo
        val visita:  (vertice -> unit ) -> grafo -> unit
    end