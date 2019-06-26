function Y=Canonical_Ychain(Y)

 
 %right
 
%  tensors = { Y,L };
% legs    = {[-1 -2 1],[1 -3]};
% seq     = [1];
% finalOrder = [-1,-2,-3];           
%  Y= ncon(tensors,legs,seq,finalOrder);
 
%%
%canonical

[dim_a,dim_b,dim_c]=size(Y);
mid_Y=reshape(Y,[dim_a,dim_b*dim_c]);

[L,Qr]=lq(mid_Y,0);
Qr=reshape(Qr,[dim_a,dim_b,dim_c]);
Y=Qr;

