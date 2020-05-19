function helperTimeFrequencyAnalysisPlotReassignment(F,T,P,Fc,Tc,axis)
% Plot helper function for the TimeFrequencyAnalysisExample
 
% Copyright 2015 The MathWorks, Inc.

% correct for kHz in the plot
[~,b] = engunits(F);
F = F*b;
Fc = Fc*b;

% create original time-frequency grid, offset by bin-width to account
% for the spacing in between bins
[Tm,Fm] = meshgrid(T,F);
dF = mean(diff(F))/2;

% filter out reassignments past a few frequency bins
P(abs(Fc-Fm) > 5*dF) = 0;

if nargin<6 || ~strcmp(axis,'yaxis')
  % plot time vs frequency
  helperLineArrows(Fm(P>0)+dF, Tm(P>0), Fc(P>0)+dF, Tc(P>0), .004, pi/10)
else
  % plot frequency vs time
  helperLineArrows(Tm(P>0), Fm(P>0)+dF, Tc(P>0), Fc(P>0)+dF, .004, pi/10)
end

function helperLineArrows(x1, y1, x2, y2, s, angle)
% manually trace out an arrow for each line from (x1,y1) -> (x2,y2)

hAxes = gca;
hAxes.Units = 'Pixels';
z1 = complex(x1,y1);
z2 = complex(x2,y2);

% get a unit vector along the direction of the line
Zunit = (z2-z1) ./ abs(z2-z1);

% scale by local pixel/data density
sx = hAxes.Position(3)/diff(hAxes.XLim);
sy = hAxes.Position(4)/diff(hAxes.YLim);
sZunit = complex(sx*real(Zunit),sy*imag(Zunit));

% compute arrowhead ear points
Zup = s * sZunit * exp( 1i*angle);
Zdn = s * sZunit * exp(-1i*angle);

Zup = complex(real(Zup)/sx,imag(Zup)/sy);
Zdn = complex(real(Zdn)/sx,imag(Zdn)/sy);

p1 = z2 - Zup;
p2 = z2 - Zdn;

% plot points: end -> base -> ear1 -> tip -> ear2 -> base
% fencepost each arrow with NaN
Zcoords = [z1 (p1+p2)/2 p1 z2 p2 (p1+p2)/2 nan(size(z1))];

% draw single line containing all the arrows
line(real(Zcoords.'),imag(Zcoords.'),'color',[0 0 0]);
