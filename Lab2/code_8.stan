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
    // using the vectorized log probability density
    target += normal_lpdf( y | theta, 1);

    // add marginal probability density for theta
    // to the joint log probability density
    target += normal_lpdf(theta | 0, 1);
}