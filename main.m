clc
clear
D1=100;
d=2;
D=60;
% A=rand(D1,d,D1);
% B=rand(D1,d,D1);

 load MPO.mat
         
        A = GaugeFixing_Right(Gamma_A,Lambda_A); 
        B = GaugeFixing_Right(Gamma_B,Lambda_B); 
% A = TensorMaxElement1_func( A );
% B = TensorMaxElement1_func( B );

[X,Y]=iMPS_Variation_Compress(A,B,D);
