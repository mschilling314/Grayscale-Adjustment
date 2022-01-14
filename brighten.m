function img_out = brighten(img_in)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
curr_max = max(max(img_in)); % finds the current max greyscale
sf = 255 / curr_max; % this allows linear scaling to the current maximum
img_out = sf * img_in; % does the actual scaling
end

