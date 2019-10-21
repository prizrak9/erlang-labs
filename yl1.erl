-module(yl1).
-export([at/2]).
-export([middle/1]).

at([], _) -> "list was empty";
at([H|_], 0) -> H;
at([H|T], LeftToDestination) 
    when LeftToDestination > 0, LeftToDestination < length([H|T]) -> 
        at(T, LeftToDestination - 1);
at(_, _) -> "out of range".

middle(A) when length(A) rem 2 =/= 0 -> at(A, floor(length(A) / 2));
middle(_) -> "list length must be even".
