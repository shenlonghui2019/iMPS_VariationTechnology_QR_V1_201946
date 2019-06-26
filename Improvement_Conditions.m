%Improvement Conditions Number 
function [Ql,R,L,Qr]=Improvement_Conditions(L_point,R_point)
%%
L_point=(L_point+L_point')/2;

%  [V,D]=eig(L_point);

[V,D]=SortDescend_eig(L_point);

%avoid negative eigenvalue
% num_D=size(D,1);
% for nn=1:num_D
%     if D(nn,nn)<1e-12
%         
%        D(nn,nn)=0;
%        
%        break
%     end
%     
% end
D=abs(D);
Z1=D^(1/2)*V';

[Ql,R]=qr(Z1,0);


%%

R_point=(R_point+R_point')/2;
%  [V,D]=eig(R_point);
[V,D]=SortDescend_eig(R_point);

% %avoid negative eigenvalue
% num_D=size(D,1);

% for nn=1:num_D
%     if D(nn,nn)<1e-12
%         
%        D(nn,nn)=0;
%        break
%     end
%     
% end

D=abs(D);
Z2=V*D^(1/2);

[L,Qr]=lq(Z2,0);

