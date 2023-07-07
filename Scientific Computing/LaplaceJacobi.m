function LaplaceJacobi(N, M, epsilon)
% N: Number of grid points along x-axis
% M: Number of grid points along y-axis
% epsilon: Convergence threshold
N = 100;
M = 100;
epsilon = 0.001;
iter = 0;
% Initialize the grid
U = zeros(N, M);
U_new = zeros(N, M);

% Boundary conditions
%Left boundary
U(:, 1) = 10;   
U_new(:, 1) = 10; 

%Right boundary
U(:, M) = 10;
U_new(:, M) = 10;

%Top boundary
U(1, :) = 10;
U_new(1, :) = 10;

%Bottom boundary
U(N, :) = 10;
U_new(N, :) = 10;
% Jacobi iteration
while true
    % Perform one Jacobi iteration
    for i = 2:N-1
        for j = 2:M-1
            U_new(i, j) = (U(i-1, j) + U(i+1, j) + U(i, j-1) + U(i, j+1))/4;
        end
    end
    
    % Check for convergence
    if max(abs(U_new - U), [], 'all') < epsilon
        break;
    end
    
    % Update the grid
    iter = iter + 1;
    U = U_new;
end
% Plot the solution
    [X, Y] = meshgrid(1:M, 1:N);
    disp(iter);
    figure;
    contourf(X, Y, U');
    colorbar;
    title('Jacobi Iterative Method');
    xlabel('x');
    ylabel('y');
end

