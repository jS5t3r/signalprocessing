%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment 4
% author: Peter Lorenz, Rober Reichel
% last update: 14.07
% octave/matlab version:  2014a, Linux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;

%% 4.3 a) Diskrete Kosinus Transformation kann als Matrix Vektor Multiplikation
% angeschrieben werden.

x = randn(65, 1);
C = calcC(length(x));
x_dct = C*x;

% Um zu vergleichen, ob wir richtig gerechnet haben:
dct_matlab = dct(x);

if (x_dct - dct_matlab) <= 0.0001
   disp('juhu. those are the same') 
else
    disp('Not the same! :(')
end 

C_matlab = dctmtx(length(x));
if (C_matlab - C) <= 0.0001
   disp('juhu. those are the same') 
else
    disp('Not the same! :(')
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotten
f2 = figure(202);
subplot(2,1,1);
hold on;
plot(x)
title('Originalfolge x[n]');
xlabel('n');
ylabel('x[n]');
hold off;

subplot(2,1,2)
hold on;
plot(x_dct)
title('Diskrete Kosinus Transformiterte Folge x[n]');
xlabel('n');
ylabel('x[n]');
hold off;

saveas(f2,'img/43a.png');

%% 4.3 b) Diskrete Kosinus Transformation kann als Matrix Vektor Multiplikation
% angeschrieben werden.
clc;
clear all;

N = 3;
C = calcC(N);


% Überprüfung, ob Zeilen zueinander orthogonal sind. 
count = 0;
for i = 1:N
    for m = 1:N
        if(i ~= m)
            count = count + 1;
            orthogonal = dot(C(i,:), C(m, :));
            if orthogonal > 0.0000001
                disp('is orthogonal');
            else
                disp('is not orthogonal');
            end
        end
    end
end

%% 4.3.c) 

clc;
clear all;

C = modifiedC(3);

I1 = C*C';
I2 = C'*C;
