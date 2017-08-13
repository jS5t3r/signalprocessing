function [ y ] = ksalgorithm( x, alpha, M, Nout )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Die ersten M Werte werden von x nach ich x1 kopiert, wobei die restlichen
% Wert von x1 0 sind. Die filter(1, a, x1) Funktion wird mit der
% Transferfunktion gestopft. Die M ersten Samples bleiben gleich wie beim Original
% Bei den restlichen Wert von M  bis Nout werden immer wiederkehren die 
% filter Daten dazuaddiert.
%  
% INPUT: 
% x Eingangsvektor mit der Länge Nout
% alpha ... H(z)
% M ... Verzögerung
% Nout ... länge des Eingangsvektors
%
% OUTPUT:
% y als Ausgangsvektor mit der Länge Nout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% author: Peter Lorenz, Robert Reichel
% last update: 
% octave/matlab version: 2014a, Linux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x1 = zeros('like',x);
    x1(1:M) = x(1:M);
    % get a clue of a here: https://dsp.stackexchange.com/questions/41629/matlab-implementation-of-karplus-strong-algorithm-with-filter-function/41630?noredirect=1#comment79430_41630
    a = [1 zeros(1,M-1) -alpha];
    tmp = filter(1,a,x);
    for n = M:Nout
        x1(n) = x(n) + tmp(n-M+1);
    end
    y = x1;
end

