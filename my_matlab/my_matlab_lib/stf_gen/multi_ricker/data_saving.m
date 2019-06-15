%%% data saving 

STFALL.t = t;
STFALL.stfmat = stfmat;

STFALL.f = f;
STFALL.sffmat = sffmat;

ofilename = strcat(opath, '/STFALL.mat');
STFALL.ofilename=ofilename;
eval(['save ', ofilename,' STFALL']);