data {
   int N;
   array [N] real heights;
}

parameters {
    real<lower=0> mu;
    real<lower=0> sigma;
}

model {
    mu ~ normal(154, 7.7);
    sigma ~ normal(15, 3);
    
    heights ~ normal(mu, sigma);
}

generated quantities {
   real h_hat  = normal_rng(mu,sigma);
}