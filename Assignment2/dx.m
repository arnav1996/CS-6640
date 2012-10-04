function X = dx(I)
Wdx = [-1, 0, 1];
% Wdy = Wdx';
X = uint8(ceil(abs(conv2(Wdx, I))));
