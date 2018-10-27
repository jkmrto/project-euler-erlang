-module(divisible).
-export([is_divisible_by_any/2, is_divisible/2, filter_divisible_by_any_value/2 ]).

is_divisible(Dividend, Divider) ->
     0 == Dividend rem Divider.
    
is_divisible_by_any(Dividiend, Dividers) -> 
    lists:any((fun(Divider) -> is_divisible(Dividiend, Divider) end), Dividers).

filter_divisible_by_any_value(List, Dividers) ->
    lists:filter( (fun(X) -> is_divisible_by_any(X, Dividers) end), List) .