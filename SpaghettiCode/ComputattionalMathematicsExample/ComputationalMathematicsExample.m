%% Computational Mathematics in Symbolic Math Toolbox
% This example provides an overview of the Symbolic Math Toolbox which offers 
% a complete set of tools for computational and analytical mathematics.
% 
% 
% 
% This example includes
%% 
% * Variables, Expressions, Functions and Equations 
% * Substitution and Solving
% * Simplification and Manipulation
% * Calculus (Differentiation, Integration, Limits, Series)
% * Differential Equations
% * Linear Algebra
% * Graphics
%% 
% For more details see <matlab:helpview([docroot '/symbolic/getting-started-with-symbolic-math-toolbox.html']) 
% Getting Started with Symbolic Math Toolbox>.  For more details on documenting 
% and sharing your mathematics see <matlab:helpview([docroot '/matlab/matlab_prog/create-live-scripts.html']) 
% Live Scripts>.
%% Variables, Expressions, Functions and Equations
% Variables in MATLAB are by default double-precision.  The Symbolic Math Toolbox 
% extends this by allowing you to express numbers in exact symbolic form using 
% <matlab:helpview([docroot '/symbolic/sym.html']) |sym|> and with variable-precision 
% using <matlab:helpview([docroot '/symbolic/vpa.html']) |vpa|>. 

pi/6 + pi/4
sym(pi/6) + sym(pi/4)
vpa(pi/6) + vpa(pi/4)
%% 
% Symbolic variables can be used in mathematical expressions, functions and 
% equations including trigonometric, logarithmic, exponential, and special functions. 
% You can create symbolic expressions and perform mathematical calculations on 
% them.

syms x y 
log(x) + exp(y)
%% 
% You can also create piecewise functions.

y(x) = piecewise(x<0, -1, x>0, 1)
%% 
% Create and evaluate <matlab:helpview([docroot '/symbolic/create-symbolic-functions.html']) 
% functions>. Find the value of |f| at $x = -5$.

syms f(x)
f(x) = x^4-2*x^3+6*x^2-2*x+10
f(-5)
%% 
% Find the intersection between lines $y1$ and $y2$ using <matlab:helpview([docroot 
% '/symbolic/solve.html']) solve>. Equate the lines using the == operator. 

syms y1 y2
y1 = x+3; y2 = 3*x;
solve(y1 == y2)
%% 
% Make <matlab:helpview([docroot '/symbolic/assume.html']) assumptions> on symbolic 
% variables. There are 4 solutions to $x^4=1$, two real and two complex.  Assuming 
% that x is real and $x > 0 $, there is only one solution.

syms x
solve(x^4 == 1)
assume(x,'real')
assumeAlso( x > 0)
assumptions(x)
solve(x^4 == 1)
assume(x,'clear')
%% Substitution and Solving
% The Symbolic Math Toolbox supports evaluation of mathematical functions by 
% substituting for any part of an expression using <matlab:helpview([docroot '/symbolic/subs.html']) 
% subs>. You can substitute numeric values, other symbolic variables or expressions, 
% vectors, or matrices. The Symbolic Math Toolbox supports the solving of equations 
% and systems of equations using <matlab:helpview([docroot '/symbolic/solve.html']) 
% solve>.  It supports solving multivariate equations, solving inequalities and 
% solving with assumptions. Solutions can be found symbolically or numerically 
% with high precision by using variable-precision arithmetic. 
% 
% Make substitutions with your symbolic variables. Substitute $x = xo - 1$ into 
% $x^2 + 1$ 

syms x xo
subs(x^2+1,x,xo-1)
%% 
% Substitute multiple values. For example, evaluate $cos(a) + sin(b) - e^{2C}$ 
% by substituting  $a = \frac{\pi }{2}, b = \frac{\pi }{4}, c =-1$.

syms a b c
subs(cos(a) + sin(b) - exp(2*c), [a b c], [pi/2 pi/4 -1])
%% 
% Create and solve equations. Find the zeros of $9x^2-1 = 0$.

solve(9*x^2 - 1 == 0)
%% 
% Solve the general quadratic equation $ax^2 + bx + c = 0$ and use subs to evaluate 
% that solution for $a =9, b = 0, c =-1$.

eqn = a*x^2 + b*x + c == 0;
sol = solve(eqn) 
subs(sol,[a b c],[9 0 -1])
%% 
% Solve equations symbolically or with variable-precision arithmetic when exact 
% results or high precision is needed. The graph of $f\left(x\right)\;=\;6x^7 
% -2x^6 +3x^3 -8$ is very flat near its root. 

syms x f(x)
assume(x>0)
f(x) = 6*x^7-2*x^6+3*x^3-8;
fplot(f)
xlim([-10 10])
ylim([-1e3 1e3])
doubleSol = roots([6 -2 0 0 3 0 0 -8]) %  double-precision
symsSol = solve(f) % exact. The roots object stores the zeros for symbolic computations
vpaSol = vpasolve(f) % variable-precision 
%% Simplification and Manipulation
% The Symbolic Math Toolbox supports the <matlab:helpview([docroot '/symbolic/formula-manipulation-and-simplification.html']) 
% simplification and manipulation> of mathematical functions. Most mathematical 
% expressions can be represented in different, but mathematically equivalent forms 
% and the Symbolic Math Toolbox supports a number of operations, including factoring 
% or expanding expressions, combining terms, rewriting or rearranging expressions, 
% and simplification based on assumptions. 
% 
% Perform polynomial multiplication and simplify the results, show that $(x 
% - 1)(x + 1)(x^2 + x + 1)(x^2 + 1)(x^2 - x + 1)(x^4 - x^2 + 1)$ simplifies to 
% $x^{12}-1$.

