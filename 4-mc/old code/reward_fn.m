% Builds reward function.
n = 10;
num_actions = 5;

R = zeros(num_actions,num_states,num_states);

num_states = n^4;
for s = 1:num_states
    s_x = mod((s-1)/n^0, n);
    s_theta = mod((s-1 - n^0*s_x)/n^1, n);
    s_v = mod((s-1 - n^0*s_x - n^1*s_theta)/n^2, n);
    s_omega = mod((s-1 - n^0*s_x - n^1*s_theta - n^2*s_v)/n^3, n);

    % Compute state values for pendulum below horizontal and ends of track.
    tmp = (1:n)-1;
    bad_s_theta = tmp((1:n < floor(0.25*n)) & (1:n > ceil(0.75*n)));
    bad_x = [0 n-1];

    if any(s_theta == bad_s_theta) || any(s_x == bad_x)
        R(:,:,s) = -1;
    else
        R(:,:,s) = 0;
    end
end

save('reward_fn.mat','R','-v7.3')
