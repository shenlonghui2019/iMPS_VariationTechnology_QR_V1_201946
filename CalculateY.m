function [RX,YL]=CalculateY(RA,BL,Ql,Qr,RX)

  RX=Canonical_Xchain(RX);

tensors = {Ql,RA,BL,Qr,...
           Ql,RX,Qr};
legs    = {[1 2],[2 4 5],[5 -2 6],[6 7],...
          [1 3],[3 4 -1],[-3 7]};
seq     = [1 2 3 4  7 6 5];
finalOrder = [-1,-2,-3];             
GY= ncon(tensors,legs,seq,finalOrder); 

YL=GY;

% Ea2=Qr*Qr';
% 
% %Possible problems 
% tensors = {Ql,Ql,RX,RX};
% legs    = {[1 2],[1 3],[2 4 -1],[3 4 -2]};
% seq     = [1,2,3,4];
% finalOrder = [-1,-2];             
% Ea1= ncon(tensors,legs,seq,finalOrder);
% 
% % diag(Ea1)
% % diag(Ea2)
% % disp('...............')
% 
% tensors = {inv(Ea1),GY,inv(Ea2)};
% legs    = {[-1 1],[1 -2 2],[2 -3]};
% seq     = [1,2];
% finalOrder = [-1,-2,-3];             
% YL= ncon(tensors,legs,seq,finalOrder);



