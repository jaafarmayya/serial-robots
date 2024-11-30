function [ Jv ] = JacobianV( dhTable )
    Z0 = [0 0 1]';
    T0_1 = dkm(dhTable(1,:));
    Z1 = T0_1(1:3,3);
    O1 = T0_1(1:3,4);
    T0_2 = dkm(dhTable(1:2,:));
    Z2 = T0_2(1:3,3);
    O2 = T0_2(1:3,4);
    T0_3 = dkm(dhTable(1:4,:));
    Z3 = T0_3(1:3,3);
    OE = T0_3(1:3,4);
    J1 = [cross(Z0,OE);Z0];
    J2 = [cross(Z1,OE - O1);Z1];
    J3 = [cross(Z2,OE - O2);Z2];
    J = [J1 J2 J3];
    Jv = J(1:3,:);
end

