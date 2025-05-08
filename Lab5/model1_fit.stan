data {
   int N_years;
   vector[N_years] miles_flown;
   array[N_years] int y_fit;
}

parameters {
   real alpha_;
   real theta_;
}

transformed parameters {
   vector[N_years] lambda = exp(alpha_ + theta_ * miles_flown);
}

model {
   alpha_ ~ normal(3, 1.2);
   theta_ ~ normal(0.1, 0.01);
   for (n in 1:N_years) {
      y_fit[n] ~ poisson(lambda[n]);
   }
}

generated quantities {
   array[N_years] int<lower=0> accidents;  
    for (n in 1:N_years) {
      accidents[n] = poisson_rng(lambda[n]);
   }
}
