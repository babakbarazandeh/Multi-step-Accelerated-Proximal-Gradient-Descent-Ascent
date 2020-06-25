# Multi-step Accelerated Proximal Gradient-Descent-Ascent
Implementation code for the proposed Stochastic multi-objective EM, published in the processing of the 2020 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP). [Link to Paper](https://ieeexplore.ieee.org/abstract/document/9054474)
# Abstract 
Min-max saddle point games appear in a wide range of applications in machine leaning and signal processing. Despite their wide applicability, theoretical studies are mostly limited to the special convex-concave structure. While some recent works generalized these results to special smooth non-convex cases, our understanding of nonsmooth scenarios is still limited. In this work, we study special form of non-smooth min-max games when the objective function is (strongly) convex with respect to one of the player’s decision variable. We show that a simple multi-step proximal gradient descent-ascent algorithm converges to $\epsilon$-first-order Nash equilibrium of the min-max game with the number of gradient evaluations being polynomial in 1/$\epsilon$. Finally, we evaluate the performance of the proposed algorithm through adversarial attack on a LASSO estimator.

# Summary of the proposed algorithm
The idea behind the proposed algorithm is that in each iteration, the maximization problem is solved to a good accuracy.This gives us an estimate of the gradient of the minimization problem. This gradient is later used for solving the outer minimization problem.
<p align="center">
  <img width="380" height="300" src="https://github.com/babakbarazandeh/Multi-step-Accelerated-Proximal-Gradient-Descent-Ascent/blob/master/Algorithm.png">
</p>
 
# Reuslts 
 We evaluate the performance of the proposed algorithm for the problem of attacking the LASSO estimator.  
 In other words, our goal is to find a small perturbation of the observation matrix that worsens the performance of the LASSO estimator in the training set.
 Following figure shows the performance of the proposed algorithm.

<p align="center">
  <img width="500" height="200" src="https://github.com/babakbarazandeh/Multi-step-Accelerated-Proximal-Gradient-Descent-Ascent/blob/master/Result.png">
</p> <br/>

# Getting started
Run Main.m

# Citation 
@inproceedings{barazandeh2020solving,<br/>
  title={Solving Non-Convex Non-Differentiable Min-Max Games Using Proximal Gradient Method},<br/>
  author={Barazandeh, Babak and Razaviyayn, Meisam},<br/>
  booktitle={ICASSP 2020-2020 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)},<br/>
  pages={3162--3166},<br/>
  year={2020},<br/>
  organization={IEEE}
}
