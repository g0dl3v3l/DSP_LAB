s1 = [0.8884 -1.1471 -1.0689 -0.8095 -2.9443 1.4384 0.3252 -0.7549 1.3703 -1.7115 -0.1022 -0.2414 0.3192 0.3129 -0.8649 -0.0301 -0.1649 0.6277 1.0933 1.1093 -0.8637 0.0774 -1.2141 -1.1135 -0.0068 1.5326 -0.7697 0.3714 -0.2256 1.1174];
s2 = [-1.0891 0.0326 0.5525 1.1006 1.5442 0.0859 -1.4916 -0.7423 -1.0616 2.3505 -0.6156 0.7481 -0.1924 0.8886 -0.7648 -1.4023 -1.4224 0.4882 -0.1774 -0.1961 1.4193 0.2916 0.1978 1.5877];


M = length(s1);
N = length(s2);


L = M + N - 1;
y_l = zeros(1,L);
s1_l = [s1, zeros(1, L-M)];
s2_l = [s2, zeros(1, L-N)];
mult_count_summation = 0; % Initialize multiplication count
add_count_summation = 0; % Initialize addition count

tic
for i = 1:L
    for j = 1:i
        mult_count_summation = mult_count_summation +1;
        add_count_summation = add_count_summation +1;
        y_l(i) = y_l(i) + s1_l(j) * s2_l(i-j+1);
    end
end
time_linear_summation = toc;
disp(['Time taken by linear convolution:  summation', num2str(time_linear_summation), ' seconds']);
disp(['number of multiplications in summation method is  ' , num2str(mult_count_summation )]);
disp(['Number of additions in the summation method ' , num2str(add_count_summation)]);
%N1 = max(N,M);

%matrix method
% pad the input sequences with zeros to make them of equal length
s1_padded = [s1 zeros(1, L-M)];
s2_padded = [s2 zeros(1, L-N)];

% initialize the output sequence

c = zeros(L,L);
mult_count_matirx1 = 0;  
add_count_matrix = 0;   

% perform circular convolution
tic
for i=1:L
    for j=1:L
       
        mult_count_matirx1  = mult_count_matirx1  + 1;
        add_count_matrix = add_count_matrix + 1;
        c(i,j) = s2_padded(mod(i-j,L)+1);
    end
end
sum = 0;
product = 0;

m = transpose(c);
%y = s1_padded * transpose(c);
%y = s1_padded * c;
y = zeros(1,L);
for i=1:L
     for j=1:L
         mult_count_matirx1  = mult_count_matirx1  + 1;
         add_count_matrix = add_count_matrix + 1;
         product = s1_padded(j) * m(j,i);
         sum = sum + product;
     end

     y(i) = sum;
     sum  = 0;
     product = 0;
end
         





time_linear_matrix = toc;

disp(['Time taken by linear convolution matrix: ', num2str(time_linear_matrix), ' seconds']);

disp(['number of multiplications in matrix method is  ' , num2str(mult_count_matirx1 )]);
disp(['Number of additions in the matrix method ' , num2str(add_count_matrix)]);

subplot(2,1,1);
stem(y);
title("circular convolution or linear convolution using matrix method")
xlabel("n")
ylabel("c[n]")

subplot(2,1,2);
stem(y_l);
title("Linear convolution in summation method")
xlabel("n")
ylabel("y_l[n]")


disp(y)





