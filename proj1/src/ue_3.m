%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment 3 
% author: Peter Lorenz, Rober Reichel
% last update: 
% octave/matlab version:  2014a, Linux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;

%% 3.3 a)
% (a) [1 Punkt(e)] Finden Sie eine Differenzengleichung, die das System beschreibt (d.h. y[n] in
% Abhängigkeit von x[n], h[n] und M ausdrückt). Weiters Bestimmen Sie H1(z) = X(z)  Y(z).

% https://engineering.purdue.edu/~ipollak/ee438/FALL04/notes/Section1.6.pdf
% y[n] = x[n] - h[n-m];
% Siehe Simulationsprotokoll.

%% 3.3 b)
[x, fs] = audioread('Data/sample1.wav');
N = length(x);
f = (0:(N-1))*fs/N;

% https://de.mathworks.com/matlabcentral/answers/16059-finding-the-main-frequency-after-fft
xdft = fft(x);
[~,index] = max(abs(xdft(1:length(x)/2+1)));
freq = 0:(fs/length(x)):fs/2;

fig = figure(200);
plot(abs(xdft));
title('Absolutbetrag der DFT von x[n]');
xlabel('Frequenz / Hz');
ylabel('Absolutbetrag / Amplitude von x[n]');

saveas(fig, '../doc/img/tmp/33b.png')

% Wir haben einen rein reelwertiges Signal, dadurch wissen wir dass das
% DFT Spektrum symmetrisch wird. Bei max() brauchen wir nur die Hälfte des
% Spektrum betrachten wüssen, weil es eben symmetrisch ist, um das Maximum zu finden.
% Mit den Index bestimme ich beim Plot die Frequenz, wo sie nicht 0 ist
% sondern das Maximum (also wo die Amplitute max ist).


%% 3.3 c)
% (c) [1 Punkt(e)] Auf Basis der in Punkt (b) errechneten Grundfrequenz erstellen Sie einen
% Vektor x1, der die erste Periode der Laenge T0 des Signals x[n] beinhaltet. Stellen Sie den
% Signalausschnitt x1 mithilfe von plot dar und achten Sie auf korrekte Achsenbeschriftung.
close all;

T_0 = 1/f(index);
cnt_samples = fs / f(index);

fig = figure(201);
y_axis = (0:1/fs:T_0);
x1 = x(1:cnt_samples);
plot(y_axis(1:cnt_samples), x1);
title('Signal x1');
ylabel('x1[n]');
xlabel('n');

saveas(fig, '../doc/img/tmp/33c.png')

%% 3.3 d)
% (d) [1 Punkt(e)] Betrachten Sie nun das obige Blockschaltbild und wählen Sie H(z) = α und
% M = T0 fs . Welche Bedingung muss α erfullen, damit die Stabilitäat von H1(z) garantiert ist?

% M = T_0*fs;
% Siehe Simulationsprotokoll.


%% 3.3 e)
close all;

M = T_0*fs;
alpha = 0.99;
x_input = zeros(2*fs, 1);
x_input(1:M) = x(1:M);
Nout = 2*fs;
x1 = x(1:M);

% https://en.wikipedia.org/wiki/Karplus%E2%80%93Strong_string_synthesis
y = ksalgorithm(x_input, alpha, M, Nout);

f_y = figure(600);
plot(y);
title('KS Algorithm');
xlabel('n');
ylabel('y[n]');

saveas(f_y, '../doc/img/tmp/33e.png')

%% 3.3 f)
close all;

% play the sound
soundsc(y,fs);
audiowrite('3_3f_25m.wav',y,fs);

M_2 = round(M/2);
y_2 = ksalgorithm(x_input, alpha, M_2, Nout);
soundsc(y,fs);
audiowrite('3_3f_13m.wav',y_2,fs);

M_3 = 2*M;
y_3 = ksalgorithm(x_input, alpha, M_3, Nout);
soundsc(y,fs);
audiowrite('3_3f_50m.wav',y_3,fs);

f2 = figure(202);
subplot(2,1,1);
hold on;
plot(y_2);
xlim([0 6000]);
title('KS Algorithm: round(M/2)');
xlabel('n');
ylabel('y[n]');

