-module(pl8).
-export([func1/3, generate/0, func2/3, func3/1, func4/1]).

generate() ->
    [1,2,-5,-2,1,-7,-2,1,-1,-0,5,0,7,5,3].


func1([], AccMore, AccLess) ->
    [AccMore, AccLess];
func1([H|T], AccMore, AccLess) when H < 0 ->
    func1(T, AccMore, AccLess ++ [H]);
func1([H|T], AccMore, AccLess) ->
    func1(T, AccMore ++ [H], AccLess).

func2(List, AccMore, AccLess) ->
    case List of
        [] ->
            [AccMore, AccLess];
        [H|T] when H < 0 ->
            func2(T, AccMore, AccLess ++ [H]);
        [H|T] ->
            func2(T, AccMore ++ [H], AccLess)
    end.


func3(List) ->
    [
        lists:filter(fun(E) -> E >= 0 end, List),
        lists:filter(fun(E) -> E < 0 end, List)
    ].

func4(List) ->
    [
        [X || X <- List, X >= 0],
        [X || X <- List, X < 0]
    ].
