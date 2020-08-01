def sum_terms(n)
  (1..n).reduce(0) { |sum, val| sum += (val ** 2 + 1) }
end

p sum_terms(7)