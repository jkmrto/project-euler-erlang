-module(exercise_4) .
-import(palindrome, []) .
-export([get_biggest_palindrome/2]) .

get_biggest_palindrome(Factor1, Factor2) -> 
  do_get_biggest_palindrome(Factor1, Factor2, 0).

do_get_biggest_palindrome(Factor1, SwapFrom, CurrentBiggest) ->
  StartSwappingProduct = Factor1 * SwapFrom,   
  if
     StartSwappingProduct < CurrentBiggest -> CurrentBiggest;
     true -> 
      NewBiggest = find_biggest_palin_fix_factor_and_swap_other(Factor1, SwapFrom, CurrentBiggest), 
      do_get_biggest_palindrome(Factor1 - 1, SwapFrom, NewBiggest)
  end .

find_biggest_palin_fix_factor_and_swap_other(FixedNumber, StartSwap, CurrentBiggest) ->
  case do_find_biggest_palin_fix_factor_and_swap_other(FixedNumber, StartSwap, CurrentBiggest) of
      {not_found, _} -> CurrentBiggest;
      {found, BigestPalinFound, _, _} -> BigestPalinFound
  end.

do_find_biggest_palin_fix_factor_and_swap_other(FixedNumber, SwapNumber, DownLimit) -> 
  Product = FixedNumber *  SwapNumber,
  Is_palindrome = palindrome:is_palindrome(Product),
  if
    Product < DownLimit -> 
      {not_found, io_lib:format("Not found palindrome before down limit: ~w", [DownLimit])};
    Is_palindrome -> 
      {found, Product, FixedNumber, SwapNumber };
    true -> 
      do_find_biggest_palin_fix_factor_and_swap_other(FixedNumber, SwapNumber - 1, DownLimit)
    end .

