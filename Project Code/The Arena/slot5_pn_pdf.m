function [png] = slot5_pn_pdf()
png.PN_name = 'Model of the slot5';
png.set_of_Ps = {'pslot5_1','pslot5_2','pslot5_3'};
png.set_of_Ts={'tslot5_1','tslot5_2','tslot5_3'};
png.set_of_As={'pslot5','tslot5_1',1,'tslot5_1','pslot5_1',1,'tslot5_1','pslot5',1,'tslot5_1','pRobotOrder',1,...    
               'pslot5','tslot5_2',1,'tslot5_2','pslot5_2',1,'tslot5_2','pslot5',1,'tslot5_2','pRobotOrder',1,...
               'pslot5','tslot5_3',1,'tslot5_3','pslot5_3',1,'tslot5_3','pslot5',1,'tslot5_3','pRobotOrder',1};
png.set_of_Is={'pslot5_1','tslot5_1',1,...           
               'pslot5_2','tslot5_2',1,...
               'pslot5_3','tslot5_3',1};
end

