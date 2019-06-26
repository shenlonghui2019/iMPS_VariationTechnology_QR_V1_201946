function BL = GaugeFixing_Right(B,L)

        tensors = { B, L };
        legs    = {[-1,-2,1],[1,-3]};
        seq     = [1];
        finalOrder = [-1,-2,-3];
        BL = ncon(tensors,legs,seq,finalOrder);

end