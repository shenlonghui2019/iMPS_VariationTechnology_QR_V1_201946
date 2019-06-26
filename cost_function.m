function distance = cost_function( Q1, Q2, RA, BL, RX, YL )
% See Page (1) : definiation of cost_function d(x,y)


y1 = cost_function_func(Q1 , RA, BL, Q2, ...
                        Q1 , RA, BL, Q2     );

y2 = cost_function_func(Q1 , RA, BL, Q2, ...
                        Q1 , RX, YL, Q2     );

y3 = cost_function_func(Q1 , RX, YL, Q2, ...
                        Q1 , RX, YL, Q2     );                   
     
%                     y1
%                     y2
%                     y3
distance = y1 + y3 - 2 * y2;

end