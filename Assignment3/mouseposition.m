function MPS = mouseposition(I, TI)
figure(1);
clf;
 f = imagesc(I);
axis image

MP = ginput(5);


figure(2);
clf;
 f = imagesc(TI);
axis image

MPT = ginput(5);


MPS = [MP; MPT];

