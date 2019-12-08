-module(al7).
-export([at/2, skip/2, func/2, range/2]).

skip([], _) -> [];
skip(Lst, 0) -> Lst;
skip([_|T], N) -> skip(T, N - 1).

at([H|_], 0) -> H;
at([_|T], Left) -> at(T, Left - 1).

range(_I, _I) -> [];
range(I, Count) -> [I | range(I + 1, Count)].
range(Count) -> range(0, Count).

flatten(X)               -> flatten(X,[]).

flatten([],Acc)          -> Acc;
flatten([[]|T],Acc)      -> flatten(T, Acc);
flatten([[[_|_]=_|_]=H|T],Acc) -> flatten(T, flatten(H,Acc));
flatten([H|T],Acc)       -> flatten(T,Acc++[H]) .


func(Lst, N) -> flatten(func(Lst, N, [])).
func(Lst, 1, Acc) -> [Acc++[E] || E <- Lst];
func(Lst, N, Acc) ->
    [func(skip(Lst, I + 1), N - 1, Acc++[at(Lst, I)]) || I <- range(length(Lst) - N + 1)].

% reverse([H|_], 1) -> [H];
% reverse([H|T], Left) ->
%     reverse(T, Left - 1) ++ [H].
% reverse(A) -> reverse(A, length(A)).

% func(Lst, N) -> func(reverse(Lst), N, [], length(Lst) - N + 1).
% func(Lst, 1, Acc, _) -> [[I|Acc] || I <- Lst];
% func(Lst, N, Acc, Count)  ->
%     [func(skip(Lst, Ii), N - 1, [at(Lst, Ii)|Acc], Count, Ii + 1) || Ii <- range(Count)].
 

 