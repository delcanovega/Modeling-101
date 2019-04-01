int: N;
array[1..N] of var 0..3: x;

constraint x[1] = 0;
constraint x[N] = 3;
constraint forall([ x[i] + x[i+1] <= 3 | i in 1..N-1 ]);
constraint forall([ x[i] >= 2 | i in 1..N where i mod 3 = 0 ]);

var int: objective = sum(x);
solve maximize objective;

output ["\(objective) = \(x)"];