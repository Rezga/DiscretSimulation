close all; clear all; clc;

global global_info;
global_info.STOP_AT = 20;
global_info.yTower=4;
global_info.mc1=1;
global_info.mc3=1;
global_info.mc2=1;
global_info.c2Tower=4;
global_info.yc2=1;
global_info.yc1=1;
global_info.bba2=1;
global_info.sba2=1;
global_info.sba4=1;


pns = pnstruct({'arena_pn_pdf','robot1_pn_pdf','robot2_pn_pdf','slot2_pn_pdf','slot4_pn_pdf','slot5_pn_pdf'});

dynamic.m0 = {'pStartRobot1',0,'pStartRobot2',1,...
              'pReady1',1,'pReady2',1,...
              'pc2TowerCylinder',4,'pyTowerCylinder',4,...
              'psba4Ore',5,'psba2Ore',5,'pbba2Ore',20,...
              'pmCylinder1',1,'pmCylinder2',1,'pmCylinder3',1,'pyCylinder1',1,'pyCylinder2',1}; % # of tokens initially

dynamic.re = {'robot1',1, inf,'robot2',1,inf}; % resource as semafor
         
dynamic.ft = {'tpRobot1_pBrush',6,'tpRobot1_pCannon',20,'tMoving1',3,...
              'tMoving2',3,'tpThongs_plThongClose',6,'tpThongs_prThongClose',6,...
              'tpThongs_plThongOpen',8,'tpThongs_prThongOpen',8,...
              'allothers',0.1};

dynamic.ip = {'tpRobot2_pWheels2',20,'tpThongs_plThongClose',20,'tpThongs_prThongClose',20,...
              'tpThongs_plThongOpen',20,'tpThongs_prThongOpen',20,'tpRobotOrder_pRobot2',20,'tpRobot2_pThongs',20,...
              'tGoto2',20,'tMoving2',25,'tReStart2',20,'tStop2',30,'tCaptor2',30,'tFinish2',20,...
              'tpRobot1_pBrush',20,'tpRobot1_pCannon',20,'tpRobot1_pWheels1',20,'tpRobotOrder_pRobot1',20,...
              'tGoto1',20,'tMoving1',25,'tReStart1',20,'tStop1',30,'tCaptor1',30,'tFinish1',20,...
              'tyBasket',10,'tsba2',10,'tbba2',10,'tsba4',10,...
              'tmCylinder1',10,'tmCylinder2',10,'tmCylinder3',10,'tyCylinder1',10,'tyCylinder2',10,...
              'tc2Tower',10,...
              'tslot2_1',10,'tslot2_2',10,'tslot2_3',10,'tslot4_1',10,'tslot4_2',10,'tslot4_3',10,'tslot5_1',10,'tslot5_2',10,'tslot5_3',10,...       
              'tpy1_pyRamp_1', 1,'tpyRamp_py2_1', 1,'tpy2_pyTower_1', 1,'tpmc1_psba2_1', 3,'tpmc3_psba2_1', 3,'tpslot4_psba2_1', 3,'tpmc2_psba2_1', 3,'tpc2Tower_psba2_1', 3,'tpslot2_psba2_1', 3,'tpyc1_psba2_1', 3,'tpsba4_pbba2_1', 4,'tpyc2_pbba2_1', 4,'tpc2Tower_pbba2_1', 4,'tpsba2_pbba2_1', 4,'tpslot5_psba4_1', 3,'tpyc2_psba4_1', 3,...       
              'tpy1_pyRamp_2', 1,'tpyRamp_py2_2',1, 'tpy2_pyTower_2', 9,'tpyTower_pmc1_2', 3,'tpsba2_pmc1_2', 3,'tpmc3_pmc1_2', 3,'tpmc1_pmc3_2', 3,'tpslot5_pmc3_2', 3,'tpsba2_pmc3_2', 3,'tpmc2_pmc3_2', 3,'tpslot2_pmc3_2', 3,'tpmc3_pmc2_2', 3,'tpsba2_pmc2_2', 3,'tpslot2_pmc2_2', 3,'tpc2Tower_pmc2_2', 3,'tpmc2_pc2Tower_2', 3,'tpbba2_pc2Tower_2', 3,'tpslot2_pc2Tower_2', 3,'tpsba2_pc2Tower_2', 3,'tpsba4_pyc2_2', 4,'tpbba2_pyc2_2', 4,'tpsba2_pyc1_2', 4,'tpyBasket_pyc1_2', 4}; %,'tpslot4_pyTower_2', 4,'tpmc1_pyTower_2', 4,


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
plotp(sim,{'pslot2_1','pslot2_2','pslot2_3','pslot4_1','pslot4_2','pslot4_3','pslot5_1','pslot5_2','pslot5_3'})
prnfinalcolors(sim);
prnss(sim);
