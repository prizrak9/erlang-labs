-module(pl7).
-export([func/1, generate/0]).

generate() ->
    [{autoCAD, gcc14},
    {max3D, gcc8},
    {cinema4DR19, roslyn},
    {visualStudio, roslyn},
    {crashCart, roslyn},
    {opera, gcc14},
    {internetExplorer, gcc8}].

withCompiler(Pairs, C1) ->
    [P2 || {P2,C2} <- Pairs, C2 =:= C1].

func(Pairs) ->
    [{C, Ps} || {C, P, Ps=[PH|_]} <- [{C, P, withCompiler(Pairs, C)} || {P,C} <- Pairs], P =:= PH].
  
% func(Pairs) ->
%     [{C, Ps} || {C, P, Ps=[PH|_]} <- [{C, P, [P2 || {P2,C2} <- Pairs, C2 =:= C]} || {P,C} <- Pairs], P =:= PH].