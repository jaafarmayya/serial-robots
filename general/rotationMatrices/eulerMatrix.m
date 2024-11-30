function [ R ] = eulerMatrix( psi,theta,phi )

R11 = cos(psi)*cos(phi)-sin(psi)*cos(theta)*sin(phi);
R21 = sin(psi)*cos(phi)+cos(psi)*cos(theta)*sin(phi);
R31 = sin(theta)*sin(phi);

R12 = -cos(psi)*sin(phi)-sin(psi)*cos(theta)*cos(phi);
R22 = -sin(psi)*sin(phi)+cos(psi)*cos(theta)*cos(phi);
R32 = sin(theta)*cos(phi);

R13 = sin(psi)*sin(theta);
R23 = -cos(psi)*sin(theta);
R33 = cos(theta);

R = [R11 R12 R13; R21 R22 R23; R31 R32 R33];

end

