function EM = edgemap(I)
dxi = double(dx(I));
dyi = double(dy(I));
for i=1:size(I,1)
    for j=1:size(I, 2)
        EM(i, j) = sqrt(dxi(i,j) * dxi(i,j) + dyi(i,j)*dyi(i,j));
    end
end

EM = uint8(EM);