hold off;

subplot(2,1,2)
hold on;
plot(y_3);
xlim([0 20000]);
title('KS Algorithm: M*2');
xlabel('n');
ylabel('y[n]');
hold off;

saveas(f2, '../doc/img/tmp/33f.png');


%% 3.3 g)
close all;
y1 = ksalgorithm(x_input, alpha, 25, Nout);
y2 = ksalgorithm(x_input, 0.5  , 25, Nout);
y3 = ksalgorithm(x_input, 1    , 25, Nout);
y4 = ksalgorithm(x_input, 1.01 , 25, Nout);

fig = figure(210);
set(fig, 'Position', [1 1 1024 1024])

subplot(4,1,1);
hold on;
plot(y1);
xlim([0 12000]);
title('KS Algorithm: alpha = 0.99, M = 25');
xlabel('n');
ylabel('y[n]');
hold off;

subplot(4,1,2);
hold on;
plot(y2);
xlim([0 200]);
title('KS Algorithm: alpha = 0.5, M = 25');
xlabel('n');
ylabel('y[n]');
hold off;

subplot(4,1,3);
hold on;
plot(y3);
xlim([0 1000]);
title('KS Algorithm: alpha = 1, M = 25');
xlabel('n');
ylabel('y[n]');
hold off;

subplot(4,1,4)
hold on;
plot(y4);
xlim([21000 32000]);
title('KS Algorithm: alpha = 1.01, M = 25');
xlabel('n');
ylabel('y[n]');
hold off;

saveas(fig, '../doc/img/tmp/33g.png');

%% 3.3 h)
close all;

y_normal = ksalgorithm(x_input, 0.99, 25, Nout);
x2 = rand(size(x_input));
x2(26:end) = 0;
y_rand = ksalgorithm(x2, 0.99, 25, Nout);

f_h = figure(800);

% plot(y_rand);
% xlim([0 10000]);
% title('KS Algorithm: random input');
% xlabel('n');
% ylabel('y[n]');

subplot(2,1,1);
hold on;
plot(y_normal);
xlim([0 12000]);
title('KS Algorithm: wie Punkt e');
xlabel('n');
ylabel('y[n]');
hold off;

subplot(2,1,2);
hold on;
plot(y_rand);
xlim([0 10000]);
title('KS Algorithm: random input');
xlabel('n');
ylabel('y[n]');
hold off;

saveas(f_h, '../doc/img/tmp/33h.png');
% Bei random sind alle Werte positiv. 

%% 3.3 i)
close all;

X_ = load('Data/Measurement.mat');
X = X_.X.';

x = ifftreal(X);
f = (0:length(X)-1)*100/length(X); 
phase = radtodeg(angle(X));

fig = figure(210);
%set(fig, 'Position', [1 1 1024 1024])

subplot(4,1,1);
hold on;
plot(f,abs(X), 'r');
title('Amplitude');
xlabel('n');
ylabel('abs(x[n])');
hold off;

subplot(4,1,2);
hold on;

plot(f,phase, 'b');
%xlim([0 512]);
title('Phase');
xlabel('n');
ylabel('arg(x[n])');
hold off;

% Phase passt so, weil durch den Absolutbetrag Phasenspruenge entstehen.
% Zeiger am EK bewegen sich nur mehr auf der rechter seite des EK, da
% Realteil durch Absolutbetrag positiv bleibt. Eigentlich gehen sie auf
% linker weiter, was einen Phasensprung bewirkt.

subplot(4,1,3);
hold on;
plot(f,real(X), 'b');
title('Realteil');
xlabel('n');
ylabel('Re(x[n])');
hold off;

subplot(4,1,4)
hold on;
plot(f,imag(X), 'r');
title('Imaginärteil');
xlabel('n');
ylabel('Im(x[n])');
hold off;

saveas(fig, '../doc/img/tmp/33i.png');

fig_time = figure(900);
plot(X_.X);
title('Zeitsignal x[n] im Zeitbereich');
xlabel('Realteil');
ylabel('Imaginärteil');


saveas(fig_time, '../doc/img/tmp/33ia.png');


