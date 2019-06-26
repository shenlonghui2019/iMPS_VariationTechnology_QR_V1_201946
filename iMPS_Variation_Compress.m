function [X,Y]=iMPS_Variation_Compress(A,B,D)


%calculat Environment
[N_L,N_R,eta,~]=IMPS_Environment(A,B,A,B);
A=A./eta^(1/4);
B=B./eta^(1/4);

%initial 
[ X, Y ] = svd_AB_func(A, B, D);

%improvement condition number
[Ql,R,L,Qr]=Improvement_Conditions(N_L,N_R);

%GaugeFixing

RA = GaugeFixing_Left(R,A);
RX = GaugeFixing_Left(R,X);
BL = GaugeFixing_Right(B,L);
YL = GaugeFixing_Right(Y,L);

%iteration 
% diatance_old=cost_function( Ql, Qr, RA, BL, RX, YL );
% disp(['distance for SVD:',num2str(diatance_old)])

Scan=1;

 while (1)

     
    [RX,YL]=CalculateX(RA,BL,Ql,Qr,YL);
    
    [RX,YL]=CalculateY(RA,BL,Ql,Qr,RX);
    
    distance = cost_function( Ql, Qr, RA, BL, RX, YL );
    
%     disp(['distance for ALS:',num2str(distance)])
%     plot(n,distance,'x');   
%     hold on
%     drawnow 
    
    Scan=Scan+1;
    if Scan>8|| abs(distance)<1e-12
        break
    end


end
% plot(1:Scan,distance)
if cond(R)>1e14||cond(L)>1e14
    warning("条件数过大，矩阵出现奇异值！！！！")
    
    pause
end
    

RT=inv(R);
LT=inv(L);

    check_L = fidelity_matrix(L*LT,eye(size(L,1)));
    check_R = fidelity_matrix(R*RT,eye(size(R,2)));
    
    if check_L < 0.999  ...
            || ...
       check_R < 0.999 
   
       disp('In iMPS_compression')
       disp('inv matrix is wrong')
       disp('check wrong.mat file')
       check_L
       check_R
       disp(' ')
       save wrong.mat
       pause
       pause
       pause
       pause
    end



X=GaugeFixing_Left(RT,RX);
Y=GaugeFixing_Right(YL,LT);



% final_Distance=cost_function_final(A,B,X,Y,N_L,N_R);

% final_Distance
% final_Distance_ChangeEnvironment=cost_function_final_v1(A,B,X,Y);
% final_Distance_ChangeEnvironment
end






