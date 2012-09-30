function T1 = gaussian_threshold(I1, I2, n)
mean1 = 0.0;
mean2 = 0.0;
sd1 = 0.0;
sd2 = 0.0;
temp1 = 0.0;
temp2 = 0.0;
T1 = zeros(n ,1);
T2 = zeros(n ,1);
h1 = zeros(n, 1);
h2 = zeros(n, 1);
h1 = histogram(I1, n, 0, 256);
h2 = histogram(I2, n, 0, 256);
    for i=1:n
        mean1 = mean1 + (i*h1(i));
        mean2 = mean2 + (i*h2(i));
    end
    
    for i=1:n
       temp1 = temp1 + (i * i * h1(i));
       temp2 = temp2 + (i * i * h2(i));
    end
    
    sd1 = sqrt(temp1 - (mean1 * mean1));
    sd2 = sqrt(temp2 - (mean2 * mean2));
    
    for i=1:n
        T1(i) = 1/(sqrt(2*pi)*sd1)*exp(-0.5* ((i-mean1)/sd1)^2);
        T2(i) = 1/(sqrt(2*pi)*sd2)*exp(-0.5* ((i-mean2)/sd2)^2);
    end
x = 0:.00390625:1;
plot(x, T1, x, T2);
