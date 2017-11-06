close all; clear all; clc;
global global_info;
global_info.STOP_AT = 15;
global_info.token='';

pns = pnstruct('arena_pn_pdf');

dynamic.m0 = {'pStartRobot2', 1,'pmCylinder1',1,'pmCylinder2',1,'pmCylinder3',1,'pyCylinder1',1,'pyCylinder2',1}; % # of tokens initially
dynamic.ft = {'allothers',1};
dynamic.ip = {'tpy1_pyRamp',1,'tpyRamp_py2',1,'tpy2_pyTower',1,'tmCylinder1',2,'tmCylinder2',2,'tmCylinder3',2,'tyCylinder1',2,'tyCylinder2',2,'tslot2_1',2,'tslot2_2',2,'tslot2_3',2,'tpmc3_pslot2',1};
pni = initialdynamics(pns, dynamic);

sim = gpensim(pni);

figure(4)
plotp(sim,{'pmc1', 'pmc2', 'pmc3','pyc1', 'pyc2','pslot2'})
figure(5)
plotp(sim, {'py1','pyRamp','py2', 'pyBasket','pmc1', 'pmc2', 'pmc3', 'pyTower', 'pyc1', 'pyc2', 'pc2Tower','pslot2', 'pslot4', 'pslot5', 'psba2', 'psba4', 'pbba2'})
global_info.token
%plotp(sim, {'py1','pWheels','pRobot1','pCannon','pBrush'})
figure(1)
plotp(sim,{'pmCylinder1','pmCylinder2','pmCylinder3','pyCylinder1','pyCylinder2'})
figure(2)
plotp(sim,{'pslot2_1','pslot2_2','pslot2_3'})
prnfinalcolors(sim)
prnss(sim);

%prnss(sim)