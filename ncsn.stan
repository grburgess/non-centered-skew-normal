data{
  int N;
  vector[N] y_obs;
  real tau;

}



parameters {

  vector[N] y_raw;
  real mu;
  real<upper=0> alpha;
  real<lower=0> sigma;


}


transformed parameters {
  vector[N] y;

  y = mu + sigma * y_raw;


}

model {

  //

  sigma ~ std_normal();

  mu ~ std_normal();


  
  alpha ~ normal(-1,1);
  y_raw  ~ skew_normal(0,1,alpha);

  y_obs ~ normal(y, tau);  

}

generated quantities {}
