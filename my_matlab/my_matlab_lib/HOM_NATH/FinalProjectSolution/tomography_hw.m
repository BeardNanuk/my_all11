%
% tomography_hw.m
% 
% Template function for Ge162 (J. Tromp), homework set on seismic
% tomography and inverse methods.
%
% This program requires that you have pre-computed the design matrix and
% loaded the pertinent data.
%
%
% calls xxx
% called by xxx
%

clear
close all
format short
format compact

colors;

% plotting region
ax1 = [-121 -114 31 37]; % lon-lat plotting dimensions


%=======================================================================
% LOAD DATA

% load sources
[slon,slat,sind] = textread('events_lonlat.dat','%f%f%f','headerlines',1);
nsrc = length(slat);

% load receivers
[rlon,rlat,rind] = textread('recs_lonlat.dat','%f%f%f','headerlines',1);
nrec = length(rlat);

% load spline centers
[qlon,qlat] = textread('con_lonlat_q08.dat','%f%f','headerlines',0);
nspline = length(qlat);

% load measurement data
d = textread('measure_vec.dat','%f','headerlines',0);

% load design matrix, G
load('Gmat_ray','G')

%=======================================================================
% lon-lat gridpoints for plotting

numx = 100;
[lonplot,latplot] = gridvec(ax1(1),ax1(2),numx,ax1(3),ax1(4));
nplot = length(lonplot);

% Compute design matrix for expanding a function in terms of splines;
% this is needed to view the tomographic models that we generate at the end.
q=8; % order of basis function
B = zeros(nplot,nspline);
for ii=1:nspline
    ff = spline_vals(qlon(ii),qlat(ii),q,lonplot,latplot,{1});
    B(:,ii) = ff(:);
end

%-----------------------------------------
% INVERSE PROBLEM HERE
GTG=G'*G;
GTd=G'*d;
delm0=GTG\GTd;

nm=size(GTd,1);

% using damping
minlam=0.1; maxlam=40.0;
nlam=100;

lam=10.^linspace(log10(minlam), log10(maxlam),nlam);
lam2=lam.*lam;
I=eye(nm);
delm=zeros(nm,nlam);
for ilam=1:nlam
    delm(:,ilam)=(GTG+lam2(ilam)*I)\GTd;   
end

[X,Y,Z] = griddataXB(lonplot,latplot,B*delm(:,50),100,'cubic');
figure; hold on; pcolor(X,Y,Z); shading interp;
plot(slon,slat,'pk','MarkerSize',8,'MarkerFaceColor','r');
plot(rlon,rlat,'^k','MarkerFaceColor','g');
axis equal, axis(ax1); colorbar('horiz'); 
xlabel(' Longitude (deg)'); ylabel(' Latitude (deg)');
title('Perturbation with all events');
%fontsize(11); orient TALL; wysiwyg
colormap(seis)

%figure
%contourf(X,Y,Z, 20)
%colormap(jet(128))

% using only 5 events
nsrc_new=5;
nray=nsrc_new*nrec;
Gnew=G(1:nray,:);
GTG=Gnew'*Gnew;
GTd=Gnew'*d(1:nray);
delm=zeros(nm,nlam);
for ilam=1:nlam
    delm(:,ilam)=(GTG+lam2(ilam)*I)\GTd;   
end

[X,Y,Z] = griddataXB(lonplot,latplot,B*delm(:,50),100,'cubic');
figure; hold on; pcolor(X,Y,Z); shading interp;
plot(slon(1:nsrc_new),slat(1:nsrc_new),'pk','MarkerSize',8,'MarkerFaceColor','r');
plot(rlon,rlat,'^k','MarkerFaceColor','g');
axis equal, axis(ax1); colorbar('horiz'); 
xlabel(' Longitude (deg)'); ylabel(' Latitude (deg)');
titlestr=sprintf('Perturbation with first %d events',nsrc_new);
title(titlestr);
%fontsize(11); orient TALL; wysiwyg
colormap(seis)

%======================================================
