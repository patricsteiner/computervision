function H = computeH(p1, p2)
% H: 3x3 Matrix encoding the homography that best matches the linear 
% equation derived from p1_i = Hp2_i
% p1, p2: 2xN matrices of correspponding points

N = size(p1, 2);
A = zeros(2*N, 9);

for i = 1:N
    row = 2 * (i - 1) + 1;
    xi = p1(1, i);
    xip = p2(1, i);
    yi = p1(2, i);
    yip = p2(2, i);
    % the next two lines are from the slides. Is there a mistake? seems to
    % produce wrong results...
    A(row, :)     = [xi, yi, 1, 0, 0, 0, -xip*xi, -xip*yi, -xip];
    A(row + 1, :) = [0, 0, 0, xi, yi, 1, -yip*xi, -yip*yi, -yip];
end

%[U, S, V] = svd(A);
[V, D] = eig(A' * A); % accrding to slides this should work
H = reshape(V(:, 1), 3, 3)'; % only consider first col of V (smallest values)
end

