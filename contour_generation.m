function seg = contour_generation(I, mask, no_of_iterations, mu)
%   Usage of varibles:
%   input:
%       I:             input image
%       mask:          initial mask
%       num_iter:      total number of iterations
%       mu:            weight of length term


P = double(I);

mask = mask(:,:,1);
phi0 = bwdist(mask) - bwdist(1-mask) + im2double(mask) - 0.5;

%   initial force, set to eps to avoid division by zeros
c1 = 0;
c2 = 255;
force = (c1 + c2)/2.0;

%-- Main loop
for n = 1:no_of_iterations
    inside_force = find(phi0>=0); % inside force
    outside_force = find(phi0<0); % outside force
    force_image = 0; % initial image force for each layer
    
    L = im2double(P(:,:)); % get one image component
    force = mean(force(:));
    c1 = sum(sum(L.*Heaviside(phi0)))/(length(inside_force)+force); % average inside of Phi0
    c2 = sum(sum(L.*(1-Heaviside(phi0))))/(length(outside_force)+force); % average outside of Phi0
    force_image = -(L-c1).^2 + (L-c2).^2 + force_image;
    
    % average Force on all components
    % calculate the external force of the image
    force = ((c1 + c2) + (c1 + c2)*mu)/2.0;
    
    dt = 0.5;         % stepsize
    phi0 = phi0 + dt .* force;
    curve_evolution(I, phi0, n);
end
curve_evolution(I, phi0, n);

seg = phi0<=0; %-- Get mask from levelset

