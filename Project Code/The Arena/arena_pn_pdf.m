% @author: Sandra & JB %

function [png] = arena_pn_pdf()

png.PN_name = 'Model of the arena for the robots';
png.set_of_Ps = {'py1', 'pyRamp', 'py2', 'pyBasket', ... %<- starting area, yellow player
    'pmc1', 'pmc2', 'pmc3', 'pyTower', 'pyc1', 'pyc2', 'pc2Tower', ...
    'pslot2', 'pslot4', 'pslot5', 'psba2', 'psba4', 'pbba2', ...
    'pslot2_1', 'pslot2_2', 'pslot2_3', 'pRobotOrder','pCannon','pBrush','pWheels','pRobot1'}; %<- arena places (yellow player's half)

place={'py1','pyRamp','py2', 'pyBasket','pmc1', 'pmc2', 'pmc3', 'pyTower', 'pyc1', 'pyc2', 'pc2Tower','pslot2', 'pslot4', 'pslot5', 'psba2', 'psba4', 'pbba2'}

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
           0      0       0           0      0       0       0          0       0       1           1        0         0         0        1        1        0]%pbba2


           
png.set_of_Ts={'tpRobotOrder_pRobot1','tpRobot1_pCannon','tpRobot1_pBrush','tpRobot1_pWheels','tslot2_1','tslot2_2','tslot2_3'}           
png.set_of_As={'pRobotOrder','tpRobotOrder_pRobot1',1,'tpRobotOrder_pRobot1','pRobot1',1,'pRobot1','tpRobot1_pCannon',1,'tpRobot1_pCannon','pCannon',1,'pRobot1','tpRobot1_pBrush',1,'tpRobot1_pBrush','pBrush',1,'pRobot1','tpRobot1_pWheels',1,'tpRobot1_pWheels','pWheels',1,...
               'pslot2','tslot2_1',1,'tslot2_1','pslot2_1',1,'tslot2_1','pslot2',1,...    
               'pslot2','tslot2_2',1,'tslot2_2','pslot2_2',1,'tslot2_2','pslot2',1,...
               'pslot2','tslot2_3',1,'tslot2_3','pslot2_3',1,'tslot2_3','pslot2',1}

for i =1:length(place)
    for j=1:length(place)
        if(matri(i,j)>0)
            l=length(png.set_of_As)
            l2=length(png.set_of_Ts)
            transition=strcat('t',place{i},'_',place{j})
            png.set_of_Ts{1,(l2+1)}=transition
			png.set_of_As{1,(l+1)}=place{i}
            png.set_of_As{1,(l+2)}=transition
            png.set_of_As{1,(l+3)}=matri(i,j)
            png.set_of_As{1,(l+4)}=transition
            png.set_of_As{1,(l+5)}=place{j}
            png.set_of_As{1,(l+6)}=matri(i,j)
            png.set_of_As{1,(l+7)}=transition
            png.set_of_As{1,(l+8)}='pRobotOrder'
            png.set_of_As{1,(l+9)}=1
        end
    end
end


end