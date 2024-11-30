clc
clear

thetaValues = [pi/4, pi/6, pi/3, pi/2, pi/4, pi/6];
dh_table = getDHTable(thetaValues);

dkm_niryo = dkm(dh_table);

Ex = dkm_niryo(1,4);
Ey = dkm_niryo(2,4);
Ez = dkm_niryo(3,4);

[psi, theta ,phi] = eulerAngles(dkm_niryo(1:3,1:3));
[alpha, beta ,gamma] = rollPitchYawAngles(dkm_niryo(1:3,1:3));
Position = [Ex; Ey; Ez];
EulerAngles = [psi; theta; phi];
RollPitchYawAngles = [alpha; beta; gamma];
resultTable = table(Position,EulerAngles,RollPitchYawAngles);

disp(resultTable);