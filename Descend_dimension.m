function  [MPS_A,MPS_B]=Descend_dimension(...
    Tensor_A,Tensor_B )

  [dim_a,dim_b,dim_c,dim_d]=size(Tensor_A);
  MPS_A=reshape(Tensor_A,[dim_a*dim_b,dim_c,dim_d]);
  MPS_A=permute(MPS_A,[2 1 3]);

  [dim_a,dim_b,dim_c,dim_d]=size(Tensor_B);
  MPS_B=reshape(Tensor_B,[dim_a*dim_b,dim_c,dim_d]);
  MPS_B=permute(MPS_B,[2 1 3]);