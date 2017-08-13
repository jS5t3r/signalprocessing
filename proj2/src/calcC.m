function [ C ] = calcC( N )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Anhand der DCT-2 Formel am Angabeblatt wird die DCT-Matrix berechnet.
%  
% INPUT:
% N ... als die Länge des Inputvektors
%
% OUTPUT:
% NxN Matrix 
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% author: Peter Lorenz, Robert Reichel
% last update: 
% octave/matlab version: 2014a, Linux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tmp = zeros(N,N);
for k = 0:N-1
    for n = 0:N-1
        tmp(k+1,n+1) = cos(pi/N*(n+0.5)*k);
    end
end

C = tmp;

end

