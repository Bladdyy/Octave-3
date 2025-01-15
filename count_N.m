
function val = count_N(n, i, x, knots)
  if n == 0
    if (knots(i) <= x && x < knots(i+1))
      val = 1;
    else
      val = 0;
    endif
    return
  endif
  first = (x - knots(i))/(knots(i+n) - knots(i)) * count_N(n-1, i, x, knots);
  second = (knots(i + n + 1) - x)/(knots(i + n + 1) - knots(i + 1)) * count_N(n-1, i + 1, x, knots);
  val = first + second;
end
