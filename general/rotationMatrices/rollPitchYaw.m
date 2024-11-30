function [ R ] = rollPitchYaw( alpha, beta, gamma )

R11 = cos(alpha)*cos(beta);
R21 = sin(alpha)*cos(beta);
R31 = -sin(beta);

R12 = -sin(alpha)*cos(gamma)+cos(alpha)*sin(beta)*sin(gamma);
R22 = cos(alpha)*cos(gamma)+sin(alpha)*sin(beta)*sin(gamma);
R32 = cos(beta)*sin(gamma);

R13 = sin(alpha)*sin(gamma)+cos(alpha)*sin(beta)*cos(gamma);
R23 = -cos(alpha)*sin(gamma)+sin(alpha)*sin(beta)*cos(gamma);
R33 = cos(beta)*cos(gamma);

R = [R11 R12 R13; R21 R22 R23; R31 R32 R33];


end



