function f = fidelity_matrix(A, I)

% A and B should be identity matrix [1,0;0,1];



X = A.^(1/2) * I * A.^(1/2);

Y = X.^(1/2);

f = trace(Y) / size(Y,1);

f = abs(f);



end