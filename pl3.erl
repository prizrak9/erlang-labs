-module(pl3).
-export([func/3]).
-export([iter/6]).



func(I, N, _) when N < I + 1 ->
	throw("out of range");
func(I, N, X) when N == I + 1 ->
	math:tan(X);
func(I, N, X) ->
	X * X / (1 + X) + func(I + 1, N, X).

iter(F, I, N, X, Xmax, _) when X >= Xmax ->
	[F(I, N, X)];
iter(F, I, N, X, Xmax, Step) ->
	[F(I, N, X) | iter(F, I, N, X + Step, Xmax, Step)].
