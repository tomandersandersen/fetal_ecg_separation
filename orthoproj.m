function Y = orthoproj(X, E) 
    B = normc(E);
    % Projection matrix P = BB'
    Y = (B*B')*X;
end