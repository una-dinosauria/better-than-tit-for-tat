function [ mutants ] = create_mutants( n )
%CREATE_MUTANT This function creates a mutant, randomly sampled from a
%u-shaped function.
% Input
%   n : Integer. The number of mutants to generate.
% Output
%   mutants : n-by-4 matrix with probabilities to cooperate (R, S, T, P).
%             Each row is supposed to be a mutant.

% --
% Julieta

% The ranges that we can choose from.
options = linspace( 0.001, 0.999 );

% Create the u-shaped distribution.
u = (linspace(0.001,0.999) .* pi .* ( 1 - linspace(0.001,0.999)) ) .^ -0.5;
% Sample with importance u.
idx = randsample( 100, n*4, true, u );
mutants = options( idx );

mutants = reshape( mutants, [n, 4]);

end

