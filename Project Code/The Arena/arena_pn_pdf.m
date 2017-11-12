% @author: Sandra & JB %

function [png] = arena_pn_pdf()

png.PN_name = 'Model of the arena for the robots';
png.set_of_Ps = {'pStartRobot1','pStartRobot2','py1', 'pyRamp', 'py2', 'pyBasket', ... %<- starting area, yellow player
    'pmc1', 'pmc2', 'pmc3', 'pyTower', 'pyc1', 'pyc2', 'pc2Tower', ...
    'pslot2', 'pslot4', 'pslot5', 'psba2', 'psba4', 'pbba2', ...
    'pslot2_1', 'pslot2_2', 'pslot2_3', 'pRobotOrder', ...
    'pc2TowerCylinder','pyTowerCylinder',...
    'psba4Ore','psba2Ore','pbba2Ore',...
    'pmCylinder1','pmCylinder2','pmCylinder3','pyCylinder1','pyCylinder2'}; %<- arena places (yellow player's half)

place={'py1','pyRamp','py2', 'pyBasket','pmc1', 'pmc2', 'pmc3', 'pyTower', 'pyc1', 'pyc2', 'pc2Tower','pslot2', 'pslot4', 'pslot5', 'psba2', 'psba4', 'pbba2'};

matri=[    0      1       0           0      0       0       0          0       0       0           0        0         0         0        0        0        0;%py1
           1      0       1           0      0       0       0          0       0       0           0        0         0         0        0        0        0;%pyRamp
           0      1       0           0      0       0       0          1       0       0           0        0         0         0        0        0        0;%py2
           0      0       0           0      0       0       0          0       1       0           0        0         0         0        0        0        0;%pyBasket
           0      0       0           0      0       0       1          1       0       0           0        0         0         0        1        0        0;%pmc1
           0      0       0           0      0       0       1          0       0       0           1        1         0         0        1        0        0;%pmc2
           0      0       0           0      1       1       0          0       0       0           0        1         0         1        1        0        0;%pmc3
           0      0       0           0      1       0       0          0       0       0           0        0         1         0        0        0        0;%pyTower
           0      0       0           1      0       0       0          0       0       0           0        0         0         0        0        0        1;%pyc1
           0      0       0           0      0       0       0          0       0       0           0        0         0         0        0        1        1;%pyc2
           0      0       0           0      0       0       0          0       0       0           0        1         0         0        1        0        1;%pc2Tower
           0      0       0           0      0       1       1          0       0       0           1        0         0         0        1        0        0;%pslot2
           0      0       0           0      0       0       0          1       0       0           0        0         0         1        0        0        1;%pslot4
           0      0       0           0      0       0       1          0       0       0           0        0         1         0        0        1        0;%pslot5
           0      0       0           0      1       1       1          0       1       0           1        1         0         0        1        0        0;%psba2
           0      0       0           0      0       0       0          0       0       1           0        0         0         1        0        0        1;%psba4
           0      0       0           0      0       0       0          0       0       1           1        0         0         0        1        1        0];%pbba2
       


           
png.set_of_Ts={'tpRobotOrder_pRobot1','tpRobotOrder_pRobot2',...
               'tyTower','tc2Tower',...
               'tsba2','tsba4','tbba2',...
               'tStartRobot1','tStartRobot2','tslot2_1','tslot2_2','tslot2_3',...
               'tmCylinder1','tmCylinder2','tmCylinder3','tyCylinder1','tyCylinder2'};           

png.set_of_As={'pStartRobot1','tStartRobot1',1,'tStartRobot1','py1',1,...
               'pStartRobot2','tStartRobot2',1,'tStartRobot2','py2',1,...
               'pRobotOrder','tpRobotOrder_pRobot1',1,'tpRobotOrder_pRobot1','pRobot1',1,...
               'pRobotOrder','tpRobotOrder_pRobot2',1,'tpRobotOrder_pRobot2','pRobot2',1,...
               'pslot2','tslot2_1',1,'tslot2_1','pslot2_1',1,'tslot2_1','pslot2',1,'tslot2_1','pRobotOrder',1,...    
               'pslot2','tslot2_2',1,'tslot2_2','pslot2_2',1,'tslot2_2','pslot2',1,'tslot2_2','pRobotOrder',1,...
               'pslot2','tslot2_3',1,'tslot2_3','pslot2_3',1,'tslot2_3','pslot2',1,'tslot2_3','pRobotOrder',1,...
               'pmCylinder1','tmCylinder1',1,'pmc1','tmCylinder1',1,'tmCylinder1','pmc1',1,'tmCylinder1','pRobotOrder',1,...
               'pmCylinder2','tmCylinder2',1,'pmc2','tmCylinder2',1,'tmCylinder2','pmc3',1,'tmCylinder2','pRobotOrder',1,...
               'pmCylinder3','tmCylinder3',1,'pmc3','tmCylinder3',1,'tmCylinder3','pmc3',1,'tmCylinder3','pRobotOrder',1,...
               'pyCylinder1','tyCylinder1',1,'pyc1','tyCylinder1',1,'tyCylinder1','pyc1',1,'tyCylinder1','pRobotOrder',1,...
               'pyCylinder2','tyCylinder2',1,'pyc2','tyCylinder2',1,'tyCylinder2','pyc2',1,'tyCylinder2','pRobotOrder',1,...
               'pc2TowerCylinder','tyTower',1,'pyTower','tyTower',1,'tyTower','pyTower',1,'tyTower','pRobotOrder',1,...
               'pyTowerCylinder','tc2Tower',1,'pc2Tower','tc2Tower',1,'tc2Tower','pc2Tower',1,'tc2Tower','pRobotOrder',1,...
               'psba4Ore','tsba4',5,'psba4','tsba4',1,'tsba4','psba4',1,'tsba4','pRobotOrder',1,...
               'psba2Ore','tsba2',5,'psba2','tsba2',1,'tsba2','psba2',1,'tsba2','pRobotOrder',1,...
               'pbba2Ore','tbba2',5,'pbba2','tbba2',1,'tbba2','pbba2',1,'tbba2','pRobotOrder',1};
 
           
png.set_of_Is={'pslot2_1','tslot2_1',1,...           
               'pslot2_2','tslot2_2',1,...
               'pslot2_3','tslot2_3',1};

for i =1:length(place)
    for j=1:length(place)
        if(matri(i,j)>0)
            l=length(png.set_of_As);
            l2=length(png.set_of_Ts);
            l3=length(png.set_of_Is);
            transition1=strcat('t',place{i},'_',place{j},'_1');
            transition2=strcat('t',place{i},'_',place{j},'_2');
 
            png.set_of_Ts{1,(l2+1)}=transition1;
			png.set_of_As{1,(l+1)}=place{i};
            png.set_of_As{1,(l+2)}=transition1;
            png.set_of_As{1,(l+3)}=matri(i,j);
            png.set_of_As{1,(l+4)}=transition1;
            png.set_of_As{1,(l+5)}=place{j};
            png.set_of_As{1,(l+6)}=matri(i,j);
            png.set_of_As{1,(l+7)}=transition1;
            png.set_of_As{1,(l+8)}='pRobotOrder';
            png.set_of_As{1,(l+9)}=1;
            png.set_of_Is{1,(l3+1)}=place{j};
            png.set_of_Is{1,(l3+2)}=transition1;
            png.set_of_Is{1,(l3+3)}=1;

            png.set_of_Ts{1,(l2+2)}=transition2;
			png.set_of_As{1,(l+10)}=place{i};
            png.set_of_As{1,(l+11)}=transition2;
            png.set_of_As{1,(l+12)}=matri(i,j);
            png.set_of_As{1,(l+13)}=transition2;
            png.set_of_As{1,(l+14)}=place{j};
            png.set_of_As{1,(l+15)}=matri(i,j);
            png.set_of_As{1,(l+16)}=transition2;
            png.set_of_As{1,(l+17)}='pRobotOrder';
            png.set_of_As{1,(l+18)}=1;
            png.set_of_Is{1,(l3+4)}=place{j};
            png.set_of_Is{1,(l3+5)}=transition2;
            png.set_of_Is{1,(l3+6)}=1;
        end
    end
end


end