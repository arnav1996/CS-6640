% This is only for 1D convolution. I is the image, M1 is the vector (3 x
% 1 or 1 x 3)
function EI = convolution (M1, I)
% cnv = zeros(3, 3);
newMatrix = zeros(3, 3);
EI = zeros(size(I,1), size(I, 2));
% if (size(M1, 1) == 1)
%     newMatrix(2, 1) = M1(1, 1);
%     newMatrix(2, 2) = M1(1, 2);
%     newMatrix(2, 3) = M1(1, 3);
% else
%     newMatrix(1, 2) = M1(1, 1);
%     newMatrix(2, 2) = M1(2, 1);
%     newMatrix(3, 2) = M1(3, 1);    
% end
% dim = 3;
EI = zeros(size(I, 1), size(I, 2));
for i=1:size(I,1)
    for j = 2:size(I, 2) - 1
        EI(i, j) = M1(1, 1) * I(i, j + 1) + M1(1, 2) * I(i, j) + M1(1, 3) * I(i, j - 1);
    end
end
% a = (dim - 1)/2;
% b = (dim - 1)/2;
% acc = 0;
% EI = zeros(size(I,1), size(I, 2));
% offset = (dim + 1)/2;
% disp(offset);
% for i=0:size(I,1) - offset
%     for j=0:size(I, 2) - offset
%         for m=-a:a
%             for n=-b:b
%                 if ( (j + n + offset <= size(I, 1)) && (i + m + offset <= size(I, 2)))
%                     
%                     acc = acc + I(i + (m + offset), j + (n + offset)) * newMatrix(m + offset, n + offset);
%                 end
%             end
%         end
%         EI(i + offset, j + offset) = acc;
%         acc = 0;
%         
%     end
% end
% 
