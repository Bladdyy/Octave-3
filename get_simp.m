function simp = get_simp(N, n, dim, knots, points)
  knots(n)
  knots(N-n)
  first = get_der(N, n, knots(n + 1), dim, knots, points);
  second = 4 * get_der(N, n, (knots(n + 1) + knots(n + 2)) / 2, dim, knots, points);
  last = get_der(N, n, knots(N - n + 1), dim, knots, points);
  simp = first + second + last;
  for i = (n + 2):(N - n)
    simp = simp + 2 * get_der(N, n, knots(i), dim, knots, points) + 4 * get_der(N, n, (knots(i) + knots(i + 1)) / 2, dim, knots, points);
  endfor
  simp = simp * (knots(n + 2) - knots(n + 1)) / 6;
end
