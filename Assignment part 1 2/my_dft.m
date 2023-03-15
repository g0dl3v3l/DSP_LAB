function X = my_dft(x)

% get the length of the input sequence
N = length(x);

% initialize the output sequence
X = zeros(1,N);

% perform DFT using nested loops
for k = 1:N
    for n = 1:N
        % calculate the twiddle factor
        W = exp(-1i*2*pi*(k-1)*(n-1)/N);
        % perform the DFT
        X(k) = X(k) + x(n)*W;
    end
end

end