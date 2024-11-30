clc
close all
clear all
syms t1 t2 t3 t4 t5 t6

l1 = 183;
l2 = 210;
l3 = 30;
l4 = 221.5;

% DH table for the niryo robot is:

dhT= [0 pi/2 l1 t1;
      l2 0 0 t2+pi/2;
      l3 pi/2 0 t3;
      0 0 l4 0;
      0 -pi/2 0 t4;
      0 pi/2 0 t5;
      0 0 0 t6;
      0 pi/2 23.7 pi/2;
      0 0 -5.5 pi/2;
      50 0 0 0];
  
 % joints limits
 
 JointLimits = [-175  175;  %for t1
                -90  36.7;  %for t2
                -80  90;    %for t3
                -175  175;  %for t4
                -100  110;  %for t5
                -147.5 147.5;]; %for t6
            
            
Tw3E = [0 pi/2 23.7 pi/2;
         0 0 -5.5 pi/2;
         50 0 0 0;];

% an example input is :
T =  [0.8660    0.1294    0.4830   61.1698;
      0.1294   -0.9910    0.0335  -67.2961;
      0.4830    0.0335   -0.8750  626.9893;
         0         0         0    1.0000;];
  
% from the input we calculate:
T0w0 = double(T*inv(dkm(dhT(8:10,:))));

x = T0w0(1,4);
y = T0w0(2,4);
z = T0w0(3,4);

t1111 = [atan2(y,x) atan2(-y,-x) atan2(-y,-x) atan2(+y,+x)];
 
t3333 = zeros(1,2);
 
a = x*cos(t1111(1)) + y*sin(t1111(2));
b = z - 183;
 
 
temp = sqrt((2*l3*l2)^2 + (2*l4*l2)^2 - (a^2 + b^2 - 221.5^2 - 30^2 - 210^2)^2);
t3333(1) = atan2(a^2 + b^2 - 221.5^2 - 30^2 - 210^2, +temp) - atan2((2*l3*l2) , (2*l4*l2));
t3333(2) = atan2(a^2 + b^2 - 221.5^2 - 30^2 - 210^2, -temp) - atan2((2*l3*l2) , (2*l4*l2));
t3333(3) = atan2(a^2 + b^2 - 221.5^2 - 30^2 - 210^2, +temp) - atan2((2*l3*l2) , (2*l4*l2));
t3333(4) = atan2(a^2 + b^2 - 221.5^2 - 30^2 - 210^2, -temp) - atan2((2*l3*l2) , (2*l4*l2));

t2222 = zeros(1,4);

for i=1:4
    temp =  [(l4*cos(t3333(i)) - l3*sin(t3333(i))) (-l3*cos(t3333(i)) -l4*sin(t3333(i)) -l2);(l2 + l3*cos(t3333(i)) + l4*sin(t3333(i))) (l4*cos(t3333(i)) -l3*sin(t3333(i)))]\[x*cos(t1111(i)) + y*sin(t1111(i));z - 183];
    t2222(i) = atan2(temp(2), temp(1));
end  


% for each combination of t1, t2 and t3 we have 2 combinations of t4 , t5
% and t6 so we will repeat t1, t2 ,3 as follow:

t1111 = [t1111 t1111];
t2222 = [t2222 t2222];
t3333 = [t3333 t3333];

t4444 = zeros(1,8);
t5555 = zeros(1,8);
t6666 = zeros(1,8);


for i=1:4
    % calculate Tw0w3 using the premade dkm function and using the dhTable for
    % the niryo robot
    t1 = t1111(i);
    t2 = t2222(i);
    t3 = t3333(i);
    Tw0w3 = inv(dkm(double(subs(dhT(1:4, :)))))*T*inv(dkm(Tw3E))
    t5555(i) = acos(Tw0w3(3,3));
    t5555(i+4)= -acos(Tw0w3(3,3));
    t6666(i+4) = atan2(Tw0w3(3,2)/-sin(t5555(i)),Tw0w3(3,1)/sin(t5555(i)));
    t6666(i) = atan2(Tw0w3(3,2)/-sin(t5555(i+4)), Tw0w3(3,1)/sin(t5555(i+4)));
    t4444(i+4) = atan2(Tw0w3(2,3)/-sin(t5555(i)), Tw0w3(1,3)/-sin(t5555(i)));
    t4444(i) = atan2(Tw0w3(2,3)/-sin(t5555(i+4)), Tw0w3(1,3)/-sin(t5555(i+4)));

end

% the solutions are:

 
  solutionNames = {'Solution_1', 'Solution_2', 'Solution_3', 'Solution_4', 'Solution_5', 'Solution_6', 'Solution_7', 'Solution_8'};
    rowNames = {'Theta 1', 'Theta 2', 'Theta 3', 'Theta 4', 'Theta 5', 'Theta 6'};
    
    solutionsTable = array2table([ rad2deg(t1111);rad2deg(t2222);rad2deg(t3333);rad2deg(t4444);rad2deg(t5555);rad2deg(t6666);], 'RowNames', rowNames, 'VariableNames', solutionNames)
