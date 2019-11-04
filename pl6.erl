-module(pl6).
-export([flatten/1]).
-export([seq/2]).
-export([sum/1]).
-export([func/1]).

flatten([],Acc)          -> Acc;
flatten([[]|T],Acc)      -> flatten(T, Acc);
flatten([[_|_]=H|T],Acc) -> flatten(T, flatten(H,Acc));
flatten([H|T],Acc)       -> flatten(T,Acc++[H]).

flatten(X)               -> flatten(X,[]).


seq(Start, Count) when Start < Count -> [Start|seq(Start + 1, Count)].

takeWhen(Row, Cond, ILen, JLen, I) -> 
    [Element || {Element, J} <- {Row, seq(0, JLen)}, 
            Cond(Element, ILen, JLen, I, J)].

takeRowWhen(Matrix, Cond, ILen, JLen) -> 
    [takeWhen(Row, Cond, ILen, JLen, I) || {Row, I} <- {Matrix, seq(0, ILen)}];
takeRowWhen([Row|_] = Matrix, Cond) -> 
    takeRowWhen(Matrix, Cond, length(Matrix), length(Row)).


sum([], Acc)    -> Acc;
sum([H|T], Acc) -> sum(T, Acc + H).

sum(L) -> sum(L, 0).

condition(Element, ILen, JLen, I, J) 
    when (J =:= I orelse J =:= ILen - I) 
    andalso I >= ILen div 2 
    andalso J >= JLen div 2  -> true;
condition(Element, ILen, JLen, I, J) -> false.


func(Matrix) ->
    sum(flatten(takeRowWhen(Matrix, fun/5 condition))).
