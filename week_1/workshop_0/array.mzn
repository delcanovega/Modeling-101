int: N;
array[1..N] of var 0..9: x;

constraint sum(x) = product(x);
constraint forall([ x[i] <= x[i+1] | i in 1..N-1 ]);

solve satisfy;

output ["x = \(x)"];