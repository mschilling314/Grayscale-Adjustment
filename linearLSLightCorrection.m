function img_out = linearLSLightCorrection(img_in)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[R,C] = size(img_in); % put the size variables into R,C
A = ones(R*C,3); % init A to be three columns of ones for all pts in img
I = ones(R*C,1); % init I to be a column for each pt in img
count = 1; % init a count variable to index properly in loops

for r = 1:R
    for c = 1:C
        A(count,:) = [r,c,1]; % let A be the pt and 1 for later dot
        I(count) = img_in(r,c); % let I be the value of the pixel at pt
        count = count + 1; % increment count
    end
end

pseudA = pinv(A); % get the pseudoinverse of A
x = pseudA * I; % get the LS linear plane solution
fake_img = zeros(R,C); % init an image of zeros

count = 1;

for r = 1:R
    for c = 1:C
        fake_img(r,c) = dot(x,A(count,:)); % dot the plane vector w pt
        count = count + 1;
    end
end

img_new = cast(img_in, 'double'); % cast to make the math more accurate

img_out = floor(img_new - fake_img); % do the math to even out the image
img_out = cast(img_out, 'uint8'); % cast so that the image is viewable

end

