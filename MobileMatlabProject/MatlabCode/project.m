clc
clear,close all

AP1 = [6,15.5625];
AP2 = [17.5,4];
AP3 = [25.5,15.5625];
AP4 = [33.5,4];
AP5 = [45,15.5625];

%%%%%%%%
%Taking The Input
prompt = 'What is your APs values in dB (in this form [AP1 AP2 AP3 AP4 AP5])';
x = input(prompt);
AP1user = x(1);
AP2user = x(2);
AP3user = x(3);
AP4user = x(4);
AP5user = x(5);
%%%%%%%%%%%

Walls= [0,52,0,20;0,0,6,15;6,0,8,15;14,0,8,8;14,8,8,7;22,0,3,15;25,0,2,15;27,0,3,15;30,0,8,8;30,8,8,7;38,0,8,15;46,0,6,15;0,15,2,5;2,16.5,4,3.5;6,16.5,4,3.5;10,16.5,4,3.5;14,16.5,4,3.5;18,16.5,4,3.5;22,16.5,4,3.5;26,16.5,4,3.5;30,16.5,4,3.5;34,16.5,4,3.5;38,16.5,4,3.5;42,16.5,4,3.5];
WallsRed= [0,0,6,15;6,0,8,15;14,0,8,8;14,8,8,7;30,0,8,8;30,8,8,7;38,0,8,15;46,0,6,15;];

WallsGreen= [22,0,3,15;25,0,2,15;27,0,3,15;];

WallsCyan= [0,15,2,5;2,16.5,4,3.5;6,16.5,4,3.5;10,16.5,4,3.5;14,16.5,4,3.5;18,16.5,4,3.5;22,16.5,4,3.5;26,16.5,4,3.5;30,16.5,4,3.5;34,16.5,4,3.5;38,16.5,4,3.5;42,16.5,4,3.5];

WallsWhite= [25,0,2,15;];

%Map Plotting
figure(1)
[m,n] = size(WallsRed);
for r = 1:m
rectangle('Position',WallsRed(r,1:4), 'FaceColor','r')
axis([0 52 0 20])
end
hold on;
[m,n] = size(WallsGreen);
for r = 1:m
rectangle('Position',WallsGreen(r,1:4), 'FaceColor','g')
axis([0 52 0 20])
end

hold on;
[m,n] = size(WallsCyan);
for r = 1:m
rectangle('Position',WallsCyan(r,1:4), 'FaceColor','c')
axis([0 52 0 20])
end

hold on;
[m,n] = size(WallsWhite);
for r = 1:m
rectangle('Position',WallsWhite(r,1:4), 'FaceColor','w')
axis([0 52 0 20])
end

hold on;
plot(AP1(1),AP1(2),'p k');
hold on;
plot(AP2(1),AP2(2),'p k');
hold on;
plot(AP3(1),AP3(2),'p k');
hold on;
plot(AP4(1),AP4(2),'p k');
hold on;
plot(AP5(1),AP5(2),'p k');

%initialization
APsRx=[];
Coo=[];
AP1power=[];
AP2power=[];
AP3power=[];
AP4power=[];
AP5power=[];
AP1cont=[];
AP2cont=[];
AP3cont=[];
AP4cont=[];
AP5cont=[];
APcont=[];

%Power Calculation
for i = 0:2:52 
      arr1=[];
      arr2=[];
      arr3=[];
      arr4=[];
      arr5=[];
      arr6=[]
    for j = 0:2:20
      array=[i j];
      Coo=[Coo; array];
      intersections=0;
      
     [ p1,p2,p3 ,p4 ,p5 ]= claculatepower( i,j );
     
     arr1=[arr1,p1];
     arr2=[arr2,p2];
     arr3=[arr3,p3];
     arr4=[arr4,p4];
     arr5=[arr5,p5];
     arr6=[arr6,p1+p2+p3+p4+p5];
     AP1power=[AP1power;p1];
     AP2power=[AP2power;p2];
     AP3power=[AP3power;p3];
     AP4power=[AP4power;p4];
     AP5power=[AP5power;p5];
    end
     AP1cont=[AP1cont;arr1];
     AP2cont=[AP2cont;arr2];
     AP3cont=[AP3cont;arr3];
     AP4cont=[AP4cont;arr4];
     AP5cont=[AP5cont;arr5];
     APcont=[APcont;arr6];
     
end

%FingerPrint
[mm,n]=size(Coo);
min=1000000;
loc=[-1 -1];
for k =1:mm
    minnew=(AP1power(k)-AP1user).^2+(AP2power(k)-AP2user).^2+(AP3power(k)-AP3user).^2+(AP4power(k)-AP4user).^2+(AP5power(k)-AP5user).^2;
    minnew=sqrt( minnew );
    if min>minnew
        min=minnew;
        loc=Coo(k,1:2);
    end
end
plot(loc(1),loc(2),'o blue');

%Contour Plotting
figure(2)
subplot(2,3,1)
contourf(AP1cont.')
title('contour of AP1 every 2 meters');
subplot(2,3,2)
contourf(AP2cont.')
title('contour of AP2 every 2 meters');
subplot(2,3,3)
contourf(AP3cont.')
title('contour of AP3 every 2 meters');
subplot(2,3,4)
contourf(AP4cont.')
title('contour of AP4 every 2 meters');
subplot(2,3,5)
contourf(AP5cont.')
title('contour of AP5 every 2 meters');
subplot(2,3,6)
contourf(APcont.')
title('contour of total APs every 2 meters');
loc