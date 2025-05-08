data {
  int<lower=0> N;
  vector[N] weight;
}

generated quantities {
  real alpha = normal_rng(154, 7.7);
  real beta = lognormal_rng(0, 1);
  real sigma = normal_rng(15, 3);
  vector[N] height;

  for (i in 1:N) {
    height[i] = normal_rng(alpha + beta * weight[i], sigma);
  }
}