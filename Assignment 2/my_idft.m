function x = my_idft(X)

% get the length of the input sequence
N = length(X);

% initialize the output sequence
x = zeros(1,N);

% perform IDFT using nested loops
for n = 1:N
    for k = 1:N
        % calculate the twiddle factor
        W = exp(1i*2*pi*(k-1)*(n-1)/N);
        % perform the IDFT
        x(n) = x(n) + X(k)*W;
    end
    % normalize the output
    x(n) = x(n)/N;
end

end
