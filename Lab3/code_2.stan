data {
   int<lower=0> N;
   int<lower=0> y;
}

parameters {
   real<lower=0,upper=1> p;
}

model{
    p ~ normal(0.2, 0.03);
    y ~ binomial(N,p);
}

generated quantities {
   int <lower=0, upper=N> y_pred;
   y_pred = binomial_rng(N,p);
}