-module(counting).
-export([start/0,tot/0, dummy1/0,dummy2/0,dummy3/0]).

start() -> register(count,spawn(fun loop/0)).

tot() -> 
    count ! { count, tot },
    count ! { self(), result },
    receive
        {dictionary, Dict} -> io:format("~p~n",[Dict])
    end.

dummy1() -> io:format("Dummy 1~n",[]), count ! { count , dummy1 },ok.
dummy2() -> io:format("Dummy 2~n",[]), count ! { count , dummy2 },ok.
dummy3() -> io:format("Dummy 3~n",[]), count ! { count , dummy3 },ok.


loop() ->
    receive
        {count, Func } -> case get(Func) of
            undefined -> put(Func, 1);
            N -> put(Func, N+1)
        end,
        loop();
        { From, result } -> From ! process_info(self(), dictionary),loop()
    end.
