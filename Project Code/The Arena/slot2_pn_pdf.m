function [png] = slot2_pn_pdf()
png.PN_name = 'Model of the slot2';
png.set_of_Ps = {'pslot2_1', 'pslot2_2', 'pslot2_3'};
png.set_of_Ts={'tslot2_1','tslot2_2','tslot2_3'};
png.set_of_As={'pslot2','tslot2_1',1,'tslot2_1','pslot2_1',1,'tslot2_1','pslot2',1,'tslot2_1','pRobotOrder',1,...    
               'pslot2','tslot2_2',1,'tslot2_2','pslot2_2',1,'tslot2_2','pslot2',1,'tslot2_2','pRobotOrder',1,...
               'pslot2','tslot2_3',1,'tslot2_3','pslot2_3',1,'tslot2_3','pslot2',1,'tslot2_3','pRobotOrder',1};
png.set_of_Is={'pslot2_1','tslot2_1',1,...           
               'pslot2_2','tslot2_2',1,...
               'pslot2_3','tslot2_3',1};
end

