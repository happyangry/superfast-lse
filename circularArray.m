% DOA using bayesian super fast LSE
% for a linear array
tic
clear
% For reproducibility
% rng(1);

% Parameters
kr = 5;

N = 15;     % number of microphones
K = round(N/10);    % number of incident plane waves
index = (1:N)';
snr = 20;	% dB
theta = (index-1)*2*pi/N;
% Select frequencies by rejection sampling
% (avoid closely located frequencies)
while true
	thetai = sort(rand(K,1));
	if all(diff(thetai)>2/N) ...
			&& (thetai(1)-thetai(end)+1) > 2/N
		break;
	end
end

[thetai_grid,theta_grid] = meshgrid(thetai,theta);

% Generate signal
alpha = randn(K, 2) * [1;1j];
% alpha = alpha./abs(alpha);	% Normalize to magnitude 1
x = exp(-1j*kr*cos(theta_grid-thetai_grid)) * alpha;
noiseVar = mean(abs(x).^2) / 10^(snr/10);
y = x + sqrt(noiseVar/2) * randn(N, 2) * [1;1j];

% Run algorithm
out = my_lse(y, index, N, 'verbose',false, 'plot',true, 'use_direct', true);

% Print result
fprintf('True freqs,  Estimated freqs, Difference\n');
% [sort(costhetai)*0.5, out.tau, abs(sort(costhetai)*0.5-out.tau)]

toc