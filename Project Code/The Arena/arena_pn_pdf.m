% @author: Sandra & JB %

function [png] = arena_pn_pdf()

png.PN_name = 'Model of the arena for the robots';
png.set_of_Ps = {'py1', 'pyRamp', 'py2', 'pyBasket', ... %<- starting area, yellow player
    'pmc1', 'pmc2', 'pmc3', 'pyTower', 'pyc1', 'pyc2', 'pc2Tower', ...
    'pslot2', 'pslot4', 'pslot5', 'psba2', 'psba4', 'pbba2', ...
    'pslot2-1', 'pslot2-2', 'pslot2-3'}; %<- arena places (yellow player's half)

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


           
           
           
           
png.set_of_As={}
png.set_of_Ts={}
for i =1:length(place)
    for j=1:length(place)
        if(matri(i,j)>0)
            l=length(png.set_of_As)
            l2=length(png.set_of_Ts)
            transition=strcat('t',place{i},'-',place{j})
            png.set_of_Ts{1,(l2+1)}=transition
			png.set_of_As{1,(l+1)}=place{i}
            png.set_of_As{1,(l+2)}=transition
            png.set_of_As{1,(l+3)}=matri(i,j)
            png.set_of_As{1,(l+4)}=transition
            png.set_of_As{1,(l+5)}=place{j}
            png.set_of_As{1,(l+6)}=matri(i,j)
        end
    end
end

% png.set_of_Ts = {'ty1', 'ty2', ... %<- starting area, yellow player
%     'tyTower', 'tyTower-mc1', 'tyTower-slot4', ...
%     'tmc1-mc3', 'tmc1-sba2', ...
%     'tslot4-slot5', ...
%     'tslot5-sba4', 'tslot5-mc3', ...
%     'tsba4-bba2', 'tsba4-yc2', ...
%     'tbba2', 'tbba2-c2Tower', 'tbba2-yc2', 'tbba2-sba2', ...
%     'tyc2-mc2', ...
%     'tmc3-sba2', 'tmc3-mc2', 'tmc3-slot2', ...
%     'tsba2-slot4', 'tsba2-mc2', 'tsba2-yc1', 'tsba2-slot2', 'tsba2-c2Tower', ...
%     'tmc2-slot2', 'tmc2-c2Tower', ...
%     'tc2Tower', ...
%     'tslot2-c2Tower', 'tslot2-yc1', 'tslot2-1', 'tslot2-2', 'tslot2-3', ...
%     'tyc1-ybasket'};
% % WIP
% png.set_of_As = {'py1', 'ty1', 1, 'ty1', 'pyRamp', 1, 'pyRamp', 'ty2', 1 ...
%     'ty2', 'py2', 1, 'py2', 'tyTower', 1, ... % <-start area module
%     'tyTower', 'pyTower', 1, 'pyTower', 'tyTower-mc1', 1, 'pyTower', 'tyTower-slot4', 1, ...
%     'tyTower-mc1', 'pmc1', 1, ... 
%     'pmc1', 'tmc1-mc3', 1, 'pmc1', 'tmc1-sba2', 1, ...
%     'tyTower-slot4', 'pslot4', 1, ...
%     'pslot4', 'tslot4-slot5', 1, 'tslot4-slot5', 'pslot5', 1, ...
%     'pslot5', 'tslot5-sba4', 1, 'pslot5', 'tslot5-mc3', 1, ...
%     'tslot5-sba4', 'psba4', 1, 'psba4', 'tsba4-bba2', 1, 'psba4', 'tsba4-yc2', 1, ...
%     'tsba4-bba2', 'pbba2', 1, 'pbba2', 'tbba2', 1, 'pbba2', 'tbba2-c2Tower', 1, ...
%     'pbba2', 'tbba2-yc2', 1, 'pbba2', 'tbba2-sba2', 1, ...
%     'tyc2-mc2', 'pyc2', 1, ...
%     'tslot4-mc3', 'pmc3', 1, 'pmc3'
%     %<-arena module
%};