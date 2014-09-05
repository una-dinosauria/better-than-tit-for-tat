function [ pi ] = simulate_prisoners_dilemma( A, B )
%SIMULATE_PRISONERS_DILEMMA Simualate an infinitely iterated prisoner's
%dilemma.
% Input
%   s1 : 4-long vector. Each entry has the probabilities to cooperate given
%        the previous reward in the form [R, S, T, P] for player 1.
%   s2 : 4-long vector. Each entry has the probabilities to cooperate given
%        the previous reward in the form [R, S, T, P] for player 2.
%
% Output
%   pi : 4-long-vector. Stationary distribution for choices of 
%        [R, S, T and P], in the limit for infinite iterations, for player 
%        1.

% --
% Julieta

% Get ammenable names for the different probabilities.
% Probabilities for player 1.
r1 = A(1);
s1 = A(2);
t1 = A(3);
p1 = A(4);

% Probabilities for player 2.
r2 = B(1);
s2 = B(2);
t2 = B(3);
p2 = B(4);

% Define P, the transition matrix.

%    CC,     CD,         DC,         DD
P = [r1*r2,  r1*(1-r2),  (1-r1)*r2,  (1-r1)*(1-r2);  % CC
     s1*t2,  s1*(1-t2),  (1-s1)*t2,  (1-s1)*(1-t2);  % CD
     t1*s2,  t1*(1-s2),  (1-t1)*s2,  (1-t1)*(1-s2);  % DC
     p1*p2,  p1*(1-p2),  (1-p1)*p2,  (1-p1)*(1-p2)]; % DD

% All the rows must sum to 1.
% Leave commented for speed.
% assert( sum(sum(P, 2) - ones(4, 1)) <= 0.000001 );
 
% Solve for the eigenvector with eigenvalue 1. 
% After some benchmarking, this turns out to be the fastest method in
% matlab.
pi = [1,2,3,4] * P^100;


% The distribution is indeed stationary.
% Leave commented for speed.
% assert( sum( sum( stat_dist1 * P - stat_dist1)) <= 0.000001 );

end

