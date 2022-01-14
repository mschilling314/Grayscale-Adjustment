function img_out = HistoEqualization(img_in)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
h = zeros(1,256); %create the histogram to have 256 cols, 1 row
[R,C] = size(img_in); % these are constants that are used multiple times
img_out = zeros(R,C); % creates the basis for the output

for r = 1:R % iterates through the rows of the image
    for c = 1:C  % iterates through the cols of the image
        I = floor(img_in(r,c)); % I is the pixel value, rounded for safety
        h(I + 1) = h(I + 1) + 1;  % the offset of index is crucial, since a
                                  % pixel can be zero, but the first index
                                  % is one, this increments the histogram
    end
end

h = h./(R*C);  % normalize the histogram to be the probability a pixel
               % occuring in the image will be represented by its bucket

T = zeros(1,256);  % prep the vector of the transform

for j = 1:256  % iterate over the histogram
    T(j) = floor(256 .* sum(h(1,1:j)));  % performs the integration
                                % multiplication by 256 is to cover the
                                % range of T
end

for r = 1:R % iterate over the rows of the image
    for c = 1:C % iterate over the cols of the image
        pixel = T(img_in(r,c)+1); % using the pixel of the original image,
                                  % and shifting by one to get the correct
                                  % index (same as before bc a pixel can be
                                  % zero), look up the transformed value
        pixel = round(pixel) - 1; % round pixel's value, and decrement to
                                  % allow for zero as a potential value and
                                  % ensure that the value is less than 256
        img_out(r,c) = pixel; % finally, assign the pixel to the output
    end
end

img_out = cast(img_out, 'uint8');

%the program is complete and the output image should be formed

end

