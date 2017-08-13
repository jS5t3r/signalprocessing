function [ modC ] = modifiedC( N )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Das ist die modifizierte Version von der Funktion calcC(N)!

% Anhand der DCT-2 Formel am Angabeblatt wird die DCT-Matrix berechnet.
% Im Link: https://www.spsc.tugraz.at/sites/default/files/hw4_Anlage2017.pdf gab es
% 2 Hinweise: sqrt(1/N) hinzuzufuegen und dann am Ende die Werte der erste
% Zeile dividieren mit 1/sqrt(2).
%
% INPUT:
% N ... als die Länge des Inputvektors
%
% OUTPUT:
% NxN Matrix, mit orthogonalen Zeilen, somit ist erfüllt C'*C = I
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% author: Peter Lorenz, Robert Reichel
% last update: 
% octave/matlab version: 2014a, Linux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

C = zeros(N,N);
for k = 0:N-1
    for n = 0:N-1
       C(k+1,n+1) = sqrt(2/N) * cos((n+0.5)*k*pi/N);
    end
end

C(1,:) = C(1,:) / sqrt(2);
modC = C;

end
