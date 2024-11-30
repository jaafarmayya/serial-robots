clc
clear
syms t1 t2 t3 t4 t5 t6 real;
syms DTH1 DTH2 DTH3 DTH4 DTH5 DTH6 real;

t1 = 10;
t2 = 20;
t3 = 30;
t4 = 40;
t5 = 50;
t6 = 60;

Vx = 1;
Vy = 2;
Vz = 3;
Wx = 1;
Wy = 2;
Wz = 3;

dhTable = [0 pi/2 183 t1;
           210 0 0 t2+pi/2;
           30 pi/2 0 t3;
           0 0 221.5 0;
           0 -pi/2 0 t4;
           0 pi/2 0 t5;
           0 0 0 t6;
           0 pi/2 23.7 pi/2;
           0 0 -5.5 pi/2;
           50 0 0 0];

T0_1 = dkm(dhTable(1,:));
T0_2 = T0_1 * dkm(dhTable(2,:));
T0_3 = T0_2 * dkm(dhTable(3:4,:));
T0_4 = T0_3 * dkm(dhTable(5,:));
T0_5 = T0_4 * dkm(dhTable(6,:));
T0_6 = T0_5 * dkm(dhTable(7:10,:));

Z0 = [0; 0; 1];
O0 = [0; 0; 0];
Z1 = T0_1(1:3, 3);
O1 = T0_1(1:3, 4);
Z2 = T0_2(1:3, 3);
O2 = T0_2(1:3, 4);
Z3 = T0_3(1:3, 3);
O3 = T0_3(1:3, 4);
Z4 = T0_4(1:3, 3);
O4 = T0_4(1:3, 4);
Z5 = T0_5(1:3, 3);
O5 = T0_5(1:3, 4);
Z6 = T0_6(1:3, 3);
OE = T0_6(1:3, 4);

J1 = [cross(Z0,OE);Z0];
J2 = [cross(Z1,OE - O1);Z1];
J3 = [cross(Z2,OE - O2);Z2];
J4 = [cross(Z3,OE - O3);Z3];
J5 = [cross(Z4,OE - O4);Z4];
J6 = [cross(Z5,OE - O5);Z5];

J = [J1 J2 J3 J4 J5 J6];


% Check for singularity and compute joint velocities
if rank(J) < size(J, 1)
    disp('Singularity detected');
else
    % End-effector velocities as a vector
    Velocities = [Vx; Vy; Vz; Wx; Wy; Wz];

    % Inverse of the Jacobian
    J_inv = inv(J);

    % Compute joint velocities
    DTH_velocities = J_inv * Velocities;

    % Display results
    disp('Joint Velocities:');
    disp(DTH_velocities);
end