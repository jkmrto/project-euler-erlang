-module(exercise_2).
-import(fibonnaci, []).
-import(divisible, []).
-export([do/0 ]).

do() ->
    Limit = 4000000,
    FibSequence = fibonnaci:get_sequence_up_to_number(Limit),
    FilteredFibSequence = lists:filter((fun(X) -> divisible:is_divisible(X, 2) end ), FibSequence),
    lists:sum(FilteredFibSequence) .