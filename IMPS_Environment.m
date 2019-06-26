%calculate environment for AB
function [L_point,R_point,etaL,etaR]=IMPS_Environment(MPS_A,MPS_B,MPS_X,MPS_Y)
Chi1=size(MPS_A,1);
Chi2=size(MPS_X,1);
  %% left
        if Chi1*Chi2>=2
        [VL,etaL] = leftEigenVector_eigs(MPS_A,MPS_B,MPS_X,MPS_Y) ;
        else
            
          tensors = { MPS_A, MPS_B,MPS_X, MPS_Y };
          legs    = {[-1 1 2],[2 4 -2],[-3 1 3],[3 4 -4]};
          seq     = [1 2 3 4];
          finalOrder = [-1 -3 -2 -4];
          Tem= ncon(tensors,legs,seq,finalOrder); 
            
         [VL,etaL]=eigs(Tem,1,'LM')  ; 
            
        end
        
        VLt=VL';
     VLt = TensorMaxElement1_func(VLt);
        VLt = VLt ./ norm(VLt);
        L_point=reshape( VLt,Chi1,Chi2);
        
        JudgeEig=diag(L_point);
         if JudgeEig(1)<0
           L_point=L_point*(-1);
         end
        %%
        %right
        if Chi1*Chi2>=2
        [VR,etaR] = rightEigenVector_eigs(MPS_A,MPS_B,MPS_X,MPS_Y) ;
        else
            
           tensors = { MPS_A, MPS_B,MPS_X, MPS_Y };
          legs    = {[-1 1 2],[2 4 -2],[-3 1 3],[3 4 -4]};
          seq     = [1 2 3 4];
          finalOrder = [-1 -3 -2 -4];
          Tem= ncon(tensors,legs,seq,finalOrder); 
          
         [VR,etaR]=eigs(Tem,1,'LM')  ; 
        end
       VR = TensorMaxElement1_func(VR);
        VR= VR ./ norm(VR);

          R_point=reshape( VR,Chi1,Chi2);
         JudgeEig=diag(R_point);
         if JudgeEig(1)<0
            R_point=R_point*(-1);
         end

