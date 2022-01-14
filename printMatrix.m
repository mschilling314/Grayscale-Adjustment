function lmaonothing = printMatrix(mat)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
lmaonothing = 1;
[R,C] = size(mat);
for r = 1:R
    for c = 1:C
        fprintf("%d, ", mat(r,c));
    end
    fprintf("\n");
end
end

