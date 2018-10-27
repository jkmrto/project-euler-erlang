-module(fibonnaci).
-export([get_sequence_up_to_number/1 ]).

get_sequence_up_to_number(LimitNumber) ->
    fib_up_to_number([2, 1], LimitNumber) .

fib_up_to_number( [ Last | [PreviousLast | _ ]] = FibSequence , LimitNumber) ->
    NextFib = Last + PreviousLast ,
    if 
        (NextFib  < LimitNumber) -> 
            fib_up_to_number([NextFib | FibSequence], LimitNumber) ;
        true ->  
            FibSequence 
    end .