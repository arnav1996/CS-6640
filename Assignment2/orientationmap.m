function OI = orientationmap(I)
delx = double(dx(I));
dely = double(dy(I));
inv = 0.0;
ang = 0.0;
OI = double(zeros(size(I, 1), size(I, 2)));
for i=1:size(I, 1)
    for j=1:size(I, 2)
        inv = atan(dely(i,j)/delx(i,j));
        OI(i, j) = radtodeg(inv);
    end
end
mx = max(max(OI));
OI = OI/mx;
OI = OI * 255;
OI = uint8(OI);