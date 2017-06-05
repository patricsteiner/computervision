function H = computeHnorm(p1, p2)
% H: 3x3 Matrix encoding the homography that best matches the linear 
% equation derived from p1_i = Hp2_i
% p1, p2: 2xN matrices of correspponding points
% p1 and p2 are being noralized before computation.

N = size(p1, 2);
% normalize points
for i =  1:N
    p1(:, i) = p1(:, i) / norm(p1(:, i)); % divide each point by the length
    p2(:, i) = p2(:, i) / norm(p2(:, i));
end

H = computeH(p1, p2);
end
