function X=Canonical_Xchain(X)
%left
% 
% tensors = { R,X };
% legs    = {[-1 1],[1 -2 -3]};
% seq     = [1];
% finalOrder = [-1,-2,-3];           
%  X = ncon(tensors,legs,seq,finalOrder);
 
 
 
%%
%canonical
[dim_a,dim_b,dim_c]=size(X);
mid_X=reshape(X,[dim_a*dim_b,dim_c]);

[Ql,R]=qr(mid_X,0);
Ql=reshape(Ql,[dim_a,dim_b,dim_c]);
X=Ql;


