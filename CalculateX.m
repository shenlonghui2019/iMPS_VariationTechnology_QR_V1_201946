function [RX,YL]=CalculateX(RA,BL,Ql,Qr,YL)
 YL=Canonical_Ychain(YL);
tensors = {Ql,RA,BL,Qr...
           Ql,YL,Qr};
legs    = {[1 2],[2 -2 3],[3 4 5],[5 7],...
          [1 -1],[-3 4 6],[6 7]};
seq     = [1 7 2 5 6 4 3];
finalOrder = [-1,-2,-3];             
GX= ncon(tensors,legs,seq,finalOrder); 

RX=GX;

% Ea1=Ql'*Ql;
% 
% %Possible problems 
% tensors = {YL,YL,Qr,Qr};
% legs    = {[-1 1 2],[-2 1 4],[2 3],[4 3]};
% seq     = [1,2,3,4];
% finalOrder = [-1,-2];             
% Ea2= ncon(tensors,legs,seq,finalOrder);
% 
% % diag(Ea1)
% % diag(Ea2)
% % disp('...............')
% 
% tensors = {inv(Ea1),GX,inv(Ea2)};
% legs    = {[-1 1],[1 -2 2],[2 -3]};
% seq     = [1,2];
% finalOrder = [-1,-2,-3];             
% RX= ncon(tensors,legs,seq,finalOrder);
