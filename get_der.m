function derivative = get_der(N, n, t, dim, knots, points)
  derivative = zeros(1, dim);
  for j = 1:dim
    for i = 1:N-n-1
      result = n /(knots(i + n + 1) - knots(i + 1)) * (points(i + 1, j) - points(i, j)) * count_N(n - 1, i + 1, t, knots);
      derivative(j) = derivative(j) + result;
    endfor
  endfor
  derivative = norm(derivative);
end
