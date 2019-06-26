function A = TensorMaxElement1_func( A )

% the max value element of A should be 1.

tmp_A =  reshape( A, length(A(:)), 1 ); % change to 1D array

[maxValue,location]=max(abs(tmp_A));    % find the location of max abs

A = A ./ tmp_A( location );             % max value to +1.

end




