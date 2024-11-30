syms t1 t2 t3 t4 t5 t6 d1 d2 d3 d4 d5 d6 l1 l2 l3 l4
t1 = pi/2;
t2 = pi/6;
t3 = pi/4;
t4 = pi/2;
t5 = pi/3;
t6 = pi/12;
l1 = 183;
l2 = 210;
l3 = 30;
l4 = 221.5;
x = 0;
y = -76.6494;
z = 586.5825;
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
