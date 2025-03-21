data {
    int<lower=1> N; //number of ys
}

parameters {
    array[N] real y; // probabilistic variables y
    real theta; // probabilistic variable theta
}

model {
    // add marginal probability density for the ys
    // given theta to the joint log probability density
    // using equivalent sampling statement
    y ~ normal(theta, 1);


    // add marginal probability density for theta
    // to the joint log probability density
    // using equivalent sampling staement
    target += normal_lpdf(theta | 0, 1);
}

generated quantities {
   real mean_y = mean(y);
}