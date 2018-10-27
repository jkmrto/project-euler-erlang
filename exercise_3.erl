-module(exercise_3) .
-import(prime, []) .
-import(list_utils, []) .
-export([do/1]) .

do(Number) -> 
  FactorsMap = prime:decompose_in_primer_factors(Number),
  FactorsList = maps:keys(FactorsMap),
  list_utils:max(FactorsList).

