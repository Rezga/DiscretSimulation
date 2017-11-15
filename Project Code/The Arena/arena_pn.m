close all; clear all; clc;

global global_info;
global_info.STOP_AT = 30;

pns = pnstruct({'arena_pn_pdf','robot1_pn_pdf','robot2_pn_pdf'});

dynamic.m0 = {'pStartRobot1',1,'pStartRobot2',1,...
              'pc2TowerCylinder',4,'pyTowerCylinder',4,...
              'psba4Ore',5,'psba2Ore',5,'pbba2Ore',20,...
              'pmCylinder1',1,'pmCylinder2',1,'pmCylinder3',1,'pyCylinder1',1,'pyCylinder2',1}; % # of tokens initially

dynamic.re = {'robot1',1, inf,'robot2',1,inf}; % resource as semafor
         
dynamic.ft = {'tpRobot1_pBrush',1,'tpRobot1_pCannon',1,'tpRobot1_pWheels1',2,...
              'tpRobot2_pWheels2',2,'tpThongs_plThongClose',4,'tpThongs_prThongClose',4,...
              'tpThongs_plThongOpen',6,'tpThongs_prThongOpen',6,...
              'allothers',0.1};
dynamic.ip = {'tpy1_pyRamp_2',1,'tpyRamp_py2_2',1,'tpy2_pyTower_2',1,'tmCylinder1',2,'tmCylinder2',2,'tmCylinder3',2,'tyCylinder1',2,'tyCylinder2',2,'tslot2_1',2,'tslot2_2',2,'tslot2_3',2,'tpmc3_pslot2_2',1,...
              'tpRobot2_pWheels2',20,'tpThongs_plThongClose',20,'tpThongs_prThongClose',20,...
              'tpThongs_plThongOpen',20,'tpThongs_prThongOpen',20,'tpRobotOrder_pRobot2',10,...
              'tpRobot1_pBrush',20,'tpRobot1_pCannon',20,'tpRobot1_pWheels1',20,'tpRobotOrder_pRobot1',10,...
              'tpy1_pyRamp_1',1,'tpyRamp_py2_1',1,'tpy2_pyTower_1',1,'tpyTower_pmc1_1',1,'tpmc1_psba2_1',1,'tsba2',2,'tpsba2_pyc1_1',1,'tpyc1_pyBasket_1',1,'tyBasket',2};

pni = initialdynamics(pns, dynamic);

sim = gpensim(pni);

figure(4)
plotp(sim,{'pmc1', 'pmc2', 'pmc3','pyc1', 'pyc2','pslot2'})
figure(5)
plotp(sim, {'py1','pyRamp','py2', 'pyBasket','pmc1', 'pmc2', 'pmc3', 'pyTower', 'pyc1', 'pyc2', 'pc2Tower','pslot2', 'pslot4', 'pslot5', 'psba2', 'psba4', 'pbba2'})
%plotp(sim,{'py1','pyRamp','py2','pyTower','pmc1','psba2','pyc1','pyBasket'})
%plotp(sim, {'py1','pWheels','pRobot1','pCannon','pBrush'})
figure(1)
plotp(sim,{'pmCylinder1','pmCylinder2','pmCylinder3','pyCylinder1','pyCylinder2','pc2TowerCylinder','pyTowerCylinder'})
figure(2)
plotp(sim,{'pslot2_1','pslot2_2','pslot2_3'})
prnfinalcolors(sim)
prnss(sim);
