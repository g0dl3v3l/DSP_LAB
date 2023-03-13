s1 = [0.8884 -1.1471 -1.0689 -0.8095 -2.9443 1.4384 0.3252 -0.7549 1.3703 -1.7115 -0.1022 -0.2414 0.3192 0.3129 -0.8649 -0.0301 -0.1649 0.6277 1.0933 1.1093 -0.8637 0.0774 -1.2141 -1.1135 -0.0068 1.5326 -0.7697 0.3714 -0.2256 1.1174];
s2 = [-1.0891 0.0326 0.5525 1.1006 1.5442 0.0859 -1.4916 -0.7423 -1.0616 2.3505 -0.6156 0.7481 -0.1924 0.8886 -0.7648 -1.4023 -1.4224 0.4882 -0.1774 -0.1961 1.4193 0.2916 0.1978 1.5877];


M = length(s1);
N = length(s2);


L = M + N - 1;
y_l = zeros(1,L);

%linear convolution 
for n = 1:L
    % compute the index limits for the summation
    k1 = max(1, n-N+1);
    k2 = min(M, n);
  
    for k = k1:k2
        y_l(n) = y_l(n) + s1(k)*s2(n-k+1);
    end
end


% pad the input sequences with zeros to make them of equal length
s1_padded = [s1 zeros(1, N-N1)];
s2_padded = [s2 zeros(1, N-N2)];

% initialize the output sequence
c = zeros(1,N);

% perform circular convolution
for n = 1:N
    for k = 1:N
       
        idx = mod(n-k,N)+1;
    
        c(n) = c(n) + s1_padded(k)*s2_padded(idx);
    end
end

subplot(2,1,1);
stem(c);
title("circular convolution")
xlabel("n")
ylabel("c[n]")

subplot(2,1,2);
stem(s3);
title("Linear convolution")
xlabel("n")
ylabel("y_l[n]")






