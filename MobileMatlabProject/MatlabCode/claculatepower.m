function [ p1,p2,p3 ,p4 ,p5 ] = claculatepower( i,j )
myWalls=[6,0,6,15;14,0,14,8;14,8,14,15;22,0,22,8;22,8,22,15;25,0,25,15;27,0,27,15;30,0,30,15;38,0,38,8;38,8,38,15;46,0,46,15;3.5,15,3.5,20;3.5,16.5,3.5,20;6,16.5,6,20;10,16.5,10,20;14,16.5,14,20;17.5,16.5,17.5,20;22,16.5,22,20;30,16.5,30,20;38,16.5,38,20;42,16.5,42,20;42,16.5,42,20;46,16.5,46,20;0,15,6,15;6,15,14,15;14,8,22,8;14,15,22,15;30,8,38,8;30,15,38,15;38,15,46,15;46,15,52,15;0,15,3.5,15;3.5,16.5,6,16.5;6,16.5,10,16.5;10,16.5,14,16.5;14,16.5,17.5,16.5;17.5,16.5,22,16.5;22,16.5,25.5,16.5;25.5,16.5,30,16.5;30,16.5,33.5,16.5;33.5,16.5,38,16.5;38,16.5,42,16.5;42,16.5,46,16.5];
AP1 = [6,15.5625];
AP2 = [17.5,4];
AP3 = [25.5,15.5625];
AP4 = [33.5,4];
AP5 = [45,15.5625];
x1=[i,AP1(1)];
y1=[j,AP1(2)];
intersections=0;

[m,n]=size(myWalls);
for r=1:m
    aa=myWalls(r,1:4);
    xa=aa(1);
    ya=aa(2);
    xb=aa(3);
    yb=aa(4);
    x2=[xa xb];
    y2=[ya yb];
    [xint,yint]=intersect(x1,y1,x2,y2);
    if xint~=-1&&yint~=-1
        intersections=intersections+1;
    end
end
d1=(i-AP1(1)).^2 +(j -AP1(2)).^2;
d1=sqrt( d1 );
p1=-10-30*log(32*pi*d1)-intersections*3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x1=[i,AP2(1)];
y1=[j,AP2(2)];
intersections=0;
for r=1:m
    aa=myWalls(r,1:4);
    xa=aa(1);
    ya=aa(2);
    xb=aa(3);
    yb=aa(4);
    x2=[xa xb];
    y2=[ya yb];
    [xint,yint]=intersect(x1,y1,x2,y2);
    if xint~=-1&&yint~=-1
        intersections=intersections+1;
    end
end
d2=(i-AP2(1)).^2 +(j -AP2(2)).^2;
d2=sqrt( d2 );
p2=-10-30*log(32*pi*d2)-intersections*3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x1=[i,AP3(1)];
y1=[j,AP3(2)];
intersections=0;
for r=1:m
    aa=myWalls(r,1:4);
    xa=aa(1);
    ya=aa(2);
    xb=aa(3);
    yb=aa(4);
    x2=[xa xb];
    y2=[ya yb];
    [xint,yint]=intersect(x1,y1,x2,y2);
    if xint~=-1&&yint~=-1
        intersections=intersections+1;
    end
end
d3=(i-AP3(1)).^2 +(j -AP3(2)).^2;
d3=sqrt( d3 );
p3=-10-30*log(32*pi*d3)-intersections*3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x1=[i,AP4(1)];
y1=[j,AP4(2)];
intersections=0;
for r=1:m
    aa=myWalls(r,1:4);
    xa=aa(1);
    ya=aa(2);
    xb=aa(3);
    yb=aa(4);
    x2=[xa xb];
    y2=[ya yb];
    [xint,yint]=intersect(x1,y1,x2,y2);
    if xint~=-1&&yint~=-1
        intersections=intersections+1;
    end
end
d4=(i-AP4(1)).^2 +(j -AP4(2)).^2;
d4=sqrt( d4 );
p4=-10-30*log(32*pi*d4)-intersections*3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x1=[i,AP5(1)];
y1=[j,AP5(2)];
intersections=0;
for r=1:m
    aa=myWalls(r,1:4);
    xa=aa(1);
    ya=aa(2);
    xb=aa(3);
    yb=aa(4);
    x2=[xa xb];
    y2=[ya yb];
    [xint,yint]=intersect(x1,y1,x2,y2);
    if xint~=-1&&yint~=-1
        intersections=intersections+1;
    end
end
d5=(i-AP5(1)).^2 +(j -AP5(2)).^2;
d5=sqrt( d5 );
p5=-10-30*log(32*pi*d5)-intersections*3;
end