simplify((x - 1)*(x + 1)*(x^2 + x + 1)*(x^2 + 1)*(x^2 - x + 1)*(x^4 - x^2 + 1))
%% 
% Apply trigonometric identities to simplifications, for example  $sin^2(x) 
% = \frac{1-cos(2x)}{2}$ .

combine(2*sin(x)*cos(x) + (1- cos(2*x))/2 + cos(x)^2,'sincos')
%% 
% Factor or expand multivariate polynomials.

syms x y
factor(y^6-x^6)
f(x) = (x^3 + 7);
expand(f(y-1))
%% 
% Find the functional composition $f(g(x))$.

f(x) = sqrt(log(x));
g(x) = sqrt(1-x);
h = compose(g,f,x)
%% Calculus (Differentiation, Integration, Limits, Series, etc)
% The Symbolic Math Toolbox has a full set of calculus tools for applied mathematics. 
% It can perform multivariate symbolic integration and differentiation.  It can 
% generate, manipulate, and perform calculations with series.
% 
% Find the derivative of $\frac{d}{dx} \left(\sin(x)\right)$.

diff(sin(x))
%% 
% Find the derivative of $\frac{d}{dx} \left(x^2+\sin(2x^4)+1\right)$ using 
% the chain rule.

diff(x^2+sin(2*x^4)+1,x)
%% 
% Find the indefinite integral $\int f(x)\,dx$ for $f(x) = e^ \frac{-x^2}{2}$.

int(exp(-x^2/2),x)
%% 
% Find the definite integral $\int_a^b f(x)\,dx$ for $f(x) = x \log(1+x)$ from 
% _0_ to _1._

int(x*log(1+x),0,1)
%% 
% Show that $\frac{sin(x)}{x} =1$ at $x = 0$ by computing the Taylor series 
% expansion $\sum(x-a)^n \frac{f^{(n )}(a)}{n!}$  for $f(x) = \frac{sin(x)}{x}$ 
% around the point $x = 0$.

syms x 
T = taylor(sin(x)/x)
subs(T,x,0)
%% 
% Show that $tan(x)$ is discontinuous at $x=\frac{\pi}{2}$ by showing that the 
% left and right limits are not equal. $\lim_{x\to\frac{\pi}{2}^{+}} tan(x) \neq 
% \lim_{x\to\frac{\pi}{2}^{-}} tan(x) $.

limit(tan(x),x,pi/2,'left')
limit(tan(x),x,pi/2,'right')
limit(tan(x),x,pi/2)
%% Differential Equations
% The Symbolic Math Toolbox can analytically solve systems of <matlab:helpview([docroot 
% '/symbolic/solve-a-single-differential-equation.html']) ordinary differential 
% equations> using |dsolve|.
% 
% Solve the first order ODE  $\frac{dy}{dx} = -ay$.

syms a b y(x)
dsolve(diff(y) == -a*y)
%% 
% Solve the same ODE with the initial condition  $y(0) = b$.

dsolve(diff(y)== -a*y,y(0)==b)
%% 
% Solve the system of coupled first order ODEs $\frac{dx}{dt} = y$ and $\frac{dy}{dt} 
% = -x$.

syms x(t) y(t)
z = dsolve(diff(x) == y, diff(y) == -x);
disp([z.x;z.y])
%% Linear Algebra
% The Symbolic Math Toolbox can work with symbolic vectors and matrices. It 
% can compute <matlab:helpview([docroot '/symbolic/eig.html']) eigenvalues and 
% eigenvectors> of symbolic matrices.
% 
% Perform matrix multiplication$Ax = b$ where $A = \left[\begin{array}{cc}a 
% & b \\c & d  \end{array} \right] $and $x = \left[{x1 ,x2}]$  

syms a b c d
syms x1 x2
x = [x1; x2];
A = [a b ; c d];
b = A*x
%% 
% Find the determinant of A.

det(A)
%% 
% Find the eigenvalues of A.

lambda = eig(A)
%% Graphics
% The Symbolic Math Toolbox supports analytical plotting in 2D and 3D.

fplot(tan(x))
%% 
% Plot the parametric curve $x(t) = t*sin(5t)$ and $y(t) = t*cos(5t)$.

syms t
x = t*sin(5*t); 
y = t*cos(5*t);
fplot(x, y)
grid on
%% 
% Plot the 3D parametric curve $x(t) =e^{\frac{|t|}{10}}sin(5|t|)$, $y(t)=e^{\frac{|t|}{10}}cos(5|t|)$ 
% and $z(t) = t$ from |[-10,10]| with a dashed red line.

syms t
xt = exp(abs(t)/10).*sin(5*abs(t));
yt = exp(abs(t)/10).*cos(5*abs(t));
zt = t;
h = fplot3(xt,yt,zt, [-10,10],'--r');
%% 
% Plot the 3D surface $f(x,y) = sin(x) + cos(y)$.

syms x y
fsurf(sin(x) + cos(y))
%% 
% Plot the 2D contours of the same surface. 

fcontour(sin(x) + cos(y))
%% 
% _Copyright 2015 The MathWorks, Inc._
% 
%