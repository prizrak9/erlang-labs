-module(pl7).
-export([func/1, generate/0, withCompiler/2]).

generate() ->
    [{autoCAD, gcc14},
    {max3D, gcc8},
    {cinema4DR19, roslyn},
    {visualStudio, roslyn},
    {crashCart, roslyn},
    {opera, gcc14},
    {internetExplorer, gcc8}].

withCompiler(A, C1) ->
    [P2 || {P2,C2} <- A, C2 =:= C1].

func(A) ->
    [{C, [PH|PT]} || {C, P, [PH|PT]} <- [{C, P, withCompiler(A, C)} || {P,C} <- A], P =:= PH].
  