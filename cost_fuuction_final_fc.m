function y=cost_fuuction_final_fc(A,B,X,Y,N_L,N_R)


tensors = { A,B,X,Y,N_L,N_R};
legs    = {[1 3 4],[4 6 7],[2 3 5],[5 6 8],[1 2],[7 8]};
seq     = [1 2 3 7 8 6 4 5];
finalOrder = [];           
 y= ncon(tensors,legs,seq,finalOrder);