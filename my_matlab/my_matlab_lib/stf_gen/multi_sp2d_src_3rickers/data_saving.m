%%% data saving 

STFALL.t = t;
STFALL.stfrickermat = stfrickermat;

STFALL.f = f;
STFALL.sffrickermat = sffrickermat;

ofilename = strcat(opath, '/STFALL.mat');
STFALL.ofilename=ofilename;
eval(['save ', ofilename,' STFALL']);