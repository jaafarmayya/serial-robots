function [ s ] = ikm( T, pos)

    syms t2 t3 t4 t5 t6 d1 d2 d3 d4 d5 d6;
    
    sol = [atan2(pos(1), pos(2)), atan2(-pos(1),-pos(2))]
    
    for i=1:2
        t1 = sol(i)
        subs(T);
        s = solve(T(2, 4) == pos(2), T(3, 4) == pos(3), t2, t3);
%         double([s.t2, s.t3])
    end
end

