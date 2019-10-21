-module(pl5).
-export([take/2]).
-export([skip/2]).
-export([func/2]).

take(_, 0) -> [];
take([H|T], N) when N > 0, N =< length([H|T]) -> [H|take(T, N - 1)];
take(_, _) -> "out of range".

skip(A, 0) -> A;
skip([H|T], N) when N > 0, N =< length([H|T]) -> skip(T, N - 1);
skip(_, _) -> "out of range".

% first half ++ first half ++ second half ++ second half
func(A, B) when length(A) rem 2 =:= 0, length(B) rem 2 =:= 0 -> 
    HA = floor(length(A)/2),
    HB = floor(length(B)/2),
    take(A, HA) ++ take(B, HB) ++ skip(A, HA) ++ skip(B, HB);
func(_, _) -> "length must be even".