%% The one where we try to simulate Nowak & Sigmund 1993 Nature paper "A
%  strategy of win-stay, lose-shift that outperforms tit-for-tat in the
%  Prisoner's Dilemma game.

% --
% Julieta

%% Define parameters for the simulation

popsz     = 20; % Population size.
pmutatnts = .05; % Ratio of mutants.
mp      = 0.01; % Mutation probability.
payoff  = [3, 0, 5, 1]; % Create our payoff values [R, S, T, P].
% Create an initial population, initialized as all in 0.5.
pop     = zeros(popsz, 4) + 0.5;
n_iterations = 1e6;

history         = zeros( n_iterations, popsz, 4);
history_payoffs = zeros( n_iterations, popsz );

h = figure;

% Simulate!
for i=1:n_iterations,

    history( i, :, :) = pop;

    % Compute payoffs for everyone, round-robin style!.
    payoffs = zeros( popsz, popsz );
    for j=1:popsz,
        for k=1:popsz,

            stat_dist = simulate_prisoners_dilemma( pop(j,:), pop(k,:) );
            payoffs(j, k) = sum( stat_dist .* payoff );

        end
    end

    % Get the average payoff (fitness) of each strategy.
    fitness = mean( payoffs, 2 );
    
    % Record this fitness for history.
    history_payoffs(i,:) = fitness;

    % Sample according to the fitness.
    next_gen = datasample( pop, popsz,  'Weights', fitness );

    if rand < mp,
        % Generate a mutant!
        nmutants = floor( popsz * pmutatnts );
        mutants = create_mutants( nmutants );
        next_gen( randi(popsz, [nmutants,1]), : ) = mutants;
    end

    % Replace the old population with the new one.
    pop = next_gen;

    if mod(i, 100) == 0,
        fprintf('Done with iteration %d / %d = %f %%.\n', i, n_iterations, 100*i/n_iterations);
        
        
        % Get values to plot
        mean_r = mean( history(1:i, :, 1), 2 );
        mean_s = mean( history(1:i, :, 2), 2 );
        mean_t = mean( history(1:i, :, 3), 2 );
        mean_p = mean( history(1:i, :, 4), 2 );

        mean_payoff = mean( history_payoffs(1:i, :), 2 );

        % Plot the payoff
        subplot( 5, 1, 1 );
        plot( mean_payoff ); ylabel('payoff');

        % Plot r, s, t and p
        subplot(5, 1, 2);
        plot( mean_r ); ylabel('r');
        subplot(5, 1, 3);
        plot( mean_s ); ylabel('s'); 
        subplot(5, 1, 4);
        plot( mean_t ); ylabel('t'); 
        subplot(5, 1, 5);
        plot( mean_p ); ylabel('p');
        
        drawnow;
        
    end
end
