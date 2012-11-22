function HT = hough_transform(I)

theta = (-90:90);
sigma = (-300:300);

accMat = zeros(size(sigma, 2), size(theta, 2));
for i=1:size(I,1)
    for j=1:size(I,2)
        if(I(i,j) > 0)
            for k = -90:90
                sigma = i*cosd(k) + j*sind(k);
                sigma = floor(sigma) + 300;
                if(sigma > 0 && k+90 > 0 && sigma <= 600 && k + 90 <= 180) 
                    accMat(sigma, k + 90) = accMat(sigma, k + 90) + 1;
                end
            end
        end
    end
end

HT = accMat;