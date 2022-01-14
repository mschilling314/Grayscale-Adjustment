function img_out = HistEqV2(img_in)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
close all;

[R,C] = size(img_in); % stores dims of img_in
img_out = zeros(R,C); % creates base img_out
hist = zeros(1,256); % create base for histogram

for r = 1:R
    for c = 1:C
        I = img_in(r,c) + 1; % gets pixel intensity, shifts by one
        hist(I) = hist(I) + 1; % increment the proper bucket
    end
end

hist = hist ./ (R*C); % normalize
fprintf("%d", sum(hist));
figure();
title("Img_in histogram");
plot(1:256, hist); % plot the histogram

T = zeros(1,256); % create the transform
cum = 0; % cumulative probability

for x = 1:256
    cum = cum + hist(x); % cumulative is added to by the histogram's value
    T(x) = floor(255 * cum); % T is properly updated
end

figure();
title("T");
plot(1:256, T); % plots T

for r = 1:R
    for c = 1:C
        I = img_in(r,c) + 1; % same as line 12
        img_out(r,c) = T(I); % assigns histogram translation to output
    end
end

img_out = cast(img_out,'uint8');

figure();
imshow(img_in);
figure();
imshow(img_out);

for r = 1:R
    for c = 1:C
        I = img_out(r,c) + 1; % gets pixel intensity, shifts by one
        hist(I) = hist(I) + 1; % increment the proper bucket
    end
end

hist = hist ./ (R*C); % normalize
figure();
title("img_out histogram");
plot(1:256, hist); % plot the histogram

end

