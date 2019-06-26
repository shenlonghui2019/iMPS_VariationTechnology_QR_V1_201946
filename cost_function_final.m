function error=cost_function_final(A,B,X,Y,N_L,N_R)

y1=cost_fuuction_final_fc(A,B,A,B,N_L,N_R);
y2=cost_fuuction_final_fc(A,B,X,Y,N_L,N_R);
y3=cost_fuuction_final_fc(X,Y,X,Y,N_L,N_R);
error=y1+y3-2*y2;