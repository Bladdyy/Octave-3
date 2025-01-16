filename = "./funcs/basic.bs"
parsed = parse(filename);

knots = parsed.knots;
points = parsed.control_points;
n = parsed.degree;
N = length(knots) - 1;
dim = parsed.dimension;



eps = 15 * 1e-6;
error = 1;
inter = 1;
result = get_simp_inter(N, n, dim, knots, points, inter);

while error > eps
  init = result;
  inter = inter * 2;
  result = get_simp_inter(N, n, dim, knots, points, inter);
  error = abs(init  - result);
  printf("Error between: %f. Number of intervals: %d. Length: %f\n", error, inter / 2, init)
end
