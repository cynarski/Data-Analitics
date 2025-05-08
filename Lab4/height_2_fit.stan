data {
  int<lower=0> N;
  array [N] real height;
  array [N] real weight;       
}

parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
}

transformed parameters {
  array [N] real mu;

  for (i in 1:N) {
    mu[i] = alpha + beta * weight[i];
  }
}

model {

  alpha ~ normal(0, 100);
  beta ~ normal(0, 10);
  sigma ~ exponential(1);
  for (i in 1:N) {
    height[i] ~ normal(mu[i], sigma);
  }
}

generated quantities {
  array [N] real height_sim;

  for (i in 1:N) {
    height_sim[i] = normal_rng(mu[i], sigma);
  }
}
