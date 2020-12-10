%Example 1.1
p1=[1 -10 35 -50 24] % Specify the coefficients of p1(x)
roots_p1=roots(p1) % Find the roots of p1(x)

%Example 1.2
p2=[1 -7 0 16 25 52]
roots_p2=roots(p2)

%Example 1.3
r3=[1 2 3 4] % Specify the roots of the polynomial
poly_r3=poly(r3) % Find the polynomial coefficients

%Example 1.4
r4=[-1 -2 -3 -4+5j -4-5j ]
poly_r4=poly(r4)

%Example 1.5
p5=[1 -3 0 5 -4 3 2]; % These are the coefficients
x=-3
val_x=polyval(p5, x) % Evaluate p5 at x=?3. No semicolon is used here

%conv(a,b) ? multiplies two polynomials a and b
%[q,r]=deconv(c,d) ?divides polynomial c by polynomial d and displays the quotient q and remain?der r.
%polyder(p) ? produces the coefficients of the derivative of a polynomial p. 

%Example 1.6
p1=[1 -3 0 5 7 9];
p2=[2 0 -8 0 4 10 12];
p1p2=conv(p1,p2) %multiply

%Example 1.7
p3=[1 0 -3 0 5 7 9]; p4=[2 -8 0 0 4 10 12]; 
[q,r]=deconv(p3,p4) %divide

%Example 1.8
p5=[2 0 -8 0 4 10 12];
der_p5=polyder(p5) %derivative


%Example 1.9
num=[1 -3 0 5 7 9]; den=[2 0 -8 0 4 10 12];
roots_num=roots(num), roots_den=roots(den)

%Example 1.10 - plot01
w=[300 400 500 600 700 800 900 1000 1100 1200 1300 1400.... % Use 4 periods to continue
1500 1600 1700 1800 1900 2000 2100 2200 2300 2400 2500.... 
2600 2700 2800 2900 3000]; 
z=[39.339 52.789 71.104 97.665 140.437 222.182 436.056.... 
1014.938 469.830 266.032 187.052 145.751 120.353 103.111.... 
90.603 81.088 73.588 67.513 62.481 58.240 54.611 51.468.... 
48.717 46.286 44.122 42.182 40.432 38.845];
plot(w,z)

%plot02 - used semilog scale
semilogx(w,z); grid; % Replaces the plot(w,z) command
title('Magnitude of Impedance vs. Radian Frequency');
xlabel('w in rads/sec'); ylabel('|Z| in Ohms')

%plot03
x=linspace(0, 2*pi, 60); % pi is a built?in function in MATLAB;
% we could have used x=0:0.02*pi:2*pi or x = (0: 0.02: 2)*pi instead;
y=sin(x); u=sin(x+2*pi/3); v=sin(x+4*pi/3); 
plot(x,y,x,u,x,v); % The x?axis must be specified for each function
grid on, box on, % turn grid and axes box on
text(0.75, 0.65, 'sin(x)'); text(2.85, 0.65, 'sin(x+2*pi/3)'); text(4.95, 0.65, 'sin(x+4*pi/3)')

%Example 1.11
x= -10: 0.5: 10; % Length of vector x 
y= x; % Length of vector y must be same as x
z= -2.*x.^3+x+3.*y.^2-1; % Vector z is function of both x and y* 
plot3(x,y,z); grid

%Example 1.12
[R,H]=meshgrid(0: 4, 0: 6); % Creates R and H matrices from vectors r and h
V=(pi .* R .^ 2 .* H) ./ 3; mesh(R, H, V)
xlabel('x?axis, radius r (meters)'); ylabel('y?axis, altitude h (meters)');
zlabel('z?axis, volume (cubic meters)'); title('Volume of Right Circular Cone'); box on

%Example 1.13
t=0: 0.01: 5; % Define t?axis in 0.01 increments
y=3 .* exp(-4 .* t) .* cos(5 .* t)-2 .* exp(-3 .* t) .* sin(2 .* t) + t .^2 ./ (t+1);
plot(t,y); grid; xlabel('t'); ylabel('y=f(t)'); title('Plot for Example 1.13')

%Example 1.14
x=linspace(0, 2*pi,100); % Interval with 100 data points
y=(sin(x) .^ 2); z=(cos(x) .^ 2); 
w=y .* z;
v=y ./ (z+eps); % add eps to avoid division by zero
subplot(221); % upper left of four subplots
plot(x,y); axis([0 2*pi 0 1]);
title('y=(sinx)^2');
subplot(222); % upper right of four subplots
plot(x,z); axis([0 2*pi 0 1]); 
title('z=(cosx)^2');
subplot(223); % lower left of four subplots
plot(x,w); axis([0 2*pi 0 0.3]);
title('w=(sinx)^2*(cosx)^2');
subplot(224); % lower right of four subplots
plot(x,v); axis([0 2*pi 0 400]);
title('v=(sinx)^2/(cosx)^2');

%Example 1.15
w=0: 1: 2000; % Define interval with one radian interval
z=(10+(10 .^ 4 -j .* 10 .^ 6 ./ (w+eps)) ./ (10 + j .* (0.1 .* w -10.^5./ (w+eps))));
%
% The first five statements (next two lines) compute and plot Re{z}
real_part=real(z); plot(w,real_part); grid;
xlabel('radian frequency w'); ylabel('Real part of Z');
%
% The next five statements (next two lines) compute and plot Im{z}
imag_part=imag(z); plot(w,imag_part); grid;
xlabel('radian frequency w'); ylabel('Imaginary part of Z');
%
% The last six statements (next six lines) below produce the polar plot of z
mag=abs(z);% Computes |Z|
rndz=round(abs(z));% Rounds |Z| to read polar plot easier
theta=angle(z);% Computes the phase angle of impedance Z
polar(theta,rndz);% Angle is the first argument
grid;
ylabel('Polar Plot of Z');

%Example 1.16
%
x=-1.5: 0.01: 1.5;
y=1./ ((x-0.1).^ 2 + 0.01) -1./ ((x-1.2).^ 2 + 0.04) -10;
plot(x,y); grid
%
fplot('funczero01', [-1.5 1.5]); grid
%
x1= fzero('funczero01', -0.2);
x2= fzero('funczero01', 0.3);
fprintf('The roots (zeros) of this function are r1= %3.4f', x1);
fprintf(' and r2= %3.4f \n', x2)
%
%syms x ymin zmin; 
ymin=1/((x-0.1)^2+0.01)-1/((x-1.2)^2+0.04)-10;....
zmin=diff(ymin)
solve(zmin)
%
x=-1.5:0.01:1.5; ymax=-1./((x-0.1).^2+0.01)+1./((x-1.2).^2+0.04)+10; plot(x,ymax); grid
%
%syms x ymax zmax; 
ymax=-(1/((x-0.1)^2+0.01)-1/((x-1.2)^2+0.04)-10); zmax=diff(ymax)
solve(zmax)

