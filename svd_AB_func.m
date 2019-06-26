function [ X_ini,    Y_ini ] = svd_AB_func(A, B, D_choose)

    tensors = { A, B };
    legs    = {[-1,-2,1],[1,-4,-3]};
    seq     = [1];
    finalOrder = [-1,-2,-3,-4];
    AB = ncon(tensors,legs,seq,finalOrder);

[Dim_X1,d,Dim_X2,d ]= size(AB);
    
% reshape tensor AB into a matrix
AB = reshape(AB, Dim_X1*d, Dim_X2*d);

% SVD decomposition
[U, S, V] = svd( AB, 'econ' ); % abU = U * S * V'
VT = V';


X_ini = U(:,1:D_choose)   *   S(1:D_choose,1:D_choose).^(1/2);
Y_ini = S(1:D_choose,1:D_choose).^(1/2)   *   VT(1:D_choose,:);

X_ini  = reshape(X_ini, Dim_X1, d, D_choose);

Y_ini  = reshape(Y_ini, D_choose, Dim_X2, d);
Y_ini  = permute(Y_ini, [1,3,2]);

end
