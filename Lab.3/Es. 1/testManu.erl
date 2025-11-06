-module(testManu).
-export([
    test_is_palindrome/0,
    test_is_an_anagram/0,
    test_factors/0,
    test_is_proper/0,
    test/3
]).

%% -------------------------------------------------------------------
%% Funzione generica di test (come definita in precedenza)
%% -------------------------------------------------------------------
test(Input, F, Output) ->
    lists:map(F, Input) =:= Output.

%% -------------------------------------------------------------------
%% Test per utilsManu:is_palindrome/1
%% -------------------------------------------------------------------
test_is_palindrome() ->
    Input = ["anna", "ciao", "otto", "erlang"],
    OutputAtteso = [true, false, true, false],
    test(Input, fun utilsManu:is_palindrome/1, OutputAtteso).

%% -------------------------------------------------------------------
%% Test per utilsManu:is_an_anagram/2
%% Nota: testiamo più casi con la stessa Word ma liste diverse
%% -------------------------------------------------------------------
test_is_an_anagram() ->
    Input = [
        {"roma", ["amor", "mora", "test"]},
        {"ciao", ["oca", "aio", "ocaio"]},
        {"abc",  ["cab", "bac"]},
        {"test", ["sett", "tets"]}
    ],
    OutputAtteso = [true, false, true, true],
    test(Input,
        fun({Word, List}) -> utilsManu:is_an_anagram(Word, List) end,
        OutputAtteso).

%% -------------------------------------------------------------------
%% Test per utilsManu:factors/1
%% -------------------------------------------------------------------
test_factors() ->
    Input = [6, 10, 15],
    OutputAtteso = [
        [1,2,3],
        [1,2,5],
        [1,3,5]
    ],
    test(Input, fun utilsManu:factors/1, OutputAtteso).

%% -------------------------------------------------------------------
%% Test per utilsManu:is_proper/1
%% -------------------------------------------------------------------
test_is_proper() ->
    Input = [6],
    OutputAtteso = [true],
    test(Input, fun utilsManu:is_proper/1, OutputAtteso).
