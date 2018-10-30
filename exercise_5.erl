-module(exercise_5).
-export([do/1, update_accumulated_decompose_by_factor/3, update_accumulated_decompose_by_decomposed_number/2]) .
-import(prime, []).

%2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
%What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

do(Num) ->
    List = lists:seq(1, Num),
    ListDecomposedNumbers = lists:map(fun(N) -> 
        prime:decompose_in_primer_factors(N) 
        end, List) ,

    SmallestMultipleFactors = lists:foldl(fun (NumberDecompose, AccDecompose) -> 
        update_accumulated_decompose_by_decomposed_number(
            AccDecompose, NumberDecompose)
        end, #{}, ListDecomposedNumbers),
    
    lists:foldl(fun(Key, Acc) -> 
        Acc * math:pow(Key, maps:get(Key, SmallestMultipleFactors))
        end, 1.0, maps:keys(SmallestMultipleFactors)).

update_accumulated_decompose_by_decomposed_number(PreviousAccDecompose, DecomposedNumber) ->
    lists:foldl(fun (Key, AccDecompose) -> 
        update_accumulated_decompose_by_factor(
             AccDecompose, Key, maps:get(Key, DecomposedNumber))
        end, PreviousAccDecompose, maps:keys(DecomposedNumber)).

    update_accumulated_decompose_by_factor(AccumulatedDecompose, Factor, FactorTimes) ->
        case maps:get(Factor, AccumulatedDecompose, not_found) of
            not_found -> AccumulatedDecompose#{Factor => FactorTimes} ;
            OldFactorTimes -> 
                if    
                    OldFactorTimes < FactorTimes -> 
                         AccumulatedDecompose#{ Factor := FactorTimes } ;
                    true -> 
                        AccumulatedDecompose
                end
        end .