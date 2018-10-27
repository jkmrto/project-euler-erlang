-module(list_utils) .
-export([max/1]).

max(List = [_|_]) -> 
  maximum(0, List) .

maximum(Maximum, [H | T]) -> 
  if
    H > Maximum -> maximum(H, T);
    true -> maximum(Maximum, T)
  end ;

maximum(Maximum, []) ->
  Maximum .