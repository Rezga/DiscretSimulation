function [png] = slot4_pn_pdf()
png.PN_name = 'Model of the slot4';
png.set_of_Ps = {'pslot4_1', 'pslot4_2', 'pslot4_3'};
png.set_of_Ts={'tslot4_1','tslot4_2','tslot4_3'};
png.set_of_As={'pslot4','tslot4_1',1,'tslot4_1','pslot4_1',1,'tslot4_1','pslot4',1,'tslot4_1','pRobotOrder',1,...    
               'pslot4','tslot4_2',1,'tslot4_2','pslot4_2',1,'tslot4_2','pslot4',1,'tslot4_2','pRobotOrder',1,...
               'pslot4','tslot4_3',1,'tslot4_3','pslot4_3',1,'tslot4_3','pslot4',1,'tslot4_3','pRobotOrder',1};
png.set_of_Is={'pslot4_1','tslot4_1',1,...           
               'pslot4_2','tslot4_2',1,...
               'pslot4_3','tslot4_3',1};
end

