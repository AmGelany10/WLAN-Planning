function [ x_intersect, y_intersect] = intersect( x1,y1,x2,y2 )
%fit linear polynomial
p1 = polyfit(x1,y1,1);
p2 = polyfit(x2,y2,1);
%calculate intersection
x_intersect = fzero(@(x) polyval(p1-p2,x),3);
y_intersect = polyval(p1,x_intersect);
if x_intersect<.001 || x_intersect>52
    x_intersect=-1;
end
if y_intersect<0 || y_intersect>20
    y_intersect=-1;
end
if ((x_intersect>x1(1)) && (x_intersect>x1(2)))||((x_intersect<x1(1)) && (x_intersect<x1(2)))
     x_intersect=-1;
end
if ((y_intersect>y1(1)) && (y_intersect>y1(2)))||((y_intersect<y1(1)) && (y_intersect<y1(2)))
     y_intersect=-1;
end
 
end

