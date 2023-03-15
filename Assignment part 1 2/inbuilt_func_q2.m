s1 = [0.8884 -1.1471 -1.0689 -0.8095 -2.9443 1.4384 0.3252 -0.7549 1.3703 -1.7115 -0.1022 -0.2414 0.3192 0.3129 -0.8649 -0.0301 -0.1649 0.6277 1.0933 1.1093 -0.8637 0.0774 -1.2141 -1.1135 -0.0068 1.5326 -0.7697 0.3714 -0.2256 1.1174];
s2 = [-1.0891 0.0326 0.5525 1.1006 1.5442 0.0859 -1.4916 -0.7423 -1.0616 2.3505 -0.6156 0.7481 -0.1924 0.8886 -0.7648 -1.4023 -1.4224 0.4882 -0.1774 -0.1961 1.4193 0.2916 0.1978 1.5877];


% get the lengths of the input signals
M = length(s1);
N = length(s2);

% compute the length of the linear convolution
L = max(N,M);

% compute the FFT of the input signals
S1 = fft(s1, L);
S2 = fft(s2, L);

% compute the element-wise product in the frequency domain
Y = S1.*S2;

% compute the IFFT of the product to obtain the linear convolution
y = ifft(Y);


stem(Y);
title("circular convoluiton question without using FFT and IFFT function")
xlabel("n")
ylabel("s3[n]")


disp(real(Y))

