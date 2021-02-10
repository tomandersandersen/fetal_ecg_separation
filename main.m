clear;
clc;
close all;

% Load observations
X = load("data/foetal_ecg.dat").';

meanX = mean(X,2);
X = X - meanX;

eig_count = 5;

%time = X(1,:);
time = linspace(0,10, length(X));
X = X(2:end,:);

fetalPlotter(time, X, '-b', "Observations", [8, 1])

%% PCA
Rxx_hat = cov(X.');
[PC, eig_values] = eigs(Rxx_hat, eig_count);
Z = (X.'*PC).';
fetalPlotter(time, Z, '-r', "After PCA", [eig_count, 1])

%% AMUSE
Ctao1 = (Z*delayseq(Z',1))./length(Z);
Ctao1_ = 0.5.*(Ctao1 + Ctao1.');
[W1, D1] = eig(Ctao1_);
W1 = W1';
Y1 = W1*Z;
fetalPlotter(time, Y1, '-k', "After AMUSE", [eig_count, 1])

Ya = [Y1(1,:) ; Y1(5,:)];
fetalPlotter(time,Ya , '-k', "After AMUSE", [2, 1])

%% Fast ICA
Y2 = fastICA(Z);
fetalPlotter(time, Y2, '-k', "After FastICA", [eig_count, 1])
