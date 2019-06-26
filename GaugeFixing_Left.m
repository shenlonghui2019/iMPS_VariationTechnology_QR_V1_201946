function RA = GaugeFixing_Left(R,A)

        tensors = { R, A };
        legs    = {[-1,1],[1,-2,-3]};
        seq     = [1];
        finalOrder = [-1,-2,-3];
        RA = ncon(tensors,legs,seq,finalOrder);

end