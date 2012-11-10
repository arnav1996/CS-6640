function MPS = mouseposition(I, TI)
figure(1);
clf;
f = imagesc(I);
axis image

MP = ginput(3);

figure(2);
clf;
f = imagesc(TI);
axis image

MPT = ginput(3);

MPS = [MP; MPT];

