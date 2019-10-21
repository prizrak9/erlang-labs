-module(pl4).
-export([last/1]).
-export([take/2]).
-export([replace_first_last/1]).

last([]) -> "given list was empty";
last([H|[]]) -> H;
last([_|T]) -> last(T).

take(_, 0) -> [];
take([H|T], N) when N =< length([H|T]), N > 0 -> [H|take(T, N - 1)];
take(_, _) -> "N has to be between 0 and length".

replace_first_last([H|T]) -> [last(T)] ++ take(T, length(T) - 1) ++ [H].