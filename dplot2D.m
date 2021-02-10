function dplot2D(X, color, title_name)
margin = 1.1;

figure;
title(title_name);
grid on; grid minor;
hold on;

plot(X(1,:), X(2,:), color);
xlabel("x_1");
ylabel("x_2");

xmax = max(abs(X),[],2);
xlim([-xmax(1) xmax(1)].*margin)
ylim([-xmax(2) xmax(2)].*margin)
end