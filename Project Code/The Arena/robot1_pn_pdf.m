function [png] = robot1_pn_pdf()

png.PN_name = 'Model of the first robot';
png.set_of_Ps = {'pCannon','pBrush','pWheels1','pRobot1' };
png.set_of_Ts={'tpRobot1_pCannon','tpRobot1_pBrush','tpRobot1_pWheels1'};
png.set_of_As={'pRobot1','tpRobot1_pCannon',1,'tpRobot1_pCannon','pCannon',1,'pRobot1','tpRobot1_pBrush',1,'tpRobot1_pBrush','pBrush',1,'pRobot1','tpRobot1_pWheels1',1,'tpRobot1_pWheels1','pWheels1',1};
end

