-module(co).
-export([start/0, stop/0, tot/0, dummy1/0]).

start() -> 
    register(counting, spawn_link(fun() -> counting([]) end)),
    ok.

stop() -> 
    counting ! { stop },
    unregister(counting),
    ok.

dummy1() -> 
    io:format("Executing dummy function ~n",[]),
    counting ! {self(), count, dummy1 },
    ok.

tot() -> 
    counting ! {self(), count, tot },
    counting ! { self(), results },
    receive
        { results,  State } ->  io:format("~p~n",[State]);
        _ -> io:format("Errore nella richiesta dei risultati~n")
    end,
    ok.


counting(State) -> 
    receive
        { From, count, Element } -> 
            io:format("Counting call of function ~p (PID>~p)~n",[Element, From]),
            counting(occur(Element, State, []));
        { From, results } -> From ! { results, State }, counting(State);
        { stop } -> io:format("!Counting stopped! ~n",[]);
        _ -> io:format("!Message error!",[]),
        ok
    end.

occur(Elem, [], Res) -> [ {Elem, 1} | Res]; 
occur(Elem, [ {E , N} | TL], Res) when Elem == E ->  [ {E , N+1} ] ++  TL  ++ Res;
occur(Elem, [  E | TL], Res) -> occur(Elem, TL, [E|Res]).
