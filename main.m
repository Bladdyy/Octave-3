n = 3;
N = 14;
dim = 2;
knots = [0.0, 0.0, 0.083333333333, 0.166666666667, 0.25, 0.333333333333, 0.416666666667, 0.5, 0.583333333333, 0.666666666667, 0.75, 0.833333333333, 0.916666666667, 1.0, 1.0];

points = [-0.400096539984,0.336070415879;-0.441722269046,0.304081994329;
    -0.473468707116,0.269907844991;-0.493640770376,0.23448945534;
    0.171752211164,-0.098298676749; -0.492481437197,0.163685905009;
    0.011324321615,0.807183364839;-0.42468359897,0.099203243147;
    0.222711658433,0.325141776938; -0.276686585157,0.048573369565; -0.168375677862,0.03080694707];


eps = 15 * 1e-6
error = 1;
inter = 1

while error > eps
  result1 = get_simp_inter(N, n, dim, knots, points, inter);
  inter = inter * 2;
  result2 = get_simp_inter(N, n, dim, knots, points, inter);
  error = abs(result1 - result2)
  inter
end

