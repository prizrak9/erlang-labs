-module(yl1).
-export([at/2]).
-export([middle/1]).

at([], _) -> [];
at([H|_], 0) -> H;
at([H|T], Left) -> at(T, Left - 1);

middle(A) when length(A) rem 2 =/= 0 -> at(A, floor(length(A) / 2));
middle(_) -> "list length must be even".
