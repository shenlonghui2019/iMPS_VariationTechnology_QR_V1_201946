%extend Edition
function [v,eta] = rightEigenVector_eigs(MPS_A,MPS_B,MPS_X,MPS_Y)  

        D_MPS1 = size(MPS_A,1);
        D_MPS2 = size(MPS_X,1);
        n       = D_MPS1* D_MPS2;

        opts.issym  = 0;
         opts.isreal = 1;
     
        [v,eta] = eigs(@rightEigenVector_eigs_func,n,1,'lm',opts); %Largest magnitude (default).


                %% =============================================================
                function x = rightEigenVector_eigs_func(x0)

                    x0  = reshape(x0,[D_MPS1,D_MPS2]);

                    tensors = { x0, MPS_A, MPS_B,MPS_X, MPS_Y };
                    legs    = {[1,2],[-1,6,4],[4,3,1],[-2,6,5],[5,3,2]};
                    seq     = [1,2,3,4,5,6];
                    finalOrder = [-1,-2];
                
                    x = ncon(tensors,legs,seq,finalOrder);        
                    x =x(:);
                end
                %% =============================================================

end