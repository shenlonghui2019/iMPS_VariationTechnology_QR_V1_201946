%Date 2019.4.11 by shenlonghui
function [X,Y,FinalDistance]=iMPS_Variation_Compress_SLH(A,B,D,Option)

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
%     
%     disp(['distance for ALS:',num2str(distance)])
%     plot(n,distance,'x');   
%     hold on
%     drawnow 
    
    Scan=Scan+1;
    if Scan>5 || abs(distance)<1e-10
        break
    end


end
% plot(1:Scan,distance)

RT=inv(R);
LT=inv(L);
X=GaugeFixing_Left(RT,RX);
Y=GaugeFixing_Right(YL,LT);



% final_Distance=cost_function_final(A,B,X,Y,N_L,N_R);

% final_Distance
FinalDistance=[];
if Option==1
FinalDistance=cost_function_final_v1(A,B,X,Y);
end
% final_Distance_ChangeEnvironment
end






