function f = get_force(a)
% get_force Gets force based on agent's action.
kappa_1 = 25;
kappa_2 = 50;

if a == 1
    f = -kappa_2;
elseif a == 2
    f = -kappa_1;
elseif a == 3
    f = 0;
elseif a == 4
    f = kappa_1;
elseif a == 5
    f = kappa_2;
end
end
