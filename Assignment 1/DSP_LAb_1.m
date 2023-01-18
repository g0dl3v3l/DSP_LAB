% generating a square impluse
fs = 100.0; % frequency of samping 
T = 1.0;
    
t = (0:(T/fs):2); % the range of time values

N = length(t); % lenght of the sampled input 
x = zeros(size(t));

% smapling the unit step funcion
for k = 1:N
    
    if t(k) >= 1 && t(k)<=2
        x(k) = 1;
    end
end

subplot(3,1,1);
title("Sampled unit step")
stem(t,x)

N = length(x); %number of samples
X = 0;

k = -(N-1):(N);
%DTFT
for m = 0:(2*N-1)
    
    X(m+1) = 0;
    for c = 1:length(x)
        
%         
       X(m+1) = X(m+1) + x(c)*exp((-1i*c*k(m+1)*2*pi)/N);
       
    end
    
    if k(m+1) <= 0.001 && k(m+1)>=0 
        disp(abs(X))
    end
end
magx = abs(X);
hold on;

subplot(3,1,2);
plot (2*pi*k/N,magx, "Color",'m');
% plot(t,x, LineWidth=1);
title("DFT of Unit step fuction")
xlabel("Hz")
ylabel("X_k")

y = fft(x);

subplot(3,1,3);
a = 0:N-1;

plot (2*pi*a/N,abs(fftshift(y)));
title("In built FFT function")