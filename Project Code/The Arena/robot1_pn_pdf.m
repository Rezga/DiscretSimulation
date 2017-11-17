function [png] = robot1_pn_pdf()

png.PN_name = 'Model of the first robot';
png.set_of_Ps = {'pCannon','pBrush','pWheels1','pFunnyAction','pRobot1','pGoto1','pReady1','pCaptor1'};
png.set_of_Ts={'tpRobot1_pCannon','tpRobot1_pBrush','tpRobot1_pWheels1','tGoto1','tMoving1','tReStart1','tStop1','tCaptor1','tFinish1','tQuit1'};
png.set_of_As={'pRobot1','tpRobot1_pCannon',1,'tpRobot1_pCannon','pCannon',1,'pRobot1','tpRobot1_pBrush',1,'tpRobot1_pBrush','pBrush',1,'pRobot1','tpRobot1_pWheels1',1,'tpRobot1_pWheels1','pWheels1',1,...
               'pWheels1','tGoto1',1,'tGoto1','pGoto1',1,...
               'pGoto1','tMoving1',1,'pReady1','tMoving1',1,'tMoving1','pGoto1',1,'tMoving1','pReady1',1,...
               'pGoto1','tFinish1',1,...
               'tCaptor1','pCaptor1',1,...
               'pCaptor1','tReStart1',1,'tReStart1','pReady1',1,...
               'pReady1','tStop1',1,'pCaptor1','tStop1',1,...
               'tQuit1','pFunnyAction',1,'pReady1','tQuit1',1};
end

