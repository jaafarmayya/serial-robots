function dhTable = getDHTable(thetas)
    % Define the original DH table with symbolic variables
    syms t1 t2 t3 t4 t5 t6;
    originalTable = [0 pi/2 183 t1;
                     210 0 0 t2+pi/2;
                     30 pi/2 0 t3;
                     0 0 221.5 0;
                     0 -pi/2 0 t4;
                     0 pi/2 0 t5;
                     0 0 0 t6;
                     0 pi/2 23.7 pi/2;
                     0 0 -5.5 pi/2;
                     50 0 0 0];

    % If no arguments are passed, return the original table
    if nargin == 0
        dhTable = originalTable;
        return;
    end

    % If arguments are passed, substitute theta values into the table
    if nargin == 1
        if length(thetas) == 6
            thetaSub = {theta1, theta2, theta3, theta4, theta5, theta6};
            dhTable = double(subs(originalTable, thetaSub, thetas));
        else
            error('You must provide exactly 6 theta values.');
        end
    end
end
