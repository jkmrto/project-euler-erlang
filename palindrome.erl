-module(palindrome).
-export([is_palindrome/1]) .

is_palindrome(Number) ->
  ListNumbers = integer_to_list(Number),
  case  is_pair_length(ListNumbers) of
    true -> is_palindrome_pair_length(ListNumbers);
    false -> is_palindrome_unpair_length(ListNumbers)
  end .

is_palindrome_pair_length(ListNumbers) ->
  {Member1, ReversedMember2}  = lists:split(length(ListNumbers) div 2, ListNumbers),
  Member1 == lists:reverse(ReversedMember2) .

is_palindrome_unpair_length(ListNumbers) ->
  {Member1, [_| ReversedMember2]}  = lists:split((length(ListNumbers) div 2), ListNumbers),
  Member1 == lists:reverse(ReversedMember2) .

is_pair_length(ListNumbers) ->
  0 == (length(ListNumbers) rem 2).