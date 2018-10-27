-module(exercise_1).
-export([do/1]).
-import(divisible, []).

do(Limit_number) -> 
    List = lists:seq(1, (Limit_number - 1)),  
    lists:sum(divisible:filter_divisible_by_any_value(List, [3 ,5])) .