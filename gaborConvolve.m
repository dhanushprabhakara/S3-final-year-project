function [gaborFeature] = gaborConvolve(im)
% gaborconvolve - function for convolving each row of an image with 1D log-Gabor filters
%
% Arguments:
%   im              - the image to convolve
%
% Output:
%   gaborFeature              - a 1D cell array of complex valued comvolution results


%   minWaveLength   - wavelength of the basis filter
sigmaOnf = 0.5;

%   sigmaOnf        - Ratio of the standard deviation of the Gaussian describing
%                     the log Gabor filter's transfer function in the frequency
%                     domain to the filter center frequency.
minWaveLength = 18;

[rows cols] = size(im);

ndata = cols;

radius =  [0:fix(ndata/2)]/fix(ndata/2)/2;  % Frequency values 0 - 0.5

% Construct the filter - first calculate the radial filter component.
fo = 1.0/minWaveLength;                  % Centre frequency of filter.

% corresponding to fo.
logGabor(1:ndata/2+1) = exp((-(log(radius/fo)).^2) / (2 * log(sigmaOnf)^2));

filter = logGabor;

% for each row of the input image, do the convolution, back transform
for r = 1:rows	% For each row
    signal = im(r,1:ndata);
    imagefft = fft( signal );
    result(r,:) = ifft(imagefft .* filter);
end

gaborFeature.gabMag = real(result);
gaborFeature.gabPhs = imag(result);

