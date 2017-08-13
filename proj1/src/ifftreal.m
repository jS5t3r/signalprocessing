function [ x ] = ifftreal( X )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%
% INPUT: 
% X der transformierten
%
% OUTPUT: 
% x im Zeitbereich
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% author: Peter Lorenz, Robert Reichel
% last update: 
% octave/matlab version:  2014a, Linux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    N = length(X);
    tmp = zeros(N,N);
    for n = 0:N-1
        for k = 0:N-1
            tmp(k+1,n+1) = exp(1j*2*pi*n*k/N);
        end
    end

    x = X * (1/N .* tmp);
end
