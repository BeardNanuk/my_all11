
x1D = -0.02:0.0008:0.02;
y1D = -0.02:0.0008:0.02;
[x,y] = meshgrid(x1D,y1D);

x_center= 0 ;
y_center = 0;


% array radius
radius_circle = 0.015;
% spatial period (window width)
T_space = 0.006;
% to adjust such that at radius = radius_circle, the total phase is 2*pi
phy = 2*pi*(1-radius_circle/T_space);

% radius inside zero
Dxy = radius_circle - T_space/2;
% radius outside zero
Dxy2 = radius_circle + T_space/2;

% % % mf_cos = 1/2*(1+cos(2*pi*sqrt((x-x_center).^2+(y-y_center).^2)/T_space));
mf_multi_rings = 1/2*(1+cos(2*pi*sqrt((x-x_center).^2+(y-y_center).^2)/T_space + phy));

mf_range1 = sqrt((x-x_center).*(x-x_center)+(y-y_center).*(y-y_center))<Dxy2+1e-12;
mf_range2 = Dxy-1e-12 < sqrt((x-x_center).*(x-x_center)+(y-y_center).*(y-y_center));

mf_one_ring = mf_multi_rings.*mf_range1.*mf_range2;

