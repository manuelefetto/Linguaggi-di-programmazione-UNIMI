-module(echo).
-export([start/0,violent_stop/0,stop/0,print/1]).

start()-> register(server, spawn_link(fun loop/0)), ok.

print(Msg) -> server ! {message , Msg}, ok.

stop() -> server ! {stop}, unregister(server), ok.
violent_stop() -> exit(whereis(server), morteCerta), unregister(server).

loop() ->
    receive
        { message, Msg } -> io:format("~p~n",[Msg]),loop();
        { stop } -> io:format("Server stopped~n")
    end.