function img_out = quadLSLightCorrection(img_in)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
[R,C] = size(img_in);
A = ones(R*C,6);
I = ones(R*C,1);
count = 1;
% lines above are almost exactly the same as linearLSLightCorrection's

for r = 1:R
    for c = 1:C
        A(count,:) = [r*r, c*c, r*c, r, c, 1]; % forms A into quad. form
        I(count) = img_in(r,c); % forms I the same way as the other LS alg.
        count = count + 1;
    end
end

pseudA = pinv(A);
x = pseudA * I; % gets the quadratic surface's parameters
fake_img = zeros(R,C); 

count = 1;

for r = 1:R
    for c = 1:C
        fake_img(r,c) = dot(x,A(count,:)); % makes the lighting 'plane'
        count = count + 1;
    end
end

img_new = cast(img_in, 'double'); % cast to make the math more accurate

img_out = floor(img_new - fake_img); % do the math to even out the image
img_out = cast(img_out, 'uint8'); % cast so that the image is viewable
end

