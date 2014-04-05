function T = th_intermodes(I,n);
% T =  th_intermodes(I,n)
%
% Find a global threshold for a grayscale image by choosing the threshold to
% be the mean of the two peaks of the bimodal histogram.
%
% In:
%  I    grayscale image
%  n    maximum graylevel (defaults to 255)
%
% Out:
%  T    threshold
%
% References: 
%
% J. M. S. Prewitt and M. L. Mendelsohn, "The analysis of cell images," in
% Annals of the New York Academy of Sciences, vol. 128, pp. 1035-1053, 1966.
%
% C. A. Glasbey, "An analysis of histogram-based thresholding algorithms,"
% CVGIP: Graphical Models and Image Processing, vol. 55, pp. 532-537, 1993.
%
% Copyright (C) 2004 Antti Niemist�
% See README for more copyright information.

if nargin == 1
  n = 255;
end

I = double(I);

% Calculate the histogram.
y = hist(I(:),0:n);

% Smooth the histogram by iterative three point mean filtering.
iter = 0;
while ~bimodtest(y)
  h = ones(1,3)/3;
  y = conv2(y,h,'same');
  iter = iter+1;
  % If the histogram turns out not to be bimodal, set T to zero.
  if iter > 10000;
    T = 0;
    return
  end
end

% The threshold is the mean of the two peaks of the histogram.
ind = 0;
for k = 2:n
  if y(k-1) < y(k) & y(k+1) < y(k)
    ind = ind+1;
    TT(ind) = k-1;
  end
end
T = floor(mean(TT));
