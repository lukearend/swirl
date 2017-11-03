% Builds reward function.
num_states = 256;
num_actions = 5;

R = zeros(num_actions,num_states,num_states);

for s = 1:256
    s_x = mod((s-1)/4^0, 4);
    s_theta = mod((s-1 - 4^0*s_x)/4^1, 4);
    s_v = mod((s-1 - 4^0*s_x - 4^1*s_theta)/4^2, 4);
    s_omega = mod((s-1 - 4^0*s_x - 4^1*s_theta - 4^2*s_v)/4^3, 4);
    
    if any(s_theta == [0,3]) || any(s_x == [0,3])
        R(:,:,s) = -1;
    else
        R(:,:,s) = 0;
    end
end

save('reward_fn.mat','R')