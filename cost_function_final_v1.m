function error=cost_function_final_v1(A,B,X,Y)

y1=cost_fuuction_final_fc_v1(A,B,A,B);
y2=cost_fuuction_final_fc_v1(A,B,X,Y);
y3=cost_fuuction_final_fc_v1(X,Y,X,Y);
error=y1+y3-2*y2;