function fetalPlotter(time, X, color, title_name, subplot_size)
figure;
title(title_name);

for k =1:min(size(X))
    subplot(subplot_size(1),subplot_size(2),k);
    plot(time, X(k,:), color);
    %title("Index: "+ k)
    xlim([time(1) time(end)])
end
end