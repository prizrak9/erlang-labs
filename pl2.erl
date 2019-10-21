-module(pl2).
-export([do/2]).

factorial(0) -> 1;
factorial(N) when N > 0 ->
		N * factorial(N-1).
pow(_, 0) -> 1;
pow(A, 1) -> A;
pow(A, N) -> A * pow(A, N-1).

do(X, K) when 0 < X, X < 10 ->
	factorial(X*K);
	
do(X, K) when X > 1 ->
	pow(X, K).