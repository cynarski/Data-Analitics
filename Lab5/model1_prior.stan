data {
  int N_years;
  vector[N_years] miles_flown;
}

generated quantities {
  real alpha_ = normal_rng(3, 1.2);
  real theta_ = normal_rng(0.1, 0.01);

  vector[N_years] lambda = exp(alpha_ + theta_ * miles_flown);
  array[N_years] int accidents; 
  for (n in 1:N_years) {
    accidents[n] = poisson_rng(lambda[n]);
  }
}
