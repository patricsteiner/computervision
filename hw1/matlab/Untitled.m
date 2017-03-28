t = [-5:.1:5]; % theta

hold off;
y = 1; % show effects of increasing x value
for x = 1:5:50
    p = x*sin(t)-y*cos(t);
    plot(t, p);
    hold on;
end



x=1; % show effects of increasing y value
for y = 1:5:50
    p = x*sin(t)-y*cos(t);
    plot(t, p);
    hold on;
end