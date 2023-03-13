s1 = [0.8884 -1.1471 -1.0689 -0.8095 -2.9443 1.4384 0.3252 -0.7549 1.3703 -1.7115 -0.1022 -0.2414 0.3192 0.3129 -0.8649 -0.0301 -0.1649 0.6277 1.0933 1.1093 -0.8637 0.0774 -1.2141 -1.1135 -0.0068 1.5326 -0.7697 0.3714 -0.2256 1.1174];
s2 = [-1.0891 0.0326 0.5525 1.1006 1.5442 0.0859 -1.4916 -0.7423 -1.0616 2.3505 -0.6156 0.7481 -0.1924 0.8886 -0.7648 -1.4023 -1.4224 0.4882 -0.1774 -0.1961 1.4193 0.2916 0.1978 1.5877];
% define the input sequences

% get the lengths of the input sequences
N1 = length(s1);
N2 = length(s2);

% determine the length of the output sequence
N = max(N1, N2);

% pad the input sequences with zeros to make them of equal length
s1_padded = [s1 zeros(1, N-N1)];
s2_padded = [s2 zeros(1, N-N2)];

% initialize the output sequence
c = zeros(1,N);

% perform circular convolution using nested loops
for n = 1:N
    for k = 1:N
        % calculate the index for circular shift
        idx = mod(n-k,N)+1;
        % perform the convolution
        c(n) = c(n) + s1_padded(k)*s2_padded(idx);
    end
end


S1 = my_dft(s1_padded);
S2 = my_dft(s2_padded);
S3 = S1 .* S2;
s3 = my_idft(S3);
% print the output sequence

subplot(2,1,1);
stem(c);
title("s1 (*) s2")
xlabel("n")
ylabel("c[n]")

subplot(2,1,2);
stem(s3);
title("idft")
xlabel("n")
ylabel("s3[n]")


