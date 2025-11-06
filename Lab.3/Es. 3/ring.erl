-module(ring).
-export([start/3,process/0,loop/1]).

start(M,N, Message) -> 
    io:format("Creo anello di ~p processi, numero di passaggi del messaggio: ~p~n", [N, M]),
    Pids = create_ring(N),
    [First | _] = Pids,
    io:format("Anello creato. Messaggio iniziale ...~n", []),
    First ! {pass, M, Message},
    ok.

create_ring(N)-> 
    PIds = [spawn(ring , process, [])  || _ <- lists:seq(1,N)],
    link_rings(PIds),
    PIds.

link_rings(PIds) -> 
    lists:zipwith(fun(P,Next) -> P ! {set_next, Next}end, PIds, tl(PIds) ++ [hd(PIds)]).

process() ->
    receive
        {set_next, Next} ->
            io:format("~p --> Imposto il prossimo processo a Pid: ~p ~n",[self(), Next]), 
            loop(Next)
    end.

loop(PIdNext) -> 
    receive
        {pass, 0, Message} ->
            io:format("~p --> Final message: < ~p > ~n Sendig quit message to ~p",[self(), Message, PIdNext]),
            PIdNext ! {quit},
            loop(PIdNext);
        {pass, M, Message} -> 
            io:format("~p --> Passing message: < ~p > to ~p~n",[self(), Message, PIdNext]),
            PIdNext ! {pass, M-1, Message},
            loop(PIdNext);
        {quit} ->
            io:format("~p quitting~n",[self()]),
            PIdNext ! {quit}
    end.

