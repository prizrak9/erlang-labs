-module(pl5).
-export([take/2]).
-export([skip/2]).
-export([func/2]).

% take(_, 0) -> [];
% take([H|T], N) when N > 0, N =< length([H|T]) -> [H|take(T, N - 1)];

% skip(A, 0) -> A;
% skip([H|T], N) when N > 0, N =< length([H|T]) -> skip(T, N - 1);

% % first half ++ first half ++ second half ++ second half
% func(A, B) when length(A) rem 2 =:= 0, length(B) rem 2 =:= 0 -> 
%     HA = length(A) div 2,
%     HB = length(B) div 2,
%     take(A, HA) ++ take(B, HB) ++ skip(A, HA) ++ skip(B, HB);

take(_, 0, _) -> [];
take([H|T], N, S) when N > 0, N =< S -> [H|take(T, N - 1, S - 1)];

skip(A, 0, _) -> A;
skip([H|T], N, S) when N > 0, N =< S -> skip(T, N - 1, S - 1);

% first half ++ first half ++ second half ++ second half
func(A, B) -> 
    SA = length(A),
    SB = length(B),
    if SA rem 2 =:= 0, SB rem 2 =:= 0 ->
        HA = SA div 2,
        HB = SB div 2,
        take(A, HA, SA) ++ take(B, HB, SB) ++ skip(A, HA, SA) ++ skip(B, HB, SB);
    end.