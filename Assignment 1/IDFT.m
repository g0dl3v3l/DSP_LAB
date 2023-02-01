function x = IDFT(X)
    N = length(X);
    n = 0:N-1;
    k = n';
    M = exp(2*pi*1i*k*n/N);
    
    x = (M .* X)/N;
end

