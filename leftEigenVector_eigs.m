%extend Edition
function [v,eta] = leftEigenVector_eigs(MPS_A,MPS_B,MPS_X,MPS_Y)  

        D_MPS1 = size(MPS_A,1);
        D_MPS2 = size(MPS_X,1);
        n       = D_MPS1* D_MPS2;

        opts.issym  = 0;
         opts.isreal = 1;
     
        [v,eta] = eigs(@leftEigenVector_eigs_func,n,1,'lm',opts); %Largest magnitude (default).


                %% =============================================================
                function x = leftEigenVector_eigs_func(x0)

                    x0  = reshape(x0,[D_MPS1,D_MPS2]);

                    tensors = { x0, MPS_A, MPS_B,MPS_X, MPS_Y };
                    legs    = {[1,2],[1,3,4],[4,6,-1],[2,3,5],[5,6,-2]};
                    seq     = [1,2,3,4,5,6];
                    finalOrder = [-1,-2];
                
                    x = ncon(tensors,legs,seq,finalOrder);        
                    x =x(:);
                end
                %% =============================================================

end