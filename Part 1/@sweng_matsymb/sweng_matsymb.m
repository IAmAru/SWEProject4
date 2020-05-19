%Alejandro Jimenez Rocha - sai993

classdef sweng_matsymb < handle
    properties (SetAccess = public)
       
        % The default values of each symbolic function.
        % According to the docs, and my own observations, all of these are
        % defined as a [1x1 sym], meaning these are successfully defined as
        % a symbolic function.
           x = sym('x');
           y = sym('y');
           y1 = sym('y1');
           y2 = sym('y2');
           xo = sym('xo');
           a = sym('a');
           b = sym('b');
           c = sym('c');
           f = sym('f');
           d = sym('d');
           x1 = sym('x1');
           x2 = sym('x2');
           t = sym('t');   
    end
    
    % Due to time constraints I decided only to use the first few equations
    % in ComputatoinalMathematicsExample.m. I hope that is fine.
    
    methods (Static)
        function xyfun = sweng_matsymb(x,y)
            switch nargin
                case 0
                    disp("Not enough arguments provided. (Missing x or y).")
                    disp("Using default variables.")
                    xyfun.x = sym('x');
                    xyfun.y = sym('y');
                case 1
                    xyfun.x = x;
                    xyfun.y = sym('y');
                case 2
                    xyfun.x = x;
                    xyfun.y = y;
            end
        end
        function fun1(xyfun)
            syms x y
            d = log(xyfun.x) + exp(xyfun.y);
            disp("The result for the requested function, log(x) + exp(y), is:")
            disp(d)
        end
        
        function fun2(xyfun)
            % Initiates the symbols, evaluates at the asked value.
            syms x y
            y(x) = piecewise(x < 0, -1, x > 0, 1);
            disp("The result for the requested piecewise function using the provided x is:")
            disp(y(xyfun.x))
        end
        
        function fun3(xyfun)
            % Initiates the symbols, evaluates at the asked value.
            syms f(x)
            f(x) = x^4-2*x^3+6*x^2-2*x+10;
            disp("The result for the requested function using the provided x is:")
            disp(f(xyfun.x))
        end
    end     
end