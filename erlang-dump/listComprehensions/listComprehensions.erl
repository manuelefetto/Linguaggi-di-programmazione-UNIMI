-module(listComprehensions).
-export([quadrati/1, pari/1, sommaPossibiliCoppie/2, filtraSoloMaiuscole/1]).

quadrati(N) -> [X*X || X <- lists:seq(1,N)].

pari(N) -> [X || X <- lists:seq(2,N) , X rem 2 == 0].

sommaPossibiliCoppie(Lista1, Lista2) -> [X+Y || X <- Lista1, Y <- Lista2].

filtraSoloMaiuscole(L) -> [X || X <- L , string:uppercase(X) == X].


