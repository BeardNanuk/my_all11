%
% compute_Gik_ray.m
%
% Template function for Ge162 (J. Tromp), homework set on seismic
% tomography and inverse methods.
%
% calls xxx
% called by xxx
%

format short
format compact
close all
clear

%-----------------------------

ax1 = [-120.157113 -114.809623 32 36.364429];
lonmin = ax1(1); lonmax = ax1(2);
latmin = ax1(3); latmax = ax1(4);
colors;

%-----------------------------
% LOAD DATA

% load sources
[slons,slats,sinds] = textread('events_lonlat.dat','%f%f%f','headerlines',1);
nsrc = length(slats);

% load receivers
[rlons,rlats,rinds] = textread('recs_lonlat.dat','%f%f%f','headerlines',1);
nrec = length(rlats);

% load spline centers
[qlons,qlats] = textread('con_lonlat_q08.dat','%f%f','headerlines',0);
nspline = length(qlats);

figure; hold on;
plot(qlons,qlats,'.');
text(qlons,qlats,num2str([1:nspline]'),'fontsize',6); % only seen when printed/saved
axis equal, axis(ax1);
xlabel(' Longitude'); ylabel(' Latitude');
title(' Center-points of spherical spline basis functions');
fontsize(10); orient tall;  wysiwyg

% load reference velocity
% THIS MAY BE DIFFERENT FROM ONE MODEL TO THE NEXT
%temp = load('socal_vel_c0.dat');
%c0 = temp(1); % homogeneous model
c0 = 3500.0; %temp(1); % homogeneous model
c0inv=1/c0;

% % test the ordering scheme for the rows of G
% if (1==1)
%     %i = 0;
%     disp('     i   isrc  irec ');
%     for isrc = 1:nsrc
%         for irec = 1:nrec
%             %i = i+1;
%             i = (isrc-1)*nrec + irec;
%             disp(sprintf('%6i%6i%6i',i,isrc,irec));
%         end
%     end
% end

%-----------------------------
% number of segments on each ray path
nrs = 1000;
% number of points on each ray path
nrp=nrs+1;
% compute ray paths (great circles)
nray=nsrc*nrec;
rlen=zeros(nray,1);
rlatp=zeros(nrp,nray);
rlonp=zeros(nrp,nray);
iray=0;
iray0=1; iray1=nrec;
for isrc=1:nsrc
    slon=slons(isrc);
    slat=slats(isrc);
    
    % ray lengths for an event
    rlen(iray0:iray1)=arcdist(slat,slon,rlats,rlons);
    for irec=1:nrec
        iray=iray+1;
        rlon=rlons(irec);
        rlat=rlats(irec);
        % discretize a ray
        [rlatp(:,iray),rlonp(:,iray)]=gcwaypts(slat,slon,rlat,rlon,nrs);        
    end
    iray0=iray1+1;
    iray1=iray1+nrec;
end

% convert ray lengths to m
deg2rad=pi/180;
radius0=6371000; % radius of the Earth
rlen=deg2rad*radius0*rlen;
drlen=rlen/nrs; % segemnt on a ray

% spline parameters
opts = {1};
q = 8;

% compute design matrix
B=zeros(nrp); % Slpines
G=zeros(nray,nspline); % G matrix
for iray=1:nray
    fac=-c0inv*drlen(iray); % only fro homogeneous model
    for ispl=1:nspline
        % spline evaluation along a ray
        B = spline_vals(qlons(ispl), qlats(ispl), q, rlonp(:,iray), rlatp(:,iray), {1});
        
        % G matrix
        G(iray,ispl)=fac*sum(B);
        % note: correct should be sum(B(2:end)) or sum(B(1:end-1)) but
        % insignificant for large number of points
        if iray==126 && ispl==203
            fprintf(1,'Gik matrix element for i=%d and k=%d is %f\n',iray,ispl,G(iray,ispl));
        end
        if iray==126 && ispl==204
            fprintf(1,'Gik matrix element for i=%d and k=%d is %f\n',iray,ispl,G(iray,ispl));
        end
    end
end

%save design matrix
save('Gmat_ray','G');

%=====================================================================

