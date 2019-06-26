function y = cost_function_func(Q1 , RA, BL, Q2, ...
                                Q1_, RX, YL, Q2_    )

% D = 1600;
% Z = 1000;
% d = 2;
% Q1 = rand(D,Z);
% Q1_= rand(D,Z);
% 
% Q2 = rand(D,Z);
% Q2_= rand(D,Z);
% 
% RA = rand(D,d,D);
% BL = rand(D,d,D);
% 
% RX = rand(D,d,D);
% YL = rand(D,d,D);

    tensors = { Q1 , RA, BL, Q2, ...
                Q1_, RX, YL, Q2_ };
            
    legs    = {[1 2],[2 4 5],[5 7 8],[8 10], ... 
               [1 3],[3 4 6],[6 7 9],[9 10]};
    
    finalOrder = [];
             
        % =========================
        seq = [1 2 3 4 10 8 9 7 5 6];
        %tic
        y = ncon(tensors,legs,seq,finalOrder);
        %toc



end