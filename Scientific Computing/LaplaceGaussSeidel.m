function LaplaceGaussSeidel(N, M, epsilon)
% N: Number of grid points along x-axis
% M: Number of grid points along y-axis
% epsilon: Convergence threshold
N = 100;
M = 100;
epsilon = 0.001;
% Initialize the grid
U = zeros(N, M);
iter = 0;
% Boundary conditions
% Left boundary
U(:, 1) = 10;
% Right boundary
U(:, M) = 10;
% Top boundary
U(1, :) = 10;  
% Bottom boundary
U(N, :) = 10;   

% Gauss-Seidel iteration
while true
    U_prev = U; % Store previous iteration values
    
    for i = 2:N-1
        for j = 2:M-1
            U(i, j) = (U(i-1, j) + U(i+1, j) + U(i, j-1) + U(i, j+1))/4;
        end
    end
    
    % Check for convergence
    if max(abs(U(:) - U_prev(:))) < epsilon
        break;
    end
    iter = iter + 1;
end

% Plot the solution
    [X, Y] = meshgrid(1:M, 1:N);
    disp(iter);
    figure;
    contourf(X, Y, U');
    colorbar;
    title('Gauss Seidel Iterative Method');
    xlabel('x');
    ylabel('y');
end
