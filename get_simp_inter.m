function simp = get_simp_inter(N, n, dim, knots, points, inter)
  h = (knots(N-n + 1) - knots(n + 1))/inter;
  first = get_der(N, n, knots(n + 1), dim, knots, points);
  second = 4 * get_der(N, n, (knots(n + 1) + h / 2), dim, knots, points);
  last = get_der(N, n, knots(N - n + 1), dim, knots, points);
  simp = first + second + last;
  act = knots(n + 1);
  for i = 2:inter
    act = act + h;
    simp = simp + 2 * get_der(N, n, act, dim, knots, points) + 4 * get_der(N, n, (act + h / 2), dim, knots, points);
  endfor
  simp = simp * h / 6;
end
