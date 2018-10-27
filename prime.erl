-module(prime).
-export([is_prime/1, is_divisible/2, decompose_in_primer_factors/1]) .


is_divisible(Dividend, Divider) -> 
  %io:format("~w ~w ~n", [Dividend, Divider]),
  0 == (Dividend rem Divider) .

is_prime(Number) ->
  Limit = trunc(math:ceil(math:sqrt(Number))) ,
  case Number of
    2 -> true ;
    Number -> do_is_prime(Number, Limit, 2) 
  end .
  
do_is_prime(Number, Limit, Divider ) ->
  case (is_divisible(Number, Divider)) of
    true -> false ;
    false -> 
      case (Divider + 1) > Limit of
        true -> true ;
        false -> do_is_prime(Number, Limit, (Divider + 1))
      end 
  end .

decompose_in_primer_factors(Number) ->
  Limit = trunc(math:ceil(math:sqrt(Number))),
  Factors = #{},
  FactorToEvaluate = 2,
  decompose(Number, Limit, FactorToEvaluate, Factors) .


decompose(Number, Limit, FactorToEvaluate, CurrentFactors) ->
  case prime:is_divisible(Number, FactorToEvaluate) of
    true -> 
      UpdatedFactors = upsert_factor(FactorToEvaluate, CurrentFactors),
      RestNumber = trunc(Number  / FactorToEvaluate),
      if 
        RestNumber == 1 -> 
          UpdatedFactors;
        true ->
          decompose(RestNumber, Limit, FactorToEvaluate, UpdatedFactors)
      end;
    false ->
      NewFactorToEvaluate  = FactorToEvaluate + 1,
      case NewFactorToEvaluate > Limit of
        true  -> 
          upsert_factor(Number, CurrentFactors);
        false ->  
          decompose(Number, Limit, NewFactorToEvaluate, CurrentFactors)
      end
  end.

upsert_factor(NewFactor, FactorsMap) ->
  case maps:find(NewFactor, FactorsMap) of
    {ok, FactorAccount} -> FactorsMap#{ NewFactor := 1 + FactorAccount } ;
    error -> FactorsMap#{ NewFactor => 1 }
  end .