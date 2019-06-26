% sort the eigenvalue and eigenstate with descend order
%sort absolute value
function [V_sort,D_sort]=SortDescend_eig(A)

[V,D]=eig(A);
[D_diag,index]=sort(diag(D),'descend');
V_sort=V(:,index);
 D_sort=diag(D_diag);
 
% num=size(A,1);
% D_sort=zeros(num);
% for jj=1:num
%     
%  D_sort(jj,jj)=D(index(jj),index(jj));
%     
% end
