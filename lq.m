function [L,Q] = lq( A, arg )

% A(m,n) and m < n.
% L(m,m): ÏÂÈý½Ç¾ØÕó
% Q(m,n)£º
% arg == 0 %!


m = size(A,1);
n = size(A,2);

if m > n or arg ~=0
   size(A) 
   disp( [ ' m<n in lq by sunzhaoyu2015 in lq.m ' ] )
   disp( [ ' arg==0 in lq by sunzhaoyu2015 in lq.m ' ] )
   pause
   pause
   pause
   
else
    
    AT = A';
    [Q,R] = qr(AT,0); % A' = Q*R ==> A = R' * Q';
    
    L = R';
    Q = Q';
    
end % if


end % function