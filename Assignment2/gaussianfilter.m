function GI = gaussianfilter(I)
x = -6:6;
gx = zeros(size(x, 2), 1);
gx = (1/sqrt(2 * pi * 4)) * exp(-.5 * power(( x/2),2 ));
y = -6:6;
y = y';
gy = zeros(size(y, 1),1);
gy = (1/sqrt(2 * pi * 4)) * exp(-.5 * power(( y/2),2 ));

GI = uint8(conv2(gy, conv2(I, gx)));


