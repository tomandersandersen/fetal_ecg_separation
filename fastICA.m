function [Y, W] = fastICA(X)

[dimW, M] = size(X);

% Centering data.
meanX = mean(X.')';
X = X - meanX;

%% 2) Whitening of data.
covX = cov(X.');
[E, D] = eig(covX);

% Whitening matrix.
V = D^(-1/2) * E.';

% Whitened data Z.
Z = V*X;

W = eye(dimW);

% Defines convergence.
epsilon = 1E-10;

for p = 1:dimW
    wp = W(:,p);
    
    while 1==1
        wold = wp;
        
        a1 = 1;
        temp = tanh(a1 * Z.' * wp);
        wp = (Z * temp - a1 * sum(1 - temp.^2) * wp) ./M;
        
        % Orthogonalize (using deflation).
        for j = 1:(p-1)
            wj = W(:,j);
            wp = wp - (wp.'*wj)*wj; %./ (wj.'*wj) ;
        end
        
        % Normalize.
        wp = wp ./ vecnorm(wp);
        
        W(:,p) = wp;        
        %% 8) Check convergence for wp.
        if (vecnorm(wp - wold) < epsilon | vecnorm(wp + wold) < epsilon)
            break; % Break while-loop.
        end
    end % End of while-loop.
    
end % End of for-loop (p).

% Obtain sources from Z
Y = W*Z;
end

