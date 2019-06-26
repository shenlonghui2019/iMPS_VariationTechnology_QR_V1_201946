function [Tensor_A,Tensor_B]=Ascending_dimension(...
    MPS_A,MPS_B)

Physics_d=2;

MPS_A=permute(MPS_A,[2 1 3]); 
[~,dim_b,dim_c]=size(MPS_A);
Tensor_A=reshape(MPS_A,[Physics_d,Physics_d,dim_b,dim_c]);

 
MPS_B=permute(MPS_B,[2 1 3]); 
[~,dim_b,dim_c]=size(MPS_B);
Tensor_B=reshape(MPS_B,[Physics_d,Physics_d,dim_b,dim_c]);